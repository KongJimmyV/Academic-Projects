
public class SinglyLinkedListDemo {

	public static void main(String[] args) {
		SinglyLinkedList friendList = new SinglyLinkedList();
		
		friendList.add("Adam");
		friendList.add("Maggie");
		friendList.add("Zed");
		friendList.add("a");
		friendList.add("b");
		friendList.add("c");
		friendList.add("d");
		friendList.add("e");
		friendList.add("f");
		friendList.add("g");
		
		System.out.println("OnList: " + friendList.onList("a"));
		System.out.println("OnList: " + friendList.onList("z"));
		System.out.println("Length: " + friendList.length());
		friendList.showList();
		
		System.out.println();
		System.out.println(friendList.remove());
		System.out.println(friendList.remove());
		System.out.println(friendList.remove());
		System.out.println(friendList.remove());
		System.out.println(friendList.remove());
		System.out.println(friendList.remove());
		System.out.println(friendList.remove());
		System.out.println(friendList.remove());
		System.out.println(friendList.remove());
		System.out.println(friendList.remove());
		
		System.out.println("OnList: " + friendList.onList("a"));
		System.out.println("OnList: " + friendList.onList("z"));
		System.out.println("Length: " + friendList.length());
		friendList.showList();
		
//		while(!friendList.isEmpty()) {
//			String node = friendList.remove();
//			System.out.println(node + " has been removed.");
//		}
	}

}
