
public class BubbleSort {

	public static void main(String[] args) {

		String str = "";
		int[] arr = {6,5,3,1,2};
		
		for(int i = 0; i < arr.length - 1; i++) {
			for(int j = 1; j < arr.length; j++) {
				if(arr[j-1] > arr[j]) {
					//swap
					int tmp = arr[j];
					arr[j] = arr[j-1];
					arr[j - 1] = tmp;
				}
			}
		}
		
		//print
		str = "[";
		for (int i = 0; i < arr.length; i++) {
			if (i != arr.length - 1) {
				str += arr[i] + ", ";
			} else {
				str += arr[i];
			}
		}
		str += "]";
		System.out.println(str);
		
	}

}
