import java.util.HashSet;

public class HashSetDemo {

	public static void main(String[] args) {
		HashSet intSet = new HashSet();
		
		intSet.add(2);
		intSet.add(3);
		
		//intSet.contains(2);
		
		if(intSet.contains(2)){
			System.out.println("Found it!");
		}
		/*
		for(int i = 0; i < intSet.size(); i++) {
			Integer num = intSet.;
		}
		*/
	}

}
