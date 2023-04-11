package review;

import java.util.Random;

public class Q5 {

	public static void main(String[] args) {
		
		int[] age = new int[10];
		Random rnd = new Random();
		
		// ... you init ...
		int maxAge = 0;
		int minAge = Integer.MAX_VALUE;
		int sumAges = 0;
		int avgAge = 0;
		
		for (int i = 0;i < age.length; i++) {
			if (age[i] > maxAge)
				maxAge = age[i];
			
			if (age[i] < minAge)
				minAge = age[i];
			
			
			for (int n : age) {
				sumAges += n;
			}
			
			
		}
		System.out.println("Max: " + maxAge);
		System.out.println("Min: " + minAge);
		
		avgAge = sumAges / age.length;
		System.out.println("Average: " + avgAge);
	}
	
}
