#ifndef ELEVATOR_MOTION_H
#define ELEVATOR_MOTION_H

#include <stdint.h>
#include <stdbool.h>
#include "../Service/STD_Types.h"

#define MOTION_FLOORS               4u
#define MOTION_POSITION_MAX_CM    900u
#define MOTION_POSITION_STEP_CM   300u
#define MOTION_HOIST_SPEED_PERCENT 70u
#define MOTION_DOOR_SPEED_PERCENT  40u
#define MOTION_DOOR_RUNTIME_MS    200u

typedef enum
{
    MOTION_IDLE = 0,
    MOTION_MOVING_UP,
    MOTION_MOVING_DOWN,
    MOTION_DOOR_OPENING,
    MOTION_DOOR_CLOSING,
    MOTION_STOPPED
} Motion_State_t;

typedef enum
{
    DOOR_CLOSED = 0,
    DOOR_OPENED,
    DOOR_OPENING,
    DOOR_CLOSING
} Door_State_t;

void Motion_Init(void);
void Motion_Update(void);

void Motion_GoToFloor(uint8_t floor);
void Motion_Stop(void);

uint16_t Motion_GetPosition(void);
uint8_t Motion_GetFloor(void);

void Door_Open(void);
void Door_Close(void);

/* Legacy wrappers for existing project code */
void Elevator_Motion_Init(void);
u8 Elevator_GetCurPosition(void);
void Elevator_MoveToFloor(u8 target_floor);
void Elevator_OpenDoor(void);
void Elevator_CloseDoor(void);
void Elevator_StopMotion(void);

#endif /* ELEVATOR_MOTION_H */
