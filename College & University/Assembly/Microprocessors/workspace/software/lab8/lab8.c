#include <stdio.h>
#include <altera_avalon_pio_regs.h>
#include <system.h>

int calc(int z);
int factorial(int num);
int twoRaisedToPower(int pow);

int main()
{
  int x;
  int y;
  while(1)
  {
	  x = IORD_ALTERA_AVALON_PIO_DATA(SLIDER_SWITCHES_BASE);
	  y = calc(x);
	  printf("%d! plus 2 to the nth = %d\n",x,y);
	  if (y > 100)
	  {
		printf("y is larger than 100\n");
	  }
  }
  return 0; //This never runs
}

int calc(int z)
{
	int temp = factorial(z + 1) + twoRaisedToPower(2);
	z = 5000;
	printf("temp = %d\n", temp);
	return temp;
}

int factorial(int num)
{
	int fact = 1;
	int i;
	for(i = 2; i <= num; i = i + 1)
	{
		fact = fact * i;
	}
	return fact;
}

int twoRaisedToPower(int pow)
{
	return 1 << pow;
}
