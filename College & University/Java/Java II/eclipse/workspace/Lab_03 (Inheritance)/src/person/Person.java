package person;

public class Person {
	private String name = "";
	
	public Person() {
		this("");
	}
	
	public Person(String name) {
		setName(name);
	}
	
	public void reset(String name) {
		this.setName(name);
	}
	
	public void writeOutput() {
		System.out.println("Name: (" + name + ")");
	}
	
	public boolean hasSameName(Person otherPerson) {
		return this.getName() == otherPerson.getName();
	}
	
	public boolean equals(Object o) {
		if(o!= null && o instanceof Person) {
			Person otherPerson = (Person)o;
			return this.equals(otherPerson);
		}
		
		return false;
	}
	
	public boolean equals(Person otherPerson) {
		return this.getName() == otherPerson.getName();
	}
	
	//ACCESSORS//GETTERS
	public String getName() {
		return name;
	}

	public void setName(String name) {
		if(name == null) {
			System.out.println("ERROR: A name was set as NULL.");
		}
		else {
			this.name = name;
		}
	}
	
}
