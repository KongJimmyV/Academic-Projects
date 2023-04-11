
public class ListNode {
	private String data;
	private ListNode nextNode;
	
	public ListNode() {
		this.data = null;
		this.nextNode = null;
	}
	
	public ListNode(String data, ListNode nextNode) {
		this.data = data;
		this.nextNode = nextNode;
	}

	public String getData() {
		return this.data;
	}
	
	public void setData(String data) {
		this.data = data;
	}
	
	public ListNode getNextNode() {
		return this.nextNode;
	}
	
	public void setNextNode(ListNode nextNode) {
		this.nextNode = nextNode;
	}
	
}
