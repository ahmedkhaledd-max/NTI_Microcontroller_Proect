# 1 "MCL/UART/uart.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "MCL/UART/uart.c"
# 1 "MCL/UART/../../Service/STD_Types.h" 1



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
# 2 "MCL/UART/uart.c" 2
# 1 "MCL/UART/../../Service/Bit_Math.h" 1
# 3 "MCL/UART/uart.c" 2
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
# 4 "MCL/UART/uart.c" 2
# 1 "MCL/UART/uart_registers.h" 1
# 5 "MCL/UART/uart.c" 2
# 1 "MCL/UART/uart_interface.h" 1
# 41 "MCL/UART/uart_interface.h"

# 41 "MCL/UART/uart_interface.h"
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
# 79 "MCL/UART/uart_interface.h"
typedef struct
{
    uint32_h baudRate;
    UART_DataSizeType dataSize;
    UART_ParityType parity;
    UART_StopBitType stopBits;
} UART_ConfigType;






typedef void (*UART_RxCallBackType)(uint8_h receivedByte);
# 105 "MCL/UART/uart_interface.h"
STD_ReturnType UART_Init(const UART_ConfigType *addConfig);





STD_ReturnType UART_DeInit(void);







STD_ReturnType UART_SendByte(uint8_h uint8Data);







STD_ReturnType UART_ReceiveByte(uint8_h *puint8Data);







STD_ReturnType UART_ReceiveByteNonBlocking(uint8_h *puint8Data);






STD_ReturnType UART_SendString(const uint8_h *pString);
STD_ReturnType UART_SendNumber(uint16_h number);
# 153 "MCL/UART/uart_interface.h"
STD_ReturnType UART_ReceiveString(uint8_h *buffer, uint16_h maxLength, uint8_h terminator);







STD_ReturnType UART_SetRxCallBack(UART_RxCallBackType callBack);
# 6 "MCL/UART/uart.c" 2
# 17 "MCL/UART/uart.c"
static UART_RxCallBackType UART_RxCallBack = ((void *)0);


STD_ReturnType UART_Init(const UART_ConfigType *addConfig)
{
    uint16_h local_UBRR = 0U;
    uint8_h local_UCSRC = 0U;





    if (addConfig == ((void *)0))
    {
        return E_NOK;
    }






    if (addConfig->baudRate == 0UL)
    {
        return E_NOK;
    }
    local_UBRR = (uint16_h)((16000000UL / (16UL * addConfig->baudRate)) - 1UL);







    (*(volatile u8 *)0x40) = (u8)((local_UBRR >> 8) & 0x0FU);
    (*(volatile u8 *)0x29) = (u8)local_UBRR;
# 65 "MCL/UART/uart.c"
    ((local_UCSRC) |= (1U << (7)));
    ((local_UCSRC) &= ~(1U << (6)));
    local_UCSRC |= (u8)(((u8)addConfig->parity & 0x03U) << 4);
    local_UCSRC |= (u8)(((u8)addConfig->stopBits & 0x01U) << 3);
    local_UCSRC |= (u8)(((u8)addConfig->dataSize & 0x03U) << 1);

    (*(volatile u8 *)0x40) = local_UCSRC;






    if (addConfig->dataSize == UART_DATA_9BITS)
    {
        (((*(volatile u8 *)0x2A)) |= (1U << (2)));
    }
    else
    {
        (((*(volatile u8 *)0x2A)) &= ~(1U << (2)));
    }

    (((*(volatile u8 *)0x2A)) |= (1U << (3)));
    (((*(volatile u8 *)0x2A)) |= (1U << (4)));


    return E_OK;
}


STD_ReturnType UART_DeInit(void)
{

    (((*(volatile u8 *)0x2A)) &= ~(1U << (3)));
    (((*(volatile u8 *)0x2A)) &= ~(1U << (4)));


    (((*(volatile u8 *)0x2A)) &= ~(1U << (7)));
    (((*(volatile u8 *)0x2A)) &= ~(1U << (6)));
    (((*(volatile u8 *)0x2A)) &= ~(1U << (5)));

    UART_RxCallBack = ((void *)0);


    return E_OK;
}


STD_ReturnType UART_SendByte(uint8_h uint8Data)
{




    while (((((*(volatile u8 *)0x2B)) >> (5)) & 1U) == 0U)
    {

    }


    (*(volatile u8 *)0x2C) = uint8Data;


    return E_OK;
}


STD_ReturnType UART_ReceiveByte(uint8_h *puint8Data)
{

    if (puint8Data == ((void *)0))
    {
        return E_NOK;
    }





    while (((((*(volatile u8 *)0x2B)) >> (7)) & 1U) == 0U)
    {

    }


    *puint8Data = (*(volatile u8 *)0x2C);


    return E_OK;
}


STD_ReturnType UART_ReceiveByteNonBlocking(uint8_h *puint8Data)
{

    if (puint8Data == ((void *)0))
    {
        return E_NOK;
    }





    if (((((*(volatile u8 *)0x2B)) >> (7)) & 1U) == 0U)
    {
        return E_NOK;
    }


    *puint8Data = (*(volatile u8 *)0x2C);
    return E_OK;
}


STD_ReturnType UART_SendString(const uint8_h *pString)
{
    uint16_h local_Index = 0U;


    if (pString == ((void *)0))
    {
        return E_NOK;
    }





    for (local_Index = 0U; pString[local_Index] != '\0'; local_Index++)
    {
        (void)UART_SendByte(pString[local_Index]);
    }


    return E_OK;
}


STD_ReturnType UART_SendNumber(uint16_h number)
{
    uint8_h buffer[6U];
    uint8_h index = 0U;

    if (number == 0U)
    {
        return UART_SendByte((uint8_h)'0');
    }

    while ((number > 0U) && (index < (sizeof(buffer) - 1U)))
    {
        buffer[index++] = (uint8_h)('0' + (number % 10U));
        number /= 10U;
    }


    for (uint8_h i = 0U; i < (index / 2U); i++)
    {
        uint8_h temp = buffer[i];
        buffer[i] = buffer[index - 1U - i];
        buffer[index - 1U - i] = temp;
    }
    buffer[index] = '\0';

    return UART_SendString(buffer);
}


STD_ReturnType UART_ReceiveString(uint8_h *buffer, uint16_h maxLength, uint8_h terminator)
{
    uint16_h local_Index = 0U;
    uint8_h local_Received = 0U;


    if ((buffer == ((void *)0)) || (maxLength == 0U))
    {
        return E_NOK;
    }
# 251 "MCL/UART/uart.c"
    while (local_Index < (uint16_h)(maxLength - 1U))
    {
        if (UART_ReceiveByte(&local_Received) != E_OK)
        {
            return E_NOK;
        }

        if (local_Received == terminator)
        {
            break;
        }

        buffer[local_Index] = local_Received;
        local_Index++;
    }


    buffer[local_Index] = '\0';


    return E_OK;
}


STD_ReturnType UART_SetRxCallBack(UART_RxCallBackType callBack)
{

    if (callBack == ((void *)0))
    {
        return E_NOK;
    }


    UART_RxCallBack = callBack;


    (((*(volatile u8 *)0x2A)) |= (1U << (7)));


    return E_OK;
}







# 298 "MCL/UART/uart.c" 3
void __vector_13 (void) __attribute__ ((signal,used, externally_visible)) ; void __vector_13 (void)

# 299 "MCL/UART/uart.c"
{
    uint8_h local_Data = (*(volatile u8 *)0x2C);

    if (UART_RxCallBack != ((void *)0))
    {
        UART_RxCallBack(local_Data);
    }
}
