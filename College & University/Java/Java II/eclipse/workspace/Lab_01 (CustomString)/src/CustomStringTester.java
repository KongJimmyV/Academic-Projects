
import static org.junit.Assert.*;

import java.util.Random;

import org.junit.Test;

////////////////////////////////////////////////////////////////////
/**
 * This class file contains methods to test the CustomString class.
 * <br>
 * <br>File Name:		CustomStringTester.java
 * <br>Created by: 		Jimmy Vang
 * <br>Date Created:		Jan 10, 2016 (10/20/2016)
 * <br>
 * 
 * @version 0.1
 * @author 003011320 (Jimmy Vang)
 */
public class CustomStringTester {
	
	@Test
	/**
	 * Check if the CustomString constructors work correctly.
	 */
	public void CustomStrings() {
		// TEST 1: Check CustomString()
		CustomString str1 = new CustomString();
		
		int expectedSize = 0;
		int expectedCapacity = CustomString.DEFAULT_CAPACITY;
		assertEquals(expectedSize, str1.length()); // check length (this method returns SIZE)
		assertEquals(expectedSize, str1.getSize()); // check size
		assertEquals(expectedCapacity, str1.getCapacity()); // check capacity
		
		// TEST 2: Check CustomString(char[] values)
		char[] charArr = {'1','2','3','4','5','6','7','8','9'};
		CustomString str2 = new CustomString(charArr);
		
		expectedSize = charArr.length;
		expectedCapacity = str2.getSize() + CustomString.DEFAULT_CAPACITY;
		assertEquals(expectedSize, str2.length()); // check length (this method returns SIZE)
		assertEquals(expectedSize, str2.getSize()); // check size
		assertEquals(expectedCapacity, str2.getCapacity()); // check capacity
	}
	
	@Test
	/**
	 * Check if this method returns the size of the CustomStrings correctly.
	 */
	public void getSize() {
		// TEST 1: Default Size check
		CustomString str1 = new CustomString();
		
		int expectedSize = 0;
		assertEquals(expectedSize, str1.getSize());
		
		// TEST 2: Check Size with a Data Set
		char[] charArr = {'1','2','3','4','5','6','7','8','9'};
		CustomString str2 = new CustomString(charArr);
		
		expectedSize = charArr.length;
		assertEquals(expectedSize, str2.getSize());
		
		// TEST 3: Check Size with Random Data
		char[] charArr2 = new char[500];
		for (int i : charArr2) {
			Random rand = new Random();
			charArr2[i] = (char)rand.nextInt();
		}
		
		CustomString str3 = new CustomString(charArr2);
		
		expectedSize = charArr2.length;
		assertEquals(expectedSize, str3.getSize());
	}
	
	@Test
	/**
	 * Check if this method returns the capacity of the CustomStrings correctly.
	 */
	public void getCapacity() {
		// TEST 1: Default Capacity Check
		CustomString str1 = new CustomString();
		
		int expectedCapacity = CustomString.DEFAULT_CAPACITY;
		assertEquals(expectedCapacity, str1.getCapacity());
		
		// TEST 2: Check capacity with a Data Set
		char[] charArr = {'1','2','3','4','5','6','7','8','9'};
		CustomString str2 = new CustomString(charArr);
		
		expectedCapacity = str2.getSize() + CustomString.DEFAULT_CAPACITY;
		assertEquals(expectedCapacity, str2.getCapacity());
		
		// TEST 3: Random Data
		char[] charArr2 = new char[500];
		for (int i : charArr2) {
			Random rand = new Random();
			charArr2[i] = (char)rand.nextInt();
		}
		
		CustomString str3 = new CustomString(charArr2);
		
		expectedCapacity = str3.getSize() + CustomString.DEFAULT_CAPACITY;
		assertEquals(expectedCapacity, str3.getCapacity());
	}
	
	@Test
	/**
	 * Check this method's post-conditions.
	 */
	public void append() {
		// TEST 1: The values in the passed in array are added to the end of this CustomString
		
		
		// TEST 2: This CustomString's values array is resized if needed to accommodate the new values.
		CustomString str1 = new CustomString();
		
		char[] charArr = {'1','2'};
		char[] charArr2 = new char[10];
		for (int i : charArr2) {
			Random rand = new Random();
			charArr2[i] = (char)rand.nextInt();
		}
		
		str1.append(charArr);
		str1.append(charArr2);
		
		int expectedSize = charArr.length + charArr2.length;
		int expectedCapacity = str1.length() + CustomString.DEFAULT_CAPACITY;
		
		System.out.println(str1.getSize());
		System.out.println(str1.getCapacity());
		
		assertEquals(expectedSize, str1.getSize());
		assertEquals(expectedCapacity, str1.getCapacity());
		
		// TEST 3: If this CustomString's values array requires resizing, the new capacity should be the new size + DEFAULT_CAP.
		
	}
	
	@Test
	public void length() {
		
	}
	
	@Test
	public void isEmpty() {
		
	}
	
	@Test
	public void charAt() {

	}
	
	@Test
	public void getChars() {
		
	}
	
	@Test
	public void equals() {

	}
	
	@Test
	public void equalsIgnoreCase() {

	}
	
	@Test
	public void compareTo() {

	}
	
	@Test
	public void startsWith() {

	}
	
	@Test
	public void endsWith() {

	}
	
	@Test
	public void indexOf() {

	}
	
	@Test
	public void substring() {

	}
	
	@Test
	public void replace() {

	}
	
	@Test
	public void resize() {

	}
	
	@Test
	public void contains() {

	}
	
	@Test
	public void toUpperCase() {

	}
	
	@Test
	public void toStringTest() {

	}
	
	@Test
	public void toCharArray() {

	}
}
