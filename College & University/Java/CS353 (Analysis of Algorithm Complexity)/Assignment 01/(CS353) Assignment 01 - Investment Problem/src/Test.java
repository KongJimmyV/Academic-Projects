import java.util.*;

public class Test {
	
	//test cases
	private int[][] benefits = {{0, 11, 12, 13,14, 15}, 
			                    {0, 0, 5, 10, 15, 20}, 
			                    {0, 2, 10, 30, 32, 40}, 
			                    {0, 20, 21, 22, 23, 24}};

	public static void main(String[] args) {
		
		Test test = new Test();
		Algorithm algo = new Algorithm();
		
		int[] a = algo.investment(5, test.benefits);	
		System.out.println(Arrays.toString(a));
		
		
	}
	
	

}
