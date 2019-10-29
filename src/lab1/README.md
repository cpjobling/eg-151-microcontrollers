# First Exercise - A Variable Speed Counter

1. Draw a flow chart of the existing programme [PROG4.asm](https://github.com/cpjobling/eg-151-microcontrollers/blob/master/src/lab1/PROG4.asm).
2. Answer the questions given in [questions.md](questions.md)
2. Modify existing program to achieve:
   1. fast speed by pressing SW4, 
   2. slow speed by pressing SW3, 
   3. intermediate speed if not pressing either switch.

Plan your changes by modifying your flowchart before implementing your solution in code.

(hint: to use `SW3`, make `BIT3 = %00001000`, then initialise it by sending `BIT3` to `PTDPE`)

