# 1 "LOGIC/elevator_motion.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "LOGIC/elevator_motion.c"
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
# 2 "LOGIC/elevator_motion.c" 2
# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\lib\\gcc\\avr\\7.3.0\\include\\stdbool.h" 1 3 4
# 3 "LOGIC/elevator_motion.c" 2
# 1 "LOGIC/elevator_motion.h" 1





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
# 7 "LOGIC/elevator_motion.h" 2
# 15 "LOGIC/elevator_motion.h"
typedef enum
{
    MOTION_IDLE = 0,
    MOTION_MOVING_UP,
    MOTION_MOVING_DOWN,
    MOTION_DOOR_OPENING,
    MOTION_DOOR_CLOSING,
    MOTION_STOPPED
} Motion_State_t;

typedef enum
{
    DOOR_CLOSED = 0,
    DOOR_OPENED,
    DOOR_OPENING,
    DOOR_CLOSING
} Door_State_t;

void Motion_Init(void);
void Motion_Update(void);

void Motion_GoToFloor(uint8_t floor);
void Motion_Stop(void);

uint16_t Motion_GetPosition(void);
uint8_t Motion_GetFloor(void);

void Door_Open(void);
void Door_Close(void);


void Elevator_Motion_Init(void);
u8 Elevator_GetCurPosition(void);
void Elevator_MoveToFloor(u8 target_floor);
void Elevator_OpenDoor(void);
void Elevator_CloseDoor(void);
void Elevator_StopMotion(void);
# 4 "LOGIC/elevator_motion.c" 2
# 1 "LOGIC/../HAL/DC_Motor/dc_motor.h" 1



# 1 "LOGIC/../HAL/DC_Motor/../../Service/STD_Types.h" 1
# 5 "LOGIC/../HAL/DC_Motor/dc_motor.h" 2
# 1 "LOGIC/../HAL/DC_Motor/../../MCL/GPIO/gpio_interface.h" 1



# 1 "LOGIC/../HAL/DC_Motor/../../MCL/GPIO/../../Service/STD_Types.h" 1
# 5 "LOGIC/../HAL/DC_Motor/../../MCL/GPIO/gpio_interface.h" 2
# 1 "LOGIC/../HAL/DC_Motor/../../MCL/GPIO/gpio_registers.h" 1
# 26 "LOGIC/../HAL/DC_Motor/../../MCL/GPIO/gpio_registers.h"
typedef enum
{
    PIN_LOW = 0,
    PIN_HIGH = 1
} GPIO_PINStatus;

typedef unsigned char GPIO_PortStatus;
# 6 "LOGIC/../HAL/DC_Motor/../../MCL/GPIO/gpio_interface.h" 2
# 27 "LOGIC/../HAL/DC_Motor/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPinDirection(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Direction);
# 38 "LOGIC/../HAL/DC_Motor/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPortDirection(uint8_h uint8Port, uint8_h uint8Direction);

GPIO_PINStatus GPIO_GetPinStatus(uint8_h uint8Port, uint8_h uint8Pin);

GPIO_PortStatus GPIO_GetPortStatus(uint8_h uint8Port);

STD_ReturnType GPIO_PinToggle(uint8_h uint8Port, uint8_h uint8Pin);
STD_ReturnType GPIO_SetPinValue(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Value);
STD_ReturnType GPIO_SetPortValue(uint8_h uint8Port, uint8_h uint8Value);
# 6 "LOGIC/../HAL/DC_Motor/dc_motor.h" 2
# 86 "LOGIC/../HAL/DC_Motor/dc_motor.h"
typedef enum
{
    DC_MOTOR_PWM_NONE = 0,
    DC_MOTOR_PWM_OC0 = 1,
    DC_MOTOR_PWM_OC1A = 2,
    DC_MOTOR_PWM_OC1B = 3,
    DC_MOTOR_PWM_OC2 = 4
} DC_MotorPwmChannelType;






typedef enum
{
    DC_MOTOR_DIR_FORWARD = 0,
    DC_MOTOR_DIR_BACKWARD = 1
} DC_MotorDirectionType;
# 115 "LOGIC/../HAL/DC_Motor/dc_motor.h"
typedef enum
{
    DC_MOTOR_STATE_STOP = 0,
    DC_MOTOR_STATE_FORWARD = 1,
    DC_MOTOR_STATE_BACKWARD = 2,
    DC_MOTOR_STATE_BRAKE = 3
} DC_MotorStateType;
# 143 "LOGIC/../HAL/DC_Motor/dc_motor.h"
typedef struct
{

    uint8_h in1Port; uint8_h in1Pin;
    uint8_h in2Port; uint8_h in2Pin;
    uint8_h enPort; uint8_h enPin;
    DC_MotorPwmChannelType pwmChannel;
    uint8_h invertDirection;


    uint8_h initialized;
    uint8_h speedPercent;
    DC_MotorStateType state;
} DC_MotorHandleType;
# 174 "LOGIC/../HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_Init(DC_MotorHandleType *handle);
# 189 "LOGIC/../HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_SetSpeed(DC_MotorHandleType *handle, uint8_h speedPercent);
# 200 "LOGIC/../HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_Forward(DC_MotorHandleType *handle);






STD_ReturnType DC_Motor_Backward(DC_MotorHandleType *handle);
# 216 "LOGIC/../HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_SetDirection(DC_MotorHandleType *handle, DC_MotorDirectionType dir);
# 225 "LOGIC/../HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_Stop(DC_MotorHandleType *handle);
# 236 "LOGIC/../HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_Brake(DC_MotorHandleType *handle);
# 245 "LOGIC/../HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_GetState(const DC_MotorHandleType *handle, DC_MotorStateType *pState);







STD_ReturnType DC_Motor_GetSpeed(const DC_MotorHandleType *handle, uint8_h *pSpeed);
# 264 "LOGIC/../HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_DeInit(DC_MotorHandleType *handle);
# 5 "LOGIC/elevator_motion.c" 2
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
# 6 "LOGIC/elevator_motion.c" 2

static DC_MotorHandleType g_hoistMotor;
static DC_MotorHandleType g_doorMotor;

static Motion_State_t g_motionState = MOTION_IDLE;
static Door_State_t g_doorState = DOOR_CLOSED;
static uint8_t g_currentFloor = 0u;
static uint16_t g_currentPositionCm = 0u;
static uint8_t g_targetFloor = 0u;
static 
# 15 "LOGIC/elevator_motion.c" 3 4
      _Bool 
# 15 "LOGIC/elevator_motion.c"
           g_targetActive = 
# 15 "LOGIC/elevator_motion.c" 3 4
                            0
# 15 "LOGIC/elevator_motion.c"
                                 ;
static uint16_t g_doorTimerMs = 0u;

static uint16_t Motion_AdcToPositionCm(uint16_t adcValue)
{
    return (uint16_t)(((uint32_t)adcValue * 900u) / 1023u);
}

static uint8_t Motion_PositionToFloor(uint16_t positionCm)
{
    if (positionCm < (300u / 2u))
    {
        return 0u;
    }
    if (positionCm < (300u + 300u / 2u))
    {
        return 1u;
    }
    if (positionCm < (2u * 300u + 300u / 2u))
    {
        return 2u;
    }
    return 3u;
}

static void Motion_StopDoor(void)
{
    (void)DC_Motor_Stop(&g_doorMotor);
    if (g_doorState == DOOR_OPENING)
    {
        g_doorState = DOOR_OPENED;
    }
    else if (g_doorState == DOOR_CLOSING)
    {
        g_doorState = DOOR_CLOSED;
    }
    g_doorTimerMs = 0u;
}

void Motion_Init(void)
{
    ADC_ConfigType adcConfig = {
        .uint8ReferenceVoltage = 1,
        .uint8Prescaler = 7
    };

    g_hoistMotor.in1Port = 1;
    g_hoistMotor.in1Pin = 0;
    g_hoistMotor.in2Port = 1;
    g_hoistMotor.in2Pin = 1;
    g_hoistMotor.enPort = 1;
    g_hoistMotor.enPin = 3;
    g_hoistMotor.pwmChannel = DC_MOTOR_PWM_OC1A;
    g_hoistMotor.invertDirection = 0u;
    g_hoistMotor.initialized = 0u;
    g_hoistMotor.speedPercent = 0u;
    g_hoistMotor.state = DC_MOTOR_STATE_STOP;

    g_doorMotor.in1Port = 1;
    g_doorMotor.in1Pin = 2;
    g_doorMotor.in2Port = 1;
    g_doorMotor.in2Pin = 3;
    g_doorMotor.enPort = 1;
    g_doorMotor.enPin = 4;
    g_doorMotor.pwmChannel = DC_MOTOR_PWM_OC1B;
    g_doorMotor.invertDirection = 0u;
    g_doorMotor.initialized = 0u;
    g_doorMotor.speedPercent = 0u;
    g_doorMotor.state = DC_MOTOR_STATE_STOP;

    (void)ADC_Init(&adcConfig);
    (void)DC_Motor_Init(&g_hoistMotor);
    (void)DC_Motor_Init(&g_doorMotor);
    (void)DC_Motor_SetSpeed(&g_hoistMotor, 0u);
    (void)DC_Motor_SetSpeed(&g_doorMotor, 0u);
    (void)DC_Motor_Stop(&g_hoistMotor);
    (void)DC_Motor_Stop(&g_doorMotor);

    g_motionState = MOTION_IDLE;
    g_doorState = DOOR_CLOSED;
    g_currentFloor = 0u;
    g_currentPositionCm = 0u;
    g_targetFloor = 0u;
    g_targetActive = 
# 98 "LOGIC/elevator_motion.c" 3 4
                    0
# 98 "LOGIC/elevator_motion.c"
                         ;
    g_doorTimerMs = 0u;
}

void Motion_Update(void)
{
    uint16_t adcValue;

    if (ADC_ReadChannelBlocking(0, &adcValue) == E_OK)
    {
        g_currentPositionCm = Motion_AdcToPositionCm(adcValue);
        g_currentFloor = Motion_PositionToFloor(g_currentPositionCm);
    }

    if (g_targetActive && (g_currentFloor == g_targetFloor))
    {
        Motion_Stop();
        g_targetActive = 
# 115 "LOGIC/elevator_motion.c" 3 4
                        0
# 115 "LOGIC/elevator_motion.c"
                             ;
    }

    if (g_doorState == DOOR_OPENING || g_doorState == DOOR_CLOSING)
    {
        g_doorTimerMs++;
        if (g_doorTimerMs >= 200u)
        {
            Motion_StopDoor();
        }
    }
}

void Motion_GoToFloor(uint8_t floor)
{
    if (floor >= 4u)
    {
        return;
    }

    if (floor == g_currentFloor)
    {
        Motion_Stop();
        g_targetActive = 
# 138 "LOGIC/elevator_motion.c" 3 4
                        0
# 138 "LOGIC/elevator_motion.c"
                             ;
        return;
    }

    g_targetFloor = floor;
    g_targetActive = 
# 143 "LOGIC/elevator_motion.c" 3 4
                    1
# 143 "LOGIC/elevator_motion.c"
                        ;
    (void)DC_Motor_SetSpeed(&g_hoistMotor, 70u);

    if (floor > g_currentFloor)
    {
        (void)DC_Motor_Forward(&g_hoistMotor);
        g_motionState = MOTION_MOVING_UP;
    }
    else
    {
        (void)DC_Motor_Backward(&g_hoistMotor);
        g_motionState = MOTION_MOVING_DOWN;
    }
}

void Motion_Stop(void)
{
    (void)DC_Motor_Stop(&g_hoistMotor);
    g_motionState = MOTION_IDLE;
    g_targetActive = 
# 162 "LOGIC/elevator_motion.c" 3 4
                    0
# 162 "LOGIC/elevator_motion.c"
                         ;
}

uint16_t Motion_GetPosition(void)
{
    return g_currentPositionCm;
}

uint8_t Motion_GetFloor(void)
{
    return g_currentFloor;
}

void Door_Open(void)
{
    if (g_doorState == DOOR_OPENED || g_doorState == DOOR_OPENING)
    {
        return;
    }

    (void)DC_Motor_SetSpeed(&g_doorMotor, 40u);
    (void)DC_Motor_Forward(&g_doorMotor);
    g_doorState = DOOR_OPENING;
    g_doorTimerMs = 0u;
}

void Door_Close(void)
{
    if (g_doorState == DOOR_CLOSED || g_doorState == DOOR_CLOSING)
    {
        return;
    }

    (void)DC_Motor_SetSpeed(&g_doorMotor, 40u);
    (void)DC_Motor_Backward(&g_doorMotor);
    g_doorState = DOOR_CLOSING;
    g_doorTimerMs = 0u;
}

void Elevator_Motion_Init(void)
{
    Motion_Init();
}

u8 Elevator_GetCurPosition(void)
{
    return (u8)Motion_GetFloor();
}

void Elevator_MoveToFloor(u8 target_floor)
{
    Motion_GoToFloor((uint8_t)target_floor);
}

void Elevator_OpenDoor(void)
{
    Door_Open();
}

void Elevator_CloseDoor(void)
{
    Door_Close();
}

void Elevator_StopMotion(void)
{
    Motion_Stop();
}
