	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	Update_LEDs, @function
Update_LEDs:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	or r22,r23
	breq .L2
	ldi r20,lo8(1)
	ldi r22,lo8(4)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
.L6:
	ldi r22,lo8(2)
	ldi r24,lo8(2)
.L4:
	call GPIO_SetPinValue
	ldi r20,0
	rjmp .L5
.L2:
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	cpi r28,1
	cpc r29,__zero_reg__
	brne .L3
	ldi r20,lo8(1)
	rjmp .L6
.L3:
	ldi r20,0
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	sbiw r28,2
	brne .L4
	call GPIO_SetPinValue
	ldi r20,lo8(1)
.L5:
	ldi r22,lo8(3)
	ldi r24,lo8(2)
/* epilogue start */
	pop r29
	pop r28
	jmp GPIO_SetPinValue
	.size	Update_LEDs, .-Update_LEDs
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
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	call IO_Init
	call Elevator_Dispatch_Init
	call Elevator_Motion_Init
	call Safety_Init
	call LCD_ShowStatus
	call Elevator_GetCurPosition
	mov r13,r24
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	ldi r17,0
	ldi r16,0
.L8:
	call IO_Update
	call Motion_Update
	call Safety_Update
	ldi r24,0
	call IO_GetButtonEvent
	tst r24
	breq .L9
	ldi r22,0
	ldi r24,0
	call Elevator_AddCall
.L9:
	ldi r24,lo8(1)
	call IO_GetButtonEvent
	tst r24
	breq .L10
	ldi r22,0
	ldi r24,lo8(1)
	call Elevator_AddCall
.L10:
	ldi r24,lo8(2)
	call IO_GetButtonEvent
	tst r24
	breq .L11
	ldi r22,0
	ldi r24,lo8(2)
	call Elevator_AddCall
.L11:
	ldi r24,lo8(3)
	call IO_GetButtonEvent
	tst r24
	breq .L12
	ldi r22,0
	ldi r24,lo8(3)
	call Elevator_AddCall
.L12:
	ldi r24,lo8(4)
	call IO_GetButtonEvent
	tst r24
	breq .L13
	ldi r22,lo8(1)
	ldi r24,0
	call Elevator_AddCall
.L13:
	ldi r24,lo8(5)
	call IO_GetButtonEvent
	tst r24
	breq .L14
	ldi r22,lo8(1)
	ldi r24,lo8(1)
	call Elevator_AddCall
.L14:
	ldi r24,lo8(6)
	call IO_GetButtonEvent
	tst r24
	breq .L15
	ldi r22,lo8(2)
	ldi r24,lo8(1)
	call Elevator_AddCall
.L15:
	ldi r24,lo8(7)
	call IO_GetButtonEvent
	tst r24
	breq .L16
	ldi r22,lo8(1)
	ldi r24,lo8(2)
	call Elevator_AddCall
.L16:
	ldi r24,lo8(8)
	call IO_GetButtonEvent
	tst r24
	breq .L17
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call Elevator_AddCall
.L17:
	ldi r24,lo8(9)
	call IO_GetButtonEvent
	tst r24
	breq .L18
	ldi r22,lo8(2)
	ldi r24,lo8(3)
	call Elevator_AddCall
.L18:
	ldi r24,lo8(10)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	call Elevator_OpenDoor
.L19:
	ldi r24,lo8(11)
	call IO_GetButtonEvent
	cpse r24,__zero_reg__
	call Elevator_CloseDoor
.L20:
	ldi r24,lo8(12)
	call IO_GetButtonEvent
	tst r24
	breq .L21
	ldi r24,lo8(3)
	call Gong_Play
.L21:
	call Elevator_CheckFaults
	movw r10,r24
	sbiw r24,0
	breq .L22
	call Elevator_LogFault
	call Elevator_StopMotion
	call LCD_ShowFault
	ldi r24,lo8(3)
	call Gong_Play
	movw r22,r10
	ldi r25,0
	ldi r24,0
	call Update_LEDs
	call Elevator_SendTelemetry
	ldi r16,lo8(5)
	ldi r17,0
	rjmp .L8
.L22:
	cpi r16,5
	cpc r17,__zero_reg__
	brne .L24
	call LCD_ShowStatus
	ldi r17,0
	ldi r16,0
.L24:
	call Elevator_GetCurPosition
	mov r12,r24
	cpi r16,1
	cpc r17,__zero_reg__
	breq .L26
	brlo .L27
	cpi r16,3
	cpc r17,__zero_reg__
	brne .+2
	rjmp .L28
	cpi r16,4
	cpc r17,__zero_reg__
	brne .+2
	rjmp .L29
	ldi r16,lo8(2)
	ldi r17,0
	rjmp .L25
.L27:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call Elevator_CalculateNextFloor
	mov r13,r24
	ldi r23,0
	ldi r22,0
	ldd r24,Y+1
	ldd r25,Y+2
	call Update_LEDs
	cp r12,r13
	breq .L25
	mov r24,r13
	call Elevator_MoveToFloor
	ldi r16,lo8(1)
	ldi r17,0
.L25:
	movw r24,r16
	sbiw r24,3
	sbiw r24,2
	brsh .L30
	ldi r24,-1
	sub r14,r24
	sbc r15,r24
.L30:
	call Elevator_SendTelemetry
	rjmp .L8
.L26:
	ldi r23,0
	ldi r22,0
	ldd r24,Y+1
	ldd r25,Y+2
	call Update_LEDs
	cpse r13,r12
	rjmp .L25
	call Elevator_StopMotion
	mov r24,r13
	call Elevator_ClearCall
	ldi r24,lo8(1)
	call Gong_Play
	call Elevator_OpenDoor
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	call Update_LEDs
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	ldi r16,lo8(3)
	ldi r17,0
	rjmp .L25
.L28:
	ldi r24,-56
	cp r14,r24
	cpc r15,__zero_reg__
	brlo .L25
	call Elevator_CloseDoor
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	ldi r16,lo8(4)
	ldi r17,0
	rjmp .L25
.L29:
	ldi r24,100
	cp r14,r24
	cpc r15,__zero_reg__
	brlo .L25
	ldi r17,0
	ldi r16,0
	rjmp .L25
	.size	main, .-main
	.ident	"GCC: (GNU) 7.3.0"
