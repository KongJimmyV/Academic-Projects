package wtc.java01.vang;

import javax.swing.JOptionPane;
import wtc.java01.vang.Person;

////////////////////////////////////////////////////////////////////
/**
 * This class file demos the Person.java file.
 * <br>
 * <br>File Name:		PersonDemo.java
 * <br>Created by: 		Jimmy Vang
 * <br>Date Created:	Oct 20, 2016 (10/20/2016)
 * <br>Date Modified: 	Nov 23, 2016 (11/23/2016)
 * <br>
 * @version 0.3
 * 	
 * @author Jimmy Vang
 */
public class PersonDemo {

	private static final String TITLE = "Person Demo";
	
////////////////////////////////////////
	public static void main(String[] args) throws InterruptedException {
		
		// Start of program
		while (true) {
			
			/////////////////////////////////////////////
			// Main Menu and welcome screen
			while (true) 
			{
				// Initialize option dialog box
				String MESSAGE 	= "*** Main Menu ***\n"
						+ "-----------------------------------------------------------------------------------------------\n"
						+ "Welcome to the \"PersonDemo.java\" demo.\n"
						+ "\n"
						+ "Three Person object classes will be created.\n"
						+ "They are called \"Person 1\", \"Person 2\", and \"Person 3\"\n"
						+ "\n"
						+ "This demo will test the following methods of each person...\n"
						+ "     setAddress()\n"
						+ "     outputAddress()\n"
						+ "     setHeight()\n"
						+ "     setHeightCm()\n"
						+ "     setWeight()\n"
						+ "     setWeightKilo()\n"
						+ "     outputHeight()\n"
						+ "     outputWeight()\n"
						+ "\n"
						+ "Click \"Start\" to continue.\n"
						+ "-----------------------------------------------------------------------------------------------";
				String Choices[] = { "Start", "Quit" };
	
				// Bring up dialog box
				int optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
						JOptionPane.PLAIN_MESSAGE, null, Choices, Choices[0]);
				
				// If user clicks "Start", start the program.
				if (optDialog == JOptionPane.YES_OPTION) {
					break;
				}
				// If user clicks "Quit" or X, quit the program.
				else {
					System.exit(0);
				}
			}
			
			/////////////////////////////////////////////
			// Tell user that we will test setAddress
			while (true) 
			{
				// Initialize option dialog box
				String MESSAGE 	= "*** Testing setAddress() ***\n"
						+ "-----------------------------------------------------------------------------------------------\n"
						+ "We will now test the setAddress() methods."
						+ "\n"
						+ "-----------------------------------------------------------------------------------------------\n"
						+ "Click \"Next\" to continue.";
				String Choices[] = { "Next", "Quit" };
	
				// Bring up dialog box
				int optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
						JOptionPane.PLAIN_MESSAGE, null, Choices, Choices[0]);
				
				// If user clicks "Start", start the program.
				if (optDialog == JOptionPane.YES_OPTION) {
					break;
				}
				// If user clicks "Quit" or X, quit the program.
				else {
					System.exit(0);
				}
			}
			
			//////////////////////////////
			// Create 4 Person objects.
			Person person1 = new Person("Person 1", 1);
			Person person2 = new Person("Person 2", 2);
			Person person3 = new Person("Person 3", 3);
			Person person4 = new Person("Person 4", 4);
			
			/////
			// Test setAddress() with parameters (street, city, state, zip).
			
			// Set the address of Person #1
			person1.setAddress("777 Shore Acres Rd", "La Crescent", "MN", "55947");
			
			// Display the address (message box)
			person1.outputAddress();
			
			/////
			// Test setAddress() with parameters (city, state, zip).
			
			// Set the address of Person #1
			person2.setAddress("La Crosse", "WI", "54601");
			
			// Display the address (message box)
			person2.outputAddress();
			
			/////
			// Test setAddress() with parameters (state, zip).
			
			// Set the address of Person #1
			person3.setAddress("FL", "32006");
			
			// Display the address (message box)
			person3.outputAddress();
			
			/////////////////////////////////////////////
			// Tell user that we will test setHeight() and setHeightCm();
			while (true) 
			{
				// Initialize option dialog box
				String MESSAGE 	= "*** Testing setHeight() and setHeightCm() ***\n"
						+ "-----------------------------------------------------------------------------------------------\n"
						+ "We will now test the setHeight() and setHeightCm() methods.\n"
						+ "\n"
						+ "Person 1 will test setHeight (double inches).\n"
						+ "Person 2 will test setHeight (int inches).\n"
						+ "Person 3 will test setHeight (int feet, int inches).\n"
						+ "Person 4 will test setHeightCm (double centimeters)\n"
						+ "\n"
						+ "-----------------------------------------------------------------------------------------------\n"
						+ "Click \"Next\" to continue.";
				String Choices[] = { "Next", "Quit" };
	
				// Bring up dialog box
				int optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
						JOptionPane.PLAIN_MESSAGE, null, Choices, Choices[0]);
				
				// If user clicks "Start", start the program.
				if (optDialog == JOptionPane.YES_OPTION) {
					break;
				}
				// If user clicks "Quit" or X, quit the program.
				else {
					System.exit(0);
				}
			}
			
			/////
			// Test setHeight().
			
			// parameters (double height)
			person1.setHeight(60.4);
			person1.outputHeight();
			
			// parameters (int height)
			person2.setHeight(68);
			person2.outputHeight();
			
			// parameters (int feet, int inches)
			person3.setHeight(6, 4);
			person3.outputHeight();
			
			// parameters (int centimeters)
			person4.setHeight(200);
			person4.outputHeight();
			
			/////////////////////////////////////////////
			// Tell user that we will test setWeight() and setWeightKilo();
			while (true) 
			{
				// Initialize option dialog box
				String MESSAGE 	= "*** Testing setWeight() and setWeightKilo() ***\n"
						+ "-----------------------------------------------------------------------------------------------\n"
						+ "We will now test the setWeight() and setWeightKilo() methods.\n"
						+ "\n"
						+ "Person 1 will test setWeight (double weight).\n"
						+ "Person 2 will test setWeight (int weight).\n"
						+ "Person 3 will test setWeightKilo (double kilograms).\n"
						+ "\n"
						+ "-----------------------------------------------------------------------------------------------\n"
						+ "Click \"Next\" to continue.";
				String Choices[] = { "Next", "Quit" };
	
				// Bring up dialog box
				int optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
						JOptionPane.PLAIN_MESSAGE, null, Choices, Choices[0]);
				
				// If user clicks "Start", start the program.
				if (optDialog == JOptionPane.YES_OPTION) {
					break;
				}
				// If user clicks "Quit" or X, quit the program.
				else {
					System.exit(0);
				}
			}
			
			/////
			// Test setWeight().
			
			// parameters (double weight)
			person1.setWeight(100.4);
			person1.outputWeight();
			
			// parameters (int weight)
			person2.setWeight(125);
			person2.outputWeight();
			
			// parameters (int kilograms
			person3.setWeightKilo(100.55);
			person3.outputWeight();
				
			/////////////////////////////////////////////
			// Tell user that we will test setAddress() when state or zip have null or empty strings.
			while (true) 
			{
				// Initialize option dialog box
				String MESSAGE 	= "*** Testing setAddress() ***\n"
						+ "-----------------------------------------------------------------------------------------------\n"
						+ "We will now test the setAddress() methods if the \"state\" and \"zip\" code are null or empty."
						+ "\n"
						+ "-----------------------------------------------------------------------------------------------\n"
						+ "Click \"Next\" to continue.";
				String Choices[] = { "Next", "Quit" };
	
				// Bring up dialog box
				int optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
						JOptionPane.PLAIN_MESSAGE, null, Choices, Choices[0]);
				
				// If user clicks "Start", start the program.
				if (optDialog == JOptionPane.YES_OPTION) {
					break;
				}
				// If user clicks "Quit" or X, quit the program.
				else {
					System.exit(0);
				}
			}
			
			/////
			// Test setAddress() if given NULL or "".
			person1.setAddress("An Address", "A City", null, null);

			/////////////////////////////////////////////
			// Ask user if they would like to restart the demo.
			
			while (true) 
			{
				// Initialize option dialog box
				String MESSAGE 	= "This is the end of the demo.\n"
						+ "Would you like to restart the whole demo?";
				String Choices[] = { "Yes", "Quit" };
	
				// Bring up dialog box
				int optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
						JOptionPane.PLAIN_MESSAGE, null, Choices, Choices[0]);
	
				// If user clicks "Yes", restart the program.
				if (optDialog == JOptionPane.YES_OPTION) {
					break;
				}
				// If user clicks "Quit" or X, quit the program.
				else {
					System.exit(0);
				}
			}
			
		}
		// END OF DEMO
////////////////////////////////////////
	}
}
