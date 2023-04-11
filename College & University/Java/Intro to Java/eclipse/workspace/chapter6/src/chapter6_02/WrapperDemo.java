package chapter6_02;

public class WrapperDemo {
	public static void main(String args[]) {
		Integer intObj1 = new Integer(25);
		Integer intObj2 = new Integer("25");
		Integer intObj3 = new Integer(35);
		
		// compareTo demo
		System.out.println("Comparing using compareTo Obj1 and Obj2: " + intObj1.compareTo(intObj2));
		System.out.println("Comparing using compareTo Obj1 and Obj3: " + intObj1.compareTo(intObj3));
		
		// Equals demo
		System.out.println("Comparing using equals Obj1 and Obj2: " + intObj1.equals(intObj2));
		System.out.println("Comparing using equals Obj1 and Obj3: " + intObj1.equals(intObj3));
		Float f1 = new Float("2.25f");
		Float f2 = new Float("20.43f");
		Float f3 = new Float(2.25f);
		System.out.println("Comparing using compare f1 and f2: " + Float.compare(f1, f2));
		System.out.println("Comparing using compare f1 and f3: " + Float.compare(f1, f3));
		
		// Addition of Integer with Float
		Float f = intObj1.floatValue() + f1;
		System.out.println("Addition of intObj1 and f1: " + intObj1 + "+" + f1 + "=" + f);
	
		// (2.c.)	In WrapperDemo.java, ...
		// ...As a last step, output the min and max values for Integers
		System.out.println("Max Integer Value: "+ Integer.MAX_VALUE +"\n"
				+ "Min Integer Value: "+ Integer.MIN_VALUE +"\n");
	}

}