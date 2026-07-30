# 1 "LOGIC/elevator_io.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "LOGIC/elevator_io.c"
# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdint.h" 1 3 4
# 9 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdint.h" 3 4
# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 1 3 4
# 125 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4

# 125 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef signed int int8_t __attribute__((__mode__(__QI__)));
typedef unsigned int uint8_t __attribute__((__mode__(__QI__)));
typedef signed int int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int uint16_t __attribute__ ((__mode__ (__HI__)));
typedef signed int int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int uint32_t __attribute__ ((__mode__ (__SI__)));

typedef signed int int64_t __attribute__((__mode__(__DI__)));
typedef unsigned int uint64_t __attribute__((__mode__(__DI__)));
# 146 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 163 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int8_t int_least8_t;




typedef uint8_t uint_least8_t;




typedef int16_t int_least16_t;




typedef uint16_t uint_least16_t;




typedef int32_t int_least32_t;




typedef uint32_t uint_least32_t;







typedef int64_t int_least64_t;






typedef uint64_t uint_least64_t;
# 217 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int8_t int_fast8_t;




typedef uint8_t uint_fast8_t;




typedef int16_t int_fast16_t;




typedef uint16_t uint_fast16_t;




typedef int32_t int_fast32_t;




typedef uint32_t uint_fast32_t;







typedef int64_t int_fast64_t;






typedef uint64_t uint_fast64_t;
# 277 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int64_t intmax_t;




typedef uint64_t uintmax_t;
# 10 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdint.h" 2 3 4
# 2 "LOGIC/elevator_io.c" 2
# 1 "LOGIC/../Service/STD_Types.h" 1




# 4 "LOGIC/../Service/STD_Types.h"
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
# 3 "LOGIC/elevator_io.c" 2
# 1 "LOGIC/../MCL/GPIO/gpio_interface.h" 1



# 1 "LOGIC/../MCL/GPIO/../../Service/STD_Types.h" 1
# 5 "LOGIC/../MCL/GPIO/gpio_interface.h" 2
# 1 "LOGIC/../MCL/GPIO/gpio_registers.h" 1
# 26 "LOGIC/../MCL/GPIO/gpio_registers.h"
typedef enum
{
    PIN_LOW = 0,
    PIN_HIGH = 1
} GPIO_PINStatus;

typedef unsigned char GPIO_PortStatus;
# 6 "LOGIC/../MCL/GPIO/gpio_interface.h" 2
# 27 "LOGIC/../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPinDirection(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Direction);
# 38 "LOGIC/../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPortDirection(uint8_h uint8Port, uint8_h uint8Direction);

GPIO_PINStatus GPIO_GetPinStatus(uint8_h uint8Port, uint8_h uint8Pin);

GPIO_PortStatus GPIO_GetPortStatus(uint8_h uint8Port);

STD_ReturnType GPIO_PinToggle(uint8_h uint8Port, uint8_h uint8Pin);
STD_ReturnType GPIO_SetPinValue(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Value);
STD_ReturnType GPIO_SetPortValue(uint8_h uint8Port, uint8_h uint8Value);
# 4 "LOGIC/elevator_io.c" 2
# 1 "LOGIC/../HAL/Keypad/keypad_interface.h" 1



# 1 "LOGIC/../HAL/Keypad/../../Service/STD_Types.h" 1
# 5 "LOGIC/../HAL/Keypad/keypad_interface.h" 2
# 1 "LOGIC/../HAL/Keypad/../../MCL/GPIO/gpio_interface.h" 1
# 6 "LOGIC/../HAL/Keypad/keypad_interface.h" 2
# 42 "LOGIC/../HAL/Keypad/keypad_interface.h"
typedef struct
{
    uint8_h rowPort;
    uint8_h rowStartPin;
    uint8_h colPort;
    uint8_h colStartPin;
    uint8_h keyMap[4][4];
} Keypad_ConfigType;
# 61 "LOGIC/../HAL/Keypad/keypad_interface.h"
STD_ReturnType Keypad_Init(const Keypad_ConfigType *addConfig);
# 71 "LOGIC/../HAL/Keypad/keypad_interface.h"
STD_ReturnType Keypad_GetKey(const Keypad_ConfigType *addConfig, uint8_h *pKey);
# 80 "LOGIC/../HAL/Keypad/keypad_interface.h"
STD_ReturnType Keypad_WaitForKey(const Keypad_ConfigType *addConfig, uint8_h *pKey);
# 5 "LOGIC/elevator_io.c" 2
# 1 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h" 1



# 1 "LOGIC/../HAL/LCD_Hd44780/../../Service/STD_Types.h" 1
# 5 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h" 2
# 1 "LOGIC/../HAL/LCD_Hd44780/../../MCL/GPIO/gpio_interface.h" 1
# 6 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h" 2
# 64 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
typedef enum
{
    LCD_HD44780_BUS_4BIT = 0,
    LCD_HD44780_BUS_8BIT = 1
} LCD_Hd44780_BusType;
# 111 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
typedef struct
{

    LCD_Hd44780_BusType bus;
    uint8_h dataPort;
    uint8_h dataStartPin;
    uint8_h controlPort;
    uint8_h rsPin;
    uint8_h rwPin;
    uint8_h enPin;
    uint8_h useRwPin;
    uint8_h rows;
    uint8_h cols;


    uint8_h initialized;
    uint8_h displayControl;
    uint8_h entryMode;
    uint8_h cursorRow;
    uint8_h cursorCol;
} LCD_Hd44780_HandleType;
# 148 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_Init(LCD_Hd44780_HandleType *handle);
# 157 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_SendCommand(LCD_Hd44780_HandleType *handle, uint8_h command);
# 166 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_WriteChar(LCD_Hd44780_HandleType *handle, uint8_h character);
# 177 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_WriteString(LCD_Hd44780_HandleType *handle, const uint8_h *pString);
# 188 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_WriteStringAt(LCD_Hd44780_HandleType *handle,
                                         uint8_h row, uint8_h column,
                                         const uint8_h *pString);
# 201 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_WriteNumber(LCD_Hd44780_HandleType *handle, sint32 number);
# 211 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_SetCursor(LCD_Hd44780_HandleType *handle,
                                     uint8_h row, uint8_h column);
# 222 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_Clear(LCD_Hd44780_HandleType *handle);






STD_ReturnType LCD_Hd44780_Home(LCD_Hd44780_HandleType *handle);
# 238 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_DisplayOnOff(LCD_Hd44780_HandleType *handle, uint8_h on);







STD_ReturnType LCD_Hd44780_CursorOnOff(LCD_Hd44780_HandleType *handle, uint8_h on);
# 255 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_BlinkOnOff(LCD_Hd44780_HandleType *handle, uint8_h on);
# 264 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_ShiftDisplay(LCD_Hd44780_HandleType *handle, uint8_h toRight);
# 277 "LOGIC/../HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_CreateCustomChar(LCD_Hd44780_HandleType *handle,
                                            uint8_h location, const uint8_h *pPattern);
# 6 "LOGIC/elevator_io.c" 2
# 1 "LOGIC/elevator_io.h" 1
# 10 "LOGIC/elevator_io.h"
void IO_Init(void);
void IO_Update(void);
uint8_t IO_GetButtonEvent(uint8_t id);

void LCD_ShowStatus(void);
void LCD_ShowFault(void);

void Gong_Play(uint8_t type);
# 7 "LOGIC/elevator_io.c" 2







static LCD_Hd44780_HandleType g_lcdHandle = {
    .bus = LCD_HD44780_BUS_4BIT,
    .dataPort = 2,
    .dataStartPin = 4,
    .controlPort = 3,
    .rsPin = 0,
    .rwPin = 0u,
    .enPin = 1,
    .useRwPin = 0u,
    .rows = 2u,
    .cols = 16u,
    .initialized = 0u,
    .displayControl = 0u,
    .entryMode = 0u,
    .cursorRow = 0u,
    .cursorCol = 0u
};

static Keypad_ConfigType g_keypadConfig = {
    .rowPort = 3,
    .rowStartPin = 0,
    .colPort = 2,
    .colStartPin = 0,
    .keyMap = {
        { '1', '2', '3', '4' },
        { '5', '6', '7', '8' },
        { '9', 'A', 'B', 'C' },
        { 'D', '0', 'E', 'F' }
    }
};

static uint8_t g_buttonEvents[16u];

static uint8_t IO_MapKeyToId(uint8_h key)
{
    uint8_t row;
    uint8_t col;
    const uint8_h keyMap[4][4] = {
        { '1', '2', '3', '4' },
        { '5', '6', '7', '8' },
        { '9', 'A', 'B', 'C' },
        { 'D', '0', 'E', 'F' }
    };

    for (row = 0u; row < 4; ++row)
    {
        for (col = 0u; col < 4; ++col)
        {
            if (keyMap[row][col] == key)
            {
                return (uint8_t)(row * 4 + col);
            }
        }
    }

    return 0xFFu;
}

static void IO_DelayMs(uint16_t ms)
{
    volatile uint16_t outer;
    volatile uint16_t inner;

    for (outer = 0u; outer < ms; ++outer)
    {
        for (inner = 0u; inner < 1600u; ++inner)
        {

        }
    }
}

static void IO_LcdPrintLine(uint8_t row, const char *text)
{
    if (g_lcdHandle.initialized == 0u)
    {
        return;
    }

    if (LCD_Hd44780_SetCursor(&g_lcdHandle, row, 0u) != E_OK)
    {
        return;
    }

    (void)LCD_Hd44780_WriteString(&g_lcdHandle, (const uint8_h *)text);
}

void IO_Init(void)
{
    uint8_t index;

    (void)GPIO_SetPinDirection(3, 7, 1);
    (void)GPIO_SetPinValue(3, 7, PIN_LOW);

    (void)Keypad_Init(&g_keypadConfig);

    if (LCD_Hd44780_Init(&g_lcdHandle) == E_OK)
    {
        LCD_Hd44780_Clear(&g_lcdHandle);
        g_lcdHandle.initialized = 1u;
    }

    for (index = 0u; index < 16u; ++index)
    {
        g_buttonEvents[index] = 0u;
    }
}

void IO_Update(void)
{
    uint8_h key;
    uint8_t buttonId;

    if (Keypad_GetKey(&g_keypadConfig, &key) != E_OK)
    {
        return;
    }

    if (key == 0xFF)
    {
        return;
    }

    buttonId = IO_MapKeyToId(key);
    if (buttonId != 0xFFu)
    {
        g_buttonEvents[buttonId] = 1u;
    }
}

uint8_t IO_GetButtonEvent(uint8_t id)
{
    if (id >= 16u)
    {
        return 0u;
    }

    if (g_buttonEvents[id] != 0u)
    {
        g_buttonEvents[id] = 0u;
        return 1u;
    }

    return 0u;
}

void LCD_ShowStatus(void)
{
    if (g_lcdHandle.initialized == 0u)
    {
        return;
    }

    LCD_Hd44780_Clear(&g_lcdHandle);
    IO_LcdPrintLine(0u, "SMART ELEVATOR");
    IO_LcdPrintLine(1u, "STATUS: READY");
}

void LCD_ShowFault(void)
{
    if (g_lcdHandle.initialized == 0u)
    {
        return;
    }

    LCD_Hd44780_Clear(&g_lcdHandle);
    IO_LcdPrintLine(0u, "*** FAULT ***");
    IO_LcdPrintLine(1u, "CHECK SYSTEM");
}

void Gong_Play(uint8_t type)
{
    uint8_t count;
    uint16_t duration;
    uint16_t pause;

    (void)GPIO_SetPinDirection(3, 7, 1);

    switch (type)
    {
        case 1u:
            count = 1u;
            duration = 300u;
            pause = 200u;
            break;

        case 2u:
            count = 2u;
            duration = 100u;
            pause = 100u;
            break;

        default:
            count = 3u;
            duration = 70u;
            pause = 70u;
            break;
    }

    for (uint8_t i = 0u; i < count; ++i)
    {
        (void)GPIO_SetPinValue(3, 7, PIN_HIGH);
        IO_DelayMs(duration);
        (void)GPIO_SetPinValue(3, 7, PIN_LOW);
        IO_DelayMs(pause);
    }
}
