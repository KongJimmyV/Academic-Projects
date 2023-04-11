#include <stdio.h>
#include <altera_avalon_pio_regs.h>
#include <system.h>


int main()
{
	// Declare your variables here
	int buttons 	= 0;
	int switches 	= 0;
	int result 		= 0;
	int stored 		= 0;

	/*
	IORD_ALTERA_AVALON_PIO_DATA (PUSHBUTTONS_BASE);
	IORD_ALTERA_AVALON_PIO_DATA (SLIDER_SWITCHES_BASE);
	IORD_ALTERA_AVALON_PIO_DATA (RED_LEDS_BASE);
	IOWR_ALTERA_AVALON_PIO_DATA (PUSHBUTTONS_BASE, x);
	IOWR_ALTERA_AVALON_PIO_DATA (SLIDER_SWITCHES_BASE, x);
	IOWR_ALTERA_AVALON_PIO_DATA (RED_LEDS_BASE, x);
	*/

	// Wait for a BUTTON to be PRESSED.
	while(1)
	{
		/*** main loop ***/
		// read SWITCHES value
		switches = IORD_ALTERA_AVALON_PIO_DATA (SLIDER_SWITCHES_BASE);

		// wait for BUTTON PRESS
		do {
			// update SWITCHES and BUTTONS
			switches = IORD_ALTERA_AVALON_PIO_DATA (SLIDER_SWITCHES_BASE);
			buttons = IORD_ALTERA_AVALON_PIO_DATA (PUSHBUTTONS_BASE);
		} while (buttons == 0);

		/*** Use Bit-masking with powers of 2. ***/
		// Set STORAGE number to equal the slider SWITCHES value.
		if		(buttons & 1)
		{
			stored = switches;
			printf ("\n---------------\n"
					"STORED:	=  %d", stored);
		}
		// Add the value from the SWITCHES with the STORAGE value.
		else if	(buttons & 2)
		{
			result = stored + switches;
			// Update Console:
			printf ("\n---------------\n"
					"STORED:	   %d\n"
					"SWITCHES:	+  %d\n"
					"RESULT:	   %d", stored, switches, result);
		}
		// Logically AND the values of the SWITCHES with the STORAGE value.
		else if	(buttons & 4)
		{
			result = stored & switches;
			// Update Console:
			printf ("\n---------------\n"
					"STORED:	   %d\n"
					"SWITCHES:	&& %d\n"
					"RESULT:	   %d", stored, switches, result);
		}
		// Multiply the value of the SWITCHES with the STORAGE value.
		else if	(buttons & 8)
		{
			result = stored * switches;
			// Update Console:
			printf ("\n---------------\n"
					"\n"
					"STORED:	   %d\n"
					"SWITCHES:	*  %d\n"
					"RESULT:	   %d", stored, switches, result);
		}

		// Show RESULTS on RED_LEDS.
		IOWR_ALTERA_AVALON_PIO_DATA (RED_LEDS_BASE, result);
		//printf ("TOTAL RESULTS = result \"%d\" ", result);

		// wait for BUTTON RELEASE
		do {
			// update switches and buttons
			switches = IORD_ALTERA_AVALON_PIO_DATA (SLIDER_SWITCHES_BASE);
			buttons = IORD_ALTERA_AVALON_PIO_DATA (PUSHBUTTONS_BASE);
		} while (buttons != 0);
	}

	return 0;

}
