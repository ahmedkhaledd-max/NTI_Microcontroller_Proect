	.file	"i2c.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	I2C_InitMaster
	.type	I2C_InitMaster, @function
I2C_InitMaster:
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
	or r24,r25
	brne .+2
	rjmp .L6
	ld r18,Y
	ldd r19,Y+1
	ldd r20,Y+2
	ldd r21,Y+3
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	cpc r20,__zero_reg__
	cpc r21,__zero_reg__
	breq .L6
	mov r12,__zero_reg__
	ldi r22,lo8(18)
	mov r13,r22
	ldi r22,lo8(122)
	mov r14,r22
	mov r15,__zero_reg__
	movw r24,r14
	movw r22,r12
	call __udivmodsi4
	cpi r18,17
	cpc r19,__zero_reg__
	cpc r20,__zero_reg__
	cpc r21,__zero_reg__
	brlo .L6
	cbi 0x1,0
	cbi 0x1,1
	ld r18,Y
	ldd r19,Y+1
	ldd r20,Y+2
	ldd r21,Y+3
	movw r24,r14
	movw r22,r12
	call __udivmodsi4
	movw r26,r20
	movw r24,r18
	sbiw r24,16
	sbc r26,__zero_reg__
	sbc r27,__zero_reg__
	lsr r27
	ror r26
	ror r25
	ror r24
	cpi r24,-1
	cpc r25,__zero_reg__
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	breq .L3
	brlo .L3
	ldi r24,lo8(-1)
	ldi r25,0
	ldi r26,0
	ldi r27,0
.L3:
	out 0,r24
	in r24,0x36
	ori r24,lo8(4)
	out 0x36,r24
	ldi r25,0
	ldi r24,0
.L1:
/* epilogue start */
	pop r29
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
	ret
.L6:
	ldi r24,lo8(1)
	ldi r25,0
	rjmp .L1
	.size	I2C_InitMaster, .-I2C_InitMaster
.global	I2C_InitSlave
	.type	I2C_InitSlave, @function
I2C_InitSlave:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	breq .L10
	movw r30,r24
	ld r18,Z
	lsl r18
	out 0x2,r18
	ldd r24,Z+1
	cpse r24,__zero_reg__
	sbi 0x2,0
.L9:
	ldi r24,lo8(-60)
	out 0x36,r24
	ldi r25,0
	ldi r24,0
	ret
.L10:
	ldi r24,lo8(1)
	ldi r25,0
/* epilogue start */
	ret
	.size	I2C_InitSlave, .-I2C_InitSlave
.global	I2C_DeInit
	.type	I2C_DeInit, @function
I2C_DeInit:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,0x36
	andi r24,lo8(-5)
	out 0x36,r24
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	I2C_DeInit, .-I2C_DeInit
.global	I2C_Start
	.type	I2C_Start, @function
I2C_Start:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(-92)
	out 0x36,r24
.L16:
	in __tmp_reg__,0x36
	sbrs __tmp_reg__,7
	rjmp .L16
	in r18,0x1
	andi r18,lo8(-8)
	cpi r18,lo8(8)
	breq .L19
	ldi r24,lo8(1)
	ldi r25,0
	cpi r18,lo8(16)
	brne .L15
	ldi r24,0
	ret
.L19:
	ldi r24,0
	ldi r25,0
.L15:
/* epilogue start */
	ret
	.size	I2C_Start, .-I2C_Start
.global	I2C_Stop
	.type	I2C_Stop, @function
I2C_Stop:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(-108)
	out 0x36,r24
.L23:
	in __tmp_reg__,0x36
	sbrc __tmp_reg__,4
	rjmp .L23
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	I2C_Stop, .-I2C_Stop
.global	I2C_WriteByte
	.type	I2C_WriteByte, @function
I2C_WriteByte:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0x3,r24
	ldi r24,lo8(-124)
	out 0x36,r24
.L26:
	in __tmp_reg__,0x36
	sbrs __tmp_reg__,7
	rjmp .L26
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	I2C_WriteByte, .-I2C_WriteByte
	.ident	"GCC: (GNU) 7.3.0"
