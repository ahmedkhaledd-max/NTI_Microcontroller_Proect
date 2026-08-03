	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	call IO_Init
	call Elevator_Motion_Init
	call Elevator_Safety_Init
	call Elevator_Dispatch_Init
	call System_Init
	call LCD_ShowStatus
.L2:
	call System_Update
	rjmp .L2
	.size	main, .-main
	.ident	"GCC: (GNU) 7.3.0"
