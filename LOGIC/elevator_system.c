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

typedef enum {
    DISPLAY_IDLE,
    DISPLAY_UP,
    DISPLAY_DOWN,
    DISPLAY_OVERLOAD
} Display_State_t;

static Motion_Direction_t forced_dir = DIR_NEUTRAL;
static u8 is_moving = 0u;
static u8 target_floor_num = 0u;
static Display_State_t last_display_state = DISPLAY_IDLE;

void System_Init(void)
{
    Dispatch_Init();
    Safety_Init();
    Motion_Init();
    system_fault_counter = 0u;
    forced_dir = DIR_NEUTRAL;
    is_moving = 0u;
    target_floor_num = 0u;
    
    /* تهيئة الشاشة وإظهار حالة الاستعداد */
    LCD_Init();
    LCD_Clear();
    LCD_SetCursor(0, 0);
    LCD_WriteString("Elevator Ready");
    last_display_state = DISPLAY_IDLE;
}

void System_Update(void)
{
    u8 current_floor = Elevator_GetCurPosition();

    /* 1. تحديث مدخلات الأزرار */
    IO_Update();

    /* 2. فحص أزرار الصعود (Hall Up) */
    if (IO_GetButtonEvent(IO_BTN_HALL_UP_G))
    {
        forced_dir = DIR_FORCE_UP; is_moving = 1u; target_floor_num = 0u;
    }
    else if (IO_GetButtonEvent(IO_BTN_HALL_UP_1))
    {
        forced_dir = DIR_FORCE_UP; is_moving = 1u; target_floor_num = 1u;
    }
    else if (IO_GetButtonEvent(IO_BTN_HALL_UP_2))
    {
        forced_dir = DIR_FORCE_UP; is_moving = 1u; target_floor_num = 2u;
    }
    /* 3. فحص أزرار النزول (Hall Down) */
    else if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_1))
    {
        forced_dir = DIR_FORCE_DOWN; is_moving = 1u; target_floor_num = 1u;
    }
    else if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_2))
    {
        forced_dir = DIR_FORCE_DOWN; is_moving = 1u; target_floor_num = 2u;
    }
    else if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_3))
    {
        forced_dir = DIR_FORCE_DOWN; is_moving = 1u; target_floor_num = 3u;
    }
    /* 4. فحص أزرار الكابينة (Car Calls) */
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_G))
    {
        target_floor_num = 0u;
        if (current_floor > 0u) { forced_dir = DIR_FORCE_DOWN; is_moving = 1u; }
    }
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_1))
    {
        target_floor_num = 1u;
        if (current_floor < 1u) { forced_dir = DIR_FORCE_UP; is_moving = 1u; }
        else if (current_floor > 1u) { forced_dir = DIR_FORCE_DOWN; is_moving = 1u; }
    }
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_2))
    {
        target_floor_num = 2u;
        if (current_floor < 2u) { forced_dir = DIR_FORCE_UP; is_moving = 1u; }
        else if (current_floor > 2u) { forced_dir = DIR_FORCE_DOWN; is_moving = 1u; }
    }
    else if (IO_GetButtonEvent(IO_BTN_CAR_CALL_3))
    {
        target_floor_num = 3u;
        if (current_floor < 3u) { forced_dir = DIR_FORCE_UP; is_moving = 1u; }
    }

    /* 5. التحكم بالإنذار والتحميل الزائد (أولوية قصوى) */
    if (GPIO_GetPinStatus(GPIO_PORTB, GPIO_PIN6) == PIN_LOW) 
    {
        (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_HIGH);
        (void)GPIO_SetPinValue(LED_OVERLOAD_PORT, LED_OVERLOAD_PIN, PIN_HIGH);
        
        if (last_display_state != DISPLAY_OVERLOAD)
        {
            LCD_Clear();
            LCD_SetCursor(0, 0);
            LCD_WriteString("!! WARNING !!");
            LCD_SetCursor(1, 0);
            LCD_WriteString("OVERLOADED!");
            last_display_state = DISPLAY_OVERLOAD;
        }
    }
    else
    {
        (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(LED_OVERLOAD_PORT, LED_OVERLOAD_PIN, PIN_LOW);

        /* 6. حركة الموتور والشاشة */
        if (is_moving != 0u)
        {
            if (forced_dir == DIR_FORCE_UP)
            {
                (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_HIGH);
                (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_LOW);
                (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_HIGH);
                (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_LOW);

                if (last_display_state != DISPLAY_UP)
                {
                    LCD_Clear();
                    LCD_SetCursor(0, 0);
                    LCD_WriteString("Going UP to:");
                    LCD_SetCursor(1, 0);
                    LCD_WriteString("Floor ");
                    LCD_WriteChar('0' + target_floor_num);
                    last_display_state = DISPLAY_UP;
                }
            }
            else if (forced_dir == DIR_FORCE_DOWN)
            {
                (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_LOW);
                (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_HIGH);
                (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_LOW);
                (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_HIGH);

                if (last_display_state != DISPLAY_DOWN)
                {
                    LCD_Clear();
                    LCD_SetCursor(0, 0);
                    LCD_WriteString("Going DOWN to:");
                    LCD_SetCursor(1, 0);
                    LCD_WriteString("Floor ");
                    LCD_WriteChar('0' + target_floor_num);
                    last_display_state = DISPLAY_DOWN;
                }
            }
        }
        else
        {
            (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(LED_UP_PORT, LED_UP_PIN, PIN_LOW);
            (void)GPIO_SetPinValue(LED_DOWN_PORT, LED_DOWN_PIN, PIN_LOW);

            if (last_display_state != DISPLAY_IDLE)
            {
                LCD_Clear();
                LCD_SetCursor(0, 0);
                LCD_WriteString("Elevator Idle");
                last_display_state = DISPLAY_IDLE;
            }
        }
    }

    /* 7. التحكم في موتور الباب (Door Motor) */
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
