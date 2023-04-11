import java.util.HashMap;

public class HashMapDemo {

	public static void main(String[] args) {
		HashMap<String, String> nameSet = new HashMap<String, String>();
		nameSet.put("Fred", "1");
		nameSet.put("Sue", "2");
		nameSet.put("Fred", "3");
		nameSet.remove("Fred", "3");
		
		for(int i = 0; i < nameSet.size(); i++) {
			String name = nameSet.get(i);
			System.out.println(name);
		}
		
	}

}
