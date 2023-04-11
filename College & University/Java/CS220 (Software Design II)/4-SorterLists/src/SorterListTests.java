import static org.junit.Assert.*;
import org.junit.Test;

import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class SorterListTests {

    @Test()
    public void testContains() {
        SorterList<String> list = new SorterList<>();
        list.add("A");
        assertTrue("\"contains()\" was not implemented correctly.", list.contains("A"));
        list.clear();
        assertFalse("\"contains()\" was not implemented correctly.", list.contains("A"));
        
        list.add("A");
        assertTrue("\"contains()\" was not implemented correctly.", list.contains("A"));
        list.add("B");
        assertTrue("\"contains()\" was not implemented correctly.", list.contains("B"));
        
        list.remove("A");
        assertFalse("\"contains()\" was not implemented correctly.", list.contains("A"));
        list.remove("B");
        assertFalse("\"contains()\" was not implemented correctly.", list.contains("B"));
    }
    
    @Test()
    public void testSize() {
        SorterList<String> list = new SorterList<>();
        assertEquals("\"size()\" did not return as expected.", 0, list.size());
        
        // Test size() with add() and clear().
        list.add("A");
        assertEquals("\"size()\" did not return as expected.", 1, list.size());
        list.add("B");
        assertEquals("\"size()\" did not return as expected.", 2, list.size());
        list.add("C");
        assertEquals("\"size()\" did not return as expected.", 3, list.size());
        list.clear();
        assertEquals("\"size()\" did not return as expected.", 0, list.size());
        
        // Test size() with add() and remove().
        list.add("A");
        assertEquals("\"size()\" did not return as expected.", 1, list.size());
        list.add("B");
        assertEquals("\"size()\" did not return as expected.", 2, list.size());
        list.add("C");
        assertEquals("\"size()\" did not return as expected.", 3, list.size());
        list.remove("A");
        assertEquals("\"size()\" did not return as expected.", 2, list.size());
        list.remove("B");
        assertEquals("\"size()\" did not return as expected.", 1, list.size());
        list.remove("C");
        assertEquals("\"size()\" did not return as expected.", 0, list.size());
    }
    
    @Test()
    public void testIsEmpty() {
        SorterList<String> list = new SorterList<>();
        assertTrue("\"isEmpty() did not return true.\"", list.isEmpty());
        
        list.add("A");
        list.add("B");
        assertFalse("\"isEmpty() did not return false.\"", list.isEmpty());
        list.clear();
        assertTrue("\"isEmpty() did not return true.\"", list.isEmpty());
        
        list.add("A");
        list.add("B");
        assertFalse("\"isEmpty() did not return false.\"", list.isEmpty());
        list.remove("A");
        list.remove("B");
        assertTrue("\"isEmpty() did not return true.\"", list.isEmpty());
        
    }
    
    @Test()
    public void testAdd() {
        SorterList<String> list = new SorterList<>();
        list.add("A");
        list.add("B");
        list.add("C");
        list.add("F");
        list.add("E");
        list.add("D");
        assertTrue("\"A\" was not added correctly.", list.contains("A"));
        assertTrue("\"B\" was not added correctly.", list.contains("B"));
        assertTrue("\"C\" was not added correctly.", list.contains("C"));
        assertTrue("\"D\" was not added correctly.", list.contains("D"));
        assertTrue("\"E\" was not added correctly.", list.contains("E"));
        assertTrue("\"F\" was not added correctly.", list.contains("F"));
    }
    
    @Test()
    public void testRemove() {
        SorterList<String> list = new SorterList<>();
        
        list.add("A");
        list.remove("A");
        assertFalse("\"A\" should not exist in the list.", list.contains("A"));
        
        // Check that remove() properly works if called too many times.
        list.add("A");
        list.add("B");
        list.remove("A");
        list.remove("B");
        
        assertFalse("\"A\" should not exist in the list.", list.contains("A"));
        assertFalse("\"B\" should not exist in the list.", list.contains("B"));
        
        list.remove("A");
        list.remove("B");
        
        // Check that remove() properly returns true or false.
        list.add("A");
        list.add("B");
        assertTrue("\"remove()\" did not return true.", list.remove("A"));
        assertTrue("\"remove()\" did not return true.", list.remove("B"));
        
        assertFalse("\"A\" should not exist in the list.", list.contains("A"));
        assertFalse("\"B\" should not exist in the list.", list.contains("B"));
        
        assertFalse("\"remove()\" did not return false.", list.remove("A"));
        assertFalse("\"remove()\" did not return false.", list.remove("B"));
        
        // The statements below check to make sure remove properly works regardless of ordder. 
        // The order items are added or removed should not affect the integrity of the list.
        
        // Add from A to C, Remove from A to C.
        list.add("A");
        list.add("B");
        list.add("C");
        list.remove("A");
        list.remove("B");
        list.remove("C");
        assertFalse("\"A\" should not exist in the list.", list.contains("A"));
        assertFalse("\"B\" should not exist in the list.", list.contains("B"));
        assertFalse("\"C\" should not exist in the list.", list.contains("C"));
        
        // Add from C to A, Remove from A to C.
        list.add("C");
        list.add("B");
        list.add("A");
        list.remove("A");
        list.remove("B");
        list.remove("C");
        assertFalse("\"A\" should not exist in the list.", list.contains("A"));
        assertFalse("\"B\" should not exist in the list.", list.contains("B"));
        assertFalse("\"C\" should not exist in the list.", list.contains("C"));
        
        // Add from A to C, Remove from C to A.
        list.add("A");
        list.add("B");
        list.add("C");
        list.remove("C");
        list.remove("B");
        list.remove("A");
        assertFalse("\"A\" should not exist in the list.", list.contains("A"));
        assertFalse("\"B\" should not exist in the list.", list.contains("B"));
        assertFalse("\"C\" should not exist in the list.", list.contains("C"));
        
        // Add from C to A, Remove from C to A.
        list.add("C");
        list.add("B");
        list.add("A");
        list.remove("C");
        list.remove("B");
        list.remove("A");
        assertFalse("\"A\" should not exist in the list.", list.contains("A"));
        assertFalse("\"B\" should not exist in the list.", list.contains("B"));
        assertFalse("\"C\" should not exist in the list.", list.contains("C"));
    }
    
    @Test()
    public void testClear() {
        SorterList<String> list = new SorterList<>();
        list.add("A");
        list.add("B");
        list.add("C");
        list.add("A");
        list.add("B");
        list.add("C");
        list.clear();
        assertFalse("\"A\" should not exist in the list.", list.contains("A"));
        assertFalse("\"B\" should not exist in the list.", list.contains("B"));
        assertFalse("\"C\" should not exist in the list.", list.contains("C"));
    }
    
    @Test()
    public void testGetComparator() {
        SorterList<String> list = new SorterList<>();
        Comparator c = list.getComparator();
        c.compare("A", "A");
    }
    
    @Test()
    public void testSetComparator() {
        SorterList<String> list = new SorterList<>();
        Comparator comparator = Comparator.naturalOrder();
        list.setComparator(comparator);
        assertEquals(0, list.getComparator().compare("a", "a"));
        assertEquals(32, list.getComparator().compare("a", "A"));
        assertEquals(-32, list.getComparator().compare("A", "a"));
        assertEquals(0, list.getComparator().compare("A", "A"));
        assertEquals(-1, list.getComparator().compare("A", "B"));
        assertEquals(1, list.getComparator().compare("B", "A"));
    }
    
    @Test(expected = NoSuchElementException.class)
    public void testIterator() {
        
        // Test an empty iterator.
        SorterList<String> list = new SorterList<>();
        Iterator<String> iter = list.iterator();
        assertFalse("\"iterator().hasNext()\" did not return false .", iter.hasNext());
        
        // Test a iterator with 3 elements.
        list = new SorterList<>();
        list.add("A");
        list.add("B");
        list.add("C");
        iter = list.iterator();
        
        assertTrue("\"iterator().hasNext()\" did not return true .", iter.hasNext());
        assertEquals("\"A\" was not returned by \"iterator().next()\".", "A", iter.next());
        assertEquals("\"B\" was not returned by \"iterator().next()\".", "B", iter.next());
        assertEquals("\"C\" was not returned by \"iterator().next()\".", "C", iter.next());
        assertFalse("\"iterator().hasNext()\" did not return false .", iter.hasNext());
        
        // Test if the iterator throws NoSuchElementException() properly.
        list = new SorterList<>();
        list.add("A");
        list.add("B");
        
        iter = list.iterator();
        iter.next();
        iter.next();
        iter.next();
        fail("\"iter.next()\" did not throw NoSuchElementException() properly.");
    }
    
    @Test(expected = NoSuchElementException.class)
    public void testIteratorWithComparator() {
        
        // Test an empty iterator.
        SorterList<String> list = new SorterList<>();
        Iterator<String> iter = list.iterator();
        
        Comparator<String> c = new ReverseOrderComparator<>();
        Iterator<String> iterComp = list.iterator(c);
        
        assertFalse("\"iterator().hasNext()\" did not return false .", iter.hasNext());
        assertFalse("\"iterator(comparator).hasNext()\" did not return false .", iterComp.hasNext());
        
        // Test a iterator with 3 elements.
        list = new SorterList<>();
        list.add("A");
        list.add("C");
        list.add("B");
        iter = list.iterator();
        iterComp = list.iterator(c);
        
        assertTrue("\"iterator().hasNext()\" did not return true .", iter.hasNext());
        assertEquals("\"A\" was not returned by \"iterator().next()\".", "A", iter.next());
        assertEquals("\"B\" was not returned by \"iterator().next()\".", "B", iter.next());
        assertEquals("\"C\" was not returned by \"iterator().next()\".", "C", iter.next());
        assertFalse("\"iterator().hasNext()\" did not return false .", iter.hasNext());
        assertTrue("\"iterator().hasNext()\" did not return true .", iterComp.hasNext());
        assertEquals("\"A\" was not returned by \"iterator().next()\".", "C", iterComp.next());
        assertEquals("\"B\" was not returned by \"iterator().next()\".", "B", iterComp.next());
        assertEquals("\"C\" was not returned by \"iterator().next()\".", "A", iterComp.next());
        assertFalse("\"iterator().hasNext()\" did not return false .", iterComp.hasNext());
        assertEquals("\"C\" was not returned by \"list.get()\".", "A", list.get(0));
        assertEquals("\"C\" was not returned by \"list.get()\".", "B", list.get(1));
        assertEquals("\"C\" was not returned by \"list.get()\".", "C", list.get(2));
        
        // Test if multiple iterators can be run.
        list = new SorterList<>();
        list.add("A");
        list.add("C");
        list.add("B");
        iter = list.iterator();
        iterComp = list.iterator(c);
        Iterator<String> iter2 = list.iterator();
        Iterator<String> iterComp2 = list.iterator(c);
        
        assertTrue("\"iterator().hasNext()\" did not return true .", iter.hasNext());
        assertEquals("\"A\" was not returned by \"iterator().next()\".", "A", iter.next());
        assertEquals("\"B\" was not returned by \"iterator().next()\".", "B", iter.next());
        assertEquals("\"C\" was not returned by \"iterator().next()\".", "C", iter.next());
        assertFalse("\"iterator().hasNext()\" did not return false .", iter.hasNext());
        assertTrue("\"iterator().hasNext()\" did not return true .", iterComp.hasNext());
        assertEquals("\"A\" was not returned by \"iterator().next()\".", "C", iterComp.next());
        assertEquals("\"B\" was not returned by \"iterator().next()\".", "B", iterComp.next());
        assertEquals("\"C\" was not returned by \"iterator().next()\".", "A", iterComp.next());
        assertFalse("\"iterator().hasNext()\" did not return false .", iterComp.hasNext());
        assertTrue("\"iterator().hasNext()\" did not return true .", iter2.hasNext());
        assertEquals("\"A\" was not returned by \"iterator().next()\".", "A", iter2.next());
        assertEquals("\"B\" was not returned by \"iterator().next()\".", "B", iter2.next());
        assertEquals("\"C\" was not returned by \"iterator().next()\".", "C", iter2.next());
        assertFalse("\"iterator().hasNext()\" did not return false .", iter2.hasNext());
        assertTrue("\"iterator().hasNext()\" did not return true .", iterComp2.hasNext());
        assertEquals("\"A\" was not returned by \"iterator().next()\".", "C", iterComp2.next());
        assertEquals("\"B\" was not returned by \"iterator().next()\".", "B", iterComp2.next());
        assertEquals("\"C\" was not returned by \"iterator().next()\".", "A", iterComp2.next());
        assertFalse("\"iterator().hasNext()\" did not return false .", iterComp2.hasNext());
        
        // Test if iterators change when the list is edited.
        list = new SorterList<>();
        list.add("A");
        list.add("C");
        list.add("B");
        iter = list.iterator();
        iterComp = list.iterator(c);
        
        assertTrue("\"iterator().hasNext()\" did not return true .", iter.hasNext());
        list.add("A");
        assertEquals("\"A\" was not returned by \"iterator().next()\".", "A", iter.next());
        list.add("A");
        assertEquals("\"B\" was not returned by \"iterator().next()\".", "B", iter.next());
        list.add("A");
        assertEquals("\"C\" was not returned by \"iterator().next()\".", "C", iter.next());
        list.add("A");
        assertFalse("\"iterator().hasNext()\" did not return false .", iter.hasNext());
        assertTrue("\"iterator().hasNext()\" did not return true .", iterComp.hasNext());
        list.add("A");
        assertEquals("\"A\" was not returned by \"iterator().next()\".", "C", iterComp.next());
        list.add("A");
        assertEquals("\"B\" was not returned by \"iterator().next()\".", "B", iterComp.next());
        list.add("A");
        assertEquals("\"C\" was not returned by \"iterator().next()\".", "A", iterComp.next());
        list.add("A");
        assertFalse("\"iterator().hasNext()\" did not return false .", iterComp.hasNext());
        
        // Test if the iterator throws NoSuchElementException() properly.
        list = new SorterList<>();
        list.add("A");
        list.add("B");
        
        iter = list.iterator();
        iter.next();
        iter.next();
        iter.next();
        fail("\"iter.next()\" did not throw NoSuchElementException() properly.");
    }
    
    @Test()
    public void testMergeSort() {
        SorterList<String> list = new SorterList<>();
        list.mergeSort();
        
        list.add("A");
        list.mergeSort();
        Iterator<String> iter = list.iterator();
        assertEquals("\"mergeSort()\" did not sort correctly.", "A", iter.next());
        
        list = new SorterList<>();
        list.add("B");
        list.add("A");
        list.mergeSort();
        iter = list.iterator();
        assertEquals("\"mergeSort()\" did not sort correctly.", "A", iter.next());
        assertEquals("\"mergeSort()\" did not sort correctly.", "B", iter.next());

        list = new SorterList<>();
        list.add("B");
        list.add("C");
        list.add("A");
        list.mergeSort();
        iter = list.iterator();
        assertEquals("\"mergeSort()\" did not sort correctly.", "A", iter.next());
        assertEquals("\"mergeSort()\" did not sort correctly.", "B", iter.next());
        assertEquals("\"mergeSort()\" did not sort correctly.", "C", iter.next());
        
        SorterList<Integer> list2 = new SorterList<>();
        list2.add(1);
        list2.add(3);
        list2.add(2);
        list2.mergeSort();
        Iterator<Integer> iter2 = list2.iterator();
        assertEquals("\"mergeSort()\" did not sort correctly.", Integer.valueOf(1), Integer.valueOf(iter2.next()));
        assertEquals("\"mergeSort()\" did not sort correctly.", Integer.valueOf(2), Integer.valueOf(iter2.next()));
        assertEquals("\"mergeSort()\" did not sort correctly.", Integer.valueOf(3), Integer.valueOf(iter2.next()));
        
        SorterList<Double> list3 = new SorterList<>();
        list3.add(0.87);
        list3.add(0.85);
        list3.add(0.86);
        list3.mergeSort();
        Iterator<Double> iter3 = list3.iterator();
        assertEquals("\"mergeSort()\" did not sort correctly.", Double.valueOf(0.85), Double.valueOf(iter3.next()));
        assertEquals("\"mergeSort()\" did not sort correctly.", Double.valueOf(0.86), Double.valueOf(iter3.next()));
        assertEquals("\"mergeSort()\" did not sort correctly.", Double.valueOf(0.87), Double.valueOf(iter3.next()));
    }
    
//    @Test()
//    public void testMergeSort2() {
//        SorterList<String> list = new SorterList<>();
//        list.add("A");
//        list.mergeSort();
//        assertNotEquals(null, list.getNode(0).nextNode);
//        assertNotEquals(null, list.getNode(0).previousNode);
//        
//        list = new SorterList<>();
//        list.add("B");
//        list.add("A");
//        list.mergeSort();
//        assertNotEquals(null, list.getNode(0).nextNode);
//        assertNotEquals(null, list.getNode(0).previousNode);
//        assertNotEquals(null, list.getNode(1).nextNode);
//        assertNotEquals(null, list.getNode(1).previousNode);
//        
//        list = new SorterList<>();
//        list.add("B");
//        list.add("C");
//        list.add("A");
//        list.mergeSort();
//        assertNotEquals(null, list.getNode(0).nextNode);
//        assertNotEquals(null, list.getNode(0).previousNode);
//        assertNotEquals(null, list.getNode(1).nextNode);
//        assertNotEquals(null, list.getNode(1).previousNode);
//        assertNotEquals(null, list.getNode(2).nextNode);
//        assertNotEquals(null, list.getNode(2).previousNode);
//    }
    
    @Test()
    public void testBuiltInComparator() {
        SorterList<Integer> list = new SorterList<>();
        int value = list.getComparator().compare(5, 6);
        assertEquals(-1, value);
        
        value = list.getComparator().compare(5, 5);
        assertEquals(0, value);

        value = list.getComparator().compare(6, 5);
        assertEquals(1, value);
    }
    
    @Test()
    public void testLongUse() {
        SorterList<String> list = new SorterList<>();
        Iterator<String> iter = null;
        list.mergeSort();
        
        for (int i = 0; i < 1000000; i++) {
            list.add("A");
            //list.mergeSort();
            iter = list.iterator();
            assertEquals("\"mergeSort()\" did not sort correctly.", "A", iter.next());
            
            list = new SorterList<>();
            list.add("B");
            list.add("A");
            //list.mergeSort();
            iter = list.iterator();
            assertEquals("\"mergeSort()\" did not sort correctly.", "A", iter.next());
            assertEquals("\"mergeSort()\" did not sort correctly.", "B", iter.next());
            
            list.remove("C");
            list.remove("B");
            list.remove("A");
            assertFalse("\"remove()\" did not remove correctly.", list.contains("A"));
            assertFalse("\"remove()\" did not remove correctly.", list.contains("B"));
            assertFalse("\"remove()\" did not remove correctly.", list.contains("C"));
        }
    }
    
    private class ReverseOrderComparator<T> implements Comparator<T> {
        
        @Override
        public int compare(T o1, T o2) {
            
            // Strings
            if (o1 instanceof String && o2 instanceof String) {
                String s1 = (String) o1;
                String s2 = (String) o2;
                return -s1.compareTo(s2);
            }
            
            // Comparable Objects
            if (o1 instanceof Comparable && o2 instanceof Comparable) {
                Comparable c1 = (Comparable) o1;
                Comparable c2 = (Comparable) o2;
                return -c1.compareTo(c2);
            }
            
            throw new ClassCastException("This built-in from \"" + this.getClass() + "\" "
                    + "cannot be used to compare \"" + o1.getClass()
                    + "Please use a different supported Comparator.");
        }
    }

}
