
_Write_Time:

;MyProject.mbas,108 :: 		dim c_day as byte, dim c_week as byte, dim c_month as byte, dim c_year as byte)
;MyProject.mbas,109 :: 		Soft_I2C_Start()                         ' issue start signal
	PUSH       R2
	PUSH       R8
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Soft_I2C_Start+0
;MyProject.mbas,110 :: 		Soft_I2C_Write(RTC_ADDR)                 ' address DS1307
	LDI        R27, 208
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,111 :: 		Soft_I2C_Write(0)                        ' start from word at address (REG0)
	CLR        R2
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,112 :: 		Soft_I2C_Write(0x80)                     ' write $80 to REG0. (pause counter + 0 sec)   ?? ??????? ????? ????? ?????
	LDI        R27, 128
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
	POP        R2
	POP        R3
;MyProject.mbas,114 :: 		Soft_I2C_Write(c_minutes)                ' write 0 to minutes word to (REG1)
	PUSH       R2
	MOV        R2, R3
	CALL       _Soft_I2C_Write+0
	POP        R2
;MyProject.mbas,115 :: 		Soft_I2C_Write(c_hours)                  ' write 17 to hours word (24-hours mode)(REG2)
	CALL       _Soft_I2C_Write+0
	POP        R4
	POP        R5
	POP        R6
;MyProject.mbas,116 :: 		Soft_I2C_Write(c_week)                   ' write 2 - Monday (REG3)
	PUSH       R5
	PUSH       R4
	MOV        R2, R6
	CALL       _Soft_I2C_Write+0
	POP        R4
	POP        R5
;MyProject.mbas,117 :: 		Soft_I2C_Write(c_day)                    ' write 4 to date word (REG4)
	PUSH       R4
	MOV        R2, R5
	CALL       _Soft_I2C_Write+0
	POP        R4
	POP        R7
;MyProject.mbas,118 :: 		Soft_I2C_Write(c_month)                  ' write 5 (May) to month word (REG5)
	PUSH       R4
	MOV        R2, R7
	CALL       _Soft_I2C_Write+0
	POP        R4
	POP        R8
;MyProject.mbas,119 :: 		Soft_I2C_Write(c_year)                   ' write 01 to year word (REG6)
	PUSH       R4
	MOV        R2, R8
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,120 :: 		Soft_I2C_Stop()                          ' issue stop signal
	CALL       _Soft_I2C_Stop+0
;MyProject.mbas,122 :: 		Soft_I2C_Start()                         ' issue start signal
	CALL       _Soft_I2C_Start+0
;MyProject.mbas,123 :: 		Soft_I2C_Write(RTC_ADDR)                 ' address DS1307
	LDI        R27, 208
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,124 :: 		Soft_I2C_Write(0)                        ' start from word at address 0
	CLR        R2
	CALL       _Soft_I2C_Write+0
	POP        R4
;MyProject.mbas,125 :: 		Soft_I2C_Write(0 and c_seconds)          ' write 0 to REG0 (enable counting + 0 sec)       ???? ??? ? ?????
	MOV        R16, R4
	ANDI       R16, 0
	MOV        R2, R16
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,126 :: 		Soft_I2C_Stop()                          ' issue stop signal
	CALL       _Soft_I2C_Stop+0
;MyProject.mbas,127 :: 		end sub
L_end_Write_Time:
	POP        R2
	RET
; end of _Write_Time

_Read_Time:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	ADIW       R28, 5

;MyProject.mbas,133 :: 		dim p_day as ^byte, dim p_week as ^byte, dim p_month as ^byte, dim p_year as ^byte)
	PUSH       R2
	PUSH       R3
	LDD        R16, Y+0
	LDD        R17, Y+1
	STD        Y+0, R16
	STD        Y+1, R17
	LDD        R16, Y+2
	LDD        R17, Y+3
	STD        Y+2, R16
	STD        Y+3, R17
	LDD        R16, Y+4
	LDD        R17, Y+5
	STD        Y+4, R16
	STD        Y+5, R17
;MyProject.mbas,135 :: 		Soft_I2C_Start()                    ' Issue start signal
	PUSH       R9
	PUSH       R8
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Soft_I2C_Start+0
;MyProject.mbas,136 :: 		Soft_I2C_Write(RTC_ADDR)            ' Address DS1307, see DS1307 datasheet
	LDI        R27, 208
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,137 :: 		Soft_I2C_Write(0)                   ' Start from address 0
	CLR        R2
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,138 :: 		Soft_I2C_Start()                    ' Issue repeated start signal
	CALL       _Soft_I2C_Start+0
;MyProject.mbas,139 :: 		Soft_I2C_Write(RTC_ADDR + 1)        ' Address DS1307 for reading R/W=1
	LDI        R27, 209
	MOV        R2, R27
	CALL       _Soft_I2C_Write+0
;MyProject.mbas,141 :: 		p_seconds^ = Soft_I2C_Read(1)      ' Read seconds byte
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Soft_I2C_Read+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	MOVW       R30, R6
	ST         Z, R16
;MyProject.mbas,142 :: 		p_minutes^ = Soft_I2C_Read(1)      ' Read minutes byte
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Soft_I2C_Read+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	MOVW       R30, R4
	ST         Z, R16
;MyProject.mbas,143 :: 		p_hours^ = Soft_I2C_Read(1)        ' Read hours byte
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Soft_I2C_Read+0
	POP        R2
	POP        R3
	MOVW       R30, R2
	ST         Z, R16
;MyProject.mbas,144 :: 		p_week^ = Soft_I2C_Read(1)
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Soft_I2C_Read+0
	LDD        R30, Y+0
	LDD        R31, Y+1
	ST         Z, R16
;MyProject.mbas,145 :: 		p_day^ = Soft_I2C_Read(1)
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Soft_I2C_Read+0
	POP        R8
	POP        R9
	MOVW       R30, R8
	ST         Z, R16
;MyProject.mbas,146 :: 		p_month^ = Soft_I2C_Read(1)
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Soft_I2C_Read+0
	LDD        R30, Y+2
	LDD        R31, Y+3
	ST         Z, R16
;MyProject.mbas,147 :: 		p_year^ = Soft_I2C_Read(0)
	CLR        R2
	CLR        R3
	CALL       _Soft_I2C_Read+0
	LDD        R30, Y+4
	LDD        R31, Y+5
	ST         Z, R16
;MyProject.mbas,149 :: 		Soft_I2C_Stop()   ' Issue stop signal
	CALL       _Soft_I2C_Stop+0
;MyProject.mbas,150 :: 		end sub
L_end_Read_Time:
	POP        R3
	POP        R2
	POP        R29
	POP        R28
	RET
; end of _Read_Time

_Lcd_0:

;MyProject.mbas,151 :: 		sub procedure Lcd_0()
;MyProject.mbas,152 :: 		Lcd_Init()
	PUSH       R2
	CALL       _Lcd_Init+0
;MyProject.mbas,153 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,154 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,156 :: 		end sub
L_end_Lcd_0:
	POP        R2
	RET
; end of _Lcd_0

_Shamsi_transfer_time:

;MyProject.mbas,161 :: 		sub procedure Shamsi_transfer_time()
;MyProject.mbas,163 :: 		seconds  =  ((seconds and 0x70) >> 4)*10 + (seconds and 0x0F)
	LDS        R16, _seconds+0
	ANDI       R16, 112
	MOV        R17, R16
	LSR        R17
	LSR        R17
	LSR        R17
	LSR        R17
	LDI        R16, 10
	MUL        R17, R16
	MOV        R17, R0
	LDS        R16, _seconds+0
	ANDI       R16, 15
	ADD        R16, R17
	STS        _seconds+0, R16
;MyProject.mbas,164 :: 		minutes  =  ((minutes and 0xF0) >> 4)*10 + (minutes and 0x0F)
	LDS        R16, _minutes+0
	ANDI       R16, 240
	MOV        R17, R16
	LSR        R17
	LSR        R17
	LSR        R17
	LSR        R17
	LDI        R16, 10
	MUL        R17, R16
	MOV        R17, R0
	LDS        R16, _minutes+0
	ANDI       R16, 15
	ADD        R16, R17
	STS        _minutes+0, R16
;MyProject.mbas,165 :: 		hours    =  ((hours and 0x30) >> 4)*10 + (hours and 0x0F)
	LDS        R16, _hours+0
	ANDI       R16, 48
	MOV        R17, R16
	LSR        R17
	LSR        R17
	LSR        R17
	LSR        R17
	LDI        R16, 10
	MUL        R17, R16
	MOV        R17, R0
	LDS        R16, _hours+0
	ANDI       R16, 15
	ADD        R16, R17
	STS        _hours+0, R16
;MyProject.mbas,166 :: 		week     =  (week and 0x07)
	LDS        R16, _week+0
	ANDI       R16, 7
	STS        _week+0, R16
;MyProject.mbas,167 :: 		day      =  ((day and 0xF0) >> 4)*10 + (day and 0x0F)
	LDS        R16, _day+0
	ANDI       R16, 240
	MOV        R17, R16
	LSR        R17
	LSR        R17
	LSR        R17
	LSR        R17
	LDI        R16, 10
	MUL        R17, R16
	MOV        R17, R0
	LDS        R16, _day+0
	ANDI       R16, 15
	ADD        R16, R17
	STS        _day+0, R16
;MyProject.mbas,168 :: 		month    =  ((month and 0x10) >> 4)*10 + (month and 0x0F)
	LDS        R16, _month+0
	ANDI       R16, 16
	MOV        R17, R16
	LSR        R17
	LSR        R17
	LSR        R17
	LSR        R17
	LDI        R16, 10
	MUL        R17, R16
	MOV        R17, R0
	LDS        R16, _month+0
	ANDI       R16, 15
	ADD        R16, R17
	STS        _month+0, R16
;MyProject.mbas,169 :: 		year     =  ((year and 0xF0) >> 4)*10+(year and 0x0F)
	LDS        R16, _year+0
	ANDI       R16, 240
	MOV        R17, R16
	LSR        R17
	LSR        R17
	LSR        R17
	LSR        R17
	LDI        R16, 10
	MUL        R17, R16
	MOV        R17, R0
	LDS        R16, _year+0
	ANDI       R16, 15
	ADD        R16, R17
	STS        _year+0, R16
;MyProject.mbas,170 :: 		end sub
L_end_Shamsi_transfer_time:
	RET
; end of _Shamsi_transfer_time

_Shamsi_show_lcd:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	ADIW       R28, 5

;MyProject.mbas,172 :: 		sub procedure Shamsi_show_lcd(dim jjmonth,jjday,jjyear,jweek,jhours ,jminutes,jseconds as integer)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDD        R16, Y+0
	LDD        R17, Y+1
	STD        Y+0, R16
	STD        Y+1, R17
	LDD        R16, Y+2
	LDD        R17, Y+3
	STD        Y+2, R16
	STD        Y+3, R17
	LDD        R16, Y+4
	LDD        R17, Y+5
	STD        Y+4, R16
	STD        Y+5, R17
;MyProject.mbas,174 :: 		case 1
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__Shamsi_show_lcd696
	LDI        R27, 1
	CP         R8, R27
L__Shamsi_show_lcd696:
	BREQ       L__Shamsi_show_lcd697
	JMP        L__Shamsi_show_lcd8
L__Shamsi_show_lcd697:
;MyProject.mbas,175 :: 		txt = "Sun"
	LDI        R27, 83
	STS        _txt+0, R27
	LDI        R27, 117
	STS        _txt+1, R27
	LDI        R27, 110
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__Shamsi_show_lcd5
L__Shamsi_show_lcd8:
;MyProject.mbas,176 :: 		case 2
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__Shamsi_show_lcd698
	LDI        R27, 2
	CP         R8, R27
L__Shamsi_show_lcd698:
	BREQ       L__Shamsi_show_lcd699
	JMP        L__Shamsi_show_lcd11
L__Shamsi_show_lcd699:
;MyProject.mbas,177 :: 		txt = "Mon"
	LDI        R27, 77
	STS        _txt+0, R27
	LDI        R27, 111
	STS        _txt+1, R27
	LDI        R27, 110
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__Shamsi_show_lcd5
L__Shamsi_show_lcd11:
;MyProject.mbas,178 :: 		case 3
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__Shamsi_show_lcd700
	LDI        R27, 3
	CP         R8, R27
L__Shamsi_show_lcd700:
	BREQ       L__Shamsi_show_lcd701
	JMP        L__Shamsi_show_lcd14
L__Shamsi_show_lcd701:
;MyProject.mbas,179 :: 		txt = "Tue"
	LDI        R27, 84
	STS        _txt+0, R27
	LDI        R27, 117
	STS        _txt+1, R27
	LDI        R27, 101
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__Shamsi_show_lcd5
L__Shamsi_show_lcd14:
;MyProject.mbas,180 :: 		case 4
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__Shamsi_show_lcd702
	LDI        R27, 4
	CP         R8, R27
L__Shamsi_show_lcd702:
	BREQ       L__Shamsi_show_lcd703
	JMP        L__Shamsi_show_lcd17
L__Shamsi_show_lcd703:
;MyProject.mbas,181 :: 		txt = "Wed"
	LDI        R27, 87
	STS        _txt+0, R27
	LDI        R27, 101
	STS        _txt+1, R27
	LDI        R27, 100
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__Shamsi_show_lcd5
L__Shamsi_show_lcd17:
;MyProject.mbas,182 :: 		case 5
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__Shamsi_show_lcd704
	LDI        R27, 5
	CP         R8, R27
L__Shamsi_show_lcd704:
	BREQ       L__Shamsi_show_lcd705
	JMP        L__Shamsi_show_lcd20
L__Shamsi_show_lcd705:
;MyProject.mbas,183 :: 		txt = "Thu"
	LDI        R27, 84
	STS        _txt+0, R27
	LDI        R27, 104
	STS        _txt+1, R27
	LDI        R27, 117
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__Shamsi_show_lcd5
L__Shamsi_show_lcd20:
;MyProject.mbas,184 :: 		case 6
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__Shamsi_show_lcd706
	LDI        R27, 6
	CP         R8, R27
L__Shamsi_show_lcd706:
	BREQ       L__Shamsi_show_lcd707
	JMP        L__Shamsi_show_lcd23
L__Shamsi_show_lcd707:
;MyProject.mbas,185 :: 		txt = "Fri"
	LDI        R27, 70
	STS        _txt+0, R27
	LDI        R27, 114
	STS        _txt+1, R27
	LDI        R27, 105
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__Shamsi_show_lcd5
L__Shamsi_show_lcd23:
;MyProject.mbas,186 :: 		case 7
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__Shamsi_show_lcd708
	LDI        R27, 7
	CP         R8, R27
L__Shamsi_show_lcd708:
	BREQ       L__Shamsi_show_lcd709
	JMP        L__Shamsi_show_lcd26
L__Shamsi_show_lcd709:
;MyProject.mbas,187 :: 		txt = "Sat"
	LDI        R27, 83
	STS        _txt+0, R27
	LDI        R27, 97
	STS        _txt+1, R27
	LDI        R27, 116
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__Shamsi_show_lcd5
L__Shamsi_show_lcd26:
L__Shamsi_show_lcd5:
;MyProject.mbas,190 :: 		LCD_Out(1,1, txt)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,191 :: 		Lcd_Chr(1, 6, (jjday div 10)   + 48)    ' Print tens digit of day variable
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R20, 10
	LDI        R21, 0
	MOVW       R16, R4
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,192 :: 		Lcd_Chr(1, 7, (jjday mod 10)   + 48)    ' Print oness digit of day variable
	PUSH       R3
	PUSH       R2
	LDI        R20, 10
	LDI        R21, 0
	MOVW       R16, R4
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R2
	POP        R3
;MyProject.mbas,193 :: 		Lcd_Chr(1, 9, (jjmonth div 10) + 48)
	PUSH       R3
	PUSH       R2
	LDI        R20, 10
	LDI        R21, 0
	MOVW       R16, R2
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R2
	POP        R3
;MyProject.mbas,194 :: 		Lcd_Chr(1,10, (jjmonth mod 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	MOVW       R16, R2
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R6
	POP        R7
;MyProject.mbas,196 :: 		Lcd_Chr(1,12, (jjyear div 1000)  + 48)
	PUSH       R7
	PUSH       R6
	LDI        R20, 232
	LDI        R21, 3
	MOVW       R16, R6
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 12
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R6
	POP        R7
;MyProject.mbas,197 :: 		Lcd_Chr(1,13, ((jjyear mod 1000)div 100)  + 48)
	PUSH       R7
	PUSH       R6
	LDI        R20, 232
	LDI        R21, 3
	MOVW       R16, R6
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R20, 100
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R6
	POP        R7
;MyProject.mbas,198 :: 		Lcd_Chr(1,14, (((jjyear mod 1000)mod 100) div 10)  + 48)
	PUSH       R7
	PUSH       R6
	LDI        R20, 232
	LDI        R21, 3
	MOVW       R16, R6
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R20, 100
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 14
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R6
	POP        R7
;MyProject.mbas,199 :: 		Lcd_Chr(1,15, (((jjyear mod 1000)mod 100) mod 10)  + 48)
	LDI        R20, 232
	LDI        R21, 3
	MOVW       R16, R6
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R20, 100
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 15
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,201 :: 		Lcd_Chr(2, 6, (jhours div 10)   + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,202 :: 		Lcd_Chr(2, 7, (jhours mod 10)   + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,203 :: 		Lcd_Chr(2, 9, (jminutes div 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+2
	LDD        R17, Y+3
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,204 :: 		Lcd_Chr(2,10, (jminutes mod 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+2
	LDD        R17, Y+3
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,205 :: 		Lcd_Chr(2,12, (jseconds div 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+4
	LDD        R17, Y+5
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 12
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,206 :: 		Lcd_Chr(2,13, (jseconds mod 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+4
	LDD        R17, Y+5
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,208 :: 		end sub
L_end_Shamsi_show_lcd:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	POP        R29
	POP        R28
	RET
; end of _Shamsi_show_lcd

_shamsi_to_milady:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 20
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,221 :: 		end structure
;MyProject.mbas,223 :: 		Mmonth_a[0] = 30
	LDI        R27, 30
	STD        Y+8, R27
;MyProject.mbas,224 :: 		Mmonth_a[1] = 31
	LDI        R27, 31
	STD        Y+9, R27
;MyProject.mbas,225 :: 		Mmonth_a[2] = 30
	LDI        R27, 30
	STD        Y+10, R27
;MyProject.mbas,226 :: 		Mmonth_a[3] = 31
	LDI        R27, 31
	STD        Y+11, R27
;MyProject.mbas,227 :: 		Mmonth_a[4] = 31
	LDI        R27, 31
	STD        Y+12, R27
;MyProject.mbas,228 :: 		Mmonth_a[5] = 30
	LDI        R27, 30
	STD        Y+13, R27
;MyProject.mbas,229 :: 		Mmonth_a[6] = 31
	LDI        R27, 31
	STD        Y+14, R27
;MyProject.mbas,230 :: 		Mmonth_a[7] = 30
	LDI        R27, 30
	STD        Y+15, R27
;MyProject.mbas,231 :: 		Mmonth_a[8] = 31
	LDI        R27, 31
	STD        Y+16, R27
;MyProject.mbas,232 :: 		Mmonth_a[9] = 31
	LDI        R27, 31
	STD        Y+17, R27
;MyProject.mbas,233 :: 		Mmonth_a[10] = 28
	LDI        R27, 28
	STD        Y+18, R27
;MyProject.mbas,234 :: 		Mmonth_a[11] = 31
	LDI        R27, 31
	STD        Y+19, R27
;MyProject.mbas,236 :: 		miladiYear = ShamsiYear + 621
	MOVW       R16, R6
	SUBI       R16, 147
	SBCI       R17, 253
	STD        Y+2, R16
	STD        Y+3, R17
;MyProject.mbas,237 :: 		miladiYear2=miladiYear
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,238 :: 		Temp1 = miladiYear2 Mod 4
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R20, 4
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp1+0, R16
	STS        _Temp1+1, R17
;MyProject.mbas,239 :: 		Temp2 = miladiYear2 Mod 100
	LDI        R20, 100
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp2+0, R16
	STS        _Temp2+1, R17
;MyProject.mbas,240 :: 		Temp3 = miladiYear2 Mod 400
	LDI        R20, 144
	LDI        R21, 1
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	STS        _Temp3+0, R16
	STS        _Temp3+1, R17
;MyProject.mbas,241 :: 		Temp4 = (( Temp2 <> 0) and ( Temp1 = 0) )
	LDS        R21, _Temp2+0
	LDS        R22, _Temp2+1
	CPI        R22, 0
	BRNE       L__shamsi_to_milady711
	CPI        R21, 0
L__shamsi_to_milady711:
	LDI        R20, 0
	BREQ       L__shamsi_to_milady712
	LDI        R20, 255
L__shamsi_to_milady712:
	LDS        R18, _Temp1+0
	LDS        R19, _Temp1+1
	CPI        R19, 0
	BRNE       L__shamsi_to_milady713
	CPI        R18, 0
L__shamsi_to_milady713:
	LDI        R27, 0
	BRNE       L__shamsi_to_milady714
	LDI        R27, 255
L__shamsi_to_milady714:
	MOV        R18, R27
	AND        R18, R20
	STS        _Temp4+0, R18
	LDI        R27, 0
	STS        _Temp4+1, R27
;MyProject.mbas,242 :: 		Temp5=((Temp2 = 0) and (Temp3 = 0) )
	CPI        R22, 0
	BRNE       L__shamsi_to_milady715
	CPI        R21, 0
L__shamsi_to_milady715:
	LDI        R18, 0
	BRNE       L__shamsi_to_milady716
	LDI        R18, 255
L__shamsi_to_milady716:
	CPI        R17, 0
	BRNE       L__shamsi_to_milady717
	CPI        R16, 0
L__shamsi_to_milady717:
	LDI        R27, 0
	BRNE       L__shamsi_to_milady718
	LDI        R27, 255
L__shamsi_to_milady718:
	MOV        R16, R27
	AND        R16, R18
; Temp5 start address is: 18 (R18)
	MOV        R18, R16
	LDI        R19, 0
;MyProject.mbas,244 :: 		if(Temp4 or temp5) then
	LDS        R16, _Temp4+0
	LDS        R17, _Temp4+1
	OR         R16, R18
	OR         R17, R19
; Temp5 end address is: 18 (R18)
	MOV        R27, R16
	OR         R27, R17
	BRNE       L__shamsi_to_milady719
	JMP        L__shamsi_to_milady29
L__shamsi_to_milady719:
;MyProject.mbas,249 :: 		marchDayDiff = 12
	LDI        R27, 12
	STD        Y+4, R27
	LDI        R27, 0
	STD        Y+5, R27
	JMP        L__shamsi_to_milady30
;MyProject.mbas,250 :: 		Else
L__shamsi_to_milady29:
;MyProject.mbas,253 :: 		marchDayDiff = 11
	LDI        R27, 11
	STD        Y+4, R27
	LDI        R27, 0
	STD        Y+5, R27
;MyProject.mbas,254 :: 		End If
L__shamsi_to_milady30:
;MyProject.mbas,255 :: 		if(((((miladiYear+1 mod  100)<> 0) and ((miladiYear+1 mod 4) = 0))) or ((((miladiYear+1 mod 100)= 0) and (miladiYear+1 mod 400) = 0))) then
	LDD        R16, Y+2
	LDD        R17, Y+3
	MOV        R19, R16
	MOV        R20, R17
	SUBI       R19, 255
	SBCI       R20, 255
	CPI        R20, 0
	BRNE       L__shamsi_to_milady720
	CPI        R19, 0
L__shamsi_to_milady720:
	LDI        R17, 0
	BREQ       L__shamsi_to_milady721
	LDI        R17, 255
L__shamsi_to_milady721:
	CPI        R20, 0
	BRNE       L__shamsi_to_milady722
	CPI        R19, 0
L__shamsi_to_milady722:
	LDI        R16, 0
	BRNE       L__shamsi_to_milady723
	LDI        R16, 255
L__shamsi_to_milady723:
	MOV        R18, R17
	AND        R18, R16
	LDI        R17, 0
	AND        R16, R19
	AND        R17, R20
	CPI        R17, 0
	BRNE       L__shamsi_to_milady724
	CPI        R16, 0
L__shamsi_to_milady724:
	LDI        R27, 0
	BRNE       L__shamsi_to_milady725
	LDI        R27, 255
L__shamsi_to_milady725:
	MOV        R16, R27
	OR         R16, R18
	BRNE       L__shamsi_to_milady726
	JMP        L__shamsi_to_milady32
L__shamsi_to_milady726:
;MyProject.mbas,257 :: 		Mmonth_a[10] = Mmonth_a[10] + 1 '//Adding one day to Feb
	LDD        R16, Y+18
	SUBI       R16, 255
	STD        Y+18, R16
L__shamsi_to_milady32:
;MyProject.mbas,260 :: 		if((ShamsiMonth>=1)and( ShamsiMonth<=6))   then
	LDI        R16, 1
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	LDI        R18, 0
	BRLT       L__shamsi_to_milady727
	LDI        R18, 255
L__shamsi_to_milady727:
	LDI        R16, 6
	LDI        R17, 0
	CP         R16, R2
	CPC        R17, R3
	LDI        R27, 0
	BRLT       L__shamsi_to_milady728
	LDI        R27, 255
L__shamsi_to_milady728:
	MOV        R16, R27
	AND        R16, R18
	BRNE       L__shamsi_to_milady729
	JMP        L__shamsi_to_milady35
L__shamsi_to_milady729:
;MyProject.mbas,261 :: 		dayCount = ((ShamsiMonth-1) * 31) + ShamsiDay
	MOVW       R16, R2
	SUBI       R16, 1
	SBCI       R17, 0
	LDI        R20, 31
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	ADD        R16, R4
	ADC        R17, R5
; dayCount start address is: 18 (R18)
	MOVW       R18, R16
; dayCount end address is: 18 (R18)
	JMP        L__shamsi_to_milady36
;MyProject.mbas,262 :: 		else
L__shamsi_to_milady35:
;MyProject.mbas,263 :: 		dayCount =(6 * 31) + ((ShamsiMonth - 7) * 30) + ShamsiDay
	MOVW       R16, R2
	SUBI       R16, 7
	SBCI       R17, 0
	LDI        R20, 30
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	SUBI       R16, 70
	SBCI       R17, 255
	ADD        R16, R4
	ADC        R17, R5
; dayCount start address is: 18 (R18)
	MOVW       R18, R16
; dayCount end address is: 18 (R18)
;MyProject.mbas,264 :: 		end if
L__shamsi_to_milady36:
;MyProject.mbas,265 :: 		if (dayCount <= marchDayDiff) then '//So we are in 20(for leap year) or 21for none leap year) to 31 march
; dayCount start address is: 18 (R18)
	LDD        R16, Y+4
	LDD        R17, Y+5
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__shamsi_to_milady730
	JMP        L__shamsi_to_milady38
L__shamsi_to_milady730:
;MyProject.mbas,267 :: 		miladiDate_iDay = dayCount + (31 - marchDayDiff)
	LDD        R0, Y+4
	LDD        R1, Y+5
	LDI        R16, 31
	LDI        R17, 0
	SUB        R16, R0
	SBC        R17, R1
	ADD        R16, R18
	ADC        R17, R19
; dayCount end address is: 18 (R18)
	STS        _miladiDate_iDay+0, R16
	STS        _miladiDate_iDay+1, R17
;MyProject.mbas,268 :: 		miladiDate_iMonth = 3
	LDI        R27, 3
	STS        _miladiDate_iMonth+0, R27
	LDI        R27, 0
	STS        _miladiDate_iMonth+1, R27
;MyProject.mbas,269 :: 		miladiDate_iYear=miladiYear
	LDD        R16, Y+2
	LDD        R17, Y+3
	STS        _miladiDate_iYear+0, R16
	STS        _miladiDate_iYear+1, R17
	JMP        L__shamsi_to_milady39
;MyProject.mbas,271 :: 		else
L__shamsi_to_milady38:
;MyProject.mbas,272 :: 		remainDay = dayCount - marchDayDiff
; dayCount start address is: 18 (R18)
	LDD        R0, Y+4
	LDD        R1, Y+5
	MOVW       R16, R18
	SUB        R16, R0
	SBC        R17, R1
; dayCount end address is: 18 (R18)
	STD        Y+6, R16
	STD        Y+7, R17
;MyProject.mbas,273 :: 		end if
L__shamsi_to_milady39:
;MyProject.mbas,274 :: 		i = 0  ' //starting from April
; i start address is: 20 (R20)
	LDI        R20, 0
	LDI        R21, 0
; i end address is: 20 (R20)
;MyProject.mbas,276 :: 		while ((remainDay > Mmonth_a[i]))
L__shamsi_to_milady41:
; i start address is: 20 (R20)
	MOVW       R16, R28
	SUBI       R16, 248
	SBCI       R17, 255
	MOVW       R30, R20
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	LDD        R18, Y+6
	LDD        R19, Y+7
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__shamsi_to_milady731
	JMP        L__shamsi_to_milady42
L__shamsi_to_milady731:
;MyProject.mbas,278 :: 		remainDay = remainDay - Mmonth_a[i]
	MOVW       R16, R28
	SUBI       R16, 248
	SBCI       R17, 255
	MOVW       R30, R20
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	MOV        R0, R16
	LDI        R27, 0
	MOV        R1, R27
	LDD        R16, Y+6
	LDD        R17, Y+7
	SUB        R16, R0
	SBC        R17, R1
	STD        Y+6, R16
	STD        Y+7, R17
;MyProject.mbas,279 :: 		i=i+1
	MOVW       R16, R20
	SUBI       R16, 255
	SBCI       R17, 255
; i end address is: 20 (R20)
; i start address is: 22 (R22)
	MOVW       R22, R16
;MyProject.mbas,281 :: 		wend
	MOVW       R20, R22
; i end address is: 22 (R22)
	JMP        L__shamsi_to_milady41
L__shamsi_to_milady42:
;MyProject.mbas,282 :: 		miladiDate_iDay = remainDay
; i start address is: 20 (R20)
	LDD        R16, Y+6
	LDD        R17, Y+7
	STS        _miladiDate_iDay+0, R16
	STS        _miladiDate_iDay+1, R17
;MyProject.mbas,284 :: 		if (i > 8)  then '// We are in the next Miladi Year
	LDI        R16, 8
	LDI        R17, 0
	CP         R16, R20
	CPC        R17, R21
	BRLT       L__shamsi_to_milady732
	JMP        L__shamsi_to_milady46
L__shamsi_to_milady732:
;MyProject.mbas,286 :: 		miladiDate_iMonth = i - 8
	MOVW       R16, R20
	SUBI       R16, 8
	SBCI       R17, 0
; i end address is: 20 (R20)
	STS        _miladiDate_iMonth+0, R16
	STS        _miladiDate_iMonth+1, R17
;MyProject.mbas,287 :: 		miladiDate_iYear =  miladiYear + 1
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _miladiDate_iYear+0, R16
	STS        _miladiDate_iYear+1, R17
	JMP        L__shamsi_to_milady47
;MyProject.mbas,289 :: 		else
L__shamsi_to_milady46:
;MyProject.mbas,291 :: 		miladiDate_iMonth = i + 4
; i start address is: 20 (R20)
	MOVW       R16, R20
	SUBI       R16, 252
	SBCI       R17, 255
; i end address is: 20 (R20)
	STS        _miladiDate_iMonth+0, R16
	STS        _miladiDate_iMonth+1, R17
;MyProject.mbas,292 :: 		miladiDate_iYear =  miladiYear
	LDD        R16, Y+2
	LDD        R17, Y+3
	STS        _miladiDate_iYear+0, R16
	STS        _miladiDate_iYear+1, R17
;MyProject.mbas,293 :: 		end if
L__shamsi_to_milady47:
;MyProject.mbas,296 :: 		end sub
L_end_shamsi_to_milady:
	ADIW       R28, 19
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _shamsi_to_milady

_shamsi:

;MyProject.mbas,300 :: 		sub procedure shamsi()
;MyProject.mbas,304 :: 		Gmonth_a[0] = 31
	LDI        R27, 31
	STS        _Gmonth_a+0, R27
;MyProject.mbas,305 :: 		Gmonth_a[1] = 28
	LDI        R27, 28
	STS        _Gmonth_a+1, R27
;MyProject.mbas,306 :: 		Gmonth_a[2] = 31
	LDI        R27, 31
	STS        _Gmonth_a+2, R27
;MyProject.mbas,307 :: 		Gmonth_a[3] = 30
	LDI        R27, 30
	STS        _Gmonth_a+3, R27
;MyProject.mbas,308 :: 		Gmonth_a[4] = 31
	LDI        R27, 31
	STS        _Gmonth_a+4, R27
;MyProject.mbas,309 :: 		Gmonth_a[5] = 30
	LDI        R27, 30
	STS        _Gmonth_a+5, R27
;MyProject.mbas,310 :: 		Gmonth_a[6] = 31
	LDI        R27, 31
	STS        _Gmonth_a+6, R27
;MyProject.mbas,311 :: 		Gmonth_a[7] = 31
	LDI        R27, 31
	STS        _Gmonth_a+7, R27
;MyProject.mbas,312 :: 		Gmonth_a[8] = 30
	LDI        R27, 30
	STS        _Gmonth_a+8, R27
;MyProject.mbas,313 :: 		Gmonth_a[9] = 31
	LDI        R27, 31
	STS        _Gmonth_a+9, R27
;MyProject.mbas,314 :: 		Gmonth_a[10] = 30
	LDI        R27, 30
	STS        _Gmonth_a+10, R27
;MyProject.mbas,315 :: 		Gmonth_a[11] = 31
	LDI        R27, 31
	STS        _Gmonth_a+11, R27
;MyProject.mbas,316 :: 		Gnumdayofyear = 365
	LDI        R27, 109
	STS        _Gnumdayofyear+0, R27
	LDI        R27, 1
	STS        _Gnumdayofyear+1, R27
;MyProject.mbas,317 :: 		Gdayofyear = 0
	LDI        R27, 0
	STS        _Gdayofyear+0, R27
	STS        _Gdayofyear+1, R27
;MyProject.mbas,318 :: 		Temp1 = Gyear Mod 4
	LDI        R20, 4
	LDI        R21, 0
	LDS        R16, _Gyear+0
	LDS        R17, _Gyear+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp1+0, R16
	STS        _Temp1+1, R17
;MyProject.mbas,319 :: 		Temp2 = Gyear Mod 100
	LDI        R20, 100
	LDI        R21, 0
	LDS        R16, _Gyear+0
	LDS        R17, _Gyear+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp2+0, R16
	STS        _Temp2+1, R17
;MyProject.mbas,320 :: 		Temp3 = Gyear Mod 400
	LDI        R20, 144
	LDI        R21, 1
	LDS        R16, _Gyear+0
	LDS        R17, _Gyear+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp3+0, R16
	STS        _Temp3+1, R17
;MyProject.mbas,321 :: 		Temp4 = Temp1 And Temp2
	LDS        R20, _Temp1+0
	LDS        R21, _Temp1+1
	LDS        R18, _Temp2+0
	LDS        R19, _Temp2+1
	AND        R18, R20
	AND        R19, R21
	STS        _Temp4+0, R18
	STS        _Temp4+1, R19
;MyProject.mbas,322 :: 		If (Temp4 <> 0) Or (Temp3 = 0) Then
	CPI        R19, 0
	BRNE       L__shamsi734
	CPI        R18, 0
L__shamsi734:
	LDI        R27, 0
	BREQ       L__shamsi735
	LDI        R27, 255
L__shamsi735:
	MOV        R18, R27
	CPI        R17, 0
	BRNE       L__shamsi736
	CPI        R16, 0
L__shamsi736:
	LDI        R27, 0
	BRNE       L__shamsi737
	LDI        R27, 255
L__shamsi737:
	MOV        R16, R27
	OR         R16, R18
	BRNE       L__shamsi738
	JMP        L__shamsi50
L__shamsi738:
;MyProject.mbas,324 :: 		Gmonth_a[1] = 28
	LDI        R27, 28
	STS        _Gmonth_a+1, R27
	JMP        L__shamsi51
;MyProject.mbas,325 :: 		Else
L__shamsi50:
;MyProject.mbas,326 :: 		Gmonth_a[1] = 29
	LDI        R27, 29
	STS        _Gmonth_a+1, R27
;MyProject.mbas,327 :: 		End If
L__shamsi51:
;MyProject.mbas,330 :: 		Gyear_ = Gyear - 1
	LDS        R16, _Gyear+0
	LDS        R17, _Gyear+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _Gyear_+0, R16
	STS        _Gyear_+1, R17
;MyProject.mbas,331 :: 		Temp1 = Gyear_ Mod 4
	LDI        R20, 4
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp1+0, R16
	STS        _Temp1+1, R17
;MyProject.mbas,332 :: 		Temp2 = Gyear_ Mod 100
	LDI        R20, 100
	LDI        R21, 0
	LDS        R16, _Gyear_+0
	LDS        R17, _Gyear_+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp2+0, R16
	STS        _Temp2+1, R17
;MyProject.mbas,333 :: 		Temp3 = Gyear_ Mod 400
	LDI        R20, 144
	LDI        R21, 1
	LDS        R16, _Gyear_+0
	LDS        R17, _Gyear_+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp3+0, R16
	STS        _Temp3+1, R17
;MyProject.mbas,334 :: 		Temp4 = Temp1 And Temp2
	LDS        R20, _Temp1+0
	LDS        R21, _Temp1+1
	LDS        R18, _Temp2+0
	LDS        R19, _Temp2+1
	AND        R18, R20
	AND        R19, R21
	STS        _Temp4+0, R18
	STS        _Temp4+1, R19
;MyProject.mbas,335 :: 		If (Temp4 <> 0) Or (Temp3 = 0) Then
	CPI        R19, 0
	BRNE       L__shamsi739
	CPI        R18, 0
L__shamsi739:
	LDI        R27, 0
	BREQ       L__shamsi740
	LDI        R27, 255
L__shamsi740:
	MOV        R18, R27
	CPI        R17, 0
	BRNE       L__shamsi741
	CPI        R16, 0
L__shamsi741:
	LDI        R27, 0
	BRNE       L__shamsi742
	LDI        R27, 255
L__shamsi742:
	MOV        R16, R27
	OR         R16, R18
	BRNE       L__shamsi743
	JMP        L__shamsi53
L__shamsi743:
;MyProject.mbas,336 :: 		Isleapyearp =0
	LDS        R27, _Isleapyearp+0
	CBR        R27, BitMask(_Isleapyearp+0)
	STS        _Isleapyearp+0, R27
	JMP        L__shamsi54
;MyProject.mbas,337 :: 		Else
L__shamsi53:
;MyProject.mbas,338 :: 		Isleapyearp=1
	LDS        R27, _Isleapyearp+0
	SBR        R27, BitMask(_Isleapyearp+0)
	STS        _Isleapyearp+0, R27
;MyProject.mbas,339 :: 		End If
L__shamsi54:
;MyProject.mbas,340 :: 		Temp1 = Gmonth - 1
	LDS        R16, _Gmonth+0
	LDS        R17, _Gmonth+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _Temp1+0, R16
	STS        _Temp1+1, R17
;MyProject.mbas,341 :: 		For Iloop = 1 To Temp1
	LDI        R27, 1
	STS        _Iloop+0, R27
L__shamsi55:
	LDS        R18, _Iloop+0
	LDS        R16, _Temp1+0
	LDS        R17, _Temp1+1
	CP         R16, R18
	LDI        R27, 0
	CPC        R17, R27
	BRGE       L__shamsi744
	JMP        L__shamsi59
L__shamsi744:
;MyProject.mbas,342 :: 		Gdayofyear = Gmonth_a[iloop-1] + Gdayofyear
	LDS        R18, _Iloop+0
	SUBI       R18, 1
	LDI        R16, #lo_addr(_Gmonth_a+0)
	LDI        R17, hi_addr(_Gmonth_a+0)
	MOV        R30, R18
	LDI        R31, 0
	ADD        R30, R16
	ADC        R31, R17
	LD         R18, Z
	LDS        R16, _Gdayofyear+0
	LDS        R17, _Gdayofyear+1
	ADD        R16, R18
	LDI        R27, 0
	ADC        R17, R27
	STS        _Gdayofyear+0, R16
	STS        _Gdayofyear+1, R17
;MyProject.mbas,343 :: 		Next   Iloop
	LDS        R16, _Iloop+0
	LDS        R18, _Temp1+0
	LDS        R19, _Temp1+1
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRNE       L__shamsi745
	JMP        L__shamsi59
L__shamsi745:
	LDS        R16, _Iloop+0
	SUBI       R16, 255
	STS        _Iloop+0, R16
	JMP        L__shamsi55
L__shamsi59:
;MyProject.mbas,344 :: 		Gdayofyear = Gday + Gdayofyear
	LDS        R18, _Gday+0
	LDS        R19, _Gday+1
	LDS        R16, _Gdayofyear+0
	LDS        R17, _Gdayofyear+1
	ADD        R18, R16
	ADC        R19, R17
	STS        _Gdayofyear+0, R18
	STS        _Gdayofyear+1, R19
;MyProject.mbas,345 :: 		If Gdayofyear > 79 Then
	LDI        R16, 79
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__shamsi746
	JMP        L__shamsi61
L__shamsi746:
;MyProject.mbas,346 :: 		Temp1 = Gdayofyear - 79
	LDS        R18, _Gdayofyear+0
	LDS        R19, _Gdayofyear+1
	SUBI       R18, 79
	SBCI       R19, 0
	STS        _Temp1+0, R18
	STS        _Temp1+1, R19
;MyProject.mbas,347 :: 		Jyear = Gyear - 621
	LDS        R16, _Gyear+0
	LDS        R17, _Gyear+1
	SUBI       R16, 109
	SBCI       R17, 2
	STS        _Jyear+0, R16
	STS        _Jyear+1, R17
;MyProject.mbas,348 :: 		If Temp1 < 186 Then
	LDI        R16, 186
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__shamsi747
	JMP        L__shamsi64
L__shamsi747:
;MyProject.mbas,349 :: 		Temp2 = Temp1 Mod 31
	LDI        R20, 31
	LDI        R21, 0
	LDS        R16, _Temp1+0
	LDS        R17, _Temp1+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp2+0, R16
	STS        _Temp2+1, R17
;MyProject.mbas,350 :: 		Temp3 = Temp1 / 31
	LDI        R20, 31
	LDI        R21, 0
	LDS        R16, _Temp1+0
	LDS        R17, _Temp1+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _Temp3+0, R16
	STS        _Temp3+1, R17
;MyProject.mbas,351 :: 		If Temp2 = 0 Then
	LDS        R16, _Temp2+0
	LDS        R17, _Temp2+1
	CPI        R17, 0
	BRNE       L__shamsi748
	CPI        R16, 0
L__shamsi748:
	BREQ       L__shamsi749
	JMP        L__shamsi67
L__shamsi749:
;MyProject.mbas,352 :: 		Jmonth = Temp3
	LDS        R16, _Temp3+0
	LDS        R17, _Temp3+1
	STS        _Jmonth+0, R16
	STS        _Jmonth+1, R17
;MyProject.mbas,353 :: 		Jday = 31
	LDI        R27, 31
	STS        _Jday+0, R27
	LDI        R27, 0
	STS        _Jday+1, R27
	JMP        L__shamsi68
;MyProject.mbas,354 :: 		Else
L__shamsi67:
;MyProject.mbas,355 :: 		Jmonth = Temp3 + 1
	LDS        R16, _Temp3+0
	LDS        R17, _Temp3+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Jmonth+0, R16
	STS        _Jmonth+1, R17
;MyProject.mbas,356 :: 		Jday = Temp2
	LDS        R16, _Temp2+0
	LDS        R17, _Temp2+1
	STS        _Jday+0, R16
	STS        _Jday+1, R17
;MyProject.mbas,357 :: 		End If
L__shamsi68:
	JMP        L__shamsi65
;MyProject.mbas,358 :: 		Else
L__shamsi64:
;MyProject.mbas,359 :: 		Temp2 = Temp1 - 186
	LDS        R16, _Temp1+0
	LDS        R17, _Temp1+1
	SUBI       R16, 186
	SBCI       R17, 0
	STS        _Temp2+0, R16
	STS        _Temp2+1, R17
;MyProject.mbas,360 :: 		Temp3 = Temp2 Mod 30
	LDI        R20, 30
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp3+0, R16
	STS        _Temp3+1, R17
;MyProject.mbas,361 :: 		Temp4 = Temp2 / 30
	LDI        R20, 30
	LDI        R21, 0
	LDS        R16, _Temp2+0
	LDS        R17, _Temp2+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _Temp4+0, R16
	STS        _Temp4+1, R17
;MyProject.mbas,362 :: 		If Temp3 = 0 Then
	LDS        R16, _Temp3+0
	LDS        R17, _Temp3+1
	CPI        R17, 0
	BRNE       L__shamsi750
	CPI        R16, 0
L__shamsi750:
	BREQ       L__shamsi751
	JMP        L__shamsi70
L__shamsi751:
;MyProject.mbas,363 :: 		Jmonth = Temp4 + 6
	LDS        R16, _Temp4+0
	LDS        R17, _Temp4+1
	SUBI       R16, 250
	SBCI       R17, 255
	STS        _Jmonth+0, R16
	STS        _Jmonth+1, R17
;MyProject.mbas,364 :: 		Jday = 30
	LDI        R27, 30
	STS        _Jday+0, R27
	LDI        R27, 0
	STS        _Jday+1, R27
	JMP        L__shamsi71
;MyProject.mbas,365 :: 		Else
L__shamsi70:
;MyProject.mbas,366 :: 		Jmonth = Temp4 + 7
	LDS        R16, _Temp4+0
	LDS        R17, _Temp4+1
	SUBI       R16, 249
	SBCI       R17, 255
	STS        _Jmonth+0, R16
	STS        _Jmonth+1, R17
;MyProject.mbas,367 :: 		Jday = Temp3
	LDS        R16, _Temp3+0
	LDS        R17, _Temp3+1
	STS        _Jday+0, R16
	STS        _Jday+1, R17
;MyProject.mbas,368 :: 		End If
L__shamsi71:
;MyProject.mbas,369 :: 		End If
L__shamsi65:
	JMP        L__shamsi62
;MyProject.mbas,370 :: 		Else
L__shamsi61:
;MyProject.mbas,371 :: 		Jyear = Gyear - 622
	LDS        R16, _Gyear+0
	LDS        R17, _Gyear+1
	SUBI       R16, 110
	SBCI       R17, 2
	STS        _Jyear+0, R16
	STS        _Jyear+1, R17
;MyProject.mbas,372 :: 		If Isleapyearp  Then
	LDS        R27, _Isleapyearp+0
	SBRS       R27, BitPos(_Isleapyearp+0)
	JMP        L__shamsi73
;MyProject.mbas,373 :: 		Gdayofyear = Gdayofyear + 11
	LDS        R16, _Gdayofyear+0
	LDS        R17, _Gdayofyear+1
	SUBI       R16, 245
	SBCI       R17, 255
	STS        _Gdayofyear+0, R16
	STS        _Gdayofyear+1, R17
	JMP        L__shamsi74
;MyProject.mbas,374 :: 		Else
L__shamsi73:
;MyProject.mbas,375 :: 		Gdayofyear = Gdayofyear + 10
	LDS        R16, _Gdayofyear+0
	LDS        R17, _Gdayofyear+1
	SUBI       R16, 246
	SBCI       R17, 255
	STS        _Gdayofyear+0, R16
	STS        _Gdayofyear+1, R17
;MyProject.mbas,376 :: 		End If
L__shamsi74:
;MyProject.mbas,377 :: 		Temp2 = Gdayofyear Mod 30
	LDI        R20, 30
	LDI        R21, 0
	LDS        R16, _Gdayofyear+0
	LDS        R17, _Gdayofyear+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _Temp2+0, R16
	STS        _Temp2+1, R17
;MyProject.mbas,378 :: 		Temp3 = Gdayofyear / 30
	LDI        R20, 30
	LDI        R21, 0
	LDS        R16, _Gdayofyear+0
	LDS        R17, _Gdayofyear+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _Temp3+0, R16
	STS        _Temp3+1, R17
;MyProject.mbas,379 :: 		If Temp2 = 0 Then
	LDS        R16, _Temp2+0
	LDS        R17, _Temp2+1
	CPI        R17, 0
	BRNE       L__shamsi752
	CPI        R16, 0
L__shamsi752:
	BREQ       L__shamsi753
	JMP        L__shamsi76
L__shamsi753:
;MyProject.mbas,380 :: 		Jmonth = Temp3 + 9
	LDS        R16, _Temp3+0
	LDS        R17, _Temp3+1
	SUBI       R16, 247
	SBCI       R17, 255
	STS        _Jmonth+0, R16
	STS        _Jmonth+1, R17
;MyProject.mbas,381 :: 		Jday = 30
	LDI        R27, 30
	STS        _Jday+0, R27
	LDI        R27, 0
	STS        _Jday+1, R27
	JMP        L__shamsi77
;MyProject.mbas,382 :: 		Else
L__shamsi76:
;MyProject.mbas,383 :: 		Jmonth = Temp3 + 10
	LDS        R16, _Temp3+0
	LDS        R17, _Temp3+1
	SUBI       R16, 246
	SBCI       R17, 255
	STS        _Jmonth+0, R16
	STS        _Jmonth+1, R17
;MyProject.mbas,384 :: 		Jday = Temp2
	LDS        R16, _Temp2+0
	LDS        R17, _Temp2+1
	STS        _Jday+0, R16
	STS        _Jday+1, R17
;MyProject.mbas,385 :: 		End If
L__shamsi77:
;MyProject.mbas,386 :: 		Delay_ms(1)
	LDI        R17, 11
	LDI        R16, 99
L__shamsi78:
	DEC        R16
	BRNE       L__shamsi78
	DEC        R17
	BRNE       L__shamsi78
;MyProject.mbas,387 :: 		End If
L__shamsi62:
;MyProject.mbas,389 :: 		end sub
L_end_shamsi:
	RET
; end of _shamsi

_miladi_call:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	ADIW       R28, 5

;MyProject.mbas,390 :: 		sub procedure miladi_call(dim jjmonth,jjday,jjyear,jweek,jhours ,jminutes,jseconds as integer)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDD        R16, Y+0
	LDD        R17, Y+1
	STD        Y+0, R16
	STD        Y+1, R17
	LDD        R16, Y+2
	LDD        R17, Y+3
	STD        Y+2, R16
	STD        Y+3, R17
	LDD        R16, Y+4
	LDD        R17, Y+5
	STD        Y+4, R16
	STD        Y+5, R17
;MyProject.mbas,393 :: 		Lcd_0()
	PUSH       R9
	PUSH       R8
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;MyProject.mbas,394 :: 		shamsi_to_milady( jjmonth, jjday, jJyear )
	CALL       _shamsi_to_milady+0
	POP        R8
	POP        R9
;MyProject.mbas,396 :: 		case 1
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__miladi_call755
	LDI        R27, 1
	CP         R8, R27
L__miladi_call755:
	BREQ       L__miladi_call756
	JMP        L__miladi_call84
L__miladi_call756:
;MyProject.mbas,397 :: 		txt = "Sun"
	LDI        R27, 83
	STS        _txt+0, R27
	LDI        R27, 117
	STS        _txt+1, R27
	LDI        R27, 110
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__miladi_call81
L__miladi_call84:
;MyProject.mbas,398 :: 		case 2
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__miladi_call757
	LDI        R27, 2
	CP         R8, R27
L__miladi_call757:
	BREQ       L__miladi_call758
	JMP        L__miladi_call87
L__miladi_call758:
;MyProject.mbas,399 :: 		txt = "Mon"
	LDI        R27, 77
	STS        _txt+0, R27
	LDI        R27, 111
	STS        _txt+1, R27
	LDI        R27, 110
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__miladi_call81
L__miladi_call87:
;MyProject.mbas,400 :: 		case 3
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__miladi_call759
	LDI        R27, 3
	CP         R8, R27
L__miladi_call759:
	BREQ       L__miladi_call760
	JMP        L__miladi_call90
L__miladi_call760:
;MyProject.mbas,401 :: 		txt = "Tue"
	LDI        R27, 84
	STS        _txt+0, R27
	LDI        R27, 117
	STS        _txt+1, R27
	LDI        R27, 101
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__miladi_call81
L__miladi_call90:
;MyProject.mbas,402 :: 		case 4
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__miladi_call761
	LDI        R27, 4
	CP         R8, R27
L__miladi_call761:
	BREQ       L__miladi_call762
	JMP        L__miladi_call93
L__miladi_call762:
;MyProject.mbas,403 :: 		txt = "Wed"
	LDI        R27, 87
	STS        _txt+0, R27
	LDI        R27, 101
	STS        _txt+1, R27
	LDI        R27, 100
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__miladi_call81
L__miladi_call93:
;MyProject.mbas,404 :: 		case 5
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__miladi_call763
	LDI        R27, 5
	CP         R8, R27
L__miladi_call763:
	BREQ       L__miladi_call764
	JMP        L__miladi_call96
L__miladi_call764:
;MyProject.mbas,405 :: 		txt = "Thu"
	LDI        R27, 84
	STS        _txt+0, R27
	LDI        R27, 104
	STS        _txt+1, R27
	LDI        R27, 117
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__miladi_call81
L__miladi_call96:
;MyProject.mbas,406 :: 		case 6
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__miladi_call765
	LDI        R27, 6
	CP         R8, R27
L__miladi_call765:
	BREQ       L__miladi_call766
	JMP        L__miladi_call99
L__miladi_call766:
;MyProject.mbas,407 :: 		txt = "Fri"
	LDI        R27, 70
	STS        _txt+0, R27
	LDI        R27, 114
	STS        _txt+1, R27
	LDI        R27, 105
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__miladi_call81
L__miladi_call99:
;MyProject.mbas,408 :: 		case 7
	LDI        R27, 0
	CP         R9, R27
	BRNE       L__miladi_call767
	LDI        R27, 7
	CP         R8, R27
L__miladi_call767:
	BREQ       L__miladi_call768
	JMP        L__miladi_call102
L__miladi_call768:
;MyProject.mbas,409 :: 		txt = "Sat"
	LDI        R27, 83
	STS        _txt+0, R27
	LDI        R27, 97
	STS        _txt+1, R27
	LDI        R27, 116
	STS        _txt+2, R27
	LDI        R27, 0
	STS        _txt+3, R27
	JMP        L__miladi_call81
L__miladi_call102:
L__miladi_call81:
;MyProject.mbas,412 :: 		LCD_Out(1,1, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,413 :: 		Lcd_Chr(1, 6, (miladiDate_iDay div 10)   + 48)    ' Print tens digit of day variable
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _miladiDate_iDay+0
	LDS        R17, _miladiDate_iDay+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,414 :: 		Lcd_Chr(1, 7, (miladiDate_iDay mod 10)   + 48)    ' Print oness digit of day variable
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _miladiDate_iDay+0
	LDS        R17, _miladiDate_iDay+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,415 :: 		Lcd_Chr(1, 9, (miladiDate_iMonth div 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _miladiDate_iMonth+0
	LDS        R17, _miladiDate_iMonth+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,416 :: 		Lcd_Chr(1,10, (miladiDate_iMonth mod 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _miladiDate_iMonth+0
	LDS        R17, _miladiDate_iMonth+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,417 :: 		Lcd_Chr(1,12, (miladiDate_iYear div 1000)  + 48)
	LDI        R20, 232
	LDI        R21, 3
	LDS        R16, _miladiDate_iYear+0
	LDS        R17, _miladiDate_iYear+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 12
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,418 :: 		Lcd_Chr(1,13, ((miladiDate_iYear mod 1000)div 100)  + 48)
	LDI        R20, 232
	LDI        R21, 3
	LDS        R16, _miladiDate_iYear+0
	LDS        R17, _miladiDate_iYear+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R20, 100
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,419 :: 		Lcd_Chr(1,14, (((miladiDate_iYear mod 1000)mod 100) div 10)  + 48)
	LDI        R20, 232
	LDI        R21, 3
	LDS        R16, _miladiDate_iYear+0
	LDS        R17, _miladiDate_iYear+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R20, 100
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 14
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,420 :: 		Lcd_Chr(1,15, (((miladiDate_iYear mod 1000)mod 100) mod 10)  + 48)
	LDI        R20, 232
	LDI        R21, 3
	LDS        R16, _miladiDate_iYear+0
	LDS        R17, _miladiDate_iYear+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R20, 100
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 15
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,422 :: 		Lcd_Chr(2, 6, (jhours div 10)   + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,423 :: 		Lcd_Chr(2, 7, (jhours mod 10)   + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,424 :: 		Lcd_Chr(2, 9, (jminutes div 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+2
	LDD        R17, Y+3
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,425 :: 		Lcd_Chr(2,10, (jminutes mod 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+2
	LDD        R17, Y+3
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,426 :: 		Lcd_Chr(2,12, (jseconds div 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+4
	LDD        R17, Y+5
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 12
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,427 :: 		Lcd_Chr(2,13, (jseconds mod 10) + 48)
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+4
	LDD        R17, Y+5
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,429 :: 		Delay_mS(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__miladi_call103:
	DEC        R16
	BRNE       L__miladi_call103
	DEC        R17
	BRNE       L__miladi_call103
	DEC        R18
	BRNE       L__miladi_call103
;MyProject.mbas,430 :: 		end sub
L_end_miladi_call:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	POP        R29
	POP        R28
	RET
; end of _miladi_call

_Shamsi_call:

;MyProject.mbas,434 :: 		sub procedure Shamsi_call()
;MyProject.mbas,437 :: 		Shamsi_transfer_time()
	PUSH       R2
	CALL       _Shamsi_transfer_time+0
;MyProject.mbas,439 :: 		Gyear =  Year+2000
	LDS        R16, _year+0
	LDI        R17, 0
	SUBI       R16, 48
	SBCI       R17, 248
	STS        _Gyear+0, R16
	STS        _Gyear+1, R17
;MyProject.mbas,440 :: 		Gday = Day
	LDS        R16, _day+0
	STS        _Gday+0, R16
	LDI        R27, 0
	STS        _Gday+1, R27
;MyProject.mbas,441 :: 		Gmonth = Month
	LDS        R16, _month+0
	STS        _Gmonth+0, R16
	LDI        R27, 0
	STS        _Gmonth+1, R27
;MyProject.mbas,443 :: 		shamsi()
	CALL       _shamsi+0
;MyProject.mbas,449 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Prepare and output static text on LCD
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,458 :: 		end sub
L_end_Shamsi_call:
	POP        R2
	RET
; end of _Shamsi_call

_eeprom_call_back:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 8
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,461 :: 		dim counter,on_off22 as integer
;MyProject.mbas,465 :: 		counter=0
	PUSH       R2
	PUSH       R3
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
;MyProject.mbas,466 :: 		for week =2to 2
	LDI        R27, 2
	STS        _week+0, R27
L__eeprom_call_back108:
;MyProject.mbas,467 :: 		for Pwm_chanel=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
L__eeprom_call_back113:
;MyProject.mbas,468 :: 		for chanel =1 to 3
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__eeprom_call_back118:
;MyProject.mbas,469 :: 		for on_off22=1 to 2
	LDI        R27, 1
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
L__eeprom_call_back123:
;MyProject.mbas,471 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][0]=  EEPROM_read(0x01 + counter)
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
	STD        Y+6, R16
	STD        Y+7, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+6
	LDD        R19, Y+7
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
	STD        Y+6, R16
	STD        Y+7, R17
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDD        R17, Y+6
	LDD        R18, Y+7
	MOV        R30, R17
	MOV        R31, R18
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,472 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][1]=  EEPROM_read(0x02 + counter)
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
	STD        Y+6, R16
	STD        Y+7, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+6
	LDD        R19, Y+7
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
	SUBI       R16, 254
	SBCI       R17, 255
	STD        Y+6, R16
	STD        Y+7, R17
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDD        R17, Y+6
	LDD        R18, Y+7
	MOV        R30, R17
	MOV        R31, R18
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,473 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][2]=  EEPROM_read(0x03 + counter)
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
	STD        Y+6, R16
	STD        Y+7, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+6
	LDD        R19, Y+7
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
	SUBI       R16, 252
	SBCI       R17, 255
	STD        Y+6, R16
	STD        Y+7, R17
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 253
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDD        R17, Y+6
	LDD        R18, Y+7
	MOV        R30, R17
	MOV        R31, R18
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,474 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][3]=  EEPROM_read(0x04 + counter)
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
	STD        Y+6, R16
	STD        Y+7, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+6
	LDD        R19, Y+7
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
	SUBI       R16, 250
	SBCI       R17, 255
	STD        Y+6, R16
	STD        Y+7, R17
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 252
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDD        R17, Y+6
	LDD        R18, Y+7
	MOV        R30, R17
	MOV        R31, R18
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,476 :: 		counter=counter+4
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 252
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,478 :: 		next on_off2
	LDD        R16, Y+2
	LDD        R17, Y+3
	CPI        R17, 0
	BRNE       L__eeprom_call_back771
	CPI        R16, 2
L__eeprom_call_back771:
	BRNE       L__eeprom_call_back772
	JMP        L__eeprom_call_back126
L__eeprom_call_back772:
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	JMP        L__eeprom_call_back123
L__eeprom_call_back126:
;MyProject.mbas,479 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_call_back773
	CPI        R16, 3
L__eeprom_call_back773:
	BRNE       L__eeprom_call_back774
	JMP        L__eeprom_call_back121
L__eeprom_call_back774:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__eeprom_call_back118
L__eeprom_call_back121:
;MyProject.mbas,480 :: 		next pwm_chanel
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_call_back775
	CPI        R16, 7
L__eeprom_call_back775:
	BRNE       L__eeprom_call_back776
	JMP        L__eeprom_call_back116
L__eeprom_call_back776:
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__eeprom_call_back113
L__eeprom_call_back116:
;MyProject.mbas,481 :: 		next week
	LDS        R16, _week+0
	CPI        R16, 2
	BRNE       L__eeprom_call_back777
	JMP        L__eeprom_call_back111
L__eeprom_call_back777:
	LDS        R16, _week+0
	SUBI       R16, 255
	STS        _week+0, R16
	JMP        L__eeprom_call_back108
L__eeprom_call_back111:
;MyProject.mbas,486 :: 		end sub
L_end_eeprom_call_back:
	POP        R3
	POP        R2
	ADIW       R28, 7
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_call_back

_eeprom_save:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 12
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,490 :: 		dim counter,on_off22 as integer
;MyProject.mbas,494 :: 		counter=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
;MyProject.mbas,495 :: 		for week =2to 2
	LDI        R27, 2
	STS        _week+0, R27
L__eeprom_save129:
;MyProject.mbas,496 :: 		for Pwm_chanel=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
L__eeprom_save134:
;MyProject.mbas,497 :: 		for chanel =1 to 3
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__eeprom_save139:
;MyProject.mbas,498 :: 		for on_off22=1 to 2
	LDI        R27, 1
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
L__eeprom_save144:
;MyProject.mbas,501 :: 		EEPROM_Write(0x01 + counter,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][0] )
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+10, R16
	STD        Y+11, R17
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
	STD        Y+8, R16
	STD        Y+9, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+8
	LDD        R19, Y+9
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
	LD         R18, Z
	LDD        R16, Y+10
	LDD        R17, Y+11
	MOV        R4, R18
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;MyProject.mbas,502 :: 		EEPROM_Write(0x01 + counter+1,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][1] )
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+10, R16
	STD        Y+11, R17
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
	STD        Y+8, R16
	STD        Y+9, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+8
	LDD        R19, Y+9
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
	LD         R18, Z
	LDD        R16, Y+10
	LDD        R17, Y+11
	MOV        R4, R18
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;MyProject.mbas,503 :: 		EEPROM_Write(0x01 + counter+2,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][2] )
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	SUBI       R16, 254
	SBCI       R17, 255
	STD        Y+10, R16
	STD        Y+11, R17
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
	STD        Y+8, R16
	STD        Y+9, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+8
	LDD        R19, Y+9
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
	LD         R18, Z
	LDD        R16, Y+10
	LDD        R17, Y+11
	MOV        R4, R18
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;MyProject.mbas,504 :: 		EEPROM_Write(0x01 + counter+3,on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][3] )
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	SUBI       R16, 253
	SBCI       R17, 255
	STD        Y+10, R16
	STD        Y+11, R17
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
	STD        Y+8, R16
	STD        Y+9, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+8
	LDD        R19, Y+9
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
	LD         R18, Z
	LDD        R16, Y+10
	LDD        R17, Y+11
	MOV        R4, R18
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;MyProject.mbas,505 :: 		counter=counter+4
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 252
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,507 :: 		next on_off2
	LDD        R16, Y+2
	LDD        R17, Y+3
	CPI        R17, 0
	BRNE       L__eeprom_save779
	CPI        R16, 2
L__eeprom_save779:
	BRNE       L__eeprom_save780
	JMP        L__eeprom_save147
L__eeprom_save780:
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
	JMP        L__eeprom_save144
L__eeprom_save147:
;MyProject.mbas,508 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_save781
	CPI        R16, 3
L__eeprom_save781:
	BRNE       L__eeprom_save782
	JMP        L__eeprom_save142
L__eeprom_save782:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__eeprom_save139
L__eeprom_save142:
;MyProject.mbas,509 :: 		next pwm_chanel
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	CPI        R17, 0
	BRNE       L__eeprom_save783
	CPI        R16, 7
L__eeprom_save783:
	BRNE       L__eeprom_save784
	JMP        L__eeprom_save137
L__eeprom_save784:
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__eeprom_save134
L__eeprom_save137:
;MyProject.mbas,510 :: 		next week
	LDS        R16, _week+0
	CPI        R16, 2
	BRNE       L__eeprom_save785
	JMP        L__eeprom_save132
L__eeprom_save785:
	LDS        R16, _week+0
	SUBI       R16, 255
	STS        _week+0, R16
	JMP        L__eeprom_save129
L__eeprom_save132:
;MyProject.mbas,515 :: 		end sub
L_end_eeprom_save:
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 11
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _eeprom_save

_Keypad_set__date_time_import:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 18
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,519 :: 		sub procedure Keypad_set__date_time_import(dim var_in as integer, dim p_max as  integer, dim p_min as  integer )
;MyProject.mbas,522 :: 		while_state_import=1
	LDS        R27, _while_state_import+0
	SBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,523 :: 		oldstate_2=0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,524 :: 		while  (while_state_import )
L__Keypad_set__date_time_import150:
	LDS        R27, _while_state_import+0
	SBRS       R27, BitPos(_while_state_import+0)
	JMP        L__Keypad_set__date_time_import151
;MyProject.mbas,525 :: 		if (Button(PORTA, 5, 0.1, 0)) then    ' Detect logical one up key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 5
	MOV        R4, R27
	LDI        R27, #lo_addr(PORTA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PORTA+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	TST        R16
	BRNE       L__Keypad_set__date_time_import787
	JMP        L__Keypad_set__date_time_import155
L__Keypad_set__date_time_import787:
;MyProject.mbas,526 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__Keypad_set__date_time_import155:
;MyProject.mbas,528 :: 		if (oldstate_3 and Button(PINA, 5,0.1, 1)) then
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 5
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_set__date_time_import788
	JMP        L__Keypad_set__date_time_import158
L__Keypad_set__date_time_import788:
;MyProject.mbas,529 :: 		if (var_in=p_max) then
	CP         R2, R4
	CPC        R3, R5
	BREQ       L__Keypad_set__date_time_import789
	JMP        L__Keypad_set__date_time_import161
L__Keypad_set__date_time_import789:
;MyProject.mbas,530 :: 		var_in=p_min
	MOVW       R2, R6
	JMP        L__Keypad_set__date_time_import162
;MyProject.mbas,531 :: 		else
L__Keypad_set__date_time_import161:
;MyProject.mbas,532 :: 		var_in=var_in+1
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,533 :: 		end if
L__Keypad_set__date_time_import162:
;MyProject.mbas,534 :: 		Lcd_0()
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
;MyProject.mbas,535 :: 		inttostr(var_in,txt)
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,536 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,537 :: 		LCD_Out(2,5, "Value : ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;MyProject.mbas,538 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_set__date_time_import163:
	DEC        R16
	BRNE       L__Keypad_set__date_time_import163
	DEC        R17
	BRNE       L__Keypad_set__date_time_import163
	DEC        R18
	BRNE       L__Keypad_set__date_time_import163
L__Keypad_set__date_time_import158:
;MyProject.mbas,541 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,543 :: 		if (Button(PORTA, 4, 0.1, 0)) then    ' Detect logical one Down key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PORTA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PORTA+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	TST        R16
	BRNE       L__Keypad_set__date_time_import790
	JMP        L__Keypad_set__date_time_import166
L__Keypad_set__date_time_import790:
;MyProject.mbas,544 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__Keypad_set__date_time_import166:
;MyProject.mbas,546 :: 		if (oldstate_3 and Button(PINA, 4,0.1, 1)) then
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_set__date_time_import791
	JMP        L__Keypad_set__date_time_import169
L__Keypad_set__date_time_import791:
;MyProject.mbas,547 :: 		if (var_in=p_min) then
	CP         R2, R6
	CPC        R3, R7
	BREQ       L__Keypad_set__date_time_import792
	JMP        L__Keypad_set__date_time_import172
L__Keypad_set__date_time_import792:
;MyProject.mbas,548 :: 		var_in=p_max
	MOVW       R2, R4
	JMP        L__Keypad_set__date_time_import173
;MyProject.mbas,549 :: 		else
L__Keypad_set__date_time_import172:
;MyProject.mbas,550 :: 		var_in=var_in-1
	MOVW       R16, R2
	SUBI       R16, 1
	SBCI       R17, 0
	MOVW       R2, R16
;MyProject.mbas,551 :: 		end if
L__Keypad_set__date_time_import173:
;MyProject.mbas,552 :: 		Lcd_0()
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
;MyProject.mbas,553 :: 		inttostr(var_in,txt)
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,554 :: 		LCD_Out(2,11, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,555 :: 		LCD_Out(2,5, "Value : ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;MyProject.mbas,556 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_set__date_time_import174:
	DEC        R16
	BRNE       L__Keypad_set__date_time_import174
	DEC        R17
	BRNE       L__Keypad_set__date_time_import174
	DEC        R18
	BRNE       L__Keypad_set__date_time_import174
L__Keypad_set__date_time_import169:
;MyProject.mbas,559 :: 		var_in_global=var_in
	STS        _var_in_global+0, R2
	STS        _var_in_global+1, R3
;MyProject.mbas,561 :: 		if (Button(PIND, 0, 0.1, 0)<> 0) then    ' Detect logical one setting key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	CPI        R16, 0
	BRNE       L__Keypad_set__date_time_import793
	JMP        L__Keypad_set__date_time_import177
L__Keypad_set__date_time_import793:
;MyProject.mbas,562 :: 		oldstate_2 = 1                      ' Update flag
	LDS        R27, _oldstate_2+0
	SBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
L__Keypad_set__date_time_import177:
;MyProject.mbas,564 :: 		if (oldstate_2 and Button(PIND, 0,0.1, 1)) then
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	LDS        R0, _oldstate_2+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_2+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_set__date_time_import794
	JMP        L__Keypad_set__date_time_import180
L__Keypad_set__date_time_import794:
;MyProject.mbas,565 :: 		oldstate_2 = 0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,566 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,567 :: 		Lcd_0()
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;MyProject.mbas,568 :: 		LCD_Out(2,1, "Exit No save !!! ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 118
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 33
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
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;MyProject.mbas,569 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_set__date_time_import182:
	DEC        R16
	BRNE       L__Keypad_set__date_time_import182
	DEC        R17
	BRNE       L__Keypad_set__date_time_import182
	DEC        R18
	BRNE       L__Keypad_set__date_time_import182
L__Keypad_set__date_time_import180:
;MyProject.mbas,572 :: 		if (Button(PINA, 6, 0.1, 0)<> 0) then    ' Detect logical one setting key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R6
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	CPI        R16, 0
	BRNE       L__Keypad_set__date_time_import795
	JMP        L__Keypad_set__date_time_import185
L__Keypad_set__date_time_import795:
;MyProject.mbas,573 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__Keypad_set__date_time_import185:
;MyProject.mbas,575 :: 		if (while_state_import and oldstate_3 and Button(PINA, 6,0.1, 1)) then
	LDS        R1, _while_state_import+0
	LDS        R0, _oldstate_3+0
	CBR        R20, 1
	SBRC       R1, BitPos(_while_state_import+0)
	SBRS       R0, BitPos(_oldstate_3+0)
	RJMP       L__Keypad_set__date_time_import799
	SBR        R20, 1
L__Keypad_set__date_time_import799:
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	CLR        R17
	SBRC       R20, 0
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_set__date_time_import800
	JMP        L__Keypad_set__date_time_import188
L__Keypad_set__date_time_import800:
;MyProject.mbas,576 :: 		while_state_import=0
	LDS        R27, _while_state_import+0
	CBR        R27, BitMask(_while_state_import+0)
	STS        _while_state_import+0, R27
;MyProject.mbas,577 :: 		oldstate_3 = 0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,578 :: 		inttostr(var_in_global,txt)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _var_in_global+0
	LDS        R3, _var_in_global+1
	CALL       _IntToStr+0
;MyProject.mbas,579 :: 		LCD_Out(2,11, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,580 :: 		LCD_Out(2,5, "Value :")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;MyProject.mbas,581 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_set__date_time_import190:
	DEC        R16
	BRNE       L__Keypad_set__date_time_import190
	DEC        R17
	BRNE       L__Keypad_set__date_time_import190
	DEC        R18
	BRNE       L__Keypad_set__date_time_import190
L__Keypad_set__date_time_import188:
;MyProject.mbas,583 :: 		var_in_global= var_in
	STS        _var_in_global+0, R2
	STS        _var_in_global+1, R3
;MyProject.mbas,584 :: 		wend
	JMP        L__Keypad_set__date_time_import150
L__Keypad_set__date_time_import151:
;MyProject.mbas,585 :: 		end sub
L_end_Keypad_set__date_time_import:
	ADIW       R28, 17
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Keypad_set__date_time_import

_Keypad_set__date_time_import_lcd:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 8
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,588 :: 		sub procedure Keypad_set__date_time_import_lcd(dim var_in, p_max , p_min as  integer  )
;MyProject.mbas,590 :: 		Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;MyProject.mbas,592 :: 		k_set=94
	LDI        R27, 94
	STS        _k_set+0, R27
	LDI        R27, 0
	STS        _k_set+1, R27
;MyProject.mbas,593 :: 		inttostr(k_set,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 94
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,594 :: 		LCD_Out(2,2, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,598 :: 		LCD_Out(2,1, text_1)  ''Show on LCD
	LDI        R27, #lo_addr(_text_1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_text_1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,599 :: 		LCD_Out(2,8, "seting2")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,600 :: 		Lcd_Chr(2, 3, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;MyProject.mbas,601 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_set__date_time_import_lcd193:
	DEC        R16
	BRNE       L__Keypad_set__date_time_import_lcd193
	DEC        R17
	BRNE       L__Keypad_set__date_time_import_lcd193
	DEC        R18
	BRNE       L__Keypad_set__date_time_import_lcd193
;MyProject.mbas,602 :: 		Keypad_set__date_time_import(var_in,p_max,p_min)
	CALL       _Keypad_set__date_time_import+0
;MyProject.mbas,607 :: 		inttostr(var_in_global,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _var_in_global+0
	LDS        R3, _var_in_global+1
	CALL       _IntToStr+0
;MyProject.mbas,608 :: 		LCD_Out(2,2, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,609 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_set__date_time_import_lcd195:
	DEC        R16
	BRNE       L__Keypad_set__date_time_import_lcd195
	DEC        R17
	BRNE       L__Keypad_set__date_time_import_lcd195
	DEC        R18
	BRNE       L__Keypad_set__date_time_import_lcd195
;MyProject.mbas,615 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,618 :: 		inttostr(month,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _month+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,619 :: 		LCD_Out(1,2, "int2str")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,620 :: 		LCD_Out(1,6,text_1)  ''Show on LCD
	LDI        R27, #lo_addr(_text_1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_text_1+0)
	MOV        R5, R27
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,621 :: 		LCD_Out(2,2, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,632 :: 		k_set = 1  ' 1
	LDI        R27, 1
	STS        _k_set+0, R27
	LDI        R27, 0
	STS        _k_set+1, R27
;MyProject.mbas,633 :: 		end sub
L_end_Keypad_set__date_time_import_lcd:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 7
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Keypad_set__date_time_import_lcd

_Keypad_set__date_time:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 29
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,641 :: 		dim kp,ok,k_set,Ex as  integer
;MyProject.mbas,646 :: 		oldstate_2 = 0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDD        R27, Y+16
	CBR        R27, 2
	STD        Y+16, R27
;MyProject.mbas,647 :: 		oldstate_3 = 0
	LDD        R27, Y+16
	CBR        R27, 4
	STD        Y+16, R27
;MyProject.mbas,648 :: 		oldstate_menu = 0
	LDD        R27, Y+16
	CBR        R27, 8
	STD        Y+16, R27
;MyProject.mbas,649 :: 		while_state_2=1
	LDD        R27, Y+16
	SBR        R27, 1
	STD        Y+16, R27
;MyProject.mbas,650 :: 		k_set=0  ex=0
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
	LDI        R27, 0
	STD        Y+2, R27
	STD        Y+3, R27
;MyProject.mbas,651 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,653 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	LDI        R27, #lo_addr(_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,654 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;MyProject.mbas,656 :: 		while  (while_state_2 )
L__Keypad_set__date_time199:
	LDD        R27, Y+16
	SBRS       R27, 0
	JMP        L__Keypad_set__date_time200
;MyProject.mbas,657 :: 		LCD_Out(1,1, "while : ")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 4
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
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
;MyProject.mbas,658 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_set__date_time203:
	DEC        R16
	BRNE       L__Keypad_set__date_time203
	DEC        R17
	BRNE       L__Keypad_set__date_time203
	DEC        R18
	BRNE       L__Keypad_set__date_time203
;MyProject.mbas,659 :: 		if (Button(PIND, 0, 0.1, 0)<> 0) then    ' Detect logical one setting key
	CLR        R6
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_set__date_time803
	JMP        L__Keypad_set__date_time206
L__Keypad_set__date_time803:
;MyProject.mbas,660 :: 		oldstate_2 = 1                      ' Update flag
	LDD        R27, Y+16
	SBR        R27, 2
	STD        Y+16, R27
L__Keypad_set__date_time206:
;MyProject.mbas,662 :: 		if (oldstate_2 and Button(PIND, 0,0.1, 1)) then
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	LDD        R0, Y+16
	CLR        R17
	SBRC       R0, 1
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_set__date_time804
	JMP        L__Keypad_set__date_time209
L__Keypad_set__date_time804:
;MyProject.mbas,663 :: 		oldstate_2 = 0
	LDD        R27, Y+16
	CBR        R27, 2
	STD        Y+16, R27
;MyProject.mbas,664 :: 		oldstate_menu=1
	LDD        R27, Y+16
	SBR        R27, 8
	STD        Y+16, R27
;MyProject.mbas,665 :: 		k_set=k_set+1
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,666 :: 		if k_set=8  then
	CPI        R17, 0
	BRNE       L__Keypad_set__date_time805
	CPI        R16, 8
L__Keypad_set__date_time805:
	BREQ       L__Keypad_set__date_time806
	JMP        L__Keypad_set__date_time212
L__Keypad_set__date_time806:
;MyProject.mbas,667 :: 		k_set=1
	LDI        R27, 1
	STD        Y+0, R27
	LDI        R27, 0
	STD        Y+1, R27
L__Keypad_set__date_time212:
;MyProject.mbas,669 :: 		inttostr(k_set,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _IntToStr+0
;MyProject.mbas,670 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,671 :: 		LCD_Out(2,1, "Position : ")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 4
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
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
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,672 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_set__date_time214:
	DEC        R16
	BRNE       L__Keypad_set__date_time214
	DEC        R17
	BRNE       L__Keypad_set__date_time214
	DEC        R18
	BRNE       L__Keypad_set__date_time214
L__Keypad_set__date_time209:
;MyProject.mbas,674 :: 		if (Button(PINA, 6, 0.1, 0)<> 0) then    ' Detect logical one setting key
	CLR        R6
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_set__date_time807
	JMP        L__Keypad_set__date_time217
L__Keypad_set__date_time807:
;MyProject.mbas,675 :: 		oldstate_3 = 1                      ' Update flag
	LDD        R27, Y+16
	SBR        R27, 4
	STD        Y+16, R27
L__Keypad_set__date_time217:
;MyProject.mbas,677 :: 		if (oldstate_menu and oldstate_3 and Button(PINA, 6,0.1, 1)) then
	LDD        R1, Y+16
	LDD        R0, Y+16
	CBR        R24, 1
	SBRC       R1, 3
	SBRS       R0, 2
	RJMP       L__Keypad_set__date_time811
	SBR        R24, 1
L__Keypad_set__date_time811:
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CLR        R17
	SBRC       R24, 0
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_set__date_time812
	JMP        L__Keypad_set__date_time220
L__Keypad_set__date_time812:
;MyProject.mbas,679 :: 		oldstate_3 = 0
	LDD        R27, Y+16
	CBR        R27, 4
	STD        Y+16, R27
;MyProject.mbas,685 :: 		case 1
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_set__date_time813
	CPI        R16, 1
L__Keypad_set__date_time813:
	BREQ       L__Keypad_set__date_time814
	JMP        L__Keypad_set__date_time225
L__Keypad_set__date_time814:
;MyProject.mbas,686 :: 		text_1="Year"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 89
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,687 :: 		Keypad_set__date_time_import_lcd(year, 100 , 0  )
	CLR        R6
	CLR        R7
	LDI        R27, 100
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDS        R2, _year+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,688 :: 		year   =var_in_global
	LDS        R16, _var_in_global+0
	STS        _year+0, R16
	JMP        L__Keypad_set__date_time222
L__Keypad_set__date_time225:
;MyProject.mbas,691 :: 		case 2
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_set__date_time815
	CPI        R16, 2
L__Keypad_set__date_time815:
	BREQ       L__Keypad_set__date_time816
	JMP        L__Keypad_set__date_time228
L__Keypad_set__date_time816:
;MyProject.mbas,693 :: 		text_1="Mounths"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,694 :: 		Keypad_set__date_time_import_lcd(month,12 , 1  )
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 12
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDS        R2, _month+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,695 :: 		month   =var_in_global
	LDS        R16, _var_in_global+0
	STS        _month+0, R16
	JMP        L__Keypad_set__date_time222
L__Keypad_set__date_time228:
;MyProject.mbas,697 :: 		case 3
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_set__date_time817
	CPI        R16, 3
L__Keypad_set__date_time817:
	BREQ       L__Keypad_set__date_time818
	JMP        L__Keypad_set__date_time231
L__Keypad_set__date_time818:
;MyProject.mbas,699 :: 		text_1="day"
	LDI        R27, 100
	STS        _text_1+0, R27
	LDI        R27, 97
	STS        _text_1+1, R27
	LDI        R27, 121
	STS        _text_1+2, R27
	LDI        R27, 0
	STS        _text_1+3, R27
;MyProject.mbas,700 :: 		Keypad_set__date_time_import_lcd(day,31 , 1  )
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 31
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDS        R2, _day+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,701 :: 		day   =var_in_global
	LDS        R16, _var_in_global+0
	STS        _day+0, R16
	JMP        L__Keypad_set__date_time222
L__Keypad_set__date_time231:
;MyProject.mbas,703 :: 		case 4
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_set__date_time819
	CPI        R16, 4
L__Keypad_set__date_time819:
	BREQ       L__Keypad_set__date_time820
	JMP        L__Keypad_set__date_time234
L__Keypad_set__date_time820:
;MyProject.mbas,705 :: 		text_1="week"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,706 :: 		Keypad_set__date_time_import_lcd(week,7 , 1  )
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 7
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDS        R2, _week+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,707 :: 		week   =var_in_global
	LDS        R16, _var_in_global+0
	STS        _week+0, R16
	JMP        L__Keypad_set__date_time222
L__Keypad_set__date_time234:
;MyProject.mbas,710 :: 		case 5
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_set__date_time821
	CPI        R16, 5
L__Keypad_set__date_time821:
	BREQ       L__Keypad_set__date_time822
	JMP        L__Keypad_set__date_time237
L__Keypad_set__date_time822:
;MyProject.mbas,712 :: 		text_1="hours"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,713 :: 		Keypad_set__date_time_import_lcd(hours,23 , 0  )
	CLR        R6
	CLR        R7
	LDI        R27, 23
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDS        R2, _hours+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,714 :: 		hours   =var_in_global
	LDS        R16, _var_in_global+0
	STS        _hours+0, R16
	JMP        L__Keypad_set__date_time222
L__Keypad_set__date_time237:
;MyProject.mbas,715 :: 		case 6
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_set__date_time823
	CPI        R16, 6
L__Keypad_set__date_time823:
	BREQ       L__Keypad_set__date_time824
	JMP        L__Keypad_set__date_time240
L__Keypad_set__date_time824:
;MyProject.mbas,716 :: 		text_1="minutes"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,717 :: 		Keypad_set__date_time_import_lcd(minutes,59 , 0  )
	CLR        R6
	CLR        R7
	LDI        R27, 59
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDS        R2, _minutes+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,718 :: 		minutes   =var_in_global
	LDS        R16, _var_in_global+0
	STS        _minutes+0, R16
	JMP        L__Keypad_set__date_time222
L__Keypad_set__date_time240:
;MyProject.mbas,719 :: 		case 7
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_set__date_time825
	CPI        R16, 7
L__Keypad_set__date_time825:
	BREQ       L__Keypad_set__date_time826
	JMP        L__Keypad_set__date_time243
L__Keypad_set__date_time826:
;MyProject.mbas,720 :: 		text_1="<Exit>"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,721 :: 		Keypad_set__date_time_import_lcd(ex,1 , 0  )
	CLR        R6
	CLR        R7
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDD        R2, Y+2
	LDD        R3, Y+3
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,722 :: 		ex =var_in_global
	LDS        R16, _var_in_global+0
	LDS        R17, _var_in_global+1
	STD        Y+2, R16
	STD        Y+3, R17
;MyProject.mbas,723 :: 		if ex=1 then
	CPI        R17, 0
	BRNE       L__Keypad_set__date_time827
	CPI        R16, 1
L__Keypad_set__date_time827:
	BREQ       L__Keypad_set__date_time828
	JMP        L__Keypad_set__date_time245
L__Keypad_set__date_time828:
;MyProject.mbas,724 :: 		while_state_2=0
	LDD        R27, Y+16
	CBR        R27, 1
	STD        Y+16, R27
L__Keypad_set__date_time245:
;MyProject.mbas,725 :: 		end if
	JMP        L__Keypad_set__date_time222
L__Keypad_set__date_time243:
L__Keypad_set__date_time222:
;MyProject.mbas,727 :: 		Write_Time(Dec2Bcd(hours), Dec2Bcd(minutes), Dec2Bcd(seconds), Dec2Bcd(day), Dec2Bcd(week),   Dec2Bcd(month),  Dec2Bcd(year))'
	LDS        R2, _hours+0
	CALL       _Dec2Bcd+0
	STD        Y+28, R16
	LDS        R2, _minutes+0
	CALL       _Dec2Bcd+0
	STD        Y+27, R16
	LDS        R2, _seconds+0
	CALL       _Dec2Bcd+0
	STD        Y+26, R16
	LDS        R2, _day+0
	CALL       _Dec2Bcd+0
	STD        Y+25, R16
	LDS        R2, _week+0
	CALL       _Dec2Bcd+0
	STD        Y+24, R16
	LDS        R2, _month+0
	CALL       _Dec2Bcd+0
	STD        Y+23, R16
	LDS        R2, _year+0
	CALL       _Dec2Bcd+0
	LDD        R22, Y+28
	LDD        R21, Y+27
	LDD        R20, Y+26
	LDD        R19, Y+25
	LDD        R18, Y+24
	LDD        R17, Y+23
	MOV        R8, R16
	MOV        R7, R17
	MOV        R6, R18
	MOV        R5, R19
	MOV        R4, R20
	MOV        R3, R21
	MOV        R2, R22
	CALL       _Write_Time+0
;MyProject.mbas,728 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_set__date_time247:
	DEC        R16
	BRNE       L__Keypad_set__date_time247
	DEC        R17
	BRNE       L__Keypad_set__date_time247
	DEC        R18
	BRNE       L__Keypad_set__date_time247
L__Keypad_set__date_time220:
;MyProject.mbas,731 :: 		wend
	JMP        L__Keypad_set__date_time199
L__Keypad_set__date_time200:
;MyProject.mbas,732 :: 		end sub
L_end_Keypad_set__date_time:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 28
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Keypad_set__date_time

_Keypad_Relay_set__date_time:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 31
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,744 :: 		minutes_1, on_off22 as byte
;MyProject.mbas,751 :: 		oldstate_2 = 0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,752 :: 		week=2
	LDI        R27, 2
	STS        _week+0, R27
;MyProject.mbas,753 :: 		chanel=1 Pwm_chanel=1 hours=0  minutes=0
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
	LDI        R27, 0
	STS        _hours+0, R27
	LDI        R27, 0
	STS        _minutes+0, R27
;MyProject.mbas,754 :: 		oldstate_3 = 0                ex=0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
	LDI        R27, 0
	STD        Y+2, R27
	STD        Y+3, R27
;MyProject.mbas,755 :: 		oldstate_menu = 0
	LDS        R27, _oldstate_menu+0
	CBR        R27, BitMask(_oldstate_menu+0)
	STS        _oldstate_menu+0, R27
;MyProject.mbas,756 :: 		while_state_2=1
	LDS        R27, _while_state_2+0
	SBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;MyProject.mbas,757 :: 		k_set=0            on_off=0   chanel=1
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
	LDI        R27, 0
	STS        _on_off+0, R27
	STS        _on_off+1, R27
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
;MyProject.mbas,758 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,760 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	LDI        R27, #lo_addr(_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,761 :: 		Shamsi_transfer_time()
	CALL       _Shamsi_transfer_time+0
;MyProject.mbas,764 :: 		while  (while_state_2 )
L__Keypad_Relay_set__date_time251:
	LDS        R27, _while_state_2+0
	SBRS       R27, BitPos(_while_state_2+0)
	JMP        L__Keypad_Relay_set__date_time252
;MyProject.mbas,767 :: 		if (Button(PIND, 0, 0.1, 0)<> 0) then    ' Detect logical one setting key
	CLR        R6
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_Relay_set__date_time830
	JMP        L__Keypad_Relay_set__date_time256
L__Keypad_Relay_set__date_time830:
;MyProject.mbas,768 :: 		oldstate_2 = 1                      ' Update flag
	LDS        R27, _oldstate_2+0
	SBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
L__Keypad_Relay_set__date_time256:
;MyProject.mbas,770 :: 		if (oldstate_2 and Button(PIND, 0,0.1, 1)) then
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_2+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_2+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_Relay_set__date_time831
	JMP        L__Keypad_Relay_set__date_time259
L__Keypad_Relay_set__date_time831:
;MyProject.mbas,771 :: 		oldstate_2 = 0
	LDS        R27, _oldstate_2+0
	CBR        R27, BitMask(_oldstate_2+0)
	STS        _oldstate_2+0, R27
;MyProject.mbas,772 :: 		oldstate_menu=1
	LDS        R27, _oldstate_menu+0
	SBR        R27, BitMask(_oldstate_menu+0)
	STS        _oldstate_menu+0, R27
;MyProject.mbas,773 :: 		k_set=k_set+1
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,774 :: 		if k_set=10  then
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time832
	CPI        R16, 10
L__Keypad_Relay_set__date_time832:
	BREQ       L__Keypad_Relay_set__date_time833
	JMP        L__Keypad_Relay_set__date_time262
L__Keypad_Relay_set__date_time833:
;MyProject.mbas,775 :: 		k_set=1
	LDI        R27, 1
	STD        Y+0, R27
	LDI        R27, 0
	STD        Y+1, R27
L__Keypad_Relay_set__date_time262:
;MyProject.mbas,777 :: 		inttostr(k_set,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _IntToStr+0
;MyProject.mbas,778 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,779 :: 		LCD_Out(2,1, "Position : ")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 6
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 250
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,780 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_Relay_set__date_time264:
	DEC        R16
	BRNE       L__Keypad_Relay_set__date_time264
	DEC        R17
	BRNE       L__Keypad_Relay_set__date_time264
	DEC        R18
	BRNE       L__Keypad_Relay_set__date_time264
L__Keypad_Relay_set__date_time259:
;MyProject.mbas,782 :: 		if (Button(PINA, 6, 0.1, 0)<> 0) then    ' Detect logical one setting key
	CLR        R6
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_Relay_set__date_time834
	JMP        L__Keypad_Relay_set__date_time267
L__Keypad_Relay_set__date_time834:
;MyProject.mbas,783 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__Keypad_Relay_set__date_time267:
;MyProject.mbas,785 :: 		if (oldstate_menu and oldstate_3 and Button(PINA, 6,0.1, 1)) then
	LDS        R1, _oldstate_menu+0
	LDS        R0, _oldstate_3+0
	CBR        R22, 1
	SBRC       R1, BitPos(_oldstate_menu+0)
	SBRS       R0, BitPos(_oldstate_3+0)
	RJMP       L__Keypad_Relay_set__date_time838
	SBR        R22, 1
L__Keypad_Relay_set__date_time838:
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CLR        R17
	SBRC       R22, 0
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_Relay_set__date_time839
	JMP        L__Keypad_Relay_set__date_time270
L__Keypad_Relay_set__date_time839:
;MyProject.mbas,787 :: 		oldstate_3 = 0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,793 :: 		case 1   'one and off
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time840
	CPI        R16, 1
L__Keypad_Relay_set__date_time840:
	BREQ       L__Keypad_Relay_set__date_time841
	JMP        L__Keypad_Relay_set__date_time275
L__Keypad_Relay_set__date_time841:
;MyProject.mbas,795 :: 		text_1="On and Off"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,797 :: 		Keypad_set__date_time_import_lcd(on_off,1 , 0  )
	CLR        R6
	CLR        R7
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDS        R2, _on_off+0
	LDS        R3, _on_off+1
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,798 :: 		on_off22=var_in_global
	LDS        R16, _var_in_global+0
	STD        Y+5, R16
;MyProject.mbas,799 :: 		on_a_0[week-1][chanel-1][Pwm_chanel-1][on_off2-1][0]=on_off22
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDS        R16, _on_off2+0
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
	LDD        R16, Y+5
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,802 :: 		inttostr(on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][0],txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDS        R16, _on_off2+0
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
	LD         R16, Z+
	LD         R17, Z+
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;MyProject.mbas,803 :: 		LCD_Out(2,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,804 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDS        R3, _chanel+1
	CALL       _IntToStr+0
;MyProject.mbas,805 :: 		LCD_Out(2,1, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__Keypad_Relay_set__date_time272
L__Keypad_Relay_set__date_time275:
;MyProject.mbas,808 :: 		case 2
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time842
	CPI        R16, 2
L__Keypad_Relay_set__date_time842:
	BREQ       L__Keypad_Relay_set__date_time843
	JMP        L__Keypad_Relay_set__date_time278
L__Keypad_Relay_set__date_time843:
;MyProject.mbas,810 :: 		text_1="week"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,811 :: 		Keypad_set__date_time_import_lcd(week,7 , 1  )
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 7
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDS        R2, _week+0
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,812 :: 		week   =var_in_global
	LDS        R16, _var_in_global+0
	STS        _week+0, R16
	JMP        L__Keypad_Relay_set__date_time272
L__Keypad_Relay_set__date_time278:
;MyProject.mbas,815 :: 		case 3
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time844
	CPI        R16, 3
L__Keypad_Relay_set__date_time844:
	BREQ       L__Keypad_Relay_set__date_time845
	JMP        L__Keypad_Relay_set__date_time281
L__Keypad_Relay_set__date_time845:
;MyProject.mbas,816 :: 		text_1="Chanel"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,817 :: 		Keypad_set__date_time_import_lcd(chanel, 5 , 1  )
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 5
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDS        R3, _chanel+1
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,818 :: 		chanel   =var_in_global
	LDS        R16, _var_in_global+0
	LDS        R17, _var_in_global+1
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__Keypad_Relay_set__date_time272
L__Keypad_Relay_set__date_time281:
;MyProject.mbas,820 :: 		case 4
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time846
	CPI        R16, 4
L__Keypad_Relay_set__date_time846:
	BREQ       L__Keypad_Relay_set__date_time847
	JMP        L__Keypad_Relay_set__date_time284
L__Keypad_Relay_set__date_time847:
;MyProject.mbas,823 :: 		text_1="hours"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,824 :: 		Keypad_set__date_time_import_lcd(on_a_0[week-1][chanel-1][Pwm_chanel-1][on_off2-1][1],23 , 0)
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDS        R16, _on_off2+0
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
	LD         R16, Z+
	LD         R17, Z+
	CLR        R6
	CLR        R7
	LDI        R27, 23
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,825 :: 		hours   =var_in_global
	LDS        R16, _var_in_global+0
	STS        _hours+0, R16
;MyProject.mbas,826 :: 		on_a_0[week-1][chanel-1][Pwm_chanel-1][on_off2-1][1]=hours
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDS        R16, _on_off2+0
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
	LDS        R16, _hours+0
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
	JMP        L__Keypad_Relay_set__date_time272
L__Keypad_Relay_set__date_time284:
;MyProject.mbas,828 :: 		case 5
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time848
	CPI        R16, 5
L__Keypad_Relay_set__date_time848:
	BREQ       L__Keypad_Relay_set__date_time849
	JMP        L__Keypad_Relay_set__date_time287
L__Keypad_Relay_set__date_time849:
;MyProject.mbas,829 :: 		text_1="minutes"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,830 :: 		Keypad_set__date_time_import_lcd(on_a_0[week-1][chanel-1][Pwm_chanel-1][on_off2-1][2] ,59 , 0  )
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDS        R16, _on_off2+0
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
	LD         R16, Z+
	LD         R17, Z+
	CLR        R6
	CLR        R7
	LDI        R27, 59
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,833 :: 		minutes_1 =var_in_global
	LDS        R16, _var_in_global+0
	STD        Y+4, R16
;MyProject.mbas,834 :: 		on_a_0[week-1][chanel-1][Pwm_chanel-1][on_off2-1][2]=minutes_1
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDS        R16, _on_off2+0
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
	LDD        R16, Y+4
	ST         Z+, R16
	LDI        R27, 0
	ST         Z+, R27
	JMP        L__Keypad_Relay_set__date_time272
L__Keypad_Relay_set__date_time287:
;MyProject.mbas,838 :: 		case 6   'pwm chnael color
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time850
	CPI        R16, 6
L__Keypad_Relay_set__date_time850:
	BREQ       L__Keypad_Relay_set__date_time851
	JMP        L__Keypad_Relay_set__date_time290
L__Keypad_Relay_set__date_time851:
;MyProject.mbas,839 :: 		text_1="PWM Chanel color"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,840 :: 		Keypad_set__date_time_import_lcd(Pwm_chanel, 7 , 1  )
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 7
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDS        R2, _Pwm_chanel+0
	LDS        R3, _Pwm_chanel+1
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,841 :: 		Pwm_chanel   =var_in_global
	LDS        R16, _var_in_global+0
	LDS        R17, _var_in_global+1
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__Keypad_Relay_set__date_time272
L__Keypad_Relay_set__date_time290:
;MyProject.mbas,845 :: 		case 7   'pwm Precent
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time852
	CPI        R16, 7
L__Keypad_Relay_set__date_time852:
	BREQ       L__Keypad_Relay_set__date_time853
	JMP        L__Keypad_Relay_set__date_time293
L__Keypad_Relay_set__date_time853:
;MyProject.mbas,846 :: 		text_1="PWM Precent"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,847 :: 		Keypad_set__date_time_import_lcd(on_a_0[week-1][chanel-1][Pwm_chanel-1][on_off2-1][3], 100 , 0  )
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDS        R16, _on_off2+0
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
	LD         R16, Z+
	LD         R17, Z+
	CLR        R6
	CLR        R7
	LDI        R27, 100
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,848 :: 		on_a_0[week-1][chanel-1][Pwm_chanel-1][on_off2-1][3]   =var_in_global
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDS        R16, _on_off2+0
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
	LDS        R16, _var_in_global+0
	LDS        R17, _var_in_global+1
	ST         Z+, R16
	ST         Z+, R17
	JMP        L__Keypad_Relay_set__date_time272
L__Keypad_Relay_set__date_time293:
;MyProject.mbas,852 :: 		case 8  'Save key
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time854
	CPI        R16, 8
L__Keypad_Relay_set__date_time854:
	BREQ       L__Keypad_Relay_set__date_time855
	JMP        L__Keypad_Relay_set__date_time296
L__Keypad_Relay_set__date_time855:
;MyProject.mbas,853 :: 		text_1="<Save> and Exit"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 118
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,854 :: 		Keypad_set__date_time_import_lcd(ex,1 , 0 )
	CLR        R6
	CLR        R7
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDD        R2, Y+2
	LDD        R3, Y+3
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,855 :: 		ex   =var_in_global
	LDS        R16, _var_in_global+0
	LDS        R17, _var_in_global+1
	STD        Y+2, R16
	STD        Y+3, R17
;MyProject.mbas,856 :: 		if ex=1 then
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time856
	CPI        R16, 1
L__Keypad_Relay_set__date_time856:
	BREQ       L__Keypad_Relay_set__date_time857
	JMP        L__Keypad_Relay_set__date_time298
L__Keypad_Relay_set__date_time857:
;MyProject.mbas,857 :: 		while_state_2=0
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
;MyProject.mbas,858 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,862 :: 		LCD_Out(2,1, "on_a_0=on_a  2")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 6
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
	LDI        R27, 61
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 250
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,863 :: 		inttostr(on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][0],txt)
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
	STD        Y+29, R16
	STD        Y+30, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+29
	LDD        R19, Y+30
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
	LDS        R16, _on_off2+0
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
	LD         R16, Z+
	LD         R17, Z+
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;MyProject.mbas,865 :: 		LCD_Out(1,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,866 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDS        R3, _chanel+1
	CALL       _IntToStr+0
;MyProject.mbas,867 :: 		LCD_Out(2,1, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,868 :: 		LCD_Out(2,1, "End of save")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 6
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 118
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 250
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,869 :: 		eeprom_save()
	CALL       _eeprom_save+0
;MyProject.mbas,871 :: 		if  (EEPROM_Read(0x00)=122)   then
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	CPI        R16, 122
	BREQ       L__Keypad_Relay_set__date_time858
	JMP        L__Keypad_Relay_set__date_time301
L__Keypad_Relay_set__date_time858:
;MyProject.mbas,872 :: 		Lcd_Out(1,1,"EEprom  writed befor" )
	MOVW       R30, R28
	ADIW       R30, 6
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
	SUBI       R16, 250
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,873 :: 		IntToStr(EEPROM_Read(0x00), txt)
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,875 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__Keypad_Relay_set__date_time302
;MyProject.mbas,876 :: 		else
L__Keypad_Relay_set__date_time301:
;MyProject.mbas,878 :: 		EEPROM_Write(0x00 ,122 )
	LDI        R27, 122
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Write+0
;MyProject.mbas,879 :: 		Lcd_Out(1,1,"not writed" )
	MOVW       R30, R28
	ADIW       R30, 6
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 250
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,881 :: 		end if
L__Keypad_Relay_set__date_time302:
;MyProject.mbas,882 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Keypad_Relay_set__date_time303:
	DEC        R16
	BRNE       L__Keypad_Relay_set__date_time303
	DEC        R17
	BRNE       L__Keypad_Relay_set__date_time303
	DEC        R18
	BRNE       L__Keypad_Relay_set__date_time303
	NOP
;MyProject.mbas,883 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,884 :: 		IntToStr(EEPROM_Read(0x04), txt)
	LDI        R27, 4
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,886 :: 		Lcd_Out(1,1,"EEprom 04" )
	MOVW       R30, R28
	ADIW       R30, 6
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
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 52
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 250
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,887 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,888 :: 		delay_ms(1500)
	LDI        R18, 61
	LDI        R17, 225
	LDI        R16, 64
L__Keypad_Relay_set__date_time305:
	DEC        R16
	BRNE       L__Keypad_Relay_set__date_time305
	DEC        R17
	BRNE       L__Keypad_Relay_set__date_time305
	DEC        R18
	BRNE       L__Keypad_Relay_set__date_time305
	NOP
	NOP
L__Keypad_Relay_set__date_time298:
;MyProject.mbas,889 :: 		end if
	JMP        L__Keypad_Relay_set__date_time272
L__Keypad_Relay_set__date_time296:
;MyProject.mbas,896 :: 		case 9  'exit key
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time859
	CPI        R16, 9
L__Keypad_Relay_set__date_time859:
	BREQ       L__Keypad_Relay_set__date_time860
	JMP        L__Keypad_Relay_set__date_time309
L__Keypad_Relay_set__date_time860:
;MyProject.mbas,897 :: 		text_1="<Exit> No save"
	LDI        R30, #lo_addr(_text_1+0)
	LDI        R31, hi_addr(_text_1+0)
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 118
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,898 :: 		Keypad_set__date_time_import_lcd(ex,1 , 0 )
	CLR        R6
	CLR        R7
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDD        R2, Y+2
	LDD        R3, Y+3
	CALL       _Keypad_set__date_time_import_lcd+0
;MyProject.mbas,899 :: 		ex   =var_in_global
	LDS        R16, _var_in_global+0
	LDS        R17, _var_in_global+1
	STD        Y+2, R16
	STD        Y+3, R17
;MyProject.mbas,900 :: 		if ex=1 then
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time861
	CPI        R16, 1
L__Keypad_Relay_set__date_time861:
	BREQ       L__Keypad_Relay_set__date_time862
	JMP        L__Keypad_Relay_set__date_time311
L__Keypad_Relay_set__date_time862:
;MyProject.mbas,901 :: 		while_state_2=0
	LDS        R27, _while_state_2+0
	CBR        R27, BitMask(_while_state_2+0)
	STS        _while_state_2+0, R27
L__Keypad_Relay_set__date_time311:
;MyProject.mbas,902 :: 		end if
	JMP        L__Keypad_Relay_set__date_time272
L__Keypad_Relay_set__date_time309:
L__Keypad_Relay_set__date_time272:
;MyProject.mbas,909 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_Relay_set__date_time313:
	DEC        R16
	BRNE       L__Keypad_Relay_set__date_time313
	DEC        R17
	BRNE       L__Keypad_Relay_set__date_time313
	DEC        R18
	BRNE       L__Keypad_Relay_set__date_time313
L__Keypad_Relay_set__date_time270:
;MyProject.mbas,912 :: 		wend
	JMP        L__Keypad_Relay_set__date_time251
L__Keypad_Relay_set__date_time252:
;MyProject.mbas,913 :: 		LCD_Out(2,1, "End of while ok")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 6
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 107
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 250
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,914 :: 		delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Keypad_Relay_set__date_time315:
	DEC        R16
	BRNE       L__Keypad_Relay_set__date_time315
	DEC        R17
	BRNE       L__Keypad_Relay_set__date_time315
	DEC        R18
	BRNE       L__Keypad_Relay_set__date_time315
	NOP
;MyProject.mbas,915 :: 		end sub
L_end_Keypad_Relay_set__date_time:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 30
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Keypad_Relay_set__date_time

_Lcd_Keypad_3:

;MyProject.mbas,917 :: 		sub procedure Lcd_Keypad_3(dim q_1,q_2,q_3,ch as integer)
;MyProject.mbas,919 :: 		Lcd_Out(1,1,txt1)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R9
	PUSH       R8
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	POP        R8
	POP        R9
;MyProject.mbas,920 :: 		Lcd_Chr(2, q_1, ch)
	PUSH       R9
	PUSH       R8
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	MOV        R4, R8
	MOV        R3, R2
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	POP        R8
	POP        R9
;MyProject.mbas,921 :: 		Lcd_Chr(2, q_2, ch)
	PUSH       R9
	PUSH       R8
	PUSH       R7
	PUSH       R6
	MOV        R3, R4
	MOV        R4, R8
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R6
	POP        R7
	POP        R8
	POP        R9
;MyProject.mbas,922 :: 		Lcd_Chr(2, q_3, ch)
	MOV        R4, R8
	MOV        R3, R6
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,923 :: 		Delay_mS(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Lcd_Keypad_3318:
	DEC        R16
	BRNE       L__Lcd_Keypad_3318
	DEC        R17
	BRNE       L__Lcd_Keypad_3318
	DEC        R18
	BRNE       L__Lcd_Keypad_3318
	NOP
;MyProject.mbas,924 :: 		end sub
L_end_Lcd_Keypad_3:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _Lcd_Keypad_3

_Lcd_Keypad_4:

;MyProject.mbas,925 :: 		sub procedure Lcd_Keypad_4(dim q_1,q_2,q_3,ch as integer)
;MyProject.mbas,927 :: 		Lcd_Out(1,1,txt1)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R9
	PUSH       R8
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	POP        R8
	POP        R9
;MyProject.mbas,928 :: 		Lcd_Chr(2, q_1, ch)
	PUSH       R9
	PUSH       R8
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	MOV        R4, R8
	MOV        R3, R2
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	POP        R8
	POP        R9
;MyProject.mbas,929 :: 		Lcd_Chr(2, q_2, ch)
	PUSH       R9
	PUSH       R8
	PUSH       R7
	PUSH       R6
	MOV        R3, R4
	MOV        R4, R8
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R6
	POP        R7
	POP        R8
	POP        R9
;MyProject.mbas,930 :: 		Lcd_Chr(2, q_3, ch)
	MOV        R4, R8
	MOV        R3, R6
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,931 :: 		Delay_mS(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Lcd_Keypad_4321:
	DEC        R16
	BRNE       L__Lcd_Keypad_4321
	DEC        R17
	BRNE       L__Lcd_Keypad_4321
	DEC        R18
	BRNE       L__Lcd_Keypad_4321
	NOP
;MyProject.mbas,932 :: 		end sub
L_end_Lcd_Keypad_4:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _Lcd_Keypad_4

_Keypad_Relay_set__date_time_1:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 25
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,934 :: 		dim kp1, ok1  as integer
;MyProject.mbas,935 :: 		Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	CALL       _Lcd_0+0
;MyProject.mbas,936 :: 		txt1 = " On  Off  <Exit>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,937 :: 		Lcd_Keypad_3(3,2,4,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 4
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 3
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
;MyProject.mbas,943 :: 		kp1=0
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
;MyProject.mbas,947 :: 		oldstate = 0
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,948 :: 		oldstate_up=0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
;MyProject.mbas,949 :: 		oldstate_down=0
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;MyProject.mbas,950 :: 		oldstate_ok=0
	LDS        R27, _oldstate_ok+0
	CBR        R27, BitMask(_oldstate_ok+0)
	STS        _oldstate_ok+0, R27
;MyProject.mbas,951 :: 		oldstate_ww=0
	LDS        R27, _oldstate_ww+0
	CBR        R27, BitMask(_oldstate_ww+0)
	STS        _oldstate_ww+0, R27
;MyProject.mbas,952 :: 		while_state=1
	LDS        R27, _while_state+0
	SBR        R27, BitMask(_while_state+0)
	STS        _while_state+0, R27
;MyProject.mbas,953 :: 		while_satate_in_1=1
	LDS        R27, _while_satate_in_1+0
	SBR        R27, BitMask(_while_satate_in_1+0)
	STS        _while_satate_in_1+0, R27
;MyProject.mbas,954 :: 		while  (while_satate_in_1 )
L__Keypad_Relay_set__date_time_1325:
	LDS        R27, _while_satate_in_1+0
	SBRS       R27, BitPos(_while_satate_in_1+0)
	JMP        L__Keypad_Relay_set__date_time_1326
;MyProject.mbas,956 :: 		if (Button(PIND, 0, 0.1, 1)<> 0) then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_Relay_set__date_time_1866
	JMP        L__Keypad_Relay_set__date_time_1330
L__Keypad_Relay_set__date_time_1866:
;MyProject.mbas,957 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,958 :: 		oldstate = 1                      ' Update flag
	LDS        R27, _oldstate+0
	SBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
L__Keypad_Relay_set__date_time_1330:
;MyProject.mbas,960 :: 		if (oldstate and Button(PIND, 0, 0.1, 0)) then    ' Detect one-to-zero transition
	CLR        R6
	CLR        R5
	CLR        R4
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
	BRNE       L__Keypad_Relay_set__date_time_1867
	JMP        L__Keypad_Relay_set__date_time_1333
L__Keypad_Relay_set__date_time_1867:
;MyProject.mbas,961 :: 		oldstate = 0
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,962 :: 		while_state=0
	LDS        R27, _while_state+0
	CBR        R27, BitMask(_while_state+0)
	STS        _while_state+0, R27
;MyProject.mbas,963 :: 		while_satate_in_1=0
	LDS        R27, _while_satate_in_1+0
	CBR        R27, BitMask(_while_satate_in_1+0)
	STS        _while_satate_in_1+0, R27
;MyProject.mbas,964 :: 		kp1=1
	LDI        R27, 1
	STD        Y+0, R27
	LDI        R27, 0
	STD        Y+1, R27
;MyProject.mbas,965 :: 		txt1 = "<Exit> is Selected"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
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
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,966 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,967 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Keypad_Relay_set__date_time_1335:
	DEC        R16
	BRNE       L__Keypad_Relay_set__date_time_1335
	DEC        R17
	BRNE       L__Keypad_Relay_set__date_time_1335
	DEC        R18
	BRNE       L__Keypad_Relay_set__date_time_1335
	NOP
L__Keypad_Relay_set__date_time_1333:
;MyProject.mbas,978 :: 		if (Button(PINA, 4, 0.1, 1)<> 0) then    ' Detect logical down setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_Relay_set__date_time_1868
	JMP        L__Keypad_Relay_set__date_time_1338
L__Keypad_Relay_set__date_time_1868:
;MyProject.mbas,979 :: 		oldstate_down = 1                      ' Update flag
	LDS        R27, _oldstate_down+0
	SBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
L__Keypad_Relay_set__date_time_1338:
;MyProject.mbas,981 :: 		if (oldstate_down and Button(PINA, 4, 0.1, 0)) then    ' Detect one-to-zero transition
	CLR        R6
	CLR        R5
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_down+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_down+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_Relay_set__date_time_1869
	JMP        L__Keypad_Relay_set__date_time_1341
L__Keypad_Relay_set__date_time_1869:
;MyProject.mbas,982 :: 		oldstate_down=0
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;MyProject.mbas,983 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,984 :: 		txt1 = " On  Off  <Exit>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,985 :: 		if (kp1=0) then  '<Exit mode>
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time_1870
	CPI        R16, 0
L__Keypad_Relay_set__date_time_1870:
	BREQ       L__Keypad_Relay_set__date_time_1871
	JMP        L__Keypad_Relay_set__date_time_1344
L__Keypad_Relay_set__date_time_1871:
;MyProject.mbas,986 :: 		kp1=2
	LDI        R27, 2
	STD        Y+0, R27
	LDI        R27, 0
	STD        Y+1, R27
;MyProject.mbas,988 :: 		Lcd_Keypad_3(13,14,15,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 15
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 14
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 13
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
	JMP        L__Keypad_Relay_set__date_time_1345
;MyProject.mbas,993 :: 		else
L__Keypad_Relay_set__date_time_1344:
;MyProject.mbas,994 :: 		kp1=kp1-1
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 1
	SBCI       R17, 0
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,995 :: 		if (kp1=0) then            ' ON Mode
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time_1872
	CPI        R16, 0
L__Keypad_Relay_set__date_time_1872:
	BREQ       L__Keypad_Relay_set__date_time_1873
	JMP        L__Keypad_Relay_set__date_time_1347
L__Keypad_Relay_set__date_time_1873:
;MyProject.mbas,998 :: 		Lcd_Keypad_3(2,3,4,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 4
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 2
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
L__Keypad_Relay_set__date_time_1347:
;MyProject.mbas,1005 :: 		if (kp1=1) then            ' Off  Mode
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time_1874
	CPI        R16, 1
L__Keypad_Relay_set__date_time_1874:
	BREQ       L__Keypad_Relay_set__date_time_1875
	JMP        L__Keypad_Relay_set__date_time_1350
L__Keypad_Relay_set__date_time_1875:
;MyProject.mbas,1008 :: 		Lcd_Keypad_3(6,7,8,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 8
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 7
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 6
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
L__Keypad_Relay_set__date_time_1350:
;MyProject.mbas,1014 :: 		end if
L__Keypad_Relay_set__date_time_1345:
;MyProject.mbas,1016 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_Relay_set__date_time_1352:
	DEC        R16
	BRNE       L__Keypad_Relay_set__date_time_1352
	DEC        R17
	BRNE       L__Keypad_Relay_set__date_time_1352
	DEC        R18
	BRNE       L__Keypad_Relay_set__date_time_1352
L__Keypad_Relay_set__date_time_1341:
;MyProject.mbas,1018 :: 		if (Button(PINA, 5, 0.1, 1)<> 0) then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 5
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_Relay_set__date_time_1876
	JMP        L__Keypad_Relay_set__date_time_1355
L__Keypad_Relay_set__date_time_1876:
;MyProject.mbas,1019 :: 		oldstate_up = 1                      ' Update flag
	LDS        R27, _oldstate_up+0
	SBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
L__Keypad_Relay_set__date_time_1355:
;MyProject.mbas,1021 :: 		if ((oldstate_up) and (Button(PINA, 5, 0.1, 0))) then    ' Detect one-to-zero transition
	CLR        R6
	CLR        R5
	LDI        R27, 5
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_up+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_up+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_Relay_set__date_time_1877
	JMP        L__Keypad_Relay_set__date_time_1358
L__Keypad_Relay_set__date_time_1877:
;MyProject.mbas,1022 :: 		oldstate_up=0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
;MyProject.mbas,1023 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1024 :: 		txt1 = " On  Off  <Exit>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1025 :: 		if (kp1=2) then
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time_1878
	CPI        R16, 2
L__Keypad_Relay_set__date_time_1878:
	BREQ       L__Keypad_Relay_set__date_time_1879
	JMP        L__Keypad_Relay_set__date_time_1361
L__Keypad_Relay_set__date_time_1879:
;MyProject.mbas,1026 :: 		kp1=0
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
;MyProject.mbas,1028 :: 		Lcd_Keypad_3(2,3,4,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 4
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 2
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
	JMP        L__Keypad_Relay_set__date_time_1362
;MyProject.mbas,1033 :: 		else
L__Keypad_Relay_set__date_time_1361:
;MyProject.mbas,1034 :: 		kp1=kp1+1
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,1035 :: 		if (kp1=2) then            ' ON Mode
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time_1880
	CPI        R16, 2
L__Keypad_Relay_set__date_time_1880:
	BREQ       L__Keypad_Relay_set__date_time_1881
	JMP        L__Keypad_Relay_set__date_time_1364
L__Keypad_Relay_set__date_time_1881:
;MyProject.mbas,1038 :: 		Lcd_Keypad_3(13,14,15,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 15
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 14
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 13
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
L__Keypad_Relay_set__date_time_1364:
;MyProject.mbas,1045 :: 		if (kp1=1) then            ' Off  Mode
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time_1882
	CPI        R16, 1
L__Keypad_Relay_set__date_time_1882:
	BREQ       L__Keypad_Relay_set__date_time_1883
	JMP        L__Keypad_Relay_set__date_time_1367
L__Keypad_Relay_set__date_time_1883:
;MyProject.mbas,1048 :: 		Lcd_Keypad_3(6,7,8,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 8
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 7
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 6
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
L__Keypad_Relay_set__date_time_1367:
;MyProject.mbas,1054 :: 		end if
L__Keypad_Relay_set__date_time_1362:
L__Keypad_Relay_set__date_time_1358:
;MyProject.mbas,1059 :: 		if (Button(PINA, 6, 0.1, 1)<> 0) then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_Relay_set__date_time_1884
	JMP        L__Keypad_Relay_set__date_time_1370
L__Keypad_Relay_set__date_time_1884:
;MyProject.mbas,1060 :: 		oldstate_ok =1
	LDS        R27, _oldstate_ok+0
	SBR        R27, BitMask(_oldstate_ok+0)
	STS        _oldstate_ok+0, R27
L__Keypad_Relay_set__date_time_1370:
;MyProject.mbas,1062 :: 		if ((oldstate_ok) and (while_satate_in_1) and (Button(PINA, 6, 0.1, 0))) then    ' Detect one-to-zero transition
	LDS        R1, _oldstate_ok+0
	LDS        R0, _while_satate_in_1+0
	CBR        R21, 1
	SBRC       R1, BitPos(_oldstate_ok+0)
	SBRS       R0, BitPos(_while_satate_in_1+0)
	RJMP       L__Keypad_Relay_set__date_time_1888
	SBR        R21, 1
L__Keypad_Relay_set__date_time_1888:
	CLR        R6
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CLR        R17
	SBRC       R21, 0
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_Relay_set__date_time_1889
	JMP        L__Keypad_Relay_set__date_time_1373
L__Keypad_Relay_set__date_time_1889:
;MyProject.mbas,1063 :: 		while_state=0
	LDS        R27, _while_state+0
	CBR        R27, BitMask(_while_state+0)
	STS        _while_state+0, R27
;MyProject.mbas,1064 :: 		while_satate_in_1=0
	LDS        R27, _while_satate_in_1+0
	CBR        R27, BitMask(_while_satate_in_1+0)
	STS        _while_satate_in_1+0, R27
;MyProject.mbas,1065 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1066 :: 		oldstate_ok = 1                      ' Update flag
	LDS        R27, _oldstate_ok+0
	SBR        R27, BitMask(_oldstate_ok+0)
	STS        _oldstate_ok+0, R27
L__Keypad_Relay_set__date_time_1373:
;MyProject.mbas,1078 :: 		wend
	JMP        L__Keypad_Relay_set__date_time_1325
L__Keypad_Relay_set__date_time_1326:
;MyProject.mbas,1088 :: 		case 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time_1890
	CPI        R16, 0
L__Keypad_Relay_set__date_time_1890:
	BREQ       L__Keypad_Relay_set__date_time_1891
	JMP        L__Keypad_Relay_set__date_time_1378
L__Keypad_Relay_set__date_time_1891:
;MyProject.mbas,1089 :: 		kp1 = 0  ' 1               ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
;MyProject.mbas,1091 :: 		txt1 = " On  Off  <Exit>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 79
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1092 :: 		Keypad_Relay_set__date_time()
	CALL       _Keypad_Relay_set__date_time+0
;MyProject.mbas,1096 :: 		inttostr(kp1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _IntToStr+0
;MyProject.mbas,1097 :: 		LCD_Out(1,1, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__Keypad_Relay_set__date_time_1375
L__Keypad_Relay_set__date_time_1378:
;MyProject.mbas,1102 :: 		case 1
	LDD        R16, Y+0
	LDD        R17, Y+1
	CPI        R17, 0
	BRNE       L__Keypad_Relay_set__date_time_1892
	CPI        R16, 1
L__Keypad_Relay_set__date_time_1892:
	BREQ       L__Keypad_Relay_set__date_time_1893
	JMP        L__Keypad_Relay_set__date_time_1381
L__Keypad_Relay_set__date_time_1893:
;MyProject.mbas,1105 :: 		inttostr(kp1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _IntToStr+0
;MyProject.mbas,1106 :: 		LCD_Out(1,1, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1109 :: 		LCD_Out(2,1, "Case Exit is selected ")  ''Show on LCD
	MOVW       R30, R28
	ADIW       R30, 2
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
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
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 254
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1110 :: 		kp1 = 1  ' 1               ' ????? ???? ? ????? ???
	JMP        L__Keypad_Relay_set__date_time_1375
L__Keypad_Relay_set__date_time_1381:
L__Keypad_Relay_set__date_time_1375:
;MyProject.mbas,1115 :: 		end sub
L_end_Keypad_Relay_set__date_time_1:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 24
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Keypad_Relay_set__date_time_1

_Keypad_Blinking:

;MyProject.mbas,1119 :: 		sub procedure Keypad_Blinking(dim kp1,Kp_max,Kp_min,sate as integer)
;MyProject.mbas,1120 :: 		oldstate_up=0  oldstate=0 oldstate_down=0 oldstate_ok=0 while_satat=1
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
	LDS        R27, _oldstate_ok+0
	CBR        R27, BitMask(_oldstate_ok+0)
	STS        _oldstate_ok+0, R27
	LDS        R27, _while_satat+0
	SBR        R27, BitMask(_while_satat+0)
	STS        _while_satat+0, R27
;MyProject.mbas,1121 :: 		if (Button(PIND, 0, 0.1, 1)<> 0) then    ' Detect logical one setting key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	CPI        R16, 0
	BRNE       L__Keypad_Blinking895
	JMP        L__Keypad_Blinking384
L__Keypad_Blinking895:
;MyProject.mbas,1122 :: 		oldstate = 1
	LDS        R27, _oldstate+0
	SBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,1123 :: 		Lcd_0()
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	CALL       _Lcd_0+0
;MyProject.mbas,1124 :: 		txt1 = "<Exit is selected>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
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
;MyProject.mbas,1125 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;MyProject.mbas,1126 :: 		Delay_mS(400)                      ' Update flag
	LDI        R18, 17
	LDI        R17, 60
	LDI        R16, 204
L__Keypad_Blinking386:
	DEC        R16
	BRNE       L__Keypad_Blinking386
	DEC        R17
	BRNE       L__Keypad_Blinking386
	DEC        R18
	BRNE       L__Keypad_Blinking386
L__Keypad_Blinking384:
;MyProject.mbas,1128 :: 		if (oldstate and Button(PIND, 0, 0.1, 0)) then    ' Detect one-to-zero transition
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	CLR        R6
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	LDS        R0, _oldstate+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_Blinking896
	JMP        L__Keypad_Blinking389
L__Keypad_Blinking896:
;MyProject.mbas,1129 :: 		oldstate = 0
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,1130 :: 		while_state_blinking=0
	LDS        R27, _while_state_blinking+0
	CBR        R27, BitMask(_while_state_blinking+0)
	STS        _while_state_blinking+0, R27
;MyProject.mbas,1131 :: 		while_satat=0
	LDS        R27, _while_satat+0
	CBR        R27, BitMask(_while_satat+0)
	STS        _while_satat+0, R27
;MyProject.mbas,1132 :: 		while_satate_in_1=0
	LDS        R27, _while_satate_in_1+0
	CBR        R27, BitMask(_while_satate_in_1+0)
	STS        _while_satate_in_1+0, R27
;MyProject.mbas,1133 :: 		kp=3
	LDI        R27, 3
	STS        _kp+0, R27
	LDI        R27, 0
	STS        _kp+1, R27
L__Keypad_Blinking389:
;MyProject.mbas,1135 :: 		if (Button(PINA, 4, 0.1, 1)<> 0) then    ' Detect logical down setting key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	CPI        R16, 0
	BRNE       L__Keypad_Blinking897
	JMP        L__Keypad_Blinking392
L__Keypad_Blinking897:
;MyProject.mbas,1136 :: 		oldstate_down = 1                      ' Update flag
	LDS        R27, _oldstate_down+0
	SBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;MyProject.mbas,1137 :: 		Delay_mS(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Keypad_Blinking394:
	DEC        R16
	BRNE       L__Keypad_Blinking394
	DEC        R17
	BRNE       L__Keypad_Blinking394
	DEC        R18
	BRNE       L__Keypad_Blinking394
	NOP
L__Keypad_Blinking392:
;MyProject.mbas,1139 :: 		if (oldstate_down and Button(PINA, 4, 0.1, 0)) then    ' Detect one-to-zero transition
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	CLR        R6
	CLR        R5
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	LDS        R0, _oldstate_down+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_down+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_Blinking898
	JMP        L__Keypad_Blinking397
L__Keypad_Blinking898:
;MyProject.mbas,1140 :: 		oldstate_down=0
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;MyProject.mbas,1141 :: 		while_state_blinking=0
	LDS        R27, _while_state_blinking+0
	CBR        R27, BitMask(_while_state_blinking+0)
	STS        _while_state_blinking+0, R27
;MyProject.mbas,1142 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,1143 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;MyProject.mbas,1144 :: 		if (kp=Kp_min) then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CP         R16, R6
	CPC        R17, R7
	BREQ       L__Keypad_Blinking899
	JMP        L__Keypad_Blinking400
L__Keypad_Blinking899:
;MyProject.mbas,1145 :: 		kp=Kp_Max
	STS        _kp+0, R4
	STS        _kp+1, R5
;MyProject.mbas,1146 :: 		txt1 = "Cal Rel Pwm <Ex>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1147 :: 		Lcd_Out(1,1,txt1)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1148 :: 		Lcd_Chr(2, 13, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1149 :: 		Lcd_Chr(2, 14, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 14
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1150 :: 		Lcd_Chr(2, 15, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 15
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	JMP        L__Keypad_Blinking401
;MyProject.mbas,1151 :: 		else
L__Keypad_Blinking400:
;MyProject.mbas,1152 :: 		kp=kp-1
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kp+0, R16
	STS        _kp+1, R17
;MyProject.mbas,1153 :: 		if kp =0 then
	CPI        R17, 0
	BRNE       L__Keypad_Blinking900
	CPI        R16, 0
L__Keypad_Blinking900:
	BREQ       L__Keypad_Blinking901
	JMP        L__Keypad_Blinking403
L__Keypad_Blinking901:
;MyProject.mbas,1155 :: 		txt1 = "Cal Rel Pwm <Ex>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1156 :: 		Lcd_Out(1,1,txt1)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1157 :: 		Lcd_Chr(2, 1, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1158 :: 		Lcd_Chr(2, 2, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1159 :: 		Lcd_Chr(2, 3, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
L__Keypad_Blinking403:
;MyProject.mbas,1161 :: 		if kp =1 then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_Blinking902
	CPI        R16, 1
L__Keypad_Blinking902:
	BREQ       L__Keypad_Blinking903
	JMP        L__Keypad_Blinking406
L__Keypad_Blinking903:
;MyProject.mbas,1163 :: 		txt1 = "Cal Rel Pwm <Ex>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1164 :: 		Lcd_Out(1,1,txt1)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1165 :: 		Lcd_Chr(2, 5, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1166 :: 		Lcd_Chr(2, 6, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1167 :: 		Lcd_Chr(2, 7, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
L__Keypad_Blinking406:
;MyProject.mbas,1169 :: 		if kp =2 then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_Blinking904
	CPI        R16, 2
L__Keypad_Blinking904:
	BREQ       L__Keypad_Blinking905
	JMP        L__Keypad_Blinking409
L__Keypad_Blinking905:
;MyProject.mbas,1171 :: 		txt1 = "Cal Rel Pwm <Ex>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1172 :: 		Lcd_Out(1,1,txt1)
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1173 :: 		Lcd_Chr(2, 9, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1174 :: 		Lcd_Chr(2, 10, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1175 :: 		Lcd_Chr(2, 11, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
L__Keypad_Blinking409:
;MyProject.mbas,1177 :: 		end if
L__Keypad_Blinking401:
L__Keypad_Blinking397:
;MyProject.mbas,1179 :: 		if (Button(PINA, 5, 0.1, 1)<> 0) then    ' Detect logical UP setting key
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 5
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	CPI        R16, 0
	BRNE       L__Keypad_Blinking906
	JMP        L__Keypad_Blinking412
L__Keypad_Blinking906:
;MyProject.mbas,1180 :: 		oldstate_up = 1                      ' Update flag
	LDS        R27, _oldstate_up+0
	SBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
;MyProject.mbas,1181 :: 		Delay_mS(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Keypad_Blinking414:
	DEC        R16
	BRNE       L__Keypad_Blinking414
	DEC        R17
	BRNE       L__Keypad_Blinking414
	DEC        R18
	BRNE       L__Keypad_Blinking414
	NOP
L__Keypad_Blinking412:
;MyProject.mbas,1184 :: 		if ((oldstate_up) and (Button(PINA, 5, 0.1, 0))) then    ' Detect one-to-zero transition
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	CLR        R6
	CLR        R5
	LDI        R27, 5
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
	LDS        R0, _oldstate_up+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_up+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_Blinking907
	JMP        L__Keypad_Blinking417
L__Keypad_Blinking907:
;MyProject.mbas,1185 :: 		oldstate_up=0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
;MyProject.mbas,1186 :: 		while_state_blinking=0
	LDS        R27, _while_state_blinking+0
	CBR        R27, BitMask(_while_state_blinking+0)
	STS        _while_state_blinking+0, R27
;MyProject.mbas,1187 :: 		Lcd_0()
	PUSH       R7
	PUSH       R6
	PUSH       R5
	PUSH       R4
	CALL       _Lcd_0+0
	POP        R4
	POP        R5
	POP        R6
	POP        R7
;MyProject.mbas,1188 :: 		if (kp=Kp_Max) then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CP         R16, R4
	CPC        R17, R5
	BREQ       L__Keypad_Blinking908
	JMP        L__Keypad_Blinking420
L__Keypad_Blinking908:
;MyProject.mbas,1189 :: 		kp=Kp_min
	STS        _kp+0, R6
	STS        _kp+1, R7
;MyProject.mbas,1190 :: 		txt1 = "Cal Rel Pwm <Ex>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1191 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1192 :: 		Lcd_Chr(2, 1, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1193 :: 		Lcd_Chr(2, 2, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1194 :: 		Lcd_Chr(2, 3, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	JMP        L__Keypad_Blinking421
;MyProject.mbas,1195 :: 		else
L__Keypad_Blinking420:
;MyProject.mbas,1196 :: 		kp=kp+1
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _kp+0, R16
	STS        _kp+1, R17
;MyProject.mbas,1197 :: 		if kp =3 then
	CPI        R17, 0
	BRNE       L__Keypad_Blinking909
	CPI        R16, 3
L__Keypad_Blinking909:
	BREQ       L__Keypad_Blinking910
	JMP        L__Keypad_Blinking423
L__Keypad_Blinking910:
;MyProject.mbas,1198 :: 		txt1 = "Cal Rel Pwm <Ex>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1199 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1200 :: 		Lcd_Chr(2, 13, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1201 :: 		Lcd_Chr(2, 14, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 14
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1202 :: 		Lcd_Chr(2, 15, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 15
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
L__Keypad_Blinking423:
;MyProject.mbas,1204 :: 		if kp =1 then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_Blinking911
	CPI        R16, 1
L__Keypad_Blinking911:
	BREQ       L__Keypad_Blinking912
	JMP        L__Keypad_Blinking426
L__Keypad_Blinking912:
;MyProject.mbas,1205 :: 		txt1 = "Cal Rel Pwm <Ex>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1206 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1207 :: 		Lcd_Chr(2, 5, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1208 :: 		Lcd_Chr(2, 6, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1209 :: 		Lcd_Chr(2, 7, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
L__Keypad_Blinking426:
;MyProject.mbas,1211 :: 		if kp =2 then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_Blinking913
	CPI        R16, 2
L__Keypad_Blinking913:
	BREQ       L__Keypad_Blinking914
	JMP        L__Keypad_Blinking429
L__Keypad_Blinking914:
;MyProject.mbas,1212 :: 		txt1 = "Cal Rel Pwm <Ex>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1213 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1214 :: 		Lcd_Chr(2, 9, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1215 :: 		Lcd_Chr(2, 10, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 10
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,1216 :: 		Lcd_Chr(2, 11, 94)
	LDI        R27, 94
	MOV        R4, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
L__Keypad_Blinking429:
;MyProject.mbas,1219 :: 		end if
L__Keypad_Blinking421:
L__Keypad_Blinking417:
;MyProject.mbas,1223 :: 		if (Button(PINA, 6, 0.1, 1)<> 0) then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_Blinking915
	JMP        L__Keypad_Blinking432
L__Keypad_Blinking915:
;MyProject.mbas,1224 :: 		oldstate_ok =1
	LDS        R27, _oldstate_ok+0
	SBR        R27, BitMask(_oldstate_ok+0)
	STS        _oldstate_ok+0, R27
;MyProject.mbas,1225 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1226 :: 		txt1 = "ok"
	LDI        R27, 111
	STS        _txt1+0, R27
	LDI        R27, 107
	STS        _txt1+1, R27
	LDI        R27, 0
	STS        _txt1+2, R27
;MyProject.mbas,1227 :: 		Lcd_Out(1,1,txt1)
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1228 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_Blinking434:
	DEC        R16
	BRNE       L__Keypad_Blinking434
	DEC        R17
	BRNE       L__Keypad_Blinking434
	DEC        R18
	BRNE       L__Keypad_Blinking434
L__Keypad_Blinking432:
;MyProject.mbas,1230 :: 		if ((oldstate_ok)  and (Button(PINA, 6, 0.1, 0))) then    ' Detect one-to-zero transition
	CLR        R6
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_ok+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_ok+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_Blinking916
	JMP        L__Keypad_Blinking437
L__Keypad_Blinking916:
;MyProject.mbas,1231 :: 		oldstate_ok=0
	LDS        R27, _oldstate_ok+0
	CBR        R27, BitMask(_oldstate_ok+0)
	STS        _oldstate_ok+0, R27
;MyProject.mbas,1232 :: 		while_state_blinking=0
	LDS        R27, _while_state_blinking+0
	CBR        R27, BitMask(_while_state_blinking+0)
	STS        _while_state_blinking+0, R27
;MyProject.mbas,1233 :: 		while_satate_in_1=0
	LDS        R27, _while_satate_in_1+0
	CBR        R27, BitMask(_while_satate_in_1+0)
	STS        _while_satate_in_1+0, R27
;MyProject.mbas,1234 :: 		while_satat=0
	LDS        R27, _while_satat+0
	CBR        R27, BitMask(_while_satat+0)
	STS        _while_satat+0, R27
L__Keypad_Blinking437:
;MyProject.mbas,1238 :: 		end sub
L_end_Keypad_Blinking:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _Keypad_Blinking

_Keypad_3:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 27
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,1247 :: 		sub procedure Keypad_3()
;MyProject.mbas,1251 :: 		kp=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, 0
	STS        _kp+0, R27
	STS        _kp+1, R27
;MyProject.mbas,1252 :: 		ok=0
	LDI        R27, 0
	STS        _ok+0, R27
	STS        _ok+1, R27
;MyProject.mbas,1256 :: 		oldstate = 0
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
;MyProject.mbas,1257 :: 		oldstate_up=0
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
;MyProject.mbas,1258 :: 		oldstate_down=0
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;MyProject.mbas,1259 :: 		oldstate_ok=0
	LDS        R27, _oldstate_ok+0
	CBR        R27, BitMask(_oldstate_ok+0)
	STS        _oldstate_ok+0, R27
;MyProject.mbas,1260 :: 		oldstate_ww=0
	LDS        R27, _oldstate_ww+0
	CBR        R27, BitMask(_oldstate_ww+0)
	STS        _oldstate_ww+0, R27
;MyProject.mbas,1261 :: 		while_state=1
	LDS        R27, _while_state+0
	SBR        R27, BitMask(_while_state+0)
	STS        _while_state+0, R27
;MyProject.mbas,1263 :: 		while_satate_in_1=1
	LDS        R27, _while_satate_in_1+0
	SBR        R27, BitMask(_while_satate_in_1+0)
	STS        _while_satate_in_1+0, R27
;MyProject.mbas,1264 :: 		txt1 = "Cal Rel Pwm <Ex>"
	LDI        R30, #lo_addr(_txt1+0)
	LDI        R31, hi_addr(_txt1+0)
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
;MyProject.mbas,1269 :: 		Lcd_Keypad_3(1,2,3,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 3
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
;MyProject.mbas,1288 :: 		while  (while_satate_in_1 )
L__Keypad_3441:
	LDS        R27, _while_satate_in_1+0
	SBRS       R27, BitPos(_while_satate_in_1+0)
	JMP        L__Keypad_3442
;MyProject.mbas,1290 :: 		if (Button(PIND, 0, 0.1, 1)<> 0) then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	CLR        R4
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_3918
	JMP        L__Keypad_3446
L__Keypad_3918:
;MyProject.mbas,1291 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1292 :: 		oldstate = 1                      ' Update flag
	LDS        R27, _oldstate+0
	SBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
L__Keypad_3446:
;MyProject.mbas,1294 :: 		if (oldstate and Button(PIND, 0, 0.1, 0)) then    ' Detect one-to-zero transition
	CLR        R6
	CLR        R5
	CLR        R4
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
	BRNE       L__Keypad_3919
	JMP        L__Keypad_3449
L__Keypad_3919:
;MyProject.mbas,1295 :: 		oldstate = 0 while_state=0  while_satate_in_1=0  kp=3
	LDS        R27, _oldstate+0
	CBR        R27, BitMask(_oldstate+0)
	STS        _oldstate+0, R27
	LDS        R27, _while_state+0
	CBR        R27, BitMask(_while_state+0)
	STS        _while_state+0, R27
	LDS        R27, _while_satate_in_1+0
	CBR        R27, BitMask(_while_satate_in_1+0)
	STS        _while_satate_in_1+0, R27
	LDI        R27, 3
	STS        _kp+0, R27
	LDI        R27, 0
	STS        _kp+1, R27
;MyProject.mbas,1303 :: 		Lcd_Out(1,1, "<Exit> is Selected")
	MOVW       R30, R28
	LDI        R27, 60
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 62
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 83
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1308 :: 		Delay_mS(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Keypad_3451:
	DEC        R16
	BRNE       L__Keypad_3451
	DEC        R17
	BRNE       L__Keypad_3451
	DEC        R18
	BRNE       L__Keypad_3451
	NOP
L__Keypad_3449:
;MyProject.mbas,1310 :: 		if (Button(PINA, 4, 0.1, 1)<> 0) then    ' Detect logical down setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_3920
	JMP        L__Keypad_3454
L__Keypad_3920:
;MyProject.mbas,1311 :: 		oldstate_down = 1                      ' Update flag
	LDS        R27, _oldstate_down+0
	SBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
L__Keypad_3454:
;MyProject.mbas,1313 :: 		if (oldstate_down and Button(PINA, 4, 0.1, 0)) then    ' Detect one-to-zero transition
	CLR        R6
	CLR        R5
	LDI        R27, 4
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_down+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_down+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_3921
	JMP        L__Keypad_3457
L__Keypad_3921:
;MyProject.mbas,1314 :: 		oldstate_down=0
	LDS        R27, _oldstate_down+0
	CBR        R27, BitMask(_oldstate_down+0)
	STS        _oldstate_down+0, R27
;MyProject.mbas,1315 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1316 :: 		if (kp=0) then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3922
	CPI        R16, 0
L__Keypad_3922:
	BREQ       L__Keypad_3923
	JMP        L__Keypad_3460
L__Keypad_3923:
;MyProject.mbas,1317 :: 		kp=3
	LDI        R27, 3
	STS        _kp+0, R27
	LDI        R27, 0
	STS        _kp+1, R27
;MyProject.mbas,1318 :: 		Lcd_Keypad_3(13,14,15,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 15
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 14
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 13
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
	JMP        L__Keypad_3461
;MyProject.mbas,1332 :: 		else
L__Keypad_3460:
;MyProject.mbas,1333 :: 		kp=kp-1
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kp+0, R16
	STS        _kp+1, R17
;MyProject.mbas,1334 :: 		if kp =0 then
	CPI        R17, 0
	BRNE       L__Keypad_3924
	CPI        R16, 0
L__Keypad_3924:
	BREQ       L__Keypad_3925
	JMP        L__Keypad_3463
L__Keypad_3925:
;MyProject.mbas,1346 :: 		Lcd_Keypad_3(1,2,3,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 3
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
L__Keypad_3463:
;MyProject.mbas,1351 :: 		if kp =1 then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3926
	CPI        R16, 1
L__Keypad_3926:
	BREQ       L__Keypad_3927
	JMP        L__Keypad_3466
L__Keypad_3927:
;MyProject.mbas,1356 :: 		Lcd_Keypad_3(5,6,7,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 7
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 5
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
L__Keypad_3466:
;MyProject.mbas,1362 :: 		if kp =2 then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3928
	CPI        R16, 2
L__Keypad_3928:
	BREQ       L__Keypad_3929
	JMP        L__Keypad_3469
L__Keypad_3929:
;MyProject.mbas,1367 :: 		Lcd_Keypad_3(9,10,11,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 11
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 10
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 9
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
L__Keypad_3469:
;MyProject.mbas,1373 :: 		end if
L__Keypad_3461:
;MyProject.mbas,1376 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_3471:
	DEC        R16
	BRNE       L__Keypad_3471
	DEC        R17
	BRNE       L__Keypad_3471
	DEC        R18
	BRNE       L__Keypad_3471
L__Keypad_3457:
;MyProject.mbas,1378 :: 		if (Button(PINA, 5, 0.1, 1)<> 0) then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 5
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_3930
	JMP        L__Keypad_3474
L__Keypad_3930:
;MyProject.mbas,1379 :: 		oldstate_up = 1                      ' Update flag
	LDS        R27, _oldstate_up+0
	SBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
L__Keypad_3474:
;MyProject.mbas,1381 :: 		if ((oldstate_up) and (Button(PINA, 5, 0.1, 0))) then    ' Detect one-to-zero transition
	CLR        R6
	CLR        R5
	LDI        R27, 5
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_up+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_up+0)
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_3931
	JMP        L__Keypad_3477
L__Keypad_3931:
;MyProject.mbas,1382 :: 		oldstate_up=0 while_state_blinking=1
	LDS        R27, _oldstate_up+0
	CBR        R27, BitMask(_oldstate_up+0)
	STS        _oldstate_up+0, R27
	LDS        R27, _while_state_blinking+0
	SBR        R27, BitMask(_while_state_blinking+0)
	STS        _while_state_blinking+0, R27
;MyProject.mbas,1383 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1384 :: 		if (kp=3) then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3932
	CPI        R16, 3
L__Keypad_3932:
	BREQ       L__Keypad_3933
	JMP        L__Keypad_3480
L__Keypad_3933:
;MyProject.mbas,1385 :: 		kp=0
	LDI        R27, 0
	STS        _kp+0, R27
	STS        _kp+1, R27
;MyProject.mbas,1396 :: 		Lcd_Keypad_3(1,2,3,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 3
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
	JMP        L__Keypad_3481
;MyProject.mbas,1400 :: 		else
L__Keypad_3480:
;MyProject.mbas,1401 :: 		kp=kp+1
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _kp+0, R16
	STS        _kp+1, R17
;MyProject.mbas,1402 :: 		if kp =3 then
	CPI        R17, 0
	BRNE       L__Keypad_3934
	CPI        R16, 3
L__Keypad_3934:
	BREQ       L__Keypad_3935
	JMP        L__Keypad_3483
L__Keypad_3935:
;MyProject.mbas,1413 :: 		Lcd_Keypad_3(13,14,15,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 15
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 14
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 13
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
L__Keypad_3483:
;MyProject.mbas,1420 :: 		if kp =1 then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3936
	CPI        R16, 1
L__Keypad_3936:
	BREQ       L__Keypad_3937
	JMP        L__Keypad_3486
L__Keypad_3937:
;MyProject.mbas,1424 :: 		Lcd_Keypad_3(5,6,7,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 7
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 5
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
L__Keypad_3486:
;MyProject.mbas,1430 :: 		if kp =2 then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3938
	CPI        R16, 2
L__Keypad_3938:
	BREQ       L__Keypad_3939
	JMP        L__Keypad_3489
L__Keypad_3939:
;MyProject.mbas,1434 :: 		Lcd_Keypad_3(9,10,11,94)
	LDI        R27, 94
	MOV        R8, R27
	LDI        R27, 0
	MOV        R9, R27
	LDI        R27, 11
	MOV        R6, R27
	LDI        R27, 0
	MOV        R7, R27
	LDI        R27, 10
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 9
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _Lcd_Keypad_3+0
L__Keypad_3489:
;MyProject.mbas,1441 :: 		end if
L__Keypad_3481:
;MyProject.mbas,1443 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_3491:
	DEC        R16
	BRNE       L__Keypad_3491
	DEC        R17
	BRNE       L__Keypad_3491
	DEC        R18
	BRNE       L__Keypad_3491
L__Keypad_3477:
;MyProject.mbas,1446 :: 		if (Button(PINA, 6, 0.1, 1)<> 0) then    ' Detect logical one setting key
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__Keypad_3940
	JMP        L__Keypad_3494
L__Keypad_3940:
;MyProject.mbas,1447 :: 		oldstate_ok =1
	LDS        R27, _oldstate_ok+0
	SBR        R27, BitMask(_oldstate_ok+0)
	STS        _oldstate_ok+0, R27
L__Keypad_3494:
;MyProject.mbas,1449 :: 		if ((oldstate_ok) and (while_satate_in_1) and (Button(PINA, 6, 0.1, 0))) then    ' Detect one-to-zero transition
	LDS        R1, _oldstate_ok+0
	LDS        R0, _while_satate_in_1+0
	CBR        R20, 1
	SBRC       R1, BitPos(_oldstate_ok+0)
	SBRS       R0, BitPos(_while_satate_in_1+0)
	RJMP       L__Keypad_3944
	SBR        R20, 1
L__Keypad_3944:
	CLR        R6
	CLR        R5
	LDI        R27, 6
	MOV        R4, R27
	LDI        R27, #lo_addr(PINA+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINA+0)
	MOV        R3, R27
	CALL       _Button+0
	CLR        R17
	SBRC       R20, 0
	INC        R17
	AND        R16, R17
	BRNE       L__Keypad_3945
	JMP        L__Keypad_3497
L__Keypad_3945:
;MyProject.mbas,1450 :: 		while_state=0
	LDS        R27, _while_state+0
	CBR        R27, BitMask(_while_state+0)
	STS        _while_state+0, R27
;MyProject.mbas,1451 :: 		while_satate_in_1=0
	LDS        R27, _while_satate_in_1+0
	CBR        R27, BitMask(_while_satate_in_1+0)
	STS        _while_satate_in_1+0, R27
;MyProject.mbas,1452 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1453 :: 		oldstate_ok = 1                      ' Update flag
	LDS        R27, _oldstate_ok+0
	SBR        R27, BitMask(_oldstate_ok+0)
	STS        _oldstate_ok+0, R27
;MyProject.mbas,1454 :: 		if (kp=3) then
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3946
	CPI        R16, 3
L__Keypad_3946:
	BREQ       L__Keypad_3947
	JMP        L__Keypad_3500
L__Keypad_3947:
;MyProject.mbas,1456 :: 		LCD_Out(1,1, "Exit is aitctived")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
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
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 118
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
	JMP        L__Keypad_3501
;MyProject.mbas,1457 :: 		else
L__Keypad_3500:
;MyProject.mbas,1459 :: 		LCD_Out(1,1, "Setting is actived")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
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
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 118
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
;MyProject.mbas,1460 :: 		end if
L__Keypad_3501:
;MyProject.mbas,1463 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__Keypad_3502:
	DEC        R16
	BRNE       L__Keypad_3502
	DEC        R17
	BRNE       L__Keypad_3502
	DEC        R18
	BRNE       L__Keypad_3502
L__Keypad_3497:
;MyProject.mbas,1467 :: 		wend
	JMP        L__Keypad_3441
L__Keypad_3442:
;MyProject.mbas,1468 :: 		inttostr(kp,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _kp+0
	LDS        R3, _kp+1
	CALL       _IntToStr+0
;MyProject.mbas,1469 :: 		LCD_Out(1,2, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1470 :: 		Delay_mS(2500)
	LDI        R18, 102
	LDI        R17, 118
	LDI        R16, 194
L__Keypad_3504:
	DEC        R16
	BRNE       L__Keypad_3504
	DEC        R17
	BRNE       L__Keypad_3504
	DEC        R18
	BRNE       L__Keypad_3504
;MyProject.mbas,1476 :: 		case 0
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3948
	CPI        R16, 0
L__Keypad_3948:
	BREQ       L__Keypad_3949
	JMP        L__Keypad_3509
L__Keypad_3949:
;MyProject.mbas,1477 :: 		kp = 0  ' 1
	LDI        R27, 0
	STS        _kp+0, R27
	STS        _kp+1, R27
;MyProject.mbas,1479 :: 		LCD_Out(2,1, "Case Cal is selected ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
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
;MyProject.mbas,1480 :: 		Keypad_set__date_time()
	CALL       _Keypad_set__date_time+0
;MyProject.mbas,1482 :: 		inttostr(kp,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _kp+0
	LDS        R3, _kp+1
	CALL       _IntToStr+0
;MyProject.mbas,1483 :: 		LCD_Out(1,1, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1484 :: 		inttostr(kp,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _kp+0
	LDS        R3, _kp+1
	CALL       _IntToStr+0
;MyProject.mbas,1485 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1486 :: 		LCD_Out(2,1, "Case Cal is selected ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
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
	JMP        L__Keypad_3506
L__Keypad_3509:
;MyProject.mbas,1489 :: 		case 1                             ' ????? ???? ???? ? ????? ??? ??? ??
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3950
	CPI        R16, 1
L__Keypad_3950:
	BREQ       L__Keypad_3951
	JMP        L__Keypad_3512
L__Keypad_3951:
;MyProject.mbas,1490 :: 		LCD_Out(2,1, "Case Relay is is selected ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 121
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
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
;MyProject.mbas,1492 :: 		Keypad_Relay_set__date_time_1()
	CALL       _Keypad_Relay_set__date_time_1+0
;MyProject.mbas,1493 :: 		LCD_Out(2,1, "end of case relay ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 102
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 121
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
;MyProject.mbas,1496 :: 		inttostr(kp,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _kp+0
	LDS        R3, _kp+1
	CALL       _IntToStr+0
;MyProject.mbas,1497 :: 		LCD_Out(1,1, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1498 :: 		inttostr(kp,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _kp+0
	LDS        R3, _kp+1
	CALL       _IntToStr+0
;MyProject.mbas,1499 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1500 :: 		LCD_Out(2,1, "Case Relay is is selected ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 121
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 115
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
	JMP        L__Keypad_3506
L__Keypad_3512:
;MyProject.mbas,1503 :: 		case 2
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3952
	CPI        R16, 2
L__Keypad_3952:
	BREQ       L__Keypad_3953
	JMP        L__Keypad_3515
L__Keypad_3953:
;MyProject.mbas,1505 :: 		LCD_Out(2,1, "Case PWM is selected ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 77
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
;MyProject.mbas,1506 :: 		Keypad_set__date_time()
	CALL       _Keypad_set__date_time+0
;MyProject.mbas,1508 :: 		inttostr(kp,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _kp+0
	LDS        R3, _kp+1
	CALL       _IntToStr+0
;MyProject.mbas,1509 :: 		LCD_Out(1,1, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1510 :: 		inttostr(kp,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _kp+0
	LDS        R3, _kp+1
	CALL       _IntToStr+0
;MyProject.mbas,1511 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1512 :: 		LCD_Out(2,1, "Case PWM  is selected ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 32
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
	JMP        L__Keypad_3506
L__Keypad_3515:
;MyProject.mbas,1515 :: 		case 3
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3954
	CPI        R16, 3
L__Keypad_3954:
	BREQ       L__Keypad_3955
	JMP        L__Keypad_3518
L__Keypad_3955:
;MyProject.mbas,1516 :: 		inttostr(kp,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _kp+0
	LDS        R3, _kp+1
	CALL       _IntToStr+0
;MyProject.mbas,1517 :: 		LCD_Out(1,1, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1518 :: 		inttostr(kp,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _kp+0
	LDS        R3, _kp+1
	CALL       _IntToStr+0
;MyProject.mbas,1519 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1520 :: 		LCD_Out(2,1, "Case  Exit is selected ")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 120
	ST         Z+, R27
	LDI        R27, 105
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
	JMP        L__Keypad_3506
L__Keypad_3518:
;MyProject.mbas,1522 :: 		case 4
	LDS        R16, _kp+0
	LDS        R17, _kp+1
	CPI        R17, 0
	BRNE       L__Keypad_3956
	CPI        R16, 4
L__Keypad_3956:
	BREQ       L__Keypad_3957
	JMP        L__Keypad_3521
L__Keypad_3957:
;MyProject.mbas,1523 :: 		kp = 4  ' A
	LDI        R27, 4
	STS        _kp+0, R27
	LDI        R27, 0
	STS        _kp+1, R27
	JMP        L__Keypad_3506
L__Keypad_3521:
L__Keypad_3506:
;MyProject.mbas,1525 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__Keypad_3522:
	DEC        R16
	BRNE       L__Keypad_3522
	DEC        R17
	BRNE       L__Keypad_3522
	DEC        R18
	BRNE       L__Keypad_3522
	NOP
;MyProject.mbas,1528 :: 		end sub
L_end_Keypad_3:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 26
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _Keypad_3

_pwm_set_1B:

;MyProject.mbas,1534 :: 		Sub procedure pwm_set_1B(dim pulse_width as  char )
;MyProject.mbas,1536 :: 		OCR1BL = pulse_width ''  //Load Pulse width
	OUT        OCR1BL+0, R2
;MyProject.mbas,1537 :: 		OCR1AL = pulse_width ''  //Load Pulse width
	OUT        OCR1AL+0, R2
;MyProject.mbas,1538 :: 		OCR0 = pulse_width
	OUT        OCR0+0, R2
;MyProject.mbas,1539 :: 		OCR2 = pulse_width
	OUT        OCR2+0, R2
;MyProject.mbas,1544 :: 		TCCR0 = (1<<FOC2)or (1<<COM21)or(1<<COM20) or(1<<WGM20) or (1<<CS00)
	LDI        R27, 241
	OUT        TCCR0+0, R27
;MyProject.mbas,1545 :: 		TCCR1A  = (1<<FOC2)or(1<<COM21)or(1<<COM20)or (1<<WGM20)or(1<<CS00)
	LDI        R27, 241
	OUT        TCCR1A+0, R27
;MyProject.mbas,1546 :: 		TCCR2 = (1<<FOC2)or(1<<COM21)or(1<<COM20)or(1<<WGM20) or(1<<CS00)
	LDI        R27, 241
	OUT        TCCR2+0, R27
;MyProject.mbas,1548 :: 		TCCR1B = 1<<CS10
	LDI        R27, 1
	OUT        TCCR1B+0, R27
;MyProject.mbas,1549 :: 		end sub
L_end_pwm_set_1B:
	RET
; end of _pwm_set_1B

_Timer2_Compare:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;MyProject.mbas,1551 :: 		Sub procedure Timer2_Compare iv IVT_ADDR_TIMER2_COMP 'L?st aus alle (8Mhz/1024/125) 16ms
;MyProject.mbas,1552 :: 		inc(_ss)
	LDS        R16, __ss+0
	LDS        R17, __ss+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        __ss+0, R16
	STS        __ss+1, R17
;MyProject.mbas,1553 :: 		End sub
L_end_Timer2_Compare:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Timer2_Compare

_Timer0_overflow:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;MyProject.mbas,1555 :: 		sub procedure Timer0_overflow iv IVT_ADDR_TIMER0_OVF
;MyProject.mbas,1556 :: 		inc(_zz)
	LDS        R16, __zz+0
	LDS        R17, __zz+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        __zz+0, R16
	STS        __zz+1, R17
;MyProject.mbas,1557 :: 		TIFR.TOV0=0
	IN         R27, TIFR+0
	CBR        R27, 1
	OUT        TIFR+0, R27
;MyProject.mbas,1558 :: 		portf0_bit=not Portf0_bit
	LDS        R0, PORTF0_bit+0
	LDI        R27, BitMask(PORTF0_bit+0)
	EOR        R0, R27
	STS        PORTF0_bit+0, R0
;MyProject.mbas,1559 :: 		end sub
L_end_Timer0_overflow:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Timer0_overflow

_SetRegister:

;MyProject.mbas,1561 :: 		sub procedure SetRegister()
;MyProject.mbas,1571 :: 		TCCR2.WGM21=1 'CTC Mode Aktivierung Timer2
	IN         R27, TCCR2+0
	SBR        R27, 8
	OUT        TCCR2+0, R27
;MyProject.mbas,1572 :: 		TCCR2.COM20=1 'set OCR Flag bei "Compare Match"
	IN         R27, TCCR2+0
	SBR        R27, 16
	OUT        TCCR2+0, R27
;MyProject.mbas,1573 :: 		TCCR2.COM21=1 'set OCR Flag bei "Compare Match"
	IN         R27, TCCR2+0
	SBR        R27, 32
	OUT        TCCR2+0, R27
;MyProject.mbas,1575 :: 		TCCR0.CS02=1 'Ext Flanke Interrupt (T0)
	IN         R27, TCCR0+0
	SBR        R27, 4
	OUT        TCCR0+0, R27
;MyProject.mbas,1576 :: 		TCCR0.CS01=1
	IN         R27, TCCR0+0
	SBR        R27, 2
	OUT        TCCR0+0, R27
;MyProject.mbas,1577 :: 		TCCR0.CS00=1
	IN         R27, TCCR0+0
	SBR        R27, 1
	OUT        TCCR0+0, R27
;MyProject.mbas,1579 :: 		TCCR2.CS22=1 'Set Prescaler Timer2 1024 setzen
	IN         R27, TCCR2+0
	SBR        R27, 4
	OUT        TCCR2+0, R27
;MyProject.mbas,1580 :: 		TCCR2.CS21=1
	IN         R27, TCCR2+0
	SBR        R27, 2
	OUT        TCCR2+0, R27
;MyProject.mbas,1581 :: 		TCCR2.CS20=1
	IN         R27, TCCR2+0
	SBR        R27, 1
	OUT        TCCR2+0, R27
;MyProject.mbas,1583 :: 		OCR2=124 'Set Output Compare register Timer2 to 124 (for Loop 0-124 => 125)
	LDI        R27, 124
	OUT        OCR2+0, R27
;MyProject.mbas,1584 :: 		TIMSK.OCIE2=1 ' Enable comp match flag interrupt Timer 2
	IN         R27, TIMSK+0
	SBR        R27, 128
	OUT        TIMSK+0, R27
;MyProject.mbas,1585 :: 		TIMSK.TOIE0=1 ' Enable OV flag interrupt Timer 0
	IN         R27, TIMSK+0
	SBR        R27, 1
	OUT        TIMSK+0, R27
;MyProject.mbas,1586 :: 		SREG.SREG_I=1
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;MyProject.mbas,1587 :: 		End Sub
L_end_SetRegister:
	RET
; end of _SetRegister

_strToInt1:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 28
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,1592 :: 		tempCh as char
;MyProject.mbas,1593 :: 		output = 0  ex=0
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
;MyProject.mbas,1594 :: 		i = 1  stringLength = strlen(st)  temp = 0   numberLength = 0
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
;MyProject.mbas,1596 :: 		for j = 0 to stringLength-1
	LDI        R27, 0
	STD        Y+4, R27
	STD        Y+5, R27
; stringLength end address is: 25 (R25)
L__strToInt1529:
; stringLength start address is: 25 (R25)
	MOV        R21, R25
	MOV        R22, R26
	SUBI       R21, 1
	SBCI       R22, 0
	LDD        R16, Y+4
	LDD        R17, Y+5
	CP         R21, R16
	CPC        R22, R17
	BRGE       L__strToInt1965
	JMP        L__strToInt1533
L__strToInt1965:
;MyProject.mbas,1598 :: 		tempCh = st[j]
	LDI        R18, #lo_addr(_st+0)
	LDI        R19, hi_addr(_st+0)
	LDD        R16, Y+4
	LDD        R17, Y+5
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R18, Z
;MyProject.mbas,1599 :: 		temp = tempCh - 48
	MOV        R16, R18
	LDI        R17, 0
	SUBI       R16, 48
	SBCI       R17, 0
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,1600 :: 		if   tempCh =46 then
	CPI        R18, 46
	BREQ       L__strToInt1966
	JMP        L__strToInt1535
L__strToInt1966:
;MyProject.mbas,1601 :: 		ex=1
	LDI        R27, 1
	STD        Y+6, R27
	LDI        R27, 0
	STD        Y+7, R27
L__strToInt1535:
;MyProject.mbas,1603 :: 		if (temp >= 0) and ( temp <= 9) and (ex=0)  then
	LDD        R19, Y+0
	LDD        R20, Y+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R19, R16
	CPC        R20, R17
	LDI        R18, 0
	BRLT       L__strToInt1967
	LDI        R18, 255
L__strToInt1967:
	LDI        R16, 9
	LDI        R17, 0
	CP         R16, R19
	CPC        R17, R20
	LDI        R27, 0
	BRLT       L__strToInt1968
	LDI        R27, 255
L__strToInt1968:
	MOV        R16, R27
	AND        R18, R16
	LDD        R16, Y+6
	LDD        R17, Y+7
	CPI        R17, 0
	BRNE       L__strToInt1969
	CPI        R16, 0
L__strToInt1969:
	LDI        R27, 0
	BRNE       L__strToInt1970
	LDI        R27, 255
L__strToInt1970:
	MOV        R16, R27
	AND        R16, R18
	BRNE       L__strToInt1971
	JMP        L__strToInt1538
L__strToInt1971:
;MyProject.mbas,1605 :: 		inc(numberLength)
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
L__strToInt1538:
;MyProject.mbas,1607 :: 		next j
	LDD        R16, Y+4
	LDD        R17, Y+5
	CP         R16, R21
	CPC        R17, R22
	BRNE       L__strToInt1972
	JMP        L__strToInt1533
L__strToInt1972:
	LDD        R16, Y+4
	LDD        R17, Y+5
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+4, R16
	STD        Y+5, R17
; stringLength end address is: 25 (R25)
	JMP        L__strToInt1529
L__strToInt1533:
;MyProject.mbas,1610 :: 		for j = 0 to numberLength-1
	LDI        R27, 0
	STD        Y+4, R27
	STD        Y+5, R27
L__strToInt1540:
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
	BRGE       L__strToInt1973
	JMP        L__strToInt1544
L__strToInt1973:
;MyProject.mbas,1612 :: 		tempCh = st[j]
	LDI        R18, #lo_addr(_st+0)
	LDI        R19, hi_addr(_st+0)
	LDD        R16, Y+4
	LDD        R17, Y+5
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
;MyProject.mbas,1613 :: 		temp = tempCh - 48
	MOV        R19, R16
	LDI        R20, 0
	SUBI       R19, 48
	SBCI       R20, 0
	STD        Y+0, R19
	STD        Y+1, R20
;MyProject.mbas,1614 :: 		if (temp >= 0) and (temp <= 9)  then
	LDI        R16, 0
	LDI        R17, 0
	CP         R19, R16
	CPC        R20, R17
	LDI        R18, 0
	BRLT       L__strToInt1974
	LDI        R18, 255
L__strToInt1974:
	LDI        R16, 9
	LDI        R17, 0
	CP         R16, R19
	CPC        R17, R20
	LDI        R27, 0
	BRLT       L__strToInt1975
	LDI        R27, 255
L__strToInt1975:
	MOV        R16, R27
	AND        R16, R18
	BRNE       L__strToInt1976
	JMP        L__strToInt1546
L__strToInt1976:
;MyProject.mbas,1616 :: 		output =output +  temp * pow(10, (numberLength-i))
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
;MyProject.mbas,1617 :: 		i=i+1
	LDD        R16, Y+8
	LDD        R17, Y+9
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+8, R16
	STD        Y+9, R17
L__strToInt1546:
;MyProject.mbas,1620 :: 		next j
	LDD        R18, Y+4
	LDD        R19, Y+5
	LDD        R16, Y+26
	LDD        R17, Y+27
	CP         R18, R16
	CPC        R19, R17
	BRNE       L__strToInt1977
	JMP        L__strToInt1544
L__strToInt1977:
	LDD        R16, Y+4
	LDD        R17, Y+5
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+4, R16
	STD        Y+5, R17
	JMP        L__strToInt1540
L__strToInt1544:
;MyProject.mbas,1622 :: 		end sub
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

;MyProject.mbas,1625 :: 		jjyear as float
;MyProject.mbas,1627 :: 		jjyear=ceil((jj*max_duty)/100)
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
;MyProject.mbas,1628 :: 		FloatToStr(jjyear, st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;MyProject.mbas,1633 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1635 :: 		strToInt1()
	CALL       _strToInt1+0
;MyProject.mbas,1637 :: 		IntToStr(ii, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _output+0
	LDS        R3, _output+1
	CALL       _IntToStr+0
;MyProject.mbas,1638 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1639 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1640 :: 		Delay_mS(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__PWM_MAKE_as_max549:
	DEC        R16
	BRNE       L__PWM_MAKE_as_max549
	DEC        R17
	BRNE       L__PWM_MAKE_as_max549
	DEC        R18
	BRNE       L__PWM_MAKE_as_max549
;MyProject.mbas,1641 :: 		end sub
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

;MyProject.mbas,1645 :: 		jjyear as float
;MyProject.mbas,1647 :: 		jjyear=ceil((jj*255)/100)
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
;MyProject.mbas,1648 :: 		FloatToStr(jjyear, st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;MyProject.mbas,1653 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1655 :: 		strToInt1()
	CALL       _strToInt1+0
	POP        R2
	POP        R5
	POP        R6
;MyProject.mbas,1656 :: 		ii =output
; ii start address is: 16 (R16)
	LDS        R16, _output+0
	LDS        R17, _output+1
;MyProject.mbas,1657 :: 		IntToStr(ii, txt)
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
;MyProject.mbas,1658 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1659 :: 		Lcd_Out(2,6,txt)
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
;MyProject.mbas,1660 :: 		IntToStr(jj, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,1661 :: 		Lcd_Out(2,1,txt)
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
;MyProject.mbas,1665 :: 		case 1
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE980
	LDI        R27, 1
	CP         R5, R27
L__PWM_MAKE980:
	BREQ       L__PWM_MAKE981
	JMP        L__PWM_MAKE555
L__PWM_MAKE981:
;MyProject.mbas,1668 :: 		PWM16bit_Change_Duty(ii, _TIMER1_CH_A )
	LDI        R27, 17
	MOV        R4, R27
	MOVW       R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE552
L__PWM_MAKE555:
;MyProject.mbas,1669 :: 		case 2
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE982
	LDI        R27, 2
	CP         R5, R27
L__PWM_MAKE982:
	BREQ       L__PWM_MAKE983
	JMP        L__PWM_MAKE558
L__PWM_MAKE983:
;MyProject.mbas,1672 :: 		PWM16bit_Change_Duty( ii, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	MOVW       R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE552
L__PWM_MAKE558:
;MyProject.mbas,1673 :: 		case 3
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE984
	LDI        R27, 3
	CP         R5, R27
L__PWM_MAKE984:
	BREQ       L__PWM_MAKE985
	JMP        L__PWM_MAKE561
L__PWM_MAKE985:
;MyProject.mbas,1676 :: 		PWM1_Set_Duty(ii)
	MOV        R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM1_Set_Duty+0
	JMP        L__PWM_MAKE552
L__PWM_MAKE561:
;MyProject.mbas,1677 :: 		case 4
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE986
	LDI        R27, 4
	CP         R5, R27
L__PWM_MAKE986:
	BREQ       L__PWM_MAKE987
	JMP        L__PWM_MAKE564
L__PWM_MAKE987:
;MyProject.mbas,1680 :: 		PWM2_Set_Duty(ii)
	MOV        R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM2_Set_Duty+0
	JMP        L__PWM_MAKE552
L__PWM_MAKE564:
;MyProject.mbas,1681 :: 		case 5
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE988
	LDI        R27, 5
	CP         R5, R27
L__PWM_MAKE988:
	BREQ       L__PWM_MAKE989
	JMP        L__PWM_MAKE567
L__PWM_MAKE989:
;MyProject.mbas,1684 :: 		PWM16bit_Change_Duty(ii, _TIMER3_CH_A )
	LDI        R27, 20
	MOV        R4, R27
	MOVW       R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE552
L__PWM_MAKE567:
;MyProject.mbas,1685 :: 		case 6
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE990
	LDI        R27, 6
	CP         R5, R27
L__PWM_MAKE990:
	BREQ       L__PWM_MAKE991
	JMP        L__PWM_MAKE570
L__PWM_MAKE991:
;MyProject.mbas,1688 :: 		PWM16bit_Change_Duty(ii, _TIMER3_CH_B )
	LDI        R27, 21
	MOV        R4, R27
	MOVW       R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE552
L__PWM_MAKE570:
;MyProject.mbas,1689 :: 		case 7
; ii start address is: 16 (R16)
	LDI        R27, 0
	CP         R6, R27
	BRNE       L__PWM_MAKE992
	LDI        R27, 7
	CP         R5, R27
L__PWM_MAKE992:
	BREQ       L__PWM_MAKE993
	JMP        L__PWM_MAKE573
L__PWM_MAKE993:
;MyProject.mbas,1692 :: 		PWM16bit_Change_Duty(ii, _TIMER3_CH_C )
	LDI        R27, 22
	MOV        R4, R27
	MOVW       R2, R16
; ii end address is: 16 (R16)
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE552
L__PWM_MAKE573:
L__PWM_MAKE552:
;MyProject.mbas,1694 :: 		end sub
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

;MyProject.mbas,1699 :: 		k as integer
;MyProject.mbas,1700 :: 		J=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDI        R27, 0
	STD        Y+0, R27
;MyProject.mbas,1705 :: 		DDd6_bit = 1                    ' set portd pin0 as output pin for ufa fountain
	IN         R27, DDD6_bit+0
	SBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
;MyProject.mbas,1706 :: 		DDB3_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;MyProject.mbas,1707 :: 		DDD7_bit = 1                    ' Set PORTD pin 7 as output pin for the PWM1 (according to datasheet)
	IN         R27, DDD7_bit+0
	SBR        R27, BitMask(DDD7_bit+0)
	OUT        DDD7_bit+0, R27
;MyProject.mbas,1708 :: 		DDD4_bit = 1                      'Set PORTD pin 4 as output pin for the PWM1 (according to datasheet oc1a)
	IN         R27, DDD4_bit+0
	SBR        R27, BitMask(DDD4_bit+0)
	OUT        DDD4_bit+0, R27
;MyProject.mbas,1709 :: 		DDD5_bit = 1                      'Set PORTD pin 5 as output pin for the PWM1 (according to datasheet oc1b)
	IN         R27, DDD5_bit+0
	SBR        R27, BitMask(DDD5_bit+0)
	OUT        DDD5_bit+0, R27
;MyProject.mbas,1711 :: 		PWM1_Init(_PWM1_FAST_MODE, _PWM1_PRESCALER_8, _PWM1_NON_INVERTED,J)
	CLR        R5
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 72
	MOV        R2, R27
	CALL       _PWM1_Init+0
;MyProject.mbas,1712 :: 		PWM2_Init(_PWM2_FAST_MODE, _PWM2_PRESCALER_8, _PWM2_NON_INVERTED, J)
	LDD        R5, Y+0
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 72
	MOV        R2, R27
	CALL       _PWM2_Init+0
;MyProject.mbas,1713 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_8, _PWM16_NON_INVERTED, j , _TIMER1)
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
;MyProject.mbas,1714 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_8, _PWM16_NON_INVERTED, j , _TIMER3)
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
;MyProject.mbas,1716 :: 		PWM1_Set_Duty(j)
	LDD        R2, Y+0
	CALL       _PWM1_Set_Duty+0
;MyProject.mbas,1717 :: 		PWM2_Set_Duty(j)
	LDD        R2, Y+0
	CALL       _PWM2_Set_Duty+0
;MyProject.mbas,1719 :: 		ocr0=0 ocr2=0
	LDI        R27, 0
	OUT        OCR0+0, R27
	LDI        R27, 0
	OUT        OCR2+0, R27
;MyProject.mbas,1720 :: 		for k=0 to 5
	LDI        R27, 0
	STD        Y+1, R27
	STD        Y+2, R27
L__PWM_Initialize576:
;MyProject.mbas,1721 :: 		PWM_MAKE (k*20,255,7)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
;MyProject.mbas,1722 :: 		delay_ms(200)
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__PWM_Initialize580:
	DEC        R16
	BRNE       L__PWM_Initialize580
	DEC        R17
	BRNE       L__PWM_Initialize580
	DEC        R18
	BRNE       L__PWM_Initialize580
	NOP
;MyProject.mbas,1723 :: 		next k
	LDD        R16, Y+1
	LDD        R17, Y+2
	CPI        R17, 0
	BRNE       L__PWM_Initialize995
	CPI        R16, 5
L__PWM_Initialize995:
	BRNE       L__PWM_Initialize996
	JMP        L__PWM_Initialize579
L__PWM_Initialize996:
	LDD        R16, Y+1
	LDD        R17, Y+2
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+1, R16
	STD        Y+2, R17
	JMP        L__PWM_Initialize576
L__PWM_Initialize579:
;MyProject.mbas,1724 :: 		end sub
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

_on_off_initial:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 4
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,1725 :: 		sub procedure on_off_initial (dim on_off22,en,hr,mint,prc as integer)
	LDD        R16, Y+8
	LDD        R17, Y+9
	STD        Y+8, R16
	STD        Y+9, R17
;MyProject.mbas,1728 :: 		for week =2to 2
	LDI        R27, 2
	STS        _week+0, R27
L__on_off_initial584:
;MyProject.mbas,1729 :: 		for Pwm_chanel=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
L__on_off_initial589:
;MyProject.mbas,1730 :: 		for chanel =1 to 3
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__on_off_initial594:
;MyProject.mbas,1731 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][0] =en
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
;MyProject.mbas,1732 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][1]=hr
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
;MyProject.mbas,1733 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][2] =mint
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
;MyProject.mbas,1734 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][3]=prc
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
;MyProject.mbas,1737 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__on_off_initial998
	CPI        R16, 3
L__on_off_initial998:
	BRNE       L__on_off_initial999
	JMP        L__on_off_initial597
L__on_off_initial999:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__on_off_initial594
L__on_off_initial597:
;MyProject.mbas,1738 :: 		next pwm_chanel
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	CPI        R17, 0
	BRNE       L__on_off_initial1000
	CPI        R16, 7
L__on_off_initial1000:
	BRNE       L__on_off_initial1001
	JMP        L__on_off_initial592
L__on_off_initial1001:
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__on_off_initial589
L__on_off_initial592:
;MyProject.mbas,1739 :: 		next week
	LDS        R16, _week+0
	CPI        R16, 2
	BRNE       L__on_off_initial1002
	JMP        L__on_off_initial587
L__on_off_initial1002:
	LDS        R16, _week+0
	SUBI       R16, 255
	STS        _week+0, R16
	JMP        L__on_off_initial584
L__on_off_initial587:
;MyProject.mbas,1741 :: 		end sub
L_end_on_off_initial:
	ADIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _on_off_initial

_WDT_on:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 7
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,1742 :: 		sub procedure  WDT_on()
;MyProject.mbas,1774 :: 		WDTCR =(0<<WDP2) or (0<<WDP1)  or (1<<WDP0)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	OUT        WDTCR+0, R27
;MyProject.mbas,1780 :: 		Lcd_Cmd(_LCD_CLEAR)
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,1781 :: 		Lcd_Out(2,2,"Reset.")
	MOVW       R30, R28
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 46
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1787 :: 		end sub
L_end_WDT_on:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 6
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _WDT_on

_eeprom:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 28
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,1792 :: 		txt_sub as string[4]
;MyProject.mbas,1793 :: 		Lcd_0()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_0+0
;MyProject.mbas,1796 :: 		IntToStr(EEPROM_Read(0x00), txt)
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,1798 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1799 :: 		Delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__eeprom600:
	DEC        R16
	BRNE       L__eeprom600
	DEC        R17
	BRNE       L__eeprom600
	DEC        R18
	BRNE       L__eeprom600
;MyProject.mbas,1800 :: 		if  (EEPROM_Read(0x00)=122)   then
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	CPI        R16, 122
	BREQ       L__eeprom1005
	JMP        L__eeprom603
L__eeprom1005:
;MyProject.mbas,1801 :: 		Lcd_Out(1,1,"EEprom  writed befor" )
	MOVW       R30, R28
	ADIW       R30, 3
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
	SUBI       R16, 253
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1802 :: 		IntToStr(EEPROM_Read(0x00), txt)
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,1804 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__eeprom604
;MyProject.mbas,1805 :: 		else
L__eeprom603:
;MyProject.mbas,1808 :: 		Lcd_Out(1,1,"not writed" )
	MOVW       R30, R28
	ADIW       R30, 3
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 253
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1810 :: 		end if
L__eeprom604:
;MyProject.mbas,1811 :: 		Delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__eeprom605:
	DEC        R16
	BRNE       L__eeprom605
	DEC        R17
	BRNE       L__eeprom605
	DEC        R18
	BRNE       L__eeprom605
;MyProject.mbas,1814 :: 		on_off22=1
	LDI        R27, 1
	STD        Y+2, R27
;MyProject.mbas,1815 :: 		for chanel =1 to 3
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__eeprom608:
;MyProject.mbas,1816 :: 		on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][0] =chanel
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
	STD        Y+26, R16
	STD        Y+27, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+26
	LDD        R19, Y+27
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
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	ST         Z+, R16
	ST         Z+, R17
;MyProject.mbas,1818 :: 		tt=on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off22-1][0]
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
	STD        Y+26, R16
	STD        Y+27, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+26
	LDD        R19, Y+27
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
	LD         R16, Z
	STD        Y+1, R16
;MyProject.mbas,1825 :: 		for counter = 1 to 4                          ' Fill data buffer
	LDI        R27, 1
	STD        Y+0, R27
L__eeprom613:
;MyProject.mbas,1826 :: 		EEPROM_Write(0x00 + counter,tt )        ' Write data to address 0x100+counter
	LDD        R16, Y+0
	LDI        R17, 0
	LDD        R4, Y+1
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;MyProject.mbas,1827 :: 		next counter
	LDD        R16, Y+0
	CPI        R16, 4
	BRNE       L__eeprom1006
	JMP        L__eeprom616
L__eeprom1006:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__eeprom613
L__eeprom616:
;MyProject.mbas,1828 :: 		Delay_ms(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__eeprom617:
	DEC        R16
	BRNE       L__eeprom617
	DEC        R17
	BRNE       L__eeprom617
	DEC        R18
	BRNE       L__eeprom617
;MyProject.mbas,1831 :: 		if (EEPROM_Read(0x00) ) then
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	TST        R16
	BRNE       L__eeprom1007
	JMP        L__eeprom620
L__eeprom1007:
;MyProject.mbas,1833 :: 		for counter = 1 to  4
	LDI        R27, 1
	STD        Y+0, R27
L__eeprom623:
;MyProject.mbas,1835 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1836 :: 		IntToStr(EEPROM_Read(0x100+counter), txt)
	LDD        R16, Y+0
	LDI        R17, 0
	SUBI       R16, 0
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,1837 :: 		Lcd_Out(1,1,"EEprom" )
	MOVW       R30, R28
	ADIW       R30, 3
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	SUBI       R16, 253
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1838 :: 		Lcd_Out(2,1,txt )                 ' Write text in first row
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1842 :: 		Delay_ms(50)
	LDI        R18, 3
	LDI        R17, 8
	LDI        R16, 120
L__eeprom627:
	DEC        R16
	BRNE       L__eeprom627
	DEC        R17
	BRNE       L__eeprom627
	DEC        R18
	BRNE       L__eeprom627
;MyProject.mbas,1843 :: 		next counter
	LDD        R16, Y+0
	CPI        R16, 4
	BRNE       L__eeprom1008
	JMP        L__eeprom626
L__eeprom1008:
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
	JMP        L__eeprom623
L__eeprom626:
L__eeprom620:
;MyProject.mbas,1845 :: 		next  chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__eeprom1009
	CPI        R16, 3
L__eeprom1009:
	BRNE       L__eeprom1010
	JMP        L__eeprom611
L__eeprom1010:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__eeprom608
L__eeprom611:
;MyProject.mbas,1847 :: 		end sub
L_end_eeprom:
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
; end of _eeprom

_interrupt_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;MyProject.mbas,1849 :: 		sub procedure interrupt_ISR () org IVT_ADDR_INT0            ''// Interrupt rutine
;MyProject.mbas,1852 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,1854 :: 		WDT_on()
	CALL       _WDT_on+0
;MyProject.mbas,1855 :: 		INTF0_bit=0                                                  '  // Clear interrupt flag
	IN         R27, INTF0_bit+0
	CBR        R27, BitMask(INTF0_bit+0)
	OUT        INTF0_bit+0, R27
;MyProject.mbas,1856 :: 		INT0_bit = 0
	IN         R27, INT0_bit+0
	CBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,1857 :: 		Keypad_3()
	CALL       _Keypad_3+0
;MyProject.mbas,1860 :: 		WDTCR = 0x00
	LDI        R27, 0
	OUT        WDTCR+0, R27
;MyProject.mbas,1861 :: 		INT0_bit = 1
	IN         R27, INT0_bit+0
	SBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,1863 :: 		SREG_I_bit = 1                                  ''  // Enable Interrupts
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,1871 :: 		end sub
L_end_interrupt_ISR:
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
	SBIW       R28, 39
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,1872 :: 		main:
;MyProject.mbas,1873 :: 		DDB0_bit = 0                                        ' set Button pin as input
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	IN         R27, DDB0_bit+0
	CBR        R27, BitMask(DDB0_bit+0)
	OUT        DDB0_bit+0, R27
;MyProject.mbas,1874 :: 		DDA2_bit = 0                                        ' set Button pin as input
	IN         R27, DDA2_bit+0
	CBR        R27, BitMask(DDA2_bit+0)
	OUT        DDA2_bit+0, R27
;MyProject.mbas,1877 :: 		DDA5_bit = 0                                        ' set Button pin as input
	IN         R27, DDA5_bit+0
	CBR        R27, BitMask(DDA5_bit+0)
	OUT        DDA5_bit+0, R27
;MyProject.mbas,1878 :: 		DDA4_bit = 0                                        ' set Button pin as input
	IN         R27, DDA4_bit+0
	CBR        R27, BitMask(DDA4_bit+0)
	OUT        DDA4_bit+0, R27
;MyProject.mbas,1879 :: 		DDA3_bit = 0                                        ' set Button pin as input
	IN         R27, DDA3_bit+0
	CBR        R27, BitMask(DDA3_bit+0)
	OUT        DDA3_bit+0, R27
;MyProject.mbas,1880 :: 		DDC2_bit =1  DDC3_bit =1   DDC4_bit =1   DDC5_bit =1  ' configure PORTD as output
	IN         R27, DDC2_bit+0
	SBR        R27, BitMask(DDC2_bit+0)
	OUT        DDC2_bit+0, R27
	IN         R27, DDC3_bit+0
	SBR        R27, BitMask(DDC3_bit+0)
	OUT        DDC3_bit+0, R27
	IN         R27, DDC4_bit+0
	SBR        R27, BitMask(DDC4_bit+0)
	OUT        DDC4_bit+0, R27
	IN         R27, DDC5_bit+0
	SBR        R27, BitMask(DDC5_bit+0)
	OUT        DDC5_bit+0, R27
;MyProject.mbas,1881 :: 		DDC6_bit =1 DDC7_bit =1
	IN         R27, DDC6_bit+0
	SBR        R27, BitMask(DDC6_bit+0)
	OUT        DDC6_bit+0, R27
	IN         R27, DDC7_bit+0
	SBR        R27, BitMask(DDC7_bit+0)
	OUT        DDC7_bit+0, R27
;MyProject.mbas,1882 :: 		DDD0_bit =1  DDD1_bit =1   DDD3_bit =1   DDD4_bit =1  ' configure PORTD as output
	IN         R27, DDD0_bit+0
	SBR        R27, BitMask(DDD0_bit+0)
	OUT        DDD0_bit+0, R27
	IN         R27, DDD1_bit+0
	SBR        R27, BitMask(DDD1_bit+0)
	OUT        DDD1_bit+0, R27
	IN         R27, DDD3_bit+0
	SBR        R27, BitMask(DDD3_bit+0)
	OUT        DDD3_bit+0, R27
	IN         R27, DDD4_bit+0
	SBR        R27, BitMask(DDD4_bit+0)
	OUT        DDD4_bit+0, R27
;MyProject.mbas,1883 :: 		DDD5_bit =1 DDD6_bit =1      DDD7_bit =1
	IN         R27, DDD5_bit+0
	SBR        R27, BitMask(DDD5_bit+0)
	OUT        DDD5_bit+0, R27
	IN         R27, DDD6_bit+0
	SBR        R27, BitMask(DDD6_bit+0)
	OUT        DDD6_bit+0, R27
	IN         R27, DDD7_bit+0
	SBR        R27, BitMask(DDD7_bit+0)
	OUT        DDD7_bit+0, R27
;MyProject.mbas,1884 :: 		DDB1_bit =1      DDB3_bit =1
	IN         R27, DDB1_bit+0
	SBR        R27, BitMask(DDB1_bit+0)
	OUT        DDB1_bit+0, R27
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;MyProject.mbas,1885 :: 		DDA0_bit =1 DDA1_bit =1      DDA2_bit =1  DDA3_bit =1
	IN         R27, DDA0_bit+0
	SBR        R27, BitMask(DDA0_bit+0)
	OUT        DDA0_bit+0, R27
	IN         R27, DDA1_bit+0
	SBR        R27, BitMask(DDA1_bit+0)
	OUT        DDA1_bit+0, R27
	IN         R27, DDA2_bit+0
	SBR        R27, BitMask(DDA2_bit+0)
	OUT        DDA2_bit+0, R27
	IN         R27, DDA3_bit+0
	SBR        R27, BitMask(DDA3_bit+0)
	OUT        DDA3_bit+0, R27
;MyProject.mbas,1889 :: 		_count=0
	LDI        R27, 0
	STS        __count+0, R27
	STS        __count+1, R27
;MyProject.mbas,1890 :: 		_a=0
	LDI        R27, 0
	STS        __a+0, R27
	STS        __a+1, R27
;MyProject.mbas,1891 :: 		ztmp=0
	LDI        R27, 0
	STS        _ztmp+0, R27
	STS        _ztmp+1, R27
;MyProject.mbas,1892 :: 		freq=0
	LDI        R27, 0
	STS        _freq+0, R27
	STS        _freq+1, R27
	STS        _freq+2, R27
	STS        _freq+3, R27
;MyProject.mbas,1893 :: 		_ss=0
	LDI        R27, 0
	STS        __ss+0, R27
	STS        __ss+1, R27
;MyProject.mbas,1894 :: 		_zz=0
	LDI        R27, 0
	STS        __zz+0, R27
	STS        __zz+1, R27
;MyProject.mbas,1896 :: 		korrekturfaktor=0.5
	LDI        R27, 0
	STS        _korrekturfaktor+0, R27
	STS        _korrekturfaktor+1, R27
	STS        _korrekturfaktor+2, R27
	LDI        R27, 63
	STS        _korrekturfaktor+3, R27
;MyProject.mbas,1898 :: 		LCD_Init() ' Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.mbas,1899 :: 		LCD_cmd(_LCD_CLEAR) ' Clear LCD
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,1900 :: 		LCD_cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,1901 :: 		LCD_Out(2,1,"TEST")
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 84
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
;MyProject.mbas,1903 :: 		Delay_ms(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__main631:
	DEC        R16
	BRNE       L__main631
	DEC        R17
	BRNE       L__main631
	DEC        R18
	BRNE       L__main631
;MyProject.mbas,1904 :: 		ddrb.PINb0_bit=0
	IN         R0, PINB0_bit+0
	CLR        R16
	SBRC       R0, BitPos(PINB0_bit+0)
	INC        R16
	MOV        R27, R16
	LDI        R16, 1
	TST        R27
	BREQ       L__main1014
L__main1013:
	LSL        R16
	DEC        R27
	BRNE       L__main1013
L__main1014:
	MOV        R17, R16
	COM        R17
	IN         R16, DDRB+0
	AND        R17, R16
	OUT        DDRB+0, R17
;MyProject.mbas,1906 :: 		ddrb.PINf0_bit=1
	IN         R0, PINF0_bit+0
	CLR        R16
	SBRC       R0, BitPos(PINF0_bit+0)
	INC        R16
	MOV        R27, R16
	LDI        R16, 1
	TST        R27
	BREQ       L__main1016
L__main1015:
	LSL        R16
	DEC        R27
	BRNE       L__main1015
L__main1016:
	OR         R17, R16
	OUT        DDRB+0, R17
;MyProject.mbas,1907 :: 		ddrb.PINf1_bit=1
	IN         R0, PINF1_bit+0
	CLR        R16
	SBRC       R0, BitPos(PINF1_bit+0)
	INC        R16
	MOV        R27, R16
	LDI        R16, 1
	TST        R27
	BREQ       L__main1018
L__main1017:
	LSL        R16
	DEC        R27
	BRNE       L__main1017
L__main1018:
	OR         R16, R17
	OUT        DDRB+0, R16
;MyProject.mbas,1909 :: 		portf0_bit=0
	LDS        R27, PORTF0_bit+0
	CBR        R27, BitMask(PORTF0_bit+0)
	STS        PORTF0_bit+0, R27
;MyProject.mbas,1910 :: 		portf1_bit=0
	LDS        R27, PORTF1_bit+0
	CBR        R27, BitMask(PORTF1_bit+0)
	STS        PORTF1_bit+0, R27
;MyProject.mbas,1911 :: 		SetRegister()
	CALL       _SetRegister+0
;MyProject.mbas,1913 :: 		if _ss=125 then '"Z?hltor": Abarbeitung jede 0,5 Sekunde (8MHz/1024/125/125)
	LDS        R16, __ss+0
	LDS        R17, __ss+1
	CPI        R17, 0
	BRNE       L__main1019
	CPI        R16, 125
L__main1019:
	BREQ       L__main1020
	JMP        L__main640
L__main1020:
;MyProject.mbas,1914 :: 		portf1_bit=not portf1_bit
	LDS        R0, PORTF1_bit+0
	LDI        R27, BitMask(PORTF1_bit+0)
	EOR        R0, R27
	STS        PORTF1_bit+0, R0
;MyProject.mbas,1915 :: 		_count=TCNT0
	IN         R16, TCNT0+0
	STS        __count+0, R16
	LDI        R27, 0
	STS        __count+1, R27
;MyProject.mbas,1916 :: 		_ss=0
	LDI        R27, 0
	STS        __ss+0, R27
	STS        __ss+1, R27
;MyProject.mbas,1917 :: 		ztmp=_zz
	LDS        R16, __zz+0
	LDS        R17, __zz+1
	STS        _ztmp+0, R16
	STS        _ztmp+1, R17
;MyProject.mbas,1918 :: 		_zz=0
	LDI        R27, 0
	STS        __zz+0, R27
	STS        __zz+1, R27
;MyProject.mbas,1919 :: 		LCD_init()
	CALL       _Lcd_Init+0
;MyProject.mbas,1920 :: 		freq = 0.5+((256 * ztmp + _count)*korrekturfaktor)
	LDS        R16, _ztmp+0
	LDS        R17, _ztmp+1
	MOV        R22, R17
	MOV        R21, R16
	CLR        R20
	CLR        R23
	LDS        R16, __count+0
	LDS        R17, __count+1
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	ADD        R16, R20
	ADC        R17, R21
	ADC        R18, R22
	ADC        R19, R23
	CALL       _float_slong2fp+0
	LDS        R20, _korrekturfaktor+0
	LDS        R21, _korrekturfaktor+1
	LDS        R22, _korrekturfaktor+2
	LDS        R23, _korrekturfaktor+3
	CALL       _float_fpmul1+0
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 63
	CALL       _float_fpadd1+0
	CALL       _float_fpint+0
	STS        _freq+0, R16
	STS        _freq+1, R17
	STS        _freq+2, R18
	STS        _freq+3, R19
;MyProject.mbas,1926 :: 		longwordToStr(freq,anz)
	LDI        R27, #lo_addr(_anz+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_anz+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _LongWordToStr+0
;MyProject.mbas,1927 :: 		LCD_Out(1,1,anz + " Hz") ' Write string
	MOV        R26, R28
	MOV        R27, R29
	SUBI       R26, 235
	SBCI       R27, 255
	LDI        R30, #lo_addr(_anz+0)
	LDI        R31, hi_addr(_anz+0)
	CALL       ___CS2S+0
	LDI        R16, 32
	ST         X+, R16
	LDI        R16, 72
	ST         X+, R16
	LDI        R16, 122
	ST         X+, R16
	LDI        R16, 0
	ST         X+, R16
	MOVW       R16, R28
	SUBI       R16, 235
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
L__main640:
;MyProject.mbas,1929 :: 		Delay_ms(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main642:
	DEC        R16
	BRNE       L__main642
	DEC        R17
	BRNE       L__main642
	DEC        R18
	BRNE       L__main642
	NOP
;MyProject.mbas,1964 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,1965 :: 		Lcd_Out(1,1,"EEprom  :" )
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
	LDI        R27, 32
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
;MyProject.mbas,1969 :: 		if  (EEPROM_Read(0x00)=122)   then
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	CPI        R16, 122
	BREQ       L__main1023
	JMP        L__main645
L__main1023:
;MyProject.mbas,1970 :: 		eeprom_call_back()
	CALL       _eeprom_call_back+0
;MyProject.mbas,1971 :: 		Lcd_Out(1,1,"EEprom  writed befor" )
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
;MyProject.mbas,1972 :: 		IntToStr(EEPROM_Read(0x00), txt)
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,1974 :: 		Lcd_Out(2,1,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	JMP        L__main646
;MyProject.mbas,1975 :: 		else
L__main645:
;MyProject.mbas,1976 :: 		EEPROM_Write(0x00 ,122 )
	LDI        R27, 122
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Write+0
;MyProject.mbas,1977 :: 		on_off_initial (1,1,0,0,12)    '' off mode on_off initial (dim on_off22,en,hr,mint,prc as integer)
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
	LDI        R27, 12
	PUSH       R27
	CALL       _on_off_initial+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 2
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,1978 :: 		on_off_initial (2,1,0,0,12)    '''on mode
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
	LDI        R27, 12
	PUSH       R27
	CALL       _on_off_initial+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 2
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,1979 :: 		eeprom_save()
	CALL       _eeprom_save+0
;MyProject.mbas,1980 :: 		Lcd_Out(1,1,"not writed" )
	MOVW       R30, R28
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
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,1983 :: 		end if
L__main646:
;MyProject.mbas,1984 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__main647:
	DEC        R16
	BRNE       L__main647
	DEC        R17
	BRNE       L__main647
	DEC        R18
	BRNE       L__main647
;MyProject.mbas,1988 :: 		hours=0x0  minutes=0x0   seconds=0x00 day= 0x2 week=0x3   month=0x11  year=0x15
	LDI        R27, 0
	STS        _hours+0, R27
	LDI        R27, 0
	STS        _minutes+0, R27
	LDI        R27, 0
	STS        _seconds+0, R27
	LDI        R27, 2
	STS        _day+0, R27
	LDI        R27, 3
	STS        _week+0, R27
	LDI        R27, 17
	STS        _month+0, R27
	LDI        R27, 21
	STS        _year+0, R27
;MyProject.mbas,1991 :: 		Write_Time(hours, minutes, seconds, 0x13, 0x06,   0x11,year)'
	LDI        R27, 21
	MOV        R8, R27
	LDI        R27, 17
	MOV        R7, R27
	LDI        R27, 6
	MOV        R6, R27
	LDI        R27, 19
	MOV        R5, R27
	CLR        R4
	CLR        R3
	CLR        R2
	CALL       _Write_Time+0
;MyProject.mbas,1992 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	LDI        R27, #lo_addr(_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,1993 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;MyProject.mbas,1994 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _Shamsi_show_lcd+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,1997 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _miladi_call+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,2002 :: 		ISC00_bit = 1                                    '' // Set interrupts to be detected on rising edge
	LDS        R27, ISC00_bit+0
	SBR        R27, BitMask(ISC00_bit+0)
	STS        ISC00_bit+0, R27
;MyProject.mbas,2004 :: 		SREG_I_bit = 0
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,2006 :: 		SREG_I_bit = 1
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,2008 :: 		INT0_bit = 1
	IN         R27, INT0_bit+0
	SBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,2011 :: 		PWM_Initialize ()
	CALL       _PWM_Initialize+0
;MyProject.mbas,2012 :: 		while TRUE
L__main650:
;MyProject.mbas,2018 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year)
	LDI        R27, #lo_addr(_day+0)
	MOV        R8, R27
	LDI        R27, hi_addr(_day+0)
	MOV        R9, R27
	LDI        R27, #lo_addr(_seconds+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_seconds+0)
	MOV        R7, R27
	LDI        R27, #lo_addr(_minutes+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_minutes+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_hours+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_hours+0)
	MOV        R3, R27
	LDI        R27, hi_addr(_year+0)
	PUSH       R27
	LDI        R27, #lo_addr(_year+0)
	PUSH       R27
	LDI        R27, hi_addr(_month+0)
	PUSH       R27
	LDI        R27, #lo_addr(_month+0)
	PUSH       R27
	LDI        R27, hi_addr(_week+0)
	PUSH       R27
	LDI        R27, #lo_addr(_week+0)
	PUSH       R27
	CALL       _Read_Time+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,2019 :: 		Shamsi_call()
	CALL       _Shamsi_call+0
;MyProject.mbas,2020 :: 		Shamsi_show_lcd( jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _Shamsi_show_lcd+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,2021 :: 		Delay_mS(310)
	LDI        R18, 13
	LDI        R17, 149
	LDI        R16, 190
L__main654:
	DEC        R16
	BRNE       L__main654
	DEC        R17
	BRNE       L__main654
	DEC        R18
	BRNE       L__main654
;MyProject.mbas,2022 :: 		miladi_call(jmonth,jday,jyear,week,hours ,minutes,seconds )
	LDS        R8, _week+0
	LDI        R27, 0
	MOV        R9, R27
	LDS        R6, _Jyear+0
	LDS        R7, _Jyear+1
	LDS        R4, _Jday+0
	LDS        R5, _Jday+1
	LDS        R2, _Jmonth+0
	LDS        R3, _Jmonth+1
	LDS        R16, _seconds+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _minutes+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	LDS        R16, _hours+0
	LDI        R27, 0
	PUSH       R27
	PUSH       R16
	CALL       _miladi_call+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 6
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MyProject.mbas,2023 :: 		Delay_mS(310)
	LDI        R18, 13
	LDI        R17, 149
	LDI        R16, 190
L__main656:
	DEC        R16
	BRNE       L__main656
	DEC        R17
	BRNE       L__main656
	DEC        R18
	BRNE       L__main656
;MyProject.mbas,2024 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,2026 :: 		Pwm_chanel=1   chanel=1        on_off2=1
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
;MyProject.mbas,2050 :: 		for week =2to 2
	LDI        R27, 2
	STS        _week+0, R27
L__main659:
;MyProject.mbas,2051 :: 		for Pwm_chanel=1 to 7
	LDI        R27, 1
	STS        _Pwm_chanel+0, R27
	LDI        R27, 0
	STS        _Pwm_chanel+1, R27
L__main664:
;MyProject.mbas,2052 :: 		on_test=0
	LDI        R27, 0
	STS        _on_test+0, R27
;MyProject.mbas,2053 :: 		for chanel =1 to 3
	LDI        R27, 1
	STS        _chanel+0, R27
	LDI        R27, 0
	STS        _chanel+1, R27
L__main669:
;MyProject.mbas,2054 :: 		for on_off2 =1 to 1
	LDI        R27, 1
	STS        _on_off2+0, R27
	LDI        R27, 0
	STS        _on_off2+1, R27
L__main674:
;MyProject.mbas,2058 :: 		if  (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][1]>= hours ) and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][0]<>0) and    (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][2]>= minutes)  then
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+37, R16
	STD        Y+38, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+35
	LDD        R19, Y+36
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	SUBI       R18, 1
	MOV        R23, R18
	LDI        R24, 0
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R19, Z+
	LD         R20, Z+
	LDS        R18, _hours+0
	CP         R19, R18
	LDI        R27, 0
	CPC        R20, R27
	LDI        R20, 0
	BRLT       L__main1024
	LDI        R20, 255
L__main1024:
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	LDD        R21, Y+37
	LDD        R22, Y+38
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R25
	ADC        R19, R26
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R18
	ADC        R31, R19
	LD         R18, Z+
	LD         R19, Z+
	CPI        R19, 0
	BRNE       L__main1025
	CPI        R18, 0
L__main1025:
	LDI        R27, 0
	BREQ       L__main1026
	LDI        R27, 255
L__main1026:
	MOV        R18, R27
	AND        R20, R18
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R25
	ADC        R17, R26
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 4
	LD         R17, Z+
	LD         R18, Z+
	LDS        R16, _minutes+0
	CP         R17, R16
	LDI        R27, 0
	CPC        R18, R27
	LDI        R16, 0
	BRLT       L__main1027
	LDI        R16, 255
L__main1027:
	AND        R16, R20
	BRNE       L__main1028
	JMP        L__main679
L__main1028:
;MyProject.mbas,2061 :: 		if  (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][1]<= hours ) and (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][0]<>0) and    (on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2][2]<= minutes)  then
	LDS        R16, _week+0
	SUBI       R16, 1
	LDI        R17, 0
	LDI        R20, 224
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	STD        Y+37, R16
	STD        Y+38, R17
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R16, R18
	ADC        R17, R19
	LDS        R20, _chanel+0
	SUBI       R20, 1
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R16, 112
	LDI        R17, 0
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	LDD        R18, Y+35
	LDD        R19, Y+36
	MOVW       R22, R16
	ADD        R22, R18
	ADC        R23, R19
	LDS        R18, _Pwm_chanel+0
	SUBI       R18, 1
	MOV        R25, R18
	LDI        R26, 0
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	LSL        R25
	ROL        R26
	MOV        R20, R25
	MOV        R21, R26
	ADD        R20, R22
	ADC        R21, R23
	LDS        R18, _on_off2+0
	LDS        R19, _on_off2+1
	MOV        R23, R18
	MOV        R24, R19
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	LSL        R23
	ROL        R24
	MOV        R18, R23
	MOV        R19, R24
	ADD        R18, R20
	ADC        R19, R21
	MOVW       R30, R18
	ADIW       R30, 2
	LD         R20, Z+
	LD         R21, Z+
	LDS        R18, _hours+0
	LDI        R19, 0
	CP         R18, R20
	CPC        R19, R21
	LDI        R20, 0
	BRLT       L__main1029
	LDI        R20, 255
L__main1029:
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	LDD        R21, Y+37
	LDD        R22, Y+38
	ADD        R18, R21
	ADC        R19, R22
	ADD        R18, R16
	ADC        R19, R17
	ADD        R18, R25
	ADC        R19, R26
	MOV        R30, R23
	MOV        R31, R24
	ADD        R30, R18
	ADC        R31, R19
	LD         R18, Z+
	LD         R19, Z+
	CPI        R19, 0
	BRNE       L__main1030
	CPI        R18, 0
L__main1030:
	LDI        R27, 0
	BREQ       L__main1031
	LDI        R27, 255
L__main1031:
	MOV        R18, R27
	AND        R20, R18
	LDI        R18, #lo_addr(_on_a_0+0)
	LDI        R19, hi_addr(_on_a_0+0)
	ADD        R18, R21
	ADC        R19, R22
	ADD        R16, R18
	ADC        R17, R19
	ADD        R16, R25
	ADC        R17, R26
	ADD        R16, R23
	ADC        R17, R24
	MOVW       R30, R16
	ADIW       R30, 4
	LD         R18, Z+
	LD         R19, Z+
	LDS        R16, _minutes+0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	LDI        R27, 0
	BRLT       L__main1032
	LDI        R27, 255
L__main1032:
	MOV        R16, R27
	AND        R16, R20
	BRNE       L__main1033
	JMP        L__main682
L__main1033:
;MyProject.mbas,2063 :: 		on_test=1
	LDI        R27, 1
	STS        _on_test+0, R27
;MyProject.mbas,2064 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,2065 :: 		Lcd_Out(1,1,"on pwm mode")
	MOVW       R30, R28
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 112
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
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
;MyProject.mbas,2066 :: 		inttostr(chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _chanel+0
	LDS        R3, _chanel+1
	CALL       _IntToStr+0
;MyProject.mbas,2067 :: 		PWM_MAKE (on_a_0[week-1][chanel-1][pwm_chanel-1][on_off2-1][3],255,pwm_chanel)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
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
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R16, 112
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
	LSL        R16
	ROL        R17
	ADD        R16, R18
	ADC        R17, R19
	MOVW       R30, R16
	ADIW       R30, 6
	LD         R16, Z
	LDS        R5, _Pwm_chanel+0
	LDS        R6, _Pwm_chanel+1
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	MOV        R2, R16
	CALL       _PWM_MAKE+0
;MyProject.mbas,2069 :: 		LCD_Out(1,13, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 13
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,2070 :: 		inttostr(on_off,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _on_off+0
	LDS        R3, _on_off+1
	CALL       _IntToStr+0
;MyProject.mbas,2071 :: 		LCD_Out(2,1, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,2072 :: 		inttostr(pwm_chanel,txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _Pwm_chanel+0
	LDS        R3, _Pwm_chanel+1
	CALL       _IntToStr+0
;MyProject.mbas,2073 :: 		LCD_Out(2,4, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,2074 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main684:
	DEC        R16
	BRNE       L__main684
	DEC        R17
	BRNE       L__main684
	DEC        R18
	BRNE       L__main684
	NOP
L__main682:
;MyProject.mbas,2075 :: 		end if
	JMP        L__main680
;MyProject.mbas,2076 :: 		else
L__main679:
;MyProject.mbas,2077 :: 		if (on_test=0) then
	LDS        R16, _on_test+0
	CPI        R16, 0
	BREQ       L__main1034
	JMP        L__main687
L__main1034:
;MyProject.mbas,2078 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,2079 :: 		Lcd_Chr(2, 6, (hours div 10)   + 48)
	LDS        R16, _hours+0
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,2080 :: 		Lcd_Chr(2, 7, (hours mod 10)   + 48)
	LDS        R16, _hours+0
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	SUBI       R16, 208
	MOV        R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;MyProject.mbas,2081 :: 		inttostr(on_a_0 [week-1][chanel-1][pwm_chanel-1][on_off2-1][0],txt)                     ' ??? ????? ???? ? ?????? ????? ? ????
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
	STD        Y+35, R16
	STD        Y+36, R17
	LDI        R16, 112
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
	LSL        R16
	ROL        R17
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z+
	LD         R17, Z+
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;MyProject.mbas,2082 :: 		LCD_Out(1,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,2083 :: 		inttostr(Pwm_chanel,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _Pwm_chanel+0
	LDS        R3, _Pwm_chanel+1
	CALL       _IntToStr+0
;MyProject.mbas,2084 :: 		LCD_Out(2,11, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,2085 :: 		Lcd_Out(1,1,"offfff")
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
;MyProject.mbas,2086 :: 		Delay_mS(500)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__main689:
	DEC        R16
	BRNE       L__main689
	DEC        R17
	BRNE       L__main689
	DEC        R18
	BRNE       L__main689
	NOP
;MyProject.mbas,2087 :: 		PWM_MAKE (0,255,pwm_chanel)''(dim jj as byte,dim max_duty,Pwm_chanel as integer)
	LDS        R5, _Pwm_chanel+0
	LDS        R6, _Pwm_chanel+1
	LDI        R27, 255
	MOV        R3, R27
	LDI        R27, 0
	MOV        R4, R27
	CLR        R2
	CALL       _PWM_MAKE+0
L__main687:
;MyProject.mbas,2090 :: 		end if
L__main680:
;MyProject.mbas,2093 :: 		next on_off2
	LDS        R16, _on_off2+0
	LDS        R17, _on_off2+1
	CPI        R17, 0
	BRNE       L__main1035
	CPI        R16, 1
L__main1035:
	BRNE       L__main1036
	JMP        L__main677
L__main1036:
	LDS        R16, _on_off2+0
	LDS        R17, _on_off2+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _on_off2+0, R16
	STS        _on_off2+1, R17
	JMP        L__main674
L__main677:
;MyProject.mbas,2094 :: 		next chanel
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	CPI        R17, 0
	BRNE       L__main1037
	CPI        R16, 3
L__main1037:
	BRNE       L__main1038
	JMP        L__main672
L__main1038:
	LDS        R16, _chanel+0
	LDS        R17, _chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _chanel+0, R16
	STS        _chanel+1, R17
	JMP        L__main669
L__main672:
;MyProject.mbas,2095 :: 		next pwm_chanel
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	CPI        R17, 0
	BRNE       L__main1039
	CPI        R16, 7
L__main1039:
	BRNE       L__main1040
	JMP        L__main667
L__main1040:
	LDS        R16, _Pwm_chanel+0
	LDS        R17, _Pwm_chanel+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _Pwm_chanel+0, R16
	STS        _Pwm_chanel+1, R17
	JMP        L__main664
L__main667:
;MyProject.mbas,2096 :: 		next week
	LDS        R16, _week+0
	CPI        R16, 2
	BRNE       L__main1041
	JMP        L__main662
L__main1041:
	LDS        R16, _week+0
	SUBI       R16, 255
	STS        _week+0, R16
	JMP        L__main659
L__main662:
;MyProject.mbas,2101 :: 		wend                                                ' endless loop
	JMP        L__main650
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
