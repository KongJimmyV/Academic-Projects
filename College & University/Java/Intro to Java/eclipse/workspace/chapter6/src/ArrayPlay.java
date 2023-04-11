import java.util.Random;

////////////////////////////////////////////////////////////////////
/**
* 		This class file is for: <b>	Lab 07_03 -- Chapter 07 – Sortation and Multidimensional Arrays</b>.
* <br>
* <br>	File Name:		ArrayPlay.java
* <br>	Created by: 	Jimmy Vang
* <br>	Date:			Nov 7, 2016 (11/7/2016)
* <br>
* 
*/
////////////////////////////////////////////////////////////////////

// ******************************************************************
// ====================== CLASS FILE BEGINNING ======================
public class ArrayPlay {
	
	//***************************************************************
	public static void main(String[] args) {
		System.out.println("*** START ArrayPlay.java ***");
		System.out.println();
		
		// Create random generator object
		Random rand = new Random();  	
	
		
		//***********************************************************
		//=== Bubble Sort ===
		// Create an array with 10 indexes.
		int[] intArray = new int[10];  	
		
		// Generate random numbers for the array.
		for (int i = 0; i < intArray.length; i++) {  	
			intArray[i] = rand.nextInt(9);
		}
	
		//--- Outputs of the current array ---
		// title
		System.out.println("_____________________________________________________________________\n");
		System.out.println("== Bubble Sort Test ==");
		
		// print the unsorted array
		System.out.print("Unsorted:\t");
		printArray(intArray);		
		System.out.println("");
		
		// sort and print the sorted array
		bubbleSort(intArray);
		System.out.print("Sorted:\t\t");
		printArray(intArray);		
		System.out.println("");
		
		// check if the array is sorted.
		checkIfSorted(intArray);
		System.out.println("");
		
		//***********************************************************
		//=== Selection Sort ===
		// Create an array with 10 indexes.
		int[] intArray2 = new int[10];  	
		
		// Generate random numbers for the array.
		for (int i = 0; i < intArray2.length; i++) {  	
			intArray2[i] = rand.nextInt(9);
		}
		
		//--- Outputs of the current array ---
		// title
		System.out.println("_____________________________________________________________________\n");
		System.out.println("== Selection Sort Test ==");
		
		// print the unsorted array
		System.out.print("UNSORTED:\t");
		printArray(intArray2);		
		System.out.println("");
		
		// sort and print the sorted array
		selectionSort(intArray2);
		System.out.print("SORTED:\t\t");
		printArray(intArray2);		
		System.out.println("");
		
		// check if the array is sorted.
		checkIfSorted(intArray2);
		System.out.println("");
		
		//***********************************************************
		//=== Descending Sort (w/Insertion Sort) ===
		// Create an array with 10 indexes.
		int[] intArray3 = new int[10];  	
		
		// Generate random numbers for the array.
		for (int i = 0; i < intArray3.length; i++) {  	
			intArray3[i] = rand.nextInt(9);
		}
		
		//--- Outputs of the current array ---
		// title
		System.out.println("_____________________________________________________________________\n");
		System.out.println("== Descending Sort Test (using Insertion Sort) ==");
		
		// print the unsorted array
		System.out.print("UNSORTED:\t");
		printArray(intArray3);		
		System.out.println("");
		
		// sort and print the sorted array
		insertionSort(intArray3);
		System.out.print("SORTED:\t\t");
		printArray(intArray3);		
		System.out.println("");
		
		// check if the array is sorted.
		checkIfSorted(intArray3);
		System.out.println("");
		
		//***********************************************************
		//=== MultiDimensional Array (Roach Population Growth) ===
		// Line Block
		System.out.println("_____________________________________________________________________\n");
		System.out.println("== MultiDimensional Array ==");
		
		// Define array variables.
		int[] initialPop = new int[5];
		initialPop[0] = 10;
		initialPop[1] = 100;
		initialPop[2] = 500;
		initialPop[3] = 1000;
		initialPop[4] = 5000;
		
		// Create Multi-Dimensional array.
		int[][] mDArray = new int[10][5];
		
		// Setup Array with arithmetic.
		for (int row = 0; row < mDArray.length; row++) {
			for (int col = 0; col < mDArray[row].length; col++) {
				
				// Define other array local variables
				int lastPop = 0;
				int currentPop = 0;
				
				// If we're on the first row, setup the initial population.
				if (row == 0) {
					// Initialize populations in the current row.
					lastPop = initialPop[col];
					// Set current pop to 0.
					currentPop = 0;
				} 
				// If we're not on the first row, do arithmetic for the roach population.
				else {
					// Get population from the last row in the current column.
					lastPop = mDArray[row-1][col];
					// Set current pop equal to the last pop.
					currentPop = lastPop;
				}
				
				// Double the array by adding current pop and last pop then store the result.
				mDArray[row][col] = currentPop + lastPop;
			}
		}
		
		// Print mDArray as a table with this printing algorithm. 
		// (This algorithm does not work well with numbers greater than 1,000,000.)
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println("______++++++++++++++++ ROACH POPULATION GROWTH ++++++++++++++++______");
		
			print2DArray(mDArray);	// start printing
			
		System.out.println("_____________________________________________________________________");
		System.out.println("_____________________________________________________________________");
		
		// The program finishes here.
		System.out.println();
		System.out.println("*** FINSH ***");
	//***************************************************** END OF MAIN
	}
	
// Methods for the class file starts here.
// *****************************************************
// ********************** METHODS **********************
	/**
	 * Sort an integer array list using the bubble sort algorithm.
	 * <br>(DEFAULT: in ascending order)
	 * <br>
	 * 
	 * 
	 */
	private static void bubbleSort(int[] arr) {
		
		// Sort ascending?
		boolean ascendingSort = true;
		
		//***Ascending Sort***
		if (ascendingSort == true) {
			// Run bubbleSort loop for (n-1) times.
			for(int i = 0; i < arr.length - 1; i++) {
				// Pick element at (j) and swap with element (j+1).
				for(int j = 0; j < arr.length - 1; j++) {
					if(arr[j+1] < arr[j]) {		// < for ascending sort, > for descending sort.
						// Swap elements
						int temp = arr[j];
						arr[j] = arr[j+1];
						arr[j + 1] = temp;
					}
				}
			}
		}
		
		//***Descending Sort***
		else {
			// Run bubbleSort loop for (n-1) times.
			for(int i = 0; i < arr.length - 1; i++) {
				// Pick element at (j) and swap with element (j+1).
				for(int j = 0; j < arr.length - 1; j++) {
					if(arr[j+1] > arr[j]) {		// < for ascending sort, > for descending sort.
						// Swap elements
						int temp = arr[j];
						arr[j] = arr[j+1];
						arr[j + 1] = temp;
					}
				}
			}
		}
		
		//
	}
	
	/**
	 * Sort an integer array list using the selection sort algorithm.
	 * <br>(DEFAULT: in ascending order)
	 * <br>
	 * 
	 * <br>Returns nothing.<br>
	 */
	private static void selectionSort(int[] arr) {
		
		// Sort ascending?
		boolean ascendingSort = true;
		
		int min;  		// Create a min element variable.
		int max;  		// Create a max element variable.
		
		//***Ascending Sort***
		if (ascendingSort == true) {
			// Check all elements of the array
			for(int i = 0; i < arr.length - 1; i++) {
				// select a min equal to the first unsorted element.
				min = i;
				// check element (i+1 or j)
				for (int j = i + 1; j < arr.length; j++) {
					if (arr[j] < arr[min]) {  // < for ascending sort, > for descending sort.
						min = j;
					}
				}
				
				// Check if the first unsorted element is still the minimum element.
				if (min != i) {
					// Swap elements
					int temp = arr[min];
					arr[min] = arr[i];
					arr[i] = temp;
				}
			}
		}
		
		//***Descending Sort***
		else {
			// Check all elements of the array
			for (int i = 0; i < arr.length - 1; i++) {
				// select a max equal to the first unsorted element.
				max = i;
				for (int j = i + 1; j < arr.length; j++) {
					if (arr[j] > arr[max]) {  // < for ascending sort, > for descending sort.
						max = j;
					}
				}

				// Check if the first unsorted element is still the minimum element.
				if (max != i) {
					// Swap elements
					int temp = arr[max];
					arr[max] = arr[i];
					arr[i] = temp;
				}
			}
		}
		
		//
	}
	
	/**
	 * Sort an integer array list using the insertion sort algorithm.
	 * <br>(DEFAULT: in descending order)
	 * <br>
	 * 
	 * <br>Returns nothing.<br>
	 */
	private static void insertionSort(int[] arr) {
		
		// Sort ascending?
		boolean ascendingSort = false;
		
		//***Ascending Sort***
		if (ascendingSort == true) {
			for (int i = 0; i < arr.length; i++) {
				int element = arr[i];
				int j = i;
				while (j > 0 && arr[j - 1] > element) {
					arr[j] = arr[j - 1];
					j = j - 1;
				}
				arr[j] = element;
			}
		}
		
		//***Descending Sort***
		else {
			for (int i = 0; i < arr.length; i++) {
				int element = arr[i];
				int j = i;
				while (j > 0 && arr[j - 1] < element) {
					arr[j] = arr[j - 1];
					j = j - 1;
				}
				arr[j] = element;
			}
		}
		
	}
	
	/**
	 * Returns a String representation of the values in an integer array list. <br>
	 * Only the filled portion of the list is output. <br>
	 * For example...
	 * <ul>
	 * <li>[7, 2, 5, 3, 7, 4, 3]
	 * </ul>
	 * 
	 * Returns nothing.<br>
	 */
	private static void printArray(int[] arr) {
		//print
		String str = "[";
		for (int i = 0; i < arr.length; i++) {
			if (i != arr.length - 1) {
				str += arr[i] + ", ";
			} else {
				str += arr[i];
			}
		}
		str += "]";
		System.out.print(str);
	}
	
	/**
	 * Returns a String representation in a 2D Array <br><br>
	 * 
	 * This is hard-coded to represent a roach's population growth.<br>
	 * Only the filled portion of the 2D Array is output. <br><br>
	 * 
	 * For example... 
	 * (WARNING: the table below may not display correctly in Javadoc.)<br>
	 * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++<br>
	 * ______++++++++++++++++ ROACH POPULATION GROWTH ++++++++++++++++______<br>
	 *  |__|	Week	|Pop: 1	Pop: 2	Pop: 3	Pop: 4	Pop: 5			|__|<br>
	 *  |__|	0 		|10		100		500		1000	5000			|__|<br>
	 *  |__|	1 		|20		200		1000	2000	10000			|__|<br>
	 *  |__|	2 		|40		400		2000	4000	20000			|__|<br>
	 *  |__|	3 		|80		800		4000	8000	40000			|__|<br>
	 *  |__|	4 		|160	1600	8000	16000	80000			|__|<br>
	 *  |__|	5 		|320	3200	16000	32000	160000			|__|<br>
	 *  |__|	6 		|640	6400	32000	64000	320000			|__|<br>
	 *  |__|	7 		|1280	12800	64000	128000	640000			|__|<br>
	 *  |__|	8 		|2560	25600	128000	256000	1280000			|__|<br>
	 *  |__|	9 		|5120	51200	256000	512000	2560000			|__|<br>
	 * _____________________________________________________________________<br>
	 * _____________________________________________________________________<br>
	 * <br>
	 * 
	 * This method returns nothing.<br>
	 */
	private static void print2DArray(int[][] arr) {

		// Print arr as a table with this printing algorithm. 
		// (This algorithm does not work well with numbers greater than 1,000,000.)
		
		// Print a TAB and "Week".
		//
		// Example:		|__|	Week
		//
		System.out.print(" |__|\tWeek\t|");
		
		// Print "Pop: 1" to "Pop: 5".
		//
		// Example: 	|__|	Week   |Pop: 1	Pop: 2	Pop: 3	Pop: 4	Pop: 5
		//
		for (int i = 0; i < arr[0].length; i++) {
			System.out.print("Pop: " + (i+1) + "\t");
		}
		
		// Print "|__|" decoration. 
		//
		// Example: 	|__|	Week   |Pop: 1	Pop: 2	Pop: 3	Pop: 4	Pop: 5		|__|
		//
		System.out.println("\t|__|");
		
		// Print the rest of the table by doing the following...
		for (int i = 0; i < arr.length; i++) {
			// Print index (row) of the week from 0-9.
			//
			// Example: 	|__|	0		|
			//				|__|	1		|
			//				|__|	2		|
			//				|__|	3		|
			//						etc...
			//
			System.out.print(" |__|\t" + (i) + " \t|");
			
			// Print population value from the Array.
			//
			//	Example:	|Pop: 1	Pop: 2	Pop: 3	etc...
			//				|10		100		500		etc...
			//				|20		200		1000	etc...
			//				|40		400		2000	etc...
			//				etc...	etc...	etc...	etc...
			//
			for (int j = 0; j < arr[i].length; j++) {
				System.out.printf("%d\t", arr[i][j]);
			}
			
			// Print "|__|" decorations on the right side. 
			//
			//	Example:	Week   |Pop: 1	Pop: 2	Pop: 3	Pop: 4	Pop: 5		|__|
			//																	|__|
			//																	|__|
			//																	etc...
			//
			System.out.println("\t|__|");
		}
		// End of printing the Array.
	}
	/**
	 * Checks if an integer array is sorted.<br>
	 * Returns true if sorted, false if unsorted.
	 */
	private static boolean checkIfSorted(int[] arr) {
		
		// boolean variables for ascending and descending statements.
		boolean ascending = false;
		boolean descending = false;
		
		// Check every element and...
		for (int i = 0; i < arr.length - 1; i++) {
			// ...Compares 2 elements (i and i+1) and check for an ascending sort pattern.
			if (arr[i] < arr[i + 1]) {		
				ascending = true;
			}
			// ...Compares 2 elements (i and i+1) and check for a descending sort pattern.
			if (arr[i] > arr[i + 1]) {		
				descending = true;
			}
		}
		
		// Output the results.
		if (ascending == true && descending == false) {
		// The array is sorted in ascending order.
			System.out.println("***TEST SUCCESSFUL*** The array is sorted. (Ascending)");
			return true;
		}
		else if (ascending == false && descending == true) {
		// The array is sorted in descending order.
			System.out.println("***TEST SUCCESSFUL*** The array is sorted. (Descending)");
			return true;
		}
		else if (ascending == true && descending == true) {
		// The array cannot be sorted in both directions.
			System.out.println("***TEST FAILED*** The array is unsorted!");
			System.exit(0);
			return false;
		}
		else {
		// The array must be sorted in either ascending or descending order.
			System.out.println("***TEST FAILED*** The array is unsorted!");
			System.exit(0);
			return false;
		}
	}
	
	
//*********************************************************** END OF CLASS FILE
}
