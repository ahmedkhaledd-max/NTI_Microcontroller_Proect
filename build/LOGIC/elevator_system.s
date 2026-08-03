	.file	"elevator_system.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Elevator Ready"
	.text
.global	System_Init
	.type	System_Init, @function
System_Init:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	call Dispatch_Init
	call Safety_Init
	call Motion_Init
	sts system_fault_counter,__zero_reg__
	sts forced_dir+1,__zero_reg__
	sts forced_dir,__zero_reg__
	sts is_moving,__zero_reg__
	sts target_floor_num,__zero_reg__
	call LCD_Init
	call LCD_Clear
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	call LCD_SetCursor
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	call LCD_WriteString
	sts last_display_state+1,__zero_reg__
	sts last_display_state,__zero_reg__
/* epilogue start */
	ret
	.size	System_Init, .-System_Init
	.section	.rodata.str1.1
.LC1:
	.string	"!! WARNING !!"
.LC2:
	.string	"OVERLOADED!"
.LC3:
	.string	"Going UP to:"
.LC4:
	.string	"Floor "
.LC5:
	.string	"Going DOWN to:"
.LC6:
	.string	"Elevator Idle"
	.text
.global	System_Update
	.type	System_Update, @function
System_Update:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	call Elevator_GetCurPosition
	mov r28,r24
	call IO_Update
	ldi r24,lo8(4)
	call IO_GetButtonEvent
	tst r24
	brne .+2
	rjmp .L3
	ldi r24,lo8(1)
	ldi r25,0
	sts forced_dir+1,r25
	sts forced_dir,r24
	sts is_moving,r24
	sts target_floor_num,__zero_reg__
.L4:
	ldi r22,lo8(6)
	ldi r24,lo8(1)
	call GPIO_GetPinStatus
	or r24,r25
	breq .+2
	rjmp .L17
	ldi r20,lo8(1)
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	ldi r22,lo8(4)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	lds r24,last_display_state
	lds r25,last_display_state+1
	sbiw r24,3
	breq .L19
	call LCD_Clear
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	call LCD_SetCursor
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	call LCD_WriteString
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(1)
	ldi r25,0
	call LCD_SetCursor
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	call LCD_WriteString
	ldi r24,lo8(3)
	ldi r25,0
	sts last_display_state+1,r25
	sts last_display_state,r24
.L19:
	ldi r22,lo8(7)
	ldi r24,lo8(1)
	call GPIO_GetPinStatus
	or r24,r25
	breq .+2
	rjmp .L23
	ldi r20,0
	ldi r22,lo8(6)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,0
	call GPIO_SetPinValue
.L24:
	ldi r22,lo8(5)
	ldi r24,lo8(2)
	call GPIO_GetPinStatus
	or r24,r25
	brne .L26
	sts is_moving,__zero_reg__
	sts forced_dir+1,__zero_reg__
	sts forced_dir,__zero_reg__
	call Elevator_StopMotion
	ldi r20,0
	ldi r22,lo8(6)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
.L26:
/* epilogue start */
	pop r29
	pop r28
	jmp Motion_Update
.L3:
	ldi r24,lo8(5)
	call IO_GetButtonEvent
	tst r24
	breq .L5
	ldi r24,lo8(1)
	ldi r25,0
	sts forced_dir+1,r25
	sts forced_dir,r24
.L46:
	sts is_moving,r24
	rjmp .L42
.L5:
	ldi r24,lo8(7)
	call IO_GetButtonEvent
	tst r24
	breq .L6
	ldi r24,lo8(1)
	ldi r25,0
	sts forced_dir+1,r25
	sts forced_dir,r24
.L43:
	sts is_moving,r24
	ldi r24,lo8(2)
.L42:
	sts target_floor_num,r24
	rjmp .L4
.L6:
	ldi r24,lo8(6)
	call IO_GetButtonEvent
	tst r24
	breq .L7
	ldi r24,lo8(2)
	ldi r25,0
	sts forced_dir+1,r25
	sts forced_dir,r24
	ldi r24,lo8(1)
	rjmp .L46
.L7:
	ldi r24,lo8(8)
	call IO_GetButtonEvent
	tst r24
	breq .L8
	ldi r24,lo8(2)
	ldi r25,0
	sts forced_dir+1,r25
	sts forced_dir,r24
	ldi r24,lo8(1)
	rjmp .L43
.L8:
	ldi r24,lo8(9)
	call IO_GetButtonEvent
	tst r24
	breq .L9
	ldi r24,lo8(2)
	ldi r25,0
	sts forced_dir+1,r25
	sts forced_dir,r24
	ldi r24,lo8(1)
	sts is_moving,r24
	ldi r24,lo8(3)
	rjmp .L42
.L9:
	ldi r24,0
	call IO_GetButtonEvent
	tst r24
	breq .L10
	sts target_floor_num,__zero_reg__
	tst r28
	brne .+2
	rjmp .L4
.L11:
	ldi r24,lo8(2)
	ldi r25,0
	sts forced_dir+1,r25
	sts forced_dir,r24
	ldi r24,lo8(1)
.L44:
	sts is_moving,r24
	rjmp .L4
.L10:
	ldi r24,lo8(1)
	call IO_GetButtonEvent
	tst r24
	breq .L12
	ldi r24,lo8(1)
	sts target_floor_num,r24
	cpse r28,__zero_reg__
	rjmp .L13
.L16:
	ldi r24,lo8(1)
	ldi r25,0
	sts forced_dir+1,r25
	sts forced_dir,r24
	rjmp .L44
.L13:
	cpi r28,lo8(2)
	brsh .L11
	rjmp .L4
.L12:
	ldi r24,lo8(2)
	call IO_GetButtonEvent
	tst r24
	breq .L15
	ldi r24,lo8(2)
	sts target_floor_num,r24
	cpi r28,lo8(2)
	brlo .L16
	cpi r28,lo8(2)
	brne .L11
	rjmp .L4
.L15:
	ldi r24,lo8(3)
	call IO_GetButtonEvent
	tst r24
	brne .+2
	rjmp .L4
	ldi r24,lo8(3)
	sts target_floor_num,r24
	cpi r28,lo8(3)
	brlo .L16
	rjmp .L4
.L17:
	ldi r20,0
	ldi r22,lo8(7)
	ldi r24,lo8(3)
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	lds r24,is_moving
	tst r24
	brne .+2
	rjmp .L20
	lds r28,forced_dir
	lds r29,forced_dir+1
	cpi r28,1
	cpc r29,__zero_reg__
	brne .L21
	ldi r20,lo8(1)
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(5)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	lds r24,last_display_state
	lds r25,last_display_state+1
	sbiw r24,1
	brne .+2
	rjmp .L19
	call LCD_Clear
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	call LCD_SetCursor
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
.L45:
	call LCD_WriteString
	ldi r23,0
	ldi r22,0
	ldi r24,lo8(1)
	ldi r25,0
	call LCD_SetCursor
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	call LCD_WriteString
	lds r24,target_floor_num
	ldi r25,0
	adiw r24,48
	call LCD_WriteChar
	sts last_display_state+1,r29
	sts last_display_state,r28
	rjmp .L19
.L21:
	cpi r28,2
	cpc r29,__zero_reg__
	breq .+2
	rjmp .L19
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	ldi r22,lo8(5)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,lo8(1)
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	lds r24,last_display_state
	lds r25,last_display_state+1
	sbiw r24,2
	brne .+2
	rjmp .L19
	call LCD_Clear
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	call LCD_SetCursor
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	rjmp .L45
.L20:
	ldi r20,0
	ldi r22,lo8(4)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(5)
	ldi r24,0
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(2)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	ldi r20,0
	ldi r22,lo8(3)
	ldi r24,lo8(2)
	call GPIO_SetPinValue
	lds r24,last_display_state
	lds r25,last_display_state+1
	or r24,r25
	brne .+2
	rjmp .L19
	call LCD_Clear
	ldi r23,0
	ldi r22,0
	ldi r25,0
	ldi r24,0
	call LCD_SetCursor
	ldi r24,lo8(.LC6)
	ldi r25,hi8(.LC6)
	call LCD_WriteString
	sts last_display_state+1,__zero_reg__
	sts last_display_state,__zero_reg__
	rjmp .L19
.L23:
	ldi r24,lo8(10)
	call IO_GetButtonEvent
	tst r24
	breq .L25
	call Elevator_OpenDoor
	rjmp .L24
.L25:
	ldi r24,lo8(11)
	call IO_GetButtonEvent
	tst r24
	brne .+2
	rjmp .L24
	call Elevator_CloseDoor
	rjmp .L24
	.size	System_Update, .-System_Update
.global	LogFault
	.type	LogFault, @function
LogFault:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	tst r24
	breq .L47
	lds r25,system_fault_counter
	subi r25,lo8(-(1))
	sts system_fault_counter,r25
	jmp Fault_Set
.L47:
/* epilogue start */
	ret
	.size	LogFault, .-LogFault
	.local	last_display_state
	.comm	last_display_state,2,1
	.local	target_floor_num
	.comm	target_floor_num,1,1
	.local	is_moving
	.comm	is_moving,1,1
	.local	forced_dir
	.comm	forced_dir,2,1
	.local	system_fault_counter
	.comm	system_fault_counter,1,1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
.global __do_clear_bss
