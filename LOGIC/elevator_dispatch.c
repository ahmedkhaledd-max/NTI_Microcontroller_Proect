#include "elevator_dispatch.h"

/*=========================================================
 * Global Variables
 *========================================================*/

static Calls_t g_calls;

static ElevatorDirection_t current_direction = DIR_STOP;

static u8 current_floor = 0u;

/*=========================================================
 * Internal Helpers
 *========================================================*/

static void Dispatch_BitSet(u8 floor, u8 *bitmap)
{
    if (floor < TOTAL_FLOORS)
    {
        *bitmap |= (1u << floor);
    }
}

static void Dispatch_BitClear(u8 floor, u8 *bitmap)
{
    if (floor < TOTAL_FLOORS)
    {
        *bitmap &= ~(1u << floor);
    }
}

/*=========================================================
 * LOOK Helpers
 *========================================================*/

static u8 callsAbove(const Calls_t *calls, u8 floor)
{
    u8 mask;

    mask = (u8)((0xFFu << (floor + 1u)) & FLOOR_MASK);

    return (u8)(
        (calls->carCall |
         calls->hallUp |
         calls->hallDown)
         & mask);
}

static u8 callsBelow(const Calls_t *calls, u8 floor)
{
    u8 mask;

    mask = (u8)((1u << floor) - 1u);

    return (u8)(
        (calls->carCall |
         calls->hallUp |
         calls->hallDown)
         & mask);
}

/*=========================================================
 * Initialization
 *========================================================*/

void Dispatch_Init(void)
{
    g_calls.carCall = 0u;
    g_calls.hallUp = 0u;
    g_calls.hallDown = 0u;

    current_floor = 0u;
    current_direction = DIR_STOP;
}

void Dispatch_Update(void)
{

}

/*=========================================================
 * Register New Call
 *========================================================*/

void Call_Register(u8 floor, u8 type)
{
    if (floor >= TOTAL_FLOORS)
    {
        return;
    }

    switch(type)
    {
        case CALL_TYPE_CAR:

            Dispatch_BitSet(floor,&g_calls.carCall);

            break;

        case CALL_TYPE_HALL_UP:

            Dispatch_BitSet(floor,&g_calls.hallUp);

            break;

        case CALL_TYPE_HALL_DOWN:

            Dispatch_BitSet(floor,&g_calls.hallDown);

            break;

        default:

            break;
    }
}

/*=========================================================
 * Clear Call
 *========================================================*/

void Call_Clear(u8 floor)
{
    if(floor >= TOTAL_FLOORS)
    {
        return;
    }

    Dispatch_BitClear(floor,&g_calls.carCall);
    Dispatch_BitClear(floor,&g_calls.hallUp);
    Dispatch_BitClear(floor,&g_calls.hallDown);
}
/*=========================================================
 * LOOK Stop Decision
 *========================================================*/

static u8 shouldStop(const Calls_t *calls,
                     u8 floor,
                     ElevatorDirection_t direction)
{
    /* Car Call always has priority */
    if (calls->carCall & (1u << floor))
    {
        return 1u;
    }

    /* Hall Up while moving UP */
    if ((direction == DIR_UP) &&
        (calls->hallUp & (1u << floor)))
    {
        return 1u;
    }

    /* Hall Down while moving DOWN */
    if ((direction == DIR_DOWN) &&
        (calls->hallDown & (1u << floor)))
    {
        return 1u;
    }

    /*
     * Opposite direction hall calls
     * Only stop if this is the last request
     * in the current travelling direction.
     */

    if ((direction == DIR_UP) &&
        (calls->hallDown & (1u << floor)) &&
        (!callsAbove(calls,floor)))
    {
        return 1u;
    }

    if ((direction == DIR_DOWN) &&
        (calls->hallUp & (1u << floor)) &&
        (!callsBelow(calls,floor)))
    {
        return 1u;
    }

    return 0u;
}


/*=========================================================
 * Decide Next Direction (LOOK Algorithm)
 *========================================================*/

ElevatorDirection_t DSP_NextDirection(
                        const Calls_t *calls,
                        u8 floor,
                        ElevatorDirection_t current)
{

    if(current == DIR_UP)
    {
        if(callsAbove(calls,floor))
        {
            return DIR_UP;
        }

        if(callsBelow(calls,floor))
        {
            return DIR_DOWN;
        }

        return DIR_STOP;
    }


    if(current == DIR_DOWN)
    {
        if(callsBelow(calls,floor))
        {
            return DIR_DOWN;
        }

        if(callsAbove(calls,floor))
        {
            return DIR_UP;
        }

        return DIR_STOP;
    }


    /* Elevator is idle */

    if(callsAbove(calls,floor))
    {
        return DIR_UP;
    }

    if(callsBelow(calls,floor))
    {
        return DIR_DOWN;
    }

    return DIR_STOP;
}
/*=========================================================
 * Get Next Target Floor (LOOK Algorithm)
 *========================================================*/

u8 Dispatch_GetNextFloor(void)
{
    u8 floor;

    current_direction = DSP_NextDirection(&g_calls,
                                          current_floor,
                                          current_direction);

    if(current_direction == DIR_UP)
    {
        for(floor = current_floor + 1u;
            floor < TOTAL_FLOORS;
            floor++)
        {
            if(shouldStop(&g_calls, floor, DIR_UP))
            {
                return floor;
            }
        }
    }

    else if(current_direction == DIR_DOWN)
    {
        floor = current_floor;

        while(floor > 0u)
        {
            floor--;

            if(shouldStop(&g_calls, floor, DIR_DOWN))
            {
                return floor;
            }
        }
    }

    return current_floor;
}


/*=========================================================
 * Elevator API
 *========================================================*/

void Elevator_Dispatch_Init(void)
{
    Dispatch_Init();
}

void Elevator_AddCall(u8 floor, u8 type)
{
    Call_Register(floor, type);
}

void Elevator_ClearCall(u8 floor)
{
    Call_Clear(floor);
}

u8 Elevator_CalculateNextFloor(u8 floor,
                               ElevatorDirection_t *direction)
{
    current_floor = floor;

    if(direction != NULL)
    {
        current_direction =
        DSP_NextDirection(&g_calls,
                          current_floor,
                          current_direction);

        *direction = current_direction;
    }

    return Dispatch_GetNextFloor();
}