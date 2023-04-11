

import static org.junit.Assert.*;
import org.junit.Test;

public class UnitTest {

	public Demo create() {
		return new Demo();
	}
	
	@Test
	public void testConcatenate() {
		String one = "Hello";
		String two = " World";
		
		Demo test = create();
		String result = test.concatenate(one, two);
		
		assertEquals(one + two, result);
	}
	
	@Test
	public void testMultiply() {
		int x = 2;
		int y = 2;
		
		Demo test = create();
		int result = test.multiply(x, y);
		
		assertEquals(x*y, result);
	}
	
	@Test
	public void testLinearSearch() {
		
		Demo test = create();
		int[] arr = {100, -100, -50, 50, 25};
		
		//first tests
		int target = 0;
		int[] emptyArr = new int[25];
		int result = test.linearSearch(target, arr);
		
		target = 100;
		result = test.linearSearch(target, emptyArr);
		assertEquals(-1, result);
		
		target = 99;
		result = test.linearSearch(target, arr);
		assertEquals(-1, result);
		
		target = 100;
		result = test.linearSearch(target, arr);
		assertEquals(0, result);
		
		target = -100;
		result = test.linearSearch(target, arr);
		assertEquals(1, result);
		
		target = -50;
		result = test.linearSearch(target, arr);
		assertEquals(2, result);
		
		target = 50;
		result = test.linearSearch(target, arr);
		assertEquals(3, result);
		
		target = 25;
		result = test.linearSearch(target, arr);
		assertEquals(4, result);
	}

}
