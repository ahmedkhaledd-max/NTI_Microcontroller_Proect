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
	call Elevator_GetCurPosition
	sts target_floor,r24
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
	ldi r24,0
	call IO_GetButtonEvent
	tst r24
	breq .L3
.L5:
	sts target_floor,__zero_reg__
.L28:
	ldi r24,lo8(1)
	rjmp .L29
.L3:
	ldi r24,lo8(4)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L5
	ldi r24,lo8(1)
	call IO_GetButtonEvent
	tst r24
	breq .L6
.L7:
	ldi r24,lo8(1)
	sts target_floor,r24
.L29:
	sts is_moving,r24
.L4:
	lds r24,is_moving
	tst r24
	brne .+2
	rjmp .L12
	lds r24,target_floor
	cp r24,r28
	brne .+2
	rjmp .L12
	cp r28,r24
	brsh .L13
	ldi r20,lo8(1)
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(5)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,lo8(1)
.L30:
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	rjmp .L31
.L6:
	ldi r24,lo8(5)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L7
	ldi r24,lo8(6)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L7
	ldi r24,lo8(2)
	call IO_GetButtonEvent
	tst r24
	breq .L8
.L9:
	ldi r24,lo8(2)
.L27:
	sts target_floor,r24
	rjmp .L28
.L8:
	ldi r24,lo8(7)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L9
	ldi r24,lo8(8)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L9
	ldi r24,lo8(3)
	call IO_GetButtonEvent
	tst r24
	breq .L10
.L11:
	ldi r24,lo8(3)
	rjmp .L27
.L10:
	ldi r24,lo8(9)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L11
	rjmp .L4
.L13:
	cp r24,r28
	brsh .L14
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
.L31:
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
.L14:
	ldi r22,lo8(7)
	ldi r24,lo8(1)
	call GPIO_GetPinStatus
	or r24,r25
	breq .+2
	rjmp .L15
	ldi r20,0
	ldi r22,lo8(6)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,0
	call GPIO_SetPinValue
.L16:
	ldi r22,lo8(6)
	ldi r24,lo8(1)
	call GPIO_GetPinStatus
	ldi r20,lo8(1)
	or r24,r25
	breq .L32
	ldi r20,0
.L32:
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinValue
	ldi r22,lo8(5)
	ldi r24,lo8(2)
	call GPIO_GetPinStatus
	or r24,r25
	brne .L20
	sts is_moving,__zero_reg__
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
.L20:
/* epilogue start */
	pop r28
	jmp Motion_Update
.L12:
	sts is_moving,__zero_reg__
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(5)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	rjmp .L30
.L15:
	ldi r24,lo8(10)
	call IO_GetButtonEvent
	tst r24
	breq .L17
	call Elevator_OpenDoor
	rjmp .L16
.L17:
	ldi r24,lo8(11)
	call IO_GetButtonEvent
	tst r24
	brne .+2
	rjmp .L16
	call Elevator_CloseDoor
	rjmp .L16
	.size	System_Update, .-System_Update
.global	LogFault
	.type	LogFault, @function
LogFault:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	tst r24
	breq .L33
	lds r25,system_fault_counter
	subi r25,lo8(-(1))
	sts system_fault_counter,r25
	jmp Fault_Set
.L33:
/* epilogue start */
	ret
	.size	LogFault, .-LogFault
	.local	is_moving
	.comm	is_moving,1,1
	.local	target_floor
	.comm	target_floor,1,1
	.local	system_fault_counter
	.comm	system_fault_counter,1,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
