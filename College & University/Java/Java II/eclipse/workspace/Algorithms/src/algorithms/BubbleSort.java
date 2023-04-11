package algorithms;

public class BubbleSort {

	public static void main(String[] args) {
		
		int comparisions = 0;
		int swaps = 0;
		
		int[] arr = {6,5,3,2,1};
		
		BubbleSort bSort = new BubbleSort();
		bSort.bubbleSort(arr);
		
		System.out.println();
		System.out.println("SORTED Array");
		System.out.println(bSort.printArr(arr));
		System.out.println();
		
	}
	
	public void bubbleSort(int[] arr) {
		boolean swap = true;
		while(swap) {			// Comparisons.
			swap = false;
			for(int j = 1; j < arr.length; j++) {		// Check arr and swap.
				if(arr[j-1] > arr[j]) {
					int temp = arr[j-1];
					arr[j-1] = arr[j];
					arr[j] = temp;
					swap = true;
				}
			}
		}
	}
	
	public String printArr(int [] arr) {
		String msg = "";
		for(int i = 0; i < arr.length; i++) {
			msg += arr[i] + ", ";
		}
		return msg;
	}
}
