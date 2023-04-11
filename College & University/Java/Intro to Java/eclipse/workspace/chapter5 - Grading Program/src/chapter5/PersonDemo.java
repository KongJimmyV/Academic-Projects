package chapter5;

import java.util.Scanner;

////////////////////////////////////////////////////////////////////
/**
* This class file demos the Person.java file.
* 
* File Name:	PersonDemo.java
* Created by: 	Jimmy Vang
* Date:			Oct 20, 2016
* @version 0.1	
* 
* 
*/
public class PersonDemo {

	public static void main(String[] args) throws InterruptedException {
		////////////////////////////////////////
		// Create variables
		Scanner s = new Scanner(System.in);
		
		////////////////////////////////////////
		// Start of program
		while (true) {
			// Main Menu and welcome screen
			System.out.println("--------------------------------------------------------");
			System.out.println("Welcome to \"PersonDemo.java\""
					+ "\nThis demo is will test \"Person.java\" and make sure it's methods work."
					+ "\nThere are 3 methods to test are, \"comparePerson\", \"compareName\", and \"compareAge\""
					+ "\n\n"
					+ "Start the demo? (type in 'yes' or 'no')");
			
			// Check if user types in yes or no.
			while (true) {
				String userInput = s.nextLine();
				userInput = userInput.toLowerCase();
				if ("yes".equals(userInput)) {
					break;
				}
				else if ("no".equals(userInput)) {
					System.out.println("Quitting Demo...");
					System.exit(0);
				}
				else {
					System.out.println("Invalid response. Start the demo? (type in 'yes' or 'no')");
					continue;
				}
			}
			
			// Create People objects
			String msg = "::: ";		// Define a message String
			
			System.out.println("\nCreating Person objects...");
			Person jimmy = new Person(); 		jimmy.setPerson("Jimmy", 20);
			System.out.println(msg + jimmy.getName() + ", " + jimmy.getAge() + " years.");
			
			Person jimmyClone = new Person();	jimmyClone.setPerson("Jimmy", 20);
			System.out.println(msg + jimmyClone.getName() + ", " + jimmyClone.getAge() + " years.");
			
			Person jimmyTeen = new Person();	jimmyTeen.setPerson("Jimmy", 13);
			System.out.println(msg + jimmyTeen.getName() + ", " + jimmyTeen.getAge() + " years.");
			
			Person jimmyOld = new Person();		jimmyOld.setPerson("Jimmy", 50);
			System.out.println(msg + jimmyOld.getName() + ", " + jimmyOld.getAge() + " years.");
			
			Person chee = new Person();			chee.setPerson("Chee", 8);
			System.out.println(msg + chee.getName() + ", " + chee.getAge() + " years.");
			
			Person max = new Person();			max.setPerson("Max", 20);
			System.out.println(msg + max.getName() + ", " + max.getAge() + " years.");
			
			Person anne = new Person();			anne.setPerson("Anne", 24);
			System.out.println(msg + anne.getName() + ", " + anne.getAge() + " years.");
			
			Person negativeAge = new Person();	negativeAge.setPerson("negativeAge", -1);
			System.out.println(msg + negativeAge.getName() + ", " + negativeAge.getAge() + " years.");
			if (negativeAge.getAge() < 0)
				System.out.println("ERROR: Age is a negative number.");
			else
				System.out.println("OK");
			
			//Person custom1 = new Person();		custom1.setName("User1"); 			custom1.setAge(0);
			//Person custom2 = new Person();		custom2.setName("User2"); 			custom2.setAge(0);
			
			// message String
			msg = "";
			
			// Test comparePerson Method
			System.out.println("\nTesting \"comparePerson\" Method...");
			System.out.println("...Press enter to continue");
			s.nextLine();
			System.out.println(" \t| Both Same Person?: " + jimmy.comparePerson(jimmyClone));	Thread.sleep(250);		//wait
			System.out.println(" \t\t| Both Same Person?: " + jimmy.comparePerson(jimmyTeen));	Thread.sleep(250);
			System.out.println(" \t\t| Both Same Person?: " + jimmy.comparePerson(jimmyOld));	Thread.sleep(250);
			System.out.println(" \t| Both Same Person?: " + jimmy.comparePerson(chee));			Thread.sleep(250);
			
			// Test compareName Method
			System.out.println("\nTesting \"compareName\" Method...");
			System.out.println("...Press enter to continue");
			s.nextLine();
			System.out.println(" \t| Both Same Name?: " + jimmy.compareName(jimmyClone));		Thread.sleep(250);		//wait
			System.out.println(" \t| Both Same Name?: " + jimmy.compareName(jimmyTeen));		Thread.sleep(250);
			System.out.println(" \t| Both Same Name?: " + jimmy.compareName(jimmyOld));		Thread.sleep(250);
			System.out.println(" \t| Both Same Name?: " + jimmy.compareName(chee));			Thread.sleep(250);
			
			// Test compareAge Method
			System.out.println("\nTesting \"compareAge\" Method...");
			System.out.println("...Press enter to continue");
			s.nextLine();
			System.out.println(" \t| Age Difference returned as: " + jimmy.compareAge(jimmyClone));		Thread.sleep(250);		//wait
			System.out.println(" \t| Age Difference returned as: " + jimmy.compareAge(max));			Thread.sleep(250);
			System.out.println(" \t| Age Difference returned as: " + jimmy.compareAge(anne));				Thread.sleep(250);
			System.out.println(" \t| Age Difference returned as: " + jimmy.compareAge(chee));				Thread.sleep(250);
			
			// Tell user that the demo has ended.
			System.out.println("\nThis is the end of the demo.");
			
			Thread.sleep(250);		//wait
			
			// Ask user if they would like to restart the demo.
			System.out.println("Would you like to restart the whole demo? (type in 'yes' or 'no'.)");
			while (true) {
				String userInput = s.nextLine();
				userInput = userInput.toLowerCase();
				if ("yes".equals(userInput)) {
					break;
				}
				else if ("no".equals(userInput)) {
					System.out.println("Quitting Demo...");
					System.exit(0);
				}
				else {
					System.out.println("Invalid response. "
							+ "Would you like to restart the whole demo?? (type in 'yes' or 'no')");
					continue;
				}
			}
			System.out.println("\n\n");
		}
////////////////////////////////////////
		
	}
}
