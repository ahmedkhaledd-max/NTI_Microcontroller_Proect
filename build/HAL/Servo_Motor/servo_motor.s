	.file	"servo_motor.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	Servo_ApplyPulse, @function
Servo_ApplyPulse:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	sbiw r24,0
	breq .L3
	sbiw r24,1
	breq .L4
	ret
.L3:
	ldd r18,Z+12
	ldd r19,Z+13
	ldi r26,lo8(-48)
	ldi r27,lo8(7)
	call __umulhisi3
	ldi r18,lo8(-24)
	ldi r19,lo8(3)
	ldi r20,0
	ldi r21,0
	call __udivmodsi4
	out 0x2a+1,r19
	out 0x2a,r18
	ret
.L4:
	ldd r18,Z+12
	ldd r19,Z+13
	ldi r26,lo8(-48)
	ldi r27,lo8(7)
	call __umulhisi3
	ldi r18,lo8(-24)
	ldi r19,lo8(3)
	ldi r20,0
	ldi r21,0
	call __udivmodsi4
	out 0x28+1,r19
	out 0x28,r18
/* epilogue start */
	ret
	.size	Servo_ApplyPulse, .-Servo_ApplyPulse
.global	Servo_Motor_Init
	.type	Servo_Motor_Init, @function
Servo_Motor_Init:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r28,r24
	or r24,r25
	brne .L6
.L8:
	ldi r24,lo8(1)
	ldi r25,0
.L5:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
.L6:
	ld r14,Y
	ldd r15,Y+1
	ldi r24,3
	cp r14,r24
	cpc r15,__zero_reg__
	brsh .L8
	ldd r20,Y+8
	tst r20
	breq .L8
	ldd r16,Y+4
	ldd r17,Y+5
	ldd r18,Y+6
	ldd r19,Y+7
	cp r16,r18
	cpc r17,r19
	brsh .L8
	std Y+9,__zero_reg__
	std Y+10,__zero_reg__
	mov r26,r20
	lsr r26
	std Y+11,r26
	sub r18,r16
	sbc r19,r17
	ldi r27,0
	call __umulhisi3
	mov r18,r20
	ldi r19,0
	ldi r21,0
	ldi r20,0
	call __udivmodsi4
	add r18,r16
	adc r19,r17
	std Y+13,r19
	std Y+12,r18
	ldi r24,2
	cp r14,r24
	cpc r15,__zero_reg__
	brne .L9
	ldd r24,Y+2
	cpi r24,lo8(4)
	brsh .L8
	ldi r20,lo8(1)
	ldd r22,Y+3
	call GPIO_SetPinDirection
	ldi r20,0
	ldd r22,Y+3
	ldd r24,Y+2
	call GPIO_SetPinValue
	ldi r30,lo8(Servo_SoftList)
	ldi r31,hi8(Servo_SoftList)
	ldi r25,0
	ldi r24,0
.L12:
	ld r18,Z+
	ld r19,Z+
	or r18,r19
	brne .L10
	lsl r24
	rol r25
	movw r30,r24
	subi r30,lo8(-(Servo_SoftList))
	sbci r31,hi8(-(Servo_SoftList))
	std Z+1,r29
	st Z,r28
.L11:
	ldi r24,lo8(1)
	std Y+9,r24
	std Y+10,r24
	movw r24,r28
	call Servo_ApplyPulse
	ldi r25,0
	ldi r24,0
	rjmp .L5
.L10:
	adiw r24,1
	cpi r24,8
	cpc r25,__zero_reg__
	brne .L12
	rjmp .L8
.L9:
	lds r24,Servo_Timer1Ready
	cpse r24,__zero_reg__
	rjmp .L13
	ldi r24,lo8(2)
	out 0x2f,r24
	ldi r24,lo8(26)
	out 0x2e,r24
	ldi r24,lo8(63)
	ldi r25,lo8(-100)
	out 0x26+1,r25
	out 0x26,r24
	out 0x2c+1,__zero_reg__
	out 0x2c,__zero_reg__
	ldi r24,lo8(1)
	sts Servo_Timer1Ready,r24
.L13:
	ld r24,Y
	ldd r25,Y+1
	ldi r20,lo8(1)
	or r24,r25
	brne .L14
	ldi r22,lo8(5)
	ldi r24,lo8(3)
	call GPIO_SetPinDirection
	in r24,0x2f
	ori r24,lo8(-128)
.L20:
	out 0x2f,r24
	lds r24,Servo_HardwareCount
	subi r24,lo8(-(1))
	sts Servo_HardwareCount,r24
	rjmp .L11
.L14:
	ldi r22,lo8(4)
	ldi r24,lo8(3)
	call GPIO_SetPinDirection
	in r24,0x2f
	ori r24,lo8(32)
	rjmp .L20
	.size	Servo_Motor_Init, .-Servo_Motor_Init
.global	Servo_Motor_SetAngle
	.type	Servo_Motor_SetAngle, @function
Servo_Motor_SetAngle:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	or r24,r25
	breq .L25
	ldd r24,Y+9
	tst r24
	breq .L25
	ldd r20,Y+8
	cp r20,r22
	brlo .L25
	std Y+11,r22
	ldd r16,Y+4
	ldd r17,Y+5
	ldd r18,Y+6
	ldd r19,Y+7
	sub r18,r16
	sbc r19,r17
	mov r26,r22
	ldi r27,0
	call __umulhisi3
	mov r18,r20
	ldi r19,0
	ldi r21,0
	ldi r20,0
	call __udivmodsi4
	add r18,r16
	adc r19,r17
	std Y+13,r19
	std Y+12,r18
	movw r24,r28
	call Servo_ApplyPulse
	ldi r25,0
	ldi r24,0
.L21:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L25:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L21
	.size	Servo_Motor_SetAngle, .-Servo_Motor_SetAngle
.global	Servo_Motor_SetPulseUs
	.type	Servo_Motor_SetPulseUs, @function
Servo_Motor_SetPulseUs:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	or r24,r25
	breq .L31
	ldd r24,Y+9
	tst r24
	breq .L31
	ldd r30,Y+4
	ldd r31,Y+5
	ldd r20,Y+6
	ldd r21,Y+7
	cp r22,r30
	cpc r23,r31
	brlo .L32
	cp r20,r22
	cpc r21,r23
	brsh .L28
	movw r22,r20
.L28:
	std Y+13,r23
	std Y+12,r22
	movw r18,r22
	sub r18,r30
	sbc r19,r31
	ldd r26,Y+8
	ldi r27,0
	call __umulhisi3
	sub r20,r30
	sbc r21,r31
	movw r18,r20
	ldi r21,0
	ldi r20,0
	call __udivmodsi4
	std Y+11,r18
	movw r24,r28
	call Servo_ApplyPulse
	ldi r25,0
	ldi r24,0
.L26:
/* epilogue start */
	pop r29
	pop r28
	ret
.L32:
	movw r22,r30
	rjmp .L28
.L31:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L26
	.size	Servo_Motor_SetPulseUs, .-Servo_Motor_SetPulseUs
.global	Servo_Motor_GetAngle
	.type	Servo_Motor_GetAngle, @function
Servo_Motor_GetAngle:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L37
	movw r30,r24
	ldd r18,Z+9
	tst r18
	breq .L37
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L37
	ldd r24,Z+11
	movw r30,r22
	st Z,r24
	ldi r25,0
	ldi r24,0
	ret
.L37:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Servo_Motor_GetAngle, .-Servo_Motor_GetAngle
.global	Servo_Motor_Stop
	.type	Servo_Motor_Stop, @function
Servo_Motor_Stop:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	sbiw r24,0
	breq .L44
	movw r30,r24
	ldd r18,Z+9
	tst r18
	breq .L44
	movw r28,r24
	ld r24,Z
	ldd r25,Z+1
	sbiw r24,0
	brne .L40
	in r24,0x2f
	andi r24,lo8(127)
	out 0x2f,r24
	ldi r20,0
	ldi r22,lo8(5)
.L46:
	ldi r24,lo8(3)
.L45:
	call GPIO_SetPinValue
	std Y+10,__zero_reg__
	ldi r25,0
	ldi r24,0
.L38:
/* epilogue start */
	pop r29
	pop r28
	ret
.L40:
	sbiw r24,1
	brne .L42
	in r24,0x2f
	andi r24,lo8(-33)
	out 0x2f,r24
	ldi r20,0
	ldi r22,lo8(4)
	rjmp .L46
.L42:
	ldi r20,0
	ldd r22,Z+3
	ldd r24,Z+2
	rjmp .L45
.L44:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L38
	.size	Servo_Motor_Stop, .-Servo_Motor_Stop
.global	Servo_Motor_Start
	.type	Servo_Motor_Start, @function
Servo_Motor_Start:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L52
	movw r30,r24
	ldd r18,Z+9
	tst r18
	breq .L52
	ld r18,Z
	ldd r19,Z+1
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L49
	in r18,0x2f
	ori r18,lo8(-128)
.L53:
	out 0x2f,r18
.L50:
	ldi r18,lo8(1)
	movw r30,r24
	std Z+10,r18
	call Servo_ApplyPulse
	ldi r25,0
	ldi r24,0
	ret
.L49:
	cpi r18,1
	cpc r19,__zero_reg__
	brne .L50
	in r18,0x2f
	ori r18,lo8(32)
	rjmp .L53
.L52:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Servo_Motor_Start, .-Servo_Motor_Start
.global	Servo_Motor_SoftwareRefresh
	.type	Servo_Motor_SoftwareRefresh, @function
Servo_Motor_SoftwareRefresh:
	push r8
	push r9
	push r10
	push r11
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 11 */
.L__stack_usage = 11
	ldi r16,lo8(Servo_SoftList)
	ldi r17,hi8(Servo_SoftList)
	ldi r24,lo8(Servo_SoftList+16)
	mov r14,r24
	ldi r24,hi8(Servo_SoftList+16)
	mov r15,r24
	mov r13,__zero_reg__
	ldi r25,lo8(-96)
	mov r8,r25
	ldi r25,lo8(15)
	mov r9,r25
	mov r10,__zero_reg__
	mov r11,__zero_reg__
.L57:
	movw r30,r16
	ld r28,Z+
	ld r29,Z+
	movw r16,r30
	sbiw r28,0
	breq .L55
	ldd r24,Y+10
	tst r24
	breq .L55
	ldi r20,lo8(1)
	ldd r22,Y+3
	ldd r24,Y+2
	call GPIO_SetPinValue
	ldd r18,Y+12
	ldd r19,Y+13
	ldi r26,lo8(-128)
	ldi r27,lo8(62)
	call __umulhisi3
	movw r20,r10
	movw r18,r8
	call __udivmodsi4
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L56
	movw r24,r18
/* #APP */
 ;  88 "HAL/Servo_Motor/servo_motor.c" 1
	1: sbiw r24, 1
	   brne 1b
 ;  0 "" 2
/* #NOAPP */
.L56:
	ldi r20,0
	ldd r22,Y+3
	ldd r24,Y+2
	call GPIO_SetPinValue
	inc r13
.L55:
	cp r14,r16
	cpc r15,r17
	brne .L57
	ldi r24,lo8(1)
	ldi r25,0
	tst r13
	breq .L58
	ldi r25,0
	ldi r24,0
.L58:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	ret
	.size	Servo_Motor_SoftwareRefresh, .-Servo_Motor_SoftwareRefresh
.global	Servo_Motor_DeInit
	.type	Servo_Motor_DeInit, @function
Servo_Motor_DeInit:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	sbiw r24,0
	breq .L81
	movw r30,r24
	ldd r18,Z+9
	tst r18
	breq .L81
	movw r28,r24
	call Servo_Motor_Stop
	ld r24,Y
	ldd r25,Y+1
	sbiw r24,2
	brne .L74
	ldi r30,lo8(Servo_SoftList)
	ldi r31,hi8(Servo_SoftList)
	ldi r25,0
	ldi r24,0
.L77:
	ld r18,Z+
	ld r19,Z+
	cp r18,r28
	cpc r19,r29
	brne .L75
	lsl r24
	rol r25
	movw r30,r24
	subi r30,lo8(-(Servo_SoftList))
	sbci r31,hi8(-(Servo_SoftList))
	std Z+1,__zero_reg__
	st Z,__zero_reg__
.L76:
	std Y+9,__zero_reg__
	ldi r25,0
	ldi r24,0
.L72:
/* epilogue start */
	pop r29
	pop r28
	ret
.L75:
	adiw r24,1
	cpi r24,8
	cpc r25,__zero_reg__
	brne .L77
	rjmp .L76
.L74:
	lds r24,Servo_HardwareCount
	tst r24
	breq .L78
	subi r24,lo8(-(-1))
	sts Servo_HardwareCount,r24
.L78:
	lds r24,Servo_HardwareCount
	cpse r24,__zero_reg__
	rjmp .L76
	out 0x2f,__zero_reg__
	out 0x2e,__zero_reg__
	sts Servo_Timer1Ready,__zero_reg__
	rjmp .L76
.L81:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L72
	.size	Servo_Motor_DeInit, .-Servo_Motor_DeInit
	.local	Servo_Timer1Ready
	.comm	Servo_Timer1Ready,1,1
	.local	Servo_HardwareCount
	.comm	Servo_HardwareCount,1,1
	.local	Servo_SoftList
	.comm	Servo_SoftList,16,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
