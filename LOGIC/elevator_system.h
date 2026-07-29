#ifndef ELEVATOR_SYSTEM_H
#define ELEVATOR_SYSTEM_H

#include "../Service/STD_Types.h"
#include <stdbool.h>

void System_Init(void);
void System_Update(void);
void Console_Process(void);
void Telemetry_Send(void);
void Statistics_Save(void);
void LogFault(uint8_h fault);

#endif