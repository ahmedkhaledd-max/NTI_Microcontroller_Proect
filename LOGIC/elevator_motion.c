#include <stdint.h>
#include "../Service/STD_Types.h"
#include "../MCL/ADC/adc_interface.h"
#include "elevator_io.h"
#include "elevator_motion.h"

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
    uint16_h adcHoistVal = 0u;
    uint16_h adcDoorVal  = 0u;

    if (ADC_ReadChannelBlocking(ADC_CAR_POSITION_CH, &adcHoistVal) == E_OK)
    {
        /* Process Hoist Position */
    }

    if (ADC_ReadChannelBlocking(ADC_DOOR_POSITION_CH, &adcDoorVal) == E_OK)
    {
        g_doorPosition = adcDoorVal;
    }
}

void Motion_GoToFloor(uint8_h floor)
{
    if (floor < MOTION_FLOORS)
    {
        g_motionState = MOTION_MOVING_UP;
    }
}

void Motion_Stop(void)
{
    g_motionState = MOTION_STOPPED;
}

void Door_Open(void)
{
    g_doorState = DOOR_OPENING;
}

void Door_Close(void)
{
    g_doorState = DOOR_CLOSING;
}

/* --- دوال الـ Wrapper لتوافق الاستدعاء مع main.c --- */
void Elevator_Motion_Init(void) { Motion_Init(); }
uint8_h Elevator_GetCurPosition(void) { return 0u; }
void Elevator_OpenDoor(void) { Door_Open(); }
void Elevator_CloseDoor(void) { Door_Close(); }
void Elevator_StopMotion(void) { Motion_Stop(); }
void Elevator_MoveToFloor(uint8_h floor) { Motion_GoToFloor(floor); }
