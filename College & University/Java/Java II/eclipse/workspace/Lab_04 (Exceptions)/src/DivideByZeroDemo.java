import java.util.Scanner;

/**
 * 
 * Title: 			DivideByZeroException
 * Description: 	This is a demo that can do division and will test Exceptions.
 * Date: 			2/13/2017
 * 
 * @author Jimmy Vang
 *
 */
public class DivideByZeroDemo {

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
				+ "This demo does divsion!\n"
				+ "------------------------------");
		
		// Do Division
		DivideByZeroDemo oneTime = new DivideByZeroDemo();
		oneTime.doIt();
		
		// Alert user that the program has ended.
		System.out.println("*** End of program. ***");
	}
	
	/**
	 * Ask user to input a numerator and denominator for division.
	 */
	public void doIt() {
		keyboard = new Scanner(System.in);
		
		try {
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
		catch (DivideByZeroException e) {
			// Print exception message and give user a second chance.
			System.out.println(e.getMessage()
					+ "\n");
			giveSecondChance();
		}
		catch (NumberFormatException e) {
			// Print exception message and give user a second chance.
			System.out.println("A STRING or DOUBLE was entered instead of an INTEGER. "
					+ "\n" + e 
					+ "\n");
			giveSecondChance();
		}
	}
	
	/**
	 * Give user a second chance at dividing.
	 */
	public void giveSecondChance() {
		try {
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
		catch (NumberFormatException e) {
			System.out.println("A STRING or DOUBLE was entered instead of an INTEGER. "
					+ "\n" + e 
					+ "\n");
			giveSecondChance();
		}
	}
}
