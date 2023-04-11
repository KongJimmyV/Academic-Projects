package chapter6;

import javax.swing.JOptionPane;

////////////////////////////////////////////////////////////////////
/**
 * This class file demos the Person.java file.
 * <br>
 * <br>File Name:		PersonDemo.java
 * <br>Created by: 		Jimmy Vang
 * <br>Date Created:	Oct 20, 2016 (10/20/2016)
 * <br>Date Modified: 	Nov 15, 2016 (11/15/2016)
 * <br>
 * 	@version 0.2
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
						+ "This demo will test the constructors and static methods of \"Person.java\".\n"
						+ "\n"
						+ "Click \"Start\" to continue.\n"
						+ "-----------------------------------------------------------------------------------------------";
				String Choices[] = { "Start", "Quit" };
	
				// Bring up dialog box
				int optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
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
			
			/////////////////////////////////////////////
			// Test the Constructors and Methods of Person.java.
				
				//**************************//
				//*** TEST Constructors. ***//
				Person constuctorTest1 = new Person();
				Person constuctorTest2 = new Person("Constructor Test 2");
				Person constuctorTest3 = new Person("Constructor Test 3", 99);
				
				// Display all Constructors Tests and the total number of people created.
				while (true) 
				{
					// Initialize option dialog box
					String MESSAGE 	= "*** Testing Constructors ***\n"
							+ "----------------------------------------------------------------------\n"
							+ "Constructor Test 1 (Parameters = none): \n"
							+ "     Name:     \"" + constuctorTest1.getName() + "\"\n"
							+ "     Age:         " + constuctorTest1.getAge() + "\n"
							+ "\n"
							+ "Constructor Test 2 (Parameters = name): \n"
							+ "     Name:     \"" + constuctorTest2.getName() + "\"\n"
							+ "     Age:         " + constuctorTest2.getAge() + "\n"
							+ "\n"
							+ "Constructor Test 3 (Parameters = name, age): \n"
							+ "     Name:     \"" + constuctorTest3.getName() + "\"\n"
							+ "     Age:         " + constuctorTest3.getAge() + "\n"
							+ "\n"
							+ "Total People Created = " + Person.getNumberOfPeople() + "\n"
							+ "----------------------------------------------------------------------\n"
							+ "\n"
							+ "Click \"Next\" to continue.\n";
					String Choices[] = { "Next", "Quit" };
					
					// Show dialog box
					int optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
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
				// Reset Total Amount of People
				Person.resetNumberOfPeople();
				
				//****************************//
				//*** TEST Static Methods. ***//
				Person toddler		= Person.createToddler();
				Person preschooler 	= Person.createPreschooler();
				Person adolescent 	= Person.createAdolescent();
				Person teenager 	= Person.createTeenager();
				Person adult 		= Person.createAdult();
				
				// Display all Static Method Tests and the total number of people created.
				while (true) 
				{
					// Initialize option dialog box
					String MESSAGE 	= "*** Testing Static Methods ***\n"
							+ "----------------------------------------------------------------------\n"
							+ "Creating Toddler: \n"
							+ "     Name:     \"" + toddler.getName() + "\"\n"
							+ "     Age:         " + toddler.getAge() + "\n"
							+ "\n"
							+ "Creating Pre-schooler: \n"
							+ "     Name:     \"" + preschooler.getName() + "\"\n"
							+ "     Age:         " + preschooler.getAge() + "\n"
							+ "\n"
							+ "Creating Adolescent: \n"
							+ "     Name:     \"" + adolescent.getName() + "\"\n"
							+ "     Age:         " + adolescent.getAge() + "\n"
							+ "\n"
							+ "Creating Teenager: \n"
							+ "     Name:     \"" + teenager.getName() + "\"\n"
							+ "     Age:         " + teenager.getAge() + "\n"
							+ "\n"
							+ "Creating Adult: \n"
							+ "     Name:     \"" + adult.getName() + "\"\n"
							+ "     Age:         " + adult.getAge() + "\n"
							+ "\n"
							+ "Total People Created = " + Person.getNumberOfPeople() + "\n"
							+ "----------------------------------------------------------------------\n"
							+ "\n"
							+ "Click \"Next\" to continue.\n";
					String Choices[] = { "Next", "Quit" };
					
					// Show dialog box
					int optDialog = JOptionPane.showOptionDialog(null, MESSAGE, TITLE, JOptionPane.YES_NO_OPTION,
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
				// Reset Total Amount of People
				Person.resetNumberOfPeople();
			
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
	
				// If user presses OK, restart the program.
				if (optDialog == JOptionPane.YES_OPTION) {
					break;
				}
				// If user clicks cancel or X, quit the program.
				else {
					System.exit(0);
				}
			}
			// Reset Total Amount of People
			Person.resetNumberOfPeople();
			

		}
		// END OF DEMO
////////////////////////////////////////
	}
}
