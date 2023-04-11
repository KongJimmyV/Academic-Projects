package person;

public class PolymorphismDemo {

	public static void main(String[] args) {
		
		Person[] people = new Person[4];
		people[0] = new Undergraduate("Cotty, Manny", 4910, 1);
		people[1] = new Undergraduate("Kick, Anita", 9931, 2);
		people[2] = new Student("DeBanque, Robin", 8812);
		people[3] = new Undergraduate("Bugg, June", 9901, 4);
		
		for(Person p: people) {
			p.writeOutput();
			System.out.println();
		}
		
		Person sb = people[0];
		Person pat = people[1];
		if(sb.equals(pat)) {
			System.out.println("Yes. (\"" + pat.getName() + "\" DOES EQUAL \"" + sb.getName() + "\")");
		}
		else {
			System.out.println("No. (\"" + pat.getName() + "\" DOES NOT EQUAL \"" + sb.getName() + "\")");
		}
		
		/*
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
		
		InheritanceDemo.compareNumbers(s, s);*/
	}

	public static void compareNumbers(Student s1, Student s2) {
		if(s1.getStudentNumber() == s2.getStudentNumber()) {
			
		}
	}
}
