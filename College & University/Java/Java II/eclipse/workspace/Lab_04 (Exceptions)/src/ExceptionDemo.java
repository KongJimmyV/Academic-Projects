import java.util.Scanner;

/**
 * 
 * Title: 			ExceptionDemo
 * Description: 	This is the exception demo.
 * Date: 			2/13/2017
 * 
 * @author Jimmy Vang
 *
 */
public class ExceptionDemo {

	// Field and Instance variables.
	private static Scanner keyboard;

	public static void main(String[] args) {
		// Define Scanner
		keyboard = new Scanner(System.in);
		
		try {
		/****** Local Variables and Objects ******/
			int donutCount = 0;		// Amount of donuts
			int milkCount = 0;		// Amount of glasses of milk
			String strTemp = "";		// Temporary String
			
		/****** Title text/screen ******/
			System.out.println("*** Welcome to the Exception Demo! ***\n\n"
					+ "Here are some questions for you.\n"
					+ "----------------------------------------\n");
			
		/****** Ask User Questions ******/
			//////////*** Question #1 ***//////////
			// Ask user to enter an amount of donuts.
			System.out.println("QUESTION #1: Enter the number of donuts: ");
			
			// Check user input
			strTemp = keyboard.nextLine();			// Get string value of user input
			donutCount = Integer.parseInt(strTemp);	// Set donut count equal to user input.
			
			if(donutCount < 1) {
				// If the user enters less than 1 donut. Throw a new exception.
				throw new Exception("EXCEPTION: You have no donuts!");
			}
			
			//////////*** Question #2 ***//////////
			// Ask user to enter an amount of glasses of milk.
			System.out.println("QUESTION #2: Enter the number of glasses of milk: ");
			
			// Check user input
			strTemp = keyboard.nextLine();			// Get string value of user input
			milkCount = Integer.parseInt(strTemp);	// Set milk count equal to user input.
			
			if(milkCount < 1) {
				// If the user enters less than 1 glass of milk. Throw a new exception.
				throw new Exception("EXCEPTION: You have no milk!");
			}
			
		/****** Print Output (Amount of donuts for each glass of milk.) ******/
			double donutsPerGlass = donutCount / (double)milkCount;
			System.out.println(donutCount + " donuts.\n"
					+ milkCount + " glasses of milk.\n"
					+ "You have " + donutsPerGlass + " donuts for each glass of milk.");
			
		}
		catch (NumberFormatException e) {
			System.err.println("A STRING or DOUBLE was entered when an INTEGER was expected.\n" + e);
			//e.printStackTrace();
			
			System.err.println("\n*** PROGRAM ENDED ***");
			return;
		}
		catch (Exception e) {
			System.err.println(e.getMessage());
			//e.printStackTrace();
			
			System.err.println("\n*** PROGRAM ENDED ***");
			System.exit(0);
		}
		
		System.out.println("\n*** PROGRAM ENDED ***");
	}

}
