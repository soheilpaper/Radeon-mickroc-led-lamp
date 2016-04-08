
_Lcd_0:

;MyProject.mbas,47 :: 		sub procedure Lcd_0()
;MyProject.mbas,48 :: 		Lcd_Init()
	PUSH       R2
	CALL       _Lcd_Init+0
;MyProject.mbas,49 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,52 :: 		end sub
L_end_Lcd_0:
	POP        R2
	RET
; end of _Lcd_0

_on_off_initial:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 4
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,55 :: 		sub procedure on_off_initial (dim on_off22,en,hr,mint,prc as integer)
	LDD        R16, Y+8
	LDD        R17, Y+9
	STD        Y+8, R16
	STD        Y+9, R17
;MyProject.mbas,58 :: 		for week =1 to 7
	LDI        R27, 1
	STS        _week+0, R27
L__on_off_initial3:
;MyProject.mbas,59 :: 		for Pwm_chanel=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
L__on_off_initial8:
;MyProject.mbas,60 :: 		for chanel =1 to 3
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__on_off_initial13:
;MyProject.mbas,61 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][0] =en
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	ST         Z+, R4
	ST         Z+, R5
;MyProject.mbas,62 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][1]=hr
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 2
	ST         Z+, R6
	ST         Z+, R7
;MyProject.mbas,63 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][2] =mint
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 4
	ST         Z+, R8
	ST         Z+, R9
;MyProject.mbas,64 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][3]=prc
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 6
	LDD        R16, Y+8
	LDD        R17, Y+9
	ST         Z+, R16
	ST         Z+, R17
;MyProject.mbas,67 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__on_off_initial206
	CPI        R16, 3
L__on_off_initial206:
	BRNE       L__on_off_initial207
	JMP        L__on_off_initial16
L__on_off_initial207:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__on_off_initial13
L__on_off_initial16:
;MyProject.mbas,68 :: 		next pwm_chanel
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	CPI        R17, 0
	BRNE       L__on_off_initial208
	CPI        R16, 7
L__on_off_initial208:
	BRNE       L__on_off_initial209
	JMP        L__on_off_initial11
L__on_off_initial209:
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__on_off_initial8
L__on_off_initial11:
;MyProject.mbas,69 :: 		next week
	LDS        R16, _week+0
	CPI        R16, 7
	BRNE       L__on_off_initial210
	JMP        L__on_off_initial6
L__on_off_initial210:
	LDS        R16, _week+0
	SUBI       R16, 255
	STS        _week+0, R16
	JMP        L__on_off_initial3
L__on_off_initial6:
;MyProject.mbas,71 :: 		end sub
L_end_on_off_initial:
	ADIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _on_off_initial

_Write_EEprom:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,80 :: 		error as byte
;MyProject.mbas,82 :: 		hi_=hi(address)
	STD        Y+0, R4
;MyProject.mbas,83 :: 		lo_=lo(address)
	STD        Y+1, R3
;MyProject.mbas,84 :: 		Soft_I2C_Start()                         ' issue start signal
	PUSH       R2
	CALL       _Soft_I2C_Start+0
;MyProject.mbas,85 :: 		Soft_I2C_Write(write_address_bus)                 ' address 160
	LDI        R27, 160
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,86 :: 		Soft_I2C_Write(hi_)                        ' start from word at address (REG0)
	LDD        R2, Y+0
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,87 :: 		Soft_I2C_Write(lo_)                     ' write $80 to REG0. (pause counter + 0 sec)   ?? ??????? ????? ????? ?????
	LDD        R2, Y+1
	CALL       _Soft_I2C_Write+0
	POP        R2
;MyProject.mbas,89 :: 		error=Soft_I2C_Write(data1)                ' write 0 to minutes word to (REG1)
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,99 :: 		Soft_I2C_Stop()                          ' issue stop signal
	CALL       _Soft_I2C_Stop+0
;MyProject.mbas,100 :: 		delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Write_EEprom18:
	DEC        R16
	BRNE       L__Write_EEprom18
	DEC        R17
	BRNE       L__Write_EEprom18
	DEC        R18
	BRNE       L__Write_EEprom18
;MyProject.mbas,101 :: 		end sub
L_end_Write_EEprom:
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Write_EEprom

_Read_EEprom:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,108 :: 		dim  device_address as char
;MyProject.mbas,110 :: 		Soft_I2C_Start()                    ' Issue start signal
	PUSH       R2
	PUSH       R3
	PUSH       R3
	PUSH       R2
	CALL       _Soft_I2C_Start+0
;MyProject.mbas,111 :: 		Soft_I2C_Write(write_address_bus)            ' Address DS1307, see 160 datasheet
	LDI        R27, 160
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
	POP        R2
	POP        R3
;MyProject.mbas,114 :: 		lo_=lo(address_1)
	STD        Y+0, R2
;MyProject.mbas,115 :: 		Soft_I2C_Write(hi_)                   ' Start from address 0
	MOV        R2, R3
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,116 :: 		Soft_I2C_Write(lo_)                   ' Start from address 0
	LDD        R2, Y+0
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,117 :: 		Soft_I2C_Start()                    ' Issue repeated start signal
	CALL       _Soft_I2C_Start+0
;MyProject.mbas,118 :: 		Soft_I2C_Write(read_address_bus)        ' Address 161 for reading R/W=1
	LDI        R27, 161
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,120 :: 		EEprom_data_read = Soft_I2C_Read(0)      ' Read seconds byte
	CLR        R2
	CLR        R3
	CALL       _Soft_I2C_Read+0
	STS        _EEprom_data_read+0, R16
;MyProject.mbas,123 :: 		Soft_I2C_Stop()   ' Issue stop signal
	CALL       _Soft_I2C_Stop+0
;MyProject.mbas,124 :: 		end sub
L_end_Read_EEprom:
	POP        R3
	POP        R2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Read_EEprom

_eeprom_save_ext:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 5
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,129 :: 		dim on_off22 as integer
;MyProject.mbas,134 :: 		counter_ex=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	LDI        R27, 0
	STS        _counter_ex+0, R27
	STS        _counter_ex+1, R27
;MyProject.mbas,135 :: 		for week =2 to 2
	LDI        R27, 2
	STS        _week+0, R27
L__eeprom_save_ext23:
;MyProject.mbas,136 :: 		for Pwm_chanel=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
L__eeprom_save_ext28:
;MyProject.mbas,137 :: 		for chanel =1 to 4
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__eeprom_save_ext33:
;MyProject.mbas,138 :: 		for on_off22=1 to 2
	LDI        R27, 1
	STD        Y+0, R27
	LDI        R27, 0
	STD        Y+1, R27
L__eeprom_save_ext38:
;MyProject.mbas,141 :: 		Write_EEprom(0x01 + counter_ex,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][0] )
	LDS        R16, _counter_ex+0
	SUBI       R16, 255
	STD        Y+4, R16
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R17, Z+
	LD         R18, Z+
	LDD        R16, Y+4
	MOV        R3, R17
	MOV        R4, R18
	MOV        R2, R16
	CALL       _Write_EEprom+0
;MyProject.mbas,142 :: 		Write_EEprom(0x01 + counter_ex+1,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][1] )
	LDS        R16, _counter_ex+0
	SUBI       R16, 255
	SUBI       R16, 255
	STD        Y+4, R16
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z+
	LD         R18, Z+
	LDD        R16, Y+4
	MOV        R3, R17
	MOV        R4, R18
	MOV        R2, R16
	CALL       _Write_EEprom+0
;MyProject.mbas,143 :: 		Write_EEprom(0x01 + counter_ex+2,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][2] )
	LDS        R16, _counter_ex+0
	SUBI       R16, 255
	SUBI       R16, 254
	STD        Y+4, R16
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 4
	LD         R17, Z+
	LD         R18, Z+
	LDD        R16, Y+4
	MOV        R3, R17
	MOV        R4, R18
	MOV        R2, R16
	CALL       _Write_EEprom+0
;MyProject.mbas,144 :: 		Write_EEprom(0x01 + counter_ex+3,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][3] )
	LDS        R16, _counter_ex+0
	SUBI       R16, 255
	SUBI       R16, 253
	STD        Y+4, R16
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 6
	LD         R17, Z+
	LD         R18, Z+
	LDD        R16, Y+4
	MOV        R3, R17
	MOV        R4, R18
	MOV        R2, R16
	CALL       _Write_EEprom+0
;MyProject.mbas,145 :: 		counter_ex=counter_ex+4
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 252
	SBCI       R17, 255
	STS        _counter_ex+0, R16
	STS        _counter_ex+1, R17
;MyProject.mbas,147 :: 		next on_off22
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__eeprom_save_ext214
	CPI        R16, 2
L__eeprom_save_ext214:
	BRNE       L__eeprom_save_ext215
	JMP        L__eeprom_save_ext41
L__eeprom_save_ext215:
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
	JMP        L__eeprom_save_ext38
L__eeprom_save_ext41:
;MyProject.mbas,148 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_save_ext216
	CPI        R16, 4
L__eeprom_save_ext216:
	BRNE       L__eeprom_save_ext217
	JMP        L__eeprom_save_ext36
L__eeprom_save_ext217:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__eeprom_save_ext33
L__eeprom_save_ext36:
;MyProject.mbas,149 :: 		next pwm_chanel
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_save_ext218
	CPI        R16, 7
L__eeprom_save_ext218:
	BRNE       L__eeprom_save_ext219
	JMP        L__eeprom_save_ext31
L__eeprom_save_ext219:
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__eeprom_save_ext28
L__eeprom_save_ext31:
;MyProject.mbas,150 :: 		next week
	LDS        R16, _week+0
	CPI        R16, 2
	BRNE       L__eeprom_save_ext220
	JMP        L__eeprom_save_ext26
L__eeprom_save_ext220:
	LDS        R16, _week+0
	SUBI       R16, 255
	STS        _week+0, R16
	JMP        L__eeprom_save_ext23
L__eeprom_save_ext26:
;MyProject.mbas,155 :: 		end sub
L_end_eeprom_save_ext:
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 4
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_save_ext

_eeprom_call_back_ext:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 4
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,160 :: 		dim on_off22 as integer
;MyProject.mbas,165 :: 		counter_ex=0
	PUSH       R2
	PUSH       R3
	LDI        R27, 0
	STS        _counter_ex+0, R27
	STS        _counter_ex+1, R27
;MyProject.mbas,166 :: 		for week =2 to 2
	LDI        R27, 2
	STS        _week+0, R27
L__eeprom_call_back_ext44:
;MyProject.mbas,167 :: 		for Pwm_chanel=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
L__eeprom_call_back_ext49:
;MyProject.mbas,168 :: 		for chanel =1 to 4
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__eeprom_call_back_ext54:
;MyProject.mbas,169 :: 		for on_off22=1 to 2
	LDI        R27, 1
	STD        Y+0, R27
	LDI        R27, 0
	STD        Y+1, R27
L__eeprom_call_back_ext59:
;MyProject.mbas,171 :: 		Read_EEprom(1+counter_ex)
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _Read_EEprom+0
;MyProject.mbas,172 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][0]=  EEprom_data_read
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDS        R16, _EEprom_data_read+0
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,173 :: 		Read_EEprom(2 + counter_ex)
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _Read_EEprom+0
;MyProject.mbas,174 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][1]=  EEprom_data_read
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 2
	LDS        R16, _EEprom_data_read+0
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,175 :: 		Read_EEprom(3 + counter_ex)
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 253
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _Read_EEprom+0
;MyProject.mbas,176 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][2]=  EEprom_data_read
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 4
	LDS        R16, _EEprom_data_read+0
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,177 :: 		Read_EEprom(4 + counter_ex)
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _Read_EEprom+0
;MyProject.mbas,178 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][3]=  EEprom_data_read
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+2, R16
	STD        Y+3, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+2
	LDD        R19, Y+3
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 6
	LDS        R16, _EEprom_data_read+0
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,180 :: 		counter_ex=counter_ex+4
	LDS        R16, _counter_ex+0
	LDS        R17, _counter_ex+1
	SUBI       R16, 252
	SBCI       R17, 255
	STS        _counter_ex+0, R16
	STS        _counter_ex+1, R17
;MyProject.mbas,182 :: 		next on_off22
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__eeprom_call_back_ext222
	CPI        R16, 2
L__eeprom_call_back_ext222:
	BRNE       L__eeprom_call_back_ext223
	JMP        L__eeprom_call_back_ext62
L__eeprom_call_back_ext223:
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
	JMP        L__eeprom_call_back_ext59
L__eeprom_call_back_ext62:
;MyProject.mbas,183 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_call_back_ext224
	CPI        R16, 4
L__eeprom_call_back_ext224:
	BRNE       L__eeprom_call_back_ext225
	JMP        L__eeprom_call_back_ext57
L__eeprom_call_back_ext225:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__eeprom_call_back_ext54
L__eeprom_call_back_ext57:
;MyProject.mbas,184 :: 		next pwm_chanel
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_call_back_ext226
	CPI        R16, 7
L__eeprom_call_back_ext226:
	BRNE       L__eeprom_call_back_ext227
	JMP        L__eeprom_call_back_ext52
L__eeprom_call_back_ext227:
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__eeprom_call_back_ext49
L__eeprom_call_back_ext52:
;MyProject.mbas,185 :: 		next week
	LDS        R16, _week+0
	CPI        R16, 2
	BRNE       L__eeprom_call_back_ext228
	JMP        L__eeprom_call_back_ext47
L__eeprom_call_back_ext228:
	LDS        R16, _week+0
	SUBI       R16, 255
	STS        _week+0, R16
	JMP        L__eeprom_call_back_ext44
L__eeprom_call_back_ext47:
;MyProject.mbas,190 :: 		end sub
L_end_eeprom_call_back_ext:
	POP        R3
	POP        R2
	ADIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_call_back_ext

_ext_eeprom_ini:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 24
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,195 :: 		sub procedure ext_eeprom_ini()
;MyProject.mbas,198 :: 		Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	CALL       _Lcd_0+0
;MyProject.mbas,200 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;MyProject.mbas,201 :: 		Read_EEprom(0x00)
	CLR        R2
	CLR        R3
	CALL       _Read_EEprom+0
;MyProject.mbas,202 :: 		if  (EEprom_data_read =12)   then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 12
	BREQ       L__ext_eeprom_ini230
	JMP        L__ext_eeprom_ini65
L__ext_eeprom_ini230:
;MyProject.mbas,203 :: 		Lcd_Out(1,1,"ext EEprom writed befor" )
	MOVW       R30, R28
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 98
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
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
;MyProject.mbas,204 :: 		ByteToStr(EEprom_data_read, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,206 :: 		Lcd_Out(2,1,txt )   delay_ms(1500)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__ext_eeprom_ini67:
	DEC        R16
	BRNE       L__ext_eeprom_ini67
	DEC        R17
	BRNE       L__ext_eeprom_ini67
	DEC        R18
	BRNE       L__ext_eeprom_ini67
	NOP
	NOP
;MyProject.mbas,207 :: 		Lcd_0()    Lcd_Out(1,1,"Reading from " )    Lcd_Out(2,1,"EEPROM ... " )
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
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
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,208 :: 		eeprom_call_back_ext()
	CALL       _eeprom_call_back_ext+0
;MyProject.mbas,209 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;MyProject.mbas,210 :: 		Read_EEprom(0x04)
	LDI        R27, 4
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Read_EEprom+0
;MyProject.mbas,211 :: 		ByteToStr(EEprom_data_read, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,213 :: 		Lcd_Out(1,1,"EEprom-ext 04" )
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 45
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 52
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
;MyProject.mbas,214 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,215 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__ext_eeprom_ini69:
	DEC        R16
	BRNE       L__ext_eeprom_ini69
	DEC        R17
	BRNE       L__ext_eeprom_ini69
	DEC        R18
	BRNE       L__ext_eeprom_ini69
	NOP
	NOP
	JMP        L__ext_eeprom_ini66
;MyProject.mbas,217 :: 		else
L__ext_eeprom_ini65:
;MyProject.mbas,219 :: 		Lcd_Out(1,1,"ext not writed111111111" )
	MOVW       R30, R28
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 49
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
;MyProject.mbas,220 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__ext_eeprom_ini71:
	DEC        R16
	BRNE       L__ext_eeprom_ini71
	DEC        R17
	BRNE       L__ext_eeprom_ini71
	DEC        R18
	BRNE       L__ext_eeprom_ini71
	NOP
	NOP
;MyProject.mbas,221 :: 		Write_EEprom(0x00 ,12 )
	LDI        R27, 12
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _Write_EEprom+0
;MyProject.mbas,222 :: 		on_off_initial (1,1,0,0,18)    '' off mode on_off initial (dim on_off22,en,hr,mint,prc as integer)
	CLR        R8
	CLR        R9
	CLR        R6
	CLR        R7
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	LDI        R27, 0
	PUSH       R27
	LDI        R27, 18
	PUSH       R27
	CALL       _on_off_initial+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 2
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,223 :: 		on_off_initial (2,1,0,0,18)    '''on mode
	CLR        R8
	CLR        R9
	CLR        R6
	CLR        R7
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 2
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	LDI        R27, 0
	PUSH       R27
	LDI        R27, 18
	PUSH       R27
	CALL       _on_off_initial+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 2
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,224 :: 		Lcd_0()    Lcd_Out(1,1,"Writing to  " )    Lcd_Out(2,1,"EEPROM ... " )
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
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
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,225 :: 		eeprom_save_ext()
	CALL       _eeprom_save_ext+0
;MyProject.mbas,226 :: 		Lcd_Out(1,1,"writing ext eeprom" )
	MOVW       R30, R28
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
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
;MyProject.mbas,228 :: 		end if
L__ext_eeprom_ini66:
;MyProject.mbas,229 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__ext_eeprom_ini73:
	DEC        R16
	BRNE       L__ext_eeprom_ini73
	DEC        R17
	BRNE       L__ext_eeprom_ini73
	DEC        R18
	BRNE       L__ext_eeprom_ini73
	NOP
	NOP
;MyProject.mbas,230 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,231 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;MyProject.mbas,232 :: 		Read_EEprom(0x00)
	CLR        R2
	CLR        R3
	CALL       _Read_EEprom+0
;MyProject.mbas,233 :: 		if  (EEprom_data_read=12)   then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 12
	BREQ       L__ext_eeprom_ini231
	JMP        L__ext_eeprom_ini76
L__ext_eeprom_ini231:
;MyProject.mbas,234 :: 		Lcd_Out(1,1,"12 is good" )
	MOVW       R30, R28
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
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
;MyProject.mbas,235 :: 		ByteToStr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,237 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__ext_eeprom_ini77
;MyProject.mbas,238 :: 		else
L__ext_eeprom_ini76:
;MyProject.mbas,240 :: 		Lcd_Out(1,1,"ext not working" )
	MOVW       R30, R28
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
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
;MyProject.mbas,241 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__ext_eeprom_ini78:
	DEC        R16
	BRNE       L__ext_eeprom_ini78
	DEC        R17
	BRNE       L__ext_eeprom_ini78
	DEC        R18
	BRNE       L__ext_eeprom_ini78
	NOP
	NOP
;MyProject.mbas,242 :: 		Write_EEprom(0x00 ,12 )
	LDI        R27, 12
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _Write_EEprom+0
;MyProject.mbas,243 :: 		Lcd_Out(1,1,"ext not working" )
	MOVW       R30, R28
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
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
;MyProject.mbas,245 :: 		end if
L__ext_eeprom_ini77:
;MyProject.mbas,246 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__ext_eeprom_ini80:
	DEC        R16
	BRNE       L__ext_eeprom_ini80
	DEC        R17
	BRNE       L__ext_eeprom_ini80
	DEC        R18
	BRNE       L__ext_eeprom_ini80
	NOP
	NOP
;MyProject.mbas,247 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,248 :: 		end sub
L_end_ext_eeprom_ini:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 23
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _ext_eeprom_ini

_write_eeprom_ext_TWI:

;MyProject.mbas,250 :: 		sub procedure write_eeprom_ext_TWI(dim address_ as byte,dim  data_ as integer)
;MyProject.mbas,252 :: 		TWI_Init(100000)         ' initialize TWI communication
	PUSH       R2
	LDS        R27, TWPS0_bit+0
	CBR        R27, BitMask(TWPS0_bit+0)
	STS        TWPS0_bit+0, R27
	LDS        R27, TWPS1_bit+0
	CBR        R27, BitMask(TWPS1_bit+0)
	STS        TWPS1_bit+0, R27
	LDI        R27, 32
	STS        TWBR+0, R27
	CALL       _TWI_Init+0
;MyProject.mbas,253 :: 		TWI_Start()              ' issue TWI start signal
	CALL       _TWI_Start+0
;MyProject.mbas,254 :: 		TWI_Write(write_address_bus)          ' send byte via TWI (device address + W)
	PUSH       R2
	LDI        R27, 160
	MOV        R2, R27
	CALL       _TWI_Write+0
	POP        R2
;MyProject.mbas,255 :: 		TWI_Write(address_)             ' send byte (address of EEPROM location)
	CALL       _TWI_Write+0
;MyProject.mbas,256 :: 		TWI_Write(data_)          ' send data (data to be written)
	MOV        R2, R3
	CALL       _TWI_Write+0
;MyProject.mbas,257 :: 		TWI_Stop()               ' issue TWI stop signal
	CALL       _TWI_Stop+0
;MyProject.mbas,259 :: 		Delay_ms(10)
	LDI        R17, 104
	LDI        R16, 229
L__write_eeprom_ext_TWI83:
	DEC        R16
	BRNE       L__write_eeprom_ext_TWI83
	DEC        R17
	BRNE       L__write_eeprom_ext_TWI83
;MyProject.mbas,260 :: 		end sub
L_end_write_eeprom_ext_TWI:
	POP        R2
	RET
; end of _write_eeprom_ext_TWI

_Read_eeprom_ext_TWI:

;MyProject.mbas,261 :: 		sub procedure Read_eeprom_ext_TWI(dim address_ as byte)
;MyProject.mbas,263 :: 		TWI_Init(100000)         ' initialize TWI communication
	PUSH       R2
	LDS        R27, TWPS0_bit+0
	CBR        R27, BitMask(TWPS0_bit+0)
	STS        TWPS0_bit+0, R27
	LDS        R27, TWPS1_bit+0
	CBR        R27, BitMask(TWPS1_bit+0)
	STS        TWPS1_bit+0, R27
	LDI        R27, 32
	STS        TWBR+0, R27
	CALL       _TWI_Init+0
;MyProject.mbas,264 :: 		TWI_Start()              ' issue TWI start signal
	CALL       _TWI_Start+0
;MyProject.mbas,265 :: 		TWI_Write(write_address_bus)          ' send byte via TWI (device address + W)
	PUSH       R2
	LDI        R27, 160
	MOV        R2, R27
	CALL       _TWI_Write+0
	POP        R2
;MyProject.mbas,266 :: 		TWI_Write(address_)             ' send byte (data address)
	CALL       _TWI_Write+0
;MyProject.mbas,267 :: 		TWI_Start()              ' issue TWI signal repeated start
	CALL       _TWI_Start+0
;MyProject.mbas,268 :: 		TWI_Write(read_address_bus)          ' send byte (device address + R)
	LDI        R27, 161
	MOV        R2, R27
	CALL       _TWI_Write+0
;MyProject.mbas,269 :: 		EEprom_data_read = TWI_Read(0)      ' read data (NO acknowledge)
	CLR        R2
	CALL       _TWI_Read+0
	STS        _EEprom_data_read+0, R16
;MyProject.mbas,275 :: 		TWI_Stop()
	CALL       _TWI_Stop+0
;MyProject.mbas,276 :: 		Delay_ms(10)
	LDI        R17, 104
	LDI        R16, 229
L__Read_eeprom_ext_TWI86:
	DEC        R16
	BRNE       L__Read_eeprom_ext_TWI86
	DEC        R17
	BRNE       L__Read_eeprom_ext_TWI86
;MyProject.mbas,277 :: 		end sub
L_end_Read_eeprom_ext_TWI:
	POP        R2
	RET
; end of _Read_eeprom_ext_TWI

_eeprom_ext_TWI_ini:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 22
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,278 :: 		sub procedure eeprom_ext_TWI_ini()
;MyProject.mbas,279 :: 		EEprom_data_read=0  Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
	CALL       _Lcd_0+0
;MyProject.mbas,280 :: 		Read_eeprom_ext_TWI(0x00)
	CLR        R2
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,281 :: 		if  EEprom_data_read=112 then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 112
	BREQ       L__eeprom_ext_TWI_ini235
	JMP        L__eeprom_ext_TWI_ini90
L__eeprom_ext_TWI_ini235:
;MyProject.mbas,282 :: 		lcd_out(1,1,"Ext TWI EEp wr beffor")
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 98
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
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
;MyProject.mbas,283 :: 		delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__eeprom_ext_TWI_ini92:
	DEC        R16
	BRNE       L__eeprom_ext_TWI_ini92
	DEC        R17
	BRNE       L__eeprom_ext_TWI_ini92
	DEC        R18
	BRNE       L__eeprom_ext_TWI_ini92
	JMP        L__eeprom_ext_TWI_ini91
;MyProject.mbas,284 :: 		else
L__eeprom_ext_TWI_ini90:
;MyProject.mbas,285 :: 		write_eeprom_ext_TWI(0x00,112)
	LDI        R27, 112
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _write_eeprom_ext_TWI+0
;MyProject.mbas,286 :: 		lcd_out(1,1,"Ext TWI EEp not wrted")
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
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
;MyProject.mbas,287 :: 		lcd_out(2,1,"Wrtting ext twi eep")
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,288 :: 		delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__eeprom_ext_TWI_ini94:
	DEC        R16
	BRNE       L__eeprom_ext_TWI_ini94
	DEC        R17
	BRNE       L__eeprom_ext_TWI_ini94
	DEC        R18
	BRNE       L__eeprom_ext_TWI_ini94
;MyProject.mbas,289 :: 		end if
L__eeprom_ext_TWI_ini91:
;MyProject.mbas,290 :: 		EEprom_data_read=0 Lcd_0()
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
	CALL       _Lcd_0+0
;MyProject.mbas,291 :: 		Read_eeprom_ext_TWI(0x00)
	CLR        R2
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,292 :: 		if  EEprom_data_read=112 then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 112
	BREQ       L__eeprom_ext_TWI_ini236
	JMP        L__eeprom_ext_TWI_ini97
L__eeprom_ext_TWI_ini236:
;MyProject.mbas,293 :: 		lcd_out(1,1,"Ext TWI EEp working")
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
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
;MyProject.mbas,294 :: 		delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__eeprom_ext_TWI_ini99:
	DEC        R16
	BRNE       L__eeprom_ext_TWI_ini99
	DEC        R17
	BRNE       L__eeprom_ext_TWI_ini99
	DEC        R18
	BRNE       L__eeprom_ext_TWI_ini99
;MyProject.mbas,295 :: 		IntToStr(EEprom_data_read, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _EEprom_data_read+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,296 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,297 :: 		Lcd_Out(1,1,"EEprom TWI o " )
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
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
;MyProject.mbas,298 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,299 :: 		delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__eeprom_ext_TWI_ini101:
	DEC        R16
	BRNE       L__eeprom_ext_TWI_ini101
	DEC        R17
	BRNE       L__eeprom_ext_TWI_ini101
	DEC        R18
	BRNE       L__eeprom_ext_TWI_ini101
	JMP        L__eeprom_ext_TWI_ini98
;MyProject.mbas,300 :: 		else
L__eeprom_ext_TWI_ini97:
;MyProject.mbas,302 :: 		lcd_out(1,1,"TWI EEp not working")
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
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
;MyProject.mbas,304 :: 		delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__eeprom_ext_TWI_ini103:
	DEC        R16
	BRNE       L__eeprom_ext_TWI_ini103
	DEC        R17
	BRNE       L__eeprom_ext_TWI_ini103
	DEC        R18
	BRNE       L__eeprom_ext_TWI_ini103
;MyProject.mbas,305 :: 		end if
L__eeprom_ext_TWI_ini98:
;MyProject.mbas,306 :: 		delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__eeprom_ext_TWI_ini105:
	DEC        R16
	BRNE       L__eeprom_ext_TWI_ini105
	DEC        R17
	BRNE       L__eeprom_ext_TWI_ini105
	DEC        R18
	BRNE       L__eeprom_ext_TWI_ini105
;MyProject.mbas,307 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,308 :: 		end sub
L_end_eeprom_ext_TWI_ini:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 21
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_ext_TWI_ini

_eeprom_ext_TWI:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 14
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,309 :: 		sub procedure eeprom_ext_TWI()
;MyProject.mbas,312 :: 		TWI_Init(100000)         ' initialize TWI communication
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDS        R27, TWPS0_bit+0
	CBR        R27, BitMask(TWPS0_bit+0)
	STS        TWPS0_bit+0, R27
	LDS        R27, TWPS1_bit+0
	CBR        R27, BitMask(TWPS1_bit+0)
	STS        TWPS1_bit+0, R27
	LDI        R27, 32
	STS        TWBR+0, R27
	CALL       _TWI_Init+0
;MyProject.mbas,313 :: 		TWI_Start()              ' issue TWI start signal
	CALL       _TWI_Start+0
;MyProject.mbas,314 :: 		TWI_Write(160)          ' send byte via TWI (device address + W)
	LDI        R27, 160
	MOV        R2, R27
	CALL       _TWI_Write+0
;MyProject.mbas,315 :: 		TWI_Write(0x01)             ' send byte (address of EEPROM location)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _TWI_Write+0
;MyProject.mbas,316 :: 		TWI_Write(100)          ' send data (data to be written)
	LDI        R27, 100
	MOV        R2, R27
	CALL       _TWI_Write+0
;MyProject.mbas,317 :: 		TWI_Stop()               ' issue TWI stop signal
	CALL       _TWI_Stop+0
;MyProject.mbas,319 :: 		Delay_100ms()
	CALL       _Delay_100ms+0
;MyProject.mbas,321 :: 		TWI_Start()              ' issue TWI start signal
	CALL       _TWI_Start+0
;MyProject.mbas,322 :: 		TWI_Write(160)          ' send byte via TWI (device address + W)
	LDI        R27, 160
	MOV        R2, R27
	CALL       _TWI_Write+0
;MyProject.mbas,323 :: 		TWI_Write(0x01)             ' send byte (data address)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _TWI_Write+0
;MyProject.mbas,324 :: 		TWI_Start()              ' issue TWI signal repeated start
	CALL       _TWI_Start+0
;MyProject.mbas,325 :: 		TWI_Write(161)          ' send byte (device address + R)
	LDI        R27, 161
	MOV        R2, R27
	CALL       _TWI_Write+0
;MyProject.mbas,326 :: 		EEprom_data_read = TWI_Read(0)      ' read data (NO acknowledge)
	CLR        R2
	CALL       _TWI_Read+0
	STS        _EEprom_data_read+0, R16
;MyProject.mbas,327 :: 		IntToStr(EEprom_data_read, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,328 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,329 :: 		Lcd_Out(1,1,"EEprom TWI o " )
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
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
;MyProject.mbas,330 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,331 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__eeprom_ext_TWI108:
	DEC        R16
	BRNE       L__eeprom_ext_TWI108
	DEC        R17
	BRNE       L__eeprom_ext_TWI108
	DEC        R18
	BRNE       L__eeprom_ext_TWI108
	NOP
	NOP
;MyProject.mbas,332 :: 		TWI_Stop()               ' issue TWI stop signal}
	CALL       _TWI_Stop+0
;MyProject.mbas,333 :: 		end sub
L_end_eeprom_ext_TWI:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 13
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_ext_TWI

_eeprom_save_ext_twi:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 10
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,337 :: 		dim counter,on_off22 as integer
;MyProject.mbas,341 :: 		counter=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
;MyProject.mbas,342 :: 		for week =1to 7
	LDI        R27, 1
	STS        _week+0, R27
L__eeprom_save_ext_twi112:
;MyProject.mbas,343 :: 		for Pwm_chanel=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
L__eeprom_save_ext_twi117:
;MyProject.mbas,344 :: 		for chanel =1 to 3
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__eeprom_save_ext_twi122:
;MyProject.mbas,345 :: 		for on_off22=1 to 2
	LDI        R27, 1
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
L__eeprom_save_ext_twi127:
;MyProject.mbas,348 :: 		write_eeprom_ext_TWI(0x01 + counter,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][0] )
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+9, R16
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+7, R16
	STD        Y+8, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+7
	LDD        R19, Y+8
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R17, Z+
	LD         R18, Z+
	LDD        R16, Y+9
	MOV        R3, R17
	MOV        R4, R18
	MOV        R2, R16
	CALL       _write_eeprom_ext_TWI+0
;MyProject.mbas,349 :: 		write_eeprom_ext_TWI(0x01 + counter+1,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][1] )
	LDD        R16, Y+0
	SUBI       R16, 255
	SUBI       R16, 255
	STD        Y+9, R16
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+7, R16
	STD        Y+8, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+7
	LDD        R19, Y+8
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R17, Z+
	LD         R18, Z+
	LDD        R16, Y+9
	MOV        R3, R17
	MOV        R4, R18
	MOV        R2, R16
	CALL       _write_eeprom_ext_TWI+0
;MyProject.mbas,350 :: 		write_eeprom_ext_TWI(0x01 + counter+2,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][2] )
	LDD        R16, Y+0
	SUBI       R16, 255
	SUBI       R16, 254
	STD        Y+9, R16
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+7, R16
	STD        Y+8, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+7
	LDD        R19, Y+8
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 4
	LD         R17, Z+
	LD         R18, Z+
	LDD        R16, Y+9
	MOV        R3, R17
	MOV        R4, R18
	MOV        R2, R16
	CALL       _write_eeprom_ext_TWI+0
;MyProject.mbas,351 :: 		write_eeprom_ext_TWI(0x01 + counter+3,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][3] )
	LDD        R16, Y+0
	SUBI       R16, 255
	SUBI       R16, 253
	STD        Y+9, R16
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 80
	LDI        R21, 1
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+7, R16
	STD        Y+8, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+7
	LDD        R19, Y+8
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _Pwm_chanel+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 6
	LD         R17, Z+
	LD         R18, Z+
	LDD        R16, Y+9
	MOV        R3, R17
	MOV        R4, R18
	MOV        R2, R16
	CALL       _write_eeprom_ext_TWI+0
;MyProject.mbas,352 :: 		counter=counter+4
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 252
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,354 :: 		next on_off2
	LDD        R16, Y+2
	LDD        R17, Y+3
	CPI        R17, 0
	BRNE       L__eeprom_save_ext_twi239
	CPI        R16, 2
L__eeprom_save_ext_twi239:
	BRNE       L__eeprom_save_ext_twi240
	JMP        L__eeprom_save_ext_twi130
L__eeprom_save_ext_twi240:
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	JMP        L__eeprom_save_ext_twi127
L__eeprom_save_ext_twi130:
;MyProject.mbas,355 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_save_ext_twi241
	CPI        R16, 3
L__eeprom_save_ext_twi241:
	BRNE       L__eeprom_save_ext_twi242
	JMP        L__eeprom_save_ext_twi125
L__eeprom_save_ext_twi242:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__eeprom_save_ext_twi122
L__eeprom_save_ext_twi125:
;MyProject.mbas,356 :: 		next pwm_chanel
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_save_ext_twi243
	CPI        R16, 7
L__eeprom_save_ext_twi243:
	BRNE       L__eeprom_save_ext_twi244
	JMP        L__eeprom_save_ext_twi120
L__eeprom_save_ext_twi244:
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__eeprom_save_ext_twi117
L__eeprom_save_ext_twi120:
;MyProject.mbas,357 :: 		next week
	LDS        R16, _week+0
	CPI        R16, 7
	BRNE       L__eeprom_save_ext_twi245
	JMP        L__eeprom_save_ext_twi115
L__eeprom_save_ext_twi245:
	LDS        R16, _week+0
	SUBI       R16, 255
	STS        _week+0, R16
	JMP        L__eeprom_save_ext_twi112
L__eeprom_save_ext_twi115:
;MyProject.mbas,362 :: 		end sub
L_end_eeprom_save_ext_twi:
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 9
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_save_ext_twi

_strToInt1:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 28
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,368 :: 		tempCh as char
;MyProject.mbas,369 :: 		output = 0  ex=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, 0
	STS        _output+0, R27
	STS        _output+1, R27
	LDI        R27, 0
	STD        Y+6, R27
	STD        Y+7, R27
;MyProject.mbas,370 :: 		i = 1  stringLength = strlen(st)  temp = 0   numberLength = 0
	LDI        R27, 1
	STD        Y+8, R27
	LDI        R27, 0
	STD        Y+9, R27
	LDI        R27, #lo_addr(_st+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R3, R27
	CALL       _strlen+0
; stringLength start address is: 25 (R25)
	MOV        R25, R16
	MOV        R26, R17
	LDI        R27, 0
	STD        Y+2, R27
	STD        Y+3, R27
;MyProject.mbas,372 :: 		for j = 0 to stringLength-1
	LDI        R27, 0
	STD        Y+4, R27
	STD        Y+5, R27
; stringLength end address is: 25 (R25)
L__strToInt1132:
; stringLength start address is: 25 (R25)
	MOV        R21, R25
	MOV        R22, R26
	SUBI       R21, 1
	SBCI       R22, 0
	LDD        R16, Y+4
	LDD        R17, Y+5
	CP         R21, R16
	CPC        R22, R17
	BRGE       L__strToInt1247
	JMP        L__strToInt1136
L__strToInt1247:
;MyProject.mbas,374 :: 		tempCh = st[j]
	LDI        R18, #lo_addr(_st+0)
	LDI        R19, hi_addr(_st+0)
	LDD        R16, Y+4
	LDD        R17, Y+5
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R18, Z
;MyProject.mbas,375 :: 		temp = tempCh - 48
	MOV        R16, R18
	LDI        R17, 0
	SUBI       R16, 48
	SBCI       R17, 0
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,376 :: 		if   tempCh =46 then
	CPI        R18, 46
	BREQ       L__strToInt1248
	JMP        L__strToInt1138
L__strToInt1248:
;MyProject.mbas,377 :: 		ex=1
	LDI        R27, 1
	STD        Y+6, R27
	LDI        R27, 0
	STD        Y+7, R27
L__strToInt1138:
;MyProject.mbas,379 :: 		if (temp >= 0) and ( temp <= 9) and (ex=0)  then
	LDD        R19, Y+0
	LDD        R20, Y+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R19, R16
	CPC        R20, R17
	LDI        R18, 0
	BRLT       L__strToInt1249
	LDI        R18, 255
L__strToInt1249:
	LDI        R16, 9
	LDI        R17, 0
	CP         R16, R19
	CPC        R17, R20
	LDI        R27, 0
	BRLT       L__strToInt1250
	LDI        R27, 255
L__strToInt1250:
	MOV        R16, R27
	AND        R18, R16
	LDD        R16, Y+6
	LDD        R17, Y+7
	CPI        R17, 0
	BRNE       L__strToInt1251
	CPI        R16, 0
L__strToInt1251:
	LDI        R27, 0
	BRNE       L__strToInt1252
	LDI        R27, 255
L__strToInt1252:
	MOV        R16, R27
	AND        R16, R18
	BRNE       L__strToInt1253
	JMP        L__strToInt1141
L__strToInt1253:
;MyProject.mbas,381 :: 		inc(numberLength)
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
L__strToInt1141:
;MyProject.mbas,383 :: 		next j
	LDD        R16, Y+4
	LDD        R17, Y+5
	CP         R16, R21
	CPC        R17, R22
	BRNE       L__strToInt1254
	JMP        L__strToInt1136
L__strToInt1254:
	LDD        R16, Y+4
	LDD        R17, Y+5
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+4, R16
	STD        Y+5, R17
; stringLength end address is: 25 (R25)
	JMP        L__strToInt1132
L__strToInt1136:
;MyProject.mbas,386 :: 		for j = 0 to numberLength-1
	LDI        R27, 0
	STD        Y+4, R27
	STD        Y+5, R27
L__strToInt1143:
	LDD        R18, Y+2
	LDD        R19, Y+3
	SUBI       R18, 1
	SBCI       R19, 0
	STD        Y+26, R18
	STD        Y+27, R19
	LDD        R16, Y+4
	LDD        R17, Y+5
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__strToInt1255
	JMP        L__strToInt1147
L__strToInt1255:
;MyProject.mbas,388 :: 		tempCh = st[j]
	LDI        R18, #lo_addr(_st+0)
	LDI        R19, hi_addr(_st+0)
	LDD        R16, Y+4
	LDD        R17, Y+5
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
;MyProject.mbas,389 :: 		temp = tempCh - 48
	MOV        R19, R16
	LDI        R20, 0
	SUBI       R19, 48
	SBCI       R20, 0
	STD        Y+0, R19
	STD        Y+1, R20
;MyProject.mbas,390 :: 		if (temp >= 0) and (temp <= 9)  then
	LDI        R16, 0
	LDI        R17, 0
	CP         R19, R16
	CPC        R20, R17
	LDI        R18, 0
	BRLT       L__strToInt1256
	LDI        R18, 255
L__strToInt1256:
	LDI        R16, 9
	LDI        R17, 0
	CP         R16, R19
	CPC        R17, R20
	LDI        R27, 0
	BRLT       L__strToInt1257
	LDI        R27, 255
L__strToInt1257:
	MOV        R16, R27
	AND        R16, R18
	BRNE       L__strToInt1258
	JMP        L__strToInt1149
L__strToInt1258:
;MyProject.mbas,392 :: 		output =output +  temp * pow(10, (numberLength-i))
	LDD        R0, Y+8
	LDD        R1, Y+9
	LDI        R27, 0
	SBRC       R1, 7
	LDI        R27, 255
	LDD        R16, Y+2
	LDD        R17, Y+3
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	SUB        R16, R0
	SBC        R17, R1
	SBC        R18, R27
	SBC        R19, R27
	CALL       _float_slong2fp+0
	MOVW       R6, R16
	MOVW       R8, R18
	LDI        R27, 0
	MOV        R2, R27
	MOV        R3, R27
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 65
	MOV        R5, R27
	CALL       _pow+0
	STD        Y+22, R16
	STD        Y+23, R17
	STD        Y+24, R18
	STD        Y+25, R19
	LDD        R16, Y+0
	LDD        R17, Y+1
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	CALL       _float_slong2fp+0
	LDD        R20, Y+22
	LDD        R21, Y+23
	LDD        R22, Y+24
	LDD        R23, Y+25
	CALL       _float_fpmul1+0
	STD        Y+22, R16
	STD        Y+23, R17
	STD        Y+24, R18
	STD        Y+25, R19
	LDS        R16, _output+0
	LDS        R17, _output+1
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	CALL       _float_slong2fp+0
	LDD        R20, Y+22
	LDD        R21, Y+23
	LDD        R22, Y+24
	LDD        R23, Y+25
	CALL       _float_fpadd1+0
	CALL       _float_fpint+0
	STS        _output+0, R16
	STS        _output+1, R17
;MyProject.mbas,393 :: 		i=i+1
	LDD        R16, Y+8
	LDD        R17, Y+9
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+8, R16
	STD        Y+9, R17
L__strToInt1149:
;MyProject.mbas,396 :: 		next j
	LDD        R18, Y+4
	LDD        R19, Y+5
	LDD        R16, Y+26
	LDD        R17, Y+27
	CP         R18, R16
	CPC        R19, R17
	BRNE       L__strToInt1259
	JMP        L__strToInt1147
L__strToInt1259:
	LDD        R16, Y+4
	LDD        R17, Y+5
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+4, R16
	STD        Y+5, R17
	JMP        L__strToInt1143
L__strToInt1147:
;MyProject.mbas,398 :: 		end sub
L_end_strToInt1:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 27
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _strToInt1

_PWM_MAKE_as_max:

;MyProject.mbas,401 :: 		jjyear as float
;MyProject.mbas,403 :: 		jjyear=ceil((jj*max_duty)/100)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	MOV        R16, R2
	LDI        R17, 0
	MOV        R18, R17
	MOV        R19, R17
	MOV        R20, R3
	MOV        R21, R4
	LDI        R22, 0
	SBRC       R4, 7
	LDI        R22, 255
	MOV        R23, R22
	CALL       _HWMul_32x32+0
	CALL       _float_slong2fp+0
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 200
	LDI        R23, 66
	CALL       _float_fpdiv1+0
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
;MyProject.mbas,404 :: 		FloatToStr(jjyear, st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;MyProject.mbas,409 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,411 :: 		strToInt1()
	CALL       _strToInt1+0
;MyProject.mbas,413 :: 		IntToStr(ii, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _output+0
	LDS        R3, _output+1
	CALL       _IntToStr+0
;MyProject.mbas,414 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,415 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,416 :: 		Delay_mS(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__PWM_MAKE_as_max152:
	DEC        R16
	BRNE       L__PWM_MAKE_as_max152
	DEC        R17
	BRNE       L__PWM_MAKE_as_max152
	DEC        R18
	BRNE       L__PWM_MAKE_as_max152
;MyProject.mbas,417 :: 		end sub
L_end_PWM_MAKE_as_max:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _PWM_MAKE_as_max

_PWM_MAKE:

;MyProject.mbas,421 :: 		jjyear as float
;MyProject.mbas,423 :: 		jjyear=ceil((jj*255)/100)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R7
	MOV        R16, R2
	LDI        R17, 0
	LDI        R20, 255
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R20, 100
	LDI        R21, 0
	CALL       _Div_16x16_U+0
	MOVW       R16, R24
	LDI        R18, 0
	MOV        R19, R18
	CALL       _float_ulong2fp+0
	PUSH       R6
	PUSH       R5
	PUSH       R2
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
;MyProject.mbas,424 :: 		FloatToStr(jjyear, st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;MyProject.mbas,429 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,432 :: 		strToInt1()
	CALL       _strToInt1+0
	POP        R2
	POP        R5
	POP        R6
;MyProject.mbas,433 :: 		ii =output
; ii start address is: 16 (R16)
	LDS        R16, _output+0
	LDS        R17, _output+1
;MyProject.mbas,434 :: 		IntToStr(ii, txt)
	PUSH       R17
	PUSH       R16
	PUSH       R6
	PUSH       R5
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _output+0
	LDS        R3, _output+1
	CALL       _IntToStr+0
;MyProject.mbas,435 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,436 :: 		Lcd_Out(2,6,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
;MyProject.mbas,437 :: 		IntToStr(jj, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,438 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R5
	POP        R6
	POP        R16
	POP        R17
;MyProject.mbas,442 :: 		case 1
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE262
	LDI        R27, 1
	CP         R5, R27
L__PWM_MAKE262:
	BREQ       L__PWM_MAKE263
	JMP        L__PWM_MAKE158
L__PWM_MAKE263:
;MyProject.mbas,445 :: 		PWM16bit_Change_Duty(ii, _TIMER1_CH_A )
	LDI        R27, 17
	MOV        R4, R27
	MOVW       R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE155
L__PWM_MAKE158:
;MyProject.mbas,446 :: 		case 2
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE264
	LDI        R27, 2
	CP         R5, R27
L__PWM_MAKE264:
	BREQ       L__PWM_MAKE265
	JMP        L__PWM_MAKE161
L__PWM_MAKE265:
;MyProject.mbas,449 :: 		PWM16bit_Change_Duty( ii, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	MOVW       R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE155
L__PWM_MAKE161:
;MyProject.mbas,450 :: 		case 3
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE266
	LDI        R27, 3
	CP         R5, R27
L__PWM_MAKE266:
	BREQ       L__PWM_MAKE267
	JMP        L__PWM_MAKE164
L__PWM_MAKE267:
;MyProject.mbas,453 :: 		PWM1_Set_Duty(ii)
	MOV        R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM1_Set_Duty+0
	JMP        L__PWM_MAKE155
L__PWM_MAKE164:
;MyProject.mbas,454 :: 		case 4
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE268
	LDI        R27, 4
	CP         R5, R27
L__PWM_MAKE268:
	BREQ       L__PWM_MAKE269
	JMP        L__PWM_MAKE167
L__PWM_MAKE269:
;MyProject.mbas,457 :: 		PWM2_Set_Duty(ii)
	MOV        R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM2_Set_Duty+0
	JMP        L__PWM_MAKE155
L__PWM_MAKE167:
;MyProject.mbas,459 :: 		case 5
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE270
	LDI        R27, 5
	CP         R5, R27
L__PWM_MAKE270:
	BREQ       L__PWM_MAKE271
	JMP        L__PWM_MAKE170
L__PWM_MAKE271:
;MyProject.mbas,462 :: 		PWM16bit_Change_Duty(ii, _TIMER3_CH_A )
	LDI        R27, 20
	MOV        R4, R27
	MOVW       R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE155
L__PWM_MAKE170:
;MyProject.mbas,463 :: 		case 6
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE272
	LDI        R27, 6
	CP         R5, R27
L__PWM_MAKE272:
	BREQ       L__PWM_MAKE273
	JMP        L__PWM_MAKE173
L__PWM_MAKE273:
;MyProject.mbas,466 :: 		PWM16bit_Change_Duty(ii, _TIMER3_CH_B )
	LDI        R27, 21
	MOV        R4, R27
	MOVW       R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE155
L__PWM_MAKE173:
;MyProject.mbas,467 :: 		case 7
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE274
	LDI        R27, 7
	CP         R5, R27
L__PWM_MAKE274:
	BREQ       L__PWM_MAKE275
	JMP        L__PWM_MAKE176
L__PWM_MAKE275:
;MyProject.mbas,470 :: 		PWM16bit_Change_Duty(ii, _TIMER3_CH_C )
	LDI        R27, 22
	MOV        R4, R27
	MOVW       R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE155
L__PWM_MAKE176:
L__PWM_MAKE155:
;MyProject.mbas,472 :: 		end sub
L_end_PWM_MAKE:
	POP        R7
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _PWM_MAKE

_PWM_Initialize:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,477 :: 		k as integer
;MyProject.mbas,478 :: 		J=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDI        R27, 0
	STD        Y+0, R27
;MyProject.mbas,484 :: 		DDB4_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB4_bit+0
	SBR        R27, BitMask(DDB4_bit+0)
	OUT        DDB4_bit+0, R27
;MyProject.mbas,485 :: 		DDB5_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB5_bit+0
	SBR        R27, BitMask(DDB5_bit+0)
	OUT        DDB5_bit+0, R27
;MyProject.mbas,486 :: 		DDB6_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB6_bit+0
	SBR        R27, BitMask(DDB6_bit+0)
	OUT        DDB6_bit+0, R27
;MyProject.mbas,487 :: 		DDB7_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB7_bit+0
	SBR        R27, BitMask(DDB7_bit+0)
	OUT        DDB7_bit+0, R27
;MyProject.mbas,488 :: 		DDE3_bit = 1                    ' Set PORTD pin 7 as output pin for the PWM1 (according to datasheet)
	IN         R27, DDE3_bit+0
	SBR        R27, BitMask(DDE3_bit+0)
	OUT        DDE3_bit+0, R27
;MyProject.mbas,489 :: 		DDE4_bit = 1                    ' Set PORTD pin 7 as output pin for the PWM1 (according to datasheet)
	IN         R27, DDE4_bit+0
	SBR        R27, BitMask(DDE4_bit+0)
	OUT        DDE4_bit+0, R27
;MyProject.mbas,490 :: 		DDE5_bit = 1                    ' Set PORTD pin 7 as output pin for the PWM1 (according to datasheet)
	IN         R27, DDE5_bit+0
	SBR        R27, BitMask(DDE5_bit+0)
	OUT        DDE5_bit+0, R27
;MyProject.mbas,494 :: 		PWM1_Init(_PWM1_FAST_MODE, _PWM1_PRESCALER_8, _PWM1_NON_INVERTED,J)
	CLR        R5
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 72
	MOV        R2, R27
	CALL       _PWM1_Init+0
;MyProject.mbas,495 :: 		PWM2_Init(_PWM2_FAST_MODE, _PWM2_PRESCALER_8, _PWM2_NON_INVERTED, J)
	LDD        R5, Y+0
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 72
	MOV        R2, R27
	CALL       _PWM2_Init+0
;MyProject.mbas,496 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_8, _PWM16_NON_INVERTED, j , _TIMER1)
	LDI        R27, 1
	MOV        R7, R27
	LDD        R5, Y+0
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 168
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 11
	MOV        R2, R27
	CALL       _PWM16bit_Init+0
;MyProject.mbas,497 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_8, _PWM16_NON_INVERTED, j , _TIMER3)
	LDI        R27, 3
	MOV        R7, R27
	LDD        R5, Y+0
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 168
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 11
	MOV        R2, R27
	CALL       _PWM16bit_Init+0
;MyProject.mbas,499 :: 		PWM1_Set_Duty(j)
	LDD        R2, Y+0
	CALL       _PWM1_Set_Duty+0
;MyProject.mbas,500 :: 		PWM2_Set_Duty(j)
	LDD        R2, Y+0
	CALL       _PWM2_Set_Duty+0
;MyProject.mbas,502 :: 		ocr0=0 ocr2=0
	LDI        R27, 0
	OUT        OCR0+0, R27
	LDI        R27, 0
	OUT        OCR2+0, R27
;MyProject.mbas,503 :: 		for k=0 to 5
	LDI        R27, 0
	STD        Y+1, R27
	STD        Y+2, R27
L__PWM_Initialize179:
;MyProject.mbas,504 :: 		PWM_MAKE (k*20,255,7)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDD        R20, Y+1
	LDD        R21, Y+2
	LDI        R16, 20
	MUL        R20, R16
	MOV        R16, R0
	LDI        R27, 7
	MOV        R5, R27
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;MyProject.mbas,505 :: 		delay_ms(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__PWM_Initialize183:
	DEC        R16
	BRNE       L__PWM_Initialize183
	DEC        R17
	BRNE       L__PWM_Initialize183
	DEC        R18
	BRNE       L__PWM_Initialize183
	NOP
;MyProject.mbas,506 :: 		next k
	LDD        R16, Y+1
	LDD        R17, Y+2
	CPI        R17, 0
	BRNE       L__PWM_Initialize277
	CPI        R16, 5
L__PWM_Initialize277:
	BRNE       L__PWM_Initialize278
	JMP        L__PWM_Initialize182
L__PWM_Initialize278:
	LDD        R16, Y+1
	LDD        R17, Y+2
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+1, R16
	STD        Y+2, R17
	JMP        L__PWM_Initialize179
L__PWM_Initialize182:
;MyProject.mbas,507 :: 		end sub
L_end_PWM_Initialize:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _PWM_Initialize

_interrupt_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;MyProject.mbas,511 :: 		sub procedure interrupt_ISR () org IVT_ADDR_INT2            ''// Interrupt rutine
;MyProject.mbas,514 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,517 :: 		INTF2_bit=0                                                  '  // Clear interrupt flag
	IN         R27, INTF2_bit+0
	CBR        R27, BitMask(INTF2_bit+0)
	OUT        INTF2_bit+0, R27
;MyProject.mbas,518 :: 		INT2_bit = 0
	IN         R27, INT2_bit+0
	CBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;MyProject.mbas,519 :: 		txt1 = "<int is selected>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,520 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,521 :: 		if (Button(PIND, 2, 0.1, 1)<> 0) then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__interrupt_ISR280
	JMP        L__interrupt_ISR187
L__interrupt_ISR280:
;MyProject.mbas,522 :: 		oldstate = 1
	LDS        R27, _oldstate+0
	SBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,523 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,526 :: 		Delay_mS(400)                      ' Update flag
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__interrupt_ISR189:
	DEC        R16
	BRNE       L__interrupt_ISR189
	DEC        R17
	BRNE       L__interrupt_ISR189
	DEC        R18
	BRNE       L__interrupt_ISR189
L__interrupt_ISR187:
;MyProject.mbas,528 :: 		if (oldstate and Button(PIND, 2, 0.1, 0)) then    ' Detect one-to-zero transition
	CLR        R6
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate+0)
	INC        R17
	AND        R16, R17
	BRNE       L__interrupt_ISR281
	JMP        L__interrupt_ISR192
L__interrupt_ISR281:
;MyProject.mbas,529 :: 		oldstate = 0
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,530 :: 		txt1 = "<good>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,531 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,532 :: 		Delay_mS(400)
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__interrupt_ISR194:
	DEC        R16
	BRNE       L__interrupt_ISR194
	DEC        R17
	BRNE       L__interrupt_ISR194
	DEC        R18
	BRNE       L__interrupt_ISR194
L__interrupt_ISR192:
;MyProject.mbas,536 :: 		WDTCR = 0x00
	LDI        R27, 0
	OUT        WDTCR+0, R27
;MyProject.mbas,537 :: 		INT2_bit = 1
	IN         R27, INT2_bit+0
	SBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;MyProject.mbas,539 :: 		SREG_I_bit = 1                                  ''  // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,547 :: 		end sub
L_end_interrupt_ISR:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _interrupt_ISR

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 19
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,551 :: 		main:
;MyProject.mbas,558 :: 		Lcd_Init()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	CALL       _Lcd_Init+0
;MyProject.mbas,559 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,560 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,561 :: 		txt1 = "hello"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,562 :: 		txt2 = "RTC2 click"
	LDI        R30, #lo_addr(_txt2+0)
	LDI        R31, hi_addr(_txt2+0)
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,577 :: 		on_off_initial (1,1,0,0,11)    '' off mode on_off initial (dim on_off22,en,hr,mint,prc as integer)
	CLR        R8
	CLR        R9
	CLR        R6
	CLR        R7
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	LDI        R27, 0
	PUSH       R27
	LDI        R27, 11
	PUSH       R27
	CALL       _on_off_initial+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 2
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,578 :: 		on_off_initial (2,1,0,0,18)    '''on mode
	CLR        R8
	CLR        R9
	CLR        R6
	CLR        R7
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 2
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	LDI        R27, 0
	PUSH       R27
	LDI        R27, 18
	PUSH       R27
	CALL       _on_off_initial+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 2
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,580 :: 		ext_eeprom_ini()
	CALL       _ext_eeprom_ini+0
;MyProject.mbas,582 :: 		eeprom_ext_TWI_ini()
	CALL       _eeprom_ext_TWI_ini+0
;MyProject.mbas,585 :: 		Lcd_Out(1,1,"writing ext eeprom" )
	MOVW       R30, R28
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
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
;MyProject.mbas,586 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,587 :: 		Pwm_chanel=1   chanel=1  week=2      on_off2=1
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
	LDI        R27, 2
	STS        _week+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
	LDI        R27, 0
	STS        _on_off2+1, R27
;MyProject.mbas,588 :: 		IntToStr(on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][3],txt)
	LDI        R18, 80
	LDI        R19, 1
	LDI        R16, #lo_addr(_on_a_0+0)
	LDI        R17, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 6
	LD         R16, Z+
	LD         R17, Z+
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;MyProject.mbas,589 :: 		Lcd_Out(1,1,"on_a_0" )
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 48
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
;MyProject.mbas,590 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,591 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main197:
	DEC        R16
	BRNE       L__main197
	DEC        R17
	BRNE       L__main197
	DEC        R18
	BRNE       L__main197
	NOP
;MyProject.mbas,592 :: 		PWM_Initialize ()
	CALL       _PWM_Initialize+0
;MyProject.mbas,593 :: 		PWM_MAKE (100 ,255,1)
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _PWM_MAKE+0
;MyProject.mbas,594 :: 		PWM_MAKE (100,255,2)
	LDI        R27, 2
	MOV        R5, R27
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _PWM_MAKE+0
;MyProject.mbas,595 :: 		PWM_MAKE (100,255,3)
	LDI        R27, 3
	MOV        R5, R27
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _PWM_MAKE+0
;MyProject.mbas,596 :: 		PWM_MAKE (100,255,4)
	LDI        R27, 4
	MOV        R5, R27
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _PWM_MAKE+0
;MyProject.mbas,597 :: 		PWM_MAKE (100,255,5)
	LDI        R27, 5
	MOV        R5, R27
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _PWM_MAKE+0
;MyProject.mbas,598 :: 		PWM_MAKE (100,255,6)
	LDI        R27, 6
	MOV        R5, R27
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _PWM_MAKE+0
;MyProject.mbas,599 :: 		PWM_MAKE (100,255,7)
	LDI        R27, 7
	MOV        R5, R27
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _PWM_MAKE+0
;MyProject.mbas,600 :: 		while TRUE
L__main200:
;MyProject.mbas,603 :: 		Lcd_Out(1,1,txt1)                 ' Write text in first row
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,604 :: 		Lcd_Out(2,4,txt2)
	LDI        R27, #lo_addr(_txt2+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt2+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,605 :: 		wend
	JMP        L__main200
L_end_main:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
