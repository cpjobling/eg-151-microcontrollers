1. What do the lines reproduced below actually do?

```
PTAD	EQU	$0000	;Port A data register
PTADD	EQU	$0001	;Port A DDR
```


2. Can you demonstrate, using the debugger, that variables `COUNT0`, `COUNT1` and `COUNTER` are placed in the memory locations defined by the code:

```
	VARIABLES	EQU	$0080	        ;Start address in RAM for variables
	ORG	VARIABLES
```

3. What is the address in memory of the instruction

```
CLR	COUNTER		;Initial value of variable COUNTER = 0
```

4. What are the values of the programme counter, accumulator and status register just before the operator shown below is exercuted?

```
END_LOOP								;Arrive here regardless of button pressed
				JSR	SHORT_DELAY	;A short delay to make counting visible
```


5. What are the values of the programme counter, accumulator and status register just before this code is executed?

```
SHORT_DELAY
	        LDA	#$40		;Multiplier for delay
```          

6. What are the addressing modes for each of the following instructions?

```
  AND	#BIT2
  BEQ	DECREMENT
  BRA	END_LOOP
```
