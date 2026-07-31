# 1 "LOGIC/elevator_io.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "LOGIC/elevator_io.c"
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdint.h" 1 3 4
# 9 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdint.h" 3 4
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 1 3 4
# 125 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4

# 125 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef signed int int8_t __attribute__((__mode__(__QI__)));
typedef unsigned int uint8_t __attribute__((__mode__(__QI__)));
typedef signed int int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int uint16_t __attribute__ ((__mode__ (__HI__)));
typedef signed int int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int uint32_t __attribute__ ((__mode__ (__SI__)));

typedef signed int int64_t __attribute__((__mode__(__DI__)));
typedef unsigned int uint64_t __attribute__((__mode__(__DI__)));
# 146 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 163 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int8_t int_least8_t;




typedef uint8_t uint_least8_t;




typedef int16_t int_least16_t;




typedef uint16_t uint_least16_t;




typedef int32_t int_least32_t;




typedef uint32_t uint_least32_t;







typedef int64_t int_least64_t;






typedef uint64_t uint_least64_t;
# 217 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int8_t int_fast8_t;




typedef uint8_t uint_fast8_t;




typedef int16_t int_fast16_t;




typedef uint16_t uint_fast16_t;




typedef int32_t int_fast32_t;




typedef uint32_t uint_fast32_t;







typedef int64_t int_fast64_t;






typedef uint64_t uint_fast64_t;
# 277 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\stdint.h" 3 4
typedef int64_t intmax_t;




typedef uint64_t uintmax_t;
# 10 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdint.h" 2 3 4
# 2 "LOGIC/elevator_io.c" 2
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 1 3
# 99 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 3
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\sfr_defs.h" 1 3
# 126 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\sfr_defs.h" 3
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\inttypes.h" 1 3
# 77 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\inttypes.h" 3
typedef int32_t int_farptr_t;



typedef uint32_t uint_farptr_t;
# 127 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\sfr_defs.h" 2 3
# 100 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3
# 244 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 3
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\iom32.h" 1 3
# 720 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\iom32.h" 3
       
# 721 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\iom32.h" 3

       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
# 245 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3
# 703 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 3
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\portpins.h" 1 3
# 704 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3

# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\common.h" 1 3
# 706 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3

# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\version.h" 1 3
# 708 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3






# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\fuse.h" 1 3
# 248 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\fuse.h" 3
typedef struct
{
    unsigned char low;
    unsigned char high;
} __fuse_t;
# 715 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3


# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\lock.h" 1 3
# 718 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 2 3
# 3 "LOGIC/elevator_io.c" 2
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
# 4 "LOGIC/elevator_io.c" 2
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
# 5 "LOGIC/elevator_io.c" 2
# 1 "LOGIC/../MCL/UART/uart_interface.h" 1



# 1 "LOGIC/../MCL/UART/../../Service/STD_Types.h" 1
# 5 "LOGIC/../MCL/UART/uart_interface.h" 2
# 1 "LOGIC/../MCL/UART/uart_registers.h" 1
# 6 "LOGIC/../MCL/UART/uart_interface.h" 2
# 41 "LOGIC/../MCL/UART/uart_interface.h"
typedef enum
{
    UART_DATA_5BITS = 0,
    UART_DATA_6BITS = 1,
    UART_DATA_7BITS = 2,
    UART_DATA_8BITS = 3,
    UART_DATA_9BITS = 7
} UART_DataSizeType;





typedef enum
{
    UART_PARITY_NONE = 0,
    UART_PARITY_EVEN = 2,
    UART_PARITY_ODD = 3
} UART_ParityType;





typedef enum
{
    UART_STOP_1BIT = 0,
    UART_STOP_2BIT = 1
} UART_StopBitType;
# 79 "LOGIC/../MCL/UART/uart_interface.h"
typedef struct
{
    uint32_h baudRate;
    UART_DataSizeType dataSize;
    UART_ParityType parity;
    UART_StopBitType stopBits;
} UART_ConfigType;






typedef void (*UART_RxCallBackType)(uint8_h receivedByte);
# 105 "LOGIC/../MCL/UART/uart_interface.h"
STD_ReturnType UART_Init(const UART_ConfigType *addConfig);





STD_ReturnType UART_DeInit(void);







STD_ReturnType UART_SendByte(uint8_h uint8Data);







STD_ReturnType UART_ReceiveByte(uint8_h *puint8Data);







STD_ReturnType UART_ReceiveByteNonBlocking(uint8_h *puint8Data);






STD_ReturnType UART_SendString(const uint8_h *pString);
# 152 "LOGIC/../MCL/UART/uart_interface.h"
STD_ReturnType UART_ReceiveString(uint8_h *buffer, uint16_h maxLength, uint8_h terminator);







STD_ReturnType UART_SetRxCallBack(UART_RxCallBackType callBack);
# 6 "LOGIC/elevator_io.c" 2
# 1 "LOGIC/../MCL/ADC/adc_interface.h" 1



# 1 "LOGIC/../MCL/ADC/../../Service/STD_Types.h" 1
# 5 "LOGIC/../MCL/ADC/adc_interface.h" 2
# 1 "LOGIC/../MCL/ADC/adc_registers.h" 1
# 6 "LOGIC/../MCL/ADC/adc_interface.h" 2
# 38 "LOGIC/../MCL/ADC/adc_interface.h"
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
# 86 "LOGIC/../MCL/ADC/adc_interface.h"
STD_ReturnType ADC_ReadChannelBlocking(uint8_h uint8Channel, uint16_h *puint16Result);
# 7 "LOGIC/elevator_io.c" 2
# 1 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h" 1



# 1 "c:\\nti_microcontroller\\project\\service\\std_types.h" 1
# 5 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h" 2
# 1 "c:\\nti_microcontroller\\project\\mcl\\i2c\\i2c_interface.h" 1



# 1 "c:\\nti_microcontroller\\project\\service\\std_types.h" 1
# 5 "c:\\nti_microcontroller\\project\\mcl\\i2c\\i2c_interface.h" 2
# 1 "c:\\nti_microcontroller\\project\\mcl\\i2c\\i2c_registers.h" 1
# 6 "c:\\nti_microcontroller\\project\\mcl\\i2c\\i2c_interface.h" 2
# 40 "c:\\nti_microcontroller\\project\\mcl\\i2c\\i2c_interface.h"
typedef enum
{
    I2C_NACK = 0,
    I2C_ACK = 1
} I2C_AckType;






typedef struct
{
    uint32_h sclFrequency;
} I2C_MasterConfigType;







typedef struct
{
    uint8_h ownAddress;
    uint8_h enableGeneralCall;
} I2C_SlaveConfigType;
# 78 "c:\\nti_microcontroller\\project\\mcl\\i2c\\i2c_interface.h"
STD_ReturnType I2C_InitMaster(const I2C_MasterConfigType *addConfig);
# 87 "c:\\nti_microcontroller\\project\\mcl\\i2c\\i2c_interface.h"
STD_ReturnType I2C_InitSlave(const I2C_SlaveConfigType *addConfig);





STD_ReturnType I2C_DeInit(void);






STD_ReturnType I2C_Start(void);





STD_ReturnType I2C_Stop(void);







STD_ReturnType I2C_WriteByte(uint8_h uint8Data);






STD_ReturnType I2C_ReadByteWithAck(uint8_h *puint8Data);






STD_ReturnType I2C_ReadByteWithNack(uint8_h *puint8Data);






uint8_h I2C_GetStatus(void);
# 144 "c:\\nti_microcontroller\\project\\mcl\\i2c\\i2c_interface.h"
STD_ReturnType I2C_MasterWrite(uint8_h slaveAddress, const uint8_h *pData, uint16_h length);
# 154 "c:\\nti_microcontroller\\project\\mcl\\i2c\\i2c_interface.h"
STD_ReturnType I2C_MasterRead(uint8_h slaveAddress, uint8_h *pBuffer, uint16_h length);
# 6 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h" 2
# 101 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
typedef struct
{

    uint8_h i2cAddress;
    uint8_h rows;
    uint8_h cols;


    uint8_h initialized;
    uint8_h displayControl;
    uint8_h entryMode;
    uint8_h cursorRow;
    uint8_h cursorCol;
} LCD_Aip31068_HandleType;
# 132 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_Init(LCD_Aip31068_HandleType *handle);
# 141 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_SendCommand(LCD_Aip31068_HandleType *handle, uint8_h command);







STD_ReturnType LCD_Aip31068_WriteChar(LCD_Aip31068_HandleType *handle, uint8_h character);
# 161 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_WriteString(LCD_Aip31068_HandleType *handle, const uint8_h *pString);
# 171 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_WriteStringAt(LCD_Aip31068_HandleType *handle,
                                          uint8_h row, uint8_h column,
                                          const uint8_h *pString);
# 183 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_WriteNumber(LCD_Aip31068_HandleType *handle, sint32 number);
# 193 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_SetCursor(LCD_Aip31068_HandleType *handle,
                                      uint8_h row, uint8_h column);







STD_ReturnType LCD_Aip31068_Clear(LCD_Aip31068_HandleType *handle);






STD_ReturnType LCD_Aip31068_Home(LCD_Aip31068_HandleType *handle);







STD_ReturnType LCD_Aip31068_DisplayOnOff(LCD_Aip31068_HandleType *handle, uint8_h on);







STD_ReturnType LCD_Aip31068_CursorOnOff(LCD_Aip31068_HandleType *handle, uint8_h on);







STD_ReturnType LCD_Aip31068_BlinkOnOff(LCD_Aip31068_HandleType *handle, uint8_h on);
# 242 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_ShiftDisplay(LCD_Aip31068_HandleType *handle, uint8_h toRight);
# 252 "LOGIC/../HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_CreateCustomChar(LCD_Aip31068_HandleType *handle,
                                             uint8_h location, const uint8_h *pPattern);
# 8 "LOGIC/elevator_io.c" 2
# 1 "LOGIC/elevator_io.h" 1
# 50 "LOGIC/elevator_io.h"
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

    IO_BTN_COUNT
} IO_Button_t;

typedef enum {
    IO_SENSOR_OVERLOAD,
    IO_SENSOR_OBSTRUCTION
} IO_Device_t;


void IO_Init(void);
void IO_Update(void);
uint8_h IO_GetButtonEvent(uint8_h id);



uint16_h ADC_Read(uint8_h channel);


void IO_SetLedState(uint8_h ledPin, uint8_h state);
void IO_SetHoistMotor(uint8_h state);
void IO_SetDoorMotor(uint8_h state);


void LCD_ShowStatus(void);
void LCD_ShowFault(void);
void Serial_SendString(const char *str);
void Gong_Play(uint8_h type);
# 9 "LOGIC/elevator_io.c" 2

static uint8_h g_buttonEvents[15u];
static uint8_h g_lastButtonState[15u];


static LCD_Aip31068_HandleType g_lcdHandle = {
    .i2cAddress = 0x27
};


typedef struct {
    uint8_h port;
    uint8_h pin;
} PinConfig_t;


static const PinConfig_t g_inputPins[15u] = {
    { 3, 2 },
    { 3, 3 },
    { 3, 4 },
    { 3, 5 },
    { 3, 6 },
    { 2, 6 },

    { 1, 0 },
    { 1, 1 },
    { 1, 2 },
    { 1, 3 },
    { 1, 4 },
    { 1, 5 },
    { 1, 6 },
    { 1, 7 },

    { 2, 5 }
};

static void IO_DelayMs(uint16_h ms)
{
    volatile uint16_h outer;
    volatile uint16_h inner;

    for (outer = 0u; outer < ms; ++outer)
    {
        for (inner = 0u; inner < 1600u; ++inner)
        {

        }
    }
}


uint16_h ADC_Read(uint8_h channel)
{
    channel &= 0x07;
    
# 63 "LOGIC/elevator_io.c" 3
   (*(volatile uint8_t *)((0x07) + 0x20)) 
# 63 "LOGIC/elevator_io.c"
         = (
# 63 "LOGIC/elevator_io.c" 3
            (*(volatile uint8_t *)((0x07) + 0x20)) 
# 63 "LOGIC/elevator_io.c"
                  & 0xF0) | channel;


    
# 66 "LOGIC/elevator_io.c" 3
   (*(volatile uint8_t *)((0x06) + 0x20)) 
# 66 "LOGIC/elevator_io.c"
          |= (1 << 
# 66 "LOGIC/elevator_io.c" 3
                   6
# 66 "LOGIC/elevator_io.c"
                       );


    while (
# 69 "LOGIC/elevator_io.c" 3
          (*(volatile uint8_t *)((0x06) + 0x20)) 
# 69 "LOGIC/elevator_io.c"
                 & (1 << 
# 69 "LOGIC/elevator_io.c" 3
                         6
# 69 "LOGIC/elevator_io.c"
                             ));

    return 
# 71 "LOGIC/elevator_io.c" 3
          (*(volatile uint16_t *)((0x04) + 0x20))
# 71 "LOGIC/elevator_io.c"
             ;
}

void IO_Init(void)
{
    uint8_h index;


    (void)GPIO_SetPinDirection(3, 0, 0);
    (void)GPIO_SetPinDirection(3, 1, 1);

    UART_ConfigType uartConfig = {
        .baudRate = 9600UL,
        .dataSize = UART_DATA_8BITS,
        .parity = UART_PARITY_NONE,
        .stopBits = UART_STOP_1BIT
    };
    (void)UART_Init(&uartConfig);


    (void)GPIO_SetPinDirection(3, 7, 1);
    (void)GPIO_SetPinValue(3, 7, PIN_LOW);


    (void)GPIO_SetPinDirection(2, 2, 1);
    (void)GPIO_SetPinDirection(2, 3, 1);
    (void)GPIO_SetPinDirection(2, 4, 1);

    (void)GPIO_SetPinValue(2, 2, PIN_LOW);
    (void)GPIO_SetPinValue(2, 3, PIN_LOW);
    (void)GPIO_SetPinValue(2, 4, PIN_LOW);


    (void)GPIO_SetPinDirection(0, 4, 1);
    (void)GPIO_SetPinDirection(0, 5, 1);
    (void)GPIO_SetPinDirection(0, 6, 1);
    (void)GPIO_SetPinDirection(0, 7, 1);

    (void)GPIO_SetPinValue(0, 4, PIN_LOW);
    (void)GPIO_SetPinValue(0, 5, PIN_LOW);
    (void)GPIO_SetPinValue(0, 6, PIN_LOW);
    (void)GPIO_SetPinValue(0, 7, PIN_LOW);


    (void)GPIO_SetPinDirection(0, 0, 0);
    (void)GPIO_SetPinDirection(0, 1, 0);
    (void)GPIO_SetPinDirection(0, 2, 0);
    (void)GPIO_SetPinDirection(0, 3, 0);

    ADC_ConfigType adcConfig = {
        .uint8ReferenceVoltage = 1,
        .uint8Prescaler = 7
    };
    (void)ADC_Init(&adcConfig);


    for (index = 0u; index < 15u; ++index)
    {
        (void)GPIO_SetPinDirection(g_inputPins[index].port, g_inputPins[index].pin, 0);
        (void)GPIO_SetPinValue(g_inputPins[index].port, g_inputPins[index].pin, PIN_HIGH);

        g_buttonEvents[index] = 0u;
        g_lastButtonState[index] = PIN_HIGH;
    }



    (void)LCD_Aip31068_Init(&g_lcdHandle);

}

void IO_Update(void)
{
    uint8_h index;
    uint8_h currentState = PIN_HIGH;

    for (index = 0u; index < 15u; ++index)
    {
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
    if (id >= 15u)
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
            count = 3u; duration = 70u; pause = 70u; break;
    }

    for (uint8_h i = 0u; i < count; ++i)
    {
        (void)GPIO_SetPinValue(3, 7, PIN_HIGH);
        IO_DelayMs(duration);
        (void)GPIO_SetPinValue(3, 7, PIN_LOW);
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
