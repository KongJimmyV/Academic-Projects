import java.util.Scanner;

//a shopping list which uses a fixed size array
public class ShoppingList{

	private String[] itemList;
	private int size; //used to keep track of the used elements
	
	public static void main(String[] args){
		ShoppingList list = new ShoppingList(5);
		
		//first, show this working by only adding 5 items
		//next, show the out of array bounds by adding 6 items
		list.addItemsToList();
		list.printList();
		
	}
	
	public ShoppingList(int initialSize){
		itemList = new String[initialSize];
		size = 0;
	}
	
	private void resizeArray() {
		String[] tempArr = new String[itemList.length * 2];
		
		for(int i = 0; i < itemList.length; i++) {
			tempArr[i] = itemList[i];
		}
		
		itemList = tempArr;
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
		
		if(size >= itemList.length) {
			resizeArray();
		}
		
		System.out.println("Enter the next item to add to the list:");
		
		String item = s.nextLine();
		itemList[size++] = item;
		
		System.out.println("Add another item to the list(Y/N)?");
		response = s.nextLine();
		
		addItemsToList(s, response);				
	}
	
	public void printList(){
		System.out.println("\nYour shopping list is....");
		for(int i = 0; i < size; i++){
			System.out.printf("Shopping List Item %d: %s%n", i, itemList[i]);
		}
	}
}
