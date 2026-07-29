#ifndef ELEVATOR_DISPATCH_H
#define ELEVATOR_DISPATCH_H

#include "../Service/STD_Types.h"

#define TOTAL_FLOORS 4u

#define CALL_TYPE_CAR      1u
#define CALL_TYPE_FLOOR    0u

typedef enum {
    DIR_STOP = 0,
    DIR_UP,
    DIR_DOWN
} ElevatorDirection_t;

typedef enum {
    STATE_IDLE = 0,
    STATE_MOVING,
    STATE_DOOR_OPENING,
    STATE_DOOR_OPEN,
    STATE_DOOR_CLOSING,
    STATE_EMERGENCY
} ElevatorState_t;

void Dispatch_Init(void);
void Dispatch_Update(void);
void Call_Register(uint8_t floor, uint8_t type);
void Call_Clear(uint8_t floor);
uint8_t Dispatch_GetNextFloor(void);

void Elevator_Dispatch_Init(void);
void Elevator_AddCall(u8 floor, u8 is_car_call);
void Elevator_ClearCall(u8 floor);
u8 Elevator_CalculateNextFloor(u8 current_floor, ElevatorDirection_t *current_dir);

#endif