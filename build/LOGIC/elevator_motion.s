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
	movw r22,r28
	subi r22,-3
	sbci r23,-1
	ldi r24,0
	call ADC_ReadChannelBlocking
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	ldi r24,lo8(1)
	call ADC_ReadChannelBlocking
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.size	Motion_Update, .-Motion_Update
.global	Motion_GoToFloor
	.type	Motion_GoToFloor, @function
Motion_GoToFloor:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	Motion_GoToFloor, .-Motion_GoToFloor
.global	Motion_Stop
	.type	Motion_Stop, @function
Motion_Stop:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	Motion_Stop, .-Motion_Stop
.global	Door_Open
	.type	Door_Open, @function
Door_Open:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
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
/* epilogue start */
	ret
	.size	Elevator_GetCurPosition, .-Elevator_GetCurPosition
.global	Elevator_OpenDoor
	.type	Elevator_OpenDoor, @function
Elevator_OpenDoor:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	Elevator_OpenDoor, .-Elevator_OpenDoor
.global	Elevator_CloseDoor
	.type	Elevator_CloseDoor, @function
Elevator_CloseDoor:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	Elevator_CloseDoor, .-Elevator_CloseDoor
.global	Elevator_StopMotion
	.type	Elevator_StopMotion, @function
Elevator_StopMotion:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	Elevator_StopMotion, .-Elevator_StopMotion
.global	Elevator_MoveToFloor
	.type	Elevator_MoveToFloor, @function
Elevator_MoveToFloor:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	Elevator_MoveToFloor, .-Elevator_MoveToFloor
	.ident	"GCC: (GNU) 7.3.0"
