
;ADC test programme for AW60 demo board

;***************************************************************************************

PTAD		EQU	$0000			;Port A data register
PTADD		EQU	$0001			;Port A DDR
PTBD		EQU	$0002			;Port B data register
PTBDD		EQU	$0003			;Port B DDR
PTDD		EQU	$0006			;Port D data register
PTDDD		EQU	$0007			;Port D DDR
PTFD            EQU     $000A                   ;Port F data register
PTFDD           EQU     $000B                   ;Port F DDR


ADC1SC1		EQU	$0010                   ;ADC status register
ADC1SC2		EQU	$0011
ADC1RH		EQU	$0012			;Bits 0,1 are MSBs of conv
ADC1RL		EQU	$0013			;Lower 8 bits of 10-bit conv
ADC1CFG		EQU	$0016                   ;Controls ADC clock etc
APCTL1		EQU	$0017                   ;Pin control registers
APCTL2		EQU	$0018
APCTL3		EQU	$0019


ICGC1           EQU     $0048                   ;Control for system clock
ICGC2           EQU     $0049                   ;Control for system clock


SOPT1		EQU	$1802			;Misc controls inc COP
PTAPE           EQU     $1840                   ;Pull ups for port A
PTDPE		EQU	$184C			;Pull ups for port D


;***************************************************************************************


VARIABLES	EQU	$0080			;Start address in RAM for variables
PROGRAMME	EQU	$8000			;start address in ROM for programme
STACK		EQU	$0100			;Start address for the top of the stack 
VECTORS		EQU	$FFFE			;Start address for reset vector


;***************************************************************************************
BIT2		EQU	%00000100		;Define constant BIT2 to avoid numbers
						;within the main programme.
BIT3		EQU	%00001000		;Define constant BIT3 as well.
;***************************************************************************************


		ORG	VARIABLES

COUNT0		RMB	1			;Variable for inner loop of delay
COUNT1		RMB	1			;Variable for outer loop of delay


;***************************************************************************************
;There are some additional setting up lines in order to turn on the pull-up on Port D2.
;*************************************************************************************** 

		ORG	PROGRAMME		;Set the programme counter
START

		LDHX	#STACK			;Set the stack pointer
		TXS

		LDA     SOPT1			;Turn off the watchdog
		AND     #%01111111
		ORA     #%00000001
		STA	SOPT1


		LDA     #%01110100              ;Select external crystal
		STA     ICGC1
		
		LDA	#%01100000
		STA	ADC1CFG			;Start up the ADC

		LDA	#%00000001		;Make PTD0 an analogue input
		STA 	APCTL2

		JSR	SHORT_DELAY		;Start up delay for crystal


		LDA     #%11111111              ;Set all the pins of port F as outputs
		STA     PTFDD

;***************************************************************************************
;The following code stars a conversion on the built-in ADC and then waits
;for the ADC to finish its conversion. The result is then sent to the LED bar.
;***************************************************************************************
		
START_ADC		
		LDA	#%00001000      	;Kick off a conversion
		STA	ADC1SC1		        ;on ADC channel 8 (PTD0)
		
WAIT_ADC
                TST     ADC1SC1                 ;Look at ADC status register
                BPL     WAIT_ADC                ;Loop if ADC not finished conversion
		
	        	
		LDA	ADC1RL                  ;Load data from ADC
		STA	PTFD                    ;Send to the LED bar
		
		BRA     START_ADC               ;Repeat


;***************************************************************************************
;Delay subroutine
;***************************************************************************************

SHORT_DELAY
		LDA	#$40			;Multiplier for delay
		STA	COUNT1			;Store the multiplier in COUNT1
		CLR	COUNT0			;Set the inner loop counter to zero
DEL1
		DEC	COUNT0			;Decrement the inner loop counter
		NOP				;This instruction does nothing
		BNE	DEL1			;Has the inner loop reached zero yet?
       		DEC	COUNT1			;If not, back to the label DEL1
		BNE	DEL1			;Otherwise decrement the outer loop
		RTS				;counter and then back to label DEL1


;**************************************************************************************		


		ORG	VECTORS
		FDB	START



;***************************************************************************************
