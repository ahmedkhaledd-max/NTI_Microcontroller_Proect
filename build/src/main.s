	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	Process_Button_Inputs, @function
Process_Button_Inputs:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
	call IO_GetButtonEvent
	tst r24
	breq .L2
	ldi r22,0
	ldi r24,0
	call Elevator_AddCall
.L2:
	ldi r24,lo8(1)
	call IO_GetButtonEvent
	tst r24
	breq .L3
	ldi r22,0
	ldi r24,lo8(1)
	call Elevator_AddCall
.L3:
	ldi r24,lo8(2)
	call IO_GetButtonEvent
	tst r24
	breq .L4
	ldi r22,0
	ldi r24,lo8(2)
	call Elevator_AddCall
.L4:
	ldi r24,lo8(3)
	call IO_GetButtonEvent
	tst r24
	breq .L5
	ldi r22,0
	ldi r24,lo8(3)
	call Elevator_AddCall
.L5:
	ldi r24,lo8(4)
	call IO_GetButtonEvent
	tst r24
	breq .L6
	ldi r22,lo8(1)
	ldi r24,0
	call Elevator_AddCall
.L6:
	ldi r24,lo8(5)
	call IO_GetButtonEvent
	tst r24
	breq .L7
	ldi r22,lo8(1)
	ldi r24,lo8(1)
	call Elevator_AddCall
.L7:
	ldi r24,lo8(7)
	call IO_GetButtonEvent
	tst r24
	breq .L8
	ldi r22,lo8(1)
	ldi r24,lo8(2)
	call Elevator_AddCall
.L8:
	ldi r24,lo8(6)
	call IO_GetButtonEvent
	tst r24
	breq .L9
	ldi r22,lo8(2)
	ldi r24,lo8(1)
	call Elevator_AddCall
.L9:
	ldi r24,lo8(8)
	call IO_GetButtonEvent
	tst r24
	breq .L10
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call Elevator_AddCall
.L10:
	ldi r24,lo8(9)
	call IO_GetButtonEvent
	tst r24
	breq .L1
	ldi r22,lo8(2)
	ldi r24,lo8(3)
	jmp Elevator_AddCall
.L1:
/* epilogue start */
	ret
	.size	Process_Button_Inputs, .-Process_Button_Inputs
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
	push r28
	push r29
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 4 */
.L__stack_usage = 4
	call IO_Init
	call Elevator_Motion_Init
	call Elevator_Safety_Init
	call Elevator_Dispatch_Init
	call System_Init
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	call LCD_ShowStatus
	mov r13,__zero_reg__
	mov r12,__zero_reg__
	mov r15,__zero_reg__
	ldi r17,0
	ldi r16,0
.L40:
	call IO_Update
	call System_Update
	call Motion_Update
	call Elevator_GetCurPosition
	mov r14,r24
	call Elevator_CheckFaults
	movw r10,r24
	or r24,r25
	breq .L41
	cpi r16,5
	cpc r17,__zero_reg__
	breq .L41
	call Elevator_StopMotion
	movw r24,r10
	call Elevator_LogFault
	ldi r20,lo8(1)
	ldi r22,lo8(4)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	call Process_Button_Inputs
.L42:
	call Elevator_StopMotion
	call Elevator_CheckFaults
	ldi r16,lo8(5)
	ldi r17,0
	or r24,r25
	breq .+2
	rjmp .L43
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	rjmp .L73
.L41:
	call Process_Button_Inputs
	cpi r16,1
	cpc r17,__zero_reg__
	brne .+2
	rjmp .L44
	brlo .L45
	cpi r16,3
	cpc r17,__zero_reg__
	brne .+2
	rjmp .L46
	cpi r16,5
	cpc r17,__zero_reg__
	breq .L42
.L73:
	ldi r17,0
	ldi r16,0
	rjmp .L43
.L45:
	ldi r20,0
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	mov r24,r14
	call Elevator_CalculateNextFloor
	mov r15,r24
	ldd r24,Y+1
	ldd r25,Y+2
	or r24,r25
	breq .L47
	cp r14,r15
	breq .L48
	call Elevator_CloseDoor
	mov r24,r15
	call Elevator_MoveToFloor
	ldd r24,Y+1
	ldd r25,Y+2
	cpi r24,1
	cpc r25,__zero_reg__
	brne .L49
	ldi r20,lo8(1)
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
.L74:
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
.L75:
	ldi r16,lo8(1)
	ldi r17,0
.L43:
	call Elevator_SendTelemetry
	cpi r16,5
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L53
	call LCD_ShowFault
	rjmp .L40
.L49:
	sbiw r24,2
	brne .L75
	ldi r20,0
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	rjmp .L74
.L47:
	cpse r14,r15
	rjmp .L43
.L48:
	ldi r24,lo8(10)
	call IO_GetButtonEvent
	tst r24
	breq .L43
	mov r24,r14
	call Elevator_ClearCall
.L76:
	call Elevator_OpenDoor
	mov r13,__zero_reg__
	mov r12,__zero_reg__
	ldi r16,lo8(3)
	ldi r17,0
	rjmp .L43
.L44:
	cpse r15,r14
	rjmp .L50
	call Elevator_StopMotion
	mov r24,r15
	call Elevator_ClearCall
	ldi r20,0
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	rjmp .L76
.L50:
	mov r24,r15
	call Elevator_MoveToFloor
	rjmp .L43
.L46:
	ldi r24,lo8(11)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	rjmp .L51
	ldi r24,-1
	sub r12,r24
	sbc r13,r24
	ldi r24,44
	cp r12,r24
	ldi r24,1
	cpc r13,r24
	brlo .L52
.L51:
	call Elevator_CloseDoor
	mov r13,__zero_reg__
	mov r12,__zero_reg__
	rjmp .L73
.L52:
	ldi r24,lo8(10)
	call IO_GetButtonEvent
	tst r24
	brne .+2
	rjmp .L43
	call Elevator_OpenDoor
	mov r13,__zero_reg__
	mov r12,__zero_reg__
	rjmp .L43
.L53:
	call LCD_ShowStatus
	rjmp .L40
	.size	main, .-main
	.ident	"GCC: (GNU) 7.3.0"
