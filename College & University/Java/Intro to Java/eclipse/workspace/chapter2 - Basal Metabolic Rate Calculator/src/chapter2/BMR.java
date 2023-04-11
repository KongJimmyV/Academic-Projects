package chapter2;

import java.text.DecimalFormat;
import java.util.Scanner;
import javax.swing.JOptionPane;

/*************************************************************************
 * File Name:		BMR.java
 * Created by: 		Jimmy Vang
 * Date Started:	9/15/2016
 * Date Finished: 	9/21/2016
 * ***********************************************************************
 * The Harris-Benedict equation estimates the number of calories your body needs to maintain your weight if you do no exercise.
 * This .java file will calculate a person's approximate basal metabolic rate, or BMR.
 * It will also calculate approximately how many cookies that person should consume to meet his/her BMR.
 * 
 * I made two separate programs on the .java file and tested them both out.
 * It was a test to see if I could make two programs work in one .java file.
 * 
 * Using the Methods and by calling them, I was able to make these two programs:
 * 		PROGRAM 1 uses "Console" or "System.out.print()"	found on LINE 111
 * 		PROGRAM 2 uses "JOptionPane"						found on LINE 200
 * 
 * By default, PROGRAM 2 is selected to run unless changed.
 * 
 * When both programs were tested, they ran great and did not return any crash errors.
 * I even got the programs to not crash when an error was encountered.
 * 
 * ***********************************************************************
*/



//The class file starts here

//========================================================================
public class BMR {
	
	// Scanner (for System.out.print)
	private static Scanner kb;
	
	// Constants
	private static final String TITLE 							// Title for program
		= "Basal Metabolic Rate (BMR) Calculator";				// 
	
	private static final double CALORIES_CHOCOLATE_BAR = 230;	// Amount of calories for a chocolate bar

//========================================================================
// Start here and choose a program to run. ===========================
//========================================================================
	public static void main(String[] args) {
		
	/* *********************************************************
	* ****	This section allows users to pick a program.	****
	* **** 		PROGRAM 1 (Console or System.out.print)		****		found on LINE 111
	* **** 		PROGRAM 2 (JOptionPane)						****		found on LINE 200
	* **********************************************************/
		
		// By default, PROGRAM 2 is selected to run unless changed by USER
		
		// Create private constants for PROGRAMS
		final String PROGRAM_1 = "Console (System.out.print)  ***OLD***";
		final String PROGRAM_2 = "JOptionPane (Dialog Boxes)";
		
		// Initiate choices for Dialog Box.
		String inputString = null;
		String[] choices = { PROGRAM_1, 
							PROGRAM_2, };
		
		while (inputString == null) {
			// Bring up Dialog Box and show array of choices.
		    inputString = (String) JOptionPane.showInputDialog(null, 	//Dialog Box
		    		
		    	"Choose a BMR calculator program to run...",			//Message
		        "BMR.java", 											//Title
		        
		        JOptionPane.QUESTION_MESSAGE, null,					// Use default icon
		        													// 
		        													// 
		        
		        choices, 								// Array of choices
		        choices[1]); 							// Initial choice (PROGRAM 2 is selected)
		    
			// Check if user hits cancel or X.
		    if (inputString == null) {
		    	// If user hits cancel or X, then confirm if they are closing the program.
		    	confirmQuit();
			}
			    
		}
	    // Print Selection to console.
	    System.out.println(inputString);
		
	    // Run selected program by calling methods
	    switch (inputString) {
	    	case PROGRAM_1:
	    		console_BMR();		// Use Console (System.out.print)
	    		break;
	    	case PROGRAM_2:
	    		jOptionPane_BMR();	// Use JOptionPane
	    		break;
	    	default:
	    		System.out.println("This error should not pop up.");
	    		System.out.println("***END***");	// Informs user that program has shutdown
	        	System.exit(0);	//SHUT DOWN PROGRAM
	    }
		
	}
	
//========================================================================
// (PROGRAM 1) ===========================================================
//========================================================================	
	public static void console_BMR()	// Console or System.out.print 
	{
		
	// Define all private variables
		double numChocolateBarsF = 0.00;	// Number of chocolate bars (female)
		double numChocolateBarsM = 0.00;	// Number of chocolate bars (male)
		double bmrF = 0.00;					// BMR (Female) 	in calories
		double bmrM = 0.00;					// BMR (Male) 		in calories
		//double bmr = 0.00;				// BMR (No Gender) 	in calories		
		double weight = 0.00;				// weight in pounds, lbs
		double height = 0.00;				// height in inches
		int age = 0;						// age in years
		
	// Lets the user know what program is running.
		System.out.println							//print
				("Created by:	Jimmy Vang\n"		//name
				+ "Date:		9/21/2016\n"		//date
				+ "Title:		" + TITLE);			//title
		
		System.out.print("-----------------------------------------------------");		// Print Lines.
		System.out.println("-----------------------------------------------------");
		
		System.out.println("Hi and welcome.");		//greeting
		
		System.out.print("-----------------------------------------------------");		// Print Lines.
		System.out.println("-----------------------------------------------------");
		
		//Explain BMR
		System.out.println("This program is able to calculate your basal metabolic rate, or BMR. "
				+ "\nWhat is BMR? BMR estimates the number of calories your body needs a day to maintain your weight if you do no exercise.");
		
		System.out.print("-----------------------------------------------------");		// Print Lines.
		System.out.println("-----------------------------------------------------");
		
		// Defines "kb" as text scanner as input with system.in.
		kb = new Scanner(System.in);
		
	// Ask user to enter information.
		// Enter AGE.
		System.out.println("Please type your age.");
			while (!kb.hasNextInt()) kb.next();	// Loop until value is an integer
			age = kb.nextInt();
		
		// Enter WEIGHT.
		System.out.println("Please type your weight in pounds. (Pounds, lb(s))");
			while (!kb.hasNextInt()) kb.next();	// Loop until value is an integer
			weight = kb.nextInt();
		
		// Enter HEIGHT.
		System.out.println("Please type your height in inches. (Inches, in)");
			while (!kb.hasNextInt()) kb.next();	// Loop until value is an integer
			height = kb.nextInt();
		
		System.out.print("-----------------------------------------------------");		// Print Lines.
		System.out.println("-----------------------------------------------------");
		
	// Print user-typed information.
		System.out.println("Age: " + age + " year(s)");				// Print age
		System.out.println("Weight: " + weight + " lb(s)");			// Print weight
		System.out.println("Height: " + height + " in");			// Print height
		
		System.out.print("-----------------------------------------------------");		// Print Lines.
		System.out.println("-----------------------------------------------------");

	// Print BMR information.
		DecimalFormat df = new DecimalFormat("#0.00");			// DecimalFormat: allow format to 2 decimals
		
		bmrF = 655 + (4.3 * weight) + (4.7 * height) - (4.7 * age);			// Calculate female BMR
		bmrM = 66 + (6.3 * weight) + (12.9 * height) - (6.8 * age);			// Calculate male BMR
		System.out.println("Your female BMR is: " + df.format(bmrF));		// Print female BMR
		System.out.println("Your male BMR is: " + df.format(bmrM));			// Print male BMR
		
	// Calculate how much chocolate bars it takes to satisfy BMR. 
	// Then print cookie information.
		numChocolateBarsF = bmrF / CALORIES_CHOCOLATE_BAR;			// Calculate num of chocolate bars for female
		numChocolateBarsM = bmrM / CALORIES_CHOCOLATE_BAR;			// Calculate num of chocolate bars for male
		
		System.out.println("You should eat " + df.format(numChocolateBarsF)
		+ " chocolate bars a day if you are a female to maintain your current weight.");	// Print num of chocolate bars for female
		System.out.println("You should eat " + df.format(numChocolateBarsM)
		+ " chocolate bars a day if you are a male to maintain your current weight.");		// Print num of chocolate bars for male
		
		System.out.println("***END***");	// Informs user that program has shutdown
		System.exit(0);	//SHUT DOWN PROGRAM
	}
	
//========================================================================
// (PROGRAM 2) ===========================================================
//========================================================================
	public static void jOptionPane_BMR()	// JOptionPane
	{
		
	// Define all private variables
		double numChocolateBarsF = 0.00;	// Number of chocolate bars (female)
		double numChocolateBarsM = 0.00;	// Number of chocolate bars (male)
		double bmrF = 0.00;					// BMR (Female) 	in calories
		double bmrM = 0.00;					// BMR (Male) 		in calories
		//double bmr = 0.00;				// BMR (No Gender) 	in calories		
		double weight = 0.00;				// weight in pounds, lbs
		double height = 0.00;				// height in inches
		int age = 0;						// age in years
		
	// Lets the user know what program is running with Dialog Box.
		boolean bool = false;	// set boolean variable
		String[] buttons = { "Calculate BMR", "Quit" };	// set custom buttons
		
	// PROGRAM 2's main Dialog Box
		while (bool == false) {		// Will not continue until "Calculate BMR" is clicked.
			int reply = JOptionPane.showOptionDialog(null, 
					//Message
						  "*** Created by:\t Jimmy Vang\n"
						+ "*** Date:\t 9/21/2016\n"
						//+ "*** Title:\t " + TITLE + "\n"
						
						+ "\nHi and welcome.\n"
						+ "This program is able to calculate your basal metabolic rate, or BMR.\n"
						
						+ "\nWhat is BMR? \n"
						+ "BMR estimates the number of calories your body needs a day to maintain your weight if you do no exercise.\n"
						
						+ "\nClick \"Calculate BMR\" to continue.", 
					//End Message
					
					//Title
					TITLE, 				
					0, JOptionPane.INFORMATION_MESSAGE, null, 
					buttons, 			//Array of button choices
					buttons[0]);		//Initial button choice
			
			//Check what user pressed on the dialog box
			if (reply == JOptionPane.NO_OPTION || reply == JOptionPane.CLOSED_OPTION)
			{	// if user clicks leave or X, ask user if they want to quit the program
				confirmQuit();
			}
			else 
			{	// if user clicks on the "Calculate BMR" button, continue on and ask user questions
				bool = true;
			}
		}
			
	// Ask user questions about their information.
		// Enter AGE.
		while (age == 0) {
			try {
				// Attempt to get age from dialog box
				String ageString = JOptionPane.showInputDialog(null, 
						"Please type your age.  (1 to 200)", 				//message
						TITLE, 												//title
						JOptionPane.QUESTION_MESSAGE);

				if (ageString == null) 
				{	// If user press cancel or X. Then confirm if user want to stop using the program.
					confirmQuit();
				}
				else
				{	// If everything works, then set age equal to user input.
					age = Integer.parseInt(ageString);
					
					if (age <= 0)
					{	// Check if user typed under 0 years
						JOptionPane.showMessageDialog(null, 
								"Value is 0 or less.",						//message
								"ERROR: Invalid Number [Out of Bounds]",	//title
								JOptionPane.ERROR_MESSAGE,
								null);
						age = 0;		// reset age value
					}
					else if (age > 200)
					{	// Check if user typed over 200 years
						JOptionPane.showMessageDialog(null, 
								"Value is higher than 200.",				//message
								"ERROR: Invalid Number [Out of Bounds]",	//title
								JOptionPane.ERROR_MESSAGE,
								null);
						age = 0;		// reset age value
					}
						
				}
				
			} catch (NumberFormatException e) {
				// Prevents user from entering Strings, letters or decimals.
				JOptionPane.showMessageDialog(null, 
					"Value is not an integer, or is out of bounds.",		//message
					"ERROR: Invalid Number [NumberFormatException]",		//title
					JOptionPane.ERROR_MESSAGE,
					null);
				
				age = 0;		// reset age value
				
			}
		}
		
		// Enter WEIGHT.
		while (weight == 0) {
			try {
				// Attempt to get weight from dialog box
				String weightString = JOptionPane.showInputDialog(null, 
						"Please type your weight in pounds.  (1 to 500)", 		//message
						TITLE, 													//title
						JOptionPane.QUESTION_MESSAGE);
				
				if (weightString == null) 
				{	// If user press cancel or X. Then confirm if user wants to stop using the program.
					confirmQuit();
				}
				else 
				{	// If everything works, then set weight equal to user input.
					weight = Double.parseDouble(weightString);
					
					if (weight < 1)
					{	// Check if user typed under 1 pound
						JOptionPane.showMessageDialog(null, 
								"Value is less than 1.",						//message
								"ERROR: Invalid Number [Out of Bounds]",		//title
								JOptionPane.ERROR_MESSAGE,
								null);
						weight = 0;		// reset weight value
					}
					else if (weight > 500)
					{	// Check if user typed over 500 pounds
						JOptionPane.showMessageDialog(null, 
								"Value is higher than 500.",					//message
								"ERROR: Invalid Number [Out of Bounds]",		//title
								JOptionPane.ERROR_MESSAGE,
								null);
						weight = 0;		// reset weight value
					}
				}
				
			} catch (NumberFormatException e) {
				// Prevents user from entering Strings or letters.
				JOptionPane.showMessageDialog(null, 
						"Value is not a number or decimal, or is out of bounds.",	//message
				    "ERROR: Invalid Number [NumberFormatException]",				//title
				    JOptionPane.ERROR_MESSAGE,
				    null);
				
				weight = 0; 	// reset weight value
				
			}
		}
		
		// Enter HEIGHT.
		while (height == 0) {
			try {
				// Attempt to get height from dialog box
				String heightString = JOptionPane.showInputDialog(null, 
						"Please type your height in inches.  (1 to 200)", 		//message
						TITLE, 													//title
						JOptionPane.QUESTION_MESSAGE);
				
				if (heightString == null) 
				{	// If user press cancel or X. Then confirm if user want to stop using the program.
					confirmQuit();
				}
				else 
				{	// If everything works, then set height equal to user input.
					height = Double.parseDouble(heightString);
					
					if (height < 1)
					{	// Check if user typed under 1 inch
						JOptionPane.showMessageDialog(null, 
								"Value is less than 1.",						//message
								"ERROR: Invalid Number [Out of Bounds]",		//title
								JOptionPane.ERROR_MESSAGE,
								null);
						height = 0;		// reset height value
					}
					else if (height > 200)
					{	// Check if user typed over 200 inches
						JOptionPane.showMessageDialog(null, 
								"Value is higher than 200.",					//message
								"ERROR: Invalid Number [Out of Bounds]",		//title
								JOptionPane.ERROR_MESSAGE,
								null);
						height = 0;		// reset height value
					}
				}
				
			} catch (NumberFormatException e) {
				// Prevents user from entering Strings or letters.
				JOptionPane.showMessageDialog(null, 
						"Value is not a number or decimal, or is out of bounds.",	//message
				    "ERROR: Invalid Number [NumberFormatException]",				//title
				    JOptionPane.ERROR_MESSAGE,
				    null);
				
				height = 0;		// reset height value
			}
		}
		
	// Calculate BMR and set DecimalFormat.
		DecimalFormat df = new DecimalFormat("#0.00"); 		// DecimalFormat: allow format to 2 decimals
		
		bmrF = 655 + (4.3 * weight) + (4.7 * height) - (4.7 * age);		// Calculate female BMR
		bmrM = 66 + (6.3 * weight) + (12.9 * height) - (6.8 * age);		// Calculate male BMR
		
	// Calculate how much chocolate bars it takes to satisfy BMR.
		numChocolateBarsF = bmrF / CALORIES_CHOCOLATE_BAR;		// Calculate
		numChocolateBarsM = bmrM / CALORIES_CHOCOLATE_BAR;		// Calculate
		
	// Display Message about BMR and Cookies
		JOptionPane.showMessageDialog(null, 
			//Message
				"Age: " + age + " year(s)"						//show age
			+ 	"\nWeight: " + weight + " lb(s)"				//show weight
			+ 	"\nHeight: " + height + " in"					//show height
			+	"\n"
			
			+ 	"\nYour female BMR is: " + df.format(bmrF)		//show female BMR
			+ 	"\nYour male BMR is: " + df.format(bmrM) 		//show male BMR
			+ 	"\n"
			
			+ 	"\nYou should eat " + df.format(numChocolateBarsF) + 
					" chocolate bars a day if you are a female to maintain your current weight."	//show num of chocolate bars for females
			+ 	"\nYou should eat " + df.format(numChocolateBarsM) + 
					" chocolate bars a day if you are a male to maintain your current weight.",		//show num of chocolate bars for males
			//End of message
					
			TITLE,								//Title
			JOptionPane.INFORMATION_MESSAGE);	//Type of dialog box
	
	// Ask to restart program
		int reply = JOptionPane.showConfirmDialog(null, 
				"Thank you for using this program.\n"		//message
				+ "\nRestart BMR calculator???", 					
				TITLE, 										//title
				JOptionPane.YES_NO_OPTION);
		
        if (reply == JOptionPane.YES_OPTION) {
        	jOptionPane_BMR();	//Rerun JOptionPane BMR Program
        }
        else {
        	JOptionPane.showMessageDialog(null, "Shutting down program... Press OK.");
        	System.out.println("***END***");	// Informs user that program has shutdown
        	System.exit(0);	//SHUT DOWN PROGRAM
        }
		
	}
	
	
	// This method checks if the person wants to close the BMR Calculator (Dialog Box).
	public static void confirmQuit()
	{
		// Ask user if they want to leave.
		 int reply = JOptionPane.showConfirmDialog(null, "Are you sure you want to leave?", TITLE, JOptionPane.YES_NO_OPTION);
	        if (reply == JOptionPane.YES_OPTION) {
	        	JOptionPane.showMessageDialog(null, "Shutting down program... Press OK.");
	        	System.out.println("***END***");	// Informs user that program has shutdown
	        	System.exit(0);	//SHUT DOWN PROGRAM
	        }
	        else {
	        	//JOptionPane.showMessageDialog(null, "HELLO");
	        }
	}
	
//========================================================================
	
}	// The class file ends here.





