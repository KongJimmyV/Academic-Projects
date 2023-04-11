package chapter6;

import javax.swing.JOptionPane;

////////////////////////////////////////////////////////////////////
/**
 * This class file contains methods for the Person objects.
 * <br>
 * <br>File Name:		Person.java
 * <br>Created by: 		Jimmy Vang
 * <br>Date Created:	Oct 20, 2016 (10/20/2016)
 * <br>Date Modified: 	Nov 15, 2016 (11/15/2016)
 * <br>
 * @version 0.2
 * 	
 * <br>NOTES:
 * <ul>			*** Access Levels Table ***
 * 		<li>	Modifier		Class		Package		Subclass	World
 * 
 * 		<li>	public			Y			Y			Y			Y
 * 		<li>	protected		Y			Y			Y			N
 * 		<li>	no modifier		Y			Y			N			N
 * 		<li>	private			Y			N			N			N
 * </ul>
 * <br>
 * @author Jimmy Vang
 */
public class Person {
	
	////////////////////////////////////////
	// Constant Variables
	private static final String 	DEFAULT_NAME 	= "No name yet";
	private static final int 		DEFAULT_AGE 	= 0;
	
	////////////////////////////////////////
	// Instance Variables
	private static int 				numberOfPeople 	= 0;
	private String 					name 			= "";
	private int 					age 			= 0;
	
	/****************** CONSTRUCTORS ******************/
	/**
	 * +++ CONSTUCTOR 1 [DEFAULT CONSTRUCTOR] +++
	 * Sets the person object by the default values.
	 * 
	 * Defaults are, 
	 * 		(name = "No name yet") and 
	 * 		(age = "0").
	 * 
	 */
	public Person() {
		this(DEFAULT_NAME, DEFAULT_AGE);
	}
	
	/**
	 * +++ CONSTUCTOR 2 +++
	 * Sets the person object's name.
	 * 
	 * Default is, 
	 * 		(age = "0").
	 * 
	 * @param name to set.
	 * 
	 */
	public Person(String name) {
		this(name, DEFAULT_AGE);
	}

	/**
	 * +++ CONSTUCTOR 3 [MASTER CONSTRUCTOR] +++
	 * Sets the person object's name and age.
	 * Also increments the number of people created.
	 * 
	 * @param name to set.
	 * @param age to set.
	 * @param numberOfPeople to increment.
	 */
	public Person(String name, int age) {
		setPerson(name, age);
		numberOfPeople++;
	}
	
	/****************** METHODS ******************/
	/**	
		Precondition: 	The instance variable is a Person object.
		
		Postcondition: Returns a boolean value and checks if the two Person objects 
		have the same name and age.
		@return True if two Person objects have the same name and age.
	 */ 
	public boolean comparePerson (Person p2) {
		System.out.print("\t" 
				+ this.getName() 	+ " (age: " 	+ this.getAge() 	+ ") and " 
				+ p2.getName() 		+ " (age: " 	+ p2.getAge() 		+ ") ");
		return (compareName(this) && compareName(p2) && compareAge(this) == compareAge(p2));
	}
	
	/**	
		Precondition: 	The instance variable is a Person object.
		
		Postcondition: Returns a boolean value and checks if the two Person objects 
		have the same names.
		@return True if two Person objects have the same name and age.
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
		
		Postcondition: 	Checks if the two Person objects have the same age, 
		checks if this object is older than the other Person object, and 
		checks if this object is younger than the other Person object.
		@return Returns an age difference of two Person objects.
		
	 */ 
	public int compareAge (Person p2) {
		int ageDifference = this.getAge() - p2.getAge();
		System.out.print("\t" 
				+ this.getName() 	+ " (age: " 	+ this.getAge() 	+ ") and " 
				+ p2.getName() 		+ " (age: " 	+ p2.getAge() 		+ ") ");
		
		return ageDifference;
	}

	/****************** STATIC METHODS ******************/
	/**
	 * Creates a toddler from the Person class.
	 * @return Person class.
	 */
	static public Person createToddler() {
		return new Person("A toddler", 2);
	}
	
	/**
	 * Creates a pre-schooler from the Person class.
	 * @return Person class.
	 */
	static public Person createPreschooler() {
		return new Person("A pre-schooler", 5);
	}
	
	/**
	 * Creates a adolescent from the Person class.
	 * @return Person class.
	 */
	static public Person createAdolescent() {
		return new Person("A adolescent", 9);
	}
	
	/**
	 * Creates a teenager from the Person class.
	 * @return Person class.
	 */
	static public Person createTeenager() {
		return new Person("A teenager", 15);
	}
	
	/**
	 * Creates an adult from the Person class.
	 * @return Person class.
	 */
	static public Person createAdult() {
		return new Person("An adult", 21);
	}
	
	/****************** ACCESSORS ******************/
	/**
	 * Accepts an integer amount and sets the numberOfPeople equal to that integer.
	 * Returns nothing.
	 * <br>
	 * @param numberOfPeople the number of People to set
	 */
	private static void setNumberOfPeople(int numberOfPeople) {
		Person.numberOfPeople = numberOfPeople;
	}
	
	/**
	 * Returns the total amount of Person objects created.
	 * <br>
	 * @return numberOfPeople
	 */
	public static int getNumberOfPeople() {
		return numberOfPeople;
	}

	/**
	 * Resets the total counter for the number of people created.
	 */
	static void resetNumberOfPeople() {
		Person.setNumberOfPeople(0);
	}

	/**
	 * Precondition: The instance variables of the calling object must have
	 * values, age must be a non-negative number. 
	 * <br>
	 * Postcondition: Returns nothing
	 * and invokes the setName() and setAge() methods.
	 * 
	 * @param name to set.
	 * @param age to set.
	 */
	public void setPerson(String name, int age) {
		setName(name);
		setAge(age);
	}

	/**
	 * Precondition: No precondition. 
	 * <br>
	 * Postcondition: Returns this object's name.
	 * @return name
	 */
	public String getName() {
		return name;
	}

	/**
	 * Precondition: Requires String for name. 
	 * <br>
	 * Postcondition: Returns nothing and sets this object's name.
	 * @return name
	 * 
	 * @param name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Precondition: No precondition. 
	 * <br>
	 * Postcondition: Returns this object's age.
	 * @return name
	 */
	public int getAge() {
		return age;
	}

	/**
	 * Precondition: Accepts age as an non-negative integer number. (age >= 0)
	 * Shuts down program if age is negative. (EXAMPLE: "age = -1").
	 * <br>
	 * Postcondition: Returns nothing and sets this object's age.
	 * 
	 * @param age to set.
	 */
	public void setAge(int age) {
		if (age >= 0) {
			this.age = age;
		} else {
			this.age = age;
			String msg = "ERROR: An age was set as a negative number for a person. \n" + this.toString();
			JOptionPane.showMessageDialog(null, msg, "ERROR", JOptionPane.ERROR_MESSAGE, null);
			System.out.println("\n" + msg);
			System.exit(0);
			return;
		}
	}
	
	/**
	 * Precondition: 	No precondition or parameters.
	 * <br>
	 * Postcondition:	Returns a string that represents the Person object's name and age.
	 * @return str
	 */
	public String toString() {
		String str = "Name: "	+ name
				+ "\nAge: "		+ age
				+ "";
		return str;
	}
	
	/**
	 * Handle exceptions here.
	 * 
	 * @param e Throwable
	 * 
	 * @return Throwable
	 */
	public static Throwable exceptionHandler(Throwable e) {
		////////////////////////////////////////////////////////////////////
		// Number Format Error
		if (e instanceof NumberFormatException) {
			JOptionPane.showMessageDialog(null, 
					"An error has occured (" + e + ").\n ", 
					"NumberFormatException",
					JOptionPane.ERROR_MESSAGE, null);
		////////////////////////////////////////////////////////////////////
		// Null Error
		} else if (e instanceof NullPointerException) {
			JOptionPane.showMessageDialog(null, 
					"An error has occured (" + e + ").",
					"NullPointerException", 
					JOptionPane.ERROR_MESSAGE, null);
		////////////////////////////////////////////////////////////////////
		// Other Errors
		} else {
			JOptionPane.showMessageDialog(null, 
					"Error. An unknown error has occured.", 
					"" + e,
					JOptionPane.ERROR_MESSAGE, null);
		}
		return e;
	}
////////////////////////////////////////

}
