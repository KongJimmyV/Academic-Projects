#include <stdio.h>
#include <altera_avalon_pio_regs.h>
#include <system.h>

// Use this value BUFFER_SIZE when declaring your buffer array
// and checking for wrap-around on your ring buffer index.
#define BUFFER_SIZE 10 //declaring the buffer size here always the to be changed in one place.

// lookup[] represents one 8-bit 7segment display.
const char lookup[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};


// This function is implemented below, be sure to read the comments
// on how to use it!
void separate_number(int num, int *array);


int main()
{
	// Setup your variables and arrays here.
	// Make sure to initialize your buffer index to zero!
	// Make sure to initialize all the elements of the buffer to zero!
	int i;							// counter
	int buttons;					// button value data
	int ring_buffer[BUFFER_SIZE];	// buffer
	int ring_buffer_index = 0;		// buffer index selector
	int data;						// data
	int digits[4];					// digits
	int switches;					// switch value data
	int average;
	int sum;
	int display;

	// Initialize the buffer to 0
	for(i = 0; i < BUFFER_SIZE; i++)
		ring_buffer[i] = 0;

	while(1)
	{
		// Wait for a pushbutton to be pressed
		do
		{
			buttons = IORD_ALTERA_AVALON_PIO_DATA(PUSHBUTTONS_BASE);
		} while(buttons == 0);

		// Wait for pushbutton to be released
		do
		{
			buttons = IORD_ALTERA_AVALON_PIO_DATA(PUSHBUTTONS_BASE);
		} while(buttons != 0);


		// Calculate your averages and display the results on the seven-segment display
		switches = IORD_ALTERA_AVALON_PIO_DATA(SLIDER_SWITCHES_BASE);
		data = switches;

		ring_buffer[ring_buffer_index] = data; // Set the current position in the array equal to the data
		ring_buffer_index++; // Increment buffer_index by 1

		if (ring_buffer_index == BUFFER_SIZE)
			ring_buffer_index = 0;

		// Calculate the sum of the array
		sum = 0;
		for(i = 0; i < BUFFER_SIZE; i++)
		{
			sum = sum + ring_buffer[i];
		}

		// average...
		average = sum / BUFFER_SIZE;

		separate_number(average, digits);

		// Lookup the digits in the lookup table.
		digits[0] = lookup[digits[0]];
		digits[1] = lookup[digits[1]];
		digits[2] = lookup[digits[2]];
		digits[3] = lookup[digits[3]];
		// Shift the digits the correct amount
		digits[0] = digits[0] << 24;
		digits[1] = digits[1] << 16;
		digits[2] = digits[2] << 8;

		// Or them all together, a loop could be used:
		display = 0; // start with zero
		for(i = 0; i < 4; i++)
		{
			display = display | digits[i];
		}

		IOWR_ALTERA_AVALON_PIO_DATA(HEX3_HEX0_BASE,display);
	}

return 0;
}




/* This function takes as parameters two things:
 *
 * num: A number from 0 to 9999 to separate
 * array: An array of four integers, which will be updated
 *   to contain the four digits of num. For ex:
 *
 * Given an array and variable declared as so:
 *
 * int digits[4];
 * int val = 5621;
 *
 * separate_number(val,digits);
 *
 * After calling the function, the elements of the array 'digits' will have these values:
 * digits[0] == 5
 * digits[1] == 6
 * digits[2] == 2
 * digits[3] == 1
 *
 */
void separate_number(int num, int *array)
{
	int divisor = 1000;
	int i;

	if (num < 0) num = 0;
	if (num > 9999) num = 9999;

	for(i = 0; i < 4; i++)
	{
		array[i] 	= num / divisor;
		num 		= num - (divisor * array[i]);
		divisor 	= divisor / 10;
	}

}

