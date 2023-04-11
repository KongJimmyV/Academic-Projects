import java.util.ArrayList;
import java.util.Scanner;

//a shopping list which uses a fixed size array
public class ShoppingList2{

	private ArrayList<String> itemList;
	
	public static void main(String[] args){
		ShoppingList2 list = new ShoppingList2(5);
		
		//first, show this working by only adding 5 items
		//next, show the out of array bounds by adding 6 items
		list.addItemsToList();
		list.printList();
		
	}
	
	public ShoppingList2(int initialSize){
		itemList = new ArrayList<String>(initialSize);
	}
	
	//prompt the user for items to add to the list
	//this method errors if we add too many items!
	public void addItemsToList(){
		Scanner s = new Scanner(System.in);
		addItemsToList(s, "Y");		
	}
	
	private void addItemsToList(Scanner s, String response){
		if(!response.equalsIgnoreCase("Y")){
			//stop prompting for items
			return;
		}
		
		System.out.println("Enter the next item to add to the list:");
		
		String item = s.nextLine();
		itemList.add(item);
		
		System.out.println("Add another item to the list(Y/N)?");
		response = s.nextLine();
		
		addItemsToList(s, response);				
	}
	
	public void printList(){
		System.out.println("\nYour shopping list is....");
		for(int i = 0; i < itemList.size(); i++){
			System.out.printf("Shopping List Item %d: %s%n", i, itemList.get(i));
		}
	}
}
