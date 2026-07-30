	.file	"elevator_system.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	System_Init
	.type	System_Init, @function
System_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	call Dispatch_Init
	call Safety_Init
	sts system_fault_counter,__zero_reg__
/* epilogue start */
	ret
	.size	System_Init, .-System_Init
.global	System_Update
	.type	System_Update, @function
System_Update:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	call Dispatch_Update
	jmp Safety_Update
	.size	System_Update, .-System_Update
.global	LogFault
	.type	LogFault, @function
LogFault:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	tst r24
	breq .L3
	lds r25,system_fault_counter
	subi r25,lo8(-(1))
	sts system_fault_counter,r25
	jmp Fault_Set
.L3:
/* epilogue start */
	ret
	.size	LogFault, .-LogFault
	.local	system_fault_counter
	.comm	system_fault_counter,1,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
