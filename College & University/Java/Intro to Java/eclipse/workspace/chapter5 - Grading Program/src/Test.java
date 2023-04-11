import java.util.Scanner;

public class Test {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int count = 0;
		double sum = 0;
		double nextVal = 0;
		
		while (nextVal >= 0 && count < 10) {
			System.out.println("Enter Value #" + (count + 1) + ":");
			nextVal = s.nextDouble();
			sum += nextVal;
			count++;
		}
		double avg = sum / (count);
		System.out.printf("Average = %2.2f" , avg);

		
	}

}
