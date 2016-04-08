
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
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,55 :: 		sub procedure on_off_initial (dim on_off22,en,hr,mint,prc as byte)
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
;MyProject.mbas,60 :: 		for chanel =1 to 4
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__on_off_initial13:
;MyProject.mbas,61 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][0] =en
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	ADD        R18, R16
	ADC        R19, R17
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	ST         Z, R3
;MyProject.mbas,62 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][1]=hr
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	ADD        R18, R16
	ADC        R19, R17
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	ST         Z, R4
;MyProject.mbas,63 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][2] =mint
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	ADD        R18, R16
	ADC        R19, R17
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 2
	ST         Z, R5
;MyProject.mbas,64 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][3]=prc
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+0
	LDD        R19, Y+1
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
	ADD        R18, R16
	ADC        R19, R17
	MOV        R16, R2
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	ST         Z, R6
;MyProject.mbas,67 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__on_off_initial130
	CPI        R16, 4
L__on_off_initial130:
	BRNE       L__on_off_initial131
	JMP        L__on_off_initial16
L__on_off_initial131:
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
	BRNE       L__on_off_initial132
	CPI        R16, 7
L__on_off_initial132:
	BRNE       L__on_off_initial133
	JMP        L__on_off_initial11
L__on_off_initial133:
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
	BRNE       L__on_off_initial134
	JMP        L__on_off_initial6
L__on_off_initial134:
	LDS        R16, _week+0
	SUBI       R16, 255
	STS        _week+0, R16
	JMP        L__on_off_initial3
L__on_off_initial6:
;MyProject.mbas,71 :: 		end sub
L_end_on_off_initial:
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _on_off_initial

_write_eeprom_ext_TWI:

;MyProject.mbas,77 :: 		sub procedure write_eeprom_ext_TWI(dim address_ as integer,dim  data_ as byte)
;MyProject.mbas,79 :: 		TWI_Init(100000)         ' initialize TWI communication
	PUSH       R2
	PUSH       R3
	LDS        R27, TWPS0_bit+0
	CBR        R27, BitMask(TWPS0_bit+0)
	STS        TWPS0_bit+0, R27
	LDS        R27, TWPS1_bit+0
	CBR        R27, BitMask(TWPS1_bit+0)
	STS        TWPS1_bit+0, R27
	LDI        R27, 32
	STS        TWBR+0, R27
	CALL       _TWI_Init+0
;MyProject.mbas,80 :: 		TWI_Start()              ' issue TWI start signal
	CALL       _TWI_Start+0
;MyProject.mbas,81 :: 		TWI_Write(write_address_bus)          ' send byte via TWI (device address + W)
	PUSH       R3
	PUSH       R2
	LDI        R27, 160
	MOV        R2, R27
	CALL       _TWI_Write+0
	POP        R2
	POP        R3
;MyProject.mbas,82 :: 		TWI_Write(address_)             ' send byte (address of EEPROM location)
	CALL       _TWI_Write+0
;MyProject.mbas,83 :: 		TWI_Write(data_)          ' send data (data to be written)
	MOV        R2, R4
	CALL       _TWI_Write+0
;MyProject.mbas,84 :: 		TWI_Stop()               ' issue TWI stop signal
	CALL       _TWI_Stop+0
;MyProject.mbas,86 :: 		Delay_ms(15)
	LDI        R17, 156
	LDI        R16, 215
L__write_eeprom_ext_TWI18:
	DEC        R16
	BRNE       L__write_eeprom_ext_TWI18
	DEC        R17
	BRNE       L__write_eeprom_ext_TWI18
	NOP
	NOP
;MyProject.mbas,87 :: 		end sub
L_end_write_eeprom_ext_TWI:
	POP        R3
	POP        R2
	RET
; end of _write_eeprom_ext_TWI

_Read_eeprom_ext_TWI:

;MyProject.mbas,88 :: 		sub procedure Read_eeprom_ext_TWI(dim address_ as integer)
;MyProject.mbas,90 :: 		TWI_Init(100000)         ' initialize TWI communication
	PUSH       R2
	PUSH       R3
	LDS        R27, TWPS0_bit+0
	CBR        R27, BitMask(TWPS0_bit+0)
	STS        TWPS0_bit+0, R27
	LDS        R27, TWPS1_bit+0
	CBR        R27, BitMask(TWPS1_bit+0)
	STS        TWPS1_bit+0, R27
	LDI        R27, 32
	STS        TWBR+0, R27
	CALL       _TWI_Init+0
;MyProject.mbas,91 :: 		TWI_Start()              ' issue TWI start signal
	CALL       _TWI_Start+0
;MyProject.mbas,92 :: 		TWI_Write(write_address_bus)          ' send byte via TWI (device address + W)
	PUSH       R3
	PUSH       R2
	LDI        R27, 160
	MOV        R2, R27
	CALL       _TWI_Write+0
	POP        R2
	POP        R3
;MyProject.mbas,93 :: 		TWI_Write(address_)             ' send byte (data address)
	CALL       _TWI_Write+0
;MyProject.mbas,94 :: 		TWI_Start()              ' issue TWI signal repeated start
	CALL       _TWI_Start+0
;MyProject.mbas,95 :: 		TWI_Write(read_address_bus)          ' send byte (device address + R)
	LDI        R27, 161
	MOV        R2, R27
	CALL       _TWI_Write+0
;MyProject.mbas,96 :: 		EEprom_data_read = TWI_Read(0)      ' read data (NO acknowledge)
	CLR        R2
	CALL       _TWI_Read+0
	STS        _EEprom_data_read+0, R16
;MyProject.mbas,102 :: 		TWI_Stop()
	CALL       _TWI_Stop+0
;MyProject.mbas,103 :: 		Delay_ms(15)
	LDI        R17, 156
	LDI        R16, 215
L__Read_eeprom_ext_TWI21:
	DEC        R16
	BRNE       L__Read_eeprom_ext_TWI21
	DEC        R17
	BRNE       L__Read_eeprom_ext_TWI21
	NOP
	NOP
;MyProject.mbas,104 :: 		end sub
L_end_Read_eeprom_ext_TWI:
	POP        R3
	POP        R2
	RET
; end of _Read_eeprom_ext_TWI

_eeprom_call_back_ext_twi:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 23
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,111 :: 		counter as integer
;MyProject.mbas,115 :: 		counter=5
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 5
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
;MyProject.mbas,116 :: 		for week_twi =1 to 7
	LDI        R27, 1
	STD        Y+1, R27
L__eeprom_call_back_ext_twi25:
;MyProject.mbas,117 :: 		for Pwm_chanel=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
L__eeprom_call_back_ext_twi30:
;MyProject.mbas,118 :: 		for chanel =1 to 4
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__eeprom_call_back_ext_twi35:
;MyProject.mbas,119 :: 		for on_off22=1 to 2
	LDI        R27, 1
	STD        Y+0, R27
L__eeprom_call_back_ext_twi40:
;MyProject.mbas,126 :: 		Read_eeprom_ext_TWI(inc(counter))
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	MOVW       R2, R16
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,127 :: 		on_a_0 [week_twi-1][chanel-1][pwm_chanel-1][on_off22-1][0]=  EEprom_data_read
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+21, R16
	STD        Y+22, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+21
	LDD        R19, Y+22
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
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDS        R16, _EEprom_data_read+0
	ST         Z, R16
;MyProject.mbas,134 :: 		Read_eeprom_ext_TWI(inc(counter))
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	MOVW       R2, R16
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,135 :: 		on_a_0 [week_twi-1][chanel-1][pwm_chanel-1][on_off22-1][1]=  EEprom_data_read
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+21, R16
	STD        Y+22, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+21
	LDD        R19, Y+22
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
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LDS        R16, _EEprom_data_read+0
	ST         Z, R16
;MyProject.mbas,136 :: 		Read_eeprom_ext_TWI(inc(counter))
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	MOVW       R2, R16
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,137 :: 		on_a_0 [week_twi-1][chanel-1][pwm_chanel-1][on_off22-1][2]=  EEprom_data_read
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+21, R16
	STD        Y+22, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+21
	LDD        R19, Y+22
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
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 2
	LDS        R16, _EEprom_data_read+0
	ST         Z, R16
;MyProject.mbas,138 :: 		Read_eeprom_ext_TWI(inc(counter))
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	MOVW       R2, R16
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,139 :: 		on_a_0 [week_twi-1][chanel-1][pwm_chanel-1][on_off22-1][3]=  EEprom_data_read
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+21, R16
	STD        Y+22, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+21
	LDD        R19, Y+22
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
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LDS        R16, _EEprom_data_read+0
	ST         Z, R16
;MyProject.mbas,142 :: 		Lcd_0() byteToStr(EEprom_data_read, txt)
	CALL       _Lcd_0+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,143 :: 		Lcd_Out(1,1,"date read is: " )
	MOVW       R30, R28
	ADIW       R30, 4
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,144 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,149 :: 		intToStr(integer (ceil(counter*100/1573)), txt)
	LDD        R16, Y+2
	LDD        R17, Y+3
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	LDI        R20, 100
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	CALL       _HWMul_32x32+0
	CALL       _float_slong2fp+0
	LDI        R20, 0
	LDI        R21, 160
	LDI        R22, 196
	LDI        R23, 68
	CALL       _float_fpdiv1+0
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
	CALL       _float_fpint+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;MyProject.mbas,150 :: 		Lcd_Out(1,1,"read counter: " )
	MOVW       R30, R28
	ADIW       R30, 4
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,151 :: 		Lcd_Out(2,7,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,153 :: 		next on_off22
	LDD        R16, Y+0
	CPI        R16, 2
	BRNE       L__eeprom_call_back_ext_twi138
	JMP        L__eeprom_call_back_ext_twi43
L__eeprom_call_back_ext_twi138:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__eeprom_call_back_ext_twi40
L__eeprom_call_back_ext_twi43:
;MyProject.mbas,154 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_call_back_ext_twi139
	CPI        R16, 4
L__eeprom_call_back_ext_twi139:
	BRNE       L__eeprom_call_back_ext_twi140
	JMP        L__eeprom_call_back_ext_twi38
L__eeprom_call_back_ext_twi140:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__eeprom_call_back_ext_twi35
L__eeprom_call_back_ext_twi38:
;MyProject.mbas,155 :: 		next pwm_chanel
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_call_back_ext_twi141
	CPI        R16, 7
L__eeprom_call_back_ext_twi141:
	BRNE       L__eeprom_call_back_ext_twi142
	JMP        L__eeprom_call_back_ext_twi33
L__eeprom_call_back_ext_twi142:
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__eeprom_call_back_ext_twi30
L__eeprom_call_back_ext_twi33:
;MyProject.mbas,156 :: 		next week_twi
	LDD        R16, Y+1
	CPI        R16, 7
	BRNE       L__eeprom_call_back_ext_twi143
	JMP        L__eeprom_call_back_ext_twi28
L__eeprom_call_back_ext_twi143:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__eeprom_call_back_ext_twi25
L__eeprom_call_back_ext_twi28:
;MyProject.mbas,161 :: 		end sub
L_end_eeprom_call_back_ext_twi:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 22
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_call_back_ext_twi

_eeprom_save_ext_twi:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 37
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,167 :: 		counter as integer
;MyProject.mbas,171 :: 		counter=5
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 5
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
;MyProject.mbas,172 :: 		for week_twi =1 to 7
	LDI        R27, 1
	STD        Y+1, R27
L__eeprom_save_ext_twi46:
;MyProject.mbas,173 :: 		for Pwm_chanel=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
L__eeprom_save_ext_twi51:
;MyProject.mbas,174 :: 		for chanel =1 to 4
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__eeprom_save_ext_twi56:
;MyProject.mbas,175 :: 		for on_off22=1 to 2
	LDI        R27, 1
	STD        Y+0, R27
L__eeprom_save_ext_twi61:
;MyProject.mbas,178 :: 		write_eeprom_ext_TWI(inc(counter),on_a_0 [week_twi-1][chanel-1][pwm_chanel-1][on_off22-1][0] )
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+35
	LDD        R19, Y+36
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
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	MOV        R4, R16
	LDD        R2, Y+2
	LDD        R3, Y+3
	CALL       _write_eeprom_ext_TWI+0
;MyProject.mbas,186 :: 		write_eeprom_ext_TWI(inc(counter),on_a_0 [week_twi-1][chanel-1][pwm_chanel-1][on_off22-1][1] )
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+35
	LDD        R19, Y+36
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
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 1
	LD         R16, Z
	MOV        R4, R16
	LDD        R2, Y+2
	LDD        R3, Y+3
	CALL       _write_eeprom_ext_TWI+0
;MyProject.mbas,187 :: 		write_eeprom_ext_TWI(inc(counter),on_a_0 [week_twi-1][chanel-1][pwm_chanel-1][on_off22-1][2] )
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+35
	LDD        R19, Y+36
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
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 2
	LD         R16, Z
	MOV        R4, R16
	LDD        R2, Y+2
	LDD        R3, Y+3
	CALL       _write_eeprom_ext_TWI+0
;MyProject.mbas,188 :: 		write_eeprom_ext_TWI(inc(counter),on_a_0 [week_twi-1][chanel-1][pwm_chanel-1][on_off22-1][3] )
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	LDD        R16, Y+1
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+35
	LDD        R19, Y+36
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
	ADD        R18, R16
	ADC        R19, R17
	LDD        R16, Y+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	MOV        R4, R16
	LDD        R2, Y+2
	LDD        R3, Y+3
	CALL       _write_eeprom_ext_TWI+0
;MyProject.mbas,190 :: 		Read_eeprom_ext_TWI(counter)
	LDD        R2, Y+2
	LDD        R3, Y+3
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,191 :: 		Lcd_0() byteToStr(EEprom_data_read, txt)
	CALL       _Lcd_0+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,192 :: 		Lcd_Out(1,1,"EEprom_data_read writen is: " )
	MOVW       R30, R28
	ADIW       R30, 4
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
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 100
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
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,193 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,197 :: 		intToStr(integer (ceil(counter*100/1573)), txt)
	LDD        R16, Y+2
	LDD        R17, Y+3
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	LDI        R20, 100
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	CALL       _HWMul_32x32+0
	CALL       _float_slong2fp+0
	LDI        R20, 0
	LDI        R21, 160
	LDI        R22, 196
	LDI        R23, 68
	CALL       _float_fpdiv1+0
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
	CALL       _float_fpint+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;MyProject.mbas,198 :: 		Lcd_Out(1,1,"Write counter: " )
	MOVW       R30, R28
	ADIW       R30, 4
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,199 :: 		Lcd_Out(2,7,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,202 :: 		next on_off2
	LDD        R16, Y+0
	CPI        R16, 2
	BRNE       L__eeprom_save_ext_twi145
	JMP        L__eeprom_save_ext_twi64
L__eeprom_save_ext_twi145:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__eeprom_save_ext_twi61
L__eeprom_save_ext_twi64:
;MyProject.mbas,203 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_save_ext_twi146
	CPI        R16, 4
L__eeprom_save_ext_twi146:
	BRNE       L__eeprom_save_ext_twi147
	JMP        L__eeprom_save_ext_twi59
L__eeprom_save_ext_twi147:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__eeprom_save_ext_twi56
L__eeprom_save_ext_twi59:
;MyProject.mbas,204 :: 		next pwm_chanel
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_save_ext_twi148
	CPI        R16, 7
L__eeprom_save_ext_twi148:
	BRNE       L__eeprom_save_ext_twi149
	JMP        L__eeprom_save_ext_twi54
L__eeprom_save_ext_twi149:
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__eeprom_save_ext_twi51
L__eeprom_save_ext_twi54:
;MyProject.mbas,205 :: 		next week_twi
	LDD        R16, Y+1
	CPI        R16, 7
	BRNE       L__eeprom_save_ext_twi150
	JMP        L__eeprom_save_ext_twi49
L__eeprom_save_ext_twi150:
	LDD        R16, Y+1
	SUBI       R16, 255
	STD        Y+1, R16
	JMP        L__eeprom_save_ext_twi46
L__eeprom_save_ext_twi49:
;MyProject.mbas,209 :: 		delay_ms(111)
	LDI        R18, 5
	LDI        R17, 130
	LDI        R16, 58
L__eeprom_save_ext_twi65:
	DEC        R16
	BRNE       L__eeprom_save_ext_twi65
	DEC        R17
	BRNE       L__eeprom_save_ext_twi65
	DEC        R18
	BRNE       L__eeprom_save_ext_twi65
	NOP
	NOP
;MyProject.mbas,210 :: 		end sub
L_end_eeprom_save_ext_twi:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 36
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_save_ext_twi

_ext_twi_eeprom_ini:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,216 :: 		sub procedure ext_twi_eeprom_ini()
;MyProject.mbas,219 :: 		EEprom_data_read=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;MyProject.mbas,220 :: 		Read_eeprom_ext_TWI(0)
	CLR        R2
	CLR        R3
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,223 :: 		if  (EEprom_data_read=10)   then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 10
	BREQ       L__ext_twi_eeprom_ini152
	JMP        L__ext_twi_eeprom_ini69
L__ext_twi_eeprom_ini152:
;MyProject.mbas,224 :: 		Lcd_0() Lcd_Out(1,1,"TWI EEPROM" ) Lcd_Out(2,1,"is working" )
	CALL       _Lcd_0+0
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
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
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
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
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
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,225 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini71:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini71
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini71
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini71
	NOP
;MyProject.mbas,226 :: 		ByteToStr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,227 :: 		Lcd_Out(1,1,"EEprommmmmmmmmm" )
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
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
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
;MyProject.mbas,228 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__ext_twi_eeprom_ini70
;MyProject.mbas,229 :: 		else
L__ext_twi_eeprom_ini69:
;MyProject.mbas,230 :: 		Lcd_0() Lcd_Out(1,1,"TWI EEPROM" ) Lcd_Out(2,1,"is Not working")
	CALL       _Lcd_0+0
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
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
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
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 78
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
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,231 :: 		bytetostr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,232 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,233 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini73:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini73
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini73
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini73
	NOP
;MyProject.mbas,234 :: 		Lcd_Out(1,1,"0 EEPROM is:" )Lcd_Out(2,1,txt )
	MOVW       R30, R28
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 58
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
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,235 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini75:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini75
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini75
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini75
	NOP
;MyProject.mbas,236 :: 		end if
L__ext_twi_eeprom_ini70:
;MyProject.mbas,237 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,239 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;MyProject.mbas,240 :: 		Read_eeprom_ext_TWI(0)
	CLR        R2
	CLR        R3
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,243 :: 		if  (EEprom_data_read =10)   then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 10
	BREQ       L__ext_twi_eeprom_ini153
	JMP        L__ext_twi_eeprom_ini78
L__ext_twi_eeprom_ini153:
;MyProject.mbas,244 :: 		Lcd_Out(1,1,"ext EEp writed befor" )
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
;MyProject.mbas,245 :: 		ByteToStr(EEprom_data_read, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,247 :: 		Lcd_Out(2,1,txt )   delay_ms(500)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini80:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini80
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini80
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini80
	NOP
;MyProject.mbas,248 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,249 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,250 :: 		Lcd_Out(1,1,"Reading EEPROM " )
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,251 :: 		Lcd_Out(2,1," ..." )
	MOVW       R30, R28
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 46
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
;MyProject.mbas,252 :: 		eeprom_call_back_ext_twi()
	CALL       _eeprom_call_back_ext_twi+0
;MyProject.mbas,261 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini82:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini82
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini82
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini82
	NOP
	JMP        L__ext_twi_eeprom_ini79
;MyProject.mbas,264 :: 		else
L__ext_twi_eeprom_ini78:
;MyProject.mbas,266 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,267 :: 		Lcd_Out(1,1,"ext not writed111111111" )
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
;MyProject.mbas,268 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini84:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini84
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini84
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini84
	NOP
;MyProject.mbas,269 :: 		on_off_initial (1,1,0,0,17)    '' On mode on_off initial (dim on_off22,en,hr,mint,prc as integer)
	LDI        R27, 17
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _on_off_initial+0
;MyProject.mbas,270 :: 		on_off_initial (2,1,0,0,17)    '''OFF mode
	LDI        R27, 17
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _on_off_initial+0
;MyProject.mbas,272 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,273 :: 		Lcd_Out(1,1,"Wrting to EEPROM ..." )
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 114
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,275 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,276 :: 		Lcd_Out(1,1,"Wrting to EEPROM " ) Lcd_Out(2,1,"..." )
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 114
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R27, 46
	STD        Y+0, R27
	LDI        R27, 46
	STD        Y+1, R27
	LDI        R27, 46
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,277 :: 		eeprom_save_ext_twi()
	CALL       _eeprom_save_ext_twi+0
;MyProject.mbas,278 :: 		Lcd_Out(1,1,"writing ext eeprom" )
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
;MyProject.mbas,279 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,282 :: 		write_eeprom_ext_TWI(0 ,10 )
	LDI        R27, 10
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _write_eeprom_ext_TWI+0
;MyProject.mbas,283 :: 		Pwm_chanel=1   chanel=1        on_off2=1
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
	LDI        R27, 0
	STS        _on_off2+1, R27
;MyProject.mbas,284 :: 		week=7
	LDI        R27, 7
	STS        _week+0, R27
;MyProject.mbas,285 :: 		ByteToStr(on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][3],txt)
	LDI        R18, 64
	LDI        R19, 5
	LDI        R16, #lo_addr(_on_a_0+0)
	LDI        R17, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;MyProject.mbas,286 :: 		Lcd_Out(1,1,"on_a_0" )
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
;MyProject.mbas,287 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,288 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini86:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini86
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini86
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini86
	NOP
;MyProject.mbas,290 :: 		end if
L__ext_twi_eeprom_ini79:
;MyProject.mbas,291 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini88:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini88
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini88
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini88
	NOP
;MyProject.mbas,292 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,293 :: 		Pwm_chanel=1   chanel=1      on_off2=1
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
	LDI        R27, 0
	STS        _on_off2+1, R27
;MyProject.mbas,294 :: 		week=7
	LDI        R27, 7
	STS        _week+0, R27
;MyProject.mbas,295 :: 		ByteToStr(on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][0],txt)
	LDI        R18, 64
	LDI        R19, 5
	LDI        R16, #lo_addr(_on_a_0+0)
	LDI        R17, hi_addr(_on_a_0+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;MyProject.mbas,296 :: 		Lcd_Out(1,1,"on_a_0" )
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
;MyProject.mbas,297 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,298 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini90:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini90
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini90
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini90
	NOP
;MyProject.mbas,299 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,301 :: 		ByteToStr(on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][3],txt)
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+24, R16
	STD        Y+25, R17
	LDI        R16, 56
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+24
	LDD        R19, Y+25
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
	ADD        R18, R16
	ADC        R19, R17
	LDS        R16, _on_off2+0
	SUBI       R16, 1
	LDI        R17, 0
	LSL        R16
	ROL        R17
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;MyProject.mbas,302 :: 		Lcd_Out(1,1,"precrntage" )
	MOVW       R30, R28
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 103
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
;MyProject.mbas,303 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,304 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini92:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini92
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini92
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini92
	NOP
;MyProject.mbas,305 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;MyProject.mbas,306 :: 		Read_eeprom_ext_TWI(0)
	CLR        R2
	CLR        R3
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,309 :: 		if  (EEprom_data_read=10)   then
	LDS        R16, _EEprom_data_read+0
	CPI        R16, 10
	BREQ       L__ext_twi_eeprom_ini154
	JMP        L__ext_twi_eeprom_ini95
L__ext_twi_eeprom_ini154:
;MyProject.mbas,310 :: 		Lcd_0() Lcd_Out(1,1,"TWI EEPROM" ) Lcd_Out(2,1,"is working" )
	CALL       _Lcd_0+0
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
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
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
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
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
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,311 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini97:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini97
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini97
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini97
	NOP
;MyProject.mbas,312 :: 		ByteToStr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,313 :: 		Lcd_Out(1,1,"EEprommmmmmmmmm" )
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
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 109
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
;MyProject.mbas,314 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__ext_twi_eeprom_ini96
;MyProject.mbas,315 :: 		else
L__ext_twi_eeprom_ini95:
;MyProject.mbas,316 :: 		Lcd_0() Lcd_Out(1,1,"TWI EEPROM" ) Lcd_Out(2,1,"is Not working")
	CALL       _Lcd_0+0
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
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 77
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
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 78
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
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,317 :: 		bytetostr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,318 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,319 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini99:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini99
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini99
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini99
	NOP
;MyProject.mbas,320 :: 		Lcd_Out(1,1,"0 EEPROM is:" )Lcd_Out(2,1,txt )
	MOVW       R30, R28
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 58
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
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,321 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini101:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini101
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini101
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini101
	NOP
;MyProject.mbas,323 :: 		end if
L__ext_twi_eeprom_ini96:
;MyProject.mbas,324 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__ext_twi_eeprom_ini103:
	DEC        R16
	BRNE       L__ext_twi_eeprom_ini103
	DEC        R17
	BRNE       L__ext_twi_eeprom_ini103
	DEC        R18
	BRNE       L__ext_twi_eeprom_ini103
	NOP
;MyProject.mbas,325 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,326 :: 		end sub
L_end_ext_twi_eeprom_ini:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 25
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _ext_twi_eeprom_ini

_interrupt_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;MyProject.mbas,331 :: 		sub procedure interrupt_ISR () org IVT_ADDR_INT2            ''// Interrupt rutine
;MyProject.mbas,334 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,337 :: 		INTF2_bit=0                                                  '  // Clear interrupt flag
	IN         R27, INTF2_bit+0
	CBR        R27, BitMask(INTF2_bit+0)
	OUT        INTF2_bit+0, R27
;MyProject.mbas,338 :: 		INT2_bit = 0
	IN         R27, INT2_bit+0
	CBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;MyProject.mbas,339 :: 		txt1 = "<int is selected>"
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
;MyProject.mbas,340 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,341 :: 		if (Button(PIND, 2, 0.1, 1)<> 0) then    ' Detect logical one setting key
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
	BRNE       L__interrupt_ISR156
	JMP        L__interrupt_ISR107
L__interrupt_ISR156:
;MyProject.mbas,342 :: 		oldstate = 1
	LDS        R27, _oldstate+0
	SBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,343 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,346 :: 		Delay_mS(400)                      ' Update flag
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__interrupt_ISR109:
	DEC        R16
	BRNE       L__interrupt_ISR109
	DEC        R17
	BRNE       L__interrupt_ISR109
	DEC        R18
	BRNE       L__interrupt_ISR109
L__interrupt_ISR107:
;MyProject.mbas,348 :: 		if (oldstate and Button(PIND, 2, 0.1, 0)) then    ' Detect one-to-zero transition
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
	BRNE       L__interrupt_ISR157
	JMP        L__interrupt_ISR112
L__interrupt_ISR157:
;MyProject.mbas,349 :: 		oldstate = 0
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,350 :: 		txt1 = "<good>"
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
;MyProject.mbas,351 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,352 :: 		Delay_mS(400)
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__interrupt_ISR114:
	DEC        R16
	BRNE       L__interrupt_ISR114
	DEC        R17
	BRNE       L__interrupt_ISR114
	DEC        R18
	BRNE       L__interrupt_ISR114
L__interrupt_ISR112:
;MyProject.mbas,356 :: 		WDTCR = 0x00
	LDI        R27, 0
	OUT        WDTCR+0, R27
;MyProject.mbas,357 :: 		INT2_bit = 1
	IN         R27, INT2_bit+0
	SBR        R27, BitMask(INT2_bit+0)
	OUT        INT2_bit+0, R27
;MyProject.mbas,359 :: 		SREG_I_bit = 1                                  ''  // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,367 :: 		end sub
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
	SBIW       R28, 16
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,371 :: 		main:
;MyProject.mbas,378 :: 		Lcd_Init()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_Init+0
;MyProject.mbas,379 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,380 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,381 :: 		txt1 = "hello"
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
;MyProject.mbas,382 :: 		txt2 = "RTC2 click"
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
;MyProject.mbas,402 :: 		ext_twi_eeprom_ini()
	CALL       _ext_twi_eeprom_ini+0
;MyProject.mbas,406 :: 		Lcd_0() Lcd_Out(1,1,"test ext eeprom" )
	CALL       _Lcd_0+0
	MOVW       R30, R28
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 116
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
;MyProject.mbas,408 :: 		Pwm_chanel=1   chanel=1  week=7      on_off2=1
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
	LDI        R27, 7
	STS        _week+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
	LDI        R27, 0
	STS        _on_off2+1, R27
;MyProject.mbas,409 :: 		byteToStr(on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][3],txt)
	LDI        R18, 64
	LDI        R19, 5
	LDI        R16, #lo_addr(_on_a_0+0)
	LDI        R17, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;MyProject.mbas,410 :: 		Lcd_Out(1,1,"on_a_0" )
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
;MyProject.mbas,411 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,412 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main117:
	DEC        R16
	BRNE       L__main117
	DEC        R17
	BRNE       L__main117
	DEC        R18
	BRNE       L__main117
	NOP
;MyProject.mbas,413 :: 		while TRUE
L__main120:
;MyProject.mbas,419 :: 		Lcd_0() ''Lcd_Out(1,1,"test ext eeprom" )
	CALL       _Lcd_0+0
;MyProject.mbas,421 :: 		Pwm_chanel=1   chanel=1  week=7      on_off2=1
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
	LDI        R27, 7
	STS        _week+0, R27
	LDI        R27, 1
	STS        _on_off2+0, R27
	LDI        R27, 0
	STS        _on_off2+1, R27
;MyProject.mbas,422 :: 		byteToStr(on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][3],txt)
	LDI        R18, 64
	LDI        R19, 5
	LDI        R16, #lo_addr(_on_a_0+0)
	LDI        R17, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 3
	LD         R16, Z
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	MOV        R2, R16
	CALL       _ByteToStr+0
;MyProject.mbas,423 :: 		Lcd_Out(1,1,"on_a_0" )
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
;MyProject.mbas,424 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,425 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main124:
	DEC        R16
	BRNE       L__main124
	DEC        R17
	BRNE       L__main124
	DEC        R18
	BRNE       L__main124
	NOP
;MyProject.mbas,427 :: 		EEprom_data_read=0
	LDI        R27, 0
	STS        _EEprom_data_read+0, R27
;MyProject.mbas,428 :: 		Read_eeprom_ext_TWI(0x00)
	CLR        R2
	CLR        R3
	CALL       _Read_eeprom_ext_TWI+0
;MyProject.mbas,429 :: 		bytetostr(EEprom_data_read,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R4, R27
	LDS        R2, _EEprom_data_read+0
	CALL       _ByteToStr+0
;MyProject.mbas,430 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,432 :: 		Lcd_Out(1,1,"0x00 EEPROM is:" )Lcd_Out(2,1,txt )delay_ms(500)
	MOVW       R30, R28
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
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
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 58
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
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main126:
	DEC        R16
	BRNE       L__main126
	DEC        R17
	BRNE       L__main126
	DEC        R18
	BRNE       L__main126
	NOP
;MyProject.mbas,433 :: 		wend
	JMP        L__main120
L_end_main:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
