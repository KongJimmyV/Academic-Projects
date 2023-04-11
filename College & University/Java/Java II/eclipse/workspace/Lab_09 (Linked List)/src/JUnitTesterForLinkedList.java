import static org.junit.Assert.*;

import org.junit.Test;

public class JUnitTesterForLinkedList {

	LinkedList<String> list = new LinkedList<String>();
	
	// Success Messages
	
	// Failed Messages
	
	// Check size() and add() methods.
	@Test
	public void size_add() {
		
		/////////////////////
		// Check size() and add(E e).
		list = new LinkedList<String>();
		
		assertEquals("\"size() failed\"", list.size(), 0);
		
		// Check current method normally
		list.add("One");
		assertEquals("\"add(E e) size check failed\"", 1, list.size());
		assertEquals("\"add(E e) failed. The object being added was not added.\"", true, list.contains("One"));
		
		list.add("Two");
		assertEquals("\"add(E e) size check failed\"", 2, list.size());
		assertEquals("\"add(E e) failed. The object being added was not added.\"", true, list.contains("Two"));
		
		list.add("Three");
		assertEquals("\"add(E e) size check failed\"", 3, list.size());
		assertEquals("\"add(E e) failed. The object being added was not added.\"", true, list.contains("Three"));
		
		list.add("Four");
		assertEquals("\"add(E e) size check failed\"", 4, list.size());
		assertEquals("\"add(E e) failed. The object being added was not added.\"", true, list.contains("Four"));
		
		list.add("Five");
		assertEquals("\"add(E e) size check failed\"", 5, list.size());
		assertEquals("\"add(E e) failed. The object being added was not added.\"", true, list.contains("Five"));
		
		list.add("Six");
		assertEquals("\"add(E e) size check failed\"", 6, list.size());
		assertEquals("\"add(E e) failed. The object being added was not added.\"", true, list.contains("Six"));
		
		// NULL CHECK
		try {
			list.add(null);
			
			// Fail method if NullPointerException was not caught.
			fail();
		} catch (NullPointerException e) {
			// Continue testing.
		}
		
		//TODO: 
		///////////////////////////////////////////////
		// Check size() and add(int index, E element)
		
		// USE THE LIST ABOVE
		
		assertEquals("\"size() failed\"", list.size(), 6);
		
		// Check current method normally
		list.add(0, "New Value 1");
		assertEquals("\"add(int index, E element) size check failed\"", 7, list.size());
		assertEquals("\"add(int index, E element) failed. The object being added was not added.\"", "New Value 1", list.get(0));
		
		list.add(1, "New Value 2");
		assertEquals("\"add(int index, E element) size check failed\"", 8, list.size());
		assertEquals("\"add(int index, E element) failed. The object being added was not added.\"", "New Value 2", list.get(1));
		
		list.add(0, "New Value 3");
		assertEquals("\"add(int index, E element) size check failed\"", 9, list.size());
		assertEquals("\"add(int index, E element) failed. The object being added was not added.\"", "New Value 3", list.get(0));
		
		list.add(3,"New Value 4");
		assertEquals("\"add(int index, E element) size check failed\"", 10, list.size());
		assertEquals("\"add(int index, E element) failed. The object being added was not added.\"", "New Value 4", list.get(3));
		
		list.add(5, "New Value 5");
		assertEquals("\"add(int index, E element) size check failed\"", 11, list.size());
		assertEquals("\"add(int index, E element) failed. The object being added was not added.\"", "New Value 5", list.get(5));
		
		list.add(4, "New Value 6");
		assertEquals("\"add(int index, E element) size check failed\"", 12, list.size());
		assertEquals("\"add(int index, E element) failed. The object being added was not added.\"", "New Value 6", list.get(4));
		
		// NULL CHECK
		try {
			list.add(0, null);
			list.add(1, null);
			list.add(2, null);
			list.add(3, null);
			list.add(4, null);
			
			// Fail method if NullPointerException was not caught.
			fail();
		} catch (NullPointerException e) {
			// Continue testing.
		}
		
	}
	
	// Check size() and remove() methods.
	@Test
	public void size_remove() {
		
		////////////////////////////
		// Check remove(Object o).
		list = new LinkedList<String>();
		
		list.add("One");
		list.add("Two");
		
		// Check current method normally.
		list.remove("Two");
		assertEquals("\"remove(Object o) size check failed\"", 1, list.size());
		assertEquals("\"remove(Object o) failed. The object being removed was not removed.\"", false, list.contains("Two"));
		
		list.remove("One");
		assertEquals("\"remove(Object o) size check failed\"", 0, list.size());
		assertEquals("\"remove(Object o) failed. The object being removed was not removed.\"", false, list.contains("One"));
		
		// Check for other things.
		Boolean isRemoved = list.remove("One");
		assertEquals("\"remove(Object o) size check failed\"", 0, list.size());
		assertEquals("\"remove(Object o) failed. This method should return false and not remove any Objects.\"", false, isRemoved);
		
		isRemoved = list.remove("");
		assertEquals("\"remove(Object o) size check failed\"", 0, list.size());
		assertEquals("\"remove(Object o) failed. This method should of returned false and not remove any Objects at this time.\"", false, isRemoved);
		
		isRemoved = list.remove(null);
		assertEquals("\"remove(Object o) size check failed\"", 0, list.size());
		assertEquals("\"remove(Object o) failed. This method should of returned false and not remove any Objects at this time.\"", false, isRemoved);
		
		isRemoved = list.remove(0.025);
		assertEquals("\"remove(Object o) size check failed\"", 0, list.size());
		assertEquals("\"remove(Object o) failed. This method should of returned false and not remove any Objects at this time.\"", false, isRemoved);
		
		isRemoved = list.remove(new LinkedList<Object>());
		assertEquals("\"remove(Object o) size check failed\"", 0, list.size());
		assertEquals("\"remove(Object o) failed. This method should of returned false and not remove any Objects at this time.\"", false, isRemoved);
		
		isRemoved = list.remove("Try another String");
		assertEquals("\"remove(Object o) size check failed\"", 0, list.size());
		assertEquals("\"remove(Object o) failed. This method should of returned false and not remove any Objects at this time.\"", false, isRemoved);
		
		list = new LinkedList<String>();
		
		////////////////////////////
		// Check remove(int index)
		list.add("One");
		list.add("Two");
		list.add("Three");
		list.add("Four");
		list.add("Five");
		list.add("Six");
		
		// Check current method normally.
		list.remove(0);
		assertEquals("\"remove(int index) size check failed\"", 5, list.size());
		assertEquals("\"remove(int index) failed. The object being removed was not removed.\"", false, list.contains("One"));
		
		list.remove(0);;
		assertEquals("\"remove(int index) size check failed\"", 4, list.size());
		assertEquals("\"remove(int index) failed. The object being removed was not removed.\"", false, list.contains("Two"));
		
		list.remove(0);
		assertEquals("\"remove(int index) size check failed\"", 3, list.size());
		assertEquals("\"remove(int index) failed. The object being removed was not removed.\"", false, list.contains("Three"));
		
		list.remove(0);
		assertEquals("\"remove(int index) size check failed\"", 2, list.size());
		assertEquals("\"remove(int index) failed. The object being removed was not removed.\"", false, list.contains("Four"));
		
		list.remove(0);
		assertEquals("\"remove(int index) size check failed\"", 1, list.size());
		assertEquals("\"remove(int index) failed. The object being removed was not removed.\"", false, list.contains("Five"));
		
		list.remove(0);
		assertEquals("\"remove(int index) size check failed\"", 0, list.size());
		assertEquals("\"remove(int index) failed. The object being removed was not removed.\"", false, list.contains("Six"));
		
		// Check for other things.
		String str = list.remove(0);
		assertEquals("\"remove(int index) size check failed\"", 0, list.size());
		assertEquals("\"remove(int index) failed. An object was somehow removed when the list was empty.\"", null, str);
		
		str = list.remove(100);
		assertEquals("\"remove(int index) size check failed\"", 0, list.size());
		assertEquals("\"remove(int index) failed. An object was somehow removed when the list was empty.\"", null, str);
		
		str = list.remove(-50);
		assertEquals("\"remove(int index) size check failed\"", 0, list.size());
		assertEquals("\"remove(int index) failed. An object was somehow removed when the list was empty.\"", null, str);
		
		str = list.remove(-1);
		assertEquals("\"remove(int index) size check failed\"", 0, list.size());
		assertEquals("\"remove(int index) failed. An object was somehow removed when the list was empty.\"", null, str);
		
	}
	
	// Check the boolean isEmpty() method.
	@Test
	public void isEmpty() {
		list = new LinkedList<String>();
		assertEquals(list.isEmpty(), true);
	}
	
	// Check the boolean isEmpty(), add(), and remove() methods.
	@Test
	public void isEmpty_add_remove() {
		list = new LinkedList<String>();
		assertEquals(list.isEmpty(), true);
		
		list.add("Add");
		assertEquals("\"add(E e) failed\"", false, list.isEmpty());
		list.remove("Add");
		assertEquals("\"remove(Object o) failed\"", true, list.isEmpty());
		
		list.add("Add");
		assertEquals("\"add(E e) failed\"", false, list.isEmpty());
		list.remove(0);
		assertEquals("\"remove(int index) failed\"", true, list.isEmpty());
	}
	
	// Check contains(Object o) method.
	@Test
	public void contains() {
		
		/////////////////////
		// Check contains()
		list = new LinkedList<String>();
		
		list.add("One");
		list.add("Two");
		list.add("Three");
		list.add("Four");
		list.add("Five");
		list.add("Six");
		
		assertEquals("\"contains() failed. The object being added was not added.\"", true, list.contains("One"));
		assertEquals("\"contains() failed. The object being added was not added.\"", true, list.contains("Two"));
		assertEquals("\"contains() failed. The object being added was not added.\"", true, list.contains("Three"));
		assertEquals("\"contains() failed. The object being added was not added.\"", true, list.contains("Four"));
		assertEquals("\"contains() failed. The object being added was not added.\"", true, list.contains("Five"));
		assertEquals("\"contains() failed. The object being added was not added.\"", true, list.contains("Six"));
		assertEquals("\"contains() failed. The method did not return false.\"", false, list.contains("7"));
		assertEquals("\"contains() failed. The method did not return false.\"", false, list.contains("Seven"));
		
		// NULL CHECK
		try {
			list.contains(null);
			
			// Fail this test if this method did not throw a NullPointerException.
			fail("contain() method did not throw an NullPointerException.");
		} catch (NullPointerException e) {
			// Caught null exception, continue test.
		}
		
//		// Object/Cast Checks
//		try {
//			list.contains('c');
//			list.contains((int)0);
//			list.contains((double)0.0);
//			list.contains((long)0.0);
//			list.contains(new LinkedList<Object>());
//			
//			fail("contain() method did not throw an ClassCastException.");
//		} catch (ClassCastException e) {
//			// Caught cast exception, continue test.
//		}
			
	}
	
	// Check toArray() and toArray(T[] a) method.
	@Test
	public void toArray() {

		/////////////////////
		// Check toArray().
		list = new LinkedList<String>();
		
		list.add("One");
		list.add("Two");
		list.add("Three");
		list.add("Four");
		list.add("Five");
		list.add("Six");
		
		Object[] sArr = (list.toArray());
		
		assertEquals("\"toArray() failed.\"", "One", sArr[0]);
		assertEquals("\"toArray() failed.\"", "Two", sArr[1]);
		assertEquals("\"toArray() failed.\"", "Three", sArr[2]);
		assertEquals("\"toArray() failed.\"", "Four", sArr[3]);
		assertEquals("\"toArray() failed.\"", "Five", sArr[4]);
		assertEquals("\"toArray() failed.\"", "Six", sArr[5]);
		assertEquals("\"toArray() length check failed.\"", 6, sArr.length);
		
		// Print arr
//		for(int i = 0; i < sArr.length; i++) {
//			System.out.println(sArr[i]);
//		}
		
		// Check toArray(T[] a).
		list = new LinkedList<String>();
		
		list.add("One");
		list.add("Two");
		list.add("Three");
		list.add("Four");
		list.add("Five");
		list.add("Six");
		
		sArr = null;
		sArr = list.toArray(sArr);
		
		assertEquals("\"toArray(T[] a) failed.\"", "One", sArr[0]);
		assertEquals("\"toArray(T[] a) failed.\"", "Two", sArr[1]);
		assertEquals("\"toArray(T[] a) failed.\"", "Three", sArr[2]);
		assertEquals("\"toArray(T[] a) failed.\"", "Four", sArr[3]);
		assertEquals("\"toArray(T[] a) failed.\"", "Five", sArr[4]);
		assertEquals("\"toArray(T[] a) failed.\"", "Six", sArr[5]);
		assertEquals("\"toArray(T[] a) length check failed.\"", 6, sArr.length);
	}
	
	// Check clear() method.
	@Test
	public void clear() {
		
		//////////////////////////
		// Check clear() method.
		list = new LinkedList<String>();
		
		list.add("One");
		list.add("Two");
		list.add("Three");
		list.add("Four");
		list.add("Five");
		list.add("Six");
		
		// Clear the list.
		list.clear();
		
		// Make sure the list contains nothing.
		assertEquals("\"clear() failed.\"", false, list.contains("One"));
		assertEquals("\"clear() failed.\"", false, list.contains("Two"));
		assertEquals("\"clear() failed.\"", false, list.contains("Three"));
		assertEquals("\"clear() failed.\"", false, list.contains("Four"));
		assertEquals("\"clear() failed.\"", false, list.contains("Five"));
		assertEquals("\"clear() failed.\"", false, list.contains("Six"));
	}
	
	// Check get(int index)
	@Test
	public void get() {
		/////////////////////////////////
		// Check get(int index) method.
		list = new LinkedList<String>();

		list.add("One");
		list.add("Two");
		list.add("Three");
		list.add("Four");
		list.add("1");
		list.add("2");
		list.add("3");
		list.add("4");
		
		// Get the data and check.
		String data = list.get(0);
		assertEquals("\"get(int index) failed. The extracted data did not match the list's data.\"", data, "One");
		
		data = list.get(1);
		assertEquals("\"get(int index) failed. The extracted data did not match the list's data.\"", data, "Two");
		
		data = list.get(2);
		assertEquals("\"get(int index) failed. The extracted data did not match the list's data.\"", data, "Three");
		
		data = list.get(3);
		assertEquals("\"get(int index) failed. The extracted data did not match the list's data.\"", data, "Four");
		
		data = list.get(4);
		assertEquals("\"get(int index) failed. The extracted data did not match the list's data.\"", data, "1");
		
		data = list.get(5);
		assertEquals("\"get(int index) failed. The extracted data did not match the list's data.\"", data, "2");
		
		data = list.get(6);
		assertEquals("\"get(int index) failed. The extracted data did not match the list's data.\"", data, "3");
		
		data = list.get(7);
		assertEquals("\"get(int index) failed. The extracted data did not match the list's data.\"", data, "4");
		
		// Out of bounds checks.
		try {
			data = list.get(8);
			
			// Fail this method if the data does not throw an IndexOutOfBoundsException.
			fail("get() method did not throw an IndexOutOfBoundsException.");
		} catch (IndexOutOfBoundsException e) {
			// Caught exception, continue test.
		}
		
		try {
			data = list.get(-1);
			
			// Fail this method if the data does not throw an IndexOutOfBoundsException.
			fail("get() method did not throw an IndexOutOfBoundsException.");
		} catch (IndexOutOfBoundsException e) {
			// Caught exception, continue test.
		}
		
		try {
			data = list.get(1000);
			
			// Fail this method if the data does not throw an IndexOutOfBoundsException.
			fail("Method did not throw an IndexOutOfBoundsException.");
		} catch (IndexOutOfBoundsException e) {
			// Caught exception, continue test.
		}
		
		try {
			data = list.get(-1000);
			
			// Fail this method if the data does not throw an IndexOutOfBoundsException.
			fail("Method did not throw an IndexOutOfBoundsException.");
		} catch (IndexOutOfBoundsException e) {
			// Caught exception, continue test.
		}
		
	}
	
	// Check set(int index, E element)
	@Test
	public void set() {
		////////////////////////////////////
		// Check set(int index, E element)
		list = new LinkedList<String>();

		list.add("One");
		list.add("Two");
		list.add("Three");
		list.add("Four");
		list.add("1");
		list.add("2");
		list.add("3");
		list.add("4");
		
		// Replace index 0
		assertEquals("\"set(int index, E element) failed. The old data returned from the set() method.\"", 
				"One", list.set(0, "New One"));
		assertEquals("\"set(int index, E element) failed. The new data did not change correctly.\"", 
				"New One", list.get(0));
		
		// Replace index 7
		assertEquals("\"set(int index, E element) failed. The old data returned from the set() method.\"", 
				"4", list.set(7, "New 4"));
		assertEquals("\"set(int index, E element) failed. The new data did not change correctly.\"", 
				"New 4", list.get(7));
		
		// Replace index 3
		assertEquals("\"set(int index, E element) failed. The old data returned from the set() method.\"", 
				"Four", list.set(3, "New Four"));
		assertEquals("\"set(int index, E element) failed. The new data did not change correctly.\"", 
				"New Four", list.get(3));
		
		// NULL CHECK
		try {
			list.set(0, null);
			
			// Fail method if NullPointerException was not caught.
			fail();
		} catch (NullPointerException e) {
			// Continue testing.
		}
	}

	// Check indexOf() method.
	@Test
	public void indexOf() {
		////////////////////
		// Check indexOf()
		list = new LinkedList<String>();

		list.add("One");
		list.add("Two");
		list.add("Three");
		list.add("One");
		list.add("Two");
		list.add("Three");
		
		assertEquals("\"indexOf(Object o) failed. The index was wrong. ", 0, list.indexOf("One"));
		assertEquals("\"indexOf(Object o) failed. The index was wrong. ", 1, list.indexOf("Two"));
		assertEquals("\"indexOf(Object o) failed. The index was wrong. ", 2, list.indexOf("Three"));
		
		// NULL CHECK
		try {
			list.indexOf(null);

			// Fail method if NullPointerException was not caught.
			fail();
		} catch (NullPointerException e) {
			// Continue testing.
		}
	}
	
	// Check lastIndexOf() method.
	@Test
	public void lastIndexOf() {
		////////////////////
		// Check indexOf()
		list = new LinkedList<String>();

		list.add("One");
		list.add("Two");
		list.add("Three");
		list.add("One");
		list.add("Two");
		list.add("Three");
		
		assertEquals("\"lastIndexOf(Object o) failed. The index was wrong. ", 3, list.lastIndexOf("One"));
		assertEquals("\"lastIndexOf(Object o) failed. The index was wrong. ", 4, list.lastIndexOf("Two"));
		assertEquals("\"lastIndexOf(Object o) failed. The index was wrong. ", 5, list.lastIndexOf("Three"));
		
		// NULL CHECK
		try {
			list.lastIndexOf(null);

			// Fail method if NullPointerException was not caught.
			fail();
		} catch (NullPointerException e) {
			// Continue testing.
		}
	}

	// Check all methods by injecting null objects.
	@Test
	public void null_Injection() {
		//TODO:
	}
}
