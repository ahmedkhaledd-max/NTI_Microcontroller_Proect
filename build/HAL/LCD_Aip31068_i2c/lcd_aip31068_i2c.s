	.file	"lcd_aip31068_i2c.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	LCD_Aip31068_Transfer.isra.1, @function
LCD_Aip31068_Transfer.isra.1:
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
	movw r16,r24
	mov r28,r22
	movw r12,r20
	movw r14,r18
	call I2C_Start
	or r24,r25
	brne .L7
	movw r30,r16
	ld r24,Z
	lsl r24
	call I2C_WriteByte
	or r24,r25
	breq .L3
.L4:
	call I2C_Stop
.L7:
	ldi r16,lo8(1)
	ldi r17,0
	rjmp .L1
.L3:
	mov r24,r28
	call I2C_WriteByte
	movw r16,r24
	movw r28,r12
	add r14,r12
	adc r15,r13
	or r24,r25
	brne .L4
.L5:
	cp r28,r14
	cpc r29,r15
	brne .L6
	call I2C_Stop
.L1:
	movw r24,r16
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
.L6:
	ld r24,Y+
	call I2C_WriteByte
	or r24,r25
	breq .L5
	rjmp .L4
	.size	LCD_Aip31068_Transfer.isra.1, .-LCD_Aip31068_Transfer.isra.1
.global	LCD_Aip31068_SendCommand
	.type	LCD_Aip31068_SendCommand, @function
LCD_Aip31068_SendCommand:
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 3 */
.L__stack_usage = 3
	std Y+1,r22
	sbiw r24,0
	breq .L10
	ldi r18,lo8(1)
	ldi r19,0
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	ldi r22,0
	call LCD_Aip31068_Transfer.isra.1
	ldi r30,lo8(199)
	ldi r31,hi8(199)
1:	sbiw r30,1
	brne 1b
	rjmp .
	nop
.L8:
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	ret
.L10:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L8
	.size	LCD_Aip31068_SendCommand, .-LCD_Aip31068_SendCommand
.global	LCD_Aip31068_Init
	.type	LCD_Aip31068_Init, @function
LCD_Aip31068_Init:
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
	brne .L12
.L14:
	clr r14
	inc r14
	mov r15,__zero_reg__
.L11:
	movw r24,r14
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	ret
.L12:
	ld r24,Y
	sbrc r24,7
	rjmp .L14
	ldd r24,Y+1
	tst r24
	breq .L14
	ldd r25,Y+2
	tst r25
	breq .L14
	cpi r24,lo8(5)
	brsh .L14
	std Y+3,__zero_reg__
	ldi r18,lo8(159999)
	ldi r24,hi8(159999)
	ldi r25,hlo8(159999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	ldd r24,Y+1
	ldi r17,lo8(56)
	cpi r24,lo8(2)
	brsh .L15
	ldi r17,lo8(48)
.L15:
	mov r22,r17
	movw r24,r28
	call LCD_Aip31068_SendCommand
	movw r14,r24
	or r24,r25
	brne .L14
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	mov r22,r17
	movw r24,r28
	call LCD_Aip31068_SendCommand
	ldi r24,lo8(799)
	ldi r25,hi8(799)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	mov r22,r17
	movw r24,r28
	call LCD_Aip31068_SendCommand
	ldi r24,lo8(799)
	ldi r25,hi8(799)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ldi r24,lo8(8)
	std Y+4,r24
	ldi r22,lo8(8)
	movw r24,r28
	call LCD_Aip31068_SendCommand
	ldi r22,lo8(1)
	movw r24,r28
	call LCD_Aip31068_SendCommand
	ldi r24,lo8(7999)
	ldi r25,hi8(7999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ldi r24,lo8(6)
	std Y+5,r24
	ldi r22,lo8(6)
	movw r24,r28
	call LCD_Aip31068_SendCommand
	ldi r24,lo8(12)
	std Y+4,r24
	ldi r22,lo8(12)
	movw r24,r28
	call LCD_Aip31068_SendCommand
	std Y+6,__zero_reg__
	std Y+7,__zero_reg__
	ldi r24,lo8(1)
	std Y+3,r24
	rjmp .L11
	.size	LCD_Aip31068_Init, .-LCD_Aip31068_Init
.global	LCD_Aip31068_WriteChar
	.type	LCD_Aip31068_WriteChar, @function
LCD_Aip31068_WriteChar:
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 3 */
.L__stack_usage = 3
	std Y+1,r22
	sbiw r24,0
	breq .L26
	movw r30,r24
	ldd r18,Z+3
	tst r18
	breq .L26
	ldi r18,lo8(1)
	ldi r19,0
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	ldi r22,lo8(64)
	call LCD_Aip31068_Transfer.isra.1
	ldi r30,lo8(199)
	ldi r31,hi8(199)
1:	sbiw r30,1
	brne 1b
	rjmp .
	nop
.L23:
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	ret
.L26:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L23
	.size	LCD_Aip31068_WriteChar, .-LCD_Aip31068_WriteChar
.global	LCD_Aip31068_WriteString
	.type	LCD_Aip31068_WriteString, @function
LCD_Aip31068_WriteString:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r20,r22
	sbiw r24,0
	breq .L32
	movw r30,r24
	ldd r18,Z+3
	tst r18
	breq .L32
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L32
	movw r30,r22
.L29:
	movw r18,r30
	sub r18,r20
	sbc r19,r21
	ld r22,Z+
	cpse r22,__zero_reg__
	rjmp .L29
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L33
	ldi r22,lo8(64)
	jmp LCD_Aip31068_Transfer.isra.1
.L32:
	ldi r24,lo8(1)
	ldi r25,0
	ret
.L33:
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	LCD_Aip31068_WriteString, .-LCD_Aip31068_WriteString
.global	LCD_Aip31068_WriteNumber
	.type	LCD_Aip31068_WriteNumber, @function
LCD_Aip31068_WriteNumber:
	push r4
	push r5
	push r6
	push r7
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
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,22
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 22 */
/* stack size = 36 */
.L__stack_usage = 36
	movw r30,r24
	or r24,r25
	brne .+2
	rjmp .L47
	ldd r18,Z+3
	tst r18
	brne .+2
	rjmp .L47
	movw r26,r22
	movw r24,r20
	movw r16,r30
	sbiw r24,0
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brne .L37
	ldi r22,lo8(48)
	movw r24,r30
	call LCD_Aip31068_WriteChar
.L35:
/* epilogue start */
	adiw r28,22
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
	pop r13
	pop r12
	pop r11
	pop r10
	pop r7
	pop r6
	pop r5
	pop r4
	ret
.L37:
	sbrs r27,7
	rjmp .L38
	ldi r18,lo8(45)
	std Y+1,r18
	movw r18,r20
	movw r20,r22
	clr r22
	clr r23
	movw r24,r22
	sub r22,r18
	sbc r23,r19
	sbc r24,r20
	sbc r25,r21
	clr r10
	inc r10
.L39:
	movw r12,r28
	ldi r31,13
	add r12,r31
	adc r13,__zero_reg__
	mov r11,__zero_reg__
	movw r14,r12
	ldi r18,lo8(10)
	mov r4,r18
	mov r5,__zero_reg__
	mov r6,__zero_reg__
	mov r7,__zero_reg__
	rjmp .L40
.L38:
	movw r22,r20
	movw r24,r26
	mov r10,__zero_reg__
	rjmp .L39
.L41:
	ldi r18,lo8(10)
	cp r11,r18
	breq .L44
	movw r20,r6
	movw r18,r4
	call __udivmodsi4
	subi r22,lo8(-(48))
	movw r30,r12
	st Z+,r22
	movw r12,r30
	movw r22,r18
	movw r24,r20
	inc r11
.L40:
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	cpc r24,__zero_reg__
	cpc r25,__zero_reg__
	brne .L41
.L44:
	mov r24,r11
	add r10,r11
.L42:
	mov r18,r10
	sub r18,r24
	ldi r19,0
	cpse r24,__zero_reg__
	rjmp .L45
	ldi r20,lo8(1)
	ldi r21,0
	add r20,r28
	adc r21,r29
	add r18,r20
	adc r19,r21
	movw r30,r18
	st Z,__zero_reg__
	movw r22,r20
	movw r24,r16
	call LCD_Aip31068_WriteString
	rjmp .L35
.L45:
	subi r24,lo8(-(-1))
	ldi r20,lo8(1)
	ldi r21,0
	add r20,r28
	adc r21,r29
	add r18,r20
	adc r19,r21
	movw r30,r14
	add r30,r24
	adc r31,__zero_reg__
	ld r25,Z
	movw r30,r18
	st Z,r25
	rjmp .L42
.L47:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L35
	.size	LCD_Aip31068_WriteNumber, .-LCD_Aip31068_WriteNumber
.global	LCD_Aip31068_SetCursor
	.type	LCD_Aip31068_SetCursor, @function
LCD_Aip31068_SetCursor:
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
	brne .L49
.L51:
	ldi r24,lo8(1)
	ldi r25,0
.L48:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L49:
	ldd r24,Y+3
	tst r24
	breq .L51
	ldd r24,Y+1
	cp r22,r24
	brsh .L51
	ldd r25,Y+2
	cp r20,r25
	brsh .L51
	cpi r22,lo8(2)
	breq .L52
	subi r25,lo8(-(64))
	cpi r22,lo8(3)
	breq .L52
	ldi r25,lo8(64)
	cpi r22,lo8(1)
	breq .L52
	ldi r25,0
.L52:
	mov r16,r20
	mov r17,r22
	add r25,r20
	mov r22,r25
	ori r22,lo8(-128)
	movw r24,r28
	call LCD_Aip31068_SendCommand
	sbiw r24,0
	brne .L51
	std Y+6,r17
	std Y+7,r16
	rjmp .L48
	.size	LCD_Aip31068_SetCursor, .-LCD_Aip31068_SetCursor
.global	LCD_Aip31068_WriteStringAt
	.type	LCD_Aip31068_WriteStringAt, @function
LCD_Aip31068_WriteStringAt:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r16,r18
	call LCD_Aip31068_SetCursor
	or r24,r25
	brne .L65
	movw r22,r16
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	jmp LCD_Aip31068_WriteString
.L65:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	LCD_Aip31068_WriteStringAt, .-LCD_Aip31068_WriteStringAt
.global	LCD_Aip31068_Clear
	.type	LCD_Aip31068_Clear, @function
LCD_Aip31068_Clear:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	sbiw r24,0
	brne .L67
.L69:
	ldi r24,lo8(1)
	ldi r25,0
.L66:
/* epilogue start */
	pop r29
	pop r28
	ret
.L67:
	movw r30,r24
	ldd r18,Z+3
	tst r18
	breq .L69
	movw r28,r24
	ldi r22,lo8(1)
	call LCD_Aip31068_SendCommand
	sbiw r24,0
	brne .L69
	ldi r30,lo8(7999)
	ldi r31,hi8(7999)
1:	sbiw r30,1
	brne 1b
	rjmp .
	nop
	std Y+6,__zero_reg__
	std Y+7,__zero_reg__
	rjmp .L66
	.size	LCD_Aip31068_Clear, .-LCD_Aip31068_Clear
.global	LCD_Aip31068_Home
	.type	LCD_Aip31068_Home, @function
LCD_Aip31068_Home:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	sbiw r24,0
	brne .L74
.L76:
	ldi r24,lo8(1)
	ldi r25,0
.L73:
/* epilogue start */
	pop r29
	pop r28
	ret
.L74:
	movw r30,r24
	ldd r18,Z+3
	tst r18
	breq .L76
	movw r28,r24
	ldi r22,lo8(2)
	call LCD_Aip31068_SendCommand
	sbiw r24,0
	brne .L76
	ldi r30,lo8(7999)
	ldi r31,hi8(7999)
1:	sbiw r30,1
	brne 1b
	rjmp .
	nop
	std Y+6,__zero_reg__
	std Y+7,__zero_reg__
	rjmp .L73
	.size	LCD_Aip31068_Home, .-LCD_Aip31068_Home
.global	LCD_Aip31068_DisplayOnOff
	.type	LCD_Aip31068_DisplayOnOff, @function
LCD_Aip31068_DisplayOnOff:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	or r24,r25
	breq .L80
	ldd r24,Z+3
	tst r24
	breq .L80
	ldd r24,Z+4
	tst r22
	breq .L82
	ori r24,lo8(4)
.L88:
	std Z+4,r24
	ldd r22,Z+4
	movw r24,r30
	jmp LCD_Aip31068_SendCommand
.L82:
	andi r24,lo8(-5)
	rjmp .L88
.L80:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_Aip31068_DisplayOnOff, .-LCD_Aip31068_DisplayOnOff
.global	LCD_Aip31068_CursorOnOff
	.type	LCD_Aip31068_CursorOnOff, @function
LCD_Aip31068_CursorOnOff:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	or r24,r25
	breq .L89
	ldd r24,Z+3
	tst r24
	breq .L89
	ldd r24,Z+4
	tst r22
	breq .L91
	ori r24,lo8(2)
.L97:
	std Z+4,r24
	ldd r22,Z+4
	movw r24,r30
	jmp LCD_Aip31068_SendCommand
.L91:
	andi r24,lo8(-3)
	rjmp .L97
.L89:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_Aip31068_CursorOnOff, .-LCD_Aip31068_CursorOnOff
.global	LCD_Aip31068_BlinkOnOff
	.type	LCD_Aip31068_BlinkOnOff, @function
LCD_Aip31068_BlinkOnOff:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	or r24,r25
	breq .L98
	ldd r24,Z+3
	tst r24
	breq .L98
	ldd r24,Z+4
	tst r22
	breq .L100
	ori r24,lo8(1)
.L106:
	std Z+4,r24
	ldd r22,Z+4
	movw r24,r30
	jmp LCD_Aip31068_SendCommand
.L100:
	andi r24,lo8(-2)
	rjmp .L106
.L98:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_Aip31068_BlinkOnOff, .-LCD_Aip31068_BlinkOnOff
.global	LCD_Aip31068_ShiftDisplay
	.type	LCD_Aip31068_ShiftDisplay, @function
LCD_Aip31068_ShiftDisplay:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L107
	movw r30,r24
	ldd r18,Z+3
	tst r18
	breq .L107
	tst r22
	breq .L112
	ldi r22,lo8(28)
.L109:
	jmp LCD_Aip31068_SendCommand
.L112:
	ldi r22,lo8(24)
	rjmp .L109
.L107:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_Aip31068_ShiftDisplay, .-LCD_Aip31068_ShiftDisplay
.global	LCD_Aip31068_CreateCustomChar
	.type	LCD_Aip31068_CreateCustomChar, @function
LCD_Aip31068_CreateCustomChar:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 8 */
/* stack size = 14 */
.L__stack_usage = 14
	sbiw r24,0
	brne .L116
.L118:
	ldi r24,lo8(1)
	ldi r25,0
.L115:
/* epilogue start */
	adiw r28,8
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
.L116:
	movw r30,r24
	ldd r18,Z+3
	tst r18
	breq .L118
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	breq .L118
	cpi r22,lo8(8)
	brsh .L118
	movw r16,r20
	movw r14,r24
	lsl r22
	lsl r22
	lsl r22
	ori r22,lo8(64)
	call LCD_Aip31068_SendCommand
	or r24,r25
	brne .L118
	movw r30,r16
	movw r26,r28
	adiw r26,1
	movw r18,r16
	subi r18,-8
	sbci r19,-1
	movw r20,r26
.L119:
	ld r24,Z+
	andi r24,lo8(31)
	st X+,r24
	cp r30,r18
	cpc r31,r19
	brne .L119
	ldi r18,lo8(8)
	ldi r19,0
	ldi r22,lo8(64)
	movw r24,r14
	call LCD_Aip31068_Transfer.isra.1
	or r24,r25
	brne .L118
	ldi r20,0
	ldi r22,0
	movw r24,r14
	call LCD_Aip31068_SetCursor
	rjmp .L115
	.size	LCD_Aip31068_CreateCustomChar, .-LCD_Aip31068_CreateCustomChar
	.ident	"GCC: (GNU) 7.3.0"
