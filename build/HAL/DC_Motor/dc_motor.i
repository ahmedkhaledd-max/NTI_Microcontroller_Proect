# 1 "HAL/DC_Motor/dc_motor.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HAL/DC_Motor/dc_motor.c"
# 1 "HAL/DC_Motor/../../Service/STD_Types.h" 1



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
# 2 "HAL/DC_Motor/dc_motor.c" 2
# 1 "HAL/DC_Motor/../../Service/Bit_Math.h" 1
# 3 "HAL/DC_Motor/dc_motor.c" 2
# 1 "HAL/DC_Motor/../../MCL/GPIO/gpio_interface.h" 1



# 1 "HAL/DC_Motor/../../MCL/GPIO/../../Service/STD_Types.h" 1
# 5 "HAL/DC_Motor/../../MCL/GPIO/gpio_interface.h" 2
# 1 "HAL/DC_Motor/../../MCL/GPIO/gpio_registers.h" 1
# 26 "HAL/DC_Motor/../../MCL/GPIO/gpio_registers.h"
typedef enum
{
    PIN_LOW = 0,
    PIN_HIGH = 1
} GPIO_PINStatus;

typedef unsigned char GPIO_PortStatus;
# 6 "HAL/DC_Motor/../../MCL/GPIO/gpio_interface.h" 2
# 27 "HAL/DC_Motor/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPinDirection(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Direction);
# 38 "HAL/DC_Motor/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPortDirection(uint8_h uint8Port, uint8_h uint8Direction);

GPIO_PINStatus GPIO_GetPinStatus(uint8_h uint8Port, uint8_h uint8Pin);

GPIO_PortStatus GPIO_GetPortStatus(uint8_h uint8Port);

STD_ReturnType GPIO_PinToggle(uint8_h uint8Port, uint8_h uint8Pin);
STD_ReturnType GPIO_SetPinValue(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Value);
STD_ReturnType GPIO_SetPortValue(uint8_h uint8Port, uint8_h uint8Value);
# 4 "HAL/DC_Motor/dc_motor.c" 2
# 1 "HAL/DC_Motor/../../MCL/Timer/timer_registers.h" 1



# 1 "HAL/DC_Motor/../../MCL/Timer/../../Service/STD_Types.h" 1
# 5 "HAL/DC_Motor/../../MCL/Timer/timer_registers.h" 2
# 5 "HAL/DC_Motor/dc_motor.c" 2
# 1 "HAL/DC_Motor/dc_motor.h" 1
# 86 "HAL/DC_Motor/dc_motor.h"
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
# 115 "HAL/DC_Motor/dc_motor.h"
typedef enum
{
    DC_MOTOR_STATE_STOP = 0,
    DC_MOTOR_STATE_FORWARD = 1,
    DC_MOTOR_STATE_BACKWARD = 2,
    DC_MOTOR_STATE_BRAKE = 3
} DC_MotorStateType;
# 143 "HAL/DC_Motor/dc_motor.h"
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
# 174 "HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_Init(DC_MotorHandleType *handle);
# 189 "HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_SetSpeed(DC_MotorHandleType *handle, uint8_h speedPercent);
# 200 "HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_Forward(DC_MotorHandleType *handle);






STD_ReturnType DC_Motor_Backward(DC_MotorHandleType *handle);
# 216 "HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_SetDirection(DC_MotorHandleType *handle, DC_MotorDirectionType dir);
# 225 "HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_Stop(DC_MotorHandleType *handle);
# 236 "HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_Brake(DC_MotorHandleType *handle);
# 245 "HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_GetState(const DC_MotorHandleType *handle, DC_MotorStateType *pState);







STD_ReturnType DC_Motor_GetSpeed(const DC_MotorHandleType *handle, uint8_h *pSpeed);
# 264 "HAL/DC_Motor/dc_motor.h"
STD_ReturnType DC_Motor_DeInit(DC_MotorHandleType *handle);
# 6 "HAL/DC_Motor/dc_motor.c" 2
# 38 "HAL/DC_Motor/dc_motor.c"
static void DC_Motor_PwmPin(DC_MotorPwmChannelType channel, uint8_h *pPort, uint8_h *pPin)
{
    switch (channel)
    {
        case DC_MOTOR_PWM_OC0: *pPort = 1; *pPin = 3; break;
        case DC_MOTOR_PWM_OC1A: *pPort = 3; *pPin = 5; break;
        case DC_MOTOR_PWM_OC1B: *pPort = 3; *pPin = 4; break;
        case DC_MOTOR_PWM_OC2: *pPort = 3; *pPin = 7; break;
        default: *pPort = 0U; *pPin = 0U; break;
    }
}







static void DC_Motor_PwmTimerSetup(DC_MotorPwmChannelType channel)
{
    switch (channel)
    {
        case DC_MOTOR_PWM_OC0:

            (*(volatile u8 *)0x53) = (uint8_h)((1U << 6) | (1U << 3) |
                                        (1U << 1) | (1U << 0));
            (*(volatile u8 *)0x5C) = 0U;
            break;

        case DC_MOTOR_PWM_OC1A:
        case DC_MOTOR_PWM_OC1B:

            (((*(volatile u8 *)0x4F)) |= (1U << (0)));
            (((*(volatile u8 *)0x4E)) |= (1U << (3)));
            (((*(volatile u8 *)0x4E)) |= (1U << (1)));
            (((*(volatile u8 *)0x4E)) |= (1U << (0)));
            break;

        case DC_MOTOR_PWM_OC2:






            (*(volatile u8 *)0x45) = (uint8_h)((1U << 6) | (1U << 3) |
                                        (1U << 2));
            (*(volatile u8 *)0x43) = 0U;
            break;

        default:

            break;
    }
}


static void DC_Motor_PwmConnect(DC_MotorPwmChannelType channel, uint8_h enable)
{
    switch (channel)
    {
        case DC_MOTOR_PWM_OC0:
            if (enable != 0U) { (((*(volatile u8 *)0x53)) |= (1U << (5))); }
            else { (((*(volatile u8 *)0x53)) &= ~(1U << (5))); }
            break;

        case DC_MOTOR_PWM_OC1A:
            if (enable != 0U) { (((*(volatile u8 *)0x4F)) |= (1U << (7))); }
            else { (((*(volatile u8 *)0x4F)) &= ~(1U << (7))); }
            break;

        case DC_MOTOR_PWM_OC1B:
            if (enable != 0U) { (((*(volatile u8 *)0x4F)) |= (1U << (5))); }
            else { (((*(volatile u8 *)0x4F)) &= ~(1U << (5))); }
            break;

        case DC_MOTOR_PWM_OC2:
            if (enable != 0U) { (((*(volatile u8 *)0x45)) |= (1U << (5))); }
            else { (((*(volatile u8 *)0x45)) &= ~(1U << (5))); }
            break;

        default:
            break;
    }
}


static void DC_Motor_PwmSetDuty(DC_MotorPwmChannelType channel, uint8_h duty)
{
    switch (channel)
    {
        case DC_MOTOR_PWM_OC0: (*(volatile u8 *)0x5C) = duty; break;
        case DC_MOTOR_PWM_OC1A: (*(volatile u16 *)0x4A) = (uint16_h)duty; break;
        case DC_MOTOR_PWM_OC1B: (*(volatile u16 *)0x48) = (uint16_h)duty; break;
        case DC_MOTOR_PWM_OC2: (*(volatile u8 *)0x43) = duty; break;
        default: break;
    }
}
# 144 "HAL/DC_Motor/dc_motor.c"
static void DC_Motor_ApplySpeed(const DC_MotorHandleType *handle)
{
    uint8_h local_Port = 0U;
    uint8_h local_Pin = 0U;
    uint8_h local_Duty = 0U;

    if (handle->pwmChannel == DC_MOTOR_PWM_NONE)
    {

        (void)GPIO_SetPinValue(handle->enPort, handle->enPin,
                               (handle->speedPercent > 0U) ? PIN_HIGH : PIN_LOW);
        return;
    }

    DC_Motor_PwmPin(handle->pwmChannel, &local_Port, &local_Pin);

    if (handle->speedPercent == 0U)
    {
        DC_Motor_PwmConnect(handle->pwmChannel, 0U);
        (void)GPIO_SetPinValue(local_Port, local_Pin, PIN_LOW);
        return;
    }


    local_Duty = (uint8_h)(((uint16_h)handle->speedPercent * 255U) / 100U);

    DC_Motor_PwmSetDuty(handle->pwmChannel, local_Duty);
    DC_Motor_PwmConnect(handle->pwmChannel, 1U);
}


static void DC_Motor_ApplyState(DC_MotorHandleType *handle, DC_MotorStateType state)
{
    uint8_h local_In1 = PIN_LOW;
    uint8_h local_In2 = PIN_LOW;

    switch (state)
    {
        case DC_MOTOR_STATE_FORWARD: local_In1 = PIN_HIGH; local_In2 = PIN_LOW; break;
        case DC_MOTOR_STATE_BACKWARD: local_In1 = PIN_LOW; local_In2 = PIN_HIGH; break;
        case DC_MOTOR_STATE_BRAKE: local_In1 = PIN_HIGH; local_In2 = PIN_HIGH; break;
        case DC_MOTOR_STATE_STOP:
        default: local_In1 = PIN_LOW; local_In2 = PIN_LOW; break;
    }





    if ((handle->invertDirection != 0U) &&
        ((state == DC_MOTOR_STATE_FORWARD) || (state == DC_MOTOR_STATE_BACKWARD)))
    {
        uint8_h local_Swap = local_In1;
        local_In1 = local_In2;
        local_In2 = local_Swap;
    }

    (void)GPIO_SetPinValue(handle->in1Port, handle->in1Pin, local_In1);
    (void)GPIO_SetPinValue(handle->in2Port, handle->in2Pin, local_In2);

    handle->state = state;
}






STD_ReturnType DC_Motor_Init(DC_MotorHandleType *handle)
{
    uint8_h local_Port = 0U;
    uint8_h local_Pin = 0U;


    if (handle == ((void *)0))
    {
        return E_NOK;
    }

    if ((handle->in1Port >= 4) || (handle->in2Port >= 4))
    {
        return E_NOK;
    }

    if (handle->pwmChannel > DC_MOTOR_PWM_OC2)
    {
        return E_NOK;
    }


    (void)GPIO_SetPinDirection(handle->in1Port, handle->in1Pin, 1);
    (void)GPIO_SetPinDirection(handle->in2Port, handle->in2Pin, 1);
    (void)GPIO_SetPinValue(handle->in1Port, handle->in1Pin, PIN_LOW);
    (void)GPIO_SetPinValue(handle->in2Port, handle->in2Pin, PIN_LOW);


    if (handle->pwmChannel == DC_MOTOR_PWM_NONE)
    {

        if (handle->enPort >= 4)
        {
            return E_NOK;
        }

        (void)GPIO_SetPinDirection(handle->enPort, handle->enPin, 1);
        (void)GPIO_SetPinValue(handle->enPort, handle->enPin, PIN_LOW);
    }
    else
    {




        DC_Motor_PwmPin(handle->pwmChannel, &local_Port, &local_Pin);
        (void)GPIO_SetPinDirection(local_Port, local_Pin, 1);
        (void)GPIO_SetPinValue(local_Port, local_Pin, PIN_LOW);

        DC_Motor_PwmTimerSetup(handle->pwmChannel);
        DC_Motor_PwmConnect(handle->pwmChannel, 0U);
    }


    handle->speedPercent = 0U;
    handle->initialized = 1U;
    DC_Motor_ApplyState(handle, DC_MOTOR_STATE_STOP);
    DC_Motor_ApplySpeed(handle);

    return E_OK;
}


STD_ReturnType DC_Motor_SetSpeed(DC_MotorHandleType *handle, uint8_h speedPercent)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    if (speedPercent > 100U)
    {
        speedPercent = 100U;
    }

    handle->speedPercent = speedPercent;


    DC_Motor_ApplySpeed(handle);

    return E_OK;
}


STD_ReturnType DC_Motor_Forward(DC_MotorHandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    DC_Motor_ApplyState(handle, DC_MOTOR_STATE_FORWARD);


    DC_Motor_ApplySpeed(handle);

    return E_OK;
}


STD_ReturnType DC_Motor_Backward(DC_MotorHandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    DC_Motor_ApplyState(handle, DC_MOTOR_STATE_BACKWARD);


    DC_Motor_ApplySpeed(handle);

    return E_OK;
}


STD_ReturnType DC_Motor_SetDirection(DC_MotorHandleType *handle, DC_MotorDirectionType dir)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }

    if (dir > DC_MOTOR_DIR_BACKWARD)
    {
        return E_NOK;
    }


    return (dir == DC_MOTOR_DIR_FORWARD) ? DC_Motor_Forward(handle) : DC_Motor_Backward(handle);
}


STD_ReturnType DC_Motor_Stop(DC_MotorHandleType *handle)
{
    uint8_h local_Port = 0U;
    uint8_h local_Pin = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    DC_Motor_ApplyState(handle, DC_MOTOR_STATE_STOP);





    if (handle->pwmChannel == DC_MOTOR_PWM_NONE)
    {
        (void)GPIO_SetPinValue(handle->enPort, handle->enPin, PIN_LOW);
    }
    else
    {
        DC_Motor_PwmPin(handle->pwmChannel, &local_Port, &local_Pin);
        DC_Motor_PwmConnect(handle->pwmChannel, 0U);
        (void)GPIO_SetPinValue(local_Port, local_Pin, PIN_LOW);
    }

    return E_OK;
}


STD_ReturnType DC_Motor_Brake(DC_MotorHandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }





    DC_Motor_ApplyState(handle, DC_MOTOR_STATE_BRAKE);





    if (handle->pwmChannel == DC_MOTOR_PWM_NONE)
    {
        (void)GPIO_SetPinValue(handle->enPort, handle->enPin, PIN_HIGH);
    }
    else
    {
        DC_Motor_PwmSetDuty(handle->pwmChannel, 255U);
        DC_Motor_PwmConnect(handle->pwmChannel, 1U);
    }

    return E_OK;
}


STD_ReturnType DC_Motor_GetState(const DC_MotorHandleType *handle, DC_MotorStateType *pState)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U) || (pState == ((void *)0)))
    {
        return E_NOK;
    }


    *pState = handle->state;

    return E_OK;
}


STD_ReturnType DC_Motor_GetSpeed(const DC_MotorHandleType *handle, uint8_h *pSpeed)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U) || (pSpeed == ((void *)0)))
    {
        return E_NOK;
    }


    *pSpeed = handle->speedPercent;

    return E_OK;
}


STD_ReturnType DC_Motor_DeInit(DC_MotorHandleType *handle)
{
    uint8_h local_Port = 0U;
    uint8_h local_Pin = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    (void)DC_Motor_Stop(handle);






    if (handle->pwmChannel != DC_MOTOR_PWM_NONE)
    {
        DC_Motor_PwmPin(handle->pwmChannel, &local_Port, &local_Pin);
        DC_Motor_PwmConnect(handle->pwmChannel, 0U);
        DC_Motor_PwmSetDuty(handle->pwmChannel, 0U);
        (void)GPIO_SetPinValue(local_Port, local_Pin, PIN_LOW);
    }


    handle->speedPercent = 0U;
    handle->initialized = 0U;

    return E_OK;
}
