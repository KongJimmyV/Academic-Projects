import java.util.ArrayList;

public class Owner {
	
	private String firstName;
	private String lastName;
	private ArrayList dogsList;

	public Owner(String firstName, String lastName) {
		this.setFirstName(firstName);
		this.setLastName(lastName);
	}
	
	public void addDog(Dog dog) {
//		if (!getDogsList().contains(dog)) {
//			getDogsList().add(dog);
//			dog.addOwner(this);
//		}
	}
	
	/*****ACCESSORS/SETTERS*****/
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public ArrayList getDogsList() {
		return dogsList;
	}

	private void setDogsList(ArrayList dogsList) {
		this.dogsList = dogsList;
	}
}
