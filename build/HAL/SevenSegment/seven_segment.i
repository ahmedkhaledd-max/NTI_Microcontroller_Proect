# 1 "HAL/SevenSegment/seven_segment.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HAL/SevenSegment/seven_segment.c"
# 1 "HAL/SevenSegment/../../Service/STD_Types.h" 1



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
# 2 "HAL/SevenSegment/seven_segment.c" 2
# 1 "HAL/SevenSegment/../../Service/Bit_Math.h" 1
# 3 "HAL/SevenSegment/seven_segment.c" 2
# 1 "HAL/SevenSegment/../../MCL/GPIO/gpio_interface.h" 1



# 1 "HAL/SevenSegment/../../MCL/GPIO/../../Service/STD_Types.h" 1
# 5 "HAL/SevenSegment/../../MCL/GPIO/gpio_interface.h" 2
# 1 "HAL/SevenSegment/../../MCL/GPIO/gpio_registers.h" 1
# 26 "HAL/SevenSegment/../../MCL/GPIO/gpio_registers.h"
typedef enum
{
    PIN_LOW = 0,
    PIN_HIGH = 1
} GPIO_PINStatus;

typedef unsigned char GPIO_PortStatus;
# 6 "HAL/SevenSegment/../../MCL/GPIO/gpio_interface.h" 2
# 27 "HAL/SevenSegment/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPinDirection(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Direction);
# 38 "HAL/SevenSegment/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPortDirection(uint8_h uint8Port, uint8_h uint8Direction);

GPIO_PINStatus GPIO_GetPinStatus(uint8_h uint8Port, uint8_h uint8Pin);

GPIO_PortStatus GPIO_GetPortStatus(uint8_h uint8Port);

STD_ReturnType GPIO_PinToggle(uint8_h uint8Port, uint8_h uint8Pin);
STD_ReturnType GPIO_SetPinValue(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Value);
STD_ReturnType GPIO_SetPortValue(uint8_h uint8Port, uint8_h uint8Value);
# 4 "HAL/SevenSegment/seven_segment.c" 2
# 1 "HAL/SevenSegment/seven_segment_interface.h" 1
# 29 "HAL/SevenSegment/seven_segment_interface.h"
typedef enum
{
    SEVEN_SEG_COMMON_CATHODE = 0,
    SEVEN_SEG_COMMON_ANODE = 1
} SevenSeg_Type;







typedef enum
{
    SEVEN_SEG_CONNECTION_DIRECT = 0,
    SEVEN_SEG_CONNECTION_BCD = 1
} SevenSeg_ConnectionType;






typedef enum
{
    SEVEN_SEG_ENABLE_ACTIVE_LOW = 0,
    SEVEN_SEG_ENABLE_ACTIVE_HIGH = 1
} SevenSeg_EnableLevel;
# 69 "HAL/SevenSegment/seven_segment_interface.h"
typedef struct
{
    SevenSeg_Type type;
    SevenSeg_ConnectionType connection;
    uint8_h dataPort;
    uint8_h startPin;
} SevenSeg_ConfigType;
# 86 "HAL/SevenSegment/seven_segment_interface.h"
STD_ReturnType SevenSeg_Init(const SevenSeg_ConfigType *addConfig);
# 97 "HAL/SevenSegment/seven_segment_interface.h"
STD_ReturnType SevenSeg_DisplayDigit(const SevenSeg_ConfigType *addConfig, uint8_h digit);






STD_ReturnType SevenSeg_Clear(const SevenSeg_ConfigType *addConfig);
# 113 "HAL/SevenSegment/seven_segment_interface.h"
STD_ReturnType SevenSeg_EnableDigit(uint8_h enablePort, uint8_h enablePin,
                                    SevenSeg_EnableLevel activeLevel);
# 123 "HAL/SevenSegment/seven_segment_interface.h"
STD_ReturnType SevenSeg_DisableDigit(uint8_h enablePort, uint8_h enablePin,
                                     SevenSeg_EnableLevel activeLevel);
# 5 "HAL/SevenSegment/seven_segment.c" 2
# 21 "HAL/SevenSegment/seven_segment.c"
static const uint8_h SevenSeg_DigitTable[10] =
{
    0x3F,
    0x06,
    0x5B,
    0x4F,
    0x66,
    0x6D,
    0x7D,
    0x07,
    0x7F,
    0x6F
};


STD_ReturnType SevenSeg_Init(const SevenSeg_ConfigType *addConfig)
{
    uint8_h pinCount;
    uint8_h pinIndex;

    if ((addConfig == ((void *)0)) || (addConfig->dataPort >= 4))
    {
        return E_NOK;
    }

    if (addConfig->connection == SEVEN_SEG_CONNECTION_DIRECT)
    {
        pinCount = 7U;
    }
    else if (addConfig->connection == SEVEN_SEG_CONNECTION_BCD)
    {
        pinCount = 4U;
    }
    else
    {
        return E_NOK;
    }

    if ((addConfig->startPin >= 8) ||
        (addConfig->startPin + pinCount > 8))
    {
        return E_NOK;
    }

    for (pinIndex = 0U; pinIndex < pinCount; ++pinIndex)
    {
        if (GPIO_SetPinDirection(addConfig->dataPort,
                                 addConfig->startPin + pinIndex,
                                 1) != E_OK)
        {
            return E_NOK;
        }
    }

    if (SevenSeg_Clear(addConfig) != E_OK)
    {
        return E_NOK;
    }

    return E_OK;
}


STD_ReturnType SevenSeg_DisplayDigit(const SevenSeg_ConfigType *addConfig, uint8_h digit)
{
    uint8_h pinCount;
    uint8_h pinIndex;
    uint8_h value;

    if ((addConfig == ((void *)0)) || (digit > 9U))
    {
        return E_NOK;
    }

    if (addConfig->connection == SEVEN_SEG_CONNECTION_DIRECT)
    {
        pinCount = 7U;
        value = SevenSeg_DigitTable[digit];
    }
    else if (addConfig->connection == SEVEN_SEG_CONNECTION_BCD)
    {
        pinCount = 4U;
        value = digit;
    }
    else
    {
        return E_NOK;
    }

    if (addConfig->type == SEVEN_SEG_COMMON_ANODE)
    {
        value = (uint8_h)(~value);
    }

    for (pinIndex = 0U; pinIndex < pinCount; ++pinIndex)
    {
        if (GPIO_SetPinValue(addConfig->dataPort,
                             addConfig->startPin + pinIndex,
                             (((value) >> (pinIndex)) & 1U)) != E_OK)
        {
            return E_NOK;
        }
    }

    return E_OK;
}


STD_ReturnType SevenSeg_Clear(const SevenSeg_ConfigType *addConfig)
{
    uint8_h pinCount;
    uint8_h pinIndex;
    uint8_h offLevel;

    if ((addConfig == ((void *)0)) || (addConfig->dataPort >= 4))
    {
        return E_NOK;
    }

    if (addConfig->connection == SEVEN_SEG_CONNECTION_DIRECT)
    {
        pinCount = 7U;
    }
    else if (addConfig->connection == SEVEN_SEG_CONNECTION_BCD)
    {
        pinCount = 4U;
    }
    else
    {
        return E_NOK;
    }

    if ((addConfig->startPin >= 8) ||
        (addConfig->startPin + pinCount > 8))
    {
        return E_NOK;
    }

    offLevel = (addConfig->type == SEVEN_SEG_COMMON_CATHODE) ? 0U : 1U;

    for (pinIndex = 0U; pinIndex < pinCount; ++pinIndex)
    {
        if (GPIO_SetPinValue(addConfig->dataPort,
                             addConfig->startPin + pinIndex,
                             offLevel) != E_OK)
        {
            return E_NOK;
        }
    }

    return E_OK;
}


STD_ReturnType SevenSeg_EnableDigit(uint8_h enablePort, uint8_h enablePin,
                                    SevenSeg_EnableLevel activeLevel)
{
    uint8_h value;

    if ((enablePort >= 4) || (enablePin >= 8))
    {
        return E_NOK;
    }

    value = (activeLevel == SEVEN_SEG_ENABLE_ACTIVE_HIGH) ? 1U : 0U;

    if (GPIO_SetPinValue(enablePort, enablePin, value) != E_OK)
    {
        return E_NOK;
    }

    return E_OK;
}


STD_ReturnType SevenSeg_DisableDigit(uint8_h enablePort, uint8_h enablePin,
                                     SevenSeg_EnableLevel activeLevel)
{
    uint8_h value;

    if ((enablePort >= 4) || (enablePin >= 8))
    {
        return E_NOK;
    }

    value = (activeLevel == SEVEN_SEG_ENABLE_ACTIVE_HIGH) ? 0U : 1U;

    if (GPIO_SetPinValue(enablePort, enablePin, value) != E_OK)
    {
        return E_NOK;
    }

    return E_OK;
}
