
public class Person {

	private String lastName;
	private String firstName;
	private int age;
	
	///////////////////
	// ACCESSORS
	public String toString() {
		String msg;
		msg = 	"\n------------------------------------------------";
		msg += 	"\n" + firstName + " " + lastName + "'s Record:";
		msg += 	"\nLast Name: \t" + getLastName();
		msg += 	"\nFirst Name: \t" + getFirstName();
		msg += 	"\nAge: \t\t" + getAge();
		return msg;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String name) {
		this.lastName = name;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
