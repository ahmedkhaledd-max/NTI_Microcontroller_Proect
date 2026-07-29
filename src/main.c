#include "../Service/STD_Types.h"
#include "../LOGIC/elevator_dispatch.h"
#include "../LOGIC/elevator_motion.h"
#include "../LOGIC/elevator_safety.h"

#define DEMO_REQUEST_PERIOD 5000u
#define DOOR_OPEN_TIME      200u
#define DOOR_CLOSE_TIME     100u

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

        if ((cycle_counter % DEMO_REQUEST_PERIOD) == 0u)
        {
            switch (demo_request_index)
            {
                case 0u:
                    HandleUserRequest(2u, 1u);
                    break;
                case 1u:
                    HandleUserRequest(0u, 0u);
                    break;
                case 2u:
                    HandleUserRequest(3u, 1u);
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
                if (door_timer >= DOOR_OPEN_TIME)
                {
                    Elevator_CloseDoor();
                    door_timer = 0u;
                    elevator_state = STATE_DOOR_CLOSING;
                }
                break;

            case STATE_DOOR_CLOSING:
                if (door_timer >= DOOR_CLOSE_TIME)
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