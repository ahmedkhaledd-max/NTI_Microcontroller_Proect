#ifndef ELEVATOR_DISPATCH_H
#define ELEVATOR_DISPATCH_H

#include "STD_Types.h"

#define TOTAL_FLOORS 4

// اتجاهات حركة الأسانسير
typedef enum {
    DIR_STOP = 0,
    DIR_UP,
    DIR_DOWN
} ElevatorDirection_t;

// حالات الأسانسير
typedef enum {
    STATE_IDLE = 0,
    STATE_MOVING,
    STATE_DOOR_OPENING,
    STATE_DOOR_OPEN,
    STATE_DOOR_CLOSING,
    STATE_EMERGENCY
} ElevatorState_t;

// تهيئة نظام الطلبات
void Elevator_Dispatch_Init(void);

// تسجيل طلب جديد (سواء من جوه الكابينة أو من الدور)
void Elevator_AddCall(u8 floor, u8 is_car_call);

// مسح الطلب بعد الوصول للدور وخدمته
void Elevator_ClearCall(u8 floor);

// خوارزمية الـ LOOK لتحديد الدور القادم واتجاه الحركة
u8 Elevator_CalculateNextFloor(u8 current_floor, ElevatorDirection_t *current_dir);

#endif