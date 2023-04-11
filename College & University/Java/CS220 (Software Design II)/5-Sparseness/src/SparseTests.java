import static org.junit.Assert.*;
import org.junit.Test;

import java.util.function.BiFunction;
import java.util.function.Function;

public class SparseTests {

    @Test()
    public void testSparseArray() {
        
        // Test set() and get().
        final SparseArray<String> saString = new SparseArray<>(6000000000000L, "Q");
        
        saString.set(103, "AA");
        saString.set(34567890, "Z");
        assertEquals("Q", saString.get(0));
        assertEquals("Q", saString.get(20));
        assertEquals("AA", saString.get(103));
        assertEquals("Q", saString.get(9009));
        assertEquals("Z", saString.get(34567890));
        assertEquals("Q", saString.get(9000000000L));
        
        // Test unset().
        saString.unset(0);
        assertEquals("Q", saString.get(0));
        
        saString.unset(103);
        assertEquals("Q", saString.get(103));
        assertNotEquals("AA", saString.get(103));
        
        saString.unset(34567890);
        assertEquals("Q", saString.get(34567890));
        assertNotEquals("Z", saString.get(34567890));
        
        saString.unset(34567890);
        assertEquals("Q", saString.get(34567890));
        assertNotEquals("Z", saString.get(34567890));
        
        // Test isSet().
        saString.set(10, "AA");
        saString.set(100, "AB");
        saString.set(1000, "AC");
        assertTrue(saString.isSet(10));
        assertTrue(saString.isSet(100));
        assertTrue(saString.isSet(1000));
        assertFalse(saString.isSet(11));
        assertFalse(saString.isSet(101));
        assertFalse(saString.isSet(1001));
        
        // Test getDefaultContent().
        assertEquals("Q", saString.getDefaultContent());
        
        // Test getDeclaredSize().
        assertEquals(6000000000000L, saString.getDeclaredSize());
        
        // Test getStoredEntries().
        assertEquals(3, saString.getStoredEntries());
        
        // Test map().
        final SparseArray<Character> saChar = new SparseArray<>(6000000000000L, 'Q');
        saChar.set(10, 'A');
        saChar.set(100, 'B');
        saChar.set(1000, 'C');
        
        SparseArray<Integer> saInt = saChar.map(new CharToIntFunction());
        assertEquals(Integer.valueOf('A'), saInt.get(10));
        assertEquals(Integer.valueOf('B'), saInt.get(100));
        assertEquals(Integer.valueOf('C'), saInt.get(1000));
        assertEquals(Integer.valueOf('Q'), saInt.get(11));
        assertEquals(Integer.valueOf('Q'), saInt.get(101));
        assertEquals(Integer.valueOf('Q'), saInt.get(1001));
        
        // Test combine().
        final SparseArray<Character> saChar2 = new SparseArray<>(6000000000000L, 'Q');
        saChar2.set(50, 'D');
        saChar2.set(500, 'E');
        saChar2.set(5000, 'F');
        saChar2.set(1000, 'G');
        
        SparseArray<Integer> saInt2 = saChar.combine(new CharToIntBiFunction(), saChar2);
        assertEquals(Integer.valueOf('A' + 'Q'), saInt2.get(10));
        assertEquals(Integer.valueOf('B' + 'Q'), saInt2.get(100));
        assertEquals(Integer.valueOf('C' + 'G'), saInt2.get(1000));
        assertEquals(Integer.valueOf('D' + 'Q'), saInt2.get(50));
        assertEquals(Integer.valueOf('E' + 'Q'), saInt2.get(500));
        assertEquals(Integer.valueOf('F' + 'Q'), saInt2.get(5000));
        
        // Test dotProduct().
        final SparseArray<Double> saDouble1 = new SparseArray<>(10000000, 0.0);
        final SparseArray<Double> saDouble2 = new SparseArray<>(10000000, 0.0);
        
        saDouble1.set(1000, 2.6);
        saDouble1.set(2000, 5.4);
        saDouble2.set(1000, 10.2);
        saDouble2.set(2000, 25.6);
        
        Double result = SparseArray.dotProduct(saDouble1, saDouble2);
        assertEquals(164.76 , result.doubleValue(), 0.01);
        
        final SparseArray<Double> saDouble3 = new SparseArray<>(10000000, 2.0);
        final SparseArray<Double> saDouble4 = new SparseArray<>(10000000, 2.0);
        
        saDouble3.set(1000, 2.6);
        saDouble3.set(2000, 5.4);
        saDouble4.set(1000, 10.2);
        saDouble4.set(2000, 25.6);
        
        Double result2 = SparseArray.dotProduct(saDouble3, saDouble4);
        assertEquals(40000156.76 , result2.doubleValue(), 0.01);
    }
    
    @Test()
    public void testSparseMatrix() {
        
        // Test set() and get().
        final SparseMatrix<String> sm = 
                new SparseMatrix<String>((long)6000000000000.0, (long)6000000000000.0, "Q");
        sm.set(103, 103, "A");
        sm.set(103, 104, "AA");
        sm.set(104, 105, "AAA");
        sm.set(104, 106, "AAAA");
        sm.set(34567890, 34567890, "Z");
        sm.set(34567890, 34567891, "ZZ");
        sm.set(34567891, 34567892, "ZZZ");
        sm.set(34567891, 34567893, "ZZZZ");
        assertEquals("Q", sm.get(0, 0));
        assertEquals("Q", sm.get(20, 20));
        assertEquals("A", sm.get(103, 103));
        assertEquals("Q", sm.get(9009, 9009));
        assertEquals("Z", sm.get(34567890, 34567890));
        assertEquals("Q", sm.get((long) 9000000000.0, (long) 9000000000.0));
        sm.print();
        System.out.println();
        
        assertEquals(8, sm.getStoredEntries());
        
        // Test isSet().
        assertTrue(sm.isSet(103, 103));
        assertTrue(sm.isSet(103, 104));
        assertTrue(sm.isSet(104, 105));
        assertTrue(sm.isSet(104, 106));
        assertTrue(sm.isSet(34567890, 34567890));
        assertTrue(sm.isSet(34567890, 34567891));
        assertTrue(sm.isSet(34567891, 34567892));
        assertTrue(sm.isSet(34567891, 34567893));
        assertFalse(sm.isSet(103, 100));
        assertFalse(sm.isSet(103, 100));
        assertFalse(sm.isSet(104, 100));
        assertFalse(sm.isSet(104, 100));
        assertFalse(sm.isSet(34567890, 3456789));
        assertFalse(sm.isSet(34567890, 3456789));
        assertFalse(sm.isSet(34567891, 3456789));
        assertFalse(sm.isSet(34567891, 3456789));
        
        // Test unset().
        sm.unset(103, 103);
        assertEquals("Q", sm.get(103, 103));
        assertEquals(7, sm.getStoredEntries());
        sm.print();
        System.out.println();
        
        sm.unset(103, 104);
        assertEquals("Q", sm.get(103, 104));
        assertEquals(6, sm.getStoredEntries());
        sm.print();
        System.out.println();
        
        sm.unset(34567890, 34567890);
        assertEquals("Q", sm.get(103, 104));
        assertEquals(5, sm.getStoredEntries());
        sm.print();
        System.out.println();
        
        sm.unset(34567890, 34567891);
        assertEquals("Q", sm.get(103, 104));
        assertEquals(4, sm.getStoredEntries());
        sm.print();
        System.out.println();
        
        // Test map().
        final SparseMatrix<Character> smChar = 
                new SparseMatrix<>(
                        (long)6000000000000.0, 
                        (long)6000000000000.0, 
                        'Q');
        
        smChar.set(10, 10, 'A');
        smChar.set(100, 100, 'B');
        smChar.set(1000, 1000, 'C');
        
        SparseMatrix<Integer> smInt = smChar.map(new CharToIntFunction());
        assertEquals(Integer.valueOf('A'), smInt.get(10, 10));
        assertEquals(Integer.valueOf('B'), smInt.get(100, 100));
        assertEquals(Integer.valueOf('C'), smInt.get(1000, 1000));
        assertEquals(Integer.valueOf('Q'), smInt.get(11, 10));
        assertEquals(Integer.valueOf('Q'), smInt.get(101, 100));
        assertEquals(Integer.valueOf('Q'), smInt.get(1001, 1000));
        
        // Test combine().
        final SparseMatrix<Character> smChar2 = 
                new SparseMatrix<>(
                        (long)6000000000000.0, 
                        (long)6000000000000.0, 
                        'Q');
        
        smChar2.set(50, 50, 'D');
        smChar2.set(500, 500, 'E');
        smChar2.set(5000, 5000, 'F');
        smChar2.set(1000, 1000, 'G');
        
        SparseMatrix<Integer> smInt2 = smChar.combine(new CharToIntBiFunction(), smChar2);
        
        assertEquals(Integer.valueOf('A' + 'Q'), smInt2.get(10, 10));
        assertEquals(Integer.valueOf('B' + 'Q'), smInt2.get(100, 100));
        assertEquals(Integer.valueOf('C' + 'G'), smInt2.get(1000, 1000));
        assertEquals(Integer.valueOf('D' + 'Q'), smInt2.get(50, 50));
        assertEquals(Integer.valueOf('E' + 'Q'), smInt2.get(500, 500));
        assertEquals(Integer.valueOf('F' + 'Q'), smInt2.get(5000, 5000));
        
        // Test matrixAdd().
        final SparseMatrix<Double> smDouble1 = new SparseMatrix<>(10000000, 10000000, 0.0);
        final SparseMatrix<Double> smDouble2 = new SparseMatrix<>(10000000, 10000000, 0.0);
        
        smDouble1.set(1000, 1000, 2.6);
        smDouble1.set(2000, 2000, 5.4);
        smDouble2.set(1000, 1000, 10.2);
        smDouble2.set(2000, 2000, 25.6);
        
        SparseMatrix<Double> result = SparseMatrix.matrixAdd(smDouble1, smDouble2);
        assertEquals(12.8, result.get(1000, 1000), 0.01);
        assertEquals(31.0, result.get(2000, 2000), 0.01);
        assertEquals(0.0, result.get(25, 25), 0.01);
        
        final SparseMatrix<Double> smDouble3 = new SparseMatrix<>(10000000, 10000000, 2.0);
        final SparseMatrix<Double> smDouble4 = new SparseMatrix<>(10000000, 10000000, 2.0);
        
        smDouble3.set(1000, 1000, 2.6);
        smDouble3.set(2000, 2000, 5.4);
        smDouble4.set(1000, 1000, 10.2);
        smDouble4.set(2000, 2000, 25.6);
        
        SparseMatrix<Double> result2 = SparseMatrix.matrixAdd(smDouble3, smDouble4);
        assertEquals(12.8, result2.get(1000, 1000), 0.01);
        assertEquals(31.0, result2.get(2000, 2000), 0.01);
        assertEquals(4.0, result2.get(25, 25), 0.01);
        
        final SparseMatrix<Double> smDouble5 = new SparseMatrix<>(10000000, 10000000);
        final SparseMatrix<Double> smDouble6 = new SparseMatrix<>(10000000, 10000000);
        
        smDouble5.set(1000, 1000, 2.6);
        smDouble5.set(2000, 2000, 5.4);
        smDouble6.set(1000, 1000, 10.2);
        smDouble6.set(2000, 2000, 25.6);
        smDouble6.set(3000, 2000, 25.6);
        
        SparseMatrix<Double> result3 = SparseMatrix.matrixAdd(smDouble5, smDouble6);
        assertEquals(12.8, result3.get(1000, 1000), 0.01);
        assertEquals(31.0, result3.get(2000, 2000), 0.01);
        assertNull(result3.get(25, 25));
    }
    
    @Test()
    public void testNull() {
        final SparseArray<String> saString = new SparseArray<>((long)6000000000000.0);
        saString.set(105, "A");
        assertEquals("A", saString.get(105));
        assertNull(saString.get(106));
        
        final SparseMatrix<String> smString = 
                new SparseMatrix<>((long)6000000000000.0, (long)6000000000000.0);
        smString.set(105, 105, "A");
        assertEquals("A", smString.get(105, 105));
        assertNull(smString.get(106, 105));
    }
    
    @Test(expected = ArrayIndexOutOfBoundsException.class)
    public void testIndexOutOfBoundsException() {
        final SparseArray<String> saString = new SparseArray<>((long)6000000000000.0, "Q");
        saString.set(105, "A");
        saString.get(-1);
    }
    
    @Test(expected = ArrayIndexOutOfBoundsException.class)
    public void testIndexOutOfBoundsException2() {
        final SparseArray<String> saString = new SparseArray<>((long)6000000000000.0, "Q");
        saString.set(105, "A");
        saString.get(saString.getDeclaredSize());
    }
    
    @Test(expected = ArrayIndexOutOfBoundsException.class)
    public void testIndexOutOfBoundsException3() {
        final SparseMatrix<String> smString = 
                new SparseMatrix<>((long)6000000000000.0, (long)6000000000000.0, "Q");
        smString.set(105, 95, "A");
        smString.get(-1, -1);
    }
    
    @Test(expected = ArrayIndexOutOfBoundsException.class)
    public void testIndexOutOfBoundsException4() {
        final SparseMatrix<String> smString = 
                new SparseMatrix<>((long)6000000000000.0, (long)6000000000000.0, "Q");
        smString.set(105, 95, "A");
        smString.get(smString.getDeclaredRows(), smString.getDeclaredColumns());
    }
    
    @Test(expected = IllegalArgumentException.class)
    public void testIllegalArgumentException() {
        final SparseArray<Double> array1 = new SparseArray<>((long)6000000000000.0, 0.0);
        final SparseArray<Double> array2 = new SparseArray<>((long)6000000000001.0, 0.0);
        array1.set(105, 1.5);
        array2.set(105, 1.5);
        SparseArray.dotProduct(array1, array2);
    }
    
    @Test(expected = IllegalArgumentException.class)
    public void testIllegalArgumentException2() {
        final SparseMatrix<Double> matrix1 = 
                new SparseMatrix<>((long)6000000000000.0, (long)6000000000000.0, 0.0);
        final SparseMatrix<Double> matrix2 = 
                new SparseMatrix<>((long)6000000000001.0, (long)6000000000000.0, 0.0);
        matrix1.set(105, 95, 1.5);
        matrix2.set(105, 95, 1.5);
        SparseMatrix.matrixAdd(matrix1, matrix2);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testIllegalArgumentException3() {
        final SparseMatrix<Double> matrix1 = 
                new SparseMatrix<>((long)6000000000000.0, (long)6000000000000.0, 0.0);
        final SparseMatrix<Double> matrix2 = 
                new SparseMatrix<>((long)6000000000000.0, (long)6000000000001.0, 0.0);
        matrix1.set(105, 95, 1.5);
        matrix2.set(105, 95, 1.5);
        SparseMatrix.matrixAdd(matrix1, matrix2);
    }
    
    public class CharToIntFunction implements Function<Character, Integer> {

        @Override
        public Integer apply(Character t) {
            return (int) t.charValue();
        }
        
    }
    public class IntToCharFunction implements Function<Integer, Character> {

        @Override
        public Character apply(Integer t) {
            return (char) t.intValue();
        }
        
    }
    public class CharToIntBiFunction implements BiFunction<Character, Character, Integer> {

        @Override
        public Integer apply(Character t, Character u) {
            return (int) (t.charValue() + u.charValue());
        }
        
    }
    public class IntToCharBiFunction implements BiFunction<Integer, Integer, Character> {

        @Override
        public Character apply(Integer t, Integer u) {
            return (char) (t.intValue() + u.intValue());
        }
        
    }
    
    
}
