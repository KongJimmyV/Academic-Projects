package algorithms;


public class LinearSearch {

	public static void main(String[] args) {
		LinearSearch ls = new LinearSearch();
		
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
		
		// find the desired number at index.
		int target = 95;
		int index = ls.linearSearch(arr, target);
		System.out.println("Target found at index: " + index);
		
	}

	// find target value's index using linear search
	public int linearSearch(int[] arr, int target) {
		for(int i = 0; i < arr.length; i++) {
			if(target == arr[i]) {
				return i;
			}
		}
		
		return -1;
	}
	
}
