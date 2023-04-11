import java.util.*;

public class Test {
	
	//test cases
	private int[][] tasks = {{1, 2}, {1,2,3,4,5}, {1,2,3,4,5,6,7}, {1,2,3,4,5,6,7,8,9}, {1,2,3,4,5}};
	private double[][] processingTimes = {{3, 5}, {2.5, 3.6, 1.9, 6.4, 2.2}, {7, 6, 5, 4, 3, 2, 1}, 
			                              {3.4, 6.9, 4.2, 2.4, 9.8, 6.6, 2.2, 8.0, 9.0}, {3,8,5,10,15}};

	public static void main(String[] args) {
		
		Test test = new Test();
		Algorithm algo = new Algorithm();
		
		int[] a = algo.scheduling(test.tasks[1], test.processingTimes[1]);
		//int[] a = algo.scheduling(test.tasks[4], test.processingTimes[4]);
		//int[] a = {1,2,3,4};
		
		System.out.println(Arrays.toString(a));
		
	}
	
	

}
