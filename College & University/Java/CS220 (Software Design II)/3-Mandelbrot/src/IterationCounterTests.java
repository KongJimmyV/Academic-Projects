
/* IterationCounterTests.java
 *
 * Description (Short): 
 *      - Test the class file "IterationCounter.java".
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-6/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/questions-on-assignment-3-5/
 *       
 * Description (Long):  
 *      - Test the class file "IterationCounter.java".
 *      - The test includes testing of all constructors and methods
 *          of "IterationCounter.java".
 *      
 */

import static org.junit.Assert.*;
import java.util.Iterator;
import org.junit.Test;

/**
 * Test for "IterationCounter.java".
 * @author Kong Jimmy Vang
 */
public class IterationCounterTests {
    
    /**
     * This nested class is used for testing IterationCounter methods.
     */
    public class TestIterationCounter extends IterationCounter<Complex> {
        
        public TestIterationCounter(Factory<Iterator<Complex>, Complex> factory, 
                                    int maximum) {
            super(factory, maximum);
        }

        @Override
        public boolean testItem(Complex item) {
            throw new UnsupportedOperationException();
        }
        
    }
    
    /**
     * This nested class is used for testing IterationCounter methods.
     */
    public class TestFactory implements Factory<Iterator<Complex>, Complex> {
    
        public TestFactory() {
            
        }
        
        @Override
        public Iterator<Complex> build(Complex item) {
            throw new UnsupportedOperationException();
        }
        
    }
    
    /**
     * Test if the constructor can be built.
     */
    @Test()
    public void testIterationCounter() {
        System.out.println("Testing IterationCounter().");
        int limit = 2;
        TestIterationCounter iC = 
                new TestIterationCounter(
                        new TestFactory(), 
                        limit);
        
    }
    
    /**
     * Test if {@code testItem()} meets the correct specifications.
     */
    @Test(expected = UnsupportedOperationException.class)
    public void testTestItem() {
        System.out.println("Testing testItem().");
        int limit = 2;
        TestIterationCounter iC = 
                new TestIterationCounter(
                        new TestFactory(), 
                        limit);
        
        Complex item = Complex.cpl(3, 4);
        iC.testItem(item);
        
    }
    
    /**
     * Test if {@code countPassingIterations()} meets the correct specifications.
     */
    @Test(expected = UnsupportedOperationException.class)
    public void testCountPassingIterations() {
        System.out.println("Testing countPassingIterations().");
        int limit = 2;
        TestIterationCounter iC = 
                new TestIterationCounter(
                        new TestFactory(), 
                        limit);
        
        Complex seed = Complex.cpl(3, 4);
        iC.countPassingIterations(seed);
        
    }
    
}
