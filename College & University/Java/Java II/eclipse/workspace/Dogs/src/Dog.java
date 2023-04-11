import java.util.ArrayList;
import java.util.Date;

public class Dog {
	
	private String name;
	private Date dateOfBirth;
	private int weight;
	private Breed breed;
	
	private ArrayList ownersList;
	private ArrayList tricksList;
	
	public Dog(String name, Owner owner, Breed breed) {
		this.setName(name);
		setOwnersList(new ArrayList());
		tricksList = new ArrayList();
		
		breed.addDog(this);
		this.addOwner(owner);
	}

	public void addOwner(Owner owner) {
		if (!getOwnersList().contains(owner)) {
			getOwnersList().add(owner);
			
		}
	}
	
	public void addTrick() {
		
	}
	/*****ACCESSORS/SETTERS*****/
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public Breed getBreed() {
		return breed;
	}

	public void setBreed(Breed breed) {
		this.breed = breed;
	}

	public ArrayList getOwnersList() {
		return ownersList;
	}

	private void setOwnersList(ArrayList ownersList) {
		this.ownersList = ownersList;
	}

}
