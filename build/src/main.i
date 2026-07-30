# 1 "src/main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/main.c"
# 1 "src/../Service/STD_Types.h" 1



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
# 2 "src/main.c" 2
# 1 "src/../LOGIC/elevator_dispatch.h" 1



# 1 "src/../LOGIC/../Service/STD_Types.h" 1
# 5 "src/../LOGIC/elevator_dispatch.h" 2
# 22 "src/../LOGIC/elevator_dispatch.h"
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
# 3 "src/main.c" 2
# 1 "src/../LOGIC/elevator_motion.h" 1



# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdint.h" 1 3 4
# 9 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdint.h" 3 4
# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 1 3 4
# 125 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4

# 125 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef signed int int8_t __attribute__((__mode__(__QI__)));
typedef unsigned int uint8_t __attribute__((__mode__(__QI__)));
typedef signed int int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int uint16_t __attribute__ ((__mode__ (__HI__)));
typedef signed int int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int uint32_t __attribute__ ((__mode__ (__SI__)));

typedef signed int int64_t __attribute__((__mode__(__DI__)));
typedef unsigned int uint64_t __attribute__((__mode__(__DI__)));
# 146 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 163 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int8_t int_least8_t;




typedef uint8_t uint_least8_t;




typedef int16_t int_least16_t;




typedef uint16_t uint_least16_t;




typedef int32_t int_least32_t;




typedef uint32_t uint_least32_t;







typedef int64_t int_least64_t;






typedef uint64_t uint_least64_t;
# 217 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int8_t int_fast8_t;




typedef uint8_t uint_fast8_t;




typedef int16_t int_fast16_t;




typedef uint16_t uint_fast16_t;




typedef int32_t int_fast32_t;




typedef uint32_t uint_fast32_t;







typedef int64_t int_fast64_t;






typedef uint64_t uint_fast64_t;
# 277 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int64_t intmax_t;




typedef uint64_t uintmax_t;
# 10 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdint.h" 2 3 4
# 5 "src/../LOGIC/elevator_motion.h" 2
# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdbool.h" 1 3 4
# 6 "src/../LOGIC/elevator_motion.h" 2
# 15 "src/../LOGIC/elevator_motion.h"

# 15 "src/../LOGIC/elevator_motion.h"
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


void Elevator_Motion_Init(void);
u8 Elevator_GetCurPosition(void);
void Elevator_MoveToFloor(u8 target_floor);
void Elevator_OpenDoor(void);
void Elevator_CloseDoor(void);
void Elevator_StopMotion(void);
# 4 "src/main.c" 2
# 1 "src/../LOGIC/elevator_safety.h" 1
# 12 "src/../LOGIC/elevator_safety.h"
typedef enum {
    FAULT_NONE = 0,
    FAULT_EMERGENCY_STOP_ID,
    FAULT_DOOR_OBSTRUCTION_ID,
    FAULT_OVERLOAD_ID,
    FAULT_TIMEOUT_ID
} FaultType_t;

void Safety_Init(void);
void Safety_Update(void);
void Emergency_Stop(void);
void Fault_Set(uint8_h id);
void Fault_Clear(uint8_h id);

# 25 "src/../LOGIC/elevator_safety.h" 3 4
_Bool 
# 25 "src/../LOGIC/elevator_safety.h"
    Fault_IsActive(void);

void Elevator_Safety_Init(void);
FaultType_t Elevator_CheckFaults(void);
void Elevator_LogFault(FaultType_t fault);
void Elevator_SendTelemetry(void);
# 5 "src/main.c" 2





static void HandleUserRequest(u8 floor, u8 is_car_call)
{
    Elevator_AddCall(floor, is_car_call);
}

int main(void)
{
    ElevatorState_t elevator_state = STATE_IDLE;
    ElevatorDirection_t direction = DIR_STOP;
    FaultType_t fault = FAULT_NONE;
    u8 current_floor = 0u;
    u8 target_floor = 0u;
    u16 cycle_counter = 0u;
    u8 demo_request_index = 0u;
    u16 door_timer = 0u;

    Elevator_Dispatch_Init();
    Elevator_Motion_Init();
    Elevator_Safety_Init();

    current_floor = Elevator_GetCurPosition();
    target_floor = current_floor;

    while (1)
    {
        cycle_counter++;

        fault = Elevator_CheckFaults();
        if (fault != FAULT_NONE)
        {
            Elevator_LogFault(fault);
            Elevator_StopMotion();
            elevator_state = STATE_EMERGENCY;
            Elevator_SendTelemetry();
            continue;
        }

        if ((cycle_counter % 5000u) == 0u)
        {
            switch (demo_request_index)
            {
                case 0u:
                    HandleUserRequest(2u,0u);
                    break;
                case 1u:
                    HandleUserRequest(0u,1u);
                    break;
                case 2u:
                    HandleUserRequest(3u,2u);
                    break;
                default:
                    break;
            }
            demo_request_index = (u8)((demo_request_index + 1u) % 3u);
        }

        current_floor = Elevator_GetCurPosition();

        switch (elevator_state)
        {
            case STATE_IDLE:
                target_floor = Elevator_CalculateNextFloor(current_floor, &direction);
                if (target_floor != current_floor)
                {
                    Elevator_MoveToFloor(target_floor);
                    elevator_state = STATE_MOVING;
                }
                break;

            case STATE_MOVING:
                if (current_floor == target_floor)
                {
                    Elevator_StopMotion();
                    Elevator_ClearCall(current_floor);
                    Elevator_OpenDoor();
                    door_timer = 0u;
                    elevator_state = STATE_DOOR_OPEN;
                }
                break;

            case STATE_DOOR_OPEN:
                if (door_timer >= 200u)
                {
                    Elevator_CloseDoor();
                    door_timer = 0u;
                    elevator_state = STATE_DOOR_CLOSING;
                }
                break;

            case STATE_DOOR_CLOSING:
                if (door_timer >= 100u)
                {
                    elevator_state = STATE_IDLE;
                }
                break;

            case STATE_EMERGENCY:
                break;

            default:
                break;
        }

        if ((elevator_state == STATE_DOOR_OPEN) || (elevator_state == STATE_DOOR_CLOSING))
        {
            door_timer++;
        }

        Elevator_SendTelemetry();
    }

    return 0;
}
