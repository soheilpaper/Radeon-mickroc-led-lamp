
_temprature:

;MyProject.mbas,127 :: 		sub  procedure  temprature()
;MyProject.mbas,128 :: 		Radc= ADC_Get_Sample(0)      '// Obtenemos lectura del AN0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	CLR        R2
	CALL       _ADC_Get_Sample+0
	STS        _Radc+0, R16
	STS        _Radc+1, R17
;MyProject.mbas,129 :: 		Delay_ms(600)                '// Este retardo ayuda a de manera burda a
	LDI        R18, 4
	LDI        R17, 12
	LDI        R16, 52
L__temprature1:
	DEC        R16
	BRNE       L__temprature1
	DEC        R17
	BRNE       L__temprature1
	DEC        R18
	BRNE       L__temprature1
	NOP
	NOP
;MyProject.mbas,133 :: 		Tem = float(Radc * 0.488-5.3)  '(float)(Radc * 0.488)   '// Obtenemos el valor Real de la Conversion A/D
	LDS        R16, _Radc+0
	LDS        R17, _Radc+1
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	CALL       _float_slong2fp+0
	LDI        R20, 35
	LDI        R21, 219
	LDI        R22, 249
	LDI        R23, 62
	CALL       _float_fpmul1+0
	LDI        R20, 154
	LDI        R21, 153
	LDI        R22, 169
	LDI        R23, 64
	CALL       _float_fpsub1+0
	STS        _Tem+0, R16
	STS        _Tem+1, R17
	STS        _Tem+2, R18
	STS        _Tem+3, R19
;MyProject.mbas,136 :: 		FloatToStr(Tem, txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R7, R27
	MOV        R5, R19
	MOV        R4, R18
	MOV        R3, R17
	MOV        R2, R16
	CALL       _FloatToStr+0
;MyProject.mbas,137 :: 		Lcd_Out(2,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,139 :: 		delay_ms(100)
	LDI        R17, 130
	LDI        R16, 222
L__temprature3:
	DEC        R16
	BRNE       L__temprature3
	DEC        R17
	BRNE       L__temprature3
	NOP
;MyProject.mbas,140 :: 		end sub
L_end_temprature:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _temprature

_Lcd_0:

;MyProject.mbas,144 :: 		sub procedure Lcd_0()
;MyProject.mbas,145 :: 		Lcd_Init()
	PUSH       R2
	CALL       _Lcd_Init+0
;MyProject.mbas,146 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,147 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,149 :: 		end sub
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
	SBIW       R28, 11
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,151 :: 		main:
;MyProject.mbas,152 :: 		Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_0+0
;MyProject.mbas,155 :: 		Lcd_Out(1,1, "Tempratore")'       // Mandamos nuestro mensaje al LCD
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
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
;MyProject.mbas,156 :: 		Lcd_Chr(2,9,223)'         // Display symbol "°" (grado)
	LDI        R27, 223
	MOV        R4, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,157 :: 		Lcd_Chr(2,10,"C")
	LDI        R27, 67
	MOV        R4, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,159 :: 		ADC_Init()            '  // Inicializa el Modulo ADC
	CALL       _ADC_Init+0
;MyProject.mbas,160 :: 		Delay_us(100)
	LDI        R16, 33
L__main7:
	DEC        R16
	BRNE       L__main7
	NOP
;MyProject.mbas,163 :: 		while TRUE
L__main10:
;MyProject.mbas,164 :: 		temprature()
	CALL       _temprature+0
;MyProject.mbas,165 :: 		delay_ms(200)
	LDI        R18, 2
	LDI        R17, 4
	LDI        R16, 187
L__main14:
	DEC        R16
	BRNE       L__main14
	DEC        R17
	BRNE       L__main14
	DEC        R18
	BRNE       L__main14
	NOP
;MyProject.mbas,167 :: 		wend                                                ' endless loop
	JMP        L__main10
L_end_main:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
