
public class SinglyLinkedList {
	
	private ListNode head;
	
	public SinglyLinkedList() {
		this.head = null;
	}
	
	public void add(String data) {
		ListNode newNode = new ListNode(data, null);
		
		if(this.head == null) {
			this.head = newNode;
			return;
		}
		
		ListNode nextNode = this.head.getNextNode();
		ListNode previousNode = this.head;
		while(nextNode != null) {
			previousNode = nextNode;
			nextNode = nextNode.getNextNode();
		}
		
		previousNode.setNextNode(newNode);
	}
	
	public String remove() {
		ListNode oldHead;
		try {
			oldHead = this.head;
			this.head = this.head.getNextNode();
		} catch (NullPointerException e) {
			String msg = "There is nothing in the list to remove.";
			System.out.println(msg);
			return msg;
		}
		
		return oldHead.getData();
	}
	
	public int length() {
		int nodeCnt = 0;
		ListNode currentNode = this.head;
		while(currentNode != null) {
			nodeCnt++;
			currentNode = currentNode.getNextNode();
		}
		return nodeCnt;
	}
	
	public boolean onList(String target) {
		ListNode currentNode = this.head;
		while(currentNode != null) {
			if(target.equals(currentNode.getData())) {
				return true;
			}
			
			currentNode = currentNode.getNextNode();
		}
		return false;
	}
	
	public void showList() {
		ListNode currentNode = head;
		while(currentNode != null) {
			System.out.print(currentNode.getData());
			System.out.print(" >> ");
			currentNode = currentNode.getNextNode();
		}
	}
}
