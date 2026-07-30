# 1 "MCL/I2C/i2c.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "MCL/I2C/i2c.c"
# 1 "MCL/I2C/../../Service/STD_Types.h" 1



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
# 2 "MCL/I2C/i2c.c" 2
# 1 "MCL/I2C/../../Service/Bit_Math.h" 1
# 3 "MCL/I2C/i2c.c" 2
# 1 "MCL/I2C/i2c_registers.h" 1
# 4 "MCL/I2C/i2c.c" 2
# 1 "MCL/I2C/i2c_interface.h" 1
# 40 "MCL/I2C/i2c_interface.h"
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
# 78 "MCL/I2C/i2c_interface.h"
STD_ReturnType I2C_InitMaster(const I2C_MasterConfigType *addConfig);
# 87 "MCL/I2C/i2c_interface.h"
STD_ReturnType I2C_InitSlave(const I2C_SlaveConfigType *addConfig);





STD_ReturnType I2C_DeInit(void);






STD_ReturnType I2C_Start(void);





STD_ReturnType I2C_Stop(void);







STD_ReturnType I2C_WriteByte(uint8_h uint8Data);






STD_ReturnType I2C_ReadByteWithAck(uint8_h *puint8Data);






STD_ReturnType I2C_ReadByteWithNack(uint8_h *puint8Data);






uint8_h I2C_GetStatus(void);
# 144 "MCL/I2C/i2c_interface.h"
STD_ReturnType I2C_MasterWrite(uint8_h slaveAddress, const uint8_h *pData, uint16_h length);
# 154 "MCL/I2C/i2c_interface.h"
STD_ReturnType I2C_MasterRead(uint8_h slaveAddress, uint8_h *pBuffer, uint16_h length);
# 5 "MCL/I2C/i2c.c" 2
# 21 "MCL/I2C/i2c.c"
STD_ReturnType I2C_InitMaster(const I2C_MasterConfigType *addConfig)
{
    uint32_h uint32Twbr = 0;


    if (addConfig == ((void *)0))
    {
        return E_NOK;
    }


    if ((addConfig->sclFrequency == 0UL) ||
        ((8000000UL / addConfig->sclFrequency) <= 16UL))
    {
        return E_NOK;
    }


    (((*(volatile u8 *)0x21)) &= ~(1U << (0)));
    (((*(volatile u8 *)0x21)) &= ~(1U << (1)));





    uint32Twbr = ((8000000UL / addConfig->sclFrequency) - 16UL) / 2UL;
    if (uint32Twbr > 255UL)
    {
        uint32Twbr = 255UL;
    }
    (*(volatile u8 *)0x20) = (u8)uint32Twbr;





    (((*(volatile u8 *)0x56)) |= (1U << (2)));


    return E_OK;
}


STD_ReturnType I2C_InitSlave(const I2C_SlaveConfigType *addConfig)
{

    if (addConfig == ((void *)0))
    {
        return E_NOK;
    }





    (*(volatile u8 *)0x22) = (u8)((addConfig->ownAddress & 0x7FU) << 1);

    if (addConfig->enableGeneralCall != 0U)
    {
        (((*(volatile u8 *)0x22)) |= (1U << (0)));
    }






    (*(volatile u8 *)0x56) = (1 << 7) | (1 << 6) | (1 << 2);


    return E_OK;
}


STD_ReturnType I2C_DeInit(void)
{

    (((*(volatile u8 *)0x56)) &= ~(1U << (2)));


    return E_OK;
}


STD_ReturnType I2C_Start(void)
{
    uint8_h uint8Status = 0;


    (*(volatile u8 *)0x56) = (1 << 7) | (1 << 5) | (1 << 2);


    while (((((*(volatile u8 *)0x56)) >> (7)) & 1U) == 0)
    {

    }


    uint8Status = (uint8_h)((*(volatile u8 *)0x21) & 0xF8);

    if ((uint8Status == 0x08) || (uint8Status == 0x10))
    {
        return E_OK;
    }

    return E_NOK;
}


STD_ReturnType I2C_Stop(void)
{

    (*(volatile u8 *)0x56) = (1 << 7) | (1 << 4) | (1 << 2);






    while (((((*(volatile u8 *)0x56)) >> (4)) & 1U) != 0)
    {

    }


    return E_OK;
}


STD_ReturnType I2C_WriteByte(uint8_h uint8Data)
{

    (*(volatile u8 *)0x23) = uint8Data;


    (*(volatile u8 *)0x56) = (1 << 7) | (1 << 2);


    while (((((*(volatile u8 *)0x56)) >> (7)) & 1U) == 0)
    {

    }


    return E_OK;
}
