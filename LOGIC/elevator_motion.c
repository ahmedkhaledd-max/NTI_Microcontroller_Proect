#include <stdint.h>
#include "../Service/STD_Types.h"
#include "../MCL/GPIO/gpio_interface.h"
#include "../MCL/ADC/adc_interface.h"
#include "elevator_io.h"
#include "elevator_motion.h"

/* Small serial debug messages to help Proteus simulation troubleshooting */

static Motion_State_t g_motionState = MOTION_IDLE;
static Door_State_t   g_doorState   = DOOR_CLOSED;
static uint16_h       g_doorPosition = 0u;

void Motion_Init(void)
{
    g_motionState = MOTION_IDLE;
    g_doorState   = DOOR_CLOSED;
    g_doorPosition = 0u;
}

void Motion_Update(void)
{
    uint16_h adcDoorVal = 0u;

    /* قراءة موضع الباب من ADC3 */
    adcDoorVal = ADC_Read(ADC_DOOR_POSITION_CH);
    g_doorPosition = adcDoorVal;
}

void Motion_GoToFloor(uint8_h floor)
{
    uint8_h current_floor = Elevator_GetCurPosition();

    if (floor > current_floor)
    {
        g_motionState = MOTION_MOVING_UP;
        Serial_SendString("MOTION: Moving UP\r\n");
        /* تشغيل موتور الرفع للأعلى */
        (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_HIGH);
        (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_LOW);
    }
    else if (floor < current_floor)
    {
        g_motionState = MOTION_MOVING_DOWN;
        Serial_SendString("MOTION: Moving DOWN\r\n");
        /* تشغيل موتور الرفع للأسفل */
        (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_LOW);
        (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_HIGH);
    }
}

void Motion_Stop(void)
{
    g_motionState = MOTION_STOPPED;
    Serial_SendString("MOTION: Stopped\r\n");
    /* إيقاف موتور الرفع */
    (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_LOW);
    (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_LOW);
}

void Door_Open(void)
{
    g_doorState = DOOR_OPENING;
    Serial_SendString("DOOR: Opening\r\n");
    /* فتح الباب */
    (void)GPIO_SetPinValue(L298_PORT, DOOR_IN3_PIN, PIN_HIGH);
    (void)GPIO_SetPinValue(L298_PORT, DOOR_IN4_PIN, PIN_LOW);
}

void Door_Close(void)
{
    g_doorState = DOOR_CLOSING;
    Serial_SendString("DOOR: Closing\r\n");
    /* إغلاق الباب */
    (void)GPIO_SetPinValue(L298_PORT, DOOR_IN3_PIN, PIN_LOW);
    (void)GPIO_SetPinValue(L298_PORT, DOOR_IN4_PIN, PIN_HIGH);
}

/* --- دوال الـ Wrapper لتوافق الاستدعاء مع main.c --- */
void Elevator_Motion_Init(void) 
{ 
    Motion_Init(); 
}

uint8_h Elevator_GetCurPosition(void) 
{ 
    uint16_h adc_pos = ADC_Read(ADC_CAR_POSITION_CH);
    
    /* تحويل إشارة المقاومة المتغيرة لمستويات الأدوار */
    if (adc_pos < 250u)       return 0u;
    else if (adc_pos < 500u)  return 1u;
    else if (adc_pos < 750u)  return 2u;
    else                      return 3u;
}

void Elevator_OpenDoor(void)   { Door_Open(); }
void Elevator_CloseDoor(void)  { Door_Close(); }
void Elevator_StopMotion(void) { Motion_Stop(); }
void Elevator_MoveToFloor(uint8_h floor) { Motion_GoToFloor(floor); }