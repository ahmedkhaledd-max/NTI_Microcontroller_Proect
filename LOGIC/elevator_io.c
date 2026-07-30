#include <stdint.h>
#include "../Service/STD_Types.h"
#include "../MCL/GPIO/gpio_interface.h"
#include "../HAL/Keypad/keypad_interface.h"
#include "../HAL/LCD_Hd44780/lcd_hd44780.h"
#include "elevator_io.h"

#define IO_BUZZER_PORT      GPIO_PORTD
#define IO_BUZZER_PIN       GPIO_PIN7

#define IO_LCD_ROW_STATUS   0u
#define IO_LCD_ROW_FAULT    1u

static LCD_Hd44780_HandleType g_lcdHandle = {
    .bus          = LCD_HD44780_BUS_4BIT,
    .dataPort     = GPIO_PORTC,
    .dataStartPin = GPIO_PIN4,
    .controlPort  = GPIO_PORTD,
    .rsPin        = GPIO_PIN0,
    .rwPin        = 0u,
    .enPin        = GPIO_PIN1,
    .useRwPin     = 0u,
    .rows         = 2u,
    .cols         = 16u,
    .initialized  = 0u,
    .displayControl = 0u,
    .entryMode    = 0u,
    .cursorRow    = 0u,
    .cursorCol    = 0u
};

static Keypad_ConfigType g_keypadConfig = {
    .rowPort      = GPIO_PORTD,
    .rowStartPin  = GPIO_PIN0,
    .colPort      = GPIO_PORTC,
    .colStartPin  = GPIO_PIN0,
    .keyMap       = {
        { '1', '2', '3', '4' },
        { '5', '6', '7', '8' },
        { '9', 'A', 'B', 'C' },
        { 'D', '0', 'E', 'F' }
    }
};

static uint8_t g_buttonEvents[IO_BUTTON_COUNT];

static uint8_t IO_MapKeyToId(uint8_h key)
{
    uint8_t row;
    uint8_t col;
    const uint8_h keyMap[KEYPAD_ROWS][KEYPAD_COLS] = {
        { '1', '2', '3', '4' },
        { '5', '6', '7', '8' },
        { '9', 'A', 'B', 'C' },
        { 'D', '0', 'E', 'F' }
    };

    for (row = 0u; row < KEYPAD_ROWS; ++row)
    {
        for (col = 0u; col < KEYPAD_COLS; ++col)
        {
            if (keyMap[row][col] == key)
            {
                return (uint8_t)(row * KEYPAD_COLS + col);
            }
        }
    }

    return IO_BUTTON_ID_NONE;
}

static void IO_DelayMs(uint16_t ms)
{
    volatile uint16_t outer;
    volatile uint16_t inner;

    for (outer = 0u; outer < ms; ++outer)
    {
        for (inner = 0u; inner < 1600u; ++inner)
        {
            /* Busy wait, approximately 1 ms at 16 MHz. */
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

    (void)GPIO_SetPinDirection(IO_BUZZER_PORT, IO_BUZZER_PIN, GPIO_OUTPUT);
    (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_LOW);

    (void)Keypad_Init(&g_keypadConfig);

    if (LCD_Hd44780_Init(&g_lcdHandle) == E_OK)
    {
        LCD_Hd44780_Clear(&g_lcdHandle);
        g_lcdHandle.initialized = 1u;
    }

    for (index = 0u; index < IO_BUTTON_COUNT; ++index)
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

    if (key == KEYPAD_NO_KEY)
    {
        return;
    }

    buttonId = IO_MapKeyToId(key);
    if (buttonId != IO_BUTTON_ID_NONE)
    {
        g_buttonEvents[buttonId] = 1u;
    }
}

uint8_t IO_GetButtonEvent(uint8_t id)
{
    if (id >= IO_BUTTON_COUNT)
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
    IO_LcdPrintLine(IO_LCD_ROW_STATUS, "SMART ELEVATOR");
    IO_LcdPrintLine(IO_LCD_ROW_FAULT, "STATUS: READY");
}

void LCD_ShowFault(void)
{
    if (g_lcdHandle.initialized == 0u)
    {
        return;
    }

    LCD_Hd44780_Clear(&g_lcdHandle);
    IO_LcdPrintLine(IO_LCD_ROW_STATUS, "*** FAULT ***");
    IO_LcdPrintLine(IO_LCD_ROW_FAULT, "CHECK SYSTEM");
}

void Gong_Play(uint8_t type)
{
    uint8_t count;
    uint16_t duration;
    uint16_t pause;

    (void)GPIO_SetPinDirection(IO_BUZZER_PORT, IO_BUZZER_PIN, GPIO_OUTPUT);

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
        (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_HIGH);
        IO_DelayMs(duration);
        (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_LOW);
        IO_DelayMs(pause);
    }
}
