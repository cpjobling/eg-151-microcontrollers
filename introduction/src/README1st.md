# Read me first

The four files PROG1,2,3,4 are written as an example of the development of an assembly language programme.

The first file `PROG1.ASM` has no code in it at all! It sets up the names and values of constants and variables used in the programme.

The second file `PROG2.ASM` contains some code, however its function is to set up internal registers of the microcontroller and to define the reset vector.

The third file `PROG3.ASM` is a working programme which increments an 8-bit binary number displayed on LEDs.

The fourth file `PROG4.ASM` develops PROG3 by including a button to control up or down counting on the LEDs.

Before assembling and running the programmes, a Code Warrrior project must be constructed.

Click on the Code Warrior icon, and select "new project" on the wizard. Answer the questions "processor AW60"; "P&E"; "absolute assembly". These steps will be explained in more detail in class.

Exit from the Code Warrior programme.

Next take one of the files `PROG3.asm` or `PROG4.asm` and copy into the directory projectname/sources.

Rename the file as `MAIN.ASM` and answer "yes" when asked if the old file is to be overwritten.

Run Code Warrior and select "previous project" from the list.

Click on the name of your project. The main edit screen will appear.

Click on "main.asm" to open the file.

Click on "make" to assemble the file. If the file assembles correctly

Click "debug" and follow the series of questions that follow. Some steps will take several seconds, so be patient!

Finally click on the "run" icon to run the programme.

Good luck, and do not hesitate to ask for help if needed.
