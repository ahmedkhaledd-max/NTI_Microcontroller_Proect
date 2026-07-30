	.file	"timer.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	Timer_Start
	.type	Timer_Start, @function
Timer_Start:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L6
	andi r22,lo8(7)
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L4
	sbiw r24,2
	breq .L5
	in r24,0x33
	andi r24,lo8(-8)
	out 0x33,r24
	in r24,0x33
	or r22,r24
	out 0x33,r22
.L7:
	ldi r25,0
	ldi r24,0
	ret
.L4:
	in r24,0x2e
	andi r24,lo8(-8)
	out 0x2e,r24
	in r24,0x2e
	or r22,r24
	out 0x2e,r22
	rjmp .L7
.L5:
	in r24,0x25
	andi r24,lo8(-8)
	out 0x25,r24
	in r24,0x25
	or r22,r24
	out 0x25,r22
	rjmp .L7
.L6:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Timer_Start, .-Timer_Start
.global	Timer_Init
	.type	Timer_Init, @function
Timer_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	or r24,r25
	brne .+2
	rjmp .L8
	ld r18,Z
	ldd r19,Z+1
	cpi r18,3
	cpc r19,__zero_reg__
	brsh .L8
	ldd r24,Z+2
	ldd r25,Z+3
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L11
	cpi r18,2
	cpc r19,__zero_reg__
	breq .L12
	in r18,0x2f
	andi r18,lo8(-2)
	out 0x2f,r18
	in r18,0x2f
	andi r18,lo8(-3)
	out 0x2f,r18
	in r18,0x2e
	andi r18,lo8(-9)
	out 0x2e,r18
	in r18,0x2e
	andi r18,lo8(-17)
	out 0x2e,r18
	cpi r24,1
	cpc r25,__zero_reg__
	brne .+2
	rjmp .L38
	brlo .L17
	sbiw r24,2
	brne .+2
	rjmp .L24
	in r24,0x2f
	ori r24,lo8(1)
	out 0x2f,r24
	rjmp .L17
.L11:
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L14
	brlo .L15
	sbiw r24,2
	breq .L16
	in r24,0x33
	ori r24,lo8(64)
	rjmp .L42
.L15:
	in r24,0x33
	andi r24,lo8(-65)
.L42:
	out 0x33,r24
	in r24,0x33
	andi r24,lo8(-9)
	rjmp .L37
.L14:
	in r24,0x33
	andi r24,lo8(-65)
.L39:
	out 0x33,r24
	in r24,0x33
	ori r24,lo8(8)
.L37:
	out 0x33,r24
.L17:
	ld r24,Z
	ldd r25,Z+1
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L25
	brlo .L26
	sbiw r24,2
	breq .L27
.L8:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
.L16:
	in r24,0x33
	ori r24,lo8(64)
	rjmp .L39
.L12:
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L19
	brlo .L20
	sbiw r24,2
	breq .L21
	in r24,0x25
	ori r24,lo8(64)
	rjmp .L40
.L20:
	in r24,0x25
	andi r24,lo8(-65)
.L40:
	out 0x25,r24
	in r24,0x25
	andi r24,lo8(-9)
	rjmp .L41
.L19:
	in r24,0x25
	andi r24,lo8(-65)
.L43:
	out 0x25,r24
	in r24,0x25
	ori r24,lo8(8)
.L41:
	out 0x25,r24
	rjmp .L17
.L21:
	in r24,0x25
	ori r24,lo8(64)
	rjmp .L43
.L24:
	in r24,0x2f
	ori r24,lo8(1)
	out 0x2f,r24
.L38:
	in r24,0x2e
	ori r24,lo8(8)
	out 0x2e,r24
	rjmp .L17
.L26:
	ldd r24,Z+6
	out 0x32,r24
	ldd r24,Z+8
	out 0x3c,r24
.L28:
	ldd r22,Z+4
	ldd r23,Z+5
	ld r24,Z
	ldd r25,Z+1
	jmp Timer_Start
.L25:
	ldd r24,Z+6
	ldd r25,Z+7
	out 0x2c+1,r25
	out 0x2c,r24
	ldd r24,Z+8
	ldd r25,Z+9
	out 0x2a+1,r25
	out 0x2a,r24
	rjmp .L28
.L27:
	ldd r24,Z+6
	out 0x24,r24
	ldd r24,Z+8
	out 0x23,r24
	rjmp .L28
	.size	Timer_Init, .-Timer_Init
.global	Timer_Stop
	.type	Timer_Stop, @function
Timer_Stop:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L49
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L47
	sbiw r24,2
	breq .L48
	in r24,0x33
	andi r24,lo8(-8)
	out 0x33,r24
.L50:
	ldi r25,0
	ldi r24,0
	ret
.L47:
	in r24,0x2e
	andi r24,lo8(-8)
	out 0x2e,r24
	rjmp .L50
.L48:
	in r24,0x25
	andi r24,lo8(-8)
	out 0x25,r24
	rjmp .L50
.L49:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Timer_Stop, .-Timer_Stop
.global	Timer_SetCounterValue
	.type	Timer_SetCounterValue, @function
Timer_SetCounterValue:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L56
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L54
	sbiw r24,2
	breq .L55
	out 0x32,r22
.L57:
	ldi r25,0
	ldi r24,0
	ret
.L54:
	out 0x2c+1,r23
	out 0x2c,r22
	rjmp .L57
.L55:
	out 0x24,r22
	rjmp .L57
.L56:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Timer_SetCounterValue, .-Timer_SetCounterValue
.global	Timer_GetCounterValue
	.type	Timer_GetCounterValue, @function
Timer_GetCounterValue:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r22
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L64
	sbiw r30,0
	breq .L64
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L61
	sbiw r24,2
	breq .L62
	in r24,0x32
.L66:
	ldi r25,0
	rjmp .L65
.L61:
	in r24,0x2c
	in r25,0x2c+1
.L65:
	std Z+1,r25
	st Z,r24
	ldi r25,0
	ldi r24,0
	ret
.L62:
	in r24,0x24
	rjmp .L66
.L64:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Timer_GetCounterValue, .-Timer_GetCounterValue
.global	Timer_SetCompareValue
	.type	Timer_SetCompareValue, @function
Timer_SetCompareValue:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L72
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L70
	sbiw r24,2
	breq .L71
	out 0x3c,r22
.L73:
	ldi r25,0
	ldi r24,0
	ret
.L70:
	out 0x2a+1,r23
	out 0x2a,r22
	rjmp .L73
.L71:
	out 0x23,r22
	rjmp .L73
.L72:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Timer_SetCompareValue, .-Timer_SetCompareValue
.global	Timer_EnableInterrupt
	.type	Timer_EnableInterrupt, @function
Timer_EnableInterrupt:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L82
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L77
	sbiw r24,2
	breq .L78
	in r24,0x39
	ldi r25,lo8(1)
	or r22,r23
	breq .L81
	ldi r25,lo8(2)
.L81:
	or r24,r25
	out 0x39,r24
	ldi r25,0
	ldi r24,0
	ret
.L77:
	in r24,0x39
	ldi r25,lo8(16)
	or r22,r23
	brne .L81
	ldi r25,lo8(4)
	rjmp .L81
.L78:
	in r24,0x39
	ldi r25,lo8(-128)
	or r22,r23
	brne .L81
	ldi r25,lo8(64)
	rjmp .L81
.L82:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Timer_EnableInterrupt, .-Timer_EnableInterrupt
.global	Timer_DisableInterrupt
	.type	Timer_DisableInterrupt, @function
Timer_DisableInterrupt:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L94
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L89
	sbiw r24,2
	breq .L90
	in r24,0x39
	ldi r25,lo8(-2)
	or r22,r23
	breq .L93
	ldi r25,lo8(-3)
.L93:
	and r24,r25
	out 0x39,r24
	ldi r25,0
	ldi r24,0
	ret
.L89:
	in r24,0x39
	ldi r25,lo8(-17)
	or r22,r23
	brne .L93
	ldi r25,lo8(-5)
	rjmp .L93
.L90:
	in r24,0x39
	ldi r25,lo8(127)
	or r22,r23
	brne .L93
	ldi r25,lo8(-65)
	rjmp .L93
.L94:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Timer_DisableInterrupt, .-Timer_DisableInterrupt
.global	Timer_DeInit
	.type	Timer_DeInit, @function
Timer_DeInit:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L104
	movw r28,r24
	ldi r23,0
	ldi r22,0
	call Timer_DisableInterrupt
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r28
	call Timer_DisableInterrupt
	cpi r28,1
	cpc r29,__zero_reg__
	breq .L101
	cpi r28,2
	cpc r29,__zero_reg__
	breq .L102
	out 0x33,__zero_reg__
	out 0x32,__zero_reg__
.L103:
	lsl r28
	rol r29
	lsl r28
	rol r29
	subi r28,lo8(-(Timer_CallBacks))
	sbci r29,hi8(-(Timer_CallBacks))
	std Y+1,__zero_reg__
	st Y,__zero_reg__
	std Y+3,__zero_reg__
	std Y+2,__zero_reg__
	ldi r25,0
	ldi r24,0
.L98:
/* epilogue start */
	pop r29
	pop r28
	ret
.L101:
	out 0x2f,__zero_reg__
	out 0x2e,__zero_reg__
	out 0x2c+1,__zero_reg__
	out 0x2c,__zero_reg__
	rjmp .L103
.L102:
	out 0x25,__zero_reg__
	out 0x24,__zero_reg__
	rjmp .L103
.L104:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L98
	.size	Timer_DeInit, .-Timer_DeInit
.global	Timer_SetCallBack
	.type	Timer_SetCallBack, @function
Timer_SetCallBack:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,3
	cpc r25,__zero_reg__
	brsh .L108
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	breq .L108
	movw r30,r24
	lsl r30
	rol r31
	add r30,r22
	adc r31,r23
	lsl r30
	rol r31
	subi r30,lo8(-(Timer_CallBacks))
	sbci r31,hi8(-(Timer_CallBacks))
	std Z+1,r21
	st Z,r20
	ldi r25,0
	ldi r24,0
	ret
.L108:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	Timer_SetCallBack, .-Timer_SetCallBack
.global	Timer_EnableGlobalInterrupt
	.type	Timer_EnableGlobalInterrupt, @function
Timer_EnableGlobalInterrupt:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,__SREG__
	ori r24,lo8(-128)
	out __SREG__,r24
/* epilogue start */
	ret
	.size	Timer_EnableGlobalInterrupt, .-Timer_EnableGlobalInterrupt
.global	Timer_DisableGlobalInterrupt
	.type	Timer_DisableGlobalInterrupt, @function
Timer_DisableGlobalInterrupt:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,__SREG__
	andi r24,lo8(127)
	out __SREG__,r24
/* epilogue start */
	ret
	.size	Timer_DisableGlobalInterrupt, .-Timer_DisableGlobalInterrupt
.global	__vector_11
	.type	__vector_11, @function
__vector_11:
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
	lds r30,Timer_CallBacks
	lds r31,Timer_CallBacks+1
	sbiw r30,0
	breq .L111
	icall
.L111:
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
	.size	__vector_11, .-__vector_11
.global	__vector_10
	.type	__vector_10, @function
__vector_10:
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
	lds r30,Timer_CallBacks+2
	lds r31,Timer_CallBacks+2+1
	sbiw r30,0
	breq .L116
	icall
.L116:
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
	.size	__vector_10, .-__vector_10
.global	__vector_9
	.type	__vector_9, @function
__vector_9:
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
	lds r30,Timer_CallBacks+4
	lds r31,Timer_CallBacks+4+1
	sbiw r30,0
	breq .L121
	icall
.L121:
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
	.size	__vector_9, .-__vector_9
.global	__vector_7
	.type	__vector_7, @function
__vector_7:
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
	lds r30,Timer_CallBacks+6
	lds r31,Timer_CallBacks+6+1
	sbiw r30,0
	breq .L126
	icall
.L126:
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
	.size	__vector_7, .-__vector_7
.global	__vector_5
	.type	__vector_5, @function
__vector_5:
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
	lds r30,Timer_CallBacks+8
	lds r31,Timer_CallBacks+8+1
	sbiw r30,0
	breq .L131
	icall
.L131:
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
	.size	__vector_5, .-__vector_5
.global	__vector_4
	.type	__vector_4, @function
__vector_4:
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
	lds r30,Timer_CallBacks+10
	lds r31,Timer_CallBacks+10+1
	sbiw r30,0
	breq .L136
	icall
.L136:
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
	.size	__vector_4, .-__vector_4
	.local	Timer_CallBacks
	.comm	Timer_CallBacks,12,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_clear_bss
