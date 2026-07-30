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
	.section	.rodata
.LC0:
	.byte	-128
	.byte	37
	.byte	0
	.byte	0
	.word	3
	.word	0
	.word	0
	.text
.global	IO_Init
	.type	IO_Init, @function
IO_Init:
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
	sbiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 10 */
/* stack size = 20 */
.L__stack_usage = 20
	ldi r20,0
	ldi r22,0
	ldi r24,lo8(3)
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldi r22,lo8(1)
	ldi r24,lo8(3)
	call GPIO_SetPinDirection
	ldi r24,lo8(10)
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
	call UART_Init
	ldi r20,lo8(1)
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinDirection
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldi r22,lo8(4)
	ldi r24,lo8(2)
	call GPIO_SetPinDirection
	ldi r20,0
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldi r22,lo8(5)
	ldi r24,0
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldi r22,lo8(6)
	ldi r24,0
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	ldi r22,lo8(7)
	ldi r24,0
	call GPIO_SetPinDirection
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(5)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(6)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r16,lo8(g_inputPins)
	ldi r17,hi8(g_inputPins)
	ldi r24,lo8(g_buttonEvents)
	mov r12,r24
	ldi r24,hi8(g_buttonEvents)
	mov r13,r24
	ldi r25,lo8(g_lastButtonState)
	mov r14,r25
	ldi r25,hi8(g_lastButtonState)
	mov r15,r25
.L7:
	movw r30,r16
	ldd r10,Z+1
	ld r11,Z
	ldi r20,0
	mov r22,r10
	mov r24,r11
	call GPIO_SetPinDirection
	ldi r20,lo8(1)
	mov r22,r10
	mov r24,r11
	call GPIO_SetPinValue
	movw r30,r12
	st Z+,__zero_reg__
	movw r12,r30
	ldi r24,lo8(1)
	movw r30,r14
	st Z+,r24
	movw r14,r30
	subi r16,-2
	sbci r17,-1
	ldi r31,hi8(g_inputPins+30)
	cpi r16,lo8(g_inputPins+30)
	cpc r17,r31
	brne .L7
	ldi r24,lo8(g_lcdHandle)
	ldi r25,hi8(g_lcdHandle)
	call LCD_Aip31068_Init
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
	pop r10
	ret
	.size	IO_Init, .-IO_Init
.global	IO_Update
	.type	IO_Update, @function
IO_Update:
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
	ldi r16,lo8(g_inputPins)
	ldi r17,hi8(g_inputPins)
	ldi r24,lo8(g_lastButtonState)
	mov r14,r24
	ldi r24,hi8(g_lastButtonState)
	mov r15,r24
	ldi r29,0
	ldi r28,0
.L11:
	movw r30,r16
	ldd r22,Z+1
	ld r24,Z
	call GPIO_GetPinStatus
	movw r30,r14
	ld r25,Z
	cpi r25,lo8(1)
	brne .L10
	cpse r24,__zero_reg__
	rjmp .L10
	movw r30,r28
	subi r30,lo8(-(g_buttonEvents))
	sbci r31,hi8(-(g_buttonEvents))
	st Z,r25
.L10:
	movw r30,r14
	st Z+,r24
	movw r14,r30
	adiw r28,1
	subi r16,-2
	sbci r17,-1
	cpi r28,15
	cpc r29,__zero_reg__
	brne .L11
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	IO_Update, .-IO_Update
.global	IO_GetButtonEvent
	.type	IO_GetButtonEvent, @function
IO_GetButtonEvent:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,lo8(15)
	brsh .L15
	mov r30,r24
	ldi r31,0
	subi r30,lo8(-(g_buttonEvents))
	sbci r31,hi8(-(g_buttonEvents))
	ld r24,Z
	tst r24
	breq .L13
	st Z,__zero_reg__
	ldi r24,lo8(1)
	ret
.L15:
	ldi r24,0
.L13:
/* epilogue start */
	ret
	.size	IO_GetButtonEvent, .-IO_GetButtonEvent
.global	Serial_SendString
	.type	Serial_SendString, @function
Serial_SendString:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp UART_SendString
	.size	Serial_SendString, .-Serial_SendString
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
	ldi r16,lo8(-56)
	ldi r17,0
	ldi r24,lo8(44)
	mov r14,r24
	clr r15
	inc r15
	cpi r28,lo8(1)
	breq .L22
	ldi r16,lo8(100)
	ldi r17,0
	ldi r18,lo8(100)
	mov r14,r18
	mov r15,__zero_reg__
	cpi r28,lo8(2)
	breq .L22
	ldi r16,lo8(70)
	ldi r17,0
	ldi r25,lo8(70)
	mov r14,r25
	mov r15,__zero_reg__
	ldi r28,lo8(3)
.L22:
	ldi r29,0
.L24:
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
	rjmp .L24
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	Gong_Play, .-Gong_Play
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"STATUS: System Ready\r\n"
	.text
.global	LCD_ShowStatus
	.type	LCD_ShowStatus, @function
LCD_ShowStatus:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	jmp UART_SendString
	.size	LCD_ShowStatus, .-LCD_ShowStatus
	.section	.rodata.str1.1
.LC2:
	.string	"FAULT: EMERGENCY FAULT!\r\n"
	.text
.global	LCD_ShowFault
	.type	LCD_ShowFault, @function
LCD_ShowFault:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	jmp UART_SendString
	.size	LCD_ShowFault, .-LCD_ShowFault
	.section	.rodata
	.type	g_inputPins, @object
	.size	g_inputPins, 30
g_inputPins:
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	5
	.byte	3
	.byte	6
	.byte	2
	.byte	6
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	3
	.byte	1
	.byte	4
	.byte	1
	.byte	5
	.byte	1
	.byte	6
	.byte	1
	.byte	7
	.byte	2
	.byte	5
	.data
	.type	g_lcdHandle, @object
	.size	g_lcdHandle, 8
g_lcdHandle:
	.byte	39
	.zero	7
	.local	g_lastButtonState
	.comm	g_lastButtonState,15,1
	.local	g_buttonEvents
	.comm	g_buttonEvents,15,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
.global __do_clear_bss
