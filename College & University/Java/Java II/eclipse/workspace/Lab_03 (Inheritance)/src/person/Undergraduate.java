package person;

public class Undergraduate extends Student {
	
	private int level;
	
	public Undergraduate() {
		this("", 0, 1);
	}
	
	public Undergraduate(String name, int studentNumber, int level) {
		super(name, studentNumber);
		this.setLevel(level);
	}
	
	public void reset(String name, int studentNumber, int level) {
		super.reset(name, studentNumber);
		this.setLevel(level);
	}
	
	public void writeOutput() {
		super.writeOutput();
		System.out.println("Level: (" + level + ")");
	}
	
	public boolean equals(Object o) {
		if(o!= null && o instanceof Undergraduate) {
			Undergraduate otherUndergraduate = (Undergraduate)o;
			return this.equals(otherUndergraduate);
		}
		
		return false;
	}
	
	public boolean equals(Undergraduate otherUndergraduate) {
		return super.equals(otherUndergraduate) 
				&& this.getLevel() == otherUndergraduate.getLevel();
	}
	
	//ACCESSORS//GETTERS
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		if(level < 1 || level > 4) {
			System.out.println("Error: level cannot be less than 1 or greater than 4.");
			System.exit(0);
		}
		
		this.level = level;
	}
}
