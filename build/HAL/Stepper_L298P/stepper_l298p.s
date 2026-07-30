	.file	"stepper_l298p.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	Stepper_TableEntry, @function
Stepper_TableEntry:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L3
	sbiw r24,2
	breq .L4
	andi r22,lo8(3)
	mov r30,r22
	ldi r31,0
	subi r30,lo8(-(STEPPER_FULL_TABLE))
	sbci r31,hi8(-(STEPPER_FULL_TABLE))
	rjmp .L7
.L3:
	andi r22,lo8(3)
	mov r30,r22
	ldi r31,0
	subi r30,lo8(-(STEPPER_WAVE_TABLE))
	sbci r31,hi8(-(STEPPER_WAVE_TABLE))
.L7:
	ld r24,Z
/* epilogue start */
	ret
.L4:
	andi r22,lo8(7)
	mov r30,r22
	ldi r31,0
	subi r30,lo8(-(STEPPER_HALF_TABLE))
	sbci r31,hi8(-(STEPPER_HALF_TABLE))
	rjmp .L7
	.size	Stepper_TableEntry, .-Stepper_TableEntry
	.type	Stepper_ApplyPattern, @function
Stepper_ApplyPattern:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r28,r24
	mov r17,r22
	mov r20,r22
	andi r20,lo8(1)
	ldd r22,Y+1
	ld r24,Y
	call GPIO_SetPinValue
	bst r17,1
	clr r20
	bld r20,0
	ldd r22,Y+3
	ldd r24,Y+2
	call GPIO_SetPinValue
	bst r17,2
	clr r20
	bld r20,0
	ldd r22,Y+5
	ldd r24,Y+4
	call GPIO_SetPinValue
	bst r17,3
	clr r20
	bld r20,0
	ldd r22,Y+7
	ldd r24,Y+6
	call GPIO_SetPinValue
	ldi r24,lo8(1)
	cpse r17,__zero_reg__
	rjmp .L9
	ldi r24,0
.L9:
	std Y+21,r24
/* epilogue start */
	pop r29
	pop r28
	pop r17
	ret
	.size	Stepper_ApplyPattern, .-Stepper_ApplyPattern
.global	Stepper_L298P_Init
	.type	Stepper_L298P_Init, @function
Stepper_L298P_Init:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	or r24,r25
	brne .L11
.L13:
	ldi r24,lo8(1)
	ldi r25,0
.L10:
/* epilogue start */
	pop r29
	pop r28
	ret
.L11:
	ld r24,Y
	cpi r24,lo8(4)
	brsh .L13
	ldd r25,Y+2
	cpi r25,lo8(4)
	brsh .L13
	ldd r25,Y+4
	cpi r25,lo8(4)
	brsh .L13
	ldd r25,Y+6
	cpi r25,lo8(4)
	brsh .L13
	ldd r18,Y+15
	ldd r19,Y+16
	or r18,r19
	breq .L13
	ldi r20,lo8(1)
	ldd r22,Y+1
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldd r22,Y+3
	ldd r24,Y+2
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldd r22,Y+5
	ldd r24,Y+4
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldd r22,Y+7
	ldd r24,Y+6
	call GPIO_SetPinDirection
	ldd r24,Y+12
	tst r24
	breq .L14
	ldd r24,Y+8
	cpi r24,lo8(4)
	brsh .L13
	ldd r25,Y+10
	cpi r25,lo8(4)
	brsh .L13
	ldi r20,lo8(1)
	ldd r22,Y+9
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldd r22,Y+11
	ldd r24,Y+10
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldd r22,Y+9
	ldd r24,Y+8
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	ldd r22,Y+11
	ldd r24,Y+10
	call GPIO_SetPinValue
.L14:
	ldd r24,Y+17
	ldd r25,Y+18
	or r24,r25
	brne .L15
	ldi r24,lo8(1)
	ldi r25,0
	std Y+18,r25
	std Y+17,r24
.L15:
	std Y+20,__zero_reg__
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+24,__zero_reg__
	std Y+25,__zero_reg__
	std Y+21,__zero_reg__
	ldi r22,0
	movw r24,r28
	call Stepper_ApplyPattern
	ldi r24,lo8(1)
	std Y+19,r24
	ldi r25,0
	ldi r24,0
	rjmp .L10
	.size	Stepper_L298P_Init, .-Stepper_L298P_Init
.global	Stepper_L298P_SetStepMode
	.type	Stepper_L298P_SetStepMode, @function
Stepper_L298P_SetStepMode:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	or r24,r25
	breq .L26
	ldd r24,Z+19
	tst r24
	breq .L26
	cpi r22,3
	cpc r23,__zero_reg__
	brsh .L26
	std Z+14,r23
	std Z+13,r22
	std Z+20,__zero_reg__
	ldi r25,0
	ldi r24,0
	ret
.L26:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Stepper_L298P_SetStepMode, .-Stepper_L298P_SetStepMode
.global	Stepper_L298P_SetStepDelay
	.type	Stepper_L298P_SetStepDelay, @function
Stepper_L298P_SetStepDelay:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L31
	movw r30,r24
	ldd r18,Z+19
	tst r18
	breq .L31
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L29
	ldi r22,lo8(1)
	ldi r23,0
.L29:
	movw r30,r24
	std Z+18,r23
	std Z+17,r22
	ldi r25,0
	ldi r24,0
	ret
.L31:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Stepper_L298P_SetStepDelay, .-Stepper_L298P_SetStepDelay
.global	Stepper_L298P_SetSpeedRpm
	.type	Stepper_L298P_SetSpeedRpm, @function
Stepper_L298P_SetSpeedRpm:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	or r24,r25
	breq .L38
	ldd r24,Y+19
	tst r24
	breq .L38
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L38
	ldd r18,Y+15
	ldd r19,Y+16
	ldi r21,0
	ldi r20,0
	ldd r24,Y+13
	ldd r25,Y+14
	sbiw r24,2
	brne .L34
	lsl r18
	rol r19
	rol r20
	rol r21
.L34:
	movw r26,r22
	call __muluhisi3
	movw r18,r22
	movw r20,r24
	ldi r22,lo8(96)
	ldi r23,lo8(-22)
	ldi r24,0
	ldi r25,0
	call __udivmodsi4
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	cpc r20,__zero_reg__
	cpc r21,__zero_reg__
	breq .L38
	std Y+18,r19
	std Y+17,r18
	ldi r25,0
	ldi r24,0
.L32:
/* epilogue start */
	pop r29
	pop r28
	ret
.L38:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L32
	.size	Stepper_L298P_SetSpeedRpm, .-Stepper_L298P_SetSpeedRpm
.global	Stepper_L298P_StepOnce
	.type	Stepper_L298P_StepOnce, @function
Stepper_L298P_StepOnce:
	push r12
	push r13
	push r14
	push r15
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r28,r24
	movw r20,r22
	or r24,r25
	brne .+2
	rjmp .L46
	ldd r24,Y+19
	tst r24
	breq .L46
	cpi r22,2
	cpc r23,__zero_reg__
	brsh .L46
	ldd r18,Y+13
	ldd r19,Y+14
	ldi r22,lo8(4)
	cpi r18,2
	cpc r19,__zero_reg__
	brne .L41
	ldi r22,lo8(8)
.L41:
	ldd r24,Y+20
	ldi r23,0
	ldd r12,Y+22
	ldd r13,Y+23
	ldd r14,Y+24
	ldd r15,Y+25
	ldi r25,0
	or r20,r21
	brne .L42
	adiw r24,1
	call __udivmodhi4
	std Y+20,r24
	ldi r24,-1
	sub r12,r24
	sbc r13,r24
	sbc r14,r24
	sbc r15,r24
.L48:
	std Y+22,r12
	std Y+23,r13
	std Y+24,r14
	std Y+25,r15
	ldd r22,Y+20
	movw r24,r18
	call Stepper_TableEntry
	mov r22,r24
	movw r24,r28
	call Stepper_ApplyPattern
	ldi r25,0
	ldi r24,0
.L39:
/* epilogue start */
	pop r29
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
	ret
.L42:
	add r24,r22
	adc r25,r23
	sbiw r24,1
	call __udivmodhi4
	std Y+20,r24
	ldi r24,1
	sub r12,r24
	sbc r13,__zero_reg__
	sbc r14,__zero_reg__
	sbc r15,__zero_reg__
	rjmp .L48
.L46:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L39
	.size	Stepper_L298P_StepOnce, .-Stepper_L298P_StepOnce
.global	Stepper_L298P_Step
	.type	Stepper_L298P_Step, @function
Stepper_L298P_Step:
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
/* stack size = 8 */
.L__stack_usage = 8
	sbiw r24,0
	breq .L57
	movw r30,r24
	ldd r18,Z+19
	tst r18
	breq .L57
	cpi r20,2
	cpc r21,__zero_reg__
	brsh .L57
	movw r16,r20
	movw r12,r22
	movw r28,r24
	mov r15,__zero_reg__
	mov r14,__zero_reg__
.L51:
	cp r12,r14
	cpc r13,r15
	brne .L54
	ldi r25,0
	ldi r24,0
.L49:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
.L54:
	movw r22,r16
	movw r24,r28
	call Stepper_L298P_StepOnce
	ldd r24,Y+17
	ldd r25,Y+18
.L52:
	sbiw r24,0
	brne .L53
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
	rjmp .L51
.L53:
	ldi r30,lo8(3999)
	ldi r31,hi8(3999)
1:	sbiw r30,1
	brne 1b
	rjmp .
	nop
	sbiw r24,1
	rjmp .L52
.L57:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L49
	.size	Stepper_L298P_Step, .-Stepper_L298P_Step
.global	Stepper_L298P_RotateAngle
	.type	Stepper_L298P_RotateAngle, @function
Stepper_L298P_RotateAngle:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r16,r20
	or r24,r25
	breq .L58
	ldd r24,Y+19
	tst r24
	breq .L58
	ldd r18,Y+15
	ldd r19,Y+16
	ldi r21,0
	ldi r20,0
	ldd r24,Y+13
	ldd r25,Y+14
	sbiw r24,2
	brne .L60
	lsl r18
	rol r19
	rol r20
	rol r21
.L60:
	movw r26,r22
	call __muluhisi3
	ldi r18,lo8(104)
	ldi r19,lo8(1)
	ldi r20,0
	ldi r21,0
	call __udivmodsi4
	movw r22,r18
	movw r20,r16
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	jmp Stepper_L298P_Step
.L58:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	Stepper_L298P_RotateAngle, .-Stepper_L298P_RotateAngle
.global	Stepper_L298P_Hold
	.type	Stepper_L298P_Hold, @function
Stepper_L298P_Hold:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	sbiw r24,0
	breq .L69
	movw r30,r24
	ldd r18,Z+19
	tst r18
	breq .L69
	movw r28,r24
	ldd r24,Z+12
	tst r24
	breq .L67
	ldi r20,lo8(1)
	ldd r22,Z+9
	ldd r24,Z+8
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	ldd r22,Y+11
	ldd r24,Y+10
	call GPIO_SetPinValue
.L67:
	ldd r22,Y+20
	ldd r24,Y+13
	ldd r25,Y+14
	call Stepper_TableEntry
	mov r22,r24
	movw r24,r28
	call Stepper_ApplyPattern
	ldi r25,0
	ldi r24,0
.L65:
/* epilogue start */
	pop r29
	pop r28
	ret
.L69:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L65
	.size	Stepper_L298P_Hold, .-Stepper_L298P_Hold
.global	Stepper_L298P_Release
	.type	Stepper_L298P_Release, @function
Stepper_L298P_Release:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	sbiw r24,0
	breq .L77
	movw r30,r24
	ldd r18,Z+19
	tst r18
	breq .L77
	movw r28,r24
	ldi r22,0
	call Stepper_ApplyPattern
	ldd r24,Y+12
	tst r24
	breq .L75
	ldi r20,0
	ldd r22,Y+9
	ldd r24,Y+8
	call GPIO_SetPinValue
	ldi r20,0
	ldd r22,Y+11
	ldd r24,Y+10
	call GPIO_SetPinValue
.L75:
	std Y+21,__zero_reg__
	ldi r25,0
	ldi r24,0
.L73:
/* epilogue start */
	pop r29
	pop r28
	ret
.L77:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L73
	.size	Stepper_L298P_Release, .-Stepper_L298P_Release
.global	Stepper_L298P_GetPosition
	.type	Stepper_L298P_GetPosition, @function
Stepper_L298P_GetPosition:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L85
	movw r30,r24
	ldd r18,Z+19
	tst r18
	breq .L85
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L85
	ldd r24,Z+22
	ldd r25,Z+23
	ldd r26,Z+24
	ldd r27,Z+25
	movw r30,r22
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
	ldi r25,0
	ldi r24,0
	ret
.L85:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Stepper_L298P_GetPosition, .-Stepper_L298P_GetPosition
.global	Stepper_L298P_ResetPosition
	.type	Stepper_L298P_ResetPosition, @function
Stepper_L298P_ResetPosition:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L89
	movw r30,r24
	ldd r18,Z+19
	tst r18
	breq .L89
	std Z+22,__zero_reg__
	std Z+23,__zero_reg__
	std Z+24,__zero_reg__
	std Z+25,__zero_reg__
	ldi r25,0
	ldi r24,0
	ret
.L89:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Stepper_L298P_ResetPosition, .-Stepper_L298P_ResetPosition
.global	Stepper_L298P_GetStepsPerRev
	.type	Stepper_L298P_GetStepsPerRev, @function
Stepper_L298P_GetStepsPerRev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	or r24,r25
	breq .L95
	ldd r24,Z+19
	tst r24
	breq .L95
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L95
	ldd r18,Z+15
	ldd r19,Z+16
	ldd r24,Z+13
	ldd r25,Z+14
	sbiw r24,2
	brne .L92
	lsl r18
	rol r19
.L92:
	movw r30,r22
	std Z+1,r19
	st Z,r18
	ldi r25,0
	ldi r24,0
	ret
.L95:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Stepper_L298P_GetStepsPerRev, .-Stepper_L298P_GetStepsPerRev
	.section	.rodata
	.type	STEPPER_HALF_TABLE, @object
	.size	STEPPER_HALF_TABLE, 8
STEPPER_HALF_TABLE:
	.byte	1
	.byte	3
	.byte	2
	.byte	6
	.byte	4
	.byte	12
	.byte	8
	.byte	9
	.type	STEPPER_FULL_TABLE, @object
	.size	STEPPER_FULL_TABLE, 4
STEPPER_FULL_TABLE:
	.byte	3
	.byte	6
	.byte	12
	.byte	9
	.type	STEPPER_WAVE_TABLE, @object
	.size	STEPPER_WAVE_TABLE, 4
STEPPER_WAVE_TABLE:
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
