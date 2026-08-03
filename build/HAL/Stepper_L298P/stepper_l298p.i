# 1 "HAL/Stepper_L298P/stepper_l298p.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HAL/Stepper_L298P/stepper_l298p.c"
# 1 "HAL/Stepper_L298P/../../Service/STD_Types.h" 1



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
# 2 "HAL/Stepper_L298P/stepper_l298p.c" 2
# 1 "HAL/Stepper_L298P/../../Service/Bit_Math.h" 1
# 3 "HAL/Stepper_L298P/stepper_l298p.c" 2
# 1 "HAL/Stepper_L298P/../../MCL/GPIO/gpio_interface.h" 1



# 1 "c:\\nti_microcontroller\\project\\service\\std_types.h" 1
# 5 "HAL/Stepper_L298P/../../MCL/GPIO/gpio_interface.h" 2
# 1 "HAL/Stepper_L298P/../../MCL/GPIO/gpio_registers.h" 1
# 26 "HAL/Stepper_L298P/../../MCL/GPIO/gpio_registers.h"
typedef enum
{
    PIN_LOW = 0,
    PIN_HIGH = 1
} GPIO_PINStatus;

typedef unsigned char GPIO_PortStatus;
# 6 "HAL/Stepper_L298P/../../MCL/GPIO/gpio_interface.h" 2
# 27 "HAL/Stepper_L298P/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPinDirection(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Direction);
# 38 "HAL/Stepper_L298P/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPortDirection(uint8_h uint8Port, uint8_h uint8Direction);

GPIO_PINStatus GPIO_GetPinStatus(uint8_h uint8Port, uint8_h uint8Pin);

GPIO_PortStatus GPIO_GetPortStatus(uint8_h uint8Port);

STD_ReturnType GPIO_PinToggle(uint8_h uint8Port, uint8_h uint8Pin);
STD_ReturnType GPIO_SetPinValue(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Value);
STD_ReturnType GPIO_SetPortValue(uint8_h uint8Port, uint8_h uint8Value);
# 4 "HAL/Stepper_L298P/stepper_l298p.c" 2
# 1 "HAL/Stepper_L298P/stepper_l298p.h" 1
# 73 "HAL/Stepper_L298P/stepper_l298p.h"
typedef enum
{
    STEPPER_L298P_MODE_WAVE = 0,
    STEPPER_L298P_MODE_FULL = 1,
    STEPPER_L298P_MODE_HALF = 2
} Stepper_L298P_ModeType;







typedef enum
{
    STEPPER_L298P_DIR_CW = 0,
    STEPPER_L298P_DIR_CCW = 1
} Stepper_L298P_DirType;
# 117 "HAL/Stepper_L298P/stepper_l298p.h"
typedef struct
{

    uint8_h in1Port; uint8_h in1Pin;
    uint8_h in2Port; uint8_h in2Pin;
    uint8_h in3Port; uint8_h in3Pin;
    uint8_h in4Port; uint8_h in4Pin;
    uint8_h enAPort; uint8_h enAPin;
    uint8_h enBPort; uint8_h enBPin;
    uint8_h useEnablePins;

    Stepper_L298P_ModeType stepMode;
    uint16_h stepsPerRev;
    uint16_h stepDelayMs;


    uint8_h initialized;
    uint8_h phaseIndex;
    uint8_h energized;
    sint32 position;
} Stepper_L298P_HandleType;
# 152 "HAL/Stepper_L298P/stepper_l298p.h"
STD_ReturnType Stepper_L298P_Init(Stepper_L298P_HandleType *handle);
# 163 "HAL/Stepper_L298P/stepper_l298p.h"
STD_ReturnType Stepper_L298P_SetStepMode(Stepper_L298P_HandleType *handle,
                                         Stepper_L298P_ModeType mode);







STD_ReturnType Stepper_L298P_SetStepDelay(Stepper_L298P_HandleType *handle,
                                          uint16_h stepDelayMs);
# 185 "HAL/Stepper_L298P/stepper_l298p.h"
STD_ReturnType Stepper_L298P_SetSpeedRpm(Stepper_L298P_HandleType *handle, uint16_h rpm);
# 199 "HAL/Stepper_L298P/stepper_l298p.h"
STD_ReturnType Stepper_L298P_Step(Stepper_L298P_HandleType *handle,
                                  uint16_h steps, Stepper_L298P_DirType dir);
# 222 "HAL/Stepper_L298P/stepper_l298p.h"
STD_ReturnType Stepper_L298P_StepOnce(Stepper_L298P_HandleType *handle,
                                      Stepper_L298P_DirType dir);
# 236 "HAL/Stepper_L298P/stepper_l298p.h"
STD_ReturnType Stepper_L298P_RotateAngle(Stepper_L298P_HandleType *handle,
                                         uint16_h degrees, Stepper_L298P_DirType dir);
# 247 "HAL/Stepper_L298P/stepper_l298p.h"
STD_ReturnType Stepper_L298P_Hold(Stepper_L298P_HandleType *handle);
# 258 "HAL/Stepper_L298P/stepper_l298p.h"
STD_ReturnType Stepper_L298P_Release(Stepper_L298P_HandleType *handle);
# 267 "HAL/Stepper_L298P/stepper_l298p.h"
STD_ReturnType Stepper_L298P_GetPosition(const Stepper_L298P_HandleType *handle,
                                         sint32 *pPosition);







STD_ReturnType Stepper_L298P_ResetPosition(Stepper_L298P_HandleType *handle);
# 286 "HAL/Stepper_L298P/stepper_l298p.h"
STD_ReturnType Stepper_L298P_GetStepsPerRev(const Stepper_L298P_HandleType *handle,
                                            uint16_h *pStepsPerRev);
# 5 "HAL/Stepper_L298P/stepper_l298p.c" 2
# 13 "HAL/Stepper_L298P/stepper_l298p.c"
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 1 3
# 44 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\inttypes.h" 1 3
# 37 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\inttypes.h" 3
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
# 38 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\inttypes.h" 2 3
# 77 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\inttypes.h" 3
typedef int32_t int_farptr_t;



typedef uint32_t uint_farptr_t;
# 45 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 2 3
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay_basic.h" 1 3
# 40 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay_basic.h" 3
static __inline__ void _delay_loop_1(uint8_t __count) __attribute__((__always_inline__));
static __inline__ void _delay_loop_2(uint16_t __count) __attribute__((__always_inline__));
# 80 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay_basic.h" 3
void
_delay_loop_1(uint8_t __count)
{
 __asm__ volatile (
  "1: dec %0" "\n\t"
  "brne 1b"
  : "=r" (__count)
  : "0" (__count)
 );
}
# 102 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay_basic.h" 3
void
_delay_loop_2(uint16_t __count)
{
 __asm__ volatile (
  "1: sbiw %0,1" "\n\t"
  "brne 1b"
  : "=w" (__count)
  : "0" (__count)
 );
}
# 46 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 2 3
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 1 3
# 127 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double cos(double __x) __attribute__((__const__));





extern double sin(double __x) __attribute__((__const__));





extern double tan(double __x) __attribute__((__const__));






extern double fabs(double __x) __attribute__((__const__));






extern double fmod(double __x, double __y) __attribute__((__const__));
# 168 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double modf(double __x, double *__iptr);


extern float modff (float __x, float *__iptr);




extern double sqrt(double __x) __attribute__((__const__));


extern float sqrtf (float) __attribute__((__const__));




extern double cbrt(double __x) __attribute__((__const__));
# 195 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double hypot (double __x, double __y) __attribute__((__const__));







extern double square(double __x) __attribute__((__const__));






extern double floor(double __x) __attribute__((__const__));






extern double ceil(double __x) __attribute__((__const__));
# 235 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double frexp(double __x, int *__pexp);







extern double ldexp(double __x, int __exp) __attribute__((__const__));





extern double exp(double __x) __attribute__((__const__));





extern double cosh(double __x) __attribute__((__const__));





extern double sinh(double __x) __attribute__((__const__));





extern double tanh(double __x) __attribute__((__const__));







extern double acos(double __x) __attribute__((__const__));







extern double asin(double __x) __attribute__((__const__));






extern double atan(double __x) __attribute__((__const__));
# 299 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double atan2(double __y, double __x) __attribute__((__const__));





extern double log(double __x) __attribute__((__const__));





extern double log10(double __x) __attribute__((__const__));





extern double pow(double __x, double __y) __attribute__((__const__));






extern int isnan(double __x) __attribute__((__const__));
# 334 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern int isinf(double __x) __attribute__((__const__));






__attribute__((__const__)) static inline int isfinite (double __x)
{
    unsigned char __exp;
    __asm__ (
 "mov	%0, %C1		\n\t"
 "lsl	%0		\n\t"
 "mov	%0, %D1		\n\t"
 "rol	%0		"
 : "=r" (__exp)
 : "r" (__x) );
    return __exp != 0xff;
}






__attribute__((__const__)) static inline double copysign (double __x, double __y)
{
    __asm__ (
 "bst	%D2, 7	\n\t"
 "bld	%D0, 7	"
 : "=r" (__x)
 : "0" (__x), "r" (__y) );
    return __x;
}
# 377 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern int signbit (double __x) __attribute__((__const__));






extern double fdim (double __x, double __y) __attribute__((__const__));
# 393 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double fma (double __x, double __y, double __z) __attribute__((__const__));







extern double fmax (double __x, double __y) __attribute__((__const__));







extern double fmin (double __x, double __y) __attribute__((__const__));






extern double trunc (double __x) __attribute__((__const__));
# 427 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double round (double __x) __attribute__((__const__));
# 440 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern long lround (double __x) __attribute__((__const__));
# 454 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern long lrint (double __x) __attribute__((__const__));
# 47 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 2 3
# 86 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
static __inline__ void _delay_us(double __us) __attribute__((__always_inline__));
static __inline__ void _delay_ms(double __ms) __attribute__((__always_inline__));
# 165 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
void
_delay_ms(double __ms)
{
 double __tmp ;



 uint32_t __ticks_dc;
 extern void __builtin_avr_delay_cycles(unsigned long);
 __tmp = ((
# 174 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h"
          16000000UL
# 174 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
               ) / 1e3) * __ms;
# 184 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
  __ticks_dc = (uint32_t)(ceil(fabs(__tmp)));


 __builtin_avr_delay_cycles(__ticks_dc);
# 210 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
}
# 254 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
void
_delay_us(double __us)
{
 double __tmp ;



 uint32_t __ticks_dc;
 extern void __builtin_avr_delay_cycles(unsigned long);
 __tmp = ((
# 263 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h"
          16000000UL
# 263 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
               ) / 1e6) * __us;
# 273 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
  __ticks_dc = (uint32_t)(ceil(fabs(__tmp)));


 __builtin_avr_delay_cycles(__ticks_dc);
# 299 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
}
# 14 "HAL/Stepper_L298P/stepper_l298p.c" 2
# 27 "HAL/Stepper_L298P/stepper_l298p.c"

# 27 "HAL/Stepper_L298P/stepper_l298p.c"
static const uint8_h STEPPER_WAVE_TABLE[4] =
{
    0x01U,
    0x02U,
    0x04U,
    0x08U
};


static const uint8_h STEPPER_FULL_TABLE[4] =
{
    0x03U,
    0x06U,
    0x0CU,
    0x09U
};


static const uint8_h STEPPER_HALF_TABLE[8] =
{
    0x01U,
    0x03U,
    0x02U,
    0x06U,
    0x04U,
    0x0CU,
    0x08U,
    0x09U
};







static uint8_h Stepper_TableLength(Stepper_L298P_ModeType mode)
{
    return (mode == STEPPER_L298P_MODE_HALF) ? 8U : 4U;
}


static uint8_h Stepper_TableEntry(Stepper_L298P_ModeType mode, uint8_h index)
{
    uint8_h local_Pattern = 0U;

    switch (mode)
    {
        case STEPPER_L298P_MODE_WAVE: local_Pattern = STEPPER_WAVE_TABLE[index & 0x03U]; break;
        case STEPPER_L298P_MODE_HALF: local_Pattern = STEPPER_HALF_TABLE[index & 0x07U]; break;
        case STEPPER_L298P_MODE_FULL:
        default: local_Pattern = STEPPER_FULL_TABLE[index & 0x03U]; break;
    }

    return local_Pattern;
}


static void Stepper_ApplyPattern(Stepper_L298P_HandleType *handle, uint8_h pattern)
{
    (void)GPIO_SetPinValue(handle->in1Port, handle->in1Pin, (uint8_h)(((pattern) >> (0)) & 1U));
    (void)GPIO_SetPinValue(handle->in2Port, handle->in2Pin, (uint8_h)(((pattern) >> (1)) & 1U));
    (void)GPIO_SetPinValue(handle->in3Port, handle->in3Pin, (uint8_h)(((pattern) >> (2)) & 1U));
    (void)GPIO_SetPinValue(handle->in4Port, handle->in4Pin, (uint8_h)(((pattern) >> (3)) & 1U));

    handle->energized = (pattern != 0U) ? 1U : 0U;
}


static void Stepper_DelayMs(uint16_h ms)
{
    while (ms > 0U)
    {
        _delay_ms(1);
        ms--;
    }
}






STD_ReturnType Stepper_L298P_Init(Stepper_L298P_HandleType *handle)
{

    if (handle == ((void *)0))
    {
        return E_NOK;
    }

    if ((handle->in1Port >= 4) || (handle->in2Port >= 4) ||
        (handle->in3Port >= 4) || (handle->in4Port >= 4))
    {
        return E_NOK;
    }

    if (handle->stepsPerRev == 0U)
    {
        return E_NOK;
    }


    (void)GPIO_SetPinDirection(handle->in1Port, handle->in1Pin, 1);
    (void)GPIO_SetPinDirection(handle->in2Port, handle->in2Pin, 1);
    (void)GPIO_SetPinDirection(handle->in3Port, handle->in3Pin, 1);
    (void)GPIO_SetPinDirection(handle->in4Port, handle->in4Pin, 1);





    if (handle->useEnablePins != 0U)
    {
        if ((handle->enAPort >= 4) || (handle->enBPort >= 4))
        {
            return E_NOK;
        }

        (void)GPIO_SetPinDirection(handle->enAPort, handle->enAPin, 1);
        (void)GPIO_SetPinDirection(handle->enBPort, handle->enBPin, 1);
        (void)GPIO_SetPinValue(handle->enAPort, handle->enAPin, PIN_HIGH);
        (void)GPIO_SetPinValue(handle->enBPort, handle->enBPin, PIN_HIGH);
    }


    if (handle->stepDelayMs == 0U)
    {
        handle->stepDelayMs = 1U;
    }


    handle->phaseIndex = 0U;
    handle->position = 0;
    handle->energized = 0U;
    Stepper_ApplyPattern(handle, 0x00U);


    handle->initialized = 1U;

    return E_OK;
}


STD_ReturnType Stepper_L298P_SetStepMode(Stepper_L298P_HandleType *handle,
                                         Stepper_L298P_ModeType mode)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }

    if (mode > STEPPER_L298P_MODE_HALF)
    {
        return E_NOK;
    }






    handle->stepMode = mode;
    handle->phaseIndex = 0U;

    return E_OK;
}


STD_ReturnType Stepper_L298P_SetStepDelay(Stepper_L298P_HandleType *handle,
                                          uint16_h stepDelayMs)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    handle->stepDelayMs = (stepDelayMs == 0U) ? 1U : stepDelayMs;

    return E_OK;
}


STD_ReturnType Stepper_L298P_SetSpeedRpm(Stepper_L298P_HandleType *handle, uint16_h rpm)
{
    uint32_h local_StepsPerRev = 0UL;
    uint32_h local_DelayMs = 0UL;


    if ((handle == ((void *)0)) || (handle->initialized == 0U) || (rpm == 0U))
    {
        return E_NOK;
    }


    local_StepsPerRev = (uint32_h)handle->stepsPerRev;

    if (handle->stepMode == STEPPER_L298P_MODE_HALF)
    {
        local_StepsPerRev *= 2UL;
    }






    local_DelayMs = 60000UL / (local_StepsPerRev * (uint32_h)rpm);






    if (local_DelayMs == 0UL)
    {
        return E_NOK;
    }

    handle->stepDelayMs = (uint16_h)local_DelayMs;

    return E_OK;
}


STD_ReturnType Stepper_L298P_Step(Stepper_L298P_HandleType *handle,
                                  uint16_h steps, Stepper_L298P_DirType dir)
{
    uint16_h local_Step = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }

    if (dir > STEPPER_L298P_DIR_CCW)
    {
        return E_NOK;
    }


    for (local_Step = 0U; local_Step < steps; local_Step++)
    {
        (void)Stepper_L298P_StepOnce(handle, dir);
        Stepper_DelayMs(handle->stepDelayMs);
    }





    return E_OK;
}


STD_ReturnType Stepper_L298P_StepOnce(Stepper_L298P_HandleType *handle,
                                      Stepper_L298P_DirType dir)
{
    uint8_h local_Length = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }

    if (dir > STEPPER_L298P_DIR_CCW)
    {
        return E_NOK;
    }

    local_Length = Stepper_TableLength(handle->stepMode);






    if (dir == STEPPER_L298P_DIR_CW)
    {
        handle->phaseIndex = (uint8_h)((handle->phaseIndex + 1U) % local_Length);
        handle->position++;
    }
    else
    {
        handle->phaseIndex = (uint8_h)((handle->phaseIndex + local_Length - 1U) % local_Length);
        handle->position--;
    }


    Stepper_ApplyPattern(handle, Stepper_TableEntry(handle->stepMode, handle->phaseIndex));

    return E_OK;
}


STD_ReturnType Stepper_L298P_RotateAngle(Stepper_L298P_HandleType *handle,
                                         uint16_h degrees, Stepper_L298P_DirType dir)
{
    uint32_h local_StepsPerRev = 0UL;
    uint32_h local_Steps = 0UL;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    local_StepsPerRev = (uint32_h)handle->stepsPerRev;

    if (handle->stepMode == STEPPER_L298P_MODE_HALF)
    {
        local_StepsPerRev *= 2UL;
    }





    local_Steps = ((uint32_h)degrees * local_StepsPerRev) / 360UL;


    return Stepper_L298P_Step(handle, (uint16_h)local_Steps, dir);
}


STD_ReturnType Stepper_L298P_Hold(Stepper_L298P_HandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    if (handle->useEnablePins != 0U)
    {
        (void)GPIO_SetPinValue(handle->enAPort, handle->enAPin, PIN_HIGH);
        (void)GPIO_SetPinValue(handle->enBPort, handle->enBPin, PIN_HIGH);
    }


    Stepper_ApplyPattern(handle, Stepper_TableEntry(handle->stepMode, handle->phaseIndex));

    return E_OK;
}


STD_ReturnType Stepper_L298P_Release(Stepper_L298P_HandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    Stepper_ApplyPattern(handle, 0x00U);






    if (handle->useEnablePins != 0U)
    {
        (void)GPIO_SetPinValue(handle->enAPort, handle->enAPin, PIN_LOW);
        (void)GPIO_SetPinValue(handle->enBPort, handle->enBPin, PIN_LOW);
    }

    handle->energized = 0U;

    return E_OK;
}


STD_ReturnType Stepper_L298P_GetPosition(const Stepper_L298P_HandleType *handle,
                                         sint32 *pPosition)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U) || (pPosition == ((void *)0)))
    {
        return E_NOK;
    }


    *pPosition = handle->position;

    return E_OK;
}


STD_ReturnType Stepper_L298P_ResetPosition(Stepper_L298P_HandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }



    handle->position = 0;

    return E_OK;
}


STD_ReturnType Stepper_L298P_GetStepsPerRev(const Stepper_L298P_HandleType *handle,
                                            uint16_h *pStepsPerRev)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U) || (pStepsPerRev == ((void *)0)))
    {
        return E_NOK;
    }


    if (handle->stepMode == STEPPER_L298P_MODE_HALF)
    {
        *pStepsPerRev = (uint16_h)(handle->stepsPerRev * 2U);
    }
    else
    {
        *pStepsPerRev = handle->stepsPerRev;
    }

    return E_OK;
}
