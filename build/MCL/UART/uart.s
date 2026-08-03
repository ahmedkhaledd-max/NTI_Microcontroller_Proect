	.file	"uart.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	UART_Init
	.type	UART_Init, @function
UART_Init:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	or r24,r25
	breq .L6
	ld r24,Y
	ldd r25,Y+1
	ldd r26,Y+2
	ldd r27,Y+3
	sbiw r24,0
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	breq .L6
	movw r18,r24
	movw r20,r26
	ldi r24,4
	1:
	lsl r18
	rol r19
	rol r20
	rol r21
	dec r24
	brne 1b
	ldi r22,0
	ldi r23,lo8(36)
	ldi r24,lo8(-12)
	ldi r25,0
	call __udivmodsi4
	subi r18,1
	sbc r19,__zero_reg__
	mov r24,r19
	andi r24,lo8(15)
	out 0x20,r24
	out 0x9,r18
	ldd r24,Y+6
	swap r24
	andi r24,lo8(48)
	ldd r25,Y+8
	lsl r25
	lsl r25
	lsl r25
	andi r25,lo8(8)
	or r24,r25
	ori r24,lo8(-128)
	ldd r25,Y+4
	lsl r25
	andi r25,lo8(6)
	or r24,r25
	out 0x20,r24
	ldd r24,Y+4
	ldd r25,Y+5
	sbiw r24,7
	brne .L3
	sbi 0xa,2
.L4:
	sbi 0xa,3
	sbi 0xa,4
	ldi r25,0
	ldi r24,0
.L1:
/* epilogue start */
	pop r29
	pop r28
	ret
.L3:
	cbi 0xa,2
	rjmp .L4
.L6:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L1
	.size	UART_Init, .-UART_Init
.global	UART_DeInit
	.type	UART_DeInit, @function
UART_DeInit:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cbi 0xa,3
	cbi 0xa,4
	cbi 0xa,7
	cbi 0xa,6
	cbi 0xa,5
	sts UART_RxCallBack+1,__zero_reg__
	sts UART_RxCallBack,__zero_reg__
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	UART_DeInit, .-UART_DeInit
.global	UART_SendByte
	.type	UART_SendByte, @function
UART_SendByte:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L9:
	sbis 0xb,5
	rjmp .L9
	out 0xc,r24
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	UART_SendByte, .-UART_SendByte
.global	UART_ReceiveByte
	.type	UART_ReceiveByte, @function
UART_ReceiveByte:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L15
.L14:
	sbis 0xb,7
	rjmp .L14
	in r18,0xc
	movw r30,r24
	st Z,r18
	ldi r25,0
	ldi r24,0
	ret
.L15:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	UART_ReceiveByte, .-UART_ReceiveByte
.global	UART_ReceiveByteNonBlocking
	.type	UART_ReceiveByteNonBlocking, @function
UART_ReceiveByteNonBlocking:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L21
	sbis 0xb,7
	rjmp .L21
	in r18,0xc
	movw r30,r24
	st Z,r18
	ldi r25,0
	ldi r24,0
	ret
.L21:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	UART_ReceiveByteNonBlocking, .-UART_ReceiveByteNonBlocking
.global	UART_SendString
	.type	UART_SendString, @function
UART_SendString:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	or r24,r25
	brne .L24
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L22
.L25:
	call UART_SendByte
.L24:
	ld r24,Y+
	cpse r24,__zero_reg__
	rjmp .L25
	ldi r25,0
	ldi r24,0
.L22:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	UART_SendString, .-UART_SendString
.global	UART_SendNumber
	.type	UART_SendNumber, @function
UART_SendNumber:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 12 */
.L__stack_usage = 12
	sbiw r24,0
	brne .L28
	ldi r24,lo8(48)
/* epilogue start */
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	jmp UART_SendByte
.L28:
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	movw r30,r16
	ldi r18,0
	ldi r19,lo8(10)
	mov r14,r19
	mov r15,__zero_reg__
.L31:
	subi r18,lo8(-(1))
	movw r22,r14
	call __udivmodhi4
	subi r24,lo8(-(48))
	st Z+,r24
	movw r24,r22
	sbiw r24,0
	brne .L29
.L32:
	mov r19,r18
	lsr r19
	mov r24,r18
	ldi r25,0
	movw r26,r16
	add r26,r24
	adc r27,r25
	movw r14,r16
.L30:
	sbiw r26,1
	mov r18,r14
	sub r18,r16
	cp r18,r19
	brlo .L33
	add r24,r16
	adc r25,r17
	movw r30,r24
	st Z,__zero_reg__
.L34:
	movw r30,r16
	ld r24,Z+
	movw r16,r30
	cpse r24,__zero_reg__
	rjmp .L35
	ldi r25,0
	ldi r24,0
/* epilogue start */
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
.L29:
	cpi r18,lo8(5)
	brne .L31
	rjmp .L32
.L33:
	movw r30,r14
	ld r18,Z+
	movw r14,r30
	ld r22,X
	movw r20,r30
	subi r20,1
	sbc r21,__zero_reg__
	movw r30,r20
	st Z,r22
	st X,r18
	rjmp .L30
.L35:
	call UART_SendByte
	rjmp .L34
	.size	UART_SendNumber, .-UART_SendNumber
.global	UART_ReceiveString
	.type	UART_ReceiveString, @function
UART_ReceiveString:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L43
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L43
	movw r30,r24
	ldi r19,0
	ldi r18,0
	subi r22,1
	sbc r23,__zero_reg__
.L39:
	cp r18,r22
	cpc r19,r23
	brlo .L40
.L41:
	add r24,r18
	adc r25,r19
	movw r30,r24
	st Z,__zero_reg__
	ldi r25,0
	ldi r24,0
	ret
.L40:
	sbis 0xb,7
	rjmp .L40
	in r21,0xc
	cp r20,r21
	breq .L41
	st Z+,r21
	subi r18,-1
	sbci r19,-1
	rjmp .L39
.L43:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	UART_ReceiveString, .-UART_ReceiveString
.global	UART_SetRxCallBack
	.type	UART_SetRxCallBack, @function
UART_SetRxCallBack:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L49
	sts UART_RxCallBack+1,r25
	sts UART_RxCallBack,r24
	sbi 0xa,7
	ldi r25,0
	ldi r24,0
	ret
.L49:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	UART_SetRxCallBack, .-UART_SetRxCallBack
.global	__vector_13
	.type	__vector_13, @function
__vector_13:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
	push r19
	push r20
	push r21
	push r22
	push r23
	push r24
	push r25
	push r26
	push r27
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 15 */
.L__stack_usage = 15
	in r24,0xc
	lds r30,UART_RxCallBack
	lds r31,UART_RxCallBack+1
	sbiw r30,0
	breq .L50
	icall
.L50:
/* epilogue start */
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.size	__vector_13, .-__vector_13
	.local	UART_RxCallBack
	.comm	UART_RxCallBack,2,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
