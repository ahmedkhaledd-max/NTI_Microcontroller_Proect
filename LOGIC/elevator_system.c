#include "elevator_system.h"
#include "elevator_dispatch.h"
#include "elevator_safety.h"

static uint8_h system_fault_counter = 0u;

void System_Init(void)
{
    Dispatch_Init();
    Safety_Init();
    system_fault_counter = 0u;
}

void System_Update(void)
{
    Dispatch_Update();
    Safety_Update();
}

void Console_Process(void)
{
    (void)0;
}

void Telemetry_Send(void)
{
    (void)0;
}

void Statistics_Save(void)
{
    (void)0;
}

void LogFault(uint8_h fault)
{
    if (fault != 0u) {
        system_fault_counter++;
        Fault_Set(fault);
    }
}
