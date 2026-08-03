# 1 "MCL/ADC/adc.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "MCL/ADC/adc.c"
# 1 "MCL/ADC/../../Service/STD_Types.h" 1



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
# 2 "MCL/ADC/adc.c" 2
# 1 "MCL/ADC/../../Service/Bit_Math.h" 1
# 3 "MCL/ADC/adc.c" 2
# 1 "MCL/ADC/adc_registers.h" 1
# 4 "MCL/ADC/adc.c" 2
# 1 "MCL/ADC/adc_interface.h" 1
# 38 "MCL/ADC/adc_interface.h"
typedef struct
{
    uint8_h uint8ReferenceVoltage;
    uint8_h uint8Prescaler;
} ADC_ConfigType;







STD_ReturnType ADC_Init(const ADC_ConfigType *addConfig);





STD_ReturnType ADC_DeInit(void);







STD_ReturnType ADC_StartConversion(uint8_h uint8Channel);





uint8_h ADC_IsConversionComplete(void);






STD_ReturnType ADC_ReadResult(uint16_h *puint16Result);
# 86 "MCL/ADC/adc_interface.h"
STD_ReturnType ADC_ReadChannelBlocking(uint8_h uint8Channel, uint16_h *puint16Result);
# 5 "MCL/ADC/adc.c" 2

STD_ReturnType ADC_Init(const ADC_ConfigType *addConfig)
{
    STD_ReturnType local_Status = E_OK;

    if (addConfig == ((void *)0))
    {
        local_Status = E_NOK;
    }
    else
    {

        (((*(volatile u8 *)0x27)) &= ~(1U << (6)));
        (((*(volatile u8 *)0x27)) &= ~(1U << (7)));
        if ((((addConfig->uint8ReferenceVoltage) >> (0)) & 1U))
        {
            (((*(volatile u8 *)0x27)) |= (1U << (6)));
        }
        if ((((addConfig->uint8ReferenceVoltage) >> (1)) & 1U))
        {
            (((*(volatile u8 *)0x27)) |= (1U << (7)));
        }


        (((*(volatile u8 *)0x27)) &= ~(1U << (5)));


        (((*(volatile u8 *)0x27)) &= ~(1U << (0)));
        (((*(volatile u8 *)0x27)) &= ~(1U << (1)));
        (((*(volatile u8 *)0x27)) &= ~(1U << (2)));
        (((*(volatile u8 *)0x27)) &= ~(1U << (3)));
        (((*(volatile u8 *)0x27)) &= ~(1U << (4)));


        (((*(volatile u8 *)0x26)) &= ~(1U << (0)));
        (((*(volatile u8 *)0x26)) &= ~(1U << (1)));
        (((*(volatile u8 *)0x26)) &= ~(1U << (2)));
        if ((((addConfig->uint8Prescaler) >> (0)) & 1U))
        {
            (((*(volatile u8 *)0x26)) |= (1U << (0)));
        }
        if ((((addConfig->uint8Prescaler) >> (1)) & 1U))
        {
            (((*(volatile u8 *)0x26)) |= (1U << (1)));
        }
        if ((((addConfig->uint8Prescaler) >> (2)) & 1U))
        {
            (((*(volatile u8 *)0x26)) |= (1U << (2)));
        }


        (((*(volatile u8 *)0x26)) |= (1U << (7)));
    }

    return local_Status;
}

STD_ReturnType ADC_DeInit(void)
{
    (((*(volatile u8 *)0x26)) &= ~(1U << (7)));
    return E_OK;
}

STD_ReturnType ADC_StartConversion(uint8_h uint8Channel)
{
    STD_ReturnType local_Status = E_OK;

    if (uint8Channel >= 8)
    {
        local_Status = E_NOK;
    }
    else
    {
        (((*(volatile u8 *)0x27)) &= ~(1U << (0)));
        (((*(volatile u8 *)0x27)) &= ~(1U << (1)));
        (((*(volatile u8 *)0x27)) &= ~(1U << (2)));
        (((*(volatile u8 *)0x27)) &= ~(1U << (3)));
        (((*(volatile u8 *)0x27)) &= ~(1U << (4)));

        if ((((uint8Channel) >> (0)) & 1U))
        {
            (((*(volatile u8 *)0x27)) |= (1U << (0)));
        }
        if ((((uint8Channel) >> (1)) & 1U))
        {
            (((*(volatile u8 *)0x27)) |= (1U << (1)));
        }
        if ((((uint8Channel) >> (2)) & 1U))
        {
            (((*(volatile u8 *)0x27)) |= (1U << (2)));
        }

        (((*(volatile u8 *)0x26)) |= (1U << (6)));
    }

    return local_Status;
}

uint8_h ADC_IsConversionComplete(void)
{
    uint8_h uint8Status = 1;

    if (((((*(volatile u8 *)0x26)) >> (6)) & 1U))
    {
        uint8Status = 0;
    }

    return uint8Status;
}

STD_ReturnType ADC_ReadResult(uint16_h *puint16Result)
{
    STD_ReturnType local_Status = E_OK;

    if (puint16Result == ((void *)0))
    {
        local_Status = E_NOK;
    }
    else
    {
        uint8_h uint8Low = (*(volatile u8 *)0x24);
        uint8_h uint8High = (*(volatile u8 *)0x25);

        *puint16Result = (uint16_h)(((uint16_h)uint8High << 8) | uint8Low);
    }

    return local_Status;
}

STD_ReturnType ADC_ReadChannelBlocking(uint8_h uint8Channel, uint16_h *puint16Result)
{
    STD_ReturnType local_Status = ADC_StartConversion(uint8Channel);

    if (local_Status == E_OK)
    {
        while (ADC_IsConversionComplete() == 0)
        {

        }

        local_Status = ADC_ReadResult(puint16Result);
    }

    return local_Status;
}
