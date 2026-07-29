#ifndef ELEVATOR_MOTION_H
#define ELEVATOR_MOTION_H

#include "STD_Types.h"

// تهيئة محركات الهويست والأبواب وقراءة الـ ADC للموقع
void Elevator_Motion_Init(void);

// قراءة موقع الكابينة الحالي بناءً على حساسات الـ ADC أو الفلور سويتش
u8 Elevator_GetCurPosition(void);

// تحريك الأسانسير لبيت أو دور معين مع تطبيق بروفايل الحركة
void Elevator_MoveToFloor(u8 target_floor);

// التحكم في فتح وإغلاق الأبواب
void Elevator_OpenDoor(void);
void Elevator_CloseDoor(void);
void Elevator_StopMotion(void);

#endif