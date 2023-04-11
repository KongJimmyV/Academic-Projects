import java.util.HashSet;
import java.util.Iterator;

public class HashSetDemo {

	public static void main(String[] args) {
		HashSet<String> nameSet = new HashSet<String>();
		nameSet.add("Fred");
		nameSet.add("Sue");
		nameSet.add("Fred");
		nameSet.remove("Fred");
		
		Iterator<String> i = nameSet.iterator();
		while(i.hasNext()) {
			String name = i.next();
			System.out.println(name);
		}
		
	}

}
