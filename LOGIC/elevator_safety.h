#ifndef ELEVATOR_SAFETY_H
#define ELEVATOR_SAFETY_H

#include "../Service/STD_Types.h"
#include <stdbool.h>

#define FAULT_EMERGENCY_STOP   1u
#define FAULT_DOOR_OBSTRUCTION 2u
#define FAULT_OVERLOAD         3u
#define FAULT_TIMEOUT          4u

#define OVERLOAD_ADC_THRESHOLD 800u 

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
bool Fault_IsActive(void);

void Elevator_Safety_Init(void);
FaultType_t Elevator_CheckFaults(void);
void Elevator_LogFault(FaultType_t fault);
void Elevator_SendTelemetry(void);

#endif