#include <stdint.h>
#include <stdbool.h>
#include "elevator_motion.h"
#include "../HAL/DC_Motor/dc_motor.h"
#include "../MCL/ADC/adc_interface.h"

static DC_MotorHandleType g_hoistMotor;
static DC_MotorHandleType g_doorMotor;

static Motion_State_t g_motionState = MOTION_IDLE;
static Door_State_t g_doorState = DOOR_CLOSED;
static uint8_t g_currentFloor = 0u;
static uint16_t g_currentPositionCm = 0u;
static uint8_t g_targetFloor = 0u;
static bool g_targetActive = false;
static uint16_t g_doorTimerMs = 0u;

static uint16_t Motion_AdcToPositionCm(uint16_t adcValue)
{
    return (uint16_t)(((uint32_t)adcValue * MOTION_POSITION_MAX_CM) / 1023u);
}

static uint8_t Motion_PositionToFloor(uint16_t positionCm)
{
    if (positionCm < (MOTION_POSITION_STEP_CM / 2u))
    {
        return 0u;
    }
    if (positionCm < (MOTION_POSITION_STEP_CM + MOTION_POSITION_STEP_CM / 2u))
    {
        return 1u;
    }
    if (positionCm < (2u * MOTION_POSITION_STEP_CM + MOTION_POSITION_STEP_CM / 2u))
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
        .uint8ReferenceVoltage = ADC_REF_AVCC,
        .uint8Prescaler = ADC_PRESCALER_128
    };

    g_hoistMotor.in1Port = GPIO_PORTB;
    g_hoistMotor.in1Pin = GPIO_PIN0;
    g_hoistMotor.in2Port = GPIO_PORTB;
    g_hoistMotor.in2Pin = GPIO_PIN1;
    g_hoistMotor.enPort = GPIO_PORTB;
    g_hoistMotor.enPin = GPIO_PIN3;
    g_hoistMotor.pwmChannel = DC_MOTOR_PWM_OC1A;
    g_hoistMotor.invertDirection = 0u;
    g_hoistMotor.initialized = 0u;
    g_hoistMotor.speedPercent = 0u;
    g_hoistMotor.state = DC_MOTOR_STATE_STOP;

    g_doorMotor.in1Port = GPIO_PORTB;
    g_doorMotor.in1Pin = GPIO_PIN2;
    g_doorMotor.in2Port = GPIO_PORTB;
    g_doorMotor.in2Pin = GPIO_PIN3;
    g_doorMotor.enPort = GPIO_PORTB;
    g_doorMotor.enPin = GPIO_PIN4;
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
    g_targetActive = false;
    g_doorTimerMs = 0u;
}

void Motion_Update(void)
{
    uint16_t adcValue;

    if (ADC_ReadChannelBlocking(ADC_CHANNEL0, &adcValue) == E_OK)
    {
        g_currentPositionCm = Motion_AdcToPositionCm(adcValue);
        g_currentFloor = Motion_PositionToFloor(g_currentPositionCm);
    }

    if (g_targetActive && (g_currentFloor == g_targetFloor))
    {
        Motion_Stop();
        g_targetActive = false;
    }

    if (g_doorState == DOOR_OPENING || g_doorState == DOOR_CLOSING)
    {
        g_doorTimerMs++;
        if (g_doorTimerMs >= MOTION_DOOR_RUNTIME_MS)
        {
            Motion_StopDoor();
        }
    }
}

void Motion_GoToFloor(uint8_t floor)
{
    if (floor >= MOTION_FLOORS)
    {
        return;
    }

    if (floor == g_currentFloor)
    {
        Motion_Stop();
        g_targetActive = false;
        return;
    }

    g_targetFloor = floor;
    g_targetActive = true;
    (void)DC_Motor_SetSpeed(&g_hoistMotor, MOTION_HOIST_SPEED_PERCENT);

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
    g_targetActive = false;
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

    (void)DC_Motor_SetSpeed(&g_doorMotor, MOTION_DOOR_SPEED_PERCENT);
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

    (void)DC_Motor_SetSpeed(&g_doorMotor, MOTION_DOOR_SPEED_PERCENT);
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
