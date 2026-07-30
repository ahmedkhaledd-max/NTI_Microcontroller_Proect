	.file	"elevator_dispatch.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	callsAbove, @function
callsAbove:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ld r25,Z
	ldd r24,Z+1
	or r25,r24
	ldd r24,Z+2
	or r25,r24
	andi r25,lo8(15)
	subi r22,lo8(-(1))
	ldi r18,lo8(-1)
	ldi r19,0
	rjmp 2f
	1:
	lsl r18
	2:
	dec r22
	brpl 1b
	mov r24,r25
	and r24,r18
/* epilogue start */
	ret
	.size	callsAbove, .-callsAbove
	.type	callsBelow, @function
callsBelow:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ld r25,Z
	ldd r24,Z+1
	or r25,r24
	ldd r24,Z+2
	or r24,r25
	ldi r18,lo8(1)
	ldi r19,0
	rjmp 2f
	1:
	lsl r18
	2:
	dec r22
	brpl 1b
	subi r18,lo8(-(-1))
	and r24,r18
/* epilogue start */
	ret
	.size	callsBelow, .-callsBelow
.global	Dispatch_Init
	.type	Dispatch_Init, @function
Dispatch_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r30,lo8(g_calls)
	ldi r31,hi8(g_calls)
	st Z,__zero_reg__
	std Z+1,__zero_reg__
	std Z+2,__zero_reg__
	sts current_floor,__zero_reg__
	sts current_direction+1,__zero_reg__
	sts current_direction,__zero_reg__
/* epilogue start */
	ret
	.size	Dispatch_Init, .-Dispatch_Init
.global	Dispatch_Update
	.type	Dispatch_Update, @function
Dispatch_Update:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
	ret
	.size	Dispatch_Update, .-Dispatch_Update
.global	Call_Register
	.type	Call_Register, @function
Call_Register:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,lo8(4)
	brsh .L5
	cpi r22,lo8(1)
	breq .L7
	brlo .L8
	cpi r22,lo8(2)
	breq .L9
	ret
.L8:
	ldi r18,lo8(1)
	ldi r19,0
	rjmp 2f
	1:
	lsl r18
	2:
	dec r24
	brpl 1b
	lds r24,g_calls
	or r24,r18
	sts g_calls,r24
	ret
.L7:
	ldi r18,lo8(1)
	ldi r19,0
	rjmp 2f
	1:
	lsl r18
	2:
	dec r24
	brpl 1b
	lds r24,g_calls+1
	or r24,r18
	sts g_calls+1,r24
	ret
.L9:
	ldi r18,lo8(1)
	ldi r19,0
	rjmp 2f
	1:
	lsl r18
	2:
	dec r24
	brpl 1b
	lds r24,g_calls+2
	or r24,r18
	sts g_calls+2,r24
.L5:
/* epilogue start */
	ret
	.size	Call_Register, .-Call_Register
.global	Call_Clear
	.type	Call_Clear, @function
Call_Clear:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,lo8(4)
	brsh .L10
	ldi r18,lo8(1)
	ldi r19,0
	movw r20,r18
	rjmp 2f
	1:
	lsl r20
	rol r21
	2:
	dec r24
	brpl 1b
	movw r24,r20
	com r24
	lds r25,g_calls
	and r25,r24
	sts g_calls,r25
	lds r25,g_calls+1
	and r25,r24
	sts g_calls+1,r25
	lds r25,g_calls+2
	and r24,r25
	sts g_calls+2,r24
.L10:
/* epilogue start */
	ret
	.size	Call_Clear, .-Call_Clear
.global	DSP_NextDirection
	.type	DSP_NextDirection, @function
DSP_NextDirection:
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	movw r16,r24
	mov r15,r22
	movw r28,r20
	cpi r20,1
	cpc r21,__zero_reg__
	brne .L13
	call callsAbove
	cpse r24,__zero_reg__
	rjmp .L14
.L17:
	mov r22,r15
	movw r24,r16
	call callsBelow
	ldi r29,0
	ldi r28,0
	tst r24
	breq .L14
	ldi r28,lo8(2)
	ldi r29,0
	rjmp .L14
.L13:
	cpi r20,2
	cpc r21,__zero_reg__
	brne .L15
	call callsBelow
	cpse r24,__zero_reg__
	rjmp .L14
	mov r22,r15
	movw r24,r16
	call callsAbove
	ldi r18,lo8(1)
	ldi r25,0
	cpse r24,__zero_reg__
	rjmp .L16
	ldi r18,0
.L16:
	mov r28,r18
	mov r29,r25
.L14:
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	ret
.L15:
	call callsAbove
	ldi r28,lo8(1)
	ldi r29,0
	tst r24
	breq .L17
	rjmp .L14
	.size	DSP_NextDirection, .-DSP_NextDirection
.global	Dispatch_GetNextFloor
	.type	Dispatch_GetNextFloor, @function
Dispatch_GetNextFloor:
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 10 */
.L__stack_usage = 10
	lds r29,current_floor
	lds r20,current_direction
	lds r21,current_direction+1
	mov r22,r29
	ldi r24,lo8(g_calls)
	ldi r25,hi8(g_calls)
	call DSP_NextDirection
	sts current_direction+1,r25
	sts current_direction,r24
	cpi r24,1
	cpc r25,__zero_reg__
	brne .L23
	lds r14,g_calls
	mov r15,__zero_reg__
	lds r12,g_calls+1
	mov r13,__zero_reg__
	lds r10,g_calls+2
	mov r11,__zero_reg__
	ldi r16,lo8(1)
	add r16,r29
	ldi r17,0
.L24:
	mov r28,r16
	cpi r16,lo8(4)
	brlo .L27
.L31:
	mov r28,r29
	rjmp .L22
.L27:
	movw r24,r14
	mov r0,r16
	rjmp 2f
	1:
	lsr r25
	ror r24
	2:
	dec r0
	brpl 1b
	sbrc r24,0
	rjmp .L22
	movw r24,r12
	mov r0,r28
	rjmp 2f
	1:
	lsr r25
	ror r24
	2:
	dec r0
	brpl 1b
	sbrc r24,0
	rjmp .L22
	movw r24,r10
	mov r0,r28
	rjmp 2f
	1:
	lsr r25
	ror r24
	2:
	dec r0
	brpl 1b
	sbrs r24,0
	rjmp .L26
	mov r22,r16
	ldi r24,lo8(g_calls)
	ldi r25,hi8(g_calls)
	call callsAbove
	tst r24
	breq .L22
.L26:
	subi r16,-1
	sbci r17,-1
	rjmp .L24
.L23:
	sbiw r24,2
	brne .L31
	lds r16,g_calls
	ldi r17,0
	lds r14,g_calls+2
	mov r15,__zero_reg__
	lds r12,g_calls+1
	mov r13,__zero_reg__
	mov r28,r29
.L28:
	tst r28
	breq .L31
	subi r28,lo8(-(-1))
	movw r18,r16
	mov r0,r28
	rjmp 2f
	1:
	lsr r19
	ror r18
	2:
	dec r0
	brpl 1b
	sbrc r18,0
	rjmp .L22
	movw r18,r14
	mov r0,r28
	rjmp 2f
	1:
	lsr r19
	ror r18
	2:
	dec r0
	brpl 1b
	sbrc r18,0
	rjmp .L22
	movw r18,r12
	mov r0,r28
	rjmp 2f
	1:
	lsr r19
	ror r18
	2:
	dec r0
	brpl 1b
	sbrs r18,0
	rjmp .L28
	mov r22,r28
	ldi r24,lo8(g_calls)
	ldi r25,hi8(g_calls)
	call callsBelow
	cpse r24,__zero_reg__
	rjmp .L28
.L22:
	mov r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	ret
	.size	Dispatch_GetNextFloor, .-Dispatch_GetNextFloor
.global	Elevator_Dispatch_Init
	.type	Elevator_Dispatch_Init, @function
Elevator_Dispatch_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp Dispatch_Init
	.size	Elevator_Dispatch_Init, .-Elevator_Dispatch_Init
.global	Elevator_AddCall
	.type	Elevator_AddCall, @function
Elevator_AddCall:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp Call_Register
	.size	Elevator_AddCall, .-Elevator_AddCall
.global	Elevator_ClearCall
	.type	Elevator_ClearCall, @function
Elevator_ClearCall:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp Call_Clear
	.size	Elevator_ClearCall, .-Elevator_ClearCall
.global	Elevator_CalculateNextFloor
	.type	Elevator_CalculateNextFloor, @function
Elevator_CalculateNextFloor:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	sts current_floor,r24
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L48
	movw r28,r22
	mov r22,r24
	lds r20,current_direction
	lds r21,current_direction+1
	ldi r24,lo8(g_calls)
	ldi r25,hi8(g_calls)
	call DSP_NextDirection
	sts current_direction+1,r25
	sts current_direction,r24
	std Y+1,r25
	st Y,r24
.L48:
/* epilogue start */
	pop r29
	pop r28
	jmp Dispatch_GetNextFloor
	.size	Elevator_CalculateNextFloor, .-Elevator_CalculateNextFloor
	.local	current_floor
	.comm	current_floor,1,1
	.local	current_direction
	.comm	current_direction,2,1
	.local	g_calls
	.comm	g_calls,3,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
