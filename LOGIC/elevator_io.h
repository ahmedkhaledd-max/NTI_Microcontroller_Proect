#ifndef ELEVATOR_IO_H
#define ELEVATOR_IO_H

#include <stdint.h>
#include "../Service/STD_Types.h"
#include "../MCL/GPIO/gpio_interface.h"

/* --- تعريفات الأزرار والمفتاح --- */
#define IO_BUTTON_COUNT      15u
#define IO_BUTTON_ID_NONE    0xFFu

/* --- تعريفات الـ Buzzer --- */
#define IO_BUZZER_PORT       GPIO_PORTD
#define IO_BUZZER_PIN        GPIO_PIN7

/* --- تعريفات الـ LEDs --- */
#define LED_UP_PORT          GPIO_PORTC
#define LED_UP_PIN           GPIO_PIN2

#define LED_DOWN_PORT        GPIO_PORTC
#define LED_DOWN_PIN         GPIO_PIN3

#define LED_OVERLOAD_PORT    GPIO_PORTC
#define LED_OVERLOAD_PIN     GPIO_PIN4

/* --- تعريفات محرك المصعد والأبواب (L298 Driver) --- */
#define L298_PORT            GPIO_PORTA
#define HOIST_IN1_PIN        GPIO_PIN4
#define HOIST_IN2_PIN        GPIO_PIN5
#define DOOR_IN3_PIN         GPIO_PIN6
#define DOOR_IN4_PIN         GPIO_PIN7

/* --- تعريفات الـ LCD عبر I2C (Aip31068 / PC0-PC1) --- */
#define LCD_I2C_PORT         GPIO_PORTC
#define LCD_SCL_PIN          GPIO_PIN0
#define LCD_SDA_PIN          GPIO_PIN1

/* --- تعريفات الـ Serial Terminal (UART / PD0-PD1) --- */
#define UART_PORT            GPIO_PORTD
#define UART_RX_PIN          GPIO_PIN0
#define UART_TX_PIN          GPIO_PIN1

/* --- معرفات الأزرار (Button IDs) --- */
typedef enum {
    IO_BTN_CAR_CALL_G = 0,
    IO_BTN_CAR_CALL_1,
    IO_BTN_CAR_CALL_2,
    IO_BTN_CAR_CALL_3,

    IO_BTN_HALL_UP_G,
    IO_BTN_HALL_UP_1,
    IO_BTN_HALL_DOWN_1,
    IO_BTN_HALL_UP_2,
    IO_BTN_HALL_DOWN_2,
    IO_BTN_HALL_DOWN_3,

    IO_BTN_DOOR_OPEN,
    IO_BTN_DOOR_CLOSE,
    IO_BTN_EMERG_ALARM,
    
    IO_BTN_COUNT /* عدد العناصر الكلي */
} IO_Button_t;

typedef enum {
    IO_SENSOR_OVERLOAD,
    IO_SENSOR_OBSTRUCTION
} IO_Device_t;

/* --- الدوال الأساسية للـ IO --- */
void IO_Init(void);
void IO_Update(void);
uint8_h IO_GetButtonEvent(uint8_h id);

/* --- دوال التحكم في الـ LEDs والمحركات --- */
void IO_SetLedState(uint8_h ledPin, uint8_h state);
void IO_SetHoistMotor(uint8_h state);
void IO_SetDoorMotor(uint8_h state);

/* --- دوال الـ LCD والإنذار والـ Serial --- */
void LCD_ShowStatus(void);
void LCD_ShowFault(void);
void Serial_SendString(const char *str);
void Gong_Play(uint8_h type);

#endif 