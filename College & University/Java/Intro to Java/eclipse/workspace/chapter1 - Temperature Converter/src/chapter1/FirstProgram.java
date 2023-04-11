package chapter1;

import java.util.Scanner;

public class FirstProgram {

	private static Scanner s;

	public static void main(String[] args) {
		System.out.println("Hello out there.");
		System.out.println("I will add two numbers for you.");
		System.out.println("Enter two whole numbers on a line:");
		
		int n1, n2, sum;
		
		s = new Scanner(System.in);
		n1 = s.nextInt();
		n2 = s.nextInt();
		sum = n1 + n2;
		
		System.out.println("The sum of those two numbers is");
		System.out.println(sum);
	}

}
