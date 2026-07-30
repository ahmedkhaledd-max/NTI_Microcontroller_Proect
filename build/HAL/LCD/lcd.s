	.file	"lcd.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	LCD_Init
	.type	LCD_Init, @function
LCD_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_Init, .-LCD_Init
.global	LCD_SendCommand
	.type	LCD_SendCommand, @function
LCD_SendCommand:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_SendCommand, .-LCD_SendCommand
.global	LCD_WriteChar
	.type	LCD_WriteChar, @function
LCD_WriteChar:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_WriteChar, .-LCD_WriteChar
.global	LCD_WriteString
	.type	LCD_WriteString, @function
LCD_WriteString:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_WriteString, .-LCD_WriteString
.global	LCD_WriteNumber
	.type	LCD_WriteNumber, @function
LCD_WriteNumber:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_WriteNumber, .-LCD_WriteNumber
.global	LCD_SetCursor
	.type	LCD_SetCursor, @function
LCD_SetCursor:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_SetCursor, .-LCD_SetCursor
.global	LCD_Clear
	.type	LCD_Clear, @function
LCD_Clear:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_Clear, .-LCD_Clear
.global	LCD_CreateCustomChar
	.type	LCD_CreateCustomChar, @function
LCD_CreateCustomChar:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_CreateCustomChar, .-LCD_CreateCustomChar
	.ident	"GCC: (GNU) 7.3.0"
