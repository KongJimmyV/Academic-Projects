
public class PetDemo {

	public static void main(String[] args) 
	{
		Pet cat = new Pet("Dew", 7, 60);
		System.out.println(cat.toString());
		
		Pet dog = new Pet("Joe", 9, 80);
		System.out.println(dog.toString());
		
		if (cat.equals(dog)) {
			System.out.println("ERROR!");
			System.exit(0);
		}
		
		Pet hamster = new Pet("Dew", 7, 60);
		System.out.println(hamster.toString());
		
		if (!cat.equals(hamster)) {
			System.out.println("ERROR!");
			System.exit(0);
		}
		
		Pet bird = new Pet();
		System.out.println(bird.toString());
		
		Pet snake = new Pet("Ssss");
		System.out.println(snake.toString());
	}

}
