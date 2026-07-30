# 1 "MCL/Interrupt/interrupt.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "MCL/Interrupt/interrupt.c"
# 1 "MCL/Interrupt/../../Service/STD_Types.h" 1



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
# 2 "MCL/Interrupt/interrupt.c" 2
# 1 "MCL/Interrupt/../../Service/Bit_Math.h" 1
# 3 "MCL/Interrupt/interrupt.c" 2
# 1 "MCL/Interrupt/interrupt_registers.h" 1
# 4 "MCL/Interrupt/interrupt.c" 2
# 1 "MCL/Interrupt/interrupt_interface.h" 1
# 25 "MCL/Interrupt/interrupt_interface.h"
typedef enum
{
    EXTI_INT0 = 0,
    EXTI_INT1 = 1,
    EXTI_INT2 = 2,
    EXTI_LINE_MAX
} EXTI_LineType;
# 42 "MCL/Interrupt/interrupt_interface.h"
typedef enum
{
    EXTI_SENSE_LOW_LEVEL = 0,
    EXTI_SENSE_ANY_CHANGE = 1,
    EXTI_SENSE_FALLING = 2,
    EXTI_SENSE_RISING = 3
} EXTI_SenseType;







typedef struct
{
    EXTI_LineType line;
    EXTI_SenseType sense;
} EXTI_ConfigType;






typedef void (*EXTI_CallBackType)(void);
# 80 "MCL/Interrupt/interrupt_interface.h"
STD_ReturnType EXTI_Init(const EXTI_ConfigType *addConfig);






STD_ReturnType EXTI_Enable(EXTI_LineType line);






STD_ReturnType EXTI_Disable(EXTI_LineType line);
# 103 "MCL/Interrupt/interrupt_interface.h"
STD_ReturnType EXTI_SetSenseControl(EXTI_LineType line, EXTI_SenseType sense);







STD_ReturnType EXTI_SetCallBack(EXTI_LineType line, EXTI_CallBackType callBack);




void EXTI_EnableGlobalInterrupt(void);




void EXTI_DisableGlobalInterrupt(void);
# 5 "MCL/Interrupt/interrupt.c" 2
# 20 "MCL/Interrupt/interrupt.c"
STD_ReturnType EXTI_Init(const EXTI_ConfigType *addConfig)
{
# 38 "MCL/Interrupt/interrupt.c"
    return E_NOK;
}


STD_ReturnType EXTI_Enable(EXTI_LineType line)
{






    return E_NOK;
}


STD_ReturnType EXTI_Disable(EXTI_LineType line)
{





    return E_NOK;
}


STD_ReturnType EXTI_SetSenseControl(EXTI_LineType line, EXTI_SenseType sense)
{
# 88 "MCL/Interrupt/interrupt.c"
    return E_NOK;
}


STD_ReturnType EXTI_SetCallBack(EXTI_LineType line, EXTI_CallBackType callBack)
{
# 103 "MCL/Interrupt/interrupt.c"
    return E_NOK;
}


void EXTI_EnableGlobalInterrupt(void)
{




}


void EXTI_DisableGlobalInterrupt(void)
{




}
