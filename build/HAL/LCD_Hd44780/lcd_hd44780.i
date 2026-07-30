# 1 "HAL/LCD_Hd44780/lcd_hd44780.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HAL/LCD_Hd44780/lcd_hd44780.c"
# 1 "HAL/LCD_Hd44780/../../Service/STD_Types.h" 1



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
# 2 "HAL/LCD_Hd44780/lcd_hd44780.c" 2
# 1 "HAL/LCD_Hd44780/../../Service/Bit_Math.h" 1
# 3 "HAL/LCD_Hd44780/lcd_hd44780.c" 2
# 1 "HAL/LCD_Hd44780/../../MCL/GPIO/gpio_interface.h" 1



# 1 "HAL/LCD_Hd44780/../../MCL/GPIO/../../Service/STD_Types.h" 1
# 5 "HAL/LCD_Hd44780/../../MCL/GPIO/gpio_interface.h" 2
# 1 "HAL/LCD_Hd44780/../../MCL/GPIO/gpio_registers.h" 1
# 26 "HAL/LCD_Hd44780/../../MCL/GPIO/gpio_registers.h"
typedef enum
{
    PIN_LOW = 0,
    PIN_HIGH = 1
} GPIO_PINStatus;

typedef unsigned char GPIO_PortStatus;
# 6 "HAL/LCD_Hd44780/../../MCL/GPIO/gpio_interface.h" 2
# 27 "HAL/LCD_Hd44780/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPinDirection(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Direction);
# 38 "HAL/LCD_Hd44780/../../MCL/GPIO/gpio_interface.h"
STD_ReturnType GPIO_SetPortDirection(uint8_h uint8Port, uint8_h uint8Direction);

GPIO_PINStatus GPIO_GetPinStatus(uint8_h uint8Port, uint8_h uint8Pin);

GPIO_PortStatus GPIO_GetPortStatus(uint8_h uint8Port);

STD_ReturnType GPIO_PinToggle(uint8_h uint8Port, uint8_h uint8Pin);
STD_ReturnType GPIO_SetPinValue(uint8_h uint8Port, uint8_h uint8Pin, uint8_h uint8Value);
STD_ReturnType GPIO_SetPortValue(uint8_h uint8Port, uint8_h uint8Value);
# 4 "HAL/LCD_Hd44780/lcd_hd44780.c" 2
# 1 "HAL/LCD_Hd44780/lcd_hd44780.h" 1
# 64 "HAL/LCD_Hd44780/lcd_hd44780.h"
typedef enum
{
    LCD_HD44780_BUS_4BIT = 0,
    LCD_HD44780_BUS_8BIT = 1
} LCD_Hd44780_BusType;
# 111 "HAL/LCD_Hd44780/lcd_hd44780.h"
typedef struct
{

    LCD_Hd44780_BusType bus;
    uint8_h dataPort;
    uint8_h dataStartPin;
    uint8_h controlPort;
    uint8_h rsPin;
    uint8_h rwPin;
    uint8_h enPin;
    uint8_h useRwPin;
    uint8_h rows;
    uint8_h cols;


    uint8_h initialized;
    uint8_h displayControl;
    uint8_h entryMode;
    uint8_h cursorRow;
    uint8_h cursorCol;
} LCD_Hd44780_HandleType;
# 148 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_Init(LCD_Hd44780_HandleType *handle);
# 157 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_SendCommand(LCD_Hd44780_HandleType *handle, uint8_h command);
# 166 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_WriteChar(LCD_Hd44780_HandleType *handle, uint8_h character);
# 177 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_WriteString(LCD_Hd44780_HandleType *handle, const uint8_h *pString);
# 188 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_WriteStringAt(LCD_Hd44780_HandleType *handle,
                                         uint8_h row, uint8_h column,
                                         const uint8_h *pString);
# 201 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_WriteNumber(LCD_Hd44780_HandleType *handle, sint32 number);
# 211 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_SetCursor(LCD_Hd44780_HandleType *handle,
                                     uint8_h row, uint8_h column);
# 222 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_Clear(LCD_Hd44780_HandleType *handle);






STD_ReturnType LCD_Hd44780_Home(LCD_Hd44780_HandleType *handle);
# 238 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_DisplayOnOff(LCD_Hd44780_HandleType *handle, uint8_h on);







STD_ReturnType LCD_Hd44780_CursorOnOff(LCD_Hd44780_HandleType *handle, uint8_h on);
# 255 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_BlinkOnOff(LCD_Hd44780_HandleType *handle, uint8_h on);
# 264 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_ShiftDisplay(LCD_Hd44780_HandleType *handle, uint8_h toRight);
# 277 "HAL/LCD_Hd44780/lcd_hd44780.h"
STD_ReturnType LCD_Hd44780_CreateCustomChar(LCD_Hd44780_HandleType *handle,
                                            uint8_h location, const uint8_h *pPattern);
# 5 "HAL/LCD_Hd44780/lcd_hd44780.c" 2
# 13 "HAL/LCD_Hd44780/lcd_hd44780.c"
# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 1 3
# 44 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\inttypes.h" 1 3
# 37 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\inttypes.h" 3
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
# 38 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\inttypes.h" 2 3
# 77 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\inttypes.h" 3
typedef int32_t int_farptr_t;



typedef uint32_t uint_farptr_t;
# 45 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 2 3
# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay_basic.h" 1 3
# 40 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay_basic.h" 3
static __inline__ void _delay_loop_1(uint8_t __count) __attribute__((__always_inline__));
static __inline__ void _delay_loop_2(uint16_t __count) __attribute__((__always_inline__));
# 80 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay_basic.h" 3
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
# 102 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay_basic.h" 3
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
# 46 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 2 3
# 1 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 1 3
# 127 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double cos(double __x) __attribute__((__const__));





extern double sin(double __x) __attribute__((__const__));





extern double tan(double __x) __attribute__((__const__));






extern double fabs(double __x) __attribute__((__const__));






extern double fmod(double __x, double __y) __attribute__((__const__));
# 168 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double modf(double __x, double *__iptr);


extern float modff (float __x, float *__iptr);




extern double sqrt(double __x) __attribute__((__const__));


extern float sqrtf (float) __attribute__((__const__));




extern double cbrt(double __x) __attribute__((__const__));
# 195 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double hypot (double __x, double __y) __attribute__((__const__));







extern double square(double __x) __attribute__((__const__));






extern double floor(double __x) __attribute__((__const__));






extern double ceil(double __x) __attribute__((__const__));
# 235 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double frexp(double __x, int *__pexp);







extern double ldexp(double __x, int __exp) __attribute__((__const__));





extern double exp(double __x) __attribute__((__const__));





extern double cosh(double __x) __attribute__((__const__));





extern double sinh(double __x) __attribute__((__const__));





extern double tanh(double __x) __attribute__((__const__));







extern double acos(double __x) __attribute__((__const__));







extern double asin(double __x) __attribute__((__const__));






extern double atan(double __x) __attribute__((__const__));
# 299 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double atan2(double __y, double __x) __attribute__((__const__));





extern double log(double __x) __attribute__((__const__));





extern double log10(double __x) __attribute__((__const__));





extern double pow(double __x, double __y) __attribute__((__const__));






extern int isnan(double __x) __attribute__((__const__));
# 334 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
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
# 377 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern int signbit (double __x) __attribute__((__const__));






extern double fdim (double __x, double __y) __attribute__((__const__));
# 393 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double fma (double __x, double __y, double __z) __attribute__((__const__));







extern double fmax (double __x, double __y) __attribute__((__const__));







extern double fmin (double __x, double __y) __attribute__((__const__));






extern double trunc (double __x) __attribute__((__const__));
# 427 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern double round (double __x) __attribute__((__const__));
# 440 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern long lround (double __x) __attribute__((__const__));
# 454 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\math.h" 3
extern long lrint (double __x) __attribute__((__const__));
# 47 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 2 3
# 86 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
static __inline__ void _delay_us(double __us) __attribute__((__always_inline__));
static __inline__ void _delay_ms(double __ms) __attribute__((__always_inline__));
# 165 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
void
_delay_ms(double __ms)
{
 double __tmp ;



 uint32_t __ticks_dc;
 extern void __builtin_avr_delay_cycles(unsigned long);
 __tmp = ((
# 174 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h"
          16000000UL
# 174 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
               ) / 1e3) * __ms;
# 184 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
  __ticks_dc = (uint32_t)(ceil(fabs(__tmp)));


 __builtin_avr_delay_cycles(__ticks_dc);
# 210 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
}
# 254 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
void
_delay_us(double __us)
{
 double __tmp ;



 uint32_t __ticks_dc;
 extern void __builtin_avr_delay_cycles(unsigned long);
 __tmp = ((
# 263 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h"
          16000000UL
# 263 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
               ) / 1e6) * __us;
# 273 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
  __ticks_dc = (uint32_t)(ceil(fabs(__tmp)));


 __builtin_avr_delay_cycles(__ticks_dc);
# 299 "c:\\users\\ahmed\\.platformio\\packages\\toolchain-atmelavr\\avr\\include\\util\\delay.h" 3
}
# 14 "HAL/LCD_Hd44780/lcd_hd44780.c" 2
# 37 "HAL/LCD_Hd44780/lcd_hd44780.c"

# 37 "HAL/LCD_Hd44780/lcd_hd44780.c"
static void LCD_Hd44780_EnablePulse(const LCD_Hd44780_HandleType *handle)
{
    (void)GPIO_SetPinValue(handle->controlPort, handle->enPin, PIN_HIGH);
    _delay_us(2);
    (void)GPIO_SetPinValue(handle->controlPort, handle->enPin, PIN_LOW);
    _delay_us(2);
}





static void LCD_Hd44780_WriteNibble(const LCD_Hd44780_HandleType *handle, uint8_h nibble)
{
    uint8_h local_Bit = 0U;

    for (local_Bit = 0U; local_Bit < 4U; local_Bit++)
    {
        (void)GPIO_SetPinValue(handle->dataPort,
                               (uint8_h)(handle->dataStartPin + local_Bit),
                               (uint8_h)(((nibble) >> (local_Bit)) & 1U));
    }

    LCD_Hd44780_EnablePulse(handle);
}






static void LCD_Hd44780_WriteBus(const LCD_Hd44780_HandleType *handle, uint8_h value)
{
    uint8_h local_Bit = 0U;

    if (handle->bus == LCD_HD44780_BUS_8BIT)
    {
        for (local_Bit = 0U; local_Bit < 8U; local_Bit++)
        {
            (void)GPIO_SetPinValue(handle->dataPort,
                                   (uint8_h)(handle->dataStartPin + local_Bit),
                                   (uint8_h)(((value) >> (local_Bit)) & 1U));
        }

        LCD_Hd44780_EnablePulse(handle);
    }
    else
    {
        LCD_Hd44780_WriteNibble(handle, (uint8_h)(value >> 4));
        LCD_Hd44780_WriteNibble(handle, (uint8_h)(value & 0x0FU));
    }

    _delay_us(50U);
}






static uint8_h LCD_Hd44780_RowBase(const LCD_Hd44780_HandleType *handle, uint8_h row)
{
    uint8_h local_Base = 0x00U;

    switch (row)
    {
        case 0U: local_Base = (uint8_h)0x00U; break;
        case 1U: local_Base = (uint8_h)0x40U; break;
        case 2U: local_Base = (uint8_h)(0x00U + handle->cols); break;
        case 3U: local_Base = (uint8_h)(0x40U + handle->cols); break;
        default: local_Base = (uint8_h)0x00U; break;
    }

    return local_Base;
}






STD_ReturnType LCD_Hd44780_Init(LCD_Hd44780_HandleType *handle)
{
    uint8_h local_Bit = 0U;
    uint8_h local_DataPins = 0U;
    uint8_h local_FunctionSet = 0U;





    if (handle == ((void *)0))
    {
        return E_NOK;
    }

    if ((handle->dataPort >= 4) ||
        (handle->controlPort >= 4))
    {
        return E_NOK;
    }

    if ((handle->rows == 0U) || (handle->cols == 0U) || (handle->rows > 4U))
    {
        return E_NOK;
    }

    local_DataPins = (handle->bus == LCD_HD44780_BUS_8BIT) ? 8U : 4U;

    if (((uint16_h)handle->dataStartPin + local_DataPins) > 8)
    {
        return E_NOK;
    }


    for (local_Bit = 0U; local_Bit < local_DataPins; local_Bit++)
    {
        (void)GPIO_SetPinDirection(handle->dataPort,
                                   (uint8_h)(handle->dataStartPin + local_Bit),
                                   1);
        (void)GPIO_SetPinValue(handle->dataPort,
                               (uint8_h)(handle->dataStartPin + local_Bit), PIN_LOW);
    }

    (void)GPIO_SetPinDirection(handle->controlPort, handle->rsPin, 1);
    (void)GPIO_SetPinDirection(handle->controlPort, handle->enPin, 1);
    (void)GPIO_SetPinValue(handle->controlPort, handle->rsPin, PIN_LOW);
    (void)GPIO_SetPinValue(handle->controlPort, handle->enPin, PIN_LOW);

    if (handle->useRwPin != 0U)
    {

        (void)GPIO_SetPinDirection(handle->controlPort, handle->rwPin, 1);
        (void)GPIO_SetPinValue(handle->controlPort, handle->rwPin, PIN_LOW);
    }


    _delay_ms(50);






    if (handle->bus == LCD_HD44780_BUS_4BIT)
    {
        LCD_Hd44780_WriteNibble(handle, 0x03U);
        _delay_ms(5);
        LCD_Hd44780_WriteNibble(handle, 0x03U);
        _delay_us(150);
        LCD_Hd44780_WriteNibble(handle, 0x03U);
        _delay_us(150);
        LCD_Hd44780_WriteNibble(handle, 0x02U);
        _delay_us(150);
    }
    else
    {
        LCD_Hd44780_WriteBus(handle, 0x30U);
        _delay_ms(5);
        LCD_Hd44780_WriteBus(handle, 0x30U);
        _delay_us(150);
        LCD_Hd44780_WriteBus(handle, 0x30U);
        _delay_us(150);
    }





    local_FunctionSet = 0x20;

    if (handle->bus == LCD_HD44780_BUS_8BIT)
    {
        local_FunctionSet |= 0x10U;
    }

    if (handle->rows > 1U)
    {
        local_FunctionSet |= 0x08U;
    }

    (void)LCD_Hd44780_SendCommand(handle, local_FunctionSet);


    handle->displayControl = 0x08;
    (void)LCD_Hd44780_SendCommand(handle, handle->displayControl);

    (void)LCD_Hd44780_SendCommand(handle, 0x01);
    _delay_ms(2U);

    handle->entryMode = (uint8_h)(0x04 | 0x02);
    (void)LCD_Hd44780_SendCommand(handle, handle->entryMode);

    handle->displayControl = (uint8_h)(0x08 | 0x04);
    (void)LCD_Hd44780_SendCommand(handle, handle->displayControl);


    handle->cursorRow = 0U;
    handle->cursorCol = 0U;
    handle->initialized = 1U;

    return E_OK;
}


STD_ReturnType LCD_Hd44780_SendCommand(LCD_Hd44780_HandleType *handle, uint8_h command)
{

    if (handle == ((void *)0))
    {
        return E_NOK;
    }


    (void)GPIO_SetPinValue(handle->controlPort, handle->rsPin, PIN_LOW);


    LCD_Hd44780_WriteBus(handle, command);

    return E_OK;
}


STD_ReturnType LCD_Hd44780_WriteChar(LCD_Hd44780_HandleType *handle, uint8_h character)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    (void)GPIO_SetPinValue(handle->controlPort, handle->rsPin, PIN_HIGH);


    LCD_Hd44780_WriteBus(handle, character);

    return E_OK;
}


STD_ReturnType LCD_Hd44780_WriteString(LCD_Hd44780_HandleType *handle, const uint8_h *pString)
{
    uint16_h local_Index = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U) || (pString == ((void *)0)))
    {
        return E_NOK;
    }


    for (local_Index = 0U; pString[local_Index] != '\0'; local_Index++)
    {
        (void)LCD_Hd44780_WriteChar(handle, pString[local_Index]);
    }

    return E_OK;
}


STD_ReturnType LCD_Hd44780_WriteStringAt(LCD_Hd44780_HandleType *handle,
                                         uint8_h row, uint8_h column,
                                         const uint8_h *pString)
{

    if (LCD_Hd44780_SetCursor(handle, row, column) != E_OK)
    {
        return E_NOK;
    }


    return LCD_Hd44780_WriteString(handle, pString);
}


STD_ReturnType LCD_Hd44780_WriteNumber(LCD_Hd44780_HandleType *handle, sint32 number)
{
    uint8_h local_Digits[10];
    uint8_h local_Count = 0U;
    uint32_h local_Value = 0UL;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    if (number == 0)
    {
        return LCD_Hd44780_WriteChar(handle, (uint8_h)'0');
    }





    if (number < 0)
    {
        (void)LCD_Hd44780_WriteChar(handle, (uint8_h)'-');
        local_Value = (uint32_h)(-(sint32)number);
    }
    else
    {
        local_Value = (uint32_h)number;
    }


    while ((local_Value > 0UL) && (local_Count < 10U))
    {
        local_Digits[local_Count] = (uint8_h)('0' + (uint8_h)(local_Value % 10UL));
        local_Value /= 10UL;
        local_Count++;
    }


    while (local_Count > 0U)
    {
        local_Count--;
        (void)LCD_Hd44780_WriteChar(handle, local_Digits[local_Count]);
    }

    return E_OK;
}


STD_ReturnType LCD_Hd44780_SetCursor(LCD_Hd44780_HandleType *handle,
                                     uint8_h row, uint8_h column)
{
    uint8_h local_Address = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }

    if ((row >= handle->rows) || (column >= handle->cols))
    {
        return E_NOK;
    }


    local_Address = (uint8_h)(LCD_Hd44780_RowBase(handle, row) + column);


    (void)LCD_Hd44780_SendCommand(handle,
                                  (uint8_h)(0x80 | local_Address));

    handle->cursorRow = row;
    handle->cursorCol = column;

    return E_OK;
}


STD_ReturnType LCD_Hd44780_Clear(LCD_Hd44780_HandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    (void)LCD_Hd44780_SendCommand(handle, 0x01);
    _delay_ms(2U);

    handle->cursorRow = 0U;
    handle->cursorCol = 0U;

    return E_OK;
}


STD_ReturnType LCD_Hd44780_Home(LCD_Hd44780_HandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    (void)LCD_Hd44780_SendCommand(handle, 0x02);
    _delay_ms(2U);

    handle->cursorRow = 0U;
    handle->cursorCol = 0U;

    return E_OK;
}


STD_ReturnType LCD_Hd44780_DisplayOnOff(LCD_Hd44780_HandleType *handle, uint8_h on)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }





    if (on != 0U)
    {
        handle->displayControl |= 0x04;
    }
    else
    {
        handle->displayControl &= (uint8_h)(~0x04);
    }


    return LCD_Hd44780_SendCommand(handle, handle->displayControl);
}


STD_ReturnType LCD_Hd44780_CursorOnOff(LCD_Hd44780_HandleType *handle, uint8_h on)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    if (on != 0U)
    {
        handle->displayControl |= 0x02;
    }
    else
    {
        handle->displayControl &= (uint8_h)(~0x02);
    }


    return LCD_Hd44780_SendCommand(handle, handle->displayControl);
}


STD_ReturnType LCD_Hd44780_BlinkOnOff(LCD_Hd44780_HandleType *handle, uint8_h on)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    if (on != 0U)
    {
        handle->displayControl |= 0x01;
    }
    else
    {
        handle->displayControl &= (uint8_h)(~0x01);
    }


    return LCD_Hd44780_SendCommand(handle, handle->displayControl);
}


STD_ReturnType LCD_Hd44780_ShiftDisplay(LCD_Hd44780_HandleType *handle, uint8_h toRight)
{
    uint8_h local_Command = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }





    local_Command = (uint8_h)(0x10 | 0x08U);

    if (toRight != 0U)
    {
        local_Command |= 0x04U;
    }


    return LCD_Hd44780_SendCommand(handle, local_Command);
}


STD_ReturnType LCD_Hd44780_CreateCustomChar(LCD_Hd44780_HandleType *handle,
                                            uint8_h location, const uint8_h *pPattern)
{
    uint8_h local_Row = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U) || (pPattern == ((void *)0)))
    {
        return E_NOK;
    }

    if (location > 7U)
    {
        return E_NOK;
    }


    (void)LCD_Hd44780_SendCommand(handle,
                                  (uint8_h)(0x40 | (uint8_h)(location << 3)));


    for (local_Row = 0U; local_Row < 8U; local_Row++)
    {
        (void)LCD_Hd44780_WriteChar(handle, (uint8_h)(pPattern[local_Row] & 0x1FU));
    }





    return LCD_Hd44780_SetCursor(handle, 0U, 0U);
}
