import java.util.*;

public class Test {
	
	//test cases
	private int[][] As = {{0, 1, 2, 3, 4, 5}, 
			                    {8, 7, 6, 5, 4, 3, 2, 1}, 
			                    {1, 3, 2, 9, 10, 5, 4, 8}};

	public static void main(String[] args) {
		
		Test test = new Test();
		Algorithm algo = new Algorithm();
		
		for (int i = 0; i < test.As.length; i++) {
			algo.sort(test.As[i]);
			System.out.println(Arrays.toString(test.As[i]));
		}	
		
		
	}
	
	

}
