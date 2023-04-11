/*
 * Lab 9 mini quiz							Name___________________________
*/

#include <stdio.h>

/* print Fahrenheit-Celsius table
	for fahr = 0, 20…,450;*/

int main( )
{
	int fahr, celsius;
	int lower, upper, step;

	lower = 0;
	upper = 450;
	step = 25;

	fahr = lower;
	while (fahr <= upper)
	{
		celsius = 5 * (fahr - 32) / 9;
		//celsius =  5/9*(fahr - 32);
		printf("%40.d\t%.d\n", fahr, celsius);
		fahr = fahr + step;
	}

	printf(" the temperature to bake pizza in Celsius is less than 450° and greater than 350°");

	return 0;
}

/*

Procedure:

1.	Before starting eclipse, predict what the output from the program will be on the back of this sheet.
2.	Start eclipse and begin a new blank project called lab 9 mini. Run the program.

3.	Does your prediction match? Instructors initials_________________.
4.	Try using the equation celsius =  5/9*(fahr – 32);   What is the result? What could be the reason?
5.	Modify the program so that the results are right-justified.
6.	Modify the program to use floating point numbers.
7.	Add a print statement to print “ the temperature to bake pizza in Celsius is” at the proper temperature. (hint it’s less than 450 and greater than 350)

*/
