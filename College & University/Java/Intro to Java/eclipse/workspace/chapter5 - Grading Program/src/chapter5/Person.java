package chapter5;

import javax.swing.JOptionPane;

////////////////////////////////////////////////////////////////////
/**
* This class file contains methods for the Person objects.
* 
* File Name:	Person.java
* Created by: 	Jimmy Vang
* Date:			Oct 20, 2016
* @version 0.1
* 	
* 
*/
public class Person {

	////////////////////////////////////////
	// Variables
	private String name = "";
	private int age = 0;
	
	/**	
		Precondition: 	The instance variables of the calling object must have values, 
		age must be a non-negative number.
		Postcondition:	Returns nothing and invokes the setName() and setAge() methods.
	 */ 
	public void setPerson(String name, int age) {
		setName(name);
		setAge(age);
	}

	/**	
		Precondition: 	No precondition.
		Postcondition:	Returns this object's name.
	 */ 
	public String getName() {
		return name;
	}
	
	/**	
		Precondition: 	Requires String for name.
		Postcondition:	Returns nothing and sets this object's name.
	 */ 
	public void setName(String name) {
		this.name = name;
	}

	/**	
		Precondition: 	No precondition.
		Postcondition:	Returns this object's age.
	 */ 
	public int getAge() {
		return age;
	}

	/**	
		Precondition: 	Age is a non-negative integer number.
		Postcondition:	Returns nothing and sets this object's age.
	 */ 
	public void setAge(int age) {
		if (age >= 0) {
			this.age = age;
		} else {
			return;
		}
	}

	/**	
		Precondition: 	The instance variable is a Person object.
		Postcondition:	Returns a boolean value and checks if the two Person objects 
		have the same name and age.
	 */ 
	public boolean comparePerson (Person p2) {
		System.out.print("\t" 
				+ this.getName() 	+ " (age: " 	+ this.getAge() 	+ ") and " 
				+ p2.getName() 		+ " (age: " 	+ p2.getAge() 		+ ") ");
		return (compareName(this) && compareName(p2) && compareAge(this) == compareAge(p2));
	}
	
	/**	
		Precondition: 	The instance variable is a Person object.
		Postcondition:	Returns a boolean value and checks if the two Person objects 
		have the same names.
	 */ 
	public boolean compareName (Person p2) {
		System.out.print("\t" 
				+ this.getName() 	+ " (age: " 	+ this.getAge() 	+ ") and " 
				+ p2.getName() 		+ " (age: " 	+ p2.getAge() 		+ ") ");
		
		if (this.getName().equals(p2.getName())) {
			//System.out.print("have the same name.");
			return true;
		} else if (!this.getName().equals(p2.getName())) {
			//System.out.print("do not have the same name.");
			return false;
		} else {
			System.out.print("ERROR: compareName method has a logic error! Please check with the programmer :( .");
			return false;
		}
	}
	
	/**	
		Precondition: 	The instance variable is a Person object.
		Postcondition:	Returns an age difference of two Person objects, 
		checks if the two Person objects have the same age, 
		checks if this object is older than the other Person object, and 
		checks if this object is younger than the other Person object.
	 */ 
	public int compareAge (Person p2) {
		int ageDifference = 0;
		System.out.print("\t" 
				+ this.getName() 	+ " (age: " 	+ this.getAge() 	+ ") and " 
				+ p2.getName() 		+ " (age: " 	+ p2.getAge() 		+ ") ");
		
		ageDifference = this.getAge() - p2.getAge();
		
		/*
		if (this.getAge() == p2.getAge()) {
			//System.out.print("... both have the same age.");
			ageDifference = this.getAge() - p2.getAge();
		} else if (this.getAge() > p2.getAge()) {
			//System.out.print("... " + this.getName() + " is older than " + p2.getName() + ".");
			ageDifference = this.getAge() - p2.getAge();
		} else if (this.getAge() < p2.getAge()) {
			//System.out.print("... " + this.getName() + " is younger than " + p2.getName() + ".");
			ageDifference = this.getAge() - p2.getAge();
		} else {
			System.out.print("ERROR: compareAge method has a logic error! Please check with the programmer :( .");
		}*/
		
		return ageDifference;
	}
	
	
	////////////////////////////////////////
	// Handle Exception Errors here.
	public static Throwable exceptionHandler(Throwable e) {
		////////////////////////////////////////////////////////////////////
		// Number Format Error
		if (e instanceof NumberFormatException) {
			JOptionPane.showMessageDialog(null, "An error has occured (" + e + ").\n ", "NumberFormatException",
					JOptionPane.ERROR_MESSAGE, null);
		////////////////////////////////////////////////////////////////////
		// Null Error
		} else if (e instanceof NullPointerException) {
			JOptionPane.showMessageDialog(null, "An error has occured (" + e + "). A variable was pointed at Null.",
					"NullPointerException", JOptionPane.ERROR_MESSAGE, null);
		////////////////////////////////////////////////////////////////////
		// Other Errors
		} else {
			JOptionPane.showMessageDialog(null, "Error. An unknown error has occured.", "" + e,
					JOptionPane.ERROR_MESSAGE, null);
		}
		return e;
	}
////////////////////////////////////////
}
