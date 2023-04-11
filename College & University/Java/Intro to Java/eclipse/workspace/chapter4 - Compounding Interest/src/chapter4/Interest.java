package chapter4;

import java.text.DecimalFormat;

import javax.swing.JOptionPane;

/*************************************************************************
 * File Name: 		Interest.java 
 * Created by: 		Jimmy Vang 
 * Date Started: 	10/4/2016 
 * Date Finished: 	10/6/2016
 * *********************************************************************** 
 * Description:
 * 		This program will calculate a compound interest.
 * ***********************************************************************
 */

public class Interest {
	
	///////////////////
	// Start Program //
	///////////////////
	public static void main(String[] args) {
		
		while (true) {
			//////////////////////////
			// Initialize Variables //
			//////////////////////////
			
			// I used an array for yearly, monthly, and daily.
			// ARRAY							original,	yearly,		monthly,	daily.
			double amountFinal[] 			= {	0,			1,			2,			3};		// new amount of investment
			double amountStart[] 			= {	0,			1,			2,			3};		// current amount of investment
			
			//double interest					= 1;	// interest
			double annualInterestRate 		= 1;	// interest rate % (decimal)
			double years					= 1;	// number of years money is invested
			
			// set up JOptionPane
				String TITLE = "Simple Compound Interest Calculator";
				String MESSAGE = "";
				
				// showInputDialog
				int optDialog = 0;
				
				// showInputDialog
				String inputDialog = "";
			
			////////////////////////
			//  Welcome the User  //
			////////////////////////
			while (true) {
				// Initialize option dialog box
				MESSAGE 	= "Hi and welcome.\n"
						+ "This simple calculator gives a compound interest for a bank account.\n\n"
						+ "Click \"Start\" to calculate a compound interest.\n"
						+ "Click \"Quit\" to exit the program.";
				String Choices[] = { "Start", "Quit" };
	
				// Bring up dialog box
				optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
						JOptionPane.PLAIN_MESSAGE, null, Choices, Choices[0]);
	
				// If user presses OK, start the program.
				if (optDialog == JOptionPane.YES_OPTION) {
					break;
				}
				// If user clicks cancel or X, quit the program.
				else {
					System.exit(0);
				}
			}
				
			///////////////////////////////
			//  Ask for Starting Amount  //
			///////////////////////////////
			while (true) {
				try {
					// Initialize input dialog box
					MESSAGE 	= "How much money is currently in the bank account?\n\n"
							+ "Starting Amount $: ";
					
					// Show dialog box
					inputDialog = JOptionPane.showInputDialog(null, MESSAGE, TITLE, JOptionPane.QUESTION_MESSAGE);
					
					// If user presses OK, parse the String as an Integer.
					if (inputDialog != null) {
						// set all compound types to equal the user input
						for (int compoundType = 0; compoundType <= 3; compoundType++) {
							amountStart[compoundType] = Double.parseDouble(inputDialog);
							amountFinal[compoundType] = Double.parseDouble(inputDialog);
						}
						
						break;
					}
					// If user clicks cancel or X, quit the program.
					else {
						System.exit(0);
					}
				} catch (NumberFormatException e) {
					// Prevents user from entering Strings, letters or decimals.
					JOptionPane.showMessageDialog(null, "Please retype in a starting amount.",
							"ERROR: Invalid Number [NumberFormatException]", JOptionPane.ERROR_MESSAGE, null);
				}
			}
		
			/////////////////////////////
			//  Ask for Interest Rate  //
			/////////////////////////////
			while (true) {
				try {
					// Initialize input dialog box
					MESSAGE 	= "What is the bank's interest rate?\n\n"
							+ "Annual Interest Rate %: ";
					
					// Show dialog box
					inputDialog = JOptionPane.showInputDialog(null, MESSAGE, TITLE, JOptionPane.QUESTION_MESSAGE);
					
					// If user presses OK, parse the String as an Integer.
					if (inputDialog != null) {
						annualInterestRate = Double.parseDouble(inputDialog) / 100;
						break;
					}
					// If user clicks cancel or X, quit the program.
					else {
						System.exit(0);
					}
				} catch (NumberFormatException e) {
					// Prevents user from entering Strings, letters or decimals.
					JOptionPane.showMessageDialog(null, "Please retype in a percentage rate.",
							"ERROR: Invalid Number [NumberFormatException]", JOptionPane.ERROR_MESSAGE, null);
				}
			}
				
			/////////////////////
			//  Ask for years  //
			/////////////////////
			while (true) {
				try {
					// Initialize input dialog box
					MESSAGE 	= "How many years will this money stay in the bank account?\n\n"
							+ "Years: ";
					
					// Show up dialog box
					inputDialog = JOptionPane.showInputDialog(null, MESSAGE, TITLE, JOptionPane.QUESTION_MESSAGE);
					
					// If user presses OK, parse the String as an Integer.
					if (inputDialog != null) {
						years = Double.parseDouble(inputDialog);
						break;
					}
					// If user clicks cancel or X, quit the program.
					else {
						System.exit(0);
					}
				} catch (NumberFormatException e) {
					// Prevents user from entering Strings, letters or decimals.
					JOptionPane.showMessageDialog(null, "Please retype a value in years.",
							"ERROR: Invalid Number [NumberFormatException]", JOptionPane.ERROR_MESSAGE, null);
				}
			}
			
			////////////////////////////
			//  Calculate New Amount  //
			////////////////////////////
				
			// create a format type for US dollars
			DecimalFormat USD = new DecimalFormat("\u00A4#0.00");
			
			// calculate for yearly, monthly, and daily compound interests.
			for (int i = 1; i <= (years); i++) {
				
				// set array for amounts
				final int YEARLY = 1;
				final int MONTLY = 2;
				final int DAILY = 3;
				
				// yearly
				for (int j = 1; j <= 1; j++) {
					amountStart[YEARLY] = amountFinal[YEARLY] * (annualInterestRate / 1);
					amountFinal[YEARLY] += amountStart[YEARLY] * 1;
				}
				// monthly
				for (int j = 1; j <= 12; j++) {
					amountStart[MONTLY] = amountFinal[MONTLY] * (annualInterestRate / 12);
					amountFinal[MONTLY] += amountStart[MONTLY];
				}
				// daily
				for (int j = 1; j <= 365; j++) {
					amountStart[DAILY] = amountFinal[DAILY] * (annualInterestRate / 365);
					amountFinal[DAILY] += amountStart[DAILY];
				}
			}
			
			//////////////////////////////
			//  Output the New Amounts  //
			//////////////////////////////
			while (true) {
				
				// set array for amounts
				final int ORIGINAL = 0;
				final int YEARLY = 1;
				final int MONTLY = 2;
				final int DAILY = 3;
				
				// create new formats for decimal places
				//DecimalFormat df1 = new DecimalFormat("#0.0");
				DecimalFormat df2 = new DecimalFormat("#0.00");
				
				// Initialize option dialog box
				MESSAGE 	= "The calculation is complete. Here are your results.\n\n"
						+ "***[Original Inputs]*** \n"
						+ "Starting Amount: " + USD.format(amountStart[ORIGINAL]) + "\n"
						+ "Annual Interest Rate: " + df2.format(annualInterestRate * 100) + "%\n"
						+ "Years: " + years + " yrs\n\n"
						+ "***[New/Future Amounts]***\n"
						+ "(Compounded Yearly):    -----    " 	+ USD.format(amountFinal[YEARLY]) + "\n"
						+ "(Compounded Monthly):    ---    " 	+ USD.format(amountFinal[MONTLY]) + "\n"
						+ "(Compounded Daily):    -------    " 	+ USD.format(amountFinal[DAILY]) + "\n\n"
						+ "Click \"Main Menu\" to return back to the main menu.\n"
						+ "Click \"Quit\" to exit the program.";
				String Choices[] = { "Main Menu", "Quit" };
				
				// Show dialog box
				optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
						JOptionPane.PLAIN_MESSAGE, null, Choices, Choices[0]);
	
				// If user presses OK, start the program.
				if (optDialog == JOptionPane.YES_OPTION) {
					break;
				}
				// If user clicks cancel or X, quit the program.
				else {
					System.exit(0);
				}
			}
		}
	}
	
//////////////////////
// End of Program //
//***************//
//             //
//        ////
//    ///
// //
///
//
	
}



