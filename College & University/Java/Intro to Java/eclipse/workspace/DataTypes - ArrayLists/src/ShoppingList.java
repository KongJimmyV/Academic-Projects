import java.util.Scanner;

public class ShoppingList {

	private String[] itemList;
	private int size;
	private int CAPACITY_INCREMENT = 10;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ShoppingList list = new ShoppingList(5);
		
		list.addItemsToList();
		list.printList();
		
	}

	public ShoppingList(int initialSize) {
		itemList = new String[initialSize];
		size = 0;
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
		
		if (size >= itemList.length) {
			resizeArray();
		}
		
		System.out.println("Enter the next item to add to the list.");
		
		String item = s.nextLine();
		itemList[size++] = item;
		
		System.out.println("Add another item to the list? Type \"Y\" or \"N\".");
		response = s.nextLine();
		
		addItemsToList(s, response);
	}
	
	private void resizeArray() {
		String[] newArr = new String[itemList.length + CAPACITY_INCREMENT];
		
		for(int i = 0; i < itemList.length; i++) {
			newArr[i] = itemList[i];
		}
		
		itemList = newArr;
	}
	
	public void printList() {
		System.out.println("\nYour shopping list is...\n");
		for(int i = 0; i < size; i++) {
			System.out.printf("Shopping list item %d: %s\n", i , itemList[i]);
		}
	}
}
