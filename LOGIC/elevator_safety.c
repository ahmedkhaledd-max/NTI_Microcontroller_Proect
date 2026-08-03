#include "elevator_safety.h"
#include "elevator_motion.h"
#include "elevator_io.h"     
#include "../MCL/UART/uart_interface.h"

static FaultType_t current_fault = FAULT_NONE;

void Elevator_Safety_Init(void) 
{
    current_fault = FAULT_NONE;
}

FaultType_t Elevator_CheckFaults(void) 
{
    u8 emerg_pin_val = PIN_HIGH;
    u8 door_edge_pin_val = PIN_HIGH;
    uint16_h load_adc_val = 0u;

    /* 1. فحص زر الطوارئ (Emergency Stop) */
    emerg_pin_val = (u8)GPIO_GetPinStatus(GPIO_PORTC, GPIO_PIN5);
    
    /* إذا كانت منطقية المفتاح في البروتس أن الضغط يوصل للأرضي (LOW) 
       تأكد من حالة المفتاح، أو اعكس الشرط إن كان المفتاح مغلقاً دائماً */
    if (emerg_pin_val == PIN_LOW) 
    {
        /* علق هذا السطر مؤقتاً لتتأكد إن كانت المشكلة منه */
        // current_fault = FAULT_EMERGENCY_STOP_ID;
        // return current_fault;
    }

    /* 2. فحص حساس الوزن (Car Load) */
    load_adc_val = ADC_Read(ADC_CAR_LOAD_CH);
    if (load_adc_val > OVERLOAD_ADC_THRESHOLD) 
    {
        current_fault = FAULT_OVERLOAD_ID;
        return current_fault;
    }

    /* 3. فحص عائق الباب (Door Safety Edge) */
    door_edge_pin_val = (u8)GPIO_GetPinStatus(GPIO_PORTB, GPIO_PIN7);
    if (door_edge_pin_val == PIN_LOW) 
    {
        /* علق هذا السطر مؤقتاً للتجربة */
        // current_fault = FAULT_DOOR_OBSTRUCTION_ID;
        // return current_fault;
    }

    /* في حالة عدم وجود أي أعطال */
    current_fault = FAULT_NONE;
    return current_fault;
}
void Elevator_LogFault(FaultType_t fault) 
{
    current_fault = fault;
}

void Elevator_SendTelemetry(void) 
{
    /* إرسال بيانات الحالة الحالية للمصعد عبر الـ UART للـ Serial Monitor */
    uint8_h current_floor = Elevator_GetCurPosition();
    
    UART_SendString((u8*)"Floor: ");
    UART_SendNumber(current_floor);
    UART_SendString((u8*)"\r\n");
}

/* ================================================================================
 * (Public Safety API)
 * ============================================================================== */

void Safety_Init(void) 
{
    Elevator_Safety_Init();
}

void Safety_Update(void) 
{
    (void)Elevator_CheckFaults();
}

void Emergency_Stop(void) 
{
    Elevator_LogFault(FAULT_EMERGENCY_STOP_ID);
}

void Fault_Set(u8 id) 
{
    Elevator_LogFault((FaultType_t)id);
}

void Fault_Clear(u8 id) 
{
    if (current_fault == (FaultType_t)id) 
    {
        current_fault = FAULT_NONE;
    }
}

bool Fault_IsActive(void) 
{
    return (current_fault != FAULT_NONE);
}