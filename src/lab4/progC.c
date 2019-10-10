/* 

 This file declares the variables and constants needed for our program.
 It included the header file: M68DEMO908AW60.h which contains
 the declarations of the various peripherals of the chip.

*/

#include <MC9S08AW60.h>

typedef unsigned char muint8; //char is an 8 bit variable type

// Define Values for the LED's when ON and OFF

#define ON    1
#define OFF   0

// Define values for the Switches in PORT A: When Up (OFF) and Down (ON) 

#define UP    1
#define DOWN  0


// It is also a good idea to declare proper names for our LEDs; rather than calling them by Port Names (PORT F)

#define LED1 PTFD_PTFD0
#define LED2 PTFD_PTFD1
#define LED3 PTFD_PTFD2

//1.////////////////////////////////////////////////////////
#define LED4 PTFD_PTFD3//students to declare LED 4 and 5
#define LED5 PTFD_PTFD4
////////////////////////////////////////////////////////////

 
//

//Lets also define proper Names for the Switches in PORT A to control the LEDs

#define SWT1 PTAD_PTAD0
#define SWT2 PTAD_PTAD1

//2./////////////////////////////////////////////////////////////
#define SWT3 PTAD_PTAD2//student to declare switch 3 and 4
#define SWT4 PTAD_PTAD3
#define SWT5 PTAD_PTAD4
///////////////////////////////////////////////////////////////

//define a delay function
void short_delay(muint8 value) 
{      
   int y,t;
   for(y=0;y<=value; y++) {
        for(t=0;t<=20; t++) {
        }
   } 
}


#define STUDENT_COUNT  7
muint8 student_number_1[STUDENT_COUNT] = {0, 6, 2, 3, 4, 6, 3};   //input one student number
muint8 student_number_2[STUDENT_COUNT] = {1, 9, 7, 3, 1, 6, 1};   //input another studetn number

muint8 total_answer;//variable to hold the final answer
int counter1,counter2;//variable used in incrementing in the main loop

///COUNTER PROGRAM TO DISPLAY THE SUMMATION OF STUDENT NUMBER ON LED///

#include <hidef.h> /* for EnableInterrupts macro */

#include "derivative.h" /* include peripheral declarations */

int i;
void main (void) {  
        SOPT   = 0x00;//System option register..this line of code help to disable the watch dog		
                              // Disable COP = computer operating properly register
        ICGC1 = 0x74;//set up the clock   

	//1.    Port Initialization
	
	PTADD = 0; // Set Port A as Input for the SWITCHES (Data Direction Register)
	
	PTAPE = 0x0F; // Pull-Up on Lower 4 Bits i.e. Set switches to high by default via pull resistor
   
	PTDPE = 0xFF;  // Enable Port D pullups for push button switch interrupt  
        
        // Students to use PORT D vto display the summation of their student number      

 	// Initialize PORT F as Output for LEDs
		 
	PTFDD = 0xFF;	 // set port F as outputs for LED operation (8 bit) 
	PTFPE = 0x0F; 	//  PuLL-Up on Lower 4 Bits i.e. Set LEDs to high by default via pull resistor
	
	    
        for(;;) {  /* loop forever */
              
                //student number addition code starts here //
			   
			 
                counter1 = 0;     //initialize counter to zero at the beginning	
			        
                total_answer = 0; //initialize total answer to zero at the beginning
			        
                while (counter1 < STUDENT_COUNT)
                {
			                		          
                        total_answer = total_answer + student_number_1[counter1++];  // add the first student number to total answer and 
                                                                                     // increment counter by 1
        	}
			           
                PTFD = total_answer;//send the final answer to the LEDs				
			 
                //student number addition code ends here//
        } 
}




