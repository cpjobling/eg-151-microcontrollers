
;Set-up programme for AW60 demo board

;This file contains the instructions needed to set up an assembly language programme.
;All the instructions are used to define variables and input/output devices in the
;microcontroller. So far, there are no instructions for the intended application!
;***************************************************************************************

PTAD		EQU	$0000			;Port A data register
PTADD		EQU	$0001			;Port A DDR
PTBD		EQU	$0002			;Port B data register
PTBDD		EQU	$0003			;Port B DDR
PTFD        EQU $000A           ;Port F data register
PTFDD       EQU $000B           ;Port F DDR

ICGC1       EQU $0048           ;Control for system clock
ICGC2       EQU $0049           ;Control for system clock


SOPT1		EQU	$1802			;Misc controls inc COP
PTAPE       EQU $1840           ;Pull ups for port A


;***************************************************************************************


VARIABLES	EQU	$0080			;Start address in RAM for variables
PROGRAMME	EQU	$8000			;start address in ROM for programme
STACK		EQU	$0100			;Start address for the top of the stack 
VECTORS		EQU	$FFFE			;Start address for reset vector


;***************************************************************************************


		ORG	VARIABLES

COUNT0	RMB	1			;Variable for inner loop of delay
COUNT1	RMB	1			;Variable for outer loop of delay

;The names COUNT0 and COUNT1 refer to memory locations which will be used as variables
;in our programme. Some assembler/compilers used the directive DS.B (data segment) 
;instead of RMB (reserve memory bytes).


;***************************************************************************************

		ORG	PROGRAMME		;Set the programme counter
START

		LDHX	#STACK		;Set the stack pointer
		TXS

;The above two lines set the stack pointer to an address in RAM above the variables,
;preferably at the top of RAM. The stack is used to store the return address during
;a subroutine call and to store internal registers during an interrupt service.


		LDA     SOPT1		;Turn off the watchdog
		AND     #%01111111
		ORA     #%00000001
		STA	SOPT1

;The four lines above are used to disable a feature of the microcontroller, variously
;known as the "watchdog timer" or "computer operating properly" (COP). The watchdog is
;used to force a reset if the microcontroller programme crashes or goes into a loop.
;The watchdog is not a good idea while writing programmes, so it is usual to turn it
;off until the programme is finally finished and debugged.

		LDA     #%01110100   ;Select external crystal
		STA     ICGC1
		
;The AW60 microcontroller has an internal oscillator of about 8 MHz, but for accurate
;timing it is preferable to use an external oscillator or a quartz crystal. The two lines
;above select the external 4 MHz crystal fitted to the demo board.

		JSR	SHORT_DELAY		;Start up delay for crystal

;The quart crystal may take several milliseconds to "settle down" so a delay is included
;in the programme until the crystal oscillator is ready.


		LDA     #%11111111  ;Set all the pins of port F as outputs
		STA     PTFDD

;By default the ports of the microcontroller are all inputs. Any pin can be turned into
an output by putting a logic "1" in the corresponding bit position of the data direction
;register assigned to that port.
		

;	This is the start of the assembly language code.
;	Our application programme will go here eventually.


		ORG	VECTORS
		FDB	START

;The vectors are used to direct the microcontroller to the appropriate memory location
;when events take place. The most powerful external event is the reset button, which
;takes precedence over everything else.
;When the reset button is pressed, the response of the microcontroller is to look in
;memory location $FFFE,$FFFF (the last two bytes in memory) and then jump to the 16 bit
;bit address contained in those locations. Our programme must pre-load the last two bytes
;with the place in memory that execution must start. This is achieved using an ORG pseudo
;operation followed by the pseudo operation FDB (form double byte) or DC.W (define
;constant word) on more recent assembler/compilers.


;***************************************************************************************

;After running the above instructions, the microcontroller should be in an orderly state
;and ready to run our application programme.

;***************************************************************************************
