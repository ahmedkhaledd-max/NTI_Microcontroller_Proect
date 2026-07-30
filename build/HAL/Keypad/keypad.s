	.file	"keypad.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	Keypad_Init
	.type	Keypad_Init, @function
Keypad_Init:
	push r14
	push r15
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	movw r28,r24
	or r24,r25
	breq .L2
	ld r24,Y
	cpi r24,lo8(4)
	brsh .L2
	ldd r24,Y+2
	cpi r24,lo8(4)
	brsh .L2
	ldd r24,Y+1
	cpi r24,lo8(5)
	brsh .L2
	ldd r24,Y+3
	cpi r24,lo8(5)
	brsh .L2
	ldi r17,0
.L3:
	ldd r22,Y+1
	add r22,r17
	ldi r20,lo8(1)
	ld r24,Y
	call GPIO_SetPinDirection
	or r24,r25
	brne .L2
	ldd r22,Y+1
	add r22,r17
	ldi r20,lo8(1)
	ld r24,Y
	call GPIO_SetPinValue
	subi r17,lo8(-(1))
	cpi r17,lo8(4)
	brne .L3
	ldi r17,0
.L4:
	ldd r22,Y+3
	add r22,r17
	ldi r20,0
	ldd r24,Y+2
	call GPIO_SetPinDirection
	movw r14,r24
	or r24,r25
	brne .L2
	ldd r22,Y+3
	add r22,r17
	ldi r20,lo8(1)
	ldd r24,Y+2
	call GPIO_SetPinValue
	subi r17,lo8(-(1))
	cpi r17,lo8(4)
	brne .L4
.L1:
	movw r24,r14
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	ret
.L2:
	clr r14
	inc r14
	mov r15,__zero_reg__
	rjmp .L1
	.size	Keypad_Init, .-Keypad_Init
.global	Keypad_GetKey
	.type	Keypad_GetKey, @function
Keypad_GetKey:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 12 */
.L__stack_usage = 12
	sbiw r24,0
	brne .+2
	rjmp .L23
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .+2
	rjmp .L23
	movw r14,r22
	movw r16,r24
	ldi r24,lo8(-1)
	movw r30,r22
	st Z,r24
	mov r13,__zero_reg__
.L13:
	mov r12,__zero_reg__
.L14:
	movw r30,r16
	ldd r22,Z+1
	add r22,r12
	ldi r20,lo8(1)
	ld r24,Z
	call GPIO_SetPinValue
	inc r12
	ldi r31,lo8(4)
	cpse r12,r31
	rjmp .L14
	movw r30,r16
	ldd r22,Z+1
	add r22,r13
	ldi r20,0
	ld r24,Z
	call GPIO_SetPinValue
	mov r12,__zero_reg__
.L21:
	movw r30,r16
	ldd r22,Z+3
	add r22,r12
	ldd r24,Z+2
	call GPIO_GetPinStatus
	or r24,r25
	brne .L15
	std Y+4,__zero_reg__
	std Y+3,__zero_reg__
.L16:
	ldd r24,Y+3
	ldd r25,Y+4
	sbiw r24,20
	brlo .L19
	movw r30,r16
	ldd r22,Z+3
	add r22,r12
	ldd r24,Z+2
	call GPIO_GetPinStatus
	or r24,r25
	brne .L15
.L20:
	movw r30,r16
	ldd r22,Z+3
	add r22,r12
	ldd r24,Z+2
	call GPIO_GetPinStatus
	or r24,r25
	breq .L20
	ldi r18,lo8(4)
	mul r13,r18
	movw r30,r0
	clr __zero_reg__
	add r30,r16
	adc r31,r17
	add r30,r12
	adc r31,__zero_reg__
	ldd r24,Z+4
	movw r30,r14
	st Z,r24
.L24:
	ldi r25,0
	ldi r24,0
	rjmp .L11
.L19:
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
.L17:
	ldd r24,Y+1
	ldd r25,Y+2
	cpi r24,64
	sbci r25,6
	brlo .L18
	ldd r24,Y+3
	ldd r25,Y+4
	adiw r24,1
	std Y+4,r25
	std Y+3,r24
	rjmp .L16
.L18:
	ldd r24,Y+1
	ldd r25,Y+2
	adiw r24,1
	std Y+2,r25
	std Y+1,r24
	rjmp .L17
.L15:
	inc r12
	ldi r31,lo8(4)
	cpse r12,r31
	rjmp .L21
	inc r13
	cpse r13,r31
	rjmp .L13
	rjmp .L24
.L23:
	ldi r24,lo8(1)
	ldi r25,0
.L11:
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	Keypad_GetKey, .-Keypad_GetKey
.global	Keypad_WaitForKey
	.type	Keypad_WaitForKey, @function
Keypad_WaitForKey:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	sbiw r24,0
	breq .L30
	movw r28,r22
	movw r16,r24
	sbiw r28,0
	breq .L30
.L31:
	movw r22,r28
	movw r24,r16
	call Keypad_GetKey
	sbiw r24,0
	brne .L30
	ld r18,Y
	cpi r18,lo8(-1)
	breq .L31
.L29:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L30:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L29
	.size	Keypad_WaitForKey, .-Keypad_WaitForKey
	.ident	"GCC: (GNU) 7.3.0"
