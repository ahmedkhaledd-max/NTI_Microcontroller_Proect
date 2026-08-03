#include "elevator_system.h"
#include "elevator_dispatch.h"
#include "elevator_safety.h"
#include "elevator_io.h"
#include "elevator_motion.h"

static uint8_h system_fault_counter = 0u;
static u8 target_floor = 0u;
static u8 is_moving = 0u;

void System_Init(void)
{
    Dispatch_Init();
    Safety_Init();
    Motion_Init();
    system_fault_counter = 0u;
    target_floor = Elevator_GetCurPosition();
    is_moving = 0u;
}

void System_Update(void)
{
    u8 current_floor = Elevator_GetCurPosition();

    /* 1. تحديث مدخلات الأزرار والحساسات */
    IO_Update();

    /* 2. تسجيل الطابق المطلوب عند ضغط أي زر من أزرار الـ Hoist */
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_G) || IO_GetButtonEvent(IO_BTN_HALL_UP_G))
    {
        target_floor = 0u;
        is_moving = 1u;
    }
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_1) || IO_GetButtonEvent(IO_BTN_HALL_UP_1) || IO_GetButtonEvent(IO_BTN_HALL_DOWN_1))
    {
        target_floor = 1u;
        is_moving = 1u;
    }
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_2) || IO_GetButtonEvent(IO_BTN_HALL_UP_2) || IO_GetButtonEvent(IO_BTN_HALL_DOWN_2))
    {
        target_floor = 2u;
        is_moving = 1u;
    }
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_3) || IO_GetButtonEvent(IO_BTN_HALL_DOWN_3))
    {
        target_floor = 3u;
        is_moving = 1u;
    }

    /* 3. إدارة حركة الـ Hoist Motor بناءً على المقارنة المستمرة بين الحالي والهدف */
    if (is_moving && (current_floor != target_floor))
    {
        if (target_floor > current_floor)
        {
            /* صعود: دوران يمين */
            (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_HIGH);
            (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_HIGH);
            (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_LOW);
        }
        else if (target_floor < current_floor)
        {
            /* نزول: دوران شمال */
            (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_HIGH);
            (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_HIGH);
        }
    }
    else
    {
        /* الوصول للطابق أو التوقف */
        is_moving = 0u;
        (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_LOW);
    }

    /* 4. التحكم المباشر في موتور الباب (Door Motor) */
    if (GPIO_GetPinStatus(GPIO_PORTB, GPIO_PIN7) == PIN_LOW) /* Door Safety Edge */
    {
        (void)GPIO_SetPinValue(L298_PORT, DOOR_IN3_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(L298_PORT, DOOR_IN4_PIN, PIN_LOW);
    }
    else if (IO_GetButtonEvent(IO_BTN_DOOR_OPEN))
    {
        Elevator_OpenDoor();
    }
    else if (IO_GetButtonEvent(IO_BTN_DOOR_CLOSE))
    {
        Elevator_CloseDoor();
    }

    /* 5. الإنذارات وتوقف الطوارئ */
    if (GPIO_GetPinStatus(GPIO_PORTB, GPIO_PIN6) == PIN_LOW) /* Emergency Alarm */
    {
        (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_HIGH);
    }
    else
    {
        (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_LOW);
    }

    if (GPIO_GetPinStatus(GPIO_PORTC, GPIO_PIN5) == PIN_LOW) /* Emergency Stop */
    {
        is_moving = 0u;
        Elevator_StopMotion();
        (void)GPIO_SetPinValue(L298_PORT, DOOR_IN3_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(L298_PORT, DOOR_IN4_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_LOW);
    }

    Motion_Update();
}

void LogFault(uint8_h fault)
{
    if (fault != 0u) {
        system_fault_counter++;
        Fault_Set(fault);
    }
}
