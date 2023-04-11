
public class MathDemo {

	public static void main(String[] args) {
		//
		int max = Math.max(10, 100);
		System.out.println("The max is " + max + ".");
		
		//
		double radius = 1;
		double area = Math.PI * Math.pow(radius, 2);
		System.out.println("Area is " + area);
		
		//
		double start = 3.56;
		double rounded = Math.rint(start);
		System.out.println("Round to nearest integer, " + rounded);
		
		//
		double high = Math.ceil(start);
		System.out.println("High: " + high);
		double low = Math.floor(start);
		System.out.println("Low: " + low);
		
		//
		double random = Math.random();
		int diceValue = (int)(random*6) + 1;
		System.out.println(diceValue);
	}

}
