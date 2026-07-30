#ifndef ELEVATOR_DISPATCH_H
#define ELEVATOR_DISPATCH_H

#include "../Service/STD_Types.h"

/*----------------------------------------------------------
 * Configuration
 *---------------------------------------------------------*/
#define TOTAL_FLOORS           4u
#define FLOOR_MASK             ((1u << TOTAL_FLOORS) - 1u)

/*----------------------------------------------------------
 * Call Types
 *---------------------------------------------------------*/
#define CALL_TYPE_CAR          0u
#define CALL_TYPE_HALL_UP      1u
#define CALL_TYPE_HALL_DOWN    2u

/*----------------------------------------------------------
 * Elevator Direction
 *---------------------------------------------------------*/
typedef enum
{
    DIR_STOP = 0,
    DIR_UP,
    DIR_DOWN

} ElevatorDirection_t;

/*----------------------------------------------------------
 * Elevator State
 *---------------------------------------------------------*/
typedef enum
{
    STATE_IDLE = 0,
    STATE_MOVING,
    STATE_DOOR_OPENING,
    STATE_DOOR_OPEN,
    STATE_DOOR_CLOSING,
    STATE_EMERGENCY

} ElevatorState_t;

/*----------------------------------------------------------
 * Calls Structure
 *---------------------------------------------------------*/
typedef struct
{
    u8 carCall;
    u8 hallUp;
    u8 hallDown;

} Calls_t;

/*----------------------------------------------------------
 * Dispatch Core
 *---------------------------------------------------------*/
void Dispatch_Init(void);
void Dispatch_Update(void);

void Call_Register(u8 floor, u8 type);
void Call_Clear(u8 floor);

u8 Dispatch_GetNextFloor(void);

/*----------------------------------------------------------
 * LOOK Algorithm
 *---------------------------------------------------------*/
ElevatorDirection_t DSP_NextDirection(
                    const Calls_t *calls,
                    u8 currentFloor,
                    ElevatorDirection_t currentDirection);

/*----------------------------------------------------------
 * Elevator Interface
 *---------------------------------------------------------*/
void Elevator_Dispatch_Init(void);

void Elevator_AddCall(u8 floor, u8 type);

void Elevator_ClearCall(u8 floor);

u8 Elevator_CalculateNextFloor(
        u8 currentFloor,
        ElevatorDirection_t *direction);

#endif