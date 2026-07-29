#include "elevator_motion.h"
// استدعاء درافير الـ HAL الخاصة بالمحركات والـ ADC من مجلدات المشروع
#include "../HAL/DC_Motor/dc_motor.h"
#include "../MCL/ADC/adc.h"

// متغيرات داخلية لمتابعة الحركة
static u8 current_floor_pos = 0;

void Elevator_Motion_Init(void) {
    // تهيئة محرك الكابينة ومحرك الباب والدرافير المرتبطة
    // (يتم استدعاء دوال التهيئة الخاصة بالدرافير الموجودة عندك)
}

u8 Elevator_GetCurPosition(void) {
    // قراءة الـ ADC لتحويل قيمة الجهد إلى دور فعلي للكابينة
    u16 adc_val = ADC_Read(); // تعتمد على درافير الـ ADC الموجودة
    
    // منطق تقريبي لتحويل قراءة الـ ADC لأدوار (من 0 إلى 3)
    if (adc_val < 250) return 0;
    else if (adc_val < 500) return 1;
    else if (adc_val < 750) return 2;
    else return 3;
}

void Elevator_MoveToFloor(u8 target_floor) {
    current_floor_pos = Elevator_GetCurPosition();
    
    if (target_floor > current_floor_pos) {
        // تشغيل المحرك في اتجاه الصعود (UP)
        // تطبيق بروفايل السرعة (تسارع ثم سرعة ثابتة ثم تباطؤ واقتراب بطيء Creep)
    } 
    else if (target_floor < current_floor_pos) {
        // تشغيل المحرك في اتجاه الهبوط (DOWN)
    } 
    else {
        // الوصول للدور المطلوب وإيقاف المحرك
        Elevator_StopMotion();
    }
}

void Elevator_OpenDoor(void) {
    // تشغيل محرك الباب لفتح الباب
}

void Elevator_CloseDoor(void) {
    // تشغيل محرك الباب لإغلاق الباب
}

void Elevator_StopMotion(void) {
    // إيقاف محرك الهويست تماماً والتحضير للّفلفة أو الوقوف
}