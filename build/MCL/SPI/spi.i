# 1 "MCL/SPI/spi.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "MCL/SPI/spi.c"
# 1 "MCL/SPI/../../Service/STD_Types.h" 1



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
# 2 "MCL/SPI/spi.c" 2
# 1 "MCL/SPI/../../Service/Bit_Math.h" 1
# 3 "MCL/SPI/spi.c" 2
# 1 "MCL/SPI/spi_registers.h" 1
# 4 "MCL/SPI/spi.c" 2
# 1 "MCL/SPI/spi_interface.h" 1
# 21 "MCL/SPI/spi_interface.h"
typedef enum
{
    SPI_SLAVE = 0,
    SPI_MASTER = 1
} SPI_RoleType;







typedef enum
{
    SPI_CPOL_IDLE_LOW = 0,
    SPI_CPOL_IDLE_HIGH = 1
} SPI_ClockPolarityType;
# 46 "MCL/SPI/spi_interface.h"
typedef enum
{
    SPI_CPHA_SAMPLE_LEADING = 0,
    SPI_CPHA_SAMPLE_TRAILING = 1
} SPI_ClockPhaseType;





typedef enum
{
    SPI_MSB_FIRST = 0,
    SPI_LSB_FIRST = 1
} SPI_DataOrderType;





typedef enum
{
    SPI_CLOCK_DIV_4 = 0,
    SPI_CLOCK_DIV_16 = 1,
    SPI_CLOCK_DIV_64 = 2,
    SPI_CLOCK_DIV_128 = 3,
    SPI_CLOCK_DIV_2 = 4,
    SPI_CLOCK_DIV_8 = 5,
    SPI_CLOCK_DIV_32 = 6
} SPI_ClockRateType;
# 86 "MCL/SPI/spi_interface.h"
typedef struct
{
    SPI_RoleType role;
    SPI_ClockPolarityType polarity;
    SPI_ClockPhaseType phase;
    SPI_DataOrderType dataOrder;
    SPI_ClockRateType clockRate;
} SPI_ConfigType;






typedef void (*SPI_CallBackType)(uint8_h receivedByte);
# 113 "MCL/SPI/spi_interface.h"
STD_ReturnType SPI_Init(const SPI_ConfigType *addConfig);





STD_ReturnType SPI_DeInit(void);
# 129 "MCL/SPI/spi_interface.h"
STD_ReturnType SPI_Transceive(uint8_h txByte, uint8_h *puint8Rx);






STD_ReturnType SPI_SendByte(uint8_h txByte);






STD_ReturnType SPI_SendString(const uint8_h *pString);







STD_ReturnType SPI_SetCallBack(SPI_CallBackType callBack);
# 5 "MCL/SPI/spi.c" 2
# 19 "MCL/SPI/spi.c"
STD_ReturnType SPI_Init(const SPI_ConfigType *addConfig)
{
# 43 "MCL/SPI/spi.c"
    return E_NOK;
}


STD_ReturnType SPI_DeInit(void)
{





    return E_NOK;
}


STD_ReturnType SPI_Transceive(uint8_h txByte, uint8_h *puint8Rx)
{
# 71 "MCL/SPI/spi.c"
    return E_NOK;
}


STD_ReturnType SPI_SendByte(uint8_h txByte)
{



    return E_NOK;
}


STD_ReturnType SPI_SendString(const uint8_h *pString)
{





    return E_NOK;
}


STD_ReturnType SPI_SetCallBack(SPI_CallBackType callBack)
{
# 107 "MCL/SPI/spi.c"
    return E_NOK;
}
