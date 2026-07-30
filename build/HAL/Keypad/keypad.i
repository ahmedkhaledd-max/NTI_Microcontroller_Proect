# 1 "HAL/Keypad/keypad.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HAL/Keypad/keypad.c"
# 1 "HAL/Keypad/../../Service/STD_Types.h" 1



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
# 2 "HAL/Keypad/keypad.c" 2
# 1 "HAL/Keypad/../../Service/Bit_Math.h" 1
# 3 "HAL/Keypad/keypad.c" 2
# 1 "HAL/Keypad/../../MCL/GPIO/gpio_interface.h" 1



# 1 "HAL/Keypad/../../MCL/GPIO/../../Service/STD_Types.h" 1
# 5 "HAL/Keypad/../../MCL/GPIO/gpio_interface.h" 2
# 1 "HAL/Keypad/../../MCL/GPIO/gpio_registers.h" 1
# 26 "HAL/Keypad/../../MCL/GPIO/gpio_registers.h"
typedef enum
{
    PIN_LOW = 0,
    PIN_HIGH = 1
} GPIO_PINStatus;

typedef unsigned char GPIO_PortStatus;
# 6 "HAL/Keypad/../../MCL/GPIO/gpio_interface.h" 2
# 27 "HAL/Keypad/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPinDirection(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Direction);
# 38 "HAL/Keypad/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPortDirection(uint8_h uint8Port, uint8_h uint8Direction);

GPIO_PINStatus GPIO_GetPinStatus(uint8_h uint8Port, uint8_h uint8Pin);

GPIO_PortStatus GPIO_GetPortStatus(uint8_h uint8Port);

STD_ReturnType GPIO_PinToggle(uint8_h uint8Port, uint8_h uint8Pin);
STD_ReturnType GPIO_SetPinValue(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Value);
STD_ReturnType GPIO_SetPortValue(uint8_h uint8Port, uint8_h uint8Value);
# 4 "HAL/Keypad/keypad.c" 2
# 1 "HAL/Keypad/keypad_interface.h" 1
# 42 "HAL/Keypad/keypad_interface.h"
typedef struct
{
    uint8_h rowPort;
    uint8_h rowStartPin;
    uint8_h colPort;
    uint8_h colStartPin;
    uint8_h keyMap[4][4];
} Keypad_ConfigType;
# 61 "HAL/Keypad/keypad_interface.h"
STD_ReturnType Keypad_Init(const Keypad_ConfigType *addConfig);
# 71 "HAL/Keypad/keypad_interface.h"
STD_ReturnType Keypad_GetKey(const Keypad_ConfigType *addConfig, uint8_h *pKey);
# 80 "HAL/Keypad/keypad_interface.h"
STD_ReturnType Keypad_WaitForKey(const Keypad_ConfigType *addConfig, uint8_h *pKey);
# 5 "HAL/Keypad/keypad.c" 2
# 14 "HAL/Keypad/keypad.c"
static void Keypad_DelayMs(uint16_h ms)
{
    volatile uint16_h outer;
    volatile uint16_h inner;

    for (outer = 0U; outer < ms; ++outer)
    {
        for (inner = 0U; inner < 1600U; ++inner)
        {

        }
    }
}


STD_ReturnType Keypad_Init(const Keypad_ConfigType *addConfig)
{
    uint8_h index;

    if ((addConfig == ((void *)0)) ||
        (addConfig->rowPort >= 4) ||
        (addConfig->colPort >= 4))
    {
        return E_NOK;
    }

    if ((addConfig->rowStartPin + 4 > 8) ||
        (addConfig->colStartPin + 4 > 8))
    {
        return E_NOK;
    }


    for (index = 0U; index < 4; ++index)
    {
        if (GPIO_SetPinDirection(addConfig->rowPort,
                                 addConfig->rowStartPin + index,
                                 1) != E_OK)
        {
            return E_NOK;
        }
        (void)GPIO_SetPinValue(addConfig->rowPort,
                               addConfig->rowStartPin + index, 1U);
    }


    for (index = 0U; index < 4; ++index)
    {
        if (GPIO_SetPinDirection(addConfig->colPort,
                                 addConfig->colStartPin + index,
                                 0) != E_OK)
        {
            return E_NOK;
        }
        (void)GPIO_SetPinValue(addConfig->colPort,
                               addConfig->colStartPin + index, 1U);
    }

    return E_OK;
}


STD_ReturnType Keypad_GetKey(const Keypad_ConfigType *addConfig, uint8_h *pKey)
{
    uint8_h row;
    uint8_h col;

    if ((addConfig == ((void *)0)) || (pKey == ((void *)0)))
    {
        return E_NOK;
    }

    *pKey = 0xFF;

    for (row = 0U; row < 4; ++row)
    {
        uint8_h r;


        for (r = 0U; r < 4; ++r)
        {
            (void)GPIO_SetPinValue(addConfig->rowPort,
                                   addConfig->rowStartPin + r, 1U);
        }


        (void)GPIO_SetPinValue(addConfig->rowPort,
                               addConfig->rowStartPin + row, 0U);

        for (col = 0U; col < 4; ++col)
        {
            if (GPIO_GetPinStatus(addConfig->colPort,
                                  addConfig->colStartPin + col) == PIN_LOW)
            {

                Keypad_DelayMs(20U);
                if (GPIO_GetPinStatus(addConfig->colPort,
                                      addConfig->colStartPin + col) == PIN_LOW)
                {

                    while (GPIO_GetPinStatus(addConfig->colPort,
                                             addConfig->colStartPin + col) == PIN_LOW)
                    {

                    }

                    *pKey = addConfig->keyMap[row][col];
                    return E_OK;
                }
            }
        }
    }

    return E_OK;
}


STD_ReturnType Keypad_WaitForKey(const Keypad_ConfigType *addConfig, uint8_h *pKey)
{
    if ((addConfig == ((void *)0)) || (pKey == ((void *)0)))
    {
        return E_NOK;
    }

    do
    {
        if (Keypad_GetKey(addConfig, pKey) != E_OK)
        {
            return E_NOK;
        }
    } while (*pKey == 0xFF);

    return E_OK;
}
