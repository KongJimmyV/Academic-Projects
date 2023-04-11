package algorithms;

public class SelectionSort {

	public static void main(String[] args) {
		/****** Demo here. ******/
		int[] arr = {50,-50,50,-50,10,-10,10,-10,20,-20,20,-20};						// Test Array
		
		SelectionSort ss = new SelectionSort();			// Selection Sort Object
		
		System.out.println("*** Selection Sort ***");	// Title
		System.out.println("------------------------");
		
		// Print Unsorted Array
		System.out.print("Unsorted Array: \n");
		ss.printArray(arr);
		
		// Print sorted array.
		System.out.print("Sorted Array: \n");
		ss.selectionSort(arr);
		ss.printArray(arr);
	}
	
	// sort an array using selection sort
	public void selectionSort(int[] arr) {
		// Create Variables here.
		int smallestIndex = Integer.MAX_VALUE;
		
		// For all the values in this loop.
		for(int i = 0; i < arr.length; i++) {
			
			// Initiate "smallestIndex" as "i".
			smallestIndex = i;
			
			// Find the smallest index in this nested-loop.
			for(int j = i; j < arr.length; j++) {
				if(arr[j] < arr[smallestIndex]) {
					smallestIndex = j;
				}
			}
			
			// Swap "i" and "smallestIndex".
			int temp = arr[i];
			arr[i] = arr[smallestIndex];
			arr[smallestIndex] = temp;
		}
	}
	
	public void printArray(int[] arr) {
		// Print array here, using a special algorithm.
		System.out.print("(");		// Opening Bracket
		
		// Array is printed using "for-loop" and "System.out".
		for(int i = 0; i < arr.length; i++) {
			if(i < arr.length - 1) {
				System.out.print( arr[i] + ", ");
			}
			else {
				System.out.print( arr[i]);
			}
			
		}
		
		System.out.println(")");	// Closing Bracket
	}

}
