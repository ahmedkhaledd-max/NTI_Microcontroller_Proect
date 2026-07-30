	.file	"spi.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	SPI_Init
	.type	SPI_Init, @function
SPI_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	SPI_Init, .-SPI_Init
.global	SPI_DeInit
	.type	SPI_DeInit, @function
SPI_DeInit:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	SPI_DeInit, .-SPI_DeInit
.global	SPI_Transceive
	.type	SPI_Transceive, @function
SPI_Transceive:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	SPI_Transceive, .-SPI_Transceive
.global	SPI_SendByte
	.type	SPI_SendByte, @function
SPI_SendByte:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	SPI_SendByte, .-SPI_SendByte
.global	SPI_SendString
	.type	SPI_SendString, @function
SPI_SendString:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	SPI_SendString, .-SPI_SendString
.global	SPI_SetCallBack
	.type	SPI_SetCallBack, @function
SPI_SetCallBack:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	SPI_SetCallBack, .-SPI_SetCallBack
	.ident	"GCC: (GNU) 7.3.0"
