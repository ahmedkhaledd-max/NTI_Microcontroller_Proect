	.file	"lcd_hd44780.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	LCD_Hd44780_EnablePulse, @function
LCD_Hd44780_EnablePulse:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldi r20,lo8(1)
	ldd r22,Y+7
	ldd r24,Y+4
	call GPIO_SetPinValue
	ldi r24,lo8(10)
1:	dec r24
	brne 1b
	rjmp .
	ldi r20,0
	ldd r22,Y+7
	ldd r24,Y+4
	call GPIO_SetPinValue
	ldi r24,lo8(10)
1:	dec r24
	brne 1b
	rjmp .
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	LCD_Hd44780_EnablePulse, .-LCD_Hd44780_EnablePulse
	.type	LCD_Hd44780_WriteNibble, @function
LCD_Hd44780_WriteNibble:
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
	movw r16,r24
	ldi r29,0
	ldi r28,0
	mov r14,r22
	mov r15,__zero_reg__
.L3:
	movw r20,r14
	mov r0,r28
	rjmp 2f
	1:
	asr r21
	ror r20
	2:
	dec r0
	brpl 1b
	andi r20,lo8(1)
	movw r30,r16
	ldd r22,Z+3
	add r22,r28
	ldd r24,Z+2
	call GPIO_SetPinValue
	adiw r28,1
	cpi r28,4
	cpc r29,__zero_reg__
	brne .L3
	movw r24,r16
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	jmp LCD_Hd44780_EnablePulse
	.size	LCD_Hd44780_WriteNibble, .-LCD_Hd44780_WriteNibble
	.type	LCD_Hd44780_WriteBus, @function
LCD_Hd44780_WriteBus:
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
	movw r16,r24
	mov r28,r22
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	sbiw r24,1
	brne .L6
	mov r15,__zero_reg__
	mov r14,__zero_reg__
	ldi r29,0
.L7:
	movw r20,r28
	mov r0,r14
	rjmp 2f
	1:
	asr r21
	ror r20
	2:
	dec r0
	brpl 1b
	andi r20,lo8(1)
	movw r30,r16
	ldd r22,Z+3
	add r22,r14
	ldd r24,Z+2
	call GPIO_SetPinValue
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
	ldi r24,8
	cp r14,r24
	cpc r15,__zero_reg__
	brne .L7
	movw r24,r16
	call LCD_Hd44780_EnablePulse
.L8:
	ldi r30,lo8(199)
	ldi r31,hi8(199)
1:	sbiw r30,1
	brne 1b
	rjmp .
	nop
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
.L6:
	swap r22
	andi r22,lo8(15)
	movw r24,r16
	call LCD_Hd44780_WriteNibble
	mov r22,r28
	andi r22,lo8(15)
	movw r24,r16
	call LCD_Hd44780_WriteNibble
	rjmp .L8
	.size	LCD_Hd44780_WriteBus, .-LCD_Hd44780_WriteBus
.global	LCD_Hd44780_SendCommand
	.type	LCD_Hd44780_SendCommand, @function
LCD_Hd44780_SendCommand:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	sbiw r24,0
	breq .L12
	mov r17,r22
	movw r28,r24
	ldi r20,0
	ldd r22,Y+5
	ldd r24,Y+4
	call GPIO_SetPinValue
	mov r22,r17
	movw r24,r28
	call LCD_Hd44780_WriteBus
	ldi r25,0
	ldi r24,0
.L10:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	ret
.L12:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L10
	.size	LCD_Hd44780_SendCommand, .-LCD_Hd44780_SendCommand
.global	LCD_Hd44780_Init
	.type	LCD_Hd44780_Init, @function
LCD_Hd44780_Init:
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
	brne .+2
	rjmp .L29
	ldd r24,Y+2
	cpi r24,lo8(4)
	brlo .+2
	rjmp .L29
	ldd r24,Y+4
	cpi r24,lo8(4)
	brlo .+2
	rjmp .L29
	ldd r24,Y+9
	tst r24
	brne .+2
	rjmp .L29
	ldd r25,Y+10
	tst r25
	brne .+2
	rjmp .L29
	cpi r24,lo8(5)
	brlo .+2
	rjmp .L29
	ld r24,Y
	ldd r25,Y+1
	ldi r16,lo8(4)
	sbiw r24,1
	brne .L15
	ldi r16,lo8(8)
.L15:
	ldd r24,Y+3
	add r24,r16
	clr r25
	rol r25
	sbiw r24,9
	brlo .+2
	rjmp .L29
	ldi r17,0
.L16:
	ldd r22,Y+3
	add r22,r17
	ldi r20,lo8(1)
	ldd r24,Y+2
	call GPIO_SetPinDirection
	ldd r22,Y+3
	add r22,r17
	ldi r20,0
	ldd r24,Y+2
	call GPIO_SetPinValue
	subi r17,lo8(-(1))
	cpse r16,r17
	rjmp .L16
	ldi r20,lo8(1)
	ldd r22,Y+5
	ldd r24,Y+4
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldd r22,Y+7
	ldd r24,Y+4
	call GPIO_SetPinDirection
	ldi r20,0
	ldd r22,Y+5
	ldd r24,Y+4
	call GPIO_SetPinValue
	ldi r20,0
	ldd r22,Y+7
	ldd r24,Y+4
	call GPIO_SetPinValue
	ldd r24,Y+8
	tst r24
	breq .L17
	ldi r20,lo8(1)
	ldd r22,Y+6
	ldd r24,Y+4
	call GPIO_SetPinDirection
	ldi r20,0
	ldd r22,Y+6
	ldd r24,Y+4
	call GPIO_SetPinValue
.L17:
	ldi r18,lo8(159999)
	ldi r24,hi8(159999)
	ldi r25,hlo8(159999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	ld r24,Y
	ldd r25,Y+1
	or r24,r25
	breq .+2
	rjmp .L18
	ldi r22,lo8(3)
	movw r24,r28
	call LCD_Hd44780_WriteNibble
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ldi r22,lo8(3)
	movw r24,r28
	call LCD_Hd44780_WriteNibble
	ldi r24,lo8(599)
	ldi r25,hi8(599)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ldi r22,lo8(3)
	movw r24,r28
	call LCD_Hd44780_WriteNibble
	ldi r24,lo8(599)
	ldi r25,hi8(599)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ldi r22,lo8(2)
	movw r24,r28
	call LCD_Hd44780_WriteNibble
.L35:
	ldi r24,lo8(599)
	ldi r25,hi8(599)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ld r24,Y
	ldd r25,Y+1
	ldi r22,lo8(48)
	sbiw r24,1
	breq .L20
	ldi r22,lo8(32)
.L20:
	ldd r24,Y+9
	cpi r24,lo8(2)
	brlo .L21
	ori r22,lo8(8)
.L21:
	movw r24,r28
	call LCD_Hd44780_SendCommand
	ldi r24,lo8(8)
	std Y+12,r24
	ldi r22,lo8(8)
	movw r24,r28
	call LCD_Hd44780_SendCommand
	ldi r22,lo8(1)
	movw r24,r28
	call LCD_Hd44780_SendCommand
	ldi r24,lo8(7999)
	ldi r25,hi8(7999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ldi r24,lo8(6)
	std Y+13,r24
	ldi r22,lo8(6)
	movw r24,r28
	call LCD_Hd44780_SendCommand
	ldi r24,lo8(12)
	std Y+12,r24
	ldi r22,lo8(12)
	movw r24,r28
	call LCD_Hd44780_SendCommand
	std Y+14,__zero_reg__
	std Y+15,__zero_reg__
	ldi r24,lo8(1)
	std Y+11,r24
	ldi r25,0
	ldi r24,0
.L13:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L18:
	ldi r22,lo8(48)
	movw r24,r28
	call LCD_Hd44780_WriteBus
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ldi r22,lo8(48)
	movw r24,r28
	call LCD_Hd44780_WriteBus
	ldi r24,lo8(599)
	ldi r25,hi8(599)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	ldi r22,lo8(48)
	movw r24,r28
	call LCD_Hd44780_WriteBus
	rjmp .L35
.L29:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L13
	.size	LCD_Hd44780_Init, .-LCD_Hd44780_Init
.global	LCD_Hd44780_WriteChar
	.type	LCD_Hd44780_WriteChar, @function
LCD_Hd44780_WriteChar:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	sbiw r24,0
	breq .L39
	movw r30,r24
	ldd r18,Z+11
	tst r18
	breq .L39
	mov r17,r22
	movw r28,r24
	ldi r20,lo8(1)
	ldd r22,Z+5
	ldd r24,Z+4
	call GPIO_SetPinValue
	mov r22,r17
	movw r24,r28
	call LCD_Hd44780_WriteBus
	ldi r25,0
	ldi r24,0
.L36:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	ret
.L39:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L36
	.size	LCD_Hd44780_WriteChar, .-LCD_Hd44780_WriteChar
.global	LCD_Hd44780_WriteString
	.type	LCD_Hd44780_WriteString, @function
LCD_Hd44780_WriteString:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	sbiw r24,0
	breq .L46
	movw r30,r24
	ldd r18,Z+11
	tst r18
	breq .L46
	movw r16,r24
	movw r28,r22
	or r22,r23
	brne .L42
.L46:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L40
.L43:
	movw r24,r16
	call LCD_Hd44780_WriteChar
.L42:
	ld r22,Y+
	cpse r22,__zero_reg__
	rjmp .L43
	ldi r25,0
	ldi r24,0
.L40:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	LCD_Hd44780_WriteString, .-LCD_Hd44780_WriteString
.global	LCD_Hd44780_WriteNumber
	.type	LCD_Hd44780_WriteNumber, @function
LCD_Hd44780_WriteNumber:
	push r4
	push r5
	push r6
	push r7
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
	sbiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 10 */
/* stack size = 23 */
.L__stack_usage = 23
	movw r30,r24
	sbiw r24,0
	brne .+2
	rjmp .L59
	ldd r18,Z+11
	tst r18
	brne .+2
	rjmp .L59
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	cpc r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L49
	ldi r22,lo8(48)
/* epilogue start */
	adiw r28,10
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
	pop r7
	pop r6
	pop r5
	pop r4
	jmp LCD_Hd44780_WriteChar
.L49:
	movw r12,r20
	movw r14,r22
	movw r16,r24
	movw r24,r22
	movw r22,r20
	sbrs r15,7
	rjmp .L51
	ldi r22,lo8(45)
	movw r24,r30
	call LCD_Hd44780_WriteChar
	clr r22
	clr r23
	movw r24,r22
	sub r22,r12
	sbc r23,r13
	sbc r24,r14
	sbc r25,r15
.L51:
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	movw r14,r18
	mov r11,__zero_reg__
	movw r12,r18
	ldi r18,lo8(10)
	mov r4,r18
	mov r5,__zero_reg__
	mov r6,__zero_reg__
	mov r7,__zero_reg__
.L52:
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	cpc r24,__zero_reg__
	cpc r25,__zero_reg__
	breq .L54
	ldi r31,lo8(10)
	cpse r11,r31
	rjmp .L55
.L54:
	cpse r11,__zero_reg__
	rjmp .L57
	ldi r25,0
	ldi r24,0
.L47:
/* epilogue start */
	adiw r28,10
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
	pop r7
	pop r6
	pop r5
	pop r4
	ret
.L55:
	movw r20,r6
	movw r18,r4
	call __udivmodsi4
	subi r22,lo8(-(48))
	movw r30,r14
	st Z+,r22
	movw r14,r30
	movw r22,r18
	movw r24,r20
	inc r11
	rjmp .L52
.L57:
	dec r11
	movw r30,r12
	add r30,r11
	adc r31,__zero_reg__
	ld r22,Z
	movw r24,r16
	call LCD_Hd44780_WriteChar
	rjmp .L54
.L59:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L47
	.size	LCD_Hd44780_WriteNumber, .-LCD_Hd44780_WriteNumber
.global	LCD_Hd44780_SetCursor
	.type	LCD_Hd44780_SetCursor, @function
LCD_Hd44780_SetCursor:
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
	breq .L69
	ldd r24,Y+11
	tst r24
	breq .L69
	ldd r24,Y+9
	cp r22,r24
	brsh .L69
	ldd r25,Y+10
	cp r20,r25
	brsh .L69
	cpi r22,lo8(2)
	breq .L62
	subi r25,lo8(-(64))
	cpi r22,lo8(3)
	breq .L62
	ldi r25,lo8(64)
	cpi r22,lo8(1)
	breq .L62
	ldi r25,0
.L62:
	mov r16,r20
	mov r17,r22
	add r25,r20
	mov r22,r25
	ori r22,lo8(-128)
	movw r24,r28
	call LCD_Hd44780_SendCommand
	std Y+14,r17
	std Y+15,r16
	ldi r25,0
	ldi r24,0
.L60:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L69:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L60
	.size	LCD_Hd44780_SetCursor, .-LCD_Hd44780_SetCursor
.global	LCD_Hd44780_WriteStringAt
	.type	LCD_Hd44780_WriteStringAt, @function
LCD_Hd44780_WriteStringAt:
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
	call LCD_Hd44780_SetCursor
	or r24,r25
	brne .L76
	movw r22,r16
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	jmp LCD_Hd44780_WriteString
.L76:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	LCD_Hd44780_WriteStringAt, .-LCD_Hd44780_WriteStringAt
.global	LCD_Hd44780_Clear
	.type	LCD_Hd44780_Clear, @function
LCD_Hd44780_Clear:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	sbiw r24,0
	breq .L80
	movw r30,r24
	ldd r18,Z+11
	tst r18
	breq .L80
	movw r28,r24
	ldi r22,lo8(1)
	call LCD_Hd44780_SendCommand
	ldi r24,lo8(7999)
	ldi r25,hi8(7999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	std Y+14,__zero_reg__
	std Y+15,__zero_reg__
	ldi r25,0
	ldi r24,0
.L77:
/* epilogue start */
	pop r29
	pop r28
	ret
.L80:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L77
	.size	LCD_Hd44780_Clear, .-LCD_Hd44780_Clear
.global	LCD_Hd44780_Home
	.type	LCD_Hd44780_Home, @function
LCD_Hd44780_Home:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	sbiw r24,0
	breq .L84
	movw r30,r24
	ldd r18,Z+11
	tst r18
	breq .L84
	movw r28,r24
	ldi r22,lo8(2)
	call LCD_Hd44780_SendCommand
	ldi r24,lo8(7999)
	ldi r25,hi8(7999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	std Y+14,__zero_reg__
	std Y+15,__zero_reg__
	ldi r25,0
	ldi r24,0
.L81:
/* epilogue start */
	pop r29
	pop r28
	ret
.L84:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L81
	.size	LCD_Hd44780_Home, .-LCD_Hd44780_Home
.global	LCD_Hd44780_DisplayOnOff
	.type	LCD_Hd44780_DisplayOnOff, @function
LCD_Hd44780_DisplayOnOff:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	or r24,r25
	breq .L85
	ldd r24,Z+11
	tst r24
	breq .L85
	ldd r24,Z+12
	tst r22
	breq .L87
	ori r24,lo8(4)
.L93:
	std Z+12,r24
	ldd r22,Z+12
	movw r24,r30
	jmp LCD_Hd44780_SendCommand
.L87:
	andi r24,lo8(-5)
	rjmp .L93
.L85:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_Hd44780_DisplayOnOff, .-LCD_Hd44780_DisplayOnOff
.global	LCD_Hd44780_CursorOnOff
	.type	LCD_Hd44780_CursorOnOff, @function
LCD_Hd44780_CursorOnOff:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	or r24,r25
	breq .L94
	ldd r24,Z+11
	tst r24
	breq .L94
	ldd r24,Z+12
	tst r22
	breq .L96
	ori r24,lo8(2)
.L102:
	std Z+12,r24
	ldd r22,Z+12
	movw r24,r30
	jmp LCD_Hd44780_SendCommand
.L96:
	andi r24,lo8(-3)
	rjmp .L102
.L94:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_Hd44780_CursorOnOff, .-LCD_Hd44780_CursorOnOff
.global	LCD_Hd44780_BlinkOnOff
	.type	LCD_Hd44780_BlinkOnOff, @function
LCD_Hd44780_BlinkOnOff:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	or r24,r25
	breq .L103
	ldd r24,Z+11
	tst r24
	breq .L103
	ldd r24,Z+12
	tst r22
	breq .L105
	ori r24,lo8(1)
.L111:
	std Z+12,r24
	ldd r22,Z+12
	movw r24,r30
	jmp LCD_Hd44780_SendCommand
.L105:
	andi r24,lo8(-2)
	rjmp .L111
.L103:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_Hd44780_BlinkOnOff, .-LCD_Hd44780_BlinkOnOff
.global	LCD_Hd44780_ShiftDisplay
	.type	LCD_Hd44780_ShiftDisplay, @function
LCD_Hd44780_ShiftDisplay:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L112
	movw r30,r24
	ldd r18,Z+11
	tst r18
	breq .L112
	tst r22
	breq .L117
	ldi r22,lo8(28)
.L114:
	jmp LCD_Hd44780_SendCommand
.L117:
	ldi r22,lo8(24)
	rjmp .L114
.L112:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	LCD_Hd44780_ShiftDisplay, .-LCD_Hd44780_ShiftDisplay
.global	LCD_Hd44780_CreateCustomChar
	.type	LCD_Hd44780_CreateCustomChar, @function
LCD_Hd44780_CreateCustomChar:
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
	sbiw r24,0
	breq .L120
	movw r30,r24
	ldd r18,Z+11
	tst r18
	breq .L120
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	breq .L120
	cpi r22,lo8(8)
	brsh .L120
	movw r28,r20
	movw r16,r24
	lsl r22
	lsl r22
	lsl r22
	ori r22,lo8(64)
	call LCD_Hd44780_SendCommand
	movw r14,r28
	ldi r31,8
	add r14,r31
	adc r15,__zero_reg__
.L122:
	ld r22,Y+
	andi r22,lo8(31)
	movw r24,r16
	call LCD_Hd44780_WriteChar
	cp r28,r14
	cpc r29,r15
	brne .L122
	ldi r20,0
	ldi r22,0
	movw r24,r16
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	jmp LCD_Hd44780_SetCursor
.L120:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	LCD_Hd44780_CreateCustomChar, .-LCD_Hd44780_CreateCustomChar
	.ident	"GCC: (GNU) 7.3.0"
