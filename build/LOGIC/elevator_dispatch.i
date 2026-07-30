# 1 "LOGIC/elevator_dispatch.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "LOGIC/elevator_dispatch.c"
# 1 "LOGIC/elevator_dispatch.h" 1



# 1 "LOGIC/../Service/STD_Types.h" 1



typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;
typedef unsigned long long uint64;

typedef signed char sint8;
typedef signed short sint16;
typedef signed long sint32;
typedef signed long long sint64;

typedef float float32;
typedef double float64;

typedef unsigned char uint8_h;
typedef unsigned short uint16_h;
typedef unsigned long uint32_h;
typedef unsigned long long uint64_h;

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;
typedef unsigned long long u64;

typedef signed char s8;
typedef signed short s16;
typedef signed long s32;
typedef signed long long s64;



typedef enum
{
    E_OK = 0,
    E_NOK = 1
} STD_ReturnType;
# 5 "LOGIC/elevator_dispatch.h" 2
# 22 "LOGIC/elevator_dispatch.h"
typedef enum
{
    DIR_STOP = 0,
    DIR_UP,
    DIR_DOWN

} ElevatorDirection_t;




typedef enum
{
    STATE_IDLE = 0,
    STATE_MOVING,
    STATE_DOOR_OPENING,
    STATE_DOOR_OPEN,
    STATE_DOOR_CLOSING,
    STATE_EMERGENCY

} ElevatorState_t;




typedef struct
{
    u8 carCall;
    u8 hallUp;
    u8 hallDown;

} Calls_t;




void Dispatch_Init(void);
void Dispatch_Update(void);

void Call_Register(u8 floor, u8 type);
void Call_Clear(u8 floor);

u8 Dispatch_GetNextFloor(void);




ElevatorDirection_t DSP_NextDirection(
                    const Calls_t *calls,
                    u8 currentFloor,
                    ElevatorDirection_t currentDirection);




void Elevator_Dispatch_Init(void);

void Elevator_AddCall(u8 floor, u8 type);

void Elevator_ClearCall(u8 floor);

u8 Elevator_CalculateNextFloor(
        u8 currentFloor,
        ElevatorDirection_t *direction);
# 2 "LOGIC/elevator_dispatch.c" 2





static Calls_t g_calls;

static ElevatorDirection_t current_direction = DIR_STOP;

static u8 current_floor = 0u;





static void Dispatch_BitSet(u8 floor, u8 *bitmap)
{
    if (floor < 4u)
    {
        *bitmap |= (1u << floor);
    }
}

static void Dispatch_BitClear(u8 floor, u8 *bitmap)
{
    if (floor < 4u)
    {
        *bitmap &= ~(1u << floor);
    }
}





static u8 callsAbove(const Calls_t *calls, u8 floor)
{
    u8 mask;

    mask = (u8)((0xFFu << (floor + 1u)) & ((1u << 4u) - 1u));

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





void Call_Register(u8 floor, u8 type)
{
    if (floor >= 4u)
    {
        return;
    }

    switch(type)
    {
        case 0u:

            Dispatch_BitSet(floor,&g_calls.carCall);

            break;

        case 1u:

            Dispatch_BitSet(floor,&g_calls.hallUp);

            break;

        case 2u:

            Dispatch_BitSet(floor,&g_calls.hallDown);

            break;

        default:

            break;
    }
}





void Call_Clear(u8 floor)
{
    if(floor >= 4u)
    {
        return;
    }

    Dispatch_BitClear(floor,&g_calls.carCall);
    Dispatch_BitClear(floor,&g_calls.hallUp);
    Dispatch_BitClear(floor,&g_calls.hallDown);
}




static u8 shouldStop(const Calls_t *calls,
                     u8 floor,
                     ElevatorDirection_t direction)
{

    if (calls->carCall & (1u << floor))
    {
        return 1u;
    }


    if ((direction == DIR_UP) &&
        (calls->hallUp & (1u << floor)))
    {
        return 1u;
    }


    if ((direction == DIR_DOWN) &&
        (calls->hallDown & (1u << floor)))
    {
        return 1u;
    }







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




u8 Dispatch_GetNextFloor(void)
{
    u8 floor;

    current_direction = DSP_NextDirection(&g_calls,
                                          current_floor,
                                          current_direction);

    if(current_direction == DIR_UP)
    {
        for(floor = current_floor + 1u;
            floor < 4u;
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

    if(direction != ((void *)0))
    {
        current_direction =
        DSP_NextDirection(&g_calls,
                          current_floor,
                          current_direction);

        *direction = current_direction;
    }

    return Dispatch_GetNextFloor();
}
