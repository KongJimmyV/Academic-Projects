import java.util.ArrayList;

public class Test {

	public static void main(String[] args) {
		
		//
		Breed goldenRetriever = new Breed("Golden Retriever");
		Breed blackLab = new Breed("Black Lab");
		Breed brittanySpaniel = new Breed("Brittany Spaniel");
		
		//
		Owner greg = new Owner("Gregory", "Steele");
		Owner jimmy = new Owner("Jimmy", "Vang");
		Owner swift = new Owner("Swift", "Justice");
		
		//
		Dog sam = new Dog("Sam", greg, brittanySpaniel);
		System.out.println("___\\\\ CHECK SAM'S BREED \\\\___");
		String msg = "Sam's breed is " + sam.getBreed().getName() + ".";
		System.out.println(msg);
		
		//
		ArrayList dogList = brittanySpaniel.getDogsList();
		System.out.println();
		System.out.println("___\\\\ DOG LIST \\\\___");
		for (Object o : dogList) {
			Dog nextDog = (Dog)o;
			System.out.println("\t" + nextDog.getName());
		}
		
		//
		sam.addOwner(jimmy);
		ArrayList ownerList = sam.getOwnersList();
		System.out.println();
		System.out.println("___\\\\ SAM'S OWNER LIST \\\\___");
		for (Object o : ownerList) {
			Owner nextOwner = (Owner)o;
			System.out.println("\t" + nextOwner.getFirstName() + " " + nextOwner.getLastName());
		}
	}

}
