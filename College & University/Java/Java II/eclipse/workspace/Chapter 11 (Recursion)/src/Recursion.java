
public class Recursion {

	public static void main(String[] args) {
		try {
			//#############################
			//###### Count-down Test ######
			System.out.println("#############################"
							+ "\n###### Countdown Test ######");
			
			countDown(10);
			
			System.out.println();
			
			//#################################
			//###### Digit To Words Test ######
			System.out.println("################################# "
							+ "\n###### Digit To Words Test ###### ");
			
			digitsToWords(12);
			
			System.out.println();
			
			//#############################
			//###### Zero Count Test ######
			System.out.println("#############################"
							+ "\n###### Zero Count Test ######");
			
			System.out.println(getZeroCount(10203001));
			
			//################################
			//###### Binary Search Test ######
			System.out.println("################################"
							+ "\n###### Binary Search Test ######");
			
			// Create arr
			int[] arr = {1,3,5,8,2,4,7,6,10,9};
			
			// Target is in arr
			int target = 5;
			int index = binarySearch(arr, target);
			System.out.println("Target found at index: " + index);
			
			// Target is not in arr
			target = 55;
			index = binarySearch(arr, target);
			System.out.println("Target found at index: " + index);
			
			//############################
			//###### Fibonacci Test ######
			System.out.println("############################"
							+ "\n###### Fibonacci Test ######");
			
			for (int i = 0; i < 10; i++) {
				System.out.println(fibonacci(i) + " ");
			}
			
			for (int i = 0; i < 10; i++) {
				System.out.println(fibonacciLoop(i) + " ");
			}
			
			System.out.println("GCD: " + gcd(9, 144));
			
			//#############################
			//###### Merge Sort Test ######
			System.out.println("#############################"
							+ "\n###### Merge Sort Test ######");
			
			int[] arr2 = {7,1,3,5,4,2,6,7,4,3,2,2,1,14};
			for (int i = 0; i < arr2.length; i++) {
				System.out.print(arr2[i] + " ");
			}
			
			System.out.println();
			arr2 = mergeSort(arr2);
			for (int i = 0; i < arr2.length; i++) {
				System.out.print(arr2[i] + " ");
			}
		} 
		catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}

	/**
	 * Turn one digit into one word.
	 * @param num - The digit that will turn into one word.
	 * @return - Returns one word (returns a String).
	 * @throws Exception
	 */
	public static String digitToWord(int num) throws Exception {
		if(num > 9 ){
			throw new NumberFormatException("Must be less then 10");
		}
		
		switch (num) {
		case 0:
			return "zero";
		case 1:
			return "one";
		case 2:
			return "two";
		case 3:
			return "three";
		case 4:
			return "four";
		case 5:
			return "five";
		case 6:
			return "six";
		case 7:
			return "seven";
		case 8:
			return "eight";
		case 9:
			return "nine";
		default:
			throw new NumberFormatException("Bad Number");
		}
		
	}
	
	/**
	 * Turn multiple digits into words.
	 * @param num - Initial digits to turn into words.
	 * @throws Exception
	 */
	public static void digitsToWords(int num) throws Exception {
		// base case
		if(num <= 10) {
			System.out.print(digitToWord(num) + " ");
			return;
		}
		
		int rem = num % 10;
		num = num / 10;
		digitsToWords(num);
		
		System.out.print(digitToWord(rem) + " ");
	}
	
	/**
	 * Count down using recursion.
	 * @param num - Initial starting number.
	 */
	public static void countDown(int num) {
		int target = 0;
		
		// base case
		if(num == target) {
			System.out.print(num + " ");
			return;
		}
		
		else if(num >= target) {
			System.out.print(num + " ");
			num--;
			countDown(num);
		}
		
		else if(num <= target) {
			System.out.print(num + " ");
			num++;
			countDown(num);
		}
		
		else {
			System.err.println("ERROR: This message should not of popped up.");
		}
		
	}
	
	/**
	 * Get the count of zeros in the provided number.
	 * @param num - The number to look for and count zeros.
	 * @return result - The amount of zeros in the number.
	 */
	public static int getZeroCount(int num) {
		// our base case
		if (num < 10) {
			if (num == 0) {
				return 1;
			}
			return 0;
		}
		
		// Get lsd(Least Significant Digit) using %(modulus).
		int lsd = num % 10;
		num = num / 10;
		if(lsd == 0) {
			int result = 1 + getZeroCount(num);
			return result;
		}
		else {
			int result = 0 + getZeroCount(num);
			return result;
		}
	}
	
	/**
	 * Return the fibonacci number that corresponds to the number "num".
	 * "num" is the index of the fibonacci number.
	 * 
	 * @param num - Index of fibonacci number.
	 * @return fib - Fibonacci number value.
	 */
	public static int fibonacci(int num) {
		// Base Case
		if (num < 2) {
			return num;
		}
		
		// Non-Base Case
		return fibonacci(num - 1) + fibonacci(num - 2);
	}
	
	//TODO:
	public static int fibonacciLoop(int num) {
		if (num < 2) {
			return num;
		}
		
		int fib = 0;
		for (int i = num; i <= num; i++)
		{
			fib = i-1 + i-2;
		}
		return fib;
	}
	
	/**
	 * Get the Greatest Common Denominator or GCD from 2 numbers.
	 * @param num1 - Number 1
	 * @param num2 - Number 2
	 * @return gcd - the GCD of numbers 1 and 2.
	 */
	public static int gcd(int num1, int num2) {
		// Base Case
		if (num1 == num2) {
			return num1;
		}
		
		if(num1 < num2) {
			return gcd(num2,num1);
		}
		
		int delta = num1-num2;
		return gcd(delta,num2);
	}
	/**
	 * Perform a binary search of an integer array.
	 * @param arr - The integer array to search.
	 * @param target - Target to search for in the array.
	 * @return Returns the Target that was found in the array.
	 */
	public static int binarySearch(int[] arr, int target) {
		return binarySearch(arr, 0, arr.length-1, target);
	}
	
	/**
	 * Perform a binary search of an integer array.
	 * @param arr - The integer array to search.
	 * @param low - Lowest Index to start searching from in the array.
	 * @param high - Highest Index to start searching from in the array.
	 * @param target - Target to search for in the array.
	 * @return Returns the Target that was found in the array.
	 */
	public static int binarySearch(int[] arr, int low, int high, int target) {
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
		else if(target < curMidVal) {
			// search left boundary of mid
			return binarySearch(arr, low, mid-1, target);
		}
		else {
			// search right boundary of mid
			return binarySearch(arr, mid+1, high, target);
		}
	}
	
	/**
	 * Perform a merge sort of an integer array.
	 * @param arr - The integer array to sort.
	 * @return - An integer array.
	 */
	public static int[] mergeSort(int[] arr) {
		// Base Case
		if(arr.length == 1) {
			return arr;
		}
		
		// Split
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
			leftArr[i] = arr[i];
		}
		// Fill Right
		for(int i = 0; i < rightArr.length; i++) {
			rightArr[i] = arr[mid + i];
		}
		
		leftArr = mergeSort(leftArr);
		rightArr = mergeSort(rightArr);
		
		return mergeSort(leftArr, rightArr);
	}
	
	/**
	 * Merges 2 integer arrays.
	 * @param leftArr - The left integer array.
	 * @param rightArr - The right integer array.
	 * @return mergedArr - Returns the merged integer array.
	 */
	private static int[] mergeSort(int[] leftArr, int[] rightArr) {
		int[] mergedArr = new int[leftArr.length + rightArr.length];
		
		int leftIndex = 0;
		int rightIndex = 0;
		
		int mergedCount = 0;
		while(mergedCount < mergedArr.length && leftIndex < leftArr.length && rightIndex < rightArr.length) {
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
			mergedArr[mergedCount++] = leftArr[leftIndex++];
		}
		
		// Feed remaining right
		while (rightIndex < rightArr.length) {
			mergedArr[mergedCount++] = rightArr[rightIndex++];
		}
		return mergedArr;
	}
}
