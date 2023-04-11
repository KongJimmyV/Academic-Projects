package chapter7_02;

/**
 * This class wraps an array of integers as a list and keeps the integers in
 * ascending order. <br>
 * You will implement some basic methods to get use to working with arrays. <br>
 * Your job is to code each of the methods and write a driver class to test each
 * method.
 */
public class OrderedIntArrayList {

	private int intArray[];
	private int size;
	private static final int DEFAULT_CAPACITY = 10;

	/**
	 * Creates an empty list with a given capacity
	 */
	public OrderedIntArrayList(int initialCapacity) {
		intArray = new int[initialCapacity];
		size = 0;
	}

	/**
	 * Default constructor. <br>
	 * Creates an empty list with a capacity of DEFAULT_SIZE <br>
	 * DEFAULT_SIZE is a private static final constant -- you determine the
	 * value
	 */
	public OrderedIntArrayList() {
		this(DEFAULT_CAPACITY);
	}

	/****** Accessors ******/
	public int getSize() {
		return size;
	}

	/**** Custom Methods ****/

	/**
	 * 
	 * @return true if the list is empty; otherwise, false.
	 */
	public boolean isEmpty() {
		return (size == 0);
	}

	/**
	 *
	 * @return true if the list is at capacity.
	 */
	public boolean isFull() {
		return (size == intArray.length);
	}

	/**
	 * Adds the provided number to the list. <br>
	 * The number is inserted into the list at the correct location, as the list
	 * is in ascending order. <br>
	 * Any values after the inserted value are shifted.
	 * 
	 * @param num
	 *            represents the number to be added to the list
	 */
	public void add(int num) {
		// Check if array is full
		if (this.isFull()) {
			// Add room to array
			this.increaseCapacity(1);
		}
		
		// Set the NUM at the end of the INDEX size.
		intArray[size] = num;
		size++;		// Increase size
		
		// Maintain the order by sorting the intArray array
		this.bubbleSort(intArray);
	}

	/**
	 * Removes the specified value from the list if it exists. <br>
	 * Removes multiple occurrences (repeats) of the specified value when
	 * applicable <br>
	 * The resultant "hole" in the list is removed, as the remaining elements
	 * are shifted
	 * 
	 * @param num
	 *            is the integer value to remove from the list.
	 */
	public void removeItem(int num) {
		// Check if array is empty
		if (isEmpty()) {
			// Return nothing if array is empty
			return;
		}
		
		// Pass through all indexes(i) to find NUM.
		for (int i = 0; i < size; i++) {
			
			// Stop loop if the number is larger than num
			if (intArray[i] > num)
				break;
			
			// Is NUM found at index(i)?
			if (intArray[i] == num) {
				
				// .....Shift the array left starting at the current index and ending at the size value of intArray.
				for (int n = i; n < size - 1; n++) {
					intArray[n] = intArray[n + 1];
				}
				
				// .....Decrease size then subtract index 
				// (subtracting the index checks the shifted value to make sure it's not a repeated value of num.)
				size--;
				i--;
			}
		}
		
	}

	/**
	 * Increase the size of the list by the specified value. <br>
	 * The current contents of the list are preserved.
	 * 
	 * @param addCapacity
	 *            represents the number of indices to add to the list
	 */
	public void increaseCapacity(int addCapacity) {
		// create temporary array
		int[] tempArray = new int[intArray.length + addCapacity];
		
		// copy current array to temporary array.
		for (int index = 0; index < size; index++) {
			tempArray[index] = intArray[index];
		}

		// point current Array to new temporary Array.
		intArray = tempArray;
	}

	/**
	 * Loads an array of integers into the list. <br>
	 * The values in the passed in array are added to the current list. <br>
	 * The passed in array does not need to be in order.
	 * 
	 * @param arr
	 *            is an array of integers that will get loaded.
	 */
	public void loadArray(int[] arr) {
		// Increase the capacity by the loaded array arr.
		this.increaseCapacity(arr.length);
		// Load arr into the intArray list.
		int tempSize = size;
		for (int i = tempSize; i < arr.length + tempSize; i++) {
			intArray[i] = arr[i - tempSize];
			size++;
		}
		
		// Maintain the order by sorting the intArray array
		this.bubbleSort(intArray);
	}

	/**
	 * Returns the data in this list as an array. <br>
	 * The array is trimmed to fit the data.
	 */
	public int[] toArray() {
		// Create a new temporary array.
		int[] outputArray = new int[size];
		
		// Set current intArray values into the temporary array.
		for (int i = 0; i < size; i++) {
			outputArray[i] = intArray[i];
		}
		
		// Return the temporary array.
		return outputArray;
	}

	/**
	 * Returns the integer value located at this index. <br>
	 * If index is invalid, -1 is returned
	 */
	public int get(int index) {
		// Check if index is valid
		if (index >= 0 && index < intArray.length) {
			// Return integer value at index, if index is valid.
			return intArray[index];
		} else {
			// Return -1, if index is invalid
			return -1;
		}
	}

	/**
	 * Returns a String representation of the values in the list. <br>
	 * Only the filled portion of the list is output. <br>
	 * For example...
	 * <ul>
	 * <li>intArr[0] = 0</li>
	 * <li>intArr[1] = 100</li>
	 * <li>intArr[2] = 200</li>
	 * <li>...</li>
	 * <li>intArr[9] = 900</li>
	 * <li>intArr[10] = 1000</li>
	 * </ul>
	 */
	public String toString() {
		// return a list of arrays for this class.
		String str = "[";
		for (int i = 0; i < size; i++) {
			if (i != size - 1) {
				str += intArray[i] + ", ";
			} else {
				str += intArray[i];
			}
		}
		str += "]";
		//for (int i = 0; i < intArray.length; i++) {
		//	str += "intArray[" + i + "] = " + intArray[i] + "\n";
		//}
		return str;
	}

	/**
	 * Sort the ordered integer array list using the bubble sort algorithm.
	 * <br>(DEFAULT: in ascending order)
	 * <br>
	 * 
	 */
	private void bubbleSort(int[] arr) {
		// Sort and reorder the array
		int intTemp; 			// Temporary holding variable
		boolean passAgain; 		// This tells the algorithm to do another pass.
		
		// This do-while statement tells the sort to run at least ONCE.
		do {
			// Set passAgain = false (this allows the sorting algorithm to stop if no swap was detected.)
			passAgain = false;
			
			// Start sorting the array.
			for (int index = 0; index < size - 1; index++) {
				// (> for ascending sort)
				// (< for descending sort)
				if (arr[index] > arr[index + 1]) 	// Check if the first index is larger than the second index.
				{
					// Swap Elements.
					intTemp = arr[index]; 				// store first index in intTemp.
					arr[index] = arr[index + 1];	// swap first index with second index.
					arr[index + 1] = intTemp;			// store first index (intTemp) in second index.
					passAgain = true; 						// if a swap occurs, set passAgain = true.
				}
			}
		} while (passAgain == true);			// Run the loop again if passAgain = true.
	}
	
}