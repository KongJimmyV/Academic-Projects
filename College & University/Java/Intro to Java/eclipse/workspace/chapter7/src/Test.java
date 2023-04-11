

import java.util.Random;

public class Test {

	public static void main(String[] args) {
		System.out.println("***START***\n");
		
		double[] gasPricesArr = new double[5];
		gasPricesArr[0] = 1.960;
		gasPricesArr[1] = 1.977;
		gasPricesArr[2] = 2.018;
		gasPricesArr[3] = 2.022;
		gasPricesArr[4] = 2.025;
		
		Random rnd = new Random();
		//rnd.setSeed();
		
		for (int i = 0; i < gasPricesArr.length; i++) {
			gasPricesArr[i] = rnd.nextDouble() * 10;
		}
		
		printArray(gasPricesArr);
		
		printArrayStats(gasPricesArr);
		
		System.out.println("\n***END***");
		
	}

	private static void printArray(double[] array) {
		
		int length = array.length;
		System.out.println("This array contains " + length + " items.\n");
		
		for (int i = 0; i < (array.length); i++) {
			System.out.println("Gas Price (array #" + (i) + "): " + array[i]);
		}
	}
	
	private static void printArrayStats(double[] array) {
		
		//Print max and min number in the array.
		int maxIndex = 0;
		int minIndex = 0;
		double avg = 0;
		for (int i = 0; i < (array.length); i++) {
			if (array[i] > array[maxIndex])
				maxIndex = i;
			if (array[i] < array[minIndex])
				minIndex = i;
			double sum = 0;
			for (int a = 0; a < (array.length); a++) {
				sum += array[a];
				}
			avg = sum/array.length;
		}
		
		System.out.println("");
		System.out.println("Max Value (array #" + (maxIndex) + "): " + array[maxIndex]);
		System.out.println("Min Value (array #" + (minIndex) + "): " + array[minIndex]);
		System.out.println("Average array Value: " + avg);
	}
	
}
