# 1 "HAL/LCD/lcd.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HAL/LCD/lcd.c"
# 1 "HAL/LCD/../../Service/STD_Types.h" 1



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
# 2 "HAL/LCD/lcd.c" 2
# 1 "HAL/LCD/../../Service/Bit_Math.h" 1
# 3 "HAL/LCD/lcd.c" 2
# 1 "HAL/LCD/../../MCL/GPIO/gpio_interface.h" 1



# 1 "HAL/LCD/../../MCL/GPIO/../../Service/STD_Types.h" 1
# 5 "HAL/LCD/../../MCL/GPIO/gpio_interface.h" 2
# 1 "HAL/LCD/../../MCL/GPIO/gpio_registers.h" 1
# 26 "HAL/LCD/../../MCL/GPIO/gpio_registers.h"
typedef enum
{
    PIN_LOW = 0,
    PIN_HIGH = 1
} GPIO_PINStatus;

typedef unsigned char GPIO_PortStatus;
# 6 "HAL/LCD/../../MCL/GPIO/gpio_interface.h" 2
# 27 "HAL/LCD/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPinDirection(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Direction);
# 38 "HAL/LCD/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPortDirection(uint8_h uint8Port, uint8_h uint8Direction);

GPIO_PINStatus GPIO_GetPinStatus(uint8_h uint8Port, uint8_h uint8Pin);

GPIO_PortStatus GPIO_GetPortStatus(uint8_h uint8Port);

STD_ReturnType GPIO_PinToggle(uint8_h uint8Port, uint8_h uint8Pin);
STD_ReturnType GPIO_SetPinValue(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Value);
STD_ReturnType GPIO_SetPortValue(uint8_h uint8Port, uint8_h uint8Value);
# 4 "HAL/LCD/lcd.c" 2
# 1 "HAL/LCD/lcd_interface.h" 1
# 25 "HAL/LCD/lcd_interface.h"
typedef enum
{
    LCD_MODE_4BIT = 0,
    LCD_MODE_8BIT = 1
} LCD_ModeType;
# 65 "HAL/LCD/lcd_interface.h"
typedef struct
{
    LCD_ModeType mode;
    uint8_h dataPort;
    uint8_h dataStartPin;
    uint8_h controlPort;
    uint8_h rsPin;
    uint8_h rwPin;
    uint8_h enPin;
} LCD_ConfigType;
# 87 "HAL/LCD/lcd_interface.h"
STD_ReturnType LCD_Init(const LCD_ConfigType *addConfig);







STD_ReturnType LCD_SendCommand(const LCD_ConfigType *addConfig, uint8_h command);







STD_ReturnType LCD_WriteChar(const LCD_ConfigType *addConfig, uint8_h character);







STD_ReturnType LCD_WriteString(const LCD_ConfigType *addConfig, const uint8_h *pString);







STD_ReturnType LCD_WriteNumber(const LCD_ConfigType *addConfig, sint32 number);
# 128 "HAL/LCD/lcd_interface.h"
STD_ReturnType LCD_SetCursor(const LCD_ConfigType *addConfig, uint8_h row, uint8_h column);






STD_ReturnType LCD_Clear(const LCD_ConfigType *addConfig);
# 144 "HAL/LCD/lcd_interface.h"
STD_ReturnType LCD_CreateCustomChar(const LCD_ConfigType *addConfig,
                                    uint8_h location, const uint8_h *pPattern);
# 5 "HAL/LCD/lcd.c" 2
# 34 "HAL/LCD/lcd.c"
STD_ReturnType LCD_Init(const LCD_ConfigType *addConfig)
{
# 56 "HAL/LCD/lcd.c"
    return E_NOK;
}


STD_ReturnType LCD_SendCommand(const LCD_ConfigType *addConfig, uint8_h command)
{
# 70 "HAL/LCD/lcd.c"
    return E_NOK;
}


STD_ReturnType LCD_WriteChar(const LCD_ConfigType *addConfig, uint8_h character)
{







    return E_NOK;
}


STD_ReturnType LCD_WriteString(const LCD_ConfigType *addConfig, const uint8_h *pString)
{





    return E_NOK;
}


STD_ReturnType LCD_WriteNumber(const LCD_ConfigType *addConfig, sint32 number)
{
# 109 "HAL/LCD/lcd.c"
    return E_NOK;
}


STD_ReturnType LCD_SetCursor(const LCD_ConfigType *addConfig, uint8_h row, uint8_h column)
{
# 124 "HAL/LCD/lcd.c"
    return E_NOK;
}


STD_ReturnType LCD_Clear(const LCD_ConfigType *addConfig)
{






    return E_NOK;
}


STD_ReturnType LCD_CreateCustomChar(const LCD_ConfigType *addConfig,
                                    uint8_h location, const uint8_h *pPattern)
{
# 152 "HAL/LCD/lcd.c"
    return E_NOK;
}
