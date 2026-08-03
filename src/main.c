#include "../Service/STD_Types.h"
#include "elevator_system.h"
#include "elevator_dispatch.h"
#include "elevator_motion.h"
#include "elevator_safety.h"
#include "elevator_io.h"

/* ============================================================================
 * Internal Macros & Timeouts
 * ============================================================================ */
#define DOOR_OPEN_DURATION_CYCLES    300u  /* زمن بقاء الباب مفتوحاً */

/* ============================================================================
 * Helper Functions
 * ============================================================================ */

/* مسح وإعادة رسم الشاشة بناءً على الحالة الحالية */
static void Update_LCD_Display(ElevatorState_t state, u8 current_floor)
{
    /* تحديث السيريال ببيانات موقع الطابق */
    Elevator_SendTelemetry();

    if (state == STATE_EMERGENCY)
    {
        LCD_ShowFault();
    }
    else
    {
        LCD_ShowStatus();
    }
}

/* قراءة الأزرار وتسجيل الطلبات في خوارزمية الـ Dispatch */
static void Process_Button_Inputs(void)
{
    /* 1. أزرار الكابينة (Car Calls) */
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_G)) { Elevator_AddCall(0u, CALL_TYPE_CAR); }
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_1)) { Elevator_AddCall(1u, CALL_TYPE_CAR); }
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_2)) { Elevator_AddCall(2u, CALL_TYPE_CAR); }
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_3)) { Elevator_AddCall(3u, CALL_TYPE_CAR); }

    /* 2. أزرار الأدوار الخارجية - صعود (Hall Up) */
    if (IO_GetButtonEvent(IO_BTN_HALL_UP_G)) { Elevator_AddCall(0u, CALL_TYPE_HALL_UP); }
    if (IO_GetButtonEvent(IO_BTN_HALL_UP_1)) { Elevator_AddCall(1u, CALL_TYPE_HALL_UP); }
    if (IO_GetButtonEvent(IO_BTN_HALL_UP_2)) { Elevator_AddCall(2u, CALL_TYPE_HALL_UP); }

    /* 3. أزرار الأدوار الخارجية - نزول (Hall Down) */
    if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_1)) { Elevator_AddCall(1u, CALL_TYPE_HALL_DOWN); }
    if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_2)) { Elevator_AddCall(2u, CALL_TYPE_HALL_DOWN); }
    if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_3)) { Elevator_AddCall(3u, CALL_TYPE_HALL_DOWN); }
}

/* ============================================================================
 * Main Function
 * ============================================================================ */
int main(void)
{
    /* 1. تهيئة كافة الوحدات (Initialization) */
    IO_Init();
    Elevator_Motion_Init();
    Elevator_Safety_Init();
    Elevator_Dispatch_Init();
    System_Init();

    /* المتغيرات المحلية لآلة الحالات */
    ElevatorState_t current_state = STATE_IDLE;
    ElevatorDirection_t current_dir = DIR_STOP;
    u8 current_floor = 0u;
    u8 target_floor = 0u;
    u16 door_timer = 0u;
    FaultType_t active_fault = FAULT_NONE;

    /* إظهار الشاشة الابتدائية */
    LCD_ShowStatus();

    /* 2. الحلقة الرئيسية (Super Loop) */
    while (1)
    {
        /* أ) تحديث قراءات المدخلات والحساسات */
        IO_Update();
        System_Update();
        Motion_Update();

        current_floor = Elevator_GetCurPosition();

        /* ب) فحص الأعطال والسلامة (Safety Check) */
        active_fault = Elevator_CheckFaults();

        if (active_fault != FAULT_NONE)
        {
            /* عند وجود خطأ جديد، قم بإيقاف المحركات والدخول في حالة الطوارئ */
            if (current_state != STATE_EMERGENCY)
            {
                Elevator_StopMotion();
                Elevator_LogFault(active_fault);
                (void)GPIO_SetPinValue(LED_OVERLOAD_PORT, LED_OVERLOAD_PIN, PIN_HIGH);
                current_state = STATE_EMERGENCY;
            }
        }

        /* ج) معالجة الأزرار المسجلة */
        Process_Button_Inputs();

        /* د) آلة الحالات (Elevator State Machine) */
        switch (current_state)
        {
            case STATE_IDLE:
                /* إطفاء لمبة ومؤشرات الحركة */
                (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_LOW);
                (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_LOW);
                (void)GPIO_SetPinValue(LED_OVERLOAD_PORT, LED_OVERLOAD_PIN, PIN_LOW);

                /* حساب الهدف القادم من خوارزمية الـ LOOK */
                target_floor = Elevator_CalculateNextFloor(current_floor, &current_dir);

                /* إذا كان هناك طلب لطابق آخر */
                if (current_dir != DIR_STOP && target_floor != current_floor)
                {
                    Elevator_CloseDoor(); // التأكد من إغلاق الباب قبل الحركة
                    Elevator_MoveToFloor(target_floor);

                    /* تحديث إشارات الاتجاه (LEDs) */
                    if (current_dir == DIR_UP)
                    {
                        (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_HIGH);
                        (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_LOW);
                    }
                    else if (current_dir == DIR_DOWN)
                    {
                        (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_LOW);
                        (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_HIGH);
                    }

                    current_state = STATE_MOVING;
                }
                /* إذا كان الطلب في نفس الطابق الحالي وتم ضغط فتح الباب */
                else if (target_floor == current_floor && IO_GetButtonEvent(IO_BTN_DOOR_OPEN))
                {
                    Elevator_ClearCall(current_floor);
                    Elevator_OpenDoor();
                    door_timer = 0u;
                    current_state = STATE_DOOR_OPEN;
                }
                break;

            case STATE_MOVING:
                /* التحقق من الوصول إلى الطابق المطلوب */
                if (current_floor == target_floor)
                {
                    Elevator_StopMotion();
                    Elevator_ClearCall(current_floor); // إلغاء طلب هذا الطابق

                    /* إيقاف لمبات الاتجاه */
                    (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_LOW);
                    (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_LOW);

                    /* فتح الباب والانتقال لحالة الأبواب */
                    Elevator_OpenDoor();
                    door_timer = 0u;
                    current_state = STATE_DOOR_OPEN;
                }
                else
                {
                    /* الاستمرار في الحركة نحو الهدف */
                    Elevator_MoveToFloor(target_floor);
                }
                break;

            case STATE_DOOR_OPEN:
                door_timer++;

                /* إمكانية إغلاق الباب مبكراً بضغط زر Door Close أو انتهاء الوقت */
                if (IO_GetButtonEvent(IO_BTN_DOOR_CLOSE) || (door_timer >= DOOR_OPEN_DURATION_CYCLES))
                {
                    Elevator_CloseDoor();
                    door_timer = 0u;
                    current_state = STATE_IDLE;
                }
                /* إعادة فتح الباب عند ضغط زر Door Open */
                else if (IO_GetButtonEvent(IO_BTN_DOOR_OPEN))
                {
                    Elevator_OpenDoor();
                    door_timer = 0u;
                }
                break;

            case STATE_EMERGENCY:
                /* يظل في حالة التوقف حتى زوال السبب */
                Elevator_StopMotion();
                
                /* التحقق مما إذا كان الخلل قد زال */
                if (Elevator_CheckFaults() == FAULT_NONE)
                {
                    (void)GPIO_SetPinValue(LED_OVERLOAD_PORT, LED_OVERLOAD_PIN, PIN_LOW);
                    current_state = STATE_IDLE;
                }
                break;

            default:
                current_state = STATE_IDLE;
                break;
        }

        /* هـ) تحديث الشاشة والسيريال */
        Update_LCD_Display(current_state, current_floor);
    }

    return 0;
}