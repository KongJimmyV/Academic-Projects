import java.util.ArrayList;

public class WhyGenerics {

	public static void main(String[] args) {
		ArrayList friends = new ArrayList();
		friends.add("Bob");
		friends.add("Sue");
		friends.add(new Integer(55));
		
		for(int i = 0; i < friends.size(); i++) {
			String friend = (String)friends.get(i);
			System.out.println(friend);
		}
	}

}
