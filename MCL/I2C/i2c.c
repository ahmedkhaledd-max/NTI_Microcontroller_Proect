#include "../../Service/STD_Types.h"
#include "../../Service/Bit_Math.h"
#include "i2c_registers.h"
#include "i2c_interface.h"

/* ================================================================================
 *  I2C (TWI) DRIVER - IMPLEMENTATION SKELETON
 *  ------------------------------------------------------------------------------
 *  Each body lists the ordered steps to implement the function. Replace the
 *  numbered comments with the actual register manipulation code.
 *
 *  Common TWI idiom used throughout:
 *    - Start an operation by writing TWCR with TWINT=1 (clears the flag/kicks it
 *      off) plus whatever control bits are needed (TWEN, TWSTA, TWSTO, TWEA...).
 *    - Wait for completion by polling until TWINT becomes 1 again:
 *          while ( GET_BIT(I2C_TWCR_REG, I2C_TWINT_BIT) == 0 ) { }
 *    - Then inspect the status with (I2C_TWSR_REG & I2C_TWSR_STATUS_MASK).
 * ============================================================================== */


STD_ReturnType I2C_InitMaster(const I2C_MasterConfigType *addConfig)
{
    uint32_h uint32Twbr = 0;

    /* STEP 1: Validate addConfig != NULL (else E_NOK). */
    if (addConfig == NULL)
    {
        return E_NOK;
    }

    /* The SCL frequency must be low enough to give TWBR >= 0, i.e. F_CPU/SCL > 16. */
    if ((addConfig->sclFrequency == 0UL) ||
        ((I2C_F_CPU / addConfig->sclFrequency) <= 16UL))
    {
        return E_NOK;
    }

    /* STEP 2: Set the prescaler to 1 by clearing TWPS1:TWPS0 in TWSR. */
    CLR_BIT(I2C_TWSR_REG, I2C_TWPS0_BIT);
    CLR_BIT(I2C_TWSR_REG, I2C_TWPS1_BIT);

    /*
     * STEP 3: Compute and load the bit-rate register (prescaler = 1):
     *         TWBR = (F_CPU / SCL_freq - 16) / 2
     */
    uint32Twbr = ((I2C_F_CPU / addConfig->sclFrequency) - 16UL) / 2UL;
    if (uint32Twbr > 255UL)
    {
        uint32Twbr = 255UL;   /* Clamp: slower than requested rather than wrap around. */
    }
    I2C_TWBR_REG = (u8)uint32Twbr;

    /*
     * STEP 4: Enable the peripheral: SET_BIT(I2C_TWCR_REG, I2C_TWEN_BIT).
     *         (A pure master needs no own address; TWAR may be left at reset.)
     */
    SET_BIT(I2C_TWCR_REG, I2C_TWEN_BIT);

    /* STEP 5: Return E_OK. */
    return E_OK;
}


STD_ReturnType I2C_InitSlave(const I2C_SlaveConfigType *addConfig)
{
    /* STEP 1: Validate addConfig != NULL (else E_NOK). */
    if (addConfig == NULL)
    {
        return E_NOK;
    }

    /*
     * STEP 2: Load the own address into the high 7 bits of TWAR.
     *         The low bit of TWAR is TWGCE, so the address is shifted left by one.
     */
    I2C_TWAR_REG = (u8)((addConfig->ownAddress & 0x7FU) << 1);

    if (addConfig->enableGeneralCall != 0U)
    {
        SET_BIT(I2C_TWAR_REG, I2C_TWGCE_BIT);
    }

    /*
     * STEP 3: Enable the peripheral with acknowledge on:
     *         TWEA lets the hardware ACK its own address, TWEN enables the TWI, and
     *         writing TWINT=1 clears any pending flag so the bus is released.
     */
    I2C_TWCR_REG = (1 << I2C_TWINT_BIT) | (1 << I2C_TWEA_BIT) | (1 << I2C_TWEN_BIT);

    /* STEP 4: Return E_OK. */
    return E_OK;
}


STD_ReturnType I2C_DeInit(void)
{
    /* STEP 1: Disable the peripheral: releases SCL/SDA back to plain I/O pins. */
    CLR_BIT(I2C_TWCR_REG, I2C_TWEN_BIT);

    /* STEP 2: Return E_OK. */
    return E_OK;
}


STD_ReturnType I2C_Start(void)
{
    uint8_h uint8Status = 0;

    /* STEP 1: Trigger a START condition (TWSTA), clearing the flag with TWINT. */
    I2C_TWCR_REG = (1 << I2C_TWINT_BIT) | (1 << I2C_TWSTA_BIT) | (1 << I2C_TWEN_BIT);

    /* STEP 2: Wait until TWINT is set again (operation complete). */
    while (GET_BIT(I2C_TWCR_REG, I2C_TWINT_BIT) == 0)
    {
        /* Busy wait. */
    }

    /* STEP 3: A plain START and a repeated START are both a success here. */
    uint8Status = (uint8_h)(I2C_TWSR_REG & I2C_TWSR_STATUS_MASK);

    if ((uint8Status == I2C_STATUS_START) || (uint8Status == I2C_STATUS_REP_START))
    {
        return E_OK;
    }

    return E_NOK;
}


STD_ReturnType I2C_Stop(void)
{
    /* STEP 1: Trigger a STOP condition (TWSTO), clearing the flag with TWINT. */
    I2C_TWCR_REG = (1 << I2C_TWINT_BIT) | (1 << I2C_TWSTO_BIT) | (1 << I2C_TWEN_BIT);

    /*
     * STEP 2: STOP raises no TWINT; the hardware clears TWSTO itself once the
     *         condition is on the bus. Spin on it so the bus is really free
     *         before the caller starts another transaction.
     */
    while (GET_BIT(I2C_TWCR_REG, I2C_TWSTO_BIT) != 0)
    {
        /* Busy wait. */
    }

    /* STEP 3: Return E_OK. */
    return E_OK;
}


STD_ReturnType I2C_WriteByte(uint8_h uint8Data)
{
    /* STEP 1: Load the byte into the data register (must happen while TWINT is set). */
    I2C_TWDR_REG = uint8Data;

    /* STEP 2: Start transmission: TWINT clears the flag, TWEN keeps the TWI on. */
    I2C_TWCR_REG = (1 << I2C_TWINT_BIT) | (1 << I2C_TWEN_BIT);

    /* STEP 3: Wait until TWINT is set again (byte shifted out, ACK bit sampled). */
    while (GET_BIT(I2C_TWCR_REG, I2C_TWINT_BIT) == 0)
    {
        /* Busy wait. */
    }

    /* STEP 4: The caller checks I2C_GetStatus() for ACK/NACK when needed. */
    return E_OK;
}



