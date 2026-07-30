# 1 "src/main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/main.c"
# 1 "src/../Service/STD_Types.h" 1



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
# 2 "src/main.c" 2
# 1 "src/../LOGIC/elevator_dispatch.h" 1



# 1 "src/../LOGIC/../Service/STD_Types.h" 1
# 5 "src/../LOGIC/elevator_dispatch.h" 2
# 22 "src/../LOGIC/elevator_dispatch.h"
typedef enum
{
    DIR_STOP = 0,
    DIR_UP,
    DIR_DOWN

} ElevatorDirection_t;




typedef enum
{
    STATE_IDLE = 0,
    STATE_MOVING,
    STATE_DOOR_OPENING,
    STATE_DOOR_OPEN,
    STATE_DOOR_CLOSING,
    STATE_EMERGENCY

} ElevatorState_t;




typedef struct
{
    u8 carCall;
    u8 hallUp;
    u8 hallDown;

} Calls_t;




void Dispatch_Init(void);
void Dispatch_Update(void);

void Call_Register(u8 floor, u8 type);
void Call_Clear(u8 floor);

u8 Dispatch_GetNextFloor(void);




ElevatorDirection_t DSP_NextDirection(
                    const Calls_t *calls,
                    u8 currentFloor,
                    ElevatorDirection_t currentDirection);




void Elevator_Dispatch_Init(void);

void Elevator_AddCall(u8 floor, u8 type);

void Elevator_ClearCall(u8 floor);

u8 Elevator_CalculateNextFloor(
        u8 currentFloor,
        ElevatorDirection_t *direction);
# 3 "src/main.c" 2
# 1 "src/../LOGIC/elevator_motion.h" 1




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
# 6 "src/../LOGIC/elevator_motion.h" 2


# 1 "src/../LOGIC/../MCL/ADC/adc_interface.h" 1



# 1 "src/../LOGIC/../MCL/ADC/../../Service/STD_Types.h" 1
# 5 "src/../LOGIC/../MCL/ADC/adc_interface.h" 2
# 1 "src/../LOGIC/../MCL/ADC/adc_registers.h" 1
# 6 "src/../LOGIC/../MCL/ADC/adc_interface.h" 2
# 38 "src/../LOGIC/../MCL/ADC/adc_interface.h"

# 38 "src/../LOGIC/../MCL/ADC/adc_interface.h"
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
# 86 "src/../LOGIC/../MCL/ADC/adc_interface.h"
STD_ReturnType ADC_ReadChannelBlocking(uint8_h uint8Channel, uint16_h *puint16Result);
# 9 "src/../LOGIC/elevator_motion.h" 2
# 18 "src/../LOGIC/elevator_motion.h"
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
# 4 "src/main.c" 2
# 1 "src/../LOGIC/elevator_safety.h" 1




# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdbool.h" 1 3 4
# 6 "src/../LOGIC/elevator_safety.h" 2
# 14 "src/../LOGIC/elevator_safety.h"
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

# 27 "src/../LOGIC/elevator_safety.h" 3 4
_Bool 
# 27 "src/../LOGIC/elevator_safety.h"
    Fault_IsActive(void);

void Elevator_Safety_Init(void);
FaultType_t Elevator_CheckFaults(void);
void Elevator_LogFault(FaultType_t fault);
void Elevator_SendTelemetry(void);
# 5 "src/main.c" 2
# 1 "LOGIC/elevator_io.h" 1




# 1 "LOGIC/../Service/STD_Types.h" 1
# 6 "LOGIC/elevator_io.h" 2
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
# 44 "LOGIC/elevator_io.h"
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


void IO_SetLedState(uint8_h ledPin, uint8_h state);
void IO_SetHoistMotor(uint8_h state);
void IO_SetDoorMotor(uint8_h state);


void LCD_ShowStatus(void);
void LCD_ShowFault(void);
void Serial_SendString(const char *str);
void Gong_Play(uint8_h type);
# 6 "src/main.c" 2




static void Process_Inputs(void)
{

    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_G)) { Elevator_AddCall(0u, 0u); }
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_1)) { Elevator_AddCall(1u, 0u); }
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_2)) { Elevator_AddCall(2u, 0u); }
    if (IO_GetButtonEvent(IO_BTN_CAR_CALL_3)) { Elevator_AddCall(3u, 0u); }


    if (IO_GetButtonEvent(IO_BTN_HALL_UP_G)) { Elevator_AddCall(0u, 1u); }
    if (IO_GetButtonEvent(IO_BTN_HALL_UP_1)) { Elevator_AddCall(1u, 1u); }
    if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_1)) { Elevator_AddCall(1u, 2u); }
    if (IO_GetButtonEvent(IO_BTN_HALL_UP_2)) { Elevator_AddCall(2u, 1u); }
    if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_2)) { Elevator_AddCall(2u, 2u); }
    if (IO_GetButtonEvent(IO_BTN_HALL_DOWN_3)) { Elevator_AddCall(3u, 2u); }


    if (IO_GetButtonEvent(IO_BTN_DOOR_OPEN)) { Elevator_OpenDoor(); }
    if (IO_GetButtonEvent(IO_BTN_DOOR_CLOSE)) { Elevator_CloseDoor(); }


    if (IO_GetButtonEvent(IO_BTN_EMERG_ALARM)) { Gong_Play(3u); }
}

static void Update_LEDs(ElevatorDirection_t dir, FaultType_t fault)
{
    if (fault != FAULT_NONE)
    {
        (void)GPIO_SetPinValue(2, 4, PIN_HIGH);
        (void)GPIO_SetPinValue(2, 2, PIN_LOW);
        (void)GPIO_SetPinValue(2, 3, PIN_LOW);
    }
    else
    {
        (void)GPIO_SetPinValue(2, 4, PIN_LOW);

        if (dir == DIR_UP)
        {
            (void)GPIO_SetPinValue(2, 2, PIN_HIGH);
            (void)GPIO_SetPinValue(2, 3, PIN_LOW);
        }
        else if (dir == DIR_DOWN)
        {
            (void)GPIO_SetPinValue(2, 2, PIN_LOW);
            (void)GPIO_SetPinValue(2, 3, PIN_HIGH);
        }
        else
        {
            (void)GPIO_SetPinValue(2, 2, PIN_LOW);
            (void)GPIO_SetPinValue(2, 3, PIN_LOW);
        }
    }
}

int main(void)
{
    ElevatorState_t elevator_state = STATE_IDLE;
    ElevatorDirection_t direction = DIR_STOP;
    FaultType_t fault = FAULT_NONE;
    u8 current_floor = 0u;
    u8 target_floor = 0u;
    u16 door_timer = 0u;


    IO_Init();
    Elevator_Dispatch_Init();
    Elevator_Motion_Init();
    Safety_Init();

    LCD_ShowStatus();

    current_floor = Elevator_GetCurPosition();
    target_floor = current_floor;

    while (1)
    {

        IO_Update();
        Motion_Update();
        Safety_Update();
        Process_Inputs();


        fault = Elevator_CheckFaults();
        if (fault != FAULT_NONE)
        {
            Elevator_LogFault(fault);
            Elevator_StopMotion();
            elevator_state = STATE_EMERGENCY;
            LCD_ShowFault();
            Gong_Play(3u);
            Update_LEDs(DIR_STOP, fault);
            Elevator_SendTelemetry();
            continue;
        }
        else if (elevator_state == STATE_EMERGENCY)
        {

            elevator_state = STATE_IDLE;
            LCD_ShowStatus();
        }

        current_floor = Elevator_GetCurPosition();


        switch (elevator_state)
        {
            case STATE_IDLE:
                target_floor = Elevator_CalculateNextFloor(current_floor, &direction);
                Update_LEDs(direction, FAULT_NONE);

                if (target_floor != current_floor)
                {
                    Elevator_MoveToFloor(target_floor);
                    elevator_state = STATE_MOVING;
                }
                break;

            case STATE_MOVING:
                Update_LEDs(direction, FAULT_NONE);
                if (current_floor == target_floor)
                {
                    Elevator_StopMotion();
                    Elevator_ClearCall(current_floor);
                    Gong_Play(1u);
                    Elevator_OpenDoor();
                    door_timer = 0u;
                    elevator_state = STATE_DOOR_OPEN;
                    direction = DIR_STOP;
                    Update_LEDs(direction, FAULT_NONE);
                }
                break;

            case STATE_DOOR_OPEN:
                if (door_timer >= 200u)
                {
                    Elevator_CloseDoor();
                    door_timer = 0u;
                    elevator_state = STATE_DOOR_CLOSING;
                }
                break;

            case STATE_DOOR_CLOSING:
                if (door_timer >= 100u)
                {
                    elevator_state = STATE_IDLE;
                }
                break;

            case STATE_EMERGENCY:
                break;

            default:
                break;
        }

        if ((elevator_state == STATE_DOOR_OPEN) || (elevator_state == STATE_DOOR_CLOSING))
        {
            door_timer++;
        }

        Elevator_SendTelemetry();
    }

    return 0;
}
