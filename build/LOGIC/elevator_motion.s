	.file	"elevator_motion.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	Motion_Init
	.type	Motion_Init, @function
Motion_Init:
	push r28
	push r29
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 4 */
.L__stack_usage = 4
	ldi r24,lo8(1)
	std Y+1,r24
	ldi r25,lo8(7)
	std Y+2,r25
	ldi r30,lo8(g_hoistMotor)
	ldi r31,hi8(g_hoistMotor)
	st Z,r24
	std Z+1,__zero_reg__
	std Z+2,r24
	std Z+3,r24
	std Z+4,r24
	ldi r25,lo8(3)
	std Z+5,r25
	ldi r18,lo8(2)
	ldi r19,0
	std Z+7,r19
	std Z+6,r18
	std Z+8,__zero_reg__
	std Z+9,__zero_reg__
	std Z+10,__zero_reg__
	std Z+12,__zero_reg__
	std Z+11,__zero_reg__
	ldi r30,lo8(g_doorMotor)
	ldi r31,hi8(g_doorMotor)
	st Z,r24
	std Z+1,r18
	std Z+2,r24
	std Z+3,r25
	std Z+4,r24
	ldi r24,lo8(4)
	std Z+5,r24
	ldi r24,lo8(3)
	ldi r25,0
	std Z+7,r25
	std Z+6,r24
	std Z+8,__zero_reg__
	std Z+9,__zero_reg__
	std Z+10,__zero_reg__
	std Z+12,__zero_reg__
	std Z+11,__zero_reg__
	movw r24,r28
	adiw r24,1
	call ADC_Init
	ldi r24,lo8(g_hoistMotor)
	ldi r25,hi8(g_hoistMotor)
	call DC_Motor_Init
	ldi r24,lo8(g_doorMotor)
	ldi r25,hi8(g_doorMotor)
	call DC_Motor_Init
	ldi r22,0
	ldi r24,lo8(g_hoistMotor)
	ldi r25,hi8(g_hoistMotor)
	call DC_Motor_SetSpeed
	ldi r22,0
	ldi r24,lo8(g_doorMotor)
	ldi r25,hi8(g_doorMotor)
	call DC_Motor_SetSpeed
	ldi r24,lo8(g_hoistMotor)
	ldi r25,hi8(g_hoistMotor)
	call DC_Motor_Stop
	ldi r24,lo8(g_doorMotor)
	ldi r25,hi8(g_doorMotor)
	call DC_Motor_Stop
	sts g_doorState+1,__zero_reg__
	sts g_doorState,__zero_reg__
	sts g_currentFloor,__zero_reg__
	sts g_currentPositionCm+1,__zero_reg__
	sts g_currentPositionCm,__zero_reg__
	sts g_targetFloor,__zero_reg__
	sts g_targetActive,__zero_reg__
	sts g_doorTimerMs+1,__zero_reg__
	sts g_doorTimerMs,__zero_reg__
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.size	Motion_Init, .-Motion_Init
.global	Motion_Stop
	.type	Motion_Stop, @function
Motion_Stop:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(g_hoistMotor)
	ldi r25,hi8(g_hoistMotor)
	call DC_Motor_Stop
	sts g_targetActive,__zero_reg__
/* epilogue start */
	ret
	.size	Motion_Stop, .-Motion_Stop
.global	Motion_Update
	.type	Motion_Update, @function
Motion_Update:
	push r28
	push r29
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	ldi r24,0
	call ADC_ReadChannelBlocking
	or r24,r25
	brne .L4
	ldd r18,Y+1
	ldd r19,Y+2
	ldi r26,lo8(-124)
	ldi r27,lo8(3)
	call __umulhisi3
	ldi r18,lo8(-1)
	ldi r19,lo8(3)
	ldi r20,0
	ldi r21,0
	call __udivmodsi4
	movw r24,r18
	sts g_currentPositionCm+1,r19
	sts g_currentPositionCm,r18
	cpi r18,-106
	cpc r19,__zero_reg__
	brsh .+2
	rjmp .L12
	cpi r24,-62
	ldi r18,1
	cpc r25,r18
	brsh .+2
	rjmp .L13
	cpi r24,-18
	sbci r25,2
	brsh .+2
	rjmp .L14
	ldi r24,lo8(3)
.L5:
	sts g_currentFloor,r24
.L4:
	lds r24,g_targetActive
	tst r24
	breq .L6
	lds r25,g_currentFloor
	lds r24,g_targetFloor
	cpse r25,r24
	rjmp .L6
	call Motion_Stop
	sts g_targetActive,__zero_reg__
.L6:
	lds r24,g_doorState
	lds r25,g_doorState+1
	sbiw r24,2
	sbiw r24,2
	brsh .L3
	lds r24,g_doorTimerMs
	lds r25,g_doorTimerMs+1
	adiw r24,1
	sts g_doorTimerMs+1,r25
	sts g_doorTimerMs,r24
	cpi r24,-56
	cpc r25,__zero_reg__
	brlo .L3
	ldi r24,lo8(g_doorMotor)
	ldi r25,hi8(g_doorMotor)
	call DC_Motor_Stop
	lds r24,g_doorState
	lds r25,g_doorState+1
	cpi r24,2
	cpc r25,__zero_reg__
	brne .L10
	ldi r24,lo8(1)
	ldi r25,0
	sts g_doorState+1,r25
	sts g_doorState,r24
.L11:
	sts g_doorTimerMs+1,__zero_reg__
	sts g_doorTimerMs,__zero_reg__
.L3:
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
.L12:
	ldi r24,0
	rjmp .L5
.L13:
	ldi r24,lo8(1)
	rjmp .L5
.L14:
	ldi r24,lo8(2)
	rjmp .L5
.L10:
	sbiw r24,3
	brne .L11
	sts g_doorState+1,__zero_reg__
	sts g_doorState,__zero_reg__
	rjmp .L11
	.size	Motion_Update, .-Motion_Update
.global	Motion_GoToFloor
	.type	Motion_GoToFloor, @function
Motion_GoToFloor:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	cpi r24,lo8(4)
	brsh .L18
	mov r28,r24
	lds r24,g_currentFloor
	cpse r24,r28
	rjmp .L20
	call Motion_Stop
	sts g_targetActive,__zero_reg__
.L18:
/* epilogue start */
	pop r28
	ret
.L20:
	sts g_targetFloor,r28
	ldi r24,lo8(1)
	sts g_targetActive,r24
	ldi r22,lo8(70)
	ldi r24,lo8(g_hoistMotor)
	ldi r25,hi8(g_hoistMotor)
	call DC_Motor_SetSpeed
	lds r24,g_currentFloor
	cp r24,r28
	brsh .L21
	ldi r24,lo8(g_hoistMotor)
	ldi r25,hi8(g_hoistMotor)
/* epilogue start */
	pop r28
	jmp DC_Motor_Forward
.L21:
	ldi r24,lo8(g_hoistMotor)
	ldi r25,hi8(g_hoistMotor)
/* epilogue start */
	pop r28
	jmp DC_Motor_Backward
	.size	Motion_GoToFloor, .-Motion_GoToFloor
.global	Motion_GetPosition
	.type	Motion_GetPosition, @function
Motion_GetPosition:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,g_currentPositionCm
	lds r25,g_currentPositionCm+1
/* epilogue start */
	ret
	.size	Motion_GetPosition, .-Motion_GetPosition
.global	Motion_GetFloor
	.type	Motion_GetFloor, @function
Motion_GetFloor:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,g_currentFloor
/* epilogue start */
	ret
	.size	Motion_GetFloor, .-Motion_GetFloor
.global	Door_Open
	.type	Door_Open, @function
Door_Open:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,g_doorState
	lds r25,g_doorState+1
	sbiw r24,1
	sbiw r24,2
	brlo .L24
	ldi r22,lo8(40)
	ldi r24,lo8(g_doorMotor)
	ldi r25,hi8(g_doorMotor)
	call DC_Motor_SetSpeed
	ldi r24,lo8(g_doorMotor)
	ldi r25,hi8(g_doorMotor)
	call DC_Motor_Forward
	ldi r24,lo8(2)
	ldi r25,0
	sts g_doorState+1,r25
	sts g_doorState,r24
	sts g_doorTimerMs+1,__zero_reg__
	sts g_doorTimerMs,__zero_reg__
.L24:
/* epilogue start */
	ret
	.size	Door_Open, .-Door_Open
.global	Door_Close
	.type	Door_Close, @function
Door_Close:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,g_doorState
	lds r25,g_doorState+1
	sbiw r24,0
	breq .L26
	sbiw r24,3
	breq .L26
	ldi r22,lo8(40)
	ldi r24,lo8(g_doorMotor)
	ldi r25,hi8(g_doorMotor)
	call DC_Motor_SetSpeed
	ldi r24,lo8(g_doorMotor)
	ldi r25,hi8(g_doorMotor)
	call DC_Motor_Backward
	ldi r24,lo8(3)
	ldi r25,0
	sts g_doorState+1,r25
	sts g_doorState,r24
	sts g_doorTimerMs+1,__zero_reg__
	sts g_doorTimerMs,__zero_reg__
.L26:
/* epilogue start */
	ret
	.size	Door_Close, .-Door_Close
.global	Elevator_Motion_Init
	.type	Elevator_Motion_Init, @function
Elevator_Motion_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp Motion_Init
	.size	Elevator_Motion_Init, .-Elevator_Motion_Init
.global	Elevator_GetCurPosition
	.type	Elevator_GetCurPosition, @function
Elevator_GetCurPosition:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,g_currentFloor
/* epilogue start */
	ret
	.size	Elevator_GetCurPosition, .-Elevator_GetCurPosition
.global	Elevator_MoveToFloor
	.type	Elevator_MoveToFloor, @function
Elevator_MoveToFloor:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp Motion_GoToFloor
	.size	Elevator_MoveToFloor, .-Elevator_MoveToFloor
.global	Elevator_OpenDoor
	.type	Elevator_OpenDoor, @function
Elevator_OpenDoor:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp Door_Open
	.size	Elevator_OpenDoor, .-Elevator_OpenDoor
.global	Elevator_CloseDoor
	.type	Elevator_CloseDoor, @function
Elevator_CloseDoor:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp Door_Close
	.size	Elevator_CloseDoor, .-Elevator_CloseDoor
.global	Elevator_StopMotion
	.type	Elevator_StopMotion, @function
Elevator_StopMotion:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp Motion_Stop
	.size	Elevator_StopMotion, .-Elevator_StopMotion
	.local	g_doorTimerMs
	.comm	g_doorTimerMs,2,1
	.local	g_targetActive
	.comm	g_targetActive,1,1
	.local	g_targetFloor
	.comm	g_targetFloor,1,1
	.local	g_currentPositionCm
	.comm	g_currentPositionCm,2,1
	.local	g_currentFloor
	.comm	g_currentFloor,1,1
	.local	g_doorState
	.comm	g_doorState,2,1
	.local	g_doorMotor
	.comm	g_doorMotor,13,1
	.local	g_hoistMotor
	.comm	g_hoistMotor,13,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
