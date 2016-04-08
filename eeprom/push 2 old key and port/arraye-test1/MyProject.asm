
_Lcd_0:

;MyProject.mbas,25 :: 		sub procedure Lcd_0()
;MyProject.mbas,26 :: 		Lcd_Init()
	PUSH       R2
	CALL       _Lcd_Init+0
;MyProject.mbas,27 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,30 :: 		end sub
L_end_Lcd_0:
	POP        R2
	RET
; end of _Lcd_0

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 7
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,31 :: 		main:
;MyProject.mbas,45 :: 		while True
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
L__main3:
;MyProject.mbas,68 :: 		Lcd_Out(1,1,"offfff")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,69 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__main7:
	DEC        R16
	BRNE       L__main7
	DEC        R17
	BRNE       L__main7
	DEC        R18
	BRNE       L__main7
;MyProject.mbas,77 :: 		wend
	JMP        L__main3
L_end_main:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
