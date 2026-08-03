# 1 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.c"
# 1 "HAL/LCD_Aip31068_i2c/../../Service/STD_Types.h" 1



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
# 2 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.c" 2
# 1 "HAL/LCD_Aip31068_i2c/../../Service/Bit_Math.h" 1
# 3 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.c" 2
# 1 "HAL/LCD_Aip31068_i2c/../../MCL/I2C/i2c_interface.h" 1



# 1 "c:\\nti_microcontroller\\project\\service\\std_types.h" 1
# 5 "HAL/LCD_Aip31068_i2c/../../MCL/I2C/i2c_interface.h" 2
# 1 "HAL/LCD_Aip31068_i2c/../../MCL/I2C/i2c_registers.h" 1
# 6 "HAL/LCD_Aip31068_i2c/../../MCL/I2C/i2c_interface.h" 2
# 40 "HAL/LCD_Aip31068_i2c/../../MCL/I2C/i2c_interface.h"
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
# 78 "HAL/LCD_Aip31068_i2c/../../MCL/I2C/i2c_interface.h"
STD_ReturnType I2C_InitMaster(const I2C_MasterConfigType *addConfig);
# 87 "HAL/LCD_Aip31068_i2c/../../MCL/I2C/i2c_interface.h"
STD_ReturnType I2C_InitSlave(const I2C_SlaveConfigType *addConfig);





STD_ReturnType I2C_DeInit(void);






STD_ReturnType I2C_Start(void);





STD_ReturnType I2C_Stop(void);







STD_ReturnType I2C_WriteByte(uint8_h uint8Data);






STD_ReturnType I2C_ReadByteWithAck(uint8_h *puint8Data);






STD_ReturnType I2C_ReadByteWithNack(uint8_h *puint8Data);






uint8_h I2C_GetStatus(void);
# 144 "HAL/LCD_Aip31068_i2c/../../MCL/I2C/i2c_interface.h"
STD_ReturnType I2C_MasterWrite(uint8_h slaveAddress, const uint8_h *pData, uint16_h length);
# 154 "HAL/LCD_Aip31068_i2c/../../MCL/I2C/i2c_interface.h"
STD_ReturnType I2C_MasterRead(uint8_h slaveAddress, uint8_h *pBuffer, uint16_h length);
# 4 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.c" 2
# 1 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h" 1
# 101 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
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
# 132 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_Init(LCD_Aip31068_HandleType *handle);
# 141 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_SendCommand(LCD_Aip31068_HandleType *handle, uint8_h command);







STD_ReturnType LCD_Aip31068_WriteChar(LCD_Aip31068_HandleType *handle, uint8_h character);
# 161 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_WriteString(LCD_Aip31068_HandleType *handle, const uint8_h *pString);
# 171 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_WriteStringAt(LCD_Aip31068_HandleType *handle,
                                          uint8_h row, uint8_h column,
                                          const uint8_h *pString);
# 183 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_WriteNumber(LCD_Aip31068_HandleType *handle, sint32 number);
# 193 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_SetCursor(LCD_Aip31068_HandleType *handle,
                                      uint8_h row, uint8_h column);







STD_ReturnType LCD_Aip31068_Clear(LCD_Aip31068_HandleType *handle);






STD_ReturnType LCD_Aip31068_Home(LCD_Aip31068_HandleType *handle);







STD_ReturnType LCD_Aip31068_DisplayOnOff(LCD_Aip31068_HandleType *handle, uint8_h on);







STD_ReturnType LCD_Aip31068_CursorOnOff(LCD_Aip31068_HandleType *handle, uint8_h on);







STD_ReturnType LCD_Aip31068_BlinkOnOff(LCD_Aip31068_HandleType *handle, uint8_h on);
# 242 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_ShiftDisplay(LCD_Aip31068_HandleType *handle, uint8_h toRight);
# 252 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.h"
STD_ReturnType LCD_Aip31068_CreateCustomChar(LCD_Aip31068_HandleType *handle,
                                             uint8_h location, const uint8_h *pPattern);
# 5 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.c" 2
# 13 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.c"
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
# 14 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.c" 2
# 45 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.c"

# 45 "HAL/LCD_Aip31068_i2c/lcd_aip31068_i2c.c"
static STD_ReturnType LCD_Aip31068_Transfer(const LCD_Aip31068_HandleType *handle,
                                            uint8_h control,
                                            const uint8_h *pPayload,
                                            uint16_h length)
{
    uint16_h local_Index = 0U;


    if (I2C_Start() != E_OK)
    {
        return E_NOK;
    }


    if (I2C_WriteByte((uint8_h)((handle->i2cAddress << 1) | 0x00U)) != E_OK)
    {
        (void)I2C_Stop();
        return E_NOK;
    }


    if (I2C_WriteByte(control) != E_OK)
    {
        (void)I2C_Stop();
        return E_NOK;
    }


    for (local_Index = 0U; local_Index < length; local_Index++)
    {
        if (I2C_WriteByte(pPayload[local_Index]) != E_OK)
        {
            (void)I2C_Stop();
            return E_NOK;
        }
    }


    (void)I2C_Stop();

    return E_OK;
}





static uint8_h LCD_Aip31068_RowBase(const LCD_Aip31068_HandleType *handle, uint8_h row)
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






STD_ReturnType LCD_Aip31068_Init(LCD_Aip31068_HandleType *handle)
{
    uint8_h local_FunctionSet = 0U;


    if (handle == ((void *)0))
    {
        return E_NOK;
    }

    if (handle->i2cAddress > 0x7FU)
    {
        return E_NOK;
    }

    if ((handle->rows == 0U) || (handle->cols == 0U) || (handle->rows > 4U))
    {
        return E_NOK;
    }

    handle->initialized = 0U;


    _delay_ms(50);







    local_FunctionSet = 0x20 | 0x10U;

    if (handle->rows > 1U)
    {
        local_FunctionSet |= 0x08U;
    }

    if (LCD_Aip31068_SendCommand(handle, local_FunctionSet) != E_OK)
    {
        return E_NOK;
    }

    _delay_ms(5);
    (void)LCD_Aip31068_SendCommand(handle, local_FunctionSet);
    _delay_us(200);
    (void)LCD_Aip31068_SendCommand(handle, local_FunctionSet);
    _delay_us(200);


    handle->displayControl = 0x08;
    (void)LCD_Aip31068_SendCommand(handle, handle->displayControl);


    (void)LCD_Aip31068_SendCommand(handle, 0x01);
    _delay_ms(2U);


    handle->entryMode = (uint8_h)(0x04 | 0x02);
    (void)LCD_Aip31068_SendCommand(handle, handle->entryMode);


    handle->displayControl = (uint8_h)(0x08 | 0x04);
    (void)LCD_Aip31068_SendCommand(handle, handle->displayControl);


    handle->cursorRow = 0U;
    handle->cursorCol = 0U;
    handle->initialized = 1U;

    return E_OK;
}


STD_ReturnType LCD_Aip31068_SendCommand(LCD_Aip31068_HandleType *handle, uint8_h command)
{
    STD_ReturnType local_Status = E_NOK;


    if (handle == ((void *)0))
    {
        return E_NOK;
    }


    local_Status = LCD_Aip31068_Transfer(handle, 0x00, &command, 1U);


    _delay_us(50U);

    return local_Status;
}


STD_ReturnType LCD_Aip31068_WriteChar(LCD_Aip31068_HandleType *handle, uint8_h character)
{
    STD_ReturnType local_Status = E_NOK;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    local_Status = LCD_Aip31068_Transfer(handle, 0x40, &character, 1U);


    _delay_us(50U);

    return local_Status;
}


STD_ReturnType LCD_Aip31068_WriteString(LCD_Aip31068_HandleType *handle, const uint8_h *pString)
{
    uint16_h local_Length = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U) || (pString == ((void *)0)))
    {
        return E_NOK;
    }


    while (pString[local_Length] != '\0')
    {
        local_Length++;
    }

    if (local_Length == 0U)
    {
        return E_OK;
    }


    return LCD_Aip31068_Transfer(handle, 0x40, pString, local_Length);
}


STD_ReturnType LCD_Aip31068_WriteStringAt(LCD_Aip31068_HandleType *handle,
                                          uint8_h row, uint8_h column,
                                          const uint8_h *pString)
{

    if (LCD_Aip31068_SetCursor(handle, row, column) != E_OK)
    {
        return E_NOK;
    }


    return LCD_Aip31068_WriteString(handle, pString);
}


STD_ReturnType LCD_Aip31068_WriteNumber(LCD_Aip31068_HandleType *handle, sint32 number)
{
    uint8_h local_Text[12];
    uint8_h local_Digits[10];
    uint8_h local_Count = 0U;
    uint8_h local_Length = 0U;
    uint32_h local_Value = 0UL;


    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    if (number == 0)
    {
        return LCD_Aip31068_WriteChar(handle, (uint8_h)'0');
    }





    if (number < 0)
    {
        local_Text[local_Length] = (uint8_h)'-';
        local_Length++;
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
        local_Text[local_Length] = local_Digits[local_Count];
        local_Length++;
    }

    local_Text[local_Length] = '\0';


    return LCD_Aip31068_WriteString(handle, local_Text);
}


STD_ReturnType LCD_Aip31068_SetCursor(LCD_Aip31068_HandleType *handle,
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


    local_Address = (uint8_h)(LCD_Aip31068_RowBase(handle, row) + column);


    if (LCD_Aip31068_SendCommand(handle,
            (uint8_h)(0x80 | local_Address)) != E_OK)
    {
        return E_NOK;
    }

    handle->cursorRow = row;
    handle->cursorCol = column;

    return E_OK;
}


STD_ReturnType LCD_Aip31068_Clear(LCD_Aip31068_HandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    if (LCD_Aip31068_SendCommand(handle, 0x01) != E_OK)
    {
        return E_NOK;
    }

    _delay_ms(2U);

    handle->cursorRow = 0U;
    handle->cursorCol = 0U;

    return E_OK;
}


STD_ReturnType LCD_Aip31068_Home(LCD_Aip31068_HandleType *handle)
{

    if ((handle == ((void *)0)) || (handle->initialized == 0U))
    {
        return E_NOK;
    }


    if (LCD_Aip31068_SendCommand(handle, 0x02) != E_OK)
    {
        return E_NOK;
    }

    _delay_ms(2U);

    handle->cursorRow = 0U;
    handle->cursorCol = 0U;

    return E_OK;
}


STD_ReturnType LCD_Aip31068_DisplayOnOff(LCD_Aip31068_HandleType *handle, uint8_h on)
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


    return LCD_Aip31068_SendCommand(handle, handle->displayControl);
}


STD_ReturnType LCD_Aip31068_CursorOnOff(LCD_Aip31068_HandleType *handle, uint8_h on)
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


    return LCD_Aip31068_SendCommand(handle, handle->displayControl);
}


STD_ReturnType LCD_Aip31068_BlinkOnOff(LCD_Aip31068_HandleType *handle, uint8_h on)
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


    return LCD_Aip31068_SendCommand(handle, handle->displayControl);
}


STD_ReturnType LCD_Aip31068_ShiftDisplay(LCD_Aip31068_HandleType *handle, uint8_h toRight)
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


    return LCD_Aip31068_SendCommand(handle, local_Command);
}


STD_ReturnType LCD_Aip31068_CreateCustomChar(LCD_Aip31068_HandleType *handle,
                                             uint8_h location, const uint8_h *pPattern)
{
    uint8_h local_Rows[8];
    uint8_h local_Index = 0U;


    if ((handle == ((void *)0)) || (handle->initialized == 0U) || (pPattern == ((void *)0)))
    {
        return E_NOK;
    }

    if (location > 7U)
    {
        return E_NOK;
    }


    if (LCD_Aip31068_SendCommand(handle,
            (uint8_h)(0x40 | (uint8_h)(location << 3))) != E_OK)
    {
        return E_NOK;
    }


    for (local_Index = 0U; local_Index < 8U; local_Index++)
    {
        local_Rows[local_Index] = (uint8_h)(pPattern[local_Index] & 0x1FU);
    }


    if (LCD_Aip31068_Transfer(handle, 0x40, local_Rows, 8U) != E_OK)
    {
        return E_NOK;
    }





    return LCD_Aip31068_SetCursor(handle, 0U, 0U);
}
