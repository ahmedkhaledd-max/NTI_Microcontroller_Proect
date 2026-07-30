#include "elevator_safety.h"
// استدعاء درافير الـ UART أو الـ Interrupts حسب الحاجة

static FaultType_t current_fault = FAULT_NONE;

void Elevator_Safety_Init(void) {
    current_fault = FAULT_NONE;
    // تهيئة مقاطعات الطوارئ الخارجية (مثل INT0 لزر الـ Emergency Stop)
}

FaultType_t Elevator_CheckFaults(void) {
    // 1. فحص زر الطوارئ (Emergency Stop)
    // 2. فحص حساس زيادة الحمولة (Overload Sensor عبر الـ ADC أو GPIO)
    // 3. فحص عائق الأبواب
    
    return current_fault;
}

void Elevator_LogFault(FaultType_t fault) {
    current_fault = fault;
    // حفظ الخطأ في الـ EEPROM أو الـ Ring Buffer كمرجع للصيانة
}

void Elevator_SendTelemetry(void) {
    // إرسال بيانات الحالة (الدور الحالي، الاتجاه، الأخطاء، وحالة الأبواب) عبر الـ UART كل ثانيتين
}

/* ================================================================================
 *  الواجهة المختصرة التي يستدعيها elevator_system.c
 * ============================================================================== */

void Safety_Init(void) {
    Elevator_Safety_Init();
}

void Safety_Update(void) {
    (void)Elevator_CheckFaults();
}

void Emergency_Stop(void) {
    Elevator_LogFault(FAULT_EMERGENCY_STOP_ID);
    // قطع الحركة فوراً: إيقاف موتور المقصورة هنا
}

void Fault_Set(uint8_h id) {
    Elevator_LogFault((FaultType_t)id);
}

void Fault_Clear(uint8_h id) {
    if (current_fault == (FaultType_t)id) {
        current_fault = FAULT_NONE;
    }
}

bool Fault_IsActive(void) {
    return (current_fault != FAULT_NONE);
}