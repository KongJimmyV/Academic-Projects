import java.util.Vector;

public class StackVector<E> {

	private Vector<E> data;
	
	public StackVector() {
		data = new Vector<E>();
	}

	public E pop() {
		return data.remove(0);
	}
	
	public E peek() {
		return data.elementAt(data.size() - 1);
	}
	
	public void push(E o) {
		data.add(0, o);;
	}
	
	public String toString() {
		return data.toString();
	}
	
	public static void main(String[] args) {
		StackVector<String> s = new StackVector<String>();
		
		System.out.println(s.toString());
		
		s.push("1");
		s.push("2");
		s.push("3");
		System.out.println("Stack Vector: " + s.toString());
		
		System.out.println("Pop: " + s.pop());
		System.out.println("Pop: " + s.pop());
		System.out.println("Pop: " + s.pop());
		
		System.out.println("Stack Vector: " + s.toString());
	}
	
}
