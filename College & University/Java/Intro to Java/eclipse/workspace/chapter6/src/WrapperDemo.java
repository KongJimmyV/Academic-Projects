
public class WrapperDemo {

	public static void main(String[] args) {
		Integer n = new Integer(42);
		int i = n.intValue();
		int x = n;
		
		Integer p = x;
		
		Double d = new Double (9.99);
		double d2 = d.doubleValue();
		
		String age = "20";
		int intAge = Integer.parseInt(age);
		
		double price = Double.parseDouble("99.99");
		String strPrice = Double.toString(price);
		
		System.out.println(Integer.MIN_VALUE);
		System.out.println(Integer.MAX_VALUE);
	}

}
