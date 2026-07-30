	.file	"elevator_io.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	IO_DelayMs, @function
IO_DelayMs:
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
.L2:
	ldd r18,Y+3
	ldd r19,Y+4
	cp r18,r24
	cpc r19,r25
	brlo .L5
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
.L5:
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
.L3:
	ldd r18,Y+1
	ldd r19,Y+2
	cpi r18,64
	sbci r19,6
	brlo .L4
	ldd r18,Y+3
	ldd r19,Y+4
	subi r18,-1
	sbci r19,-1
	std Y+4,r19
	std Y+3,r18
	rjmp .L2
.L4:
	ldd r18,Y+1
	ldd r19,Y+2
	subi r18,-1
	sbci r19,-1
	std Y+2,r19
	std Y+1,r18
	rjmp .L3
	.size	IO_DelayMs, .-IO_DelayMs
	.type	IO_LcdPrintLine, @function
IO_LcdPrintLine:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	lds r25,g_lcdHandle+11
	tst r25
	breq .L6
	movw r28,r22
	mov r22,r24
	ldi r20,0
	ldi r24,lo8(g_lcdHandle)
	ldi r25,hi8(g_lcdHandle)
	call LCD_Hd44780_SetCursor
	or r24,r25
	brne .L6
	movw r22,r28
	ldi r24,lo8(g_lcdHandle)
	ldi r25,hi8(g_lcdHandle)
/* epilogue start */
	pop r29
	pop r28
	jmp LCD_Hd44780_WriteString
.L6:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	IO_LcdPrintLine, .-IO_LcdPrintLine
.global	IO_Init
	.type	IO_Init, @function
IO_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r20,lo8(1)
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinDirection
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinValue
	ldi r24,lo8(g_keypadConfig)
	ldi r25,hi8(g_keypadConfig)
	call Keypad_Init
	ldi r24,lo8(g_lcdHandle)
	ldi r25,hi8(g_lcdHandle)
	call LCD_Hd44780_Init
	or r24,r25
	brne .L11
	ldi r24,lo8(g_lcdHandle)
	ldi r25,hi8(g_lcdHandle)
	call LCD_Hd44780_Clear
	ldi r24,lo8(1)
	sts g_lcdHandle+11,r24
.L11:
	ldi r30,lo8(g_buttonEvents)
	ldi r31,hi8(g_buttonEvents)
.L12:
	st Z+,__zero_reg__
	ldi r24,hi8(g_buttonEvents+16)
	cpi r30,lo8(g_buttonEvents+16)
	cpc r31,r24
	brne .L12
/* epilogue start */
	ret
	.size	IO_Init, .-IO_Init
	.section	.rodata
.LC0:
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	48
	.byte	69
	.byte	70
	.text
.global	IO_Update
	.type	IO_Update, @function
IO_Update:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,17
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 17 */
/* stack size = 19 */
.L__stack_usage = 19
	movw r22,r28
	subi r22,-17
	sbci r23,-1
	ldi r24,lo8(g_keypadConfig)
	ldi r25,hi8(g_keypadConfig)
	call Keypad_GetKey
	or r24,r25
	brne .L14
	ldd r20,Y+17
	cpi r20,lo8(-1)
	breq .L14
	ldi r24,lo8(16)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r24,r28
	adiw r24,1
	ldi r30,0
.L16:
	ldi r19,0
	ldi r18,0
.L18:
	movw r26,r24
	add r26,r18
	adc r27,r19
	ld r22,X
	cpse r20,r22
	rjmp .L17
	lsl r30
	lsl r30
	add r30,r18
	ldi r31,0
	subi r30,lo8(-(g_buttonEvents))
	sbci r31,hi8(-(g_buttonEvents))
	ldi r24,lo8(1)
	st Z,r24
.L14:
/* epilogue start */
	adiw r28,17
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
.L17:
	subi r18,-1
	sbci r19,-1
	cpi r18,4
	cpc r19,__zero_reg__
	brne .L18
	subi r30,lo8(-(1))
	adiw r24,4
	cpi r30,lo8(4)
	brne .L16
	rjmp .L14
	.size	IO_Update, .-IO_Update
.global	IO_GetButtonEvent
	.type	IO_GetButtonEvent, @function
IO_GetButtonEvent:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,lo8(16)
	brsh .L29
	mov r30,r24
	ldi r31,0
	subi r30,lo8(-(g_buttonEvents))
	sbci r31,hi8(-(g_buttonEvents))
	ld r24,Z
	tst r24
	breq .L27
	st Z,__zero_reg__
	ldi r24,lo8(1)
	ret
.L29:
	ldi r24,0
.L27:
/* epilogue start */
	ret
	.size	IO_GetButtonEvent, .-IO_GetButtonEvent
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"SMART ELEVATOR"
.LC2:
	.string	"STATUS: READY"
	.text
.global	LCD_ShowStatus
	.type	LCD_ShowStatus, @function
LCD_ShowStatus:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,g_lcdHandle+11
	tst r24
	breq .L33
	ldi r24,lo8(g_lcdHandle)
	ldi r25,hi8(g_lcdHandle)
	call LCD_Hd44780_Clear
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	ldi r24,0
	call IO_LcdPrintLine
	ldi r22,lo8(.LC2)
	ldi r23,hi8(.LC2)
	ldi r24,lo8(1)
	jmp IO_LcdPrintLine
.L33:
/* epilogue start */
	ret
	.size	LCD_ShowStatus, .-LCD_ShowStatus
	.section	.rodata.str1.1
.LC3:
	.string	"*** FAULT ***"
.LC4:
	.string	"CHECK SYSTEM"
	.text
.global	LCD_ShowFault
	.type	LCD_ShowFault, @function
LCD_ShowFault:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,g_lcdHandle+11
	tst r24
	breq .L35
	ldi r24,lo8(g_lcdHandle)
	ldi r25,hi8(g_lcdHandle)
	call LCD_Hd44780_Clear
	ldi r22,lo8(.LC3)
	ldi r23,hi8(.LC3)
	ldi r24,0
	call IO_LcdPrintLine
	ldi r22,lo8(.LC4)
	ldi r23,hi8(.LC4)
	ldi r24,lo8(1)
	jmp IO_LcdPrintLine
.L35:
/* epilogue start */
	ret
	.size	LCD_ShowFault, .-LCD_ShowFault
.global	Gong_Play
	.type	Gong_Play, @function
Gong_Play:
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
	mov r28,r24
	ldi r20,lo8(1)
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinDirection
	ldi r16,lo8(-56)
	ldi r17,0
	ldi r24,lo8(44)
	mov r14,r24
	clr r15
	inc r15
	cpi r28,lo8(1)
	breq .L39
	ldi r16,lo8(100)
	ldi r17,0
	ldi r18,lo8(100)
	mov r14,r18
	mov r15,__zero_reg__
	cpi r28,lo8(2)
	breq .L39
	ldi r16,lo8(70)
	ldi r17,0
	ldi r25,lo8(70)
	mov r14,r25
	mov r15,__zero_reg__
	ldi r28,lo8(3)
.L39:
	ldi r29,0
.L41:
	ldi r20,lo8(1)
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinValue
	movw r24,r14
	call IO_DelayMs
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinValue
	movw r24,r16
	call IO_DelayMs
	subi r29,lo8(-(1))
	cpse r28,r29
	rjmp .L41
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	Gong_Play, .-Gong_Play
	.local	g_buttonEvents
	.comm	g_buttonEvents,16,1
	.data
	.type	g_keypadConfig, @object
	.size	g_keypadConfig, 20
g_keypadConfig:
	.byte	3
	.byte	0
	.byte	2
	.byte	0
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	48
	.byte	69
	.byte	70
	.type	g_lcdHandle, @object
	.size	g_lcdHandle, 16
g_lcdHandle:
	.word	0
	.byte	2
	.byte	4
	.byte	3
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
.global __do_clear_bss
