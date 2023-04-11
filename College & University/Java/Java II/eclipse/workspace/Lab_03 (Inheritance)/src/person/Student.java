package person;

public class Student extends Person{
	private int studentNumber = 0;
	
	public Student() {
		this("", 0);
	}
	
	public Student(String name, int studentNumber) {
		super(name);
		this.setStudentNumber(studentNumber);
	}
	
	public void reset(String name, int studentNumber) {
		super.reset(name);
		this.setStudentNumber(studentNumber);
	}

	public void writeOutput() {
		super.writeOutput();
		System.out.println("Student ID: (" + studentNumber + ")");
	}
	
	public boolean equals(Object o) {
		if(o!= null && o instanceof Student) {
			Student otherStudent = (Student)o;
			return this.equals(otherStudent);
		}
		
		return false;
	}
	
	public boolean equals(Student otherStudent) {
		return super.equals(otherStudent) 
				&& this.getStudentNumber() == otherStudent.getStudentNumber();
	}
	
	//ACCESSORS//GETTERS
	public int getStudentNumber() {
		return studentNumber;
	}

	public void setStudentNumber(int studentNumber) {
		this.studentNumber = studentNumber;
	}
	
}
