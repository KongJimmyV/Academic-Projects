package chapter1;

import java.util.Scanner;

//------------------------------------------------------------------------------------------------------
//	File Name:		TempConvert.java
//	Created by:		Jimmy Vang
//	Date:			9/8/2016
//------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------//
//---- This class file's purpose is to convert a temperature from Fahrenheit to Celsius. ----//
//-------------------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------------------------



public class TempConvert {
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
// Field variables.
	static double fahrenheit = 0;	//temperature in F
	static double celsius = 0;		//temperature in C
	private static Scanner s;		//text scanner variable
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------

	
	// Start of the main program.
	public static void main(String[] args) {
	//------------------------------------------------------------------------------------------------------
		// Lets the user know what program is running.
		System.out.println("-------------------------------------------------------------------------");	
		System.out.println("-----------------------|[ Converting F° to C° ]|-------------------------");
		System.out.println("-------------------------------------------------------------------------");
		System.out.println("Hi and welcome.");
		System.out.println("I will convert a temperature from Fahrenheit (F°) to Celsius (C°) for you.");
	//------------------------------------------------------------------------------------------------------
		// Defines "s" for the text scanner
		s = new Scanner(System.in);
		
		// Prompt user to enter a Fahrenheit temperature value.
		System.out.println("");
		System.out.println("-------------------------------------------------------------------------");
		System.out.println("Please enter a Fahrenheit (F°) temperature that to convert from...");
		
		// Waits for user to type in temperature value.
		fahrenheit = s.nextInt();
	//------------------------------------------------------------------------------------------------------
		// (Call line 61) Converts from Fahrenheit to Celsius.
		ConvertFtoC();
	//------------------------------------------------------------------------------------------------------
		// Prints the temperature value in Fahrenheit.
		System.out.println("");
		System.out.println("-------------------------------------------------------------------------");
		System.out.println("The converted temperature to Celsius (C°) is...");
		System.out.println(celsius + " C°");
		System.out.println("");
	//------------------------------------------------------------------------------------------------------
	}
	
	
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
	public static void ConvertFtoC()
	{
		// Calculates and converts temperature from Fahrenheit to Celsius.
		celsius = (5.0/9) * (fahrenheit - 32);
		return;
	}
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
	
	
	// End of class file.
}






