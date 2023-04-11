
public class Pet {
	private String name;
	private int age;
	private double weight;
	
	public Pet(){
		this("Unknown", 0, 0);
		//System.out.println("Creating New Pet...");
	}

	public Pet(String name){
		this(name, 0, 0);
		System.out.println("Creating New Pet...");
		
	}
	
	public Pet(String name, int age, double weight){
		setPet(name, age, weight);
		//System.out.println("Creating New Pet...");
	}
	
	
	public void writeOutput() {
		System.out.println("Name: \t\t" 	+ name 		+ " ");
		System.out.println("Age: \t\t" 		+ age 		+ " year(s)");
		System.out.println("Weight: \t" 	+ weight 	+ " lb(s)");
	}
	
	public String toString() {
		String str = "Name: \t\t" 	+ name 		+ "\n"
				+ 	"Age: \t\t" 	+ age 		+ " year(s)\n"
				+ 	"Weight: \t" 	+ weight 	+ " lb(s)\n";
		return str;
	}
	
	public boolean equals(Pet otherPet) {
		return this.name.equals(otherPet.name)
				&& this.age == otherPet.age
				&& this.weight == otherPet.weight;
	}
	
	public void setPet(String newName, int newAge, double newWeight) {
		setName(newName);
		setAge(newAge);
		setWeight(newWeight);
	}
	
	
	/***ACCESSORS***/
	public String getName() {
		return name;
	}

	public void setName(String name) {
		if (name == null)
		{
			System.out.println("ERROR: Name must be set! (Name cannot be equal to null");
			System.exit(0);
		}
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		if (age < 0) {
			System.out.println("ERROR: Age cannot be negative!");
			System.exit(0);
		}
		this.age = age;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

}
