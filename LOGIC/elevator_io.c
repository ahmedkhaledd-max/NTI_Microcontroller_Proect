#include <stdint.h>
#include "../Service/STD_Types.h"
#include "../MCL/GPIO/gpio_interface.h"
#include "../MCL/UART/uart_interface.h"
#include "../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
#include "elevator_io.h"

static uint8_h g_buttonEvents[IO_BUTTON_COUNT];
static uint8_h g_lastButtonState[IO_BUTTON_COUNT];

#if defined(HAL_LCD_AIP31068_I2C_H) || defined(LCD_AIP31068_I2C_H)
static LCD_Aip31068_HandleType g_lcdHandle = {
    .i2cAddress = 0x27
};
#endif

typedef struct {
    uint8_h port;
    uint8_h pin;
} PinConfig_t;

/* خريطة توصيل الأزرار */
static const PinConfig_t g_inputPins[IO_BUTTON_COUNT] = {
    { GPIO_PORTD, GPIO_PIN2 }, /* Hall Up G    */
    { GPIO_PORTD, GPIO_PIN3 }, /* Hall Up 1    */
    { GPIO_PORTD, GPIO_PIN4 }, /* Hall Down 1  */
    { GPIO_PORTD, GPIO_PIN5 }, /* Hall Up 2    */
    { GPIO_PORTD, GPIO_PIN6 }, /* Hall Down 2  */
    { GPIO_PORTC, GPIO_PIN6 }, /* Hall Down 3  */

    { GPIO_PORTB, GPIO_PIN0 }, /* Car Call G   */
    { GPIO_PORTB, GPIO_PIN1 }, /* Car Call 1   */
    { GPIO_PORTB, GPIO_PIN2 }, /* Car Call 2   */
    { GPIO_PORTB, GPIO_PIN3 }, /* Car Call 3   */
    { GPIO_PORTB, GPIO_PIN4 }, /* Door Open    */
    { GPIO_PORTB, GPIO_PIN5 }, /* Door Close   */
    { GPIO_PORTB, GPIO_PIN6 }, /* Emerg Alarm  */
    { GPIO_PORTB, GPIO_PIN7 }, /* Safety Edge  */

    { GPIO_PORTC, GPIO_PIN5 }  /* Emerg Stop   */
};

static void IO_DelayMs(uint16_h ms)
{
    volatile uint16_h outer;
    volatile uint16_h inner;

    for (outer = 0u; outer < ms; ++outer)
    {
        for (inner = 0u; inner < 1600u; ++inner)
        {
            /* Delay 1 ms at 16 MHz */
        }
    }
}

void IO_Init(void)
{
    uint8_h index;

    /* 1. UART Init */
    (void)GPIO_SetPinDirection(UART_PORT, UART_RX_PIN, GPIO_INPUT);
    (void)GPIO_SetPinDirection(UART_PORT, UART_TX_PIN, GPIO_OUTPUT);

    UART_ConfigType uartConfig = {
        .baudRate = UART_BAUD_9600,
        .dataSize = UART_DATA_8BITS,
        .parity   = UART_PARITY_NONE,
        .stopBits = UART_STOP_1BIT
    };
    (void)UART_Init(&uartConfig);

    /* 2. Buzzer Init */
    (void)GPIO_SetPinDirection(IO_BUZZER_PORT, IO_BUZZER_PIN, GPIO_OUTPUT);
    (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_LOW);

    /* 3. LEDs Init */
    (void)GPIO_SetPinDirection(GPIO_PORTC, LED_UP_PIN, GPIO_OUTPUT);
    (void)GPIO_SetPinDirection(GPIO_PORTC, LED_DOWN_PIN, GPIO_OUTPUT);
    (void)GPIO_SetPinDirection(GPIO_PORTC, LED_OVERLOAD_PIN, GPIO_OUTPUT);
    
    (void)GPIO_SetPinValue(GPIO_PORTC, LED_UP_PIN, PIN_LOW);
    (void)GPIO_SetPinValue(GPIO_PORTC, LED_DOWN_PIN, PIN_LOW);
    (void)GPIO_SetPinValue(GPIO_PORTC, LED_OVERLOAD_PIN, PIN_LOW);

    /* 4. Motors Init */
    (void)GPIO_SetPinDirection(L298_PORT, HOIST_IN1_PIN, GPIO_OUTPUT);
    (void)GPIO_SetPinDirection(L298_PORT, HOIST_IN2_PIN, GPIO_OUTPUT);
    (void)GPIO_SetPinDirection(L298_PORT, DOOR_IN3_PIN, GPIO_OUTPUT);
    (void)GPIO_SetPinDirection(L298_PORT, DOOR_IN4_PIN, GPIO_OUTPUT);

    (void)GPIO_SetPinValue(L298_PORT, HOIST_IN1_PIN, PIN_LOW);
    (void)GPIO_SetPinValue(L298_PORT, HOIST_IN2_PIN, PIN_LOW);
    (void)GPIO_SetPinValue(L298_PORT, DOOR_IN3_PIN, PIN_LOW);
    (void)GPIO_SetPinValue(L298_PORT, DOOR_IN4_PIN, PIN_LOW);

    /* 5. Buttons Init */
    for (index = 0u; index < IO_BUTTON_COUNT; ++index)
    {
        (void)GPIO_SetPinDirection(g_inputPins[index].port, g_inputPins[index].pin, GPIO_INPUT);
        (void)GPIO_SetPinValue(g_inputPins[index].port, g_inputPins[index].pin, PIN_HIGH);
        
        g_buttonEvents[index] = 0u;
        g_lastButtonState[index] = PIN_HIGH;
    }

    /* 6. LCD Init */
#if defined(HAL_LCD_AIP31068_I2C_H) || defined(LCD_AIP31068_I2C_H)
    (void)LCD_Aip31068_Init(&g_lcdHandle);
#endif
}

void IO_Update(void)
{
    uint8_h index;
    uint8_h currentState = PIN_HIGH;

    for (index = 0u; index < IO_BUTTON_COUNT; ++index)
    {
        /* التعديل هنا: استخدام دالة القراءة الصحيحة من الـ Driver */
        currentState = (uint8_h)GPIO_GetPinStatus(g_inputPins[index].port, g_inputPins[index].pin);

        if ((g_lastButtonState[index] == PIN_HIGH) && (currentState == PIN_LOW))
        {
            g_buttonEvents[index] = 1u;
        }

        g_lastButtonState[index] = currentState;
    }
}

uint8_h IO_GetButtonEvent(uint8_h id)
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

void Serial_SendString(const char *str)
{
    (void)UART_SendString((const uint8_h *)str);
}

void Gong_Play(uint8_h type)
{
    uint8_h count;
    uint16_h duration;
    uint16_h pause;

    switch (type)
    {
        case 1u:
            count = 1u; duration = 300u; pause = 200u; break;
        case 2u:
            count = 2u; duration = 100u; pause = 100u; break;
        default:
            count = 3u; duration = 70u;  pause = 70u;  break;
    }

    for (uint8_h i = 0u; i < count; ++i)
    {
        (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_HIGH);
        IO_DelayMs(duration);
        (void)GPIO_SetPinValue(IO_BUZZER_PORT, IO_BUZZER_PIN, PIN_LOW);
        IO_DelayMs(pause);
    }
}

void LCD_ShowStatus(void)
{
    Serial_SendString("STATUS: System Ready\r\n");
}

void LCD_ShowFault(void)
{
    Serial_SendString("FAULT: EMERGENCY FAULT!\r\n");
}