
;LED counter programme for AW60 demo board

;This file contains the setting up instructions described in PROG1.ASM and PROG2.ASM
;together with a simple counting programme which will cause the LEDs connected to port F
;to count up in binary at a fixed rate At last we have an executable programme!

;***************************************************************************************

PTAD		EQU	$0000			;Port A data register
PTADD		EQU	$0001			;Port A DDR
PTBD		EQU	$0002			;Port B data register
PTBDD		EQU	$0003			;Port B DDR
PTFD    EQU $000A     ;Port F data register
PTFDD   EQU $000B     ;Port F DDR

ICGC1   EQU $0048     ;Control for system clock
ICGC2   EQU $0049     ;Control for system clock


SOPT1		EQU	$1802			;Misc controls inc COP
PTAPE   EQU $1840     ;Pull ups for port A


;***************************************************************************************


VARIABLES	EQU	$0080			;Start address in RAM for variables
PROGRAMME	EQU	$8000			;start address in ROM for programme
STACK			EQU	$0100			;Start address for the top of the stack
VECTORS		EQU	$FFFE			;Start address for reset vector


;***************************************************************************************


		ORG	VARIABLES

COUNT0		RMB	1			;Variable for inner loop of delay
COUNT1		RMB	1			;Variable for outer loop of delay
COUNTER		RMB	1			;this byte contains the running count



;***************************************************************************************

		ORG	PROGRAMME				;Set the programme counter
START

		LDHX	#STACK				;Set the stack pointer
		TXS

		LDA     SOPT1				;Turn off the watchdog
		AND     #%01111111
		ORA     #%00000001
		STA	SOPT1


		LDA     #%01110100  ;Select external crystal
		STA     ICGC1


		JSR	SHORT_DELAY			;Start up delay for crystal


		LDA     #%11111111  ;Set all the pins of port F as outputs
		STA     PTFDD

;***************************************************************************************
; At last here is the application programme ...
;***************************************************************************************
;The programme works by first of all clearing the variable COUNTER. The main part of the
;code is in the few instructions between the label COUNT_LOOP and the branch instruction.
;Every time the loop repeats the value of COUNTER is transferred to port F, then the
;value of COUNTER is incremented by one. A delay is included to "pad out" the loop.
;***************************************************************************************

		CLR	COUNTER			;Initial value of variable COUNTER = 0
COUNT_LOOP
		LDA	COUNTER			;Load the current value of COUNTER
		STA	PTFD				;Send it to Port F data register
		INC	COUNTER			;Increment the variable COUNTER (mod 256)
		JSR	SHORT_DELAY	;A short delay to make counting visible

		BRA	COUNT_LOOP	;Repeat for ever

;**************************************************************************************
;... and that is the end of the application programme.
;***************************************************************************************
;Delay subroutine
;***************************************************************************************
;The delay works by running around a loop many times, with an inner and outer loop.
;Two variables are set up at the start of the subroutine, COUNT0 and COUNT1. They are
;decremented repeatedly until both reach zero. A simple calculation gives the delay time.
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
		RTS					;counter and then back to label DEL1


;**************************************************************************************


		ORG	VECTORS
		FDB	START



;***************************************************************************************
