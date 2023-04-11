package chapter6_02;

public class ExponentialDemo {
    public static void main(String[] args) {
        double x = 11.635;
        double y = 2.76;

        System.out.printf("The value of " + "e is %.4f%n",
                          Math.E);

        System.out.printf("exp(%.3f) " + "is %.3f%n",
                          x, Math.exp(x));

        System.out.printf("log(%.3f) is " + "%.3f%n",
                          x, Math.log(x));

        System.out.printf("pow(%.3f, %.3f) " + "is %.3f%n",
                          x, y, Math.pow(x, y));

        System.out.printf("sqrt(%.3f) is " + "%.3f%n",
                          x, Math.sqrt(x));
        
        // Calculate the future value of $1000 invested for 10 years at 5.0%.  
        // Assume interest is compounded quarterly.
        double principal = 1000;
        double years = 10;
        double rate = 0.05;
        double numOfTimesCompounded = 4;
        
        double a = (1 + (rate/numOfTimesCompounded));
        double b = numOfTimesCompounded * years;
        double amount = principal * Math.pow(a, b);
        System.out.printf("--------------------------------------------\n"
        		+ "Principal: " + principal + "\n"
        		+ "Years: " + years + "\n"
        		+ "Rate: " + rate + " or %%" + rate*100 + "\n"
        		+ "Number of times compounded: " + numOfTimesCompounded + "\n"
        		+ "\n"
        		+ "Future Value = $%#.2f\n"
        		+ "--------------------------------------------"
        		, amount);
        
    }
}