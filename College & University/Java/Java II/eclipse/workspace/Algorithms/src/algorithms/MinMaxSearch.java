package algorithms;


public class MinMaxSearch {

	public static void main(String[] args) {
		MinMaxSearch mms = new MinMaxSearch();
		
		// create an array of random integers.
		int[] arr = {77, 65, 50, 45, 95};
//		Random rand = new Random();
//		for(int i = 0; i < arr.length; i++) {
//			int bound = 100;
//			arr[i] = rand.nextInt(bound);
//			arr[i] = rand.nextInt(bound);
//			arr[i] = rand.nextInt(bound);
//			arr[i] = rand.nextInt(bound);
//			arr[i] = rand.nextInt(bound);
//		}
		
		// find and print the minimum integer.
		int min = mms.findMin(arr);
		System.out.println("Min: " + min);
		
		// find and print the maximum integer.
		int max = mms.findMax(arr);
		System.out.println("Max: " + max);
		
		// find and print the average of all integers.
		double avg = mms.findAvg(arr);
		System.out.println("Average: " + avg);
	}
	
	// find min value in arr
	public int findMin(int[] arr) {
		int min = Integer.MAX_VALUE;
		for(int i = 0; i < arr.length; i++) {
			if(arr[i] < min) {
				min = arr[i];
			}
		}
		
		return min;
	}
	
	// find max value in arr
	public int findMax(int[] arr) {
		int max = Integer.MIN_VALUE;
		for(int i = 0; i < arr.length; i++) {
			if(arr[i] > max) {
				max = arr[i];
			}
		}
		
		return max;
	}
	
	// find average value of arr
	public double findAvg(int[] arr) {
		double sum = 0;
		
		for(int i = 0; i < arr.length; i++) {
			sum += arr[i];
		}
		
		double avg = (double)sum/arr.length;
		return avg;
	}
	
}
