import java.util.Random;

public class TestDemo {

	public static void main(String[] args) {
		
		String firstName = "Jimmy";
		String lastName = "Vang";
		
		Demo test = new Demo();
		
		Random r = new Random();
		
		int x = r.nextInt(5);
		int y = r.nextInt(5);
		
		String s1 = String.valueOf(r.hashCode());
		String s2 = String.valueOf(r.hashCode());
		
		System.out.println("concatenate: " + test.concatenate(firstName, lastName));
		System.out.println("multiply: " + test.multiply(x, y));
	}

}
