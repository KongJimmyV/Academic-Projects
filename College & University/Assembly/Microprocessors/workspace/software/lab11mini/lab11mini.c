#include <stdio.h>
#include <altera_avalon_pio_regs.h>
#include <system.h>
#include <stdlib.h>

int main()
{
	// Declare your variables here
	int buttons 		= 0;
	int switches 		= 0;
	int current_floor 	= 1;
	int next_floor 		= 0;

	/*
	IORD_ALTERA_AVALON_PIO_DATA (PUSHBUTTONS_BASE);
	IORD_ALTERA_AVALON_PIO_DATA (SLIDER_SWITCHES_BASE);
	IORD_ALTERA_AVALON_PIO_DATA (RED_LEDS_BASE);
	IOWR_ALTERA_AVALON_PIO_DATA (PUSHBUTTONS_BASE, x);
	IOWR_ALTERA_AVALON_PIO_DATA (SLIDER_SWITCHES_BASE, x);
	IOWR_ALTERA_AVALON_PIO_DATA (RED_LEDS_BASE, x);
	*/

	while(1)
	{
		/*** main loop ***/
		//////////////////////////
		// wait for BUTTON PRESS
		do {
			// update SWITCHES and BUTTONS
			switches = IORD_ALTERA_AVALON_PIO_DATA (SLIDER_SWITCHES_BASE);
			buttons = IORD_ALTERA_AVALON_PIO_DATA (PUSHBUTTONS_BASE);
		} while (buttons == 0);

		/*** Set destination. ***/
		//////////////////////////
		// Floor 1
		if (buttons & 1)
		{
			next_floor = 1;
		}
		//////////////////////////
		// Floor 2
		else if	(buttons & 2)
		{
			next_floor = 2;
		}
		//////////////////////////
		// Floor 3
		else if	(buttons & 4)
		{
			next_floor = 3;
		}
		//////////////////////////
		// Floor 4
		else if	(buttons & 8)
		{
			next_floor = 4;
		}
		//////////////////////////
		// Floor ERROR
		else
		{
			printf ("\nA FATAL ERROR HAS OCCURED.  THE NEXT FLOOR IS OUT OF RANGE.\n");
			exit(0);
		}

		//////////////////////////
		// Display
		printf ("\n---------------\n"
			"Current Floor:\t %d\n"
			"Next Floor:\t %d\n"
			"Message:\t \"Waiting to reach destination...\"\n", current_floor, next_floor);

		// Wait here until next floor is reached.
		do {
			// update SWITCHES and BUTTONS
			switches = IORD_ALTERA_AVALON_PIO_DATA (SLIDER_SWITCHES_BASE);
			buttons = IORD_ALTERA_AVALON_PIO_DATA (PUSHBUTTONS_BASE);
		} while (switches != next_floor);

		current_floor = next_floor;
		printf ("\n---------------\n"
			"*** DESTINATION REACHED ***\n"
			"Current Floor:\t %d\n"
			"Next Floor:\t Not Set\n"
			"Message:\t \"Elevator not in use.\"\n" , current_floor);

		//////////////////////////
		// Show Current Floor on RED_LEDS.
		IOWR_ALTERA_AVALON_PIO_DATA (RED_LEDS_BASE, current_floor);

		//////////////////////////
		// wait for BUTTON RELEASE
		do {
			// update switches and buttons
			switches = IORD_ALTERA_AVALON_PIO_DATA (SLIDER_SWITCHES_BASE);
			buttons = IORD_ALTERA_AVALON_PIO_DATA (PUSHBUTTONS_BASE);
		} while (buttons != 0);
	}

	return 0;

}
