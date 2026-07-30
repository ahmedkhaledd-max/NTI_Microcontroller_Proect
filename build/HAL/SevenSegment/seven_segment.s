	.file	"seven_segment.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	SevenSeg_DisplayDigit
	.type	SevenSeg_DisplayDigit, @function
SevenSeg_DisplayDigit:
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r14,r24
	sbiw r24,0
	breq .L2
	cpi r22,lo8(10)
	brsh .L2
	movw r30,r24
	ldd r24,Z+2
	ldd r25,Z+3
	sbiw r24,0
	brne .L3
	mov r28,r22
	ldi r29,0
	subi r28,lo8(-(SevenSeg_DigitTable))
	sbci r29,hi8(-(SevenSeg_DigitTable))
	ld r22,Y
	ldi r25,lo8(7)
	mov r13,r25
.L4:
	movw r30,r14
	ld r24,Z
	ldd r25,Z+1
	sbiw r24,1
	brne .L5
	com r22
.L5:
	ldi r17,0
	ldi r16,0
	mov r28,r22
	ldi r29,0
.L6:
	movw r20,r28
	mov r0,r16
	rjmp 2f
	1:
	asr r21
	ror r20
	2:
	dec r0
	brpl 1b
	andi r20,lo8(1)
	movw r30,r14
	ldd r22,Z+5
	add r22,r16
	ldd r24,Z+4
	call GPIO_SetPinValue
	sbiw r24,0
	brne .L2
	subi r16,-1
	sbci r17,-1
	cp r16,r13
	brlo .L6
.L1:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	ret
.L3:
	sbiw r24,1
	brne .L2
	ldi r24,lo8(4)
	mov r13,r24
	rjmp .L4
.L2:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L1
	.size	SevenSeg_DisplayDigit, .-SevenSeg_DisplayDigit
.global	SevenSeg_Clear
	.type	SevenSeg_Clear, @function
SevenSeg_Clear:
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	movw r28,r24
	or r24,r25
	breq .L13
	ldd r24,Y+4
	cpi r24,lo8(4)
	brsh .L13
	ldd r24,Y+2
	ldd r25,Y+3
	sbiw r24,0
	breq .L18
	ldi r16,lo8(4)
	sbiw r24,1
	breq .L14
.L13:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L12
.L18:
	ldi r16,lo8(7)
.L14:
	ldd r24,Y+5
	cpi r24,lo8(8)
	brsh .L13
	add r24,r16
	clr r25
	rol r25
	sbiw r24,9
	brge .L13
	clr r15
	inc r15
	ld r24,Y
	ldd r25,Y+1
	or r24,r25
	brne .L15
	mov r15,__zero_reg__
.L15:
	ldi r17,0
.L16:
	ldd r22,Y+5
	add r22,r17
	mov r20,r15
	ldd r24,Y+4
	call GPIO_SetPinValue
	sbiw r24,0
	brne .L13
	subi r17,lo8(-(1))
	cpse r16,r17
	rjmp .L16
.L12:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	ret
	.size	SevenSeg_Clear, .-SevenSeg_Clear
.global	SevenSeg_Init
	.type	SevenSeg_Init, @function
SevenSeg_Init:
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
	brne .L24
.L26:
	ldi r24,lo8(1)
	ldi r25,0
.L23:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L24:
	ldd r24,Y+4
	cpi r24,lo8(4)
	brsh .L26
	ldd r24,Y+2
	ldd r25,Y+3
	sbiw r24,0
	breq .L30
	ldi r16,lo8(4)
	sbiw r24,1
	brne .L26
.L27:
	ldd r24,Y+5
	cpi r24,lo8(8)
	brsh .L26
	add r24,r16
	clr r25
	rol r25
	sbiw r24,9
	brge .L26
	ldi r17,0
.L28:
	ldd r22,Y+5
	add r22,r17
	ldi r20,lo8(1)
	ldd r24,Y+4
	call GPIO_SetPinDirection
	or r24,r25
	brne .L26
	subi r17,lo8(-(1))
	cpse r16,r17
	rjmp .L28
	movw r24,r28
	call SevenSeg_Clear
	ldi r19,lo8(1)
	ldi r18,0
	or r24,r25
	brne .L29
	ldi r19,0
.L29:
	mov r24,r19
	mov r25,r18
	rjmp .L23
.L30:
	ldi r16,lo8(7)
	rjmp .L27
	.size	SevenSeg_Init, .-SevenSeg_Init
.global	SevenSeg_EnableDigit
	.type	SevenSeg_EnableDigit, @function
SevenSeg_EnableDigit:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,lo8(4)
	brsh .L37
	cpi r22,lo8(8)
	brsh .L37
	ldi r25,lo8(1)
	cpi r20,1
	cpc r21,__zero_reg__
	breq .L34
	ldi r25,0
.L34:
	mov r20,r25
	call GPIO_SetPinValue
	ldi r19,lo8(1)
	ldi r18,0
	or r24,r25
	brne .L35
	ldi r19,0
.L35:
	mov r24,r19
	mov r25,r18
	ret
.L37:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	SevenSeg_EnableDigit, .-SevenSeg_EnableDigit
.global	SevenSeg_DisableDigit
	.type	SevenSeg_DisableDigit, @function
SevenSeg_DisableDigit:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	cpi r24,lo8(4)
	brsh .L46
	cpi r22,lo8(8)
	brsh .L46
	ldi r25,lo8(1)
	cpi r20,1
	cpc r21,__zero_reg__
	brne .L43
	ldi r25,0
.L43:
	mov r20,r25
	call GPIO_SetPinValue
	ldi r19,lo8(1)
	ldi r18,0
	or r24,r25
	brne .L44
	ldi r19,0
.L44:
	mov r24,r19
	mov r25,r18
	ret
.L46:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	SevenSeg_DisableDigit, .-SevenSeg_DisableDigit
	.section	.rodata
	.type	SevenSeg_DigitTable, @object
	.size	SevenSeg_DigitTable, 10
SevenSeg_DigitTable:
	.byte	63
	.byte	6
	.byte	91
	.byte	79
	.byte	102
	.byte	109
	.byte	125
	.byte	7
	.byte	127
	.byte	111
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
