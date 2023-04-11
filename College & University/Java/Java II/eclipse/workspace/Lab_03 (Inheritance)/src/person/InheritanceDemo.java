package person;

public class InheritanceDemo {

	public static void main(String[] args) {

		// Test student
		Student s = new Student("Fred", 9876552);
		s.writeOutput();
		System.out.println();
		
		s.reset("Derf", 3011320);
		s.writeOutput();
		System.out.println();
		
		// Test undergraduate
		Undergraduate u = new Undergraduate("Fred", 9876552, 4);
		Undergraduate u2 = new Undergraduate("Fred", 9876552, 4);
		u.writeOutput();
		System.out.println();
		
		u.reset("Derf", 3011320, 1);
		u.writeOutput();
		System.out.println();
		
		System.out.println(u.equals(u2));
		
		
		Person p = new Person("bob");
		Person p2 = new Person("bob");
		
		System.out.println(p.equals(p2));
		
		InheritanceDemo.compareNumbers(s, s);
	}

	public static void compareNumbers(Student s1, Student s2) {
		if(s1.getStudentNumber() == s2.getStudentNumber()) {
			
		}
	}
}
