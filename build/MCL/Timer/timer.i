# 1 "MCL/Timer/timer.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "MCL/Timer/timer.c"
# 1 "MCL/Timer/../../Service/STD_Types.h" 1



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
# 2 "MCL/Timer/timer.c" 2
# 1 "MCL/Timer/../../Service/Bit_Math.h" 1
# 3 "MCL/Timer/timer.c" 2
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\interrupt.h" 1 3
# 38 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\interrupt.h" 3
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 1 3
# 99 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\io.h" 3
# 1 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\sfr_defs.h" 1 3
# 126 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\sfr_defs.h" 3
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
# 39 "c:\\users\\hp\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\avr\\interrupt.h" 2 3
# 4 "MCL/Timer/timer.c" 2
# 1 "MCL/Timer/timer_registers.h" 1
# 5 "MCL/Timer/timer.c" 2
# 1 "MCL/Timer/timer_interface.h" 1
# 22 "MCL/Timer/timer_interface.h"

# 22 "MCL/Timer/timer_interface.h"
typedef enum
{
    TIMER_CHANNEL_0 = 0,
    TIMER_CHANNEL_1 = 1,
    TIMER_CHANNEL_2 = 2,
    TIMER_CHANNEL_MAX
} Timer_ChannelType;
# 38 "MCL/Timer/timer_interface.h"
typedef enum
{
    TIMER_MODE_NORMAL = 0,
    TIMER_MODE_CTC = 1,
    TIMER_MODE_FAST_PWM = 2,
    TIMER_MODE_PHASE_PWM = 3
} Timer_ModeType;







typedef enum
{
    TIMER_CLOCK_STOPPED = 0,
    TIMER_CLOCK_DIV_1 = 1,
    TIMER_CLOCK_DIV_8 = 2,
    TIMER_CLOCK_DIV_64 = 3,
    TIMER_CLOCK_DIV_256 = 4,
    TIMER_CLOCK_DIV_1024 = 5
} Timer_PrescalerType;







typedef enum
{
    TIMER_INT_OVERFLOW = 0,
    TIMER_INT_COMPARE_MATCH = 1
} Timer_InterruptType;
# 84 "MCL/Timer/timer_interface.h"
typedef struct
{
    Timer_ChannelType channel;
    Timer_ModeType mode;
    Timer_PrescalerType prescaler;
    uint16_h initialValue;
    uint16_h compareValue;
} Timer_ConfigType;






typedef void (*Timer_CallBackType)(void);
# 112 "MCL/Timer/timer_interface.h"
STD_ReturnType Timer_Init(const Timer_ConfigType *addConfig);






STD_ReturnType Timer_DeInit(Timer_ChannelType channel);







STD_ReturnType Timer_Start(Timer_ChannelType channel, Timer_PrescalerType prescaler);






STD_ReturnType Timer_Stop(Timer_ChannelType channel);







STD_ReturnType Timer_SetCounterValue(Timer_ChannelType channel, uint16_h value);







STD_ReturnType Timer_GetCounterValue(Timer_ChannelType channel, uint16_h *puint16Val);







STD_ReturnType Timer_SetCompareValue(Timer_ChannelType channel, uint16_h value);
# 167 "MCL/Timer/timer_interface.h"
STD_ReturnType Timer_EnableInterrupt(Timer_ChannelType channel, Timer_InterruptType intType);







STD_ReturnType Timer_DisableInterrupt(Timer_ChannelType channel, Timer_InterruptType intType);
# 184 "MCL/Timer/timer_interface.h"
STD_ReturnType Timer_SetCallBack(Timer_ChannelType channel,
                                 Timer_InterruptType intType,
                                 Timer_CallBackType callBack);




void Timer_EnableGlobalInterrupt(void);




void Timer_DisableGlobalInterrupt(void);
# 6 "MCL/Timer/timer.c" 2
# 16 "MCL/Timer/timer.c"
static Timer_CallBackType Timer_CallBacks[TIMER_CHANNEL_MAX][2] = { { ((void *)0), ((void *)0) },
                                                                    { ((void *)0), ((void *)0) },
                                                                    { ((void *)0), ((void *)0) } };



static void Timer_SetMode(Timer_ChannelType channel, Timer_ModeType mode)
{
    switch (channel)
    {
        case TIMER_CHANNEL_0:

            switch (mode)
            {
                case TIMER_MODE_NORMAL:
                    (((*(volatile u8 *)0x53)) &= ~(1U << (6)));
                    (((*(volatile u8 *)0x53)) &= ~(1U << (3)));
                    break;
                case TIMER_MODE_CTC:
                    (((*(volatile u8 *)0x53)) &= ~(1U << (6)));
                    (((*(volatile u8 *)0x53)) |= (1U << (3)));
                    break;
                case TIMER_MODE_FAST_PWM:
                    (((*(volatile u8 *)0x53)) |= (1U << (6)));
                    (((*(volatile u8 *)0x53)) |= (1U << (3)));
                    break;
                case TIMER_MODE_PHASE_PWM:
                default:
                    (((*(volatile u8 *)0x53)) |= (1U << (6)));
                    (((*(volatile u8 *)0x53)) &= ~(1U << (3)));
                    break;
            }
            break;

        case TIMER_CHANNEL_2:

            switch (mode)
            {
                case TIMER_MODE_NORMAL:
                    (((*(volatile u8 *)0x45)) &= ~(1U << (6)));
                    (((*(volatile u8 *)0x45)) &= ~(1U << (3)));
                    break;
                case TIMER_MODE_CTC:
                    (((*(volatile u8 *)0x45)) &= ~(1U << (6)));
                    (((*(volatile u8 *)0x45)) |= (1U << (3)));
                    break;
                case TIMER_MODE_FAST_PWM:
                    (((*(volatile u8 *)0x45)) |= (1U << (6)));
                    (((*(volatile u8 *)0x45)) |= (1U << (3)));
                    break;
                case TIMER_MODE_PHASE_PWM:
                default:
                    (((*(volatile u8 *)0x45)) |= (1U << (6)));
                    (((*(volatile u8 *)0x45)) &= ~(1U << (3)));
                    break;
            }
            break;

        case TIMER_CHANNEL_1:
        default:

            (((*(volatile u8 *)0x4F)) &= ~(1U << (0)));
            (((*(volatile u8 *)0x4F)) &= ~(1U << (1)));
            (((*(volatile u8 *)0x4E)) &= ~(1U << (3)));
            (((*(volatile u8 *)0x4E)) &= ~(1U << (4)));
            switch (mode)
            {
                case TIMER_MODE_NORMAL:

                    break;
                case TIMER_MODE_CTC:

                    (((*(volatile u8 *)0x4E)) |= (1U << (3)));
                    break;
                case TIMER_MODE_FAST_PWM:

                    (((*(volatile u8 *)0x4F)) |= (1U << (0)));
                    (((*(volatile u8 *)0x4E)) |= (1U << (3)));
                    break;
                case TIMER_MODE_PHASE_PWM:
                default:

                    (((*(volatile u8 *)0x4F)) |= (1U << (0)));
                    break;
            }
            break;
    }
}


STD_ReturnType Timer_Init(const Timer_ConfigType *addConfig)
{
    if ((addConfig == ((void *)0)) || (addConfig->channel >= TIMER_CHANNEL_MAX))
    {
        return E_NOK;
    }

    Timer_SetMode(addConfig->channel, addConfig->mode);

    switch (addConfig->channel)
    {
        case TIMER_CHANNEL_0:
            (*(volatile u8 *)0x52) = (u8)addConfig->initialValue;
            (*(volatile u8 *)0x5C) = (u8)addConfig->compareValue;
            break;
        case TIMER_CHANNEL_1:
            (*(volatile u16 *)0x4C) = addConfig->initialValue;
            (*(volatile u16 *)0x4A) = addConfig->compareValue;
            break;
        case TIMER_CHANNEL_2:
            (*(volatile u8 *)0x44) = (u8)addConfig->initialValue;
            (*(volatile u8 *)0x43) = (u8)addConfig->compareValue;
            break;
        default:
            return E_NOK;
    }


    return Timer_Start(addConfig->channel, addConfig->prescaler);
}


STD_ReturnType Timer_DeInit(Timer_ChannelType channel)
{
    if (channel >= TIMER_CHANNEL_MAX)
    {
        return E_NOK;
    }

    (void)Timer_DisableInterrupt(channel, TIMER_INT_OVERFLOW);
    (void)Timer_DisableInterrupt(channel, TIMER_INT_COMPARE_MATCH);

    switch (channel)
    {
        case TIMER_CHANNEL_0:
            (*(volatile u8 *)0x53) = 0U;
            (*(volatile u8 *)0x52) = 0U;
            break;
        case TIMER_CHANNEL_1:
            (*(volatile u8 *)0x4F) = 0U;
            (*(volatile u8 *)0x4E) = 0U;
            (*(volatile u16 *)0x4C) = 0U;
            break;
        case TIMER_CHANNEL_2:
            (*(volatile u8 *)0x45) = 0U;
            (*(volatile u8 *)0x44) = 0U;
            break;
        default:
            return E_NOK;
    }

    Timer_CallBacks[channel][TIMER_INT_OVERFLOW] = ((void *)0);
    Timer_CallBacks[channel][TIMER_INT_COMPARE_MATCH] = ((void *)0);

    return E_OK;
}


STD_ReturnType Timer_Start(Timer_ChannelType channel, Timer_PrescalerType prescaler)
{
    if (channel >= TIMER_CHANNEL_MAX)
    {
        return E_NOK;
    }

    switch (channel)
    {
        case TIMER_CHANNEL_0:
            (*(volatile u8 *)0x53) &= ~((1U << 2) | (1U << 1) |
                                 (1U << 0));
            (*(volatile u8 *)0x53) |= ((uint8_h)prescaler & 0x07U);
            break;
        case TIMER_CHANNEL_1:
            (*(volatile u8 *)0x4E) &= ~((1U << 2) | (1U << 1) |
                                  (1U << 0));
            (*(volatile u8 *)0x4E) |= ((uint8_h)prescaler & 0x07U);
            break;
        case TIMER_CHANNEL_2:
            (*(volatile u8 *)0x45) &= ~((1U << 2) | (1U << 1) |
                                 (1U << 0));
            (*(volatile u8 *)0x45) |= ((uint8_h)prescaler & 0x07U);
            break;
        default:
            return E_NOK;
    }

    return E_OK;
}


STD_ReturnType Timer_Stop(Timer_ChannelType channel)
{
    if (channel >= TIMER_CHANNEL_MAX)
    {
        return E_NOK;
    }

    switch (channel)
    {
        case TIMER_CHANNEL_0:
            (*(volatile u8 *)0x53) &= ~((1U << 2) | (1U << 1) |
                                 (1U << 0));
            break;
        case TIMER_CHANNEL_1:
            (*(volatile u8 *)0x4E) &= ~((1U << 2) | (1U << 1) |
                                  (1U << 0));
            break;
        case TIMER_CHANNEL_2:
            (*(volatile u8 *)0x45) &= ~((1U << 2) | (1U << 1) |
                                 (1U << 0));
            break;
        default:
            return E_NOK;
    }

    return E_OK;
}


STD_ReturnType Timer_SetCounterValue(Timer_ChannelType channel, uint16_h value)
{
    if (channel >= TIMER_CHANNEL_MAX)
    {
        return E_NOK;
    }

    switch (channel)
    {
        case TIMER_CHANNEL_0: (*(volatile u8 *)0x52) = (u8)value; break;
        case TIMER_CHANNEL_1: (*(volatile u16 *)0x4C) = value; break;
        case TIMER_CHANNEL_2: (*(volatile u8 *)0x44) = (u8)value; break;
        default: return E_NOK;
    }

    return E_OK;
}


STD_ReturnType Timer_GetCounterValue(Timer_ChannelType channel, uint16_h *puint16Val)
{
    if ((channel >= TIMER_CHANNEL_MAX) || (puint16Val == ((void *)0)))
    {
        return E_NOK;
    }

    switch (channel)
    {
        case TIMER_CHANNEL_0: *puint16Val = (*(volatile u8 *)0x52); break;
        case TIMER_CHANNEL_1: *puint16Val = (*(volatile u16 *)0x4C); break;
        case TIMER_CHANNEL_2: *puint16Val = (*(volatile u8 *)0x44); break;
        default: return E_NOK;
    }

    return E_OK;
}


STD_ReturnType Timer_SetCompareValue(Timer_ChannelType channel, uint16_h value)
{
    if (channel >= TIMER_CHANNEL_MAX)
    {
        return E_NOK;
    }

    switch (channel)
    {
        case TIMER_CHANNEL_0: (*(volatile u8 *)0x5C) = (u8)value; break;
        case TIMER_CHANNEL_1: (*(volatile u16 *)0x4A) = value; break;
        case TIMER_CHANNEL_2: (*(volatile u8 *)0x43) = (u8)value; break;
        default: return E_NOK;
    }

    return E_OK;
}


STD_ReturnType Timer_EnableInterrupt(Timer_ChannelType channel, Timer_InterruptType intType)
{
    if (channel >= TIMER_CHANNEL_MAX)
    {
        return E_NOK;
    }

    switch (channel)
    {
        case TIMER_CHANNEL_0:
            (((*(volatile u8 *)0x59)) |= (1U << ((intType == TIMER_INT_OVERFLOW) ? 0 : 1)))
                                                                                        ;
            break;
        case TIMER_CHANNEL_1:
            (((*(volatile u8 *)0x59)) |= (1U << ((intType == TIMER_INT_OVERFLOW) ? 2 : 4)))
                                                                                         ;
            break;
        case TIMER_CHANNEL_2:
            (((*(volatile u8 *)0x59)) |= (1U << ((intType == TIMER_INT_OVERFLOW) ? 6 : 7)))
                                                                                        ;
            break;
        default:
            return E_NOK;
    }

    return E_OK;
}


STD_ReturnType Timer_DisableInterrupt(Timer_ChannelType channel, Timer_InterruptType intType)
{
    if (channel >= TIMER_CHANNEL_MAX)
    {
        return E_NOK;
    }

    switch (channel)
    {
        case TIMER_CHANNEL_0:
            (((*(volatile u8 *)0x59)) &= ~(1U << ((intType == TIMER_INT_OVERFLOW) ? 0 : 1)))
                                                                                        ;
            break;
        case TIMER_CHANNEL_1:
            (((*(volatile u8 *)0x59)) &= ~(1U << ((intType == TIMER_INT_OVERFLOW) ? 2 : 4)))
                                                                                         ;
            break;
        case TIMER_CHANNEL_2:
            (((*(volatile u8 *)0x59)) &= ~(1U << ((intType == TIMER_INT_OVERFLOW) ? 6 : 7)))
                                                                                        ;
            break;
        default:
            return E_NOK;
    }

    return E_OK;
}


STD_ReturnType Timer_SetCallBack(Timer_ChannelType channel,
                                 Timer_InterruptType intType,
                                 Timer_CallBackType callBack)
{
    if ((channel >= TIMER_CHANNEL_MAX) || (callBack == ((void *)0)))
    {
        return E_NOK;
    }

    Timer_CallBacks[channel][intType] = callBack;
    return E_OK;
}


void Timer_EnableGlobalInterrupt(void)
{
    (((*(volatile u8 *)0x5F)) |= (1U << (7)));
}


void Timer_DisableGlobalInterrupt(void)
{
    (((*(volatile u8 *)0x5F)) &= ~(1U << (7)));
}







# 380 "MCL/Timer/timer.c" 3
void __vector_11 (void) __attribute__ ((signal,used, externally_visible)) ; void __vector_11 (void)

# 381 "MCL/Timer/timer.c"
{
    if (Timer_CallBacks[TIMER_CHANNEL_0][TIMER_INT_OVERFLOW] != ((void *)0))
    {
        Timer_CallBacks[TIMER_CHANNEL_0][TIMER_INT_OVERFLOW]();
    }
}


# 388 "MCL/Timer/timer.c" 3
void __vector_10 (void) __attribute__ ((signal,used, externally_visible)) ; void __vector_10 (void)

# 389 "MCL/Timer/timer.c"
{
    if (Timer_CallBacks[TIMER_CHANNEL_0][TIMER_INT_COMPARE_MATCH] != ((void *)0))
    {
        Timer_CallBacks[TIMER_CHANNEL_0][TIMER_INT_COMPARE_MATCH]();
    }
}


# 396 "MCL/Timer/timer.c" 3
void __vector_9 (void) __attribute__ ((signal,used, externally_visible)) ; void __vector_9 (void)

# 397 "MCL/Timer/timer.c"
{
    if (Timer_CallBacks[TIMER_CHANNEL_1][TIMER_INT_OVERFLOW] != ((void *)0))
    {
        Timer_CallBacks[TIMER_CHANNEL_1][TIMER_INT_OVERFLOW]();
    }
}


# 404 "MCL/Timer/timer.c" 3
void __vector_7 (void) __attribute__ ((signal,used, externally_visible)) ; void __vector_7 (void)

# 405 "MCL/Timer/timer.c"
{
    if (Timer_CallBacks[TIMER_CHANNEL_1][TIMER_INT_COMPARE_MATCH] != ((void *)0))
    {
        Timer_CallBacks[TIMER_CHANNEL_1][TIMER_INT_COMPARE_MATCH]();
    }
}


# 412 "MCL/Timer/timer.c" 3
void __vector_5 (void) __attribute__ ((signal,used, externally_visible)) ; void __vector_5 (void)

# 413 "MCL/Timer/timer.c"
{
    if (Timer_CallBacks[TIMER_CHANNEL_2][TIMER_INT_OVERFLOW] != ((void *)0))
    {
        Timer_CallBacks[TIMER_CHANNEL_2][TIMER_INT_OVERFLOW]();
    }
}


# 420 "MCL/Timer/timer.c" 3
void __vector_4 (void) __attribute__ ((signal,used, externally_visible)) ; void __vector_4 (void)

# 421 "MCL/Timer/timer.c"
{
    if (Timer_CallBacks[TIMER_CHANNEL_2][TIMER_INT_COMPARE_MATCH] != ((void *)0))
    {
        Timer_CallBacks[TIMER_CHANNEL_2][TIMER_INT_COMPARE_MATCH]();
    }
}
