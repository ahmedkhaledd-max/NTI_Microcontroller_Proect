#include "elevator_system.h"
#include "elevator_dispatch.h"
#include "elevator_safety.h"
#include "elevator_io.h"
#include "elevator_motion.h"

static uint8_h system_fault_counter = 0u;

typedef enum {
    DIR_NEUTRAL = 0,
    DIR_FORCE_UP,
    DIR_FORCE_DOWN
} Motion_Direction_t;

static Motion_Direction_t forced_dir = DIR_NEUTRAL;
static u8 is_moving = 0u;

void System_Init(void)
{
    Dispatch_Init();
    Safety_Init();
    Motion_Init();
    system_fault_counter = 0u;
    forced_dir = DIR_NEUTRAL;
    is_moving = 0u;
}

void System_Update(void)
{
    u8 current_floor = Elevator_GetCurPosition();

    /* 1. تحديث مدخلات الأزرار */
    IO_Update();

    /* 2. فحص أزرار الصعود (Hall Up) -> دوران يمين + LED UP */
    if (IO_GetButtonEvent(IO_BTN_HALL_UP_G) || 
        IO_GetButtonEvent(IO_BTN_HALL_UP_1) || 
        IO_GetButtonEvent(IO_BTN_HALL_UP_2))
    {
        forced_dir = DIR_FORCE_UP;
        is_moving = 1u;
    }
    /* 3. فحص أزرار النزول (Hall Down) -> دوران شمال + LED DOWN */
    else if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_1) || 
             IO_GetButtonEvent(IO_BTN_HALL_DOWN_2) || 
             IO_GetButtonEvent(IO_BTN_HALL_DOWN_3))
    {
        forced_dir = DIR_FORCE_DOWN;
        is_moving = 1u;
    }
    /* 4. فحص أزرار الكابينة (Car Calls) */
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_G))
    {
        if (current_floor > 0u) { forced_dir = DIR_FORCE_DOWN; is_moving = 1u; }
    }
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_1))
    {
        if (current_floor < 1u) { forced_dir = DIR_FORCE_UP; is_moving = 1u; }
        else if (current_floor > 1u) { forced_dir = DIR_FORCE_DOWN; is_moving = 1u; }
    }
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_2))
    {
        if (current_floor < 2u) { forced_dir = DIR_FORCE_UP; is_moving = 1u; }
        else if (current_floor > 2u) { forced_dir = DIR_FORCE_DOWN; is_moving = 1u; }
    }
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_3))
    {
        if (current_floor < 3u) { forced_dir = DIR_FORCE_UP; is_moving = 1u; }
    }

    /* 5. تطبيق الحركة والإشارات بناءً على الاتجاه المحدد */
    if (is_moving != 0u)
    {
        if (forced_dir == DIR_FORCE_UP)
        {
            /* دوران يمين + تشغيل LED UP */
            (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_HIGH);
            (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_HIGH);
            (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_LOW);
        }
        else if (forced_dir == DIR_FORCE_DOWN)
        {
            /* دوران شمال + تشغيل LED DOWN */
            (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_HIGH);
            (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_HIGH);
        }
    }
    else
    {
        /* توقف الموتور وإطفاء الـ LEDs */
        (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_LOW);
    }

    /* 6. التحكم في موتور الباب (Door Motor) */
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

    /* 7. إنذار الطوارئ (Emergency Alarm) -> تشغيل الـ Buzzer و Overload LED معاً */
    if (GPIO_GetPinStatus(GPIO_PORTB, GPIO_PIN6) == PIN_LOW) 
    {
        (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_HIGH);
        (void)GPIO_SetPinValue(LED_OVERLOAD_PORT, LED_OVERLOAD_PIN, PIN_HIGH); /* تشغيل Overload LED */
    }
    else
    {
        (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(LED_OVERLOAD_PORT, LED_OVERLOAD_PIN, PIN_LOW);  /* إطفاء Overload LED */
    }

    /* 8. توقف الطوارئ (Emergency Stop) */
    if (GPIO_GetPinStatus(GPIO_PORTC, GPIO_PIN5) == PIN_LOW) 
    {
        is_moving = 0u;
        forced_dir = DIR_NEUTRAL;
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
