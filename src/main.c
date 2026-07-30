#include "../Service/STD_Types.h"
#include "../LOGIC/elevator_dispatch.h"
#include "../LOGIC/elevator_motion.h"
#include "../LOGIC/elevator_safety.h"
#include "elevator_io.h"
#define DOOR_OPEN_TIME      200u
#define DOOR_CLOSE_TIME     100u

/* دالة لقراءة جميع الأزرار والمفاتيح وإضافة الطلبات لنظام التوجيه */
static void Process_Inputs(void)
{
    /* 1. طلبات أدوار الكابينة (Car Calls) */
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_G)) { Elevator_AddCall(0u, CALL_TYPE_CAR); }
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_1)) { Elevator_AddCall(1u, CALL_TYPE_CAR); }
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_2)) { Elevator_AddCall(2u, CALL_TYPE_CAR); }
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_3)) { Elevator_AddCall(3u, CALL_TYPE_CAR); }

    /* 2. طلبات الأدوار الخارجية (Hall Calls - Up & Down) */
    if (IO_GetButtonEvent(IO_BTN_HALL_UP_G))   { Elevator_AddCall(0u, CALL_TYPE_HALL_UP); }
    if (IO_GetButtonEvent(IO_BTN_HALL_UP_1))   { Elevator_AddCall(1u, CALL_TYPE_HALL_UP); }
    if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_1)) { Elevator_AddCall(1u, CALL_TYPE_HALL_DOWN); }
    if (IO_GetButtonEvent(IO_BTN_HALL_UP_2))   { Elevator_AddCall(2u, CALL_TYPE_HALL_UP); }
    if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_2)) { Elevator_AddCall(2u, CALL_TYPE_HALL_DOWN); }
    if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_3)) { Elevator_AddCall(3u, CALL_TYPE_HALL_DOWN); }

    /* 3. أزرار التحكم بالباب من الداخل */
    if (IO_GetButtonEvent(IO_BTN_DOOR_OPEN))  { Elevator_OpenDoor(); }
    if (IO_GetButtonEvent(IO_BTN_DOOR_CLOSE)) { Elevator_CloseDoor(); }

    /* 4. زر جرس الطوارئ */
    if (IO_GetButtonEvent(IO_BTN_EMERG_ALARM)) { Gong_Play(3u); }
}

/* دالة لتحديث حالة لمبات البيان (LEDs) طبقاً لاتجاه المصعد */
static void Update_LEDs(ElevatorDirection_t dir, FaultType_t fault)
{
    if (fault != FAULT_NONE)
    {
        /* إضاءة لمبة الحمل الزائد/الخطأ في حالة وجود عطل */
        (void)GPIO_SetPinValue(GPIO_PORTC, LED_OVERLOAD_PIN, PIN_HIGH);
        (void)GPIO_SetPinValue(GPIO_PORTC, LED_UP_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(GPIO_PORTC, LED_DOWN_PIN, PIN_LOW);
    }
    else
    {
        (void)GPIO_SetPinValue(GPIO_PORTC, LED_OVERLOAD_PIN, PIN_LOW);

        if (dir == DIR_UP)
        {
            (void)GPIO_SetPinValue(GPIO_PORTC, LED_UP_PIN, PIN_HIGH);
            (void)GPIO_SetPinValue(GPIO_PORTC, LED_DOWN_PIN, PIN_LOW);
        }
        else if (dir == DIR_DOWN)
        {
            (void)GPIO_SetPinValue(GPIO_PORTC, LED_UP_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(GPIO_PORTC, LED_DOWN_PIN, PIN_HIGH);
        }
        else
        {
            (void)GPIO_SetPinValue(GPIO_PORTC, LED_UP_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(GPIO_PORTC, LED_DOWN_PIN, PIN_LOW);
        }
    }
}

int main(void)
{
    ElevatorState_t elevator_state = STATE_IDLE;
    ElevatorDirection_t direction = DIR_STOP;
    FaultType_t fault = FAULT_NONE;
    u8 current_floor = 0u;
    u8 target_floor = 0u;
    u16 door_timer = 0u;

    /* 1. تهيئة جميع الطبقات (Drivers, Logic, IO) */
    IO_Init();
    Elevator_Dispatch_Init();
    Elevator_Motion_Init();
    Elevator_Safety_Init();

    LCD_ShowStatus();

    current_floor = Elevator_GetCurPosition();
    target_floor = current_floor;

    while (1)
    {
        /* 2. تحديث قراءات المدخلات والحساسات باستمرار */
        IO_Update();
        Motion_Update();
        Process_Inputs();

        /* 3. فحص مفاتيح وأعطال الأمان */
        fault = Elevator_CheckFaults();
        if (fault != FAULT_NONE)
        {
            Elevator_LogFault(fault);
            Elevator_StopMotion();
            elevator_state = STATE_EMERGENCY;
            LCD_ShowFault();
            Gong_Play(3u); /* صوت إنذار للطوارئ */
            Update_LEDs(DIR_STOP, fault);
            Elevator_SendTelemetry();
            continue;
        }

        current_floor = Elevator_GetCurPosition();

        /* 4. State Machine للتحكم بالمصعد */
        switch (elevator_state)
        {
            case STATE_IDLE:
                target_floor = Elevator_CalculateNextFloor(current_floor, &direction);
                Update_LEDs(direction, FAULT_NONE);

                if (target_floor != current_floor)
                {
                    Elevator_MoveToFloor(target_floor);
                    elevator_state = STATE_MOVING;
                }
                break;

            case STATE_MOVING:
                Update_LEDs(direction, FAULT_NONE);
                if (current_floor == target_floor)
                {
                    Elevator_StopMotion();
                    Elevator_ClearCall(current_floor);
                    Gong_Play(1u); /* صوت وصول الدور */
                    Elevator_OpenDoor();
                    door_timer = 0u;
                    elevator_state = STATE_DOOR_OPEN;
                    direction = DIR_STOP;
                    Update_LEDs(direction, FAULT_NONE);
                }
                break;

            case STATE_DOOR_OPEN:
                if (door_timer >= DOOR_OPEN_TIME)
                {
                    Elevator_CloseDoor();
                    door_timer = 0u;
                    elevator_state = STATE_DOOR_CLOSING;
                }
                break;

            case STATE_DOOR_CLOSING:
                if (door_timer >= DOOR_CLOSE_TIME)
                {
                    elevator_state = STATE_IDLE;
                }
                break;

            case STATE_EMERGENCY:
                break;

            default:
                break;
        }

        if ((elevator_state == STATE_DOOR_OPEN) || (elevator_state == STATE_DOOR_CLOSING))
        {
            door_timer++;
        }

        Elevator_SendTelemetry();
    }

    return 0;
}