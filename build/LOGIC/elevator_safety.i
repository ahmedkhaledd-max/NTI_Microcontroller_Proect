# 1 "LOGIC/elevator_safety.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "LOGIC/elevator_safety.c"
# 1 "LOGIC/elevator_safety.h" 1



# 1 "LOGIC/../Service/STD_Types.h" 1



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
# 5 "LOGIC/elevator_safety.h" 2
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdbool.h" 1 3 4
# 6 "LOGIC/elevator_safety.h" 2
# 14 "LOGIC/elevator_safety.h"
typedef enum {
    FAULT_NONE = 0,
    FAULT_EMERGENCY_STOP_ID,
    FAULT_DOOR_OBSTRUCTION_ID,
    FAULT_OVERLOAD_ID,
    FAULT_TIMEOUT_ID
} FaultType_t;

void Safety_Init(void);
void Safety_Update(void);
void Emergency_Stop(void);
void Fault_Set(uint8_h id);
void Fault_Clear(uint8_h id);

# 27 "LOGIC/elevator_safety.h" 3 4
_Bool 
# 27 "LOGIC/elevator_safety.h"
    Fault_IsActive(void);

void Elevator_Safety_Init(void);
FaultType_t Elevator_CheckFaults(void);
void Elevator_LogFault(FaultType_t fault);
void Elevator_SendTelemetry(void);
# 2 "LOGIC/elevator_safety.c" 2
# 1 "LOGIC/elevator_motion.h" 1




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
# 6 "LOGIC/elevator_motion.h" 2


# 1 "LOGIC/../MCL/ADC/adc_interface.h" 1



# 1 "LOGIC/../MCL/ADC/../../Service/STD_Types.h" 1
# 5 "LOGIC/../MCL/ADC/adc_interface.h" 2
# 1 "LOGIC/../MCL/ADC/adc_registers.h" 1
# 6 "LOGIC/../MCL/ADC/adc_interface.h" 2
# 38 "LOGIC/../MCL/ADC/adc_interface.h"

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
# 9 "LOGIC/elevator_motion.h" 2





typedef enum {
    MOTION_IDLE = 0,
    MOTION_MOVING_UP,
    MOTION_MOVING_DOWN,
    MOTION_STOPPED,
    MOTION_EMERGENCY
} Motion_State_t;

typedef enum {
    DOOR_CLOSED = 0,

    DOOR_OPENING,

    DOOR_OPENED,

    DOOR_CLOSING
} Door_State_t;


void Motion_Init(void);
void Motion_Update(void);
void Motion_GoToFloor(uint8_h floor);
void Motion_Stop(void);

void Door_Open(void);
void Door_Close(void);


void Elevator_Motion_Init(void);
uint8_h Elevator_GetCurPosition(void);
void Elevator_OpenDoor(void);
void Elevator_CloseDoor(void);
void Elevator_StopMotion(void);
void Elevator_MoveToFloor(uint8_h floor);
# 3 "LOGIC/elevator_safety.c" 2
# 1 "LOGIC/elevator_io.h" 1





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
# 7 "LOGIC/elevator_io.h" 2
# 57 "LOGIC/elevator_io.h"
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
    IO_BTN_SAFETY_EDGE,
    IO_BTN_EMERG_STOP,

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
# 4 "LOGIC/elevator_safety.c" 2
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
STD_ReturnType UART_SendNumber(uint16_h number);
# 153 "LOGIC/../MCL/UART/uart_interface.h"
STD_ReturnType UART_ReceiveString(uint8_h *buffer, uint16_h maxLength, uint8_h terminator);







STD_ReturnType UART_SetRxCallBack(UART_RxCallBackType callBack);
# 5 "LOGIC/elevator_safety.c" 2

static FaultType_t current_fault = FAULT_NONE;

void Elevator_Safety_Init(void)
{
    current_fault = FAULT_NONE;
}

FaultType_t Elevator_CheckFaults(void)
{
    u8 emerg_pin_val = PIN_HIGH;
    u8 door_edge_pin_val = PIN_HIGH;
    uint16_h load_adc_val = 0u;


    emerg_pin_val = (u8)GPIO_GetPinStatus(2, 5);



    if (emerg_pin_val == PIN_LOW)
    {



    }


    load_adc_val = ADC_Read(1u);
    if (load_adc_val > 800u)
    {
        current_fault = FAULT_OVERLOAD_ID;
        return current_fault;
    }


    door_edge_pin_val = (u8)GPIO_GetPinStatus(1, 7);
    if (door_edge_pin_val == PIN_LOW)
    {



    }


    current_fault = FAULT_NONE;
    return current_fault;
}
void Elevator_LogFault(FaultType_t fault)
{
    current_fault = fault;
}

void Elevator_SendTelemetry(void)
{

    uint8_h current_floor = Elevator_GetCurPosition();

    UART_SendString((u8*)"Floor: ");
    UART_SendNumber(current_floor);
    UART_SendString((u8*)"\r\n");
}





void Safety_Init(void)
{
    Elevator_Safety_Init();
}

void Safety_Update(void)
{
    (void)Elevator_CheckFaults();
}

void Emergency_Stop(void)
{
    Elevator_LogFault(FAULT_EMERGENCY_STOP_ID);
}

void Fault_Set(u8 id)
{
    Elevator_LogFault((FaultType_t)id);
}

void Fault_Clear(u8 id)
{
    if (current_fault == (FaultType_t)id)
    {
        current_fault = FAULT_NONE;
    }
}


# 99 "LOGIC/elevator_safety.c" 3 4
_Bool 
# 99 "LOGIC/elevator_safety.c"
    Fault_IsActive(void)
{
    return (current_fault != FAULT_NONE);
}
