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
	call Elevator_Dispatch_Init
	call Elevator_Motion_Init
	call Elevator_Safety_Init
	call Elevator_GetCurPosition
	mov r6,r24
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	mov r5,__zero_reg__
	mov r13,__zero_reg__
	mov r12,__zero_reg__
	ldi r17,0
	ldi r16,0
	ldi r24,lo8(-120)
	mov r10,r24
	ldi r24,lo8(19)
	mov r11,r24
	ldi r25,lo8(3)
	mov r8,r25
	mov r9,__zero_reg__
.L2:
	ldi r24,-1
	sub r12,r24
	sbc r13,r24
	call Elevator_CheckFaults
	sbiw r24,0
	breq .L3
	call Elevator_LogFault
	call Elevator_StopMotion
	call Elevator_SendTelemetry
	ldi r16,lo8(5)
	ldi r17,0
	rjmp .L2
.L3:
	movw r24,r12
	movw r22,r10
	call __udivmodhi4
	or r24,r25
	brne .L5
	ldi r24,lo8(1)
	cp r5,r24
	breq .L7
	cp r5,r24
	brlo .L8
	ldi r24,lo8(2)
	cp r5,r24
	breq .L9
.L6:
	mov r24,r5
	ldi r25,0
	adiw r24,1
	movw r22,r8
	call __udivmodhi4
	mov r5,r24
.L5:
	call Elevator_GetCurPosition
	mov r7,r24
	cpi r16,1
	cpc r17,__zero_reg__
	breq .L11
	brlo .L12
	cpi r16,3
	cpc r17,__zero_reg__
	breq .L13
	cpi r16,4
	cpc r17,__zero_reg__
	breq .L14
.L10:
	movw r24,r16
	sbiw r24,3
	sbiw r24,2
	brsh .L15
	ldi r24,-1
	sub r14,r24
	sbc r15,r24
.L15:
	call Elevator_SendTelemetry
	rjmp .L2
.L8:
	ldi r22,0
	ldi r24,lo8(2)
.L16:
	call Elevator_AddCall
	rjmp .L6
.L7:
	ldi r22,lo8(1)
	ldi r24,0
	rjmp .L16
.L9:
	ldi r22,lo8(2)
	ldi r24,lo8(3)
	rjmp .L16
.L12:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call Elevator_CalculateNextFloor
	mov r6,r24
	cp r7,r24
	breq .L10
	call Elevator_MoveToFloor
	ldi r16,lo8(1)
	ldi r17,0
	rjmp .L10
.L11:
	cpse r6,r24
	rjmp .L10
	call Elevator_StopMotion
	mov r24,r6
	call Elevator_ClearCall
	call Elevator_OpenDoor
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	ldi r16,lo8(3)
	ldi r17,0
	rjmp .L10
.L13:
	ldi r24,-56
	cp r14,r24
	cpc r15,__zero_reg__
	brlo .L10
	call Elevator_CloseDoor
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	ldi r16,lo8(4)
	ldi r17,0
	rjmp .L10
.L14:
	ldi r24,100
	cp r14,r24
	cpc r15,__zero_reg__
	brlo .L10
	ldi r17,0
	ldi r16,0
	rjmp .L10
	.size	main, .-main
	.ident	"GCC: (GNU) 7.3.0"
