subtitle "Microchip MPLAB XC8 C Compiler v3.00 (Free license) build 20241204225717 Og1 "

pagewidth 120

	opt flic

	processor	18F4550
include "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc\18f4550.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
skiprom24 macro arg1
	btfsc arg1,7
endm
	global	__ramtop
	global	__accesstop
# 54 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SPPDATA equ 0F62h ;# 
# 74 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SPPCFG equ 0F63h ;# 
# 151 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SPPEPS equ 0F64h ;# 
# 225 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SPPCON equ 0F65h ;# 
# 251 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UFRM equ 0F66h ;# 
# 258 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UFRML equ 0F66h ;# 
# 336 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UFRMH equ 0F67h ;# 
# 376 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UIR equ 0F68h ;# 
# 432 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UIE equ 0F69h ;# 
# 488 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEIR equ 0F6Ah ;# 
# 539 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEIE equ 0F6Bh ;# 
# 590 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
USTAT equ 0F6Ch ;# 
# 650 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UCON equ 0F6Dh ;# 
# 701 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UADDR equ 0F6Eh ;# 
# 765 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UCFG equ 0F6Fh ;# 
# 844 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP0 equ 0F70h ;# 
# 952 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP1 equ 0F71h ;# 
# 1060 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP2 equ 0F72h ;# 
# 1168 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP3 equ 0F73h ;# 
# 1276 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP4 equ 0F74h ;# 
# 1384 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP5 equ 0F75h ;# 
# 1492 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP6 equ 0F76h ;# 
# 1600 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP7 equ 0F77h ;# 
# 1708 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP8 equ 0F78h ;# 
# 1784 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP9 equ 0F79h ;# 
# 1860 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP10 equ 0F7Ah ;# 
# 1936 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP11 equ 0F7Bh ;# 
# 2012 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP12 equ 0F7Ch ;# 
# 2088 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP13 equ 0F7Dh ;# 
# 2164 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP14 equ 0F7Eh ;# 
# 2240 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
UEP15 equ 0F7Fh ;# 
# 2316 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PORTA equ 0F80h ;# 
# 2455 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PORTB equ 0F81h ;# 
# 2565 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PORTC equ 0F82h ;# 
# 2707 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PORTD equ 0F83h ;# 
# 2828 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PORTE equ 0F84h ;# 
# 2975 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
LATA equ 0F89h ;# 
# 3075 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
LATB equ 0F8Ah ;# 
# 3187 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
LATC equ 0F8Bh ;# 
# 3265 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
LATD equ 0F8Ch ;# 
# 3377 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
LATE equ 0F8Dh ;# 
# 3429 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TRISA equ 0F92h ;# 
# 3434 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
DDRA equ 0F92h ;# 
# 3627 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TRISB equ 0F93h ;# 
# 3632 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
DDRB equ 0F93h ;# 
# 3849 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TRISC equ 0F94h ;# 
# 3854 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
DDRC equ 0F94h ;# 
# 4003 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TRISD equ 0F95h ;# 
# 4008 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
DDRD equ 0F95h ;# 
# 4225 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TRISE equ 0F96h ;# 
# 4230 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
DDRE equ 0F96h ;# 
# 4327 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
OSCTUNE equ 0F9Bh ;# 
# 4386 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PIE1 equ 0F9Dh ;# 
# 4470 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PIR1 equ 0F9Eh ;# 
# 4554 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
IPR1 equ 0F9Fh ;# 
# 4638 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PIE2 equ 0FA0h ;# 
# 4709 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PIR2 equ 0FA1h ;# 
# 4780 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
IPR2 equ 0FA2h ;# 
# 4851 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
EECON1 equ 0FA6h ;# 
# 4917 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
EECON2 equ 0FA7h ;# 
# 4924 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
EEDATA equ 0FA8h ;# 
# 4931 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
EEADR equ 0FA9h ;# 
# 4938 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
RCSTA equ 0FABh ;# 
# 4943 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
RCSTA1 equ 0FABh ;# 
# 5148 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TXSTA equ 0FACh ;# 
# 5153 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TXSTA1 equ 0FACh ;# 
# 5404 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TXREG equ 0FADh ;# 
# 5409 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TXREG1 equ 0FADh ;# 
# 5416 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
RCREG equ 0FAEh ;# 
# 5421 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
RCREG1 equ 0FAEh ;# 
# 5428 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SPBRG equ 0FAFh ;# 
# 5433 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SPBRG1 equ 0FAFh ;# 
# 5440 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SPBRGH equ 0FB0h ;# 
# 5447 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
T3CON equ 0FB1h ;# 
# 5568 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TMR3 equ 0FB2h ;# 
# 5575 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TMR3L equ 0FB2h ;# 
# 5582 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TMR3H equ 0FB3h ;# 
# 5589 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CMCON equ 0FB4h ;# 
# 5679 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CVRCON equ 0FB5h ;# 
# 5764 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
ECCP1AS equ 0FB6h ;# 
# 5769 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CCP1AS equ 0FB6h ;# 
# 5926 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
ECCP1DEL equ 0FB7h ;# 
# 5931 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CCP1DEL equ 0FB7h ;# 
# 6064 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
BAUDCON equ 0FB8h ;# 
# 6069 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
BAUDCTL equ 0FB8h ;# 
# 6244 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CCP2CON equ 0FBAh ;# 
# 6308 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CCPR2 equ 0FBBh ;# 
# 6315 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CCPR2L equ 0FBBh ;# 
# 6322 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CCPR2H equ 0FBCh ;# 
# 6329 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CCP1CON equ 0FBDh ;# 
# 6334 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
ECCP1CON equ 0FBDh ;# 
# 6491 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CCPR1 equ 0FBEh ;# 
# 6498 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CCPR1L equ 0FBEh ;# 
# 6505 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
CCPR1H equ 0FBFh ;# 
# 6512 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
ADCON2 equ 0FC0h ;# 
# 6583 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
ADCON1 equ 0FC1h ;# 
# 6668 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
ADCON0 equ 0FC2h ;# 
# 6787 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
ADRES equ 0FC3h ;# 
# 6794 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
ADRESL equ 0FC3h ;# 
# 6801 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
ADRESH equ 0FC4h ;# 
# 6808 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SSPCON2 equ 0FC5h ;# 
# 6870 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SSPCON1 equ 0FC6h ;# 
# 6940 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SSPSTAT equ 0FC7h ;# 
# 7188 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SSPADD equ 0FC8h ;# 
# 7195 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
SSPBUF equ 0FC9h ;# 
# 7202 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
T2CON equ 0FCAh ;# 
# 7300 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PR2 equ 0FCBh ;# 
# 7305 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
MEMCON equ 0FCBh ;# 
# 7410 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TMR2 equ 0FCCh ;# 
# 7417 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
T1CON equ 0FCDh ;# 
# 7520 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TMR1 equ 0FCEh ;# 
# 7527 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TMR1L equ 0FCEh ;# 
# 7534 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TMR1H equ 0FCFh ;# 
# 7541 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
RCON equ 0FD0h ;# 
# 7690 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
WDTCON equ 0FD1h ;# 
# 7718 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
HLVDCON equ 0FD2h ;# 
# 7723 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
LVDCON equ 0FD2h ;# 
# 7988 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
OSCCON equ 0FD3h ;# 
# 8071 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
T0CON equ 0FD5h ;# 
# 8141 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TMR0 equ 0FD6h ;# 
# 8148 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TMR0L equ 0FD6h ;# 
# 8155 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TMR0H equ 0FD7h ;# 
# 8162 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
STATUS equ 0FD8h ;# 
# 8233 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
FSR2 equ 0FD9h ;# 
# 8240 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
FSR2L equ 0FD9h ;# 
# 8247 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
FSR2H equ 0FDAh ;# 
# 8254 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PLUSW2 equ 0FDBh ;# 
# 8261 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PREINC2 equ 0FDCh ;# 
# 8268 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
POSTDEC2 equ 0FDDh ;# 
# 8275 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
POSTINC2 equ 0FDEh ;# 
# 8282 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
INDF2 equ 0FDFh ;# 
# 8289 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
BSR equ 0FE0h ;# 
# 8296 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
FSR1 equ 0FE1h ;# 
# 8303 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
FSR1L equ 0FE1h ;# 
# 8310 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
FSR1H equ 0FE2h ;# 
# 8317 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PLUSW1 equ 0FE3h ;# 
# 8324 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PREINC1 equ 0FE4h ;# 
# 8331 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
POSTDEC1 equ 0FE5h ;# 
# 8338 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
POSTINC1 equ 0FE6h ;# 
# 8345 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
INDF1 equ 0FE7h ;# 
# 8352 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
WREG equ 0FE8h ;# 
# 8359 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
FSR0 equ 0FE9h ;# 
# 8366 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
FSR0L equ 0FE9h ;# 
# 8373 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
FSR0H equ 0FEAh ;# 
# 8380 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PLUSW0 equ 0FEBh ;# 
# 8387 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PREINC0 equ 0FECh ;# 
# 8394 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
POSTDEC0 equ 0FEDh ;# 
# 8401 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
POSTINC0 equ 0FEEh ;# 
# 8408 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
INDF0 equ 0FEFh ;# 
# 8415 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
INTCON3 equ 0FF0h ;# 
# 8507 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
INTCON2 equ 0FF1h ;# 
# 8584 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
INTCON equ 0FF2h ;# 
# 8701 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PROD equ 0FF3h ;# 
# 8708 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PRODL equ 0FF3h ;# 
# 8715 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PRODH equ 0FF4h ;# 
# 8722 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TABLAT equ 0FF5h ;# 
# 8731 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TBLPTR equ 0FF6h ;# 
# 8738 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TBLPTRL equ 0FF6h ;# 
# 8745 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TBLPTRH equ 0FF7h ;# 
# 8752 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TBLPTRU equ 0FF8h ;# 
# 8761 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PCLAT equ 0FF9h ;# 
# 8768 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PC equ 0FF9h ;# 
# 8775 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PCL equ 0FF9h ;# 
# 8782 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PCLATH equ 0FFAh ;# 
# 8789 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
PCLATU equ 0FFBh ;# 
# 8796 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
STKPTR equ 0FFCh ;# 
# 8872 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TOS equ 0FFDh ;# 
# 8879 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TOSL equ 0FFDh ;# 
# 8886 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TOSH equ 0FFEh ;# 
# 8893 "C:/Program Files/Microchip/MPLABX/v6.20/packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8\pic\include\proc/pic18f4550.h"
TOSU equ 0FFFh ;# 
	debug_source C
	FNCALL	_main,_Comando_LCD
	FNCALL	_main,_Escreve_LCD
	FNCALL	_main,_Inicializa_LCD
	FNCALL	_main,_Posiciona_LCD
	FNCALL	_Posiciona_LCD,_Comando_LCD
	FNCALL	_Inicializa_LCD,_Comando_LCD
	FNCALL	_Escreve_LCD,_Escreve_C_LCD
	FNROOT	_main
	global	Inicializa_LCD@ini
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"./lcd.h"
	line	87

;initializer for Inicializa_LCD@ini
	db	low(038h)
	db	low(038h)
	db	low(038h)
	db	low(0Ch)
	db	low(06h)
	db	low(01h)
	db	low(0)
	global	_TRISE
_TRISE	set	0xF96
	global	_TRISD
_TRISD	set	0xF95
	global	_PORTE
_PORTE	set	0xF84
	global	_ADCON1
_ADCON1	set	0xFC1
	global	_PORTD
_PORTD	set	0xF83
	global	_PORTEbits
_PORTEbits	set	0xF84
psect	smallconst,class=SMALLCONST,space=0,reloc=2,noexec
global __psmallconst
__psmallconst:
	db	0
	
STR_1:
	db	65	;'A'
	db	110	;'n'
	db	116	;'t'
	db	111	;'o'
	db	110	;'n'
	db	105	;'i'
	db	111	;'o'
	db	0
	
STR_2:
	db	78	;'N'
	db	117	;'u'
	db	110	;'n'
	db	101	;'e'
	db	115	;'s'
	db	0
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config FOSC = "HS"
	config FCMEN = "OFF"
	config IESO = "OFF"
	config PWRT = "ON"
	config BORV = "0"
	config WDT = "OFF"
	config WDTPS = "128"
	config PBADEN = "OFF"
	config LPT1OSC = "OFF"
	config MCLRE = "ON"
	config STVREN = "OFF"
	config LVP = "OFF"
	config DEBUG = "OFF"
	file	"dist/default/production\prj_lcd.X.production.s"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"./lcd.h"
	line	87
Inicializa_LCD@ini:
       ds      7
	file	"dist/default/production\prj_lcd.X.production.s"
	line	#
psect	cinit
; Initialize objects allocated to COMRAM (7 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,7
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
	GLOBAL	__Lmediumconst
	movlw	low highword(__Lmediumconst)
	movwf	tblptru
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_Comando_LCD:	; 1 bytes @ 0x0
?_Escreve_C_LCD:	; 1 bytes @ 0x0
?_Inicializa_LCD:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
??_Comando_LCD:	; 1 bytes @ 0x0
??_Escreve_C_LCD:	; 1 bytes @ 0x0
	ds   1
	global	Comando_LCD@comando
Comando_LCD@comando:	; 1 bytes @ 0x1
	global	Escreve_C_LCD@caracter
Escreve_C_LCD@caracter:	; 1 bytes @ 0x1
	ds   1
?_Posiciona_LCD:	; 1 bytes @ 0x2
?_Escreve_LCD:	; 1 bytes @ 0x2
	global	Posiciona_LCD@coluna
Posiciona_LCD@coluna:	; 1 bytes @ 0x2
	global	Escreve_LCD@caracter
Escreve_LCD@caracter:	; 1 bytes @ 0x2
??_Inicializa_LCD:	; 1 bytes @ 0x2
	ds   1
	global	Posiciona_LCD@linha
Posiciona_LCD@linha:	; 1 bytes @ 0x3
	global	Inicializa_LCD@x
Inicializa_LCD@x:	; 1 bytes @ 0x3
??_Posiciona_LCD:	; 1 bytes @ 0x3
??_Escreve_LCD:	; 1 bytes @ 0x3
	ds   1
	global	Posiciona_LCD@x
Posiciona_LCD@x:	; 1 bytes @ 0x4
	ds   1
??_main:	; 1 bytes @ 0x5
	ds   2
;!
;!Data Sizes:
;!    Strings     14
;!    Constant    0
;!    Data        7
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           95      7      14
;!    BANK0           160      0       0
;!    BANK1           256      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0
;!    BANK6           256      0       0
;!    BANK7           256      0       0

;!
;!Pointer List with Targets:
;!
;!    Escreve_LCD@caracter	PTR unsigned char  size(1) Largest target is 8
;!		 -> STR_1(CODE[8]), STR_2(CODE[6]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_Posiciona_LCD
;!    _Posiciona_LCD->_Comando_LCD
;!    _Inicializa_LCD->_Comando_LCD
;!    _Escreve_LCD->_Escreve_C_LCD
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _main in BANK6
;!
;!    None.
;!
;!Critical Paths under _main in BANK7
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 2     2      0     306
;!                                              5 COMRAM     2     2      0
;!                        _Comando_LCD
;!                        _Escreve_LCD
;!                     _Inicializa_LCD
;!                      _Posiciona_LCD
;! ---------------------------------------------------------------------------------
;! (1) _Posiciona_LCD                                        3     2      1     184
;!                                              2 COMRAM     3     2      1
;!                        _Comando_LCD
;! ---------------------------------------------------------------------------------
;! (1) _Inicializa_LCD                                       2     2      0      45
;!                                              2 COMRAM     2     2      0
;!                        _Comando_LCD
;! ---------------------------------------------------------------------------------
;! (2) _Comando_LCD                                          2     2      0      15
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _Escreve_LCD                                          2     1      1      62
;!                                              2 COMRAM     2     1      1
;!                      _Escreve_C_LCD
;! ---------------------------------------------------------------------------------
;! (2) _Escreve_C_LCD                                        2     2      0      15
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _Comando_LCD
;!   _Escreve_LCD
;!     _Escreve_C_LCD
;!   _Inicializa_LCD
;!     _Comando_LCD
;!   _Posiciona_LCD
;!     _Comando_LCD
;!

;!Address spaces:

;!Name               Size   Autos  Total    Usage
;!BIGRAM            2047      0       0      0.0%
;!BITBANK7           256      0       0      0.0%
;!BANK7              256      0       0      0.0%
;!BITBANK6           256      0       0      0.0%
;!BANK6              256      0       0      0.0%
;!BITBANK5           256      0       0      0.0%
;!BANK5              256      0       0      0.0%
;!BITBANK4           256      0       0      0.0%
;!BANK4              256      0       0      0.0%
;!BITBANK3           256      0       0      0.0%
;!BANK3              256      0       0      0.0%
;!BITBANK2           256      0       0      0.0%
;!BANK2              256      0       0      0.0%
;!BITBANK1           256      0       0      0.0%
;!BANK1              256      0       0      0.0%
;!BITBANK0           160      0       0      0.0%
;!BANK0              160      0       0      0.0%
;!BITBIGSFRh         123      0       0      0.0%
;!BITCOMRAM           95      0       0      0.0%
;!COMRAM              95      7      14     14.7%
;!BITBIGSFRl          35      0       0      0.0%
;!STACK                0      0       0      0.0%
;!DATA                 0      0      14      0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 7 in file "tela.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_Comando_LCD
;;		_Escreve_LCD
;;		_Inicializa_LCD
;;		_Posiciona_LCD
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"tela.c"
	line	7
global __ptext0
__ptext0:
psect	text0
	file	"tela.c"
	line	7
	
_main:
;incstack = 0
	callstack 29
	line	8
	
l854:
	clrf	((c:3971))^0f00h,c	;volatile
	line	9
	clrf	((c:3972))^0f00h,c	;volatile
	line	10
	clrf	((c:3989))^0f00h,c	;volatile
	line	11
	
l856:
	movlw	low(0FCh)
	movwf	((c:3990))^0f00h,c	;volatile
	line	13
	
l858:
	call	_Inicializa_LCD	;wreg free
	line	14
	
l860:
	movlw	(01h)&0ffh
	
	call	_Comando_LCD
	line	15
	
l862:
	movlw	low(06h)
	movwf	((c:Posiciona_LCD@coluna))^00h,c
	movlw	(01h)&0ffh
	
	call	_Posiciona_LCD
	line	16
	
l864:
		movlw	low(STR_1)
	movwf	((c:Escreve_LCD@caracter))^00h,c

	call	_Escreve_LCD	;wreg free
	line	17
	
l866:
	movlw	low(07h)
	movwf	((c:Posiciona_LCD@coluna))^00h,c
	movlw	(02h)&0ffh
	
	call	_Posiciona_LCD
	line	18
	
l868:
		movlw	low(STR_2)
	movwf	((c:Escreve_LCD@caracter))^00h,c

	call	_Escreve_LCD	;wreg free
	line	19
	
l870:
	asmopt push
asmopt off
movlw  6
movwf	(??_main+0+0+1)^00h,c
movlw	19
movwf	(??_main+0+0)^00h,c
	movlw	174
u67:
decfsz	wreg,f
	bra	u67
	decfsz	(??_main+0+0)^00h,c,f
	bra	u67
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u67
asmopt pop

	line	20
	
l872:
	movlw	(01h)&0ffh
	
	call	_Comando_LCD
	line	21
	
l874:
		asmopt push
	asmopt off
	asmopt pop

	line	23
	
l50:
	global	start
	goto	start
	callstack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_Posiciona_LCD

;; *************** function _Posiciona_LCD *****************
;; Defined at:
;;		line 37 in file "./lcd.h"
;; Parameters:    Size  Location     Type
;;  linha           1    wreg     unsigned char 
;;  coluna          1    2[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  linha           1    3[COMRAM] unsigned char 
;;  x               1    4[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         1       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_Comando_LCD
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	file	"./lcd.h"
	line	37
global __ptext1
__ptext1:
psect	text1
	file	"./lcd.h"
	line	37
	
_Posiciona_LCD:
;incstack = 0
	callstack 29
	movwf	((c:Posiciona_LCD@linha))^00h,c
	line	38
	
l824:
	clrf	((c:Posiciona_LCD@x))^00h,c
	line	39
	
l826:
	decf	((c:Posiciona_LCD@coluna))^00h,c
	line	40
	goto	l838
	line	41
	
l828:
	movf	((c:Posiciona_LCD@coluna))^00h,c,w
	addlw	low(080h)
	movwf	((c:Posiciona_LCD@x))^00h,c
	line	42
	goto	l840
	line	43
	
l830:
	movf	((c:Posiciona_LCD@coluna))^00h,c,w
	addlw	low(0C0h)
	movwf	((c:Posiciona_LCD@x))^00h,c
	line	44
	goto	l840
	line	45
	
l832:
	movf	((c:Posiciona_LCD@coluna))^00h,c,w
	addlw	low(090h)
	movwf	((c:Posiciona_LCD@x))^00h,c
	line	46
	goto	l840
	line	47
	
l834:
	movf	((c:Posiciona_LCD@coluna))^00h,c,w
	addlw	low(0D0h)
	movwf	((c:Posiciona_LCD@x))^00h,c
	line	48
	goto	l840
	line	50
	
l838:
	movf	((c:Posiciona_LCD@linha))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l828
	xorlw	2^1	; case 2
	skipnz
	goto	l830
	xorlw	3^2	; case 3
	skipnz
	goto	l832
	xorlw	4^3	; case 4
	skipnz
	goto	l834
	goto	l840

	line	51
	
l840:
	movf	((c:Posiciona_LCD@x))^00h,c,w
	btfsc	status,2
	goto	u41
	goto	u40
u41:
	goto	l28
u40:
	
l842:
	movf	((c:Posiciona_LCD@x))^00h,c,w
	
	call	_Comando_LCD
	line	52
	
l28:
	return	;funcret
	callstack 0
GLOBAL	__end_of_Posiciona_LCD
	__end_of_Posiciona_LCD:
	signat	_Posiciona_LCD,8313
	global	_Inicializa_LCD

;; *************** function _Inicializa_LCD *****************
;; Defined at:
;;		line 85 in file "./lcd.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  x               1    3[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_Comando_LCD
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	85
global __ptext2
__ptext2:
psect	text2
	file	"./lcd.h"
	line	85
	
_Inicializa_LCD:
;incstack = 0
	callstack 29
	line	86
	
l782:
	clrf	((c:Inicializa_LCD@x))^00h,c
	line	89
	
l784:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	91
	
l786:
	clrf	((c:3971))^0f00h,c	;volatile
	line	92
	
l788:
	movf	((c:3972))^0f00h,c,w	;volatile
	andlw	low(0F8h)
	movwf	((c:3972))^0f00h,c	;volatile
	line	93
	
l790:
	clrf	((c:3989))^0f00h,c	;volatile
	line	94
	
l792:
	movf	((c:3990))^0f00h,c,w	;volatile
	andlw	low(0F8h)
	movwf	((c:3990))^0f00h,c	;volatile
	line	96
	goto	l800
	line	97
	
l794:
	movf	((c:Inicializa_LCD@x))^00h,c,w
	addlw	low(Inicializa_LCD@ini)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_Comando_LCD
	line	98
	
l796:
	incf	((c:Inicializa_LCD@x))^00h,c
	line	99
	
l798:
	asmopt push
asmopt off
movlw	7
movwf	(??_Inicializa_LCD+0+0)^00h,c
	movlw	125
u77:
decfsz	wreg,f
	bra	u77
	decfsz	(??_Inicializa_LCD+0+0)^00h,c,f
	bra	u77
	nop
asmopt pop

	line	96
	
l800:
	movf	((c:Inicializa_LCD@x))^00h,c,w
	addlw	low(Inicializa_LCD@ini)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u31
	goto	u30
u31:
	goto	l794
u30:
	line	101
	
l45:
	return	;funcret
	callstack 0
GLOBAL	__end_of_Inicializa_LCD
	__end_of_Inicializa_LCD:
	signat	_Inicializa_LCD,89
	global	_Comando_LCD

;; *************** function _Comando_LCD *****************
;; Defined at:
;;		line 23 in file "./lcd.h"
;; Parameters:    Size  Location     Type
;;  comando         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  comando         1    1[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Posiciona_LCD
;;		_Inicializa_LCD
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	line	23
global __ptext3
__ptext3:
psect	text3
	file	"./lcd.h"
	line	23
	
_Comando_LCD:
;incstack = 0
	callstack 29
	movwf	((c:Comando_LCD@comando))^00h,c
	line	24
	
l726:
	bcf	((c:3972))^0f00h,c,0	;volatile
	line	27
	
l728:
	movff	(c:Comando_LCD@comando),(c:3971)	;volatile
	line	28
	
l730:
	bsf	((c:3972))^0f00h,c,1	;volatile
	line	29
	
l732:
	asmopt push
asmopt off
movlw	7
movwf	(??_Comando_LCD+0+0)^00h,c
	movlw	125
u87:
decfsz	wreg,f
	bra	u87
	decfsz	(??_Comando_LCD+0+0)^00h,c,f
	bra	u87
	nop
asmopt pop

	line	30
	
l734:
	bcf	((c:3972))^0f00h,c,1	;volatile
	line	31
	
l736:
	asmopt push
asmopt off
movlw	13
movwf	(??_Comando_LCD+0+0)^00h,c
	movlw	252
u97:
decfsz	wreg,f
	bra	u97
	decfsz	(??_Comando_LCD+0+0)^00h,c,f
	bra	u97
asmopt pop

	line	32
	
l17:
	return	;funcret
	callstack 0
GLOBAL	__end_of_Comando_LCD
	__end_of_Comando_LCD:
	signat	_Comando_LCD,4217
	global	_Escreve_LCD

;; *************** function _Escreve_LCD *****************
;; Defined at:
;;		line 73 in file "./lcd.h"
;; Parameters:    Size  Location     Type
;;  caracter        1    2[COMRAM] PTR unsigned char 
;;		 -> STR_2(6), STR_1(8), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         1       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_Escreve_C_LCD
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	73
global __ptext4
__ptext4:
psect	text4
	file	"./lcd.h"
	line	73
	
_Escreve_LCD:
;incstack = 0
	callstack 29
	line	74
	
l844:
	goto	l852
	line	75
	
l846:
	movff	(c:Escreve_LCD@caracter),tblptrl
	if	1	;There is more than 1 active tblptr byte
	global __smallconst
movlw	high(__smallconst)
	movwf	tblptrh
	endif
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	movlw	low highword(__smallconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	
	call	_Escreve_C_LCD
	line	76
	
l848:
	incf	((c:Escreve_LCD@caracter))^00h,c
	line	77
	
l850:
	asmopt push
asmopt off
movlw	13
movwf	(??_Escreve_LCD+0+0)^00h,c
	movlw	252
u107:
decfsz	wreg,f
	bra	u107
	decfsz	(??_Escreve_LCD+0+0)^00h,c,f
	bra	u107
asmopt pop

	line	74
	
l852:
	movff	(c:Escreve_LCD@caracter),tblptrl
	if	1	;There is more than 1 active tblptr byte
	global __smallconst
movlw	high(__smallconst)
	movwf	tblptrh
	endif
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	movlw	low highword(__smallconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	iorlw	0
	btfss	status,2
	goto	u51
	goto	u50
u51:
	goto	l846
u50:
	line	79
	
l37:
	return	;funcret
	callstack 0
GLOBAL	__end_of_Escreve_LCD
	__end_of_Escreve_LCD:
	signat	_Escreve_LCD,4217
	global	_Escreve_C_LCD

;; *************** function _Escreve_C_LCD *****************
;; Defined at:
;;		line 57 in file "./lcd.h"
;; Parameters:    Size  Location     Type
;;  caracter        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  caracter        1    1[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Escreve_LCD
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	57
global __ptext5
__ptext5:
psect	text5
	file	"./lcd.h"
	line	57
	
_Escreve_C_LCD:
;incstack = 0
	callstack 29
	movwf	((c:Escreve_C_LCD@caracter))^00h,c
	line	58
	
l738:
	bsf	((c:3972))^0f00h,c,0	;volatile
	line	61
	bcf	((c:3972))^0f00h,c,1	;volatile
	line	62
	
l740:
	asmopt push
asmopt off
movlw	7
movwf	(??_Escreve_C_LCD+0+0)^00h,c
	movlw	125
u117:
decfsz	wreg,f
	bra	u117
	decfsz	(??_Escreve_C_LCD+0+0)^00h,c,f
	bra	u117
	nop
asmopt pop

	line	63
	
l742:
	movff	(c:Escreve_C_LCD@caracter),(c:3971)	;volatile
	line	64
	
l744:
	bsf	((c:3972))^0f00h,c,1	;volatile
	line	65
	
l746:
	asmopt push
asmopt off
movlw	13
movwf	(??_Escreve_C_LCD+0+0)^00h,c
	movlw	252
u127:
decfsz	wreg,f
	bra	u127
	decfsz	(??_Escreve_C_LCD+0+0)^00h,c,f
	bra	u127
asmopt pop

	line	66
	
l748:
	bcf	((c:3972))^0f00h,c,1	;volatile
	line	67
	
l750:
	asmopt push
asmopt off
movlw	13
movwf	(??_Escreve_C_LCD+0+0)^00h,c
	movlw	252
u137:
decfsz	wreg,f
	bra	u137
	decfsz	(??_Escreve_C_LCD+0+0)^00h,c,f
	bra	u137
asmopt pop

	line	68
	
l31:
	return	;funcret
	callstack 0
GLOBAL	__end_of_Escreve_C_LCD
	__end_of_Escreve_C_LCD:
	signat	_Escreve_C_LCD,4217
psect	smallconst
	db 0	; dummy byte at the end
	global	__smallconst
__smallconst	set	__psmallconst
	global	__mediumconst
__mediumconst	set	__psmallconst
	GLOBAL	__activetblptr
__activetblptr	EQU	2
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	end
