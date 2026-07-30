#ifndef ELEVATOR_MOTION_H
#define ELEVATOR_MOTION_H


#include <stdint.h>

#include "../Service/STD_Types.h"
#include "../MCL/ADC/adc_interface.h"

#define MOTION_FLOORS              4u
#define MOTION_POSITION_MAX_CM     900u
#define MOTION_POSITION_STEP_CM    300u

/* ربط قنوات الـ ADC بقنوات الـ Driver بدون تكرار */
#define ADC_CAR_POSITION_CH        ADC_CHANNEL0
#define ADC_DOOR_POSITION_CH       ADC_CHANNEL1

typedef enum {
    MOTION_IDLE = 0,
    MOTION_MOVING_UP,
    MOTION_MOVING_DOWN,
    MOTION_STOPPED,
    MOTION_EMERGENCY
} Motion_State_t;

typedef enum {
    DOOR_CLOSED = 0,

    DOOR_OPENING,

    DOOR_OPENED,

    DOOR_CLOSING
} Door_State_t;

/* الدوال الأساسية */
void Motion_Init(void);
void Motion_Update(void);
void Motion_GoToFloor(uint8_h floor);
void Motion_Stop(void);

void Door_Open(void);
void Door_Close(void);

/* دوال الربط التوافقي لـ main */
void Elevator_Motion_Init(void);
uint8_h Elevator_GetCurPosition(void);
void Elevator_OpenDoor(void);
void Elevator_CloseDoor(void);
void Elevator_StopMotion(void);
void Elevator_MoveToFloor(uint8_h floor);

#endif 