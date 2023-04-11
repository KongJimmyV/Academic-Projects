package algorithms;

public class InsertionSort {

	public static void main(String[] args) {
		/****** Demo here. ******/
		int[] arr = {9,3,7,6,8,1,5,2,4,0};						// Test Array
		
		InsertionSort is = new InsertionSort();			// Selection Sort Object
		
		System.out.println("*** Insertion Sort ***");	// Title
		System.out.println("------------------------");
		
		// Print Unsorted Array
		System.out.print("Unsorted Array: \n");
		is.printArray(arr);
		
		// Print sorted array.
		System.out.print("Sorted Array: \n");
		is.insertionSort(arr);
		is.printArray(arr);
	}
	
	public void insertionSort(int[] arr) {
		// Create Variables here.
		for(int i = 1; i < arr.length; i++) {
			
			int selectedValue = arr[i];
			
			int j = i;
			while(j >=1 && arr[j-1] > selectedValue) {
				arr[j] = arr[j-1];
				//printArray(arr);
				j--;
			}
			
			// Insert selectedValue into home.
			arr[j] = selectedValue;
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
