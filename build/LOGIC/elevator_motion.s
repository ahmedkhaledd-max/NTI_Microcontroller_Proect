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
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	Motion_Init, .-Motion_Init
.global	Motion_Update
	.type	Motion_Update, @function
Motion_Update:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(3)
	jmp ADC_Read
	.size	Motion_Update, .-Motion_Update
.global	Motion_Stop
	.type	Motion_Stop, @function
Motion_Stop:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(5)
	ldi r24,0
	jmp GPIO_SetPinValue
	.size	Motion_Stop, .-Motion_Stop
.global	Door_Open
	.type	Door_Open, @function
Door_Open:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r20,lo8(1)
	ldi r22,lo8(6)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,0
	jmp GPIO_SetPinValue
	.size	Door_Open, .-Door_Open
.global	Door_Close
	.type	Door_Close, @function
Door_Close:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r20,0
	ldi r22,lo8(6)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	ldi r22,lo8(7)
	ldi r24,0
	jmp GPIO_SetPinValue
	.size	Door_Close, .-Door_Close
.global	Elevator_Motion_Init
	.type	Elevator_Motion_Init, @function
Elevator_Motion_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	Elevator_Motion_Init, .-Elevator_Motion_Init
.global	Elevator_GetCurPosition
	.type	Elevator_GetCurPosition, @function
Elevator_GetCurPosition:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
	call ADC_Read
	cpi r24,-6
	cpc r25,__zero_reg__
	brlo .L9
	cpi r24,-12
	ldi r18,1
	cpc r25,r18
	brlo .L10
	cpi r24,-18
	sbci r25,2
	brlo .L11
	ldi r24,lo8(3)
	ret
.L9:
	ldi r24,0
	ret
.L10:
	ldi r24,lo8(1)
	ret
.L11:
	ldi r24,lo8(2)
/* epilogue start */
	ret
	.size	Elevator_GetCurPosition, .-Elevator_GetCurPosition
.global	Motion_GoToFloor
	.type	Motion_GoToFloor, @function
Motion_GoToFloor:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	call Elevator_GetCurPosition
	cp r24,r28
	brsh .L13
	ldi r20,lo8(1)
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
.L15:
	ldi r22,lo8(5)
	ldi r24,0
/* epilogue start */
	pop r28
	jmp GPIO_SetPinValue
.L13:
	cp r28,r24
	brsh .L12
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	rjmp .L15
.L12:
/* epilogue start */
	pop r28
	ret
	.size	Motion_GoToFloor, .-Motion_GoToFloor
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
.global	Elevator_MoveToFloor
	.type	Elevator_MoveToFloor, @function
Elevator_MoveToFloor:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp Motion_GoToFloor
	.size	Elevator_MoveToFloor, .-Elevator_MoveToFloor
	.ident	"GCC: (GNU) 7.3.0"
