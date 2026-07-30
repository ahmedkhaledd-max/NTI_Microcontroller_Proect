# 1 "HAL/Servo_Motor/servo_motor.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HAL/Servo_Motor/servo_motor.c"
# 1 "HAL/Servo_Motor/../../Service/STD_Types.h" 1



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
# 2 "HAL/Servo_Motor/servo_motor.c" 2
# 1 "HAL/Servo_Motor/../../Service/Bit_Math.h" 1
# 3 "HAL/Servo_Motor/servo_motor.c" 2
# 1 "HAL/Servo_Motor/../../MCL/GPIO/gpio_interface.h" 1



# 1 "HAL/Servo_Motor/../../MCL/GPIO/../../Service/STD_Types.h" 1
# 5 "HAL/Servo_Motor/../../MCL/GPIO/gpio_interface.h" 2
# 1 "HAL/Servo_Motor/../../MCL/GPIO/gpio_registers.h" 1
# 26 "HAL/Servo_Motor/../../MCL/GPIO/gpio_registers.h"
typedef enum
{
    PIN_LOW = 0,
    PIN_HIGH = 1
} GPIO_PINStatus;

typedef unsigned char GPIO_PortStatus;
# 6 "HAL/Servo_Motor/../../MCL/GPIO/gpio_interface.h" 2
# 27 "HAL/Servo_Motor/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPinDirection(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Direction);
# 38 "HAL/Servo_Motor/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPortDirection(uint8_h uint8Port, uint8_h uint8Direction);

GPIO_PINStatus GPIO_GetPinStatus(uint8_h uint8Port, uint8_h uint8Pin);

GPIO_PortStatus GPIO_GetPortStatus(uint8_h uint8Port);

STD_ReturnType GPIO_PinToggle(uint8_h uint8Port, uint8_h uint8Pin);
STD_ReturnType GPIO_SetPinValue(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Value);
STD_ReturnType GPIO_SetPortValue(uint8_h uint8Port, uint8_h uint8Value);
# 4 "HAL/Servo_Motor/servo_motor.c" 2
# 1 "HAL/Servo_Motor/../../MCL/Timer/timer_registers.h" 1



# 1 "HAL/Servo_Motor/../../MCL/Timer/../../Service/STD_Types.h" 1
# 5 "HAL/Servo_Motor/../../MCL/Timer/timer_registers.h" 2
# 5 "HAL/Servo_Motor/servo_motor.c" 2
# 1 "HAL/Servo_Motor/servo_motor.h" 1
# 109 "HAL/Servo_Motor/servo_motor.h"
typedef enum
{
    SERVO_MOTOR_DRIVE_TIMER1_OC1A = 0,
    SERVO_MOTOR_DRIVE_TIMER1_OC1B = 1,
    SERVO_MOTOR_DRIVE_SOFTWARE = 2
} Servo_MotorDriveType;
# 135 "HAL/Servo_Motor/servo_motor.h"
typedef struct
{

    Servo_MotorDriveType drive;
    uint8_h port;
    uint8_h pin;
    uint16_h minPulseUs;
    uint16_h maxPulseUs;
    uint8_h maxAngle;


    uint8_h initialized;
    uint8_h running;
    uint8_h currentAngle;
    uint16_h currentPulseUs;
} Servo_MotorHandleType;
# 170 "HAL/Servo_Motor/servo_motor.h"
STD_ReturnType Servo_Motor_Init(Servo_MotorHandleType *handle);
# 183 "HAL/Servo_Motor/servo_motor.h"
STD_ReturnType Servo_Motor_SetAngle(Servo_MotorHandleType *handle, uint8_h angle);
# 197 "HAL/Servo_Motor/servo_motor.h"
STD_ReturnType Servo_Motor_SetPulseUs(Servo_MotorHandleType *handle, uint16_h pulseUs);
# 206 "HAL/Servo_Motor/servo_motor.h"
STD_ReturnType Servo_Motor_GetAngle(const Servo_MotorHandleType *handle, uint8_h *pAngle);
# 217 "HAL/Servo_Motor/servo_motor.h"
STD_ReturnType Servo_Motor_Stop(Servo_MotorHandleType *handle);
# 226 "HAL/Servo_Motor/servo_motor.h"
STD_ReturnType Servo_Motor_Start(Servo_MotorHandleType *handle);
# 249 "HAL/Servo_Motor/servo_motor.h"
STD_ReturnType Servo_Motor_SoftwareRefresh(void);
# 259 "HAL/Servo_Motor/servo_motor.h"
STD_ReturnType Servo_Motor_DeInit(Servo_MotorHandleType *handle);
# 6 "HAL/Servo_Motor/servo_motor.c" 2
# 53 "HAL/Servo_Motor/servo_motor.c"
static Servo_MotorHandleType *Servo_SoftList[8U];


static uint8_h Servo_HardwareCount = 0U;


static uint8_h Servo_Timer1Ready = 0U;
# 77 "HAL/Servo_Motor/servo_motor.c"
static void Servo_DelayUs(uint16_h us)
{
    uint16_h local_Loops = 0U;

    local_Loops = (uint16_h)(((uint32_h)us * ((uint32_h)16000000UL / 1000UL)) / 4000UL);

    if (local_Loops == 0U)
    {
        return;
    }

    __asm__ __volatile__
    (
        "1: sbiw %0, 1" "\n\t"
        "   brne 1b"
        : "+w" (local_Loops)
    );
}


static uint16_h Servo_UsToTicks(uint16_h us)
{
    return (uint16_h)(((uint32_h)us * ((uint32_h)((16000000UL) / 8UL / 1000UL))) / 1000UL);
}





static void Servo_Timer1Setup(void)
{
    if (Servo_Timer1Ready != 0U)
    {
        return;
    }

    (*(volatile u8 *)0x4F) = (uint8_h)(1U << 1);
    (*(volatile u8 *)0x4E) = (uint8_h)((1U << 4) |
                                 (1U << 3) |
                                 (1U << 1));
    (*(volatile u16 *)0x46) = ((uint16_h)((((uint32_h)((16000000UL) / 8UL / 1000UL)) * (uint32_h)20U) - 1UL));
    (*(volatile u16 *)0x4C) = 0U;

    Servo_Timer1Ready = 1U;
}


static uint16_h Servo_AngleToPulse(const Servo_MotorHandleType *handle, uint8_h angle)
{
    uint32_h local_Span = (uint32_h)(handle->maxPulseUs - handle->minPulseUs);

    return (uint16_h)((uint32_h)handle->minPulseUs +
                      (((uint32_h)angle * local_Span) / (uint32_h)handle->maxAngle));
}


static void Servo_ApplyPulse(Servo_MotorHandleType *handle)
{
    switch (handle->drive)
    {
        case SERVO_MOTOR_DRIVE_TIMER1_OC1A:
            (*(volatile u16 *)0x4A) = Servo_UsToTicks(handle->currentPulseUs);
            break;

        case SERVO_MOTOR_DRIVE_TIMER1_OC1B:
            (*(volatile u16 *)0x48) = Servo_UsToTicks(handle->currentPulseUs);
            break;

        case SERVO_MOTOR_DRIVE_SOFTWARE:
        default:

            break;
    }
}






STD_ReturnType Servo_Motor_Init(Servo_MotorHandleType *handle)
{
    uint8_h local_Slot = 0U;
    uint8_h local_Found = 0U;


    if (handle == ((void *)0))
    {
        return E_NOK;
    }

    if (handle->drive > SERVO_MOTOR_DRIVE_SOFTWARE)
    {
        return E_NOK;
    }

    if ((handle->maxAngle == 0U) || (handle->minPulseUs >= handle->maxPulseUs))
    {
        return E_NOK;
    }

    handle->initialized = 0U;
    handle->running = 0U;


    handle->currentAngle = (uint8_h)(handle->maxAngle / 2U);
    handle->currentPulseUs = Servo_AngleToPulse(handle, handle->currentAngle);


    if (handle->drive == SERVO_MOTOR_DRIVE_SOFTWARE)
    {

        if (handle->port >= 4)
        {
            return E_NOK;
        }

        (void)GPIO_SetPinDirection(handle->port, handle->pin, 1);
        (void)GPIO_SetPinValue(handle->port, handle->pin, PIN_LOW);


        for (local_Slot = 0U; local_Slot < 8U; local_Slot++)
        {
            if (Servo_SoftList[local_Slot] == ((void *)0))
            {
                Servo_SoftList[local_Slot] = handle;
                local_Found = 1U;
                break;
            }
        }

        if (local_Found == 0U)
        {
            return E_NOK;
        }
    }
    else
    {

        Servo_Timer1Setup();

        if (handle->drive == SERVO_MOTOR_DRIVE_TIMER1_OC1A)
        {
            (void)GPIO_SetPinDirection(3, 5, 1);
            (((*(volatile u8 *)0x4F)) |= (1U << (7)));
        }
        else
        {
            (void)GPIO_SetPinDirection(3, 4, 1);
            (((*(volatile u8 *)0x4F)) |= (1U << (5)));
        }

        Servo_HardwareCount++;
    }


    handle->initialized = 1U;
    handle->running = 1U;
    Servo_ApplyPulse(handle);

    return E_OK;
}


STD_ReturnType Servo_Motor_SetAngle(Servo_MotorHandleType *handle, uint8_h angle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    if (angle > handle->maxAngle)
    {
        return E_NOK;
    }


    handle->currentAngle = angle;
    handle->currentPulseUs = Servo_AngleToPulse(handle, angle);


    Servo_ApplyPulse(handle);

    return E_OK;
}


STD_ReturnType Servo_Motor_SetPulseUs(Servo_MotorHandleType *handle, uint16_h pulseUs)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }






    if (pulseUs < handle->minPulseUs)
    {
        pulseUs = handle->minPulseUs;
    }
    else if (pulseUs > handle->maxPulseUs)
    {
        pulseUs = handle->maxPulseUs;
    }
    else
    {

    }

    handle->currentPulseUs = pulseUs;


    handle->currentAngle = (uint8_h)((((uint32_h)(pulseUs - handle->minPulseUs) *
                                       (uint32_h)handle->maxAngle) /
                                      (uint32_h)(handle->maxPulseUs - handle->minPulseUs)));


    Servo_ApplyPulse(handle);

    return E_OK;
}


STD_ReturnType Servo_Motor_GetAngle(const Servo_MotorHandleType *handle, uint8_h *pAngle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U) || (pAngle == ((void *)0)))
    {
        return E_NOK;
    }


    *pAngle = handle->currentAngle;

    return E_OK;
}


STD_ReturnType Servo_Motor_Stop(Servo_MotorHandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }





    if (handle->drive == SERVO_MOTOR_DRIVE_TIMER1_OC1A)
    {
        (((*(volatile u8 *)0x4F)) &= ~(1U << (7)));
        (void)GPIO_SetPinValue(3, 5, PIN_LOW);
    }
    else if (handle->drive == SERVO_MOTOR_DRIVE_TIMER1_OC1B)
    {
        (((*(volatile u8 *)0x4F)) &= ~(1U << (5)));
        (void)GPIO_SetPinValue(3, 4, PIN_LOW);
    }
    else
    {

        (void)GPIO_SetPinValue(handle->port, handle->pin, PIN_LOW);
    }


    handle->running = 0U;

    return E_OK;
}


STD_ReturnType Servo_Motor_Start(Servo_MotorHandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    if (handle->drive == SERVO_MOTOR_DRIVE_TIMER1_OC1A)
    {
        (((*(volatile u8 *)0x4F)) |= (1U << (7)));
    }
    else if (handle->drive == SERVO_MOTOR_DRIVE_TIMER1_OC1B)
    {
        (((*(volatile u8 *)0x4F)) |= (1U << (5)));
    }
    else
    {

    }


    handle->running = 1U;
    Servo_ApplyPulse(handle);

    return E_OK;
}


STD_ReturnType Servo_Motor_SoftwareRefresh(void)
{
    uint8_h local_Slot = 0U;
    uint8_h local_Served = 0U;
    Servo_MotorHandleType *local_Servo = ((void *)0);






    for (local_Slot = 0U; local_Slot < 8U; local_Slot++)
    {
        local_Servo = Servo_SoftList[local_Slot];


        if ((local_Servo == ((void *)0)) || (local_Servo->running == 0U))
        {
            continue;
        }


        (void)GPIO_SetPinValue(local_Servo->port, local_Servo->pin, PIN_HIGH);
        Servo_DelayUs(local_Servo->currentPulseUs);
        (void)GPIO_SetPinValue(local_Servo->port, local_Servo->pin, PIN_LOW);

        local_Served++;
    }





    return (local_Served > 0U) ? E_OK : E_NOK;
}


STD_ReturnType Servo_Motor_DeInit(Servo_MotorHandleType *handle)
{
    uint8_h local_Slot = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    (void)Servo_Motor_Stop(handle);

    if (handle->drive == SERVO_MOTOR_DRIVE_SOFTWARE)
    {

        for (local_Slot = 0U; local_Slot < 8U; local_Slot++)
        {
            if (Servo_SoftList[local_Slot] == handle)
            {
                Servo_SoftList[local_Slot] = ((void *)0);
                break;
            }
        }
    }
    else
    {




        if (Servo_HardwareCount > 0U)
        {
            Servo_HardwareCount--;
        }

        if (Servo_HardwareCount == 0U)
        {
            (*(volatile u8 *)0x4F) = 0U;
            (*(volatile u8 *)0x4E) = 0U;
            Servo_Timer1Ready = 0U;
        }
    }


    handle->initialized = 0U;

    return E_OK;
}
