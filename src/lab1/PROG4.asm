
;Up/down LED counter programme for AW60 demo board

;This file builds on PROG3.ASM with the inclusion of a mask and a decision.
;One of the push buttons on the demo board is designated as the up/down control.
;Button pressed: count down. Button released: count up.
;***************************************************************************************

PTAD		EQU	$0000			;Port A data register
PTADD		EQU	$0001			;Port A DDR
PTBD		EQU	$0002			;Port B data register
PTBDD		EQU	$0003			;Port B DDR
PTDD		EQU	$0006			;Port D data register
PTDDD		EQU	$0007			;Port D DDR
PTFD    EQU $000A     ;Port F data register
PTFDD   EQU $000B     ;Port F DDR

ICGC1   EQU $0048     ;Control for system clock
ICGC2   EQU $0049     ;Control for system clock


SOPT1		EQU	$1802			;Misc controls inc COP
PTAPE   EQU $1840     ;Pull ups for port A
PTDPE		EQU	$184C			;Pull ups for port D


;***************************************************************************************


VARIABLES	EQU	$0080			;Start address in RAM for variables
PROGRAMME	EQU	$8000			;start address in ROM for programme
STACK			EQU	$0100			;Start address for the top of the stack
VECTORS		EQU	$FFFE			;Start address for reset vector


;***************************************************************************************
BIT2		EQU	%00000100		;Define constant BIT2 to avoid numbers
	;within the main programme.
;***************************************************************************************


	ORG	VARIABLES

COUNT0		RMB	1			;Variable for inner loop of delay
COUNT1		RMB	1			;Variable for outer loop of delay
COUNTER		RMB	1			;this byte contains the running count



;***************************************************************************************
;There are some additional setting up lines in order to turn on the pull-up on Port D2.
;***************************************************************************************

	ORG	PROGRAMME				;Set the programme counter
START

	LDHX	#STACK				;Set the stack pointer
	TXS

	LDA     SOPT1				;Turn off the watchdog
	AND     #%01111111
	ORA     #%00000001
	STA	    SOPT1


	LDA     #%01110100	;Select external crystal
	STA     ICGC1


	JSR	SHORT_DELAY			;Start up delay for crystal


	LDA     #%11111111	;Set all the pins of port F as outputs
	STA     PTFDD

;***************************************************************************************
;The extra setting up lines follow...
;***************************************************************************************

	LDA	#BIT2			;Load the binary pattern corresponding
	              ;to the push button on port D2.
	STA	PTDPE			;Store the pattern in the pull-up register

;***************************************************************************************
;This modified programme contains several lines of code to test the push button on PTD2.
;If the button is not pressed (PTDx = 1) then increment COUNTER. If the button is pressed
;then decrement COUNTER. Note that the sense of the button is: pressed = logic level "0".
;***************************************************************************************

	CLR	COUNTER			;Initial value of variable COUNTER = 0
COUNT_LOOP
	LDA	COUNTER			;Load the current value of COUNTER
	STA	PTFD				;Send it to Port F data register

	LDA	PTDD				;Load the accumulator from port D
	AND	#BIT2				;Mask the desired bit of port D
	BEQ	DECREMENT		;If the designated bit is zero, branch

	INC	COUNTER			;Otherwise Increment the variable COUNTER
	BRA	END_LOOP		;Branch to the next part of the loop
DECREMENT
	DEC	COUNTER			;This is the destination if button pressed
END_LOOP						;Arrive here regardless of button pressed
	JSR	SHORT_DELAY	;A short delay to make counting visible

	BRA	COUNT_LOOP	;Repeat for ever


;***************************************************************************************
;Delay subroutine
;***************************************************************************************

SHORT_DELAY
	LDA	#$40			;Multiplier for delay
	STA	COUNT1		;Store the multiplier in COUNT1
	CLR	COUNT0		;Set the inner loop counter to zero
DEL1
	DEC	COUNT0		;Decrement the inner loop counter
	NOP						;This instruction does nothing
	BNE	DEL1			;Has the inner loop reached zero yet?
	DEC	COUNT1		;If not, back to the label DEL1
	BNE	DEL1			;Otherwise decrement the outer loop
	RTS						;counter and then back to label DEL1


;**************************************************************************************


	ORG	VECTORS
	FDB	START



;***************************************************************************************
