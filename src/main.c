#include "../Service/STD_Types.h"
#include "elevator_system.h"
#include "elevator_dispatch.h"
#include "elevator_motion.h"
#include "elevator_safety.h"
#include "elevator_io.h"

int main(void)
{
    /* 1. تهيئة كافة الوحدات */
    IO_Init();
    Elevator_Motion_Init();
    Elevator_Safety_Init();
    Elevator_Dispatch_Init();
    System_Init();

    LCD_ShowStatus();

    /* 2. الحلقة الرئيسية */
    while (1)
    {
        System_Update();
    }

    return 0;
}