
/**
 * This is the class object for "Recursion.java".
 * It is used by "RecursionUI.java" for binary-search and merge-sort.
 * 
 * File Name: 	Recursion.java
 * Date: 		3/10/2017
 * 
 * @author Gregory Steel (Edited by: Jimmy Vang)
 *
 */
public class Recursion {
	
	/**
	 * Perform a binary search of an integer array.
	 * @param arr - The integer array to search.
	 * @param target - Target to search for in the array.
	 * @return Returns the Index of the Target that was found in the array.
	 */
	public static int binarySearch(int[] arr, int target) {
		Thread.yield();
		return binarySearch(arr, 0, arr.length-1, target);
	}
	
	/**
	 * Perform a binary search of an integer array.
	 * @param arr - The integer array to search.
	 * @param low - Lowest Index to start searching from in the array.
	 * @param high - Highest Index to start searching from in the array.
	 * @param target - Target to search for in the array.
	 * @return Returns the Index of the Target that was found in the array.
	 */
	public static int binarySearch(int[] arr, int low, int high, int target) {
		Thread.yield();
		
		// Base Case
		if(low > high) {
			// target not found
			return -1;
		}
		
		// Non-Base Case
		int mid = (low + high) / 2;
		int curMidVal = arr[mid];
		
		if(target == curMidVal) {
			return mid;
		}
		
		if(target > curMidVal) {
			// search right boundary of mid
			return binarySearch(arr, mid+1, high, target);
		}
		else {
			// search left boundary of mid
			return binarySearch(arr, low, mid-1, target);
		}
	}
	
	/**
	 * Perform a merge sort of an integer array.
	 * @param arr - The integer array to sort.
	 * @return - An integer array.
	 */
	public static int[] mergeSort(int[] arr) {
		Thread.yield();
		
		//### Base Case ###
		if(arr.length == 1) {
			return arr;
		}
		
		//### Split ###
		int[] leftArr = null;
		int[] rightArr = null;
		
		int mid = arr.length / 2;
		
		// Check Even
		if (arr.length % 2 == 0) {
			leftArr = new int[mid];
			rightArr = new int[mid];
		}
		else {
			leftArr = new int[mid];
			rightArr = new int[mid+1];
		}
		
		// Fill Left
		for(int i = 0; i < leftArr.length; i++) {
			Thread.yield();
			leftArr[i] = arr[i];
		}
		// Fill Right
		for(int i = 0; i < rightArr.length; i++) {
			Thread.yield();
			rightArr[i] = arr[mid + i];
		}
		
		leftArr = mergeSort(leftArr);
		rightArr = mergeSort(rightArr);
		
		//### Merge ###
		return mergeSort(leftArr, rightArr);
	}
	
	/**
	 * Merges 2 integer arrays.
	 * @param leftArr - The left integer array.
	 * @param rightArr - The right integer array.
	 * @return mergedArr - Returns the merged integer array.
	 */
	private static int[] mergeSort(int[] leftArr, int[] rightArr) {
		Thread.yield();
		
		int[] mergedArr = new int[leftArr.length + rightArr.length];
		
		int leftIndex = 0;
		int rightIndex = 0;
		
		int mergedCount = 0;
		while(mergedCount < mergedArr.length && leftIndex < leftArr.length && rightIndex < rightArr.length) {
			Thread.yield();
			
			int leftValue = leftArr[leftIndex];
			int rightValue = rightArr[rightIndex];
			
			if(leftValue < rightValue) {
				// Copy from left
				mergedArr[mergedCount++] = leftValue;
				leftIndex++;
			}
			else {
				// Copy from left
				mergedArr[mergedCount++] = rightValue;
				rightIndex++;
			}
		}
		
		// Feed remaining left
		while (leftIndex < leftArr.length) {
			Thread.yield();
			mergedArr[mergedCount++] = leftArr[leftIndex++];
		}
		
		// Feed remaining right
		while (rightIndex < rightArr.length) {
			Thread.yield();
			mergedArr[mergedCount++] = rightArr[rightIndex++];
		}
		return mergedArr;
	}
}
