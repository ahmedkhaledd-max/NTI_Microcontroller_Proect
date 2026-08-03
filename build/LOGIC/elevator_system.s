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
	call Motion_Init
	sts system_fault_counter,__zero_reg__
	sts forced_dir+1,__zero_reg__
	sts forced_dir,__zero_reg__
	sts is_moving,__zero_reg__
/* epilogue start */
	ret
	.size	System_Init, .-System_Init
.global	System_Update
	.type	System_Update, @function
System_Update:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	call Elevator_GetCurPosition
	mov r28,r24
	call IO_Update
	ldi r24,lo8(4)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L4
	ldi r24,lo8(5)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L4
	ldi r24,lo8(7)
	call IO_GetButtonEvent
	tst r24
	breq .L34
.L4:
	ldi r24,lo8(1)
	ldi r25,0
	sts forced_dir+1,r25
	sts forced_dir,r24
.L36:
	sts is_moving,r24
.L7:
	lds r24,is_moving
	tst r24
	brne .+2
	rjmp .L16
	lds r24,forced_dir
	lds r25,forced_dir+1
	cpi r24,1
	cpc r25,__zero_reg__
	breq .+2
	rjmp .L17
	ldi r20,lo8(1)
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(5)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,lo8(1)
.L37:
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	rjmp .L38
.L34:
	ldi r24,lo8(6)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L9
	ldi r24,lo8(8)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L9
	ldi r24,lo8(9)
	call IO_GetButtonEvent
	tst r24
	breq .L35
.L9:
	ldi r24,lo8(2)
	ldi r25,0
	sts forced_dir+1,r25
	sts forced_dir,r24
	ldi r24,lo8(1)
	rjmp .L36
.L35:
	ldi r24,0
	call IO_GetButtonEvent
	tst r24
	breq .L12
	cpse r28,__zero_reg__
	rjmp .L9
	rjmp .L7
.L12:
	ldi r24,lo8(1)
	call IO_GetButtonEvent
	tst r24
	breq .L13
	tst r28
	brne .+2
	rjmp .L4
	cpi r28,lo8(2)
	brsh .L9
	rjmp .L7
.L13:
	ldi r24,lo8(2)
	call IO_GetButtonEvent
	tst r24
	breq .L15
	cpi r28,lo8(2)
	brsh .+2
	rjmp .L4
	cpi r28,lo8(2)
	brne .L9
	rjmp .L7
.L15:
	ldi r24,lo8(3)
	call IO_GetButtonEvent
	tst r24
	brne .+2
	rjmp .L7
	cpi r28,lo8(3)
	brsh .+2
	rjmp .L4
	rjmp .L7
.L17:
	sbiw r24,2
	brne .L18
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	ldi r22,lo8(5)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,lo8(1)
.L38:
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
.L18:
	ldi r22,lo8(7)
	ldi r24,lo8(1)
	call GPIO_GetPinStatus
	or r24,r25
	breq .+2
	rjmp .L19
	ldi r20,0
	ldi r22,lo8(6)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,0
	call GPIO_SetPinValue
.L20:
	ldi r22,lo8(6)
	ldi r24,lo8(1)
	call GPIO_GetPinStatus
	or r24,r25
	breq .+2
	rjmp .L22
	ldi r20,lo8(1)
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinValue
	ldi r20,lo8(1)
.L39:
	ldi r22,lo8(4)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r22,lo8(5)
	ldi r24,lo8(2)
	call GPIO_GetPinStatus
	or r24,r25
	brne .L24
	sts is_moving,__zero_reg__
	sts forced_dir+1,__zero_reg__
	sts forced_dir,__zero_reg__
	call Elevator_StopMotion
	ldi r20,0
	ldi r22,lo8(6)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
.L24:
/* epilogue start */
	pop r28
	jmp Motion_Update
.L16:
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(5)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	rjmp .L37
.L19:
	ldi r24,lo8(10)
	call IO_GetButtonEvent
	tst r24
	breq .L21
	call Elevator_OpenDoor
	rjmp .L20
.L21:
	ldi r24,lo8(11)
	call IO_GetButtonEvent
	tst r24
	brne .+2
	rjmp .L20
	call Elevator_CloseDoor
	rjmp .L20
.L22:
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinValue
	ldi r20,0
	rjmp .L39
	.size	System_Update, .-System_Update
.global	LogFault
	.type	LogFault, @function
LogFault:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	tst r24
	breq .L40
	lds r25,system_fault_counter
	subi r25,lo8(-(1))
	sts system_fault_counter,r25
	jmp Fault_Set
.L40:
/* epilogue start */
	ret
	.size	LogFault, .-LogFault
	.local	is_moving
	.comm	is_moving,1,1
	.local	forced_dir
	.comm	forced_dir,2,1
	.local	system_fault_counter
	.comm	system_fault_counter,1,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
