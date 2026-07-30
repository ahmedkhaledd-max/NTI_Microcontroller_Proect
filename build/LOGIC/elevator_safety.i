# 1 "LOGIC/elevator_safety.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "LOGIC/elevator_safety.c"
# 1 "LOGIC/elevator_safety.h" 1



# 1 "LOGIC/../Service/STD_Types.h" 1



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
# 5 "LOGIC/elevator_safety.h" 2
# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdbool.h" 1 3 4
# 6 "LOGIC/elevator_safety.h" 2






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

# 25 "LOGIC/elevator_safety.h" 3 4
_Bool 
# 25 "LOGIC/elevator_safety.h"
    Fault_IsActive(void);

void Elevator_Safety_Init(void);
FaultType_t Elevator_CheckFaults(void);
void Elevator_LogFault(FaultType_t fault);
void Elevator_SendTelemetry(void);
# 2 "LOGIC/elevator_safety.c" 2


static FaultType_t current_fault = FAULT_NONE;

void Elevator_Safety_Init(void) {
    current_fault = FAULT_NONE;

}

FaultType_t Elevator_CheckFaults(void) {




    return current_fault;
}

void Elevator_LogFault(FaultType_t fault) {
    current_fault = fault;

}

void Elevator_SendTelemetry(void) {

}





void Safety_Init(void) {
    Elevator_Safety_Init();
}

void Safety_Update(void) {
    (void)Elevator_CheckFaults();
}

void Emergency_Stop(void) {
    Elevator_LogFault(FAULT_EMERGENCY_STOP_ID);

}

void Fault_Set(uint8_h id) {
    Elevator_LogFault((FaultType_t)id);
}

void Fault_Clear(uint8_h id) {
    if (current_fault == (FaultType_t)id) {
        current_fault = FAULT_NONE;
    }
}


# 55 "LOGIC/elevator_safety.c" 3 4
_Bool 
# 55 "LOGIC/elevator_safety.c"
    Fault_IsActive(void) {
    return (current_fault != FAULT_NONE);
}
