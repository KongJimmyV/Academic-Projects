package algorithms;
import java.util.Random;

public class BinarySearch {

	public static void main(String[] args) {
		
		BinarySearch binS = new BinarySearch();
		
		int[] arr = {1,3,4,6,7,8,10,13,14};
		int target = 5111;
		
		int index = binS.binarySearch(arr, target);
		
		System.out.println("target " + target + " found at index " + index);
	}
	
    /**
     * Search a particular array, {@code arr}, for a target value.
     * 
     * @param arr - The array to search in.
     * @param target - The target value to find in the array.
     * @return Returns the index of {@code arr} that contains the target 
     *              value. Otherwise, return -1 if the target is not found.
     */
	public int binarySearch(int[] arr, int target) {
		
		if(target > arr[arr.length - 1]) {
			System.out.println("Target not found. Returning index -1.");
			return -1;
		}
		if(target < arr[0]) {
			System.out.println("Target not found. Returning index -1.");
			return -1;
		}
		
		int lowerbound = 0;
		int upperbound = arr.length - 1;
		int middlebound = (lowerbound + upperbound)/2;
		
		while(target != arr[middlebound]) {
			if(lowerbound > upperbound) {
				System.out.println("Target not found. Returning index -1.");
				return -1;
			}
			
			if (target < arr[middlebound]) {
				upperbound = middlebound - 1;
				middlebound = (lowerbound + upperbound)/2;
			}
			else if (target > arr[middlebound]) {
				lowerbound = middlebound + 1;
				middlebound = (lowerbound + upperbound)/2;
			}
			else if (target == arr[middlebound]) {
				return middlebound;
			}
			else {
				System.out.println("An UNEXPECTED ERROR has occured.");
				System.exit(0);
			}
		}
		
		return middlebound;
	}
}
