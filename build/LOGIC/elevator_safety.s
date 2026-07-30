	.file	"elevator_safety.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	Elevator_Safety_Init
	.type	Elevator_Safety_Init, @function
Elevator_Safety_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts current_fault+1,__zero_reg__
	sts current_fault,__zero_reg__
/* epilogue start */
	ret
	.size	Elevator_Safety_Init, .-Elevator_Safety_Init
.global	Elevator_CheckFaults
	.type	Elevator_CheckFaults, @function
Elevator_CheckFaults:
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
	std Y+4,__zero_reg__
	std Y+3,__zero_reg__
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	movw r20,r28
	subi r20,-4
	sbci r21,-1
	ldi r22,lo8(5)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldd r24,Y+4
	cpi r24,lo8(1)
	brne .L3
	ldi r24,lo8(1)
	ldi r25,0
.L7:
	sts current_fault+1,r25
	sts current_fault,r24
.L2:
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
.L3:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	ldi r24,lo8(1)
	call ADC_ReadChannelBlocking
	ldd r24,Y+1
	ldd r25,Y+2
	cpi r24,33
	sbci r25,3
	brlo .L5
	ldi r24,lo8(3)
	ldi r25,0
	rjmp .L7
.L5:
	movw r20,r28
	subi r20,-3
	sbci r21,-1
	ldi r22,lo8(7)
	ldi r24,lo8(1)
	call GPIO_SetPinValue
	ldd r24,Y+3
	cpi r24,lo8(1)
	brne .L6
	ldi r24,lo8(2)
	ldi r25,0
	rjmp .L7
.L6:
	sts current_fault+1,__zero_reg__
	sts current_fault,__zero_reg__
	ldi r25,0
	ldi r24,0
	rjmp .L2
	.size	Elevator_CheckFaults, .-Elevator_CheckFaults
.global	Elevator_LogFault
	.type	Elevator_LogFault, @function
Elevator_LogFault:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts current_fault+1,r25
	sts current_fault,r24
/* epilogue start */
	ret
	.size	Elevator_LogFault, .-Elevator_LogFault
.global	Elevator_SendTelemetry
	.type	Elevator_SendTelemetry, @function
Elevator_SendTelemetry:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	Elevator_SendTelemetry, .-Elevator_SendTelemetry
.global	Safety_Init
	.type	Safety_Init, @function
Safety_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts current_fault+1,__zero_reg__
	sts current_fault,__zero_reg__
/* epilogue start */
	ret
	.size	Safety_Init, .-Safety_Init
.global	Safety_Update
	.type	Safety_Update, @function
Safety_Update:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp Elevator_CheckFaults
	.size	Safety_Update, .-Safety_Update
.global	Emergency_Stop
	.type	Emergency_Stop, @function
Emergency_Stop:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	ldi r25,0
	sts current_fault+1,r25
	sts current_fault,r24
/* epilogue start */
	ret
	.size	Emergency_Stop, .-Emergency_Stop
.global	Fault_Set
	.type	Fault_Set, @function
Fault_Set:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r25,0
	sts current_fault+1,r25
	sts current_fault,r24
/* epilogue start */
	ret
	.size	Fault_Set, .-Fault_Set
.global	Fault_Clear
	.type	Fault_Clear, @function
Fault_Clear:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r18,current_fault
	lds r19,current_fault+1
	cp r24,r18
	cpc __zero_reg__,r19
	brne .L14
	sts current_fault+1,__zero_reg__
	sts current_fault,__zero_reg__
.L14:
/* epilogue start */
	ret
	.size	Fault_Clear, .-Fault_Clear
.global	Fault_IsActive
	.type	Fault_IsActive, @function
Fault_IsActive:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(1)
	lds r18,current_fault
	lds r19,current_fault+1
	or r18,r19
	brne .L17
	ldi r24,0
.L17:
/* epilogue start */
	ret
	.size	Fault_IsActive, .-Fault_IsActive
	.local	current_fault
	.comm	current_fault,2,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
