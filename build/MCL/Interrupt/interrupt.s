	.file	"interrupt.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	EXTI_Init
	.type	EXTI_Init, @function
EXTI_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	EXTI_Init, .-EXTI_Init
.global	EXTI_Enable
	.type	EXTI_Enable, @function
EXTI_Enable:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	EXTI_Enable, .-EXTI_Enable
.global	EXTI_Disable
	.type	EXTI_Disable, @function
EXTI_Disable:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	EXTI_Disable, .-EXTI_Disable
.global	EXTI_SetSenseControl
	.type	EXTI_SetSenseControl, @function
EXTI_SetSenseControl:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	EXTI_SetSenseControl, .-EXTI_SetSenseControl
.global	EXTI_SetCallBack
	.type	EXTI_SetCallBack, @function
EXTI_SetCallBack:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	EXTI_SetCallBack, .-EXTI_SetCallBack
.global	EXTI_EnableGlobalInterrupt
	.type	EXTI_EnableGlobalInterrupt, @function
EXTI_EnableGlobalInterrupt:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	EXTI_EnableGlobalInterrupt, .-EXTI_EnableGlobalInterrupt
.global	EXTI_DisableGlobalInterrupt
	.type	EXTI_DisableGlobalInterrupt, @function
EXTI_DisableGlobalInterrupt:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	EXTI_DisableGlobalInterrupt, .-EXTI_DisableGlobalInterrupt
	.ident	"GCC: (GNU) 7.3.0"
