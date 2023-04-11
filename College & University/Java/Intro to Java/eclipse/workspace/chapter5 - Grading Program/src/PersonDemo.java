import java.util.Scanner;

public class PersonDemo {

	private static Scanner s;

	public static void main(String[] args) {
		Person person = new Person();
		
		s = new Scanner(System.in);
		
		System.out.println("------------------------------------------------");
		System.out.println("What is your first name:");
		person.setFirstName(s.nextLine());
		
		System.out.println("What is your last name?");
		person.setLastName(s.nextLine());
		
		System.out.println("What is your age?");
		while (!s.hasNextInt()) {
			System.out.println("\nPlease retype value in age.");
			s.next();
		}
		person.setAge(s.nextInt());
		
		System.out.println(person.toString());
	}

}
