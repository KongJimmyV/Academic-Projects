package chapter6_02;

import java.util.Random;

public class BasicMathDemo {
    public static void main(String[] args) {
        double a = -191.635;
        double b = 43.74;
        int c = 16, d = 45;

        System.out.printf("The absolute value " + "of %.3f is %.3f%n", 
                          a, Math.abs(a));

        System.out.printf("The ceiling of " + "%.2f is %.0f%n", 
                          b, Math.ceil(b));

        System.out.printf("The floor of " + "%.2f is %.0f%n", 
                          b, Math.floor(b));

        System.out.printf("The rint of %.2f " + "is %.0f%n", 
                          b, Math.rint(b));

        System.out.printf("The max of %d and " + "%d is %d%n",
                          c, d, Math.max(c, d));

        System.out.printf("The min of of %d " + "and %d is %d%n",
                          c, d, Math.min(c, d));
        
        // Output 10 random integers ranging between 1 and 100 inclusive.
        Random rand = new Random();
        
        for (int i = 0; i < 10; i++) {
        	int r = 1 + rand.nextInt(100);
        	System.out.println("Random Integer ["+ i +"]: "+ r);
        	
        	/*// (DEBUG) test if random integer is from 1 to 100
        	if (r < 1 || r > 100) {
        		System.out.println("NOT OK.");
        		System.exit(0);
        	}
        	else {
        		System.out.println("OK.");
        	}*/
        }
        
    }
}