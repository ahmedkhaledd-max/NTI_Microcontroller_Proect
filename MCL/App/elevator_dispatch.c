#include "elevator_dispatch.h"

// بتات لتسجيل الطلبات (كل بيت يمثل دور من 0 إلى 3)
static u8 car_calls_bitmap = 0;   // طلبات من داخل الكابينة
static u8 up_calls_bitmap = 0;    // طلبات صعود من الأدوار
static u8 down_calls_bitmap = 0;  // طلبات هبوط من الأدوار

void Elevator_Dispatch_Init(void) {
    car_calls_bitmap = 0;
    up_calls_bitmap = 0;
    down_calls_bitmap = 0;
}

void Elevator_AddCall(u8 floor, u8 is_car_call) {
    if (floor >= TOTAL_FLOORS) return;

    if (is_car_call) {
        car_calls_bitmap |= (1 << floor);
    } else {
        // لو الدور مش الأخير يبقي ممكن طلب صعود، لو مش الأول يبقي هبوط (كمثال مبسط)
        if (floor < TOTAL_FLOORS - 1) {
            up_calls_bitmap |= (1 << floor);
        }
        if (floor > 0) {
            down_calls_bitmap |= (1 << floor);
        }
    }
}

void Elevator_ClearCall(u8 floor) {
    if (floor >= TOTAL_FLOORS) return;
    car_calls_bitmap &= ~(1 << floor);
    up_calls_bitmap &= ~(1 << floor);
    down_calls_bitmap &= ~(1 << floor);
}

// تطبيق خوارزمية LOOK المخصصة
u8 Elevator_CalculateNextFloor(u8 current_floor, ElevatorDirection_t *current_dir) {
    u8 total_requests = car_calls_bitmap | up_calls_bitmap | down_calls_bitmap;
    
    // لو مفيش أي طلبات، الأسانسير يقف
    if (total_requests == 0) {
        *current_dir = DIR_STOP;
        return current_floor;
    }

    // لو الاتجاه صاعد (UP)
    if (*current_dir == DIR_UP || *current_dir == DIR_STOP) {
        // دور هل فيه طلبات فوق الدور الحالي في نفس الاتجاه
        for (u8 i = current_floor + 1; i < TOTAL_FLOORS; i++) {
            if (total_requests & (1 << i)) {
                *current_dir = DIR_UP;
                return i;
            }
        }
        // لو مفيش فوق، اعكس الاتجاه وادور تحت
        *current_dir = DIR_DOWN;
    }

    // لو الاتجاه هابط (DOWN)
    if (*current_dir == DIR_DOWN) {
        // دور هل فيه طلبات تحت الدور الحالي
        for (s8 i = (s8)current_floor - 1; i >= 0; i--) {
            if (total_requests & (1 << i)) {
                *current_dir = DIR_DOWN;
                return (u8)i;
            }
        }
        // لو مفيش تحت، اعكس الاتجاه وادور فوق
        *current_dir = DIR_UP;
        for (u8 i = current_floor + 1; i < TOTAL_FLOORS; i++) {
            if (total_requests & (1 << i)) {
                *current_dir = DIR_UP;
                return i;
            }
        }
    }

    return current_floor;
}