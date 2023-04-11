import java.util.ArrayList;
import java.util.Scanner;

public class ShoppingList2 {

	private ArrayList itemList; 
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ShoppingList2 list = new ShoppingList2(5);
		
		list.addItemsToList();
		list.printList();
		
	}

	public ShoppingList2(int initialSize) {
		itemList = new ArrayList(initialSize);
	}
	
	public void addItemsToList() {
		Scanner s = new Scanner(System.in);
		addItemsToList(s, "Y");
	}
	
	private void addItemsToList(Scanner s, String response) {
		while (true) {
			if (response.equalsIgnoreCase("Y")) {
				// keep prompting for items
				break;
			}
			else if (response.equalsIgnoreCase("N")) {
				// stop prompting for items
				return;
			}
			else {
				// ask user to type the correct input
				System.out.println("Invalid Response. Please type \"Y\" or \"N\".\n"
						+ "Add another item to the list? ");
				response = s.nextLine();
			}
		}
		
		System.out.println("Enter the next item to add to the list.");
		
		String item = s.nextLine();
		itemList.add(item);
		
		System.out.println("Add another item to the list? Type \"Y\" or \"N\".");
		response = s.nextLine();
		
		addItemsToList(s, response);
	}
	
	public void printList() {
		System.out.println("\nYour shopping list is...\n");
		for(int i = 0; i < itemList.size(); i++) {
			System.out.printf("Shopping list item %d: %s\n"
					, i , itemList.get(i).toString());
		}
	}
}
