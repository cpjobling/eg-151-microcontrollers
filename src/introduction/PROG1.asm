
;Framework programme for AW60 demo board

;This file contains the framework needed to write an assembly language programme.
;There is no code in this framework; it is entirely made up of instructions to the
;compiler/assembler, known as assembler directives or pseudo operations.

;***************************************************************************************

;The following lines tell the assembler/compiler that certain words must be given
;fixed numeric values. In these lines, the input/ouput ports of the microcontroller
;are numbered and given names for our convenience. For example, the Port B data
;register (named PTBD by convention) is assigned the numeric value of $0002.
;The last two lines refer to special memory locations in the microcontroller which
;allow detailed settings to be changed, e.g. turning off the "watchdog timer".

;***************************************************************************************

PTAD		EQU	$0000			;Port A data register
PTADD		EQU	$0001			;Port A DDR
PTBD		EQU	$0002			;Port B data register
PTBDD		EQU	$0003			;Port B DDR
PTFD            EQU     $000A                   ;Port F data register
PTFDD           EQU     $000B                   ;Port F DDR

ICGC1           EQU     $0048                   ;Control for system clock
ICGC2           EQU     $0049                   ;Control for system clock


SOPT1		EQU	$1802			;Misc controls inc COP
PTAPE           EQU     $1840                   ;Pull ups for port A


;***************************************************************************************
;There are lots more input/output ports in the HCS08 microcontroller, but these are
;sufficient for this simple example programme.
;***************************************************************************************
;The following equates which set up some fixed memory locations in the microcontroller.

;***************************************************************************************

VARIABLES	EQU	$0080			;Start address in RAM for variables
PROGRAMME	EQU	$8000			;start address in ROM for programme
VECTORS		EQU	?????			;Start address for list of vector(s)


;***************************************************************************************
;The assembler directive ORG (= origin) tells the assembler/compiler to begin filling
;memory locations from a specified fixed point. For exammple, ORG $4000 would instruct 
;the assembler to enumerate memory locations starting at hexadecimal 4000.

;***************************************************************************************


		ORG	VARIABLES

;	The list of variables goes here

		ORG	PROGRAMME

;	This is the start of the assembly language code

		ORG	VECTORS

;	The vectors are used to direct the microcontroller


;***************************************************************************************

;Now that this framework is in place, we can begin to write some programme instructions!
;However, there are some housekeeping tasks to perform first so that the microcontroller
;starts properly and that various internal registers are initialised correctly.

;***************************************************************************************
