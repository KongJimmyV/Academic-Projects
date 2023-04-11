import java.util.LinkedList;

public class LinkedListDemo {

	public static void main(String[] args) {
		LinkedList<String> friendList = new LinkedList<String>();
		
		friendList.add("Adam");
		friendList.add("Maggie");
		friendList.add("Zed");
		
		while(!friendList.isEmpty()) {
			String node = friendList.remove();
			System.out.println(node + " has been removed.");
		}
	}
	
}
