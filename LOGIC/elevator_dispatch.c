#include "elevator_dispatch.h"

static u8 car_calls_bitmap = 0;
static u8 up_calls_bitmap = 0;
static u8 down_calls_bitmap = 0;
static u8 current_direction = DIR_STOP;
static u8 current_floor = 0u;

static void Dispatch_BitSet(u8 floor, u8 *bitmap)
{
    if (floor < TOTAL_FLOORS)
    {
        *bitmap |= (u8)(1u << floor);
    }
}

static void Dispatch_BitClear(u8 floor, u8 *bitmap)
{
    if (floor < TOTAL_FLOORS)
    {
        *bitmap &= (u8)~(1u << floor);
    }
}

void Dispatch_Init(void)
{
    car_calls_bitmap = 0u;
    up_calls_bitmap = 0u;
    down_calls_bitmap = 0u;
    current_direction = DIR_STOP;
    current_floor = 0u;
}

void Dispatch_Update(void)
{
    (void)current_floor;
}

void Call_Register(uint8_h floor, uint8_h type)
{
    if (floor >= TOTAL_FLOORS) {
        return;
    }

    if (type == CALL_TYPE_CAR) {
        Dispatch_BitSet(floor, &car_calls_bitmap);
    } else {
        if (floor < (TOTAL_FLOORS - 1u)) {
            Dispatch_BitSet(floor, &up_calls_bitmap);
        }
        if (floor > 0u) {
            Dispatch_BitSet(floor, &down_calls_bitmap);
        }
    }
}

void Call_Clear(uint8_h floor)
{
    if (floor >= TOTAL_FLOORS) {
        return;
    }

    Dispatch_BitClear(floor, &car_calls_bitmap);
    Dispatch_BitClear(floor, &up_calls_bitmap);
    Dispatch_BitClear(floor, &down_calls_bitmap);
}

uint8_h Dispatch_GetNextFloor(void)
{
    u8 total_requests = (u8)(car_calls_bitmap | up_calls_bitmap | down_calls_bitmap);

    if (total_requests == 0u) {
        current_direction = DIR_STOP;
        return current_floor;
    }

    if ((current_direction == DIR_UP) || (current_direction == DIR_STOP)) {
        for (u8 i = (u8)(current_floor + 1u); i < TOTAL_FLOORS; i++) {
            if (total_requests & (1u << i)) {
                current_direction = DIR_UP;
                current_floor = i;
                return current_floor;
            }
        }
        current_direction = DIR_DOWN;
    }

    if (current_direction == DIR_DOWN) {
        for (s8 i = (s8)current_floor - 1; i >= 0; i--) {
            if (total_requests & (1u << (u8)i)) {
                current_direction = DIR_DOWN;
                current_floor = (u8)i;
                return current_floor;
            }
        }

        current_direction = DIR_UP;
        for (u8 i = (u8)(current_floor + 1u); i < TOTAL_FLOORS; i++) {
            if (total_requests & (1u << i)) {
                current_direction = DIR_UP;
                current_floor = i;
                return current_floor;
            }
        }
    }

    return current_floor;
}

void Elevator_Dispatch_Init(void)
{
    Dispatch_Init();
}

void Elevator_AddCall(u8 floor, u8 is_car_call)
{
    Call_Register(floor, is_car_call ? CALL_TYPE_CAR : CALL_TYPE_FLOOR);
}

void Elevator_ClearCall(u8 floor)
{
    Call_Clear(floor);
}

u8 Elevator_CalculateNextFloor(u8 current_floor_in, ElevatorDirection_t *current_dir)
{
    if (current_dir != NULL) {
        current_direction = (u8)*current_dir;
    }
    current_floor = current_floor_in;
    u8 next_floor = Dispatch_GetNextFloor();
    if (current_dir != NULL) {
        *current_dir = (ElevatorDirection_t)current_direction;
    }
    return next_floor;
}
