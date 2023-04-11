import java.util.Scanner;

/**
 * 
 * Title: 			DoDivision
 * Description: 	This is a class file that does division and will throw Exceptions.
 * Date: 			2/13/2017
 * 
 * @author Jimmy Vang
 *
 */
public class DoDivison {

	// Instance Variables
	private int numerator;
	private int denominator;
	private double quotient;
	
	// Other
	private Scanner keyboard;
	
	// MAIN
	public static void main(String[] args) {
		
		// Title/Welcome
		System.out.println("*** Welcome ***\n"
				+ "This program will do divsion!\n"
				+ "------------------------------");
		
		// Do Division
		DoDivison doIt = new DoDivison();
		
		try {
			doIt.doNormalCase();
		}
		catch (DivideByZeroException e) {
			// Print exception message and give user a second chance.
			System.out.println(e.getMessage()
					+ "\n");
			doIt.giveSecondChance();
		}
		catch (NumberFormatException e) {
			// Print exception message and give user a second chance.
			System.out.println("EXCEPTION: A STRING or DOUBLE was entered instead of an INTEGER. "
					+ "\n" + e 
					+ "\n");
			
			// This try-catch block is needed otherwise a CRASH will occur.
			try {
				// Attempt to give a second chance.
				doIt.giveSecondChance();
			}
			catch (NumberFormatException e2) {
				// 2 failed attempts have occurred, end the program.
				System.out.println("EXCEPTION: A STRING or DOUBLE was entered instead of an INTEGER. "
						+ "\n" + e 
						+ "\n");
				System.err.println("Two failed attempts! The program will now end.");
				System.exit(0);
			}
		}
		catch (Exception e) {
			System.out.println("UNKNOWN EXCEPTION: " + e.getMessage()
					+ "\n");
			System.exit(0);
		}
		
		// Alert user that the program has ended.
		System.out.println("*** End of program. ***");
	}
	
	/**
	 * Ask user to input a numerator and denominator for division.
	 */
	public void doNormalCase() throws DivideByZeroException, NumberFormatException{
		keyboard = new Scanner(System.in);
		
		System.out.println("Enter numerator:");
		String strTemp = keyboard.nextLine();
		numerator = Integer.parseInt(strTemp);
		
		System.out.println("Enter denominator:");
		strTemp = keyboard.nextLine();
		denominator = Integer.parseInt(strTemp);
		
		if(denominator == 0) {
			throw new DivideByZeroException("EXCEPTION: Cannot Divide by Zero!");
		}
		
		quotient = numerator / (double)denominator;
		System.out.println(numerator + "/" + denominator + " = " + quotient);
		
	}
	
	/**
	 * Give user a second chance at dividing.
	 */
	public void giveSecondChance() throws NumberFormatException {
		System.out.println("Try again:\n"
				+ "Enter numerator:");
		String strTemp = keyboard.nextLine();
		numerator = Integer.parseInt(strTemp);
		
		System.out.println("Enter denominator:\n"
				+ "Be sure the denominator is not zero.");
		strTemp = keyboard.nextLine();
		denominator = Integer.parseInt(strTemp);
		
		if (denominator == 0) {
			System.err.println("I cannot do division by zero.\n"
					+ "The program will now end.");
			System.exit(0);
		}

		quotient = ((double) numerator) / denominator;
		System.out.println(numerator + "/" + denominator + " = " + quotient);
	}
}
