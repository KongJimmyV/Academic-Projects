
public class Demo {

	public String concatenate(String one, String two) {
		return one + two;
	}

	public int multiply(int x, int y) {
		return x * y;
	}
	
	public int linearSearch(int target, int[] intArr) {
		
		for(int i = 0; i < intArr.length; i++) {
			if(intArr[i] == target){
				return i;
			}
		}
		return -1;
	}
}
