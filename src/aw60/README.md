# Read me first

The four files PROG1,2,3,4 are written as an example of the development of an assembly language programme.

The first file `introduction/PROG1.ASM` has no code in it at all! It sets up the names and values of constants and variables used in the programme.

The second file `introduction/PROG2.ASM` contains some code, however its function is to set up internal registers of the microcontroller and to define the **reset vector**.

The third file `introduction/PROG3.ASM` is a working programme which increments an 8-bit binary number displayed on LEDs. We will use this file to demonstrate the code simulator, the debugger and the hardware execution system.

The fourth file `lab1/PROG4.ASM` develops `introduction/PROG3`by including a button to control up or down counting on the LEDs. This file will be the starting point for the assessed exercise for lab 1.

# The code development system Code Warrior

Before assembling and running the programmes, a **Code Warrrior** project must be constructed.

1. Click on the Code Warrior icon, and select "new project" on the wizard. Answer the questions "**processor AW60**"; "**P&E**"; "**absolute assembly**". These steps will be explained in more detail in class.

2. Exit from the Code Warrior programme.

3. Next take the file `introduction/PROG3.asm` and copy into the directory `projectname/sources`.

4. Rename the file as `MAIN.ASM` and answer "**yes**" when asked if the old file is to be overwritten.

5. Run Code Warrior and select "**previous project**" from the list.

6. Click on the name of your project. The main edit screen will appear.

# Running your code on hardware

1. Click on "**main.asm**" to open the file.

2. Click on "**make**" to assemble the file. If the file assembles correctly

3. Click "**debug**" and follow the series of questions that follow. Some steps will take several seconds, so be patient!

4. Finally click on the "run" icon to run the programme.

Good luck, and do not hesitate to ask for help if needed.
