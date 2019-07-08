
;Index and Add programme for AW60 demo board

;This programme uses indexed addressing to add a series of numbers
;and then display the result on the LED bar.
;***************************************************************************************

PTAD		EQU	$0000			;Port A data register
PTADD		EQU	$0001			;Port A DDR
PTBD		EQU	$0002			;Port B data register
PTBDD		EQU	$0003			;Port B DDR
PTDD		EQU	$0006			;Port D data register
PTDDD		EQU	$0007			;Port D DDR
PTFD            EQU     $000A                   ;Port F data register
PTFDD           EQU     $000B                   ;Port F DDR

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
		

		JSR	SHORT_DELAY		;Start up delay for crystal


		LDA     #%11111111              ;Set all the pins of port F as outputs
		STA     PTFDD

;***************************************************************************************
;The extra setting up lines follow...
;***************************************************************************************

		LDA	#BIT2			;Load the binary pattern corresponding
						;to the push button on port D2.
		ADD	#BIT3			;Push button on port D3 as well.
		STA	PTDPE			;Store the pattern in the pull-up register

;***************************************************************************************
;The following code runs through the table of numbers, and adds them to the accumulator.
;Finally the contents of the accumulator are sent to the LED bar.
;***************************************************************************************

		LDHX	#TABLE			;Point the index register to the table
		CLRA				;Initialise the accumulator to zero
NEXT_NUMBER 
		ADD	0,X			;Add the indexed number to the accumulator
		AIX	#01			;Increment the HX index register
		CPHX	#END_TABLE		;Has the last number been added?
		BNE	NEXT_NUMBER		;If not, branch back for next number

		STA	PTFD			;Otherwise send the total to the LED bar
LOOP
		BRA	LOOP			;This line "traps" the microprocessor

;***************************************************************************************
;Table of numbers
;***************************************************************************************

TABLE
		FCB	1,2,3,4,5,6		;The table of numbers are stored in ROM.
END_TABLE
		FCB	0			;This is a dummy value to end the table.
		

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
