import java.util.ArrayList;

public class Breed {

	private String name;
	private ArrayList dogsList;
	
	public Breed(String name){
		this.setName(name);;
		setDogsList(new ArrayList());
	}
	
	public void addDog(Dog dog) {
		if (!getDogsList().contains(dog)) {
			getDogsList().add(dog);
			dog.setBreed(this);
		}
	}
	
	/*****ACCESSORS/SETTERS*****/
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public ArrayList getDogsList() {
		return dogsList;
	}

	private void setDogsList(ArrayList dogsList) {
		this.dogsList = dogsList;
	}
}
