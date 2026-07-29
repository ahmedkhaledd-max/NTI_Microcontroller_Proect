#ifndef ELEVATOR_SAFETY_H
#define ELEVATOR_SAFETY_H

#include "../Service/STD_Types.h"

// أنواع الأخطاء وحالات الأمان
typedef enum {
    FAULT_NONE = 0,
    FAULT_EMERGENCY_STOP,
    FAULT_DOOR_OBSTRUCTION,
    FAULT_OVERLOAD,
    FAULT_TIMEOUT
} FaultType_t;

// تهيئة حساسات الأمان والمقاطعات
void Elevator_Safety_Init(void);

// فحص حالات الأمان (زيادة الحمولة، عوائق الأبواب، زر الطوارئ)
FaultType_t Elevator_CheckFaults(void);

// تسجيل الخطأ في ذاكرة النظام أو الـ Ring Buffer
void Elevator_LogFault(FaultType_t fault);

// إرسال تقرير حالة النظام والـ Telemetry عبر السيريال كل فترة
void Elevator_SendTelemetry(void);

#endif