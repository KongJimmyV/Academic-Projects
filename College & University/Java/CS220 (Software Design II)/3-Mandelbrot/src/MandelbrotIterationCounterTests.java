
/* MandelbrotIterationCounterTests.java
 *
 * Description (Short): 
 *      - Test the class file "MandelbrotIterationCounter.java".
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-6/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/questions-on-assignment-3-5/
 *       
 * Description (Long):  
 *      - Test the class file "MandelbrotIterationCounter.java".
 *      - The test includes testing of all constructors and methods
 *          of "MandelbrotIterationCounter.java".
 *      
 */

import static org.junit.Assert.*;
import org.junit.Test;

/**
 * Test for "MandelbrotIterationCounter.java".
 * @author Kong Jimmy Vang
 */
public class MandelbrotIterationCounterTests {

    /**
     * Test if the constructor can be built.
     */
    @Test()
    public void testMandelbrotIterationCounter() {
        System.out.println("Testing MandelbrotIterationCounter().");
        MandelbrotIterationCounter mIC = 
                new MandelbrotIterationCounter(
                        2.0, 
                        2);
    }
    
    /**
     * Test if {@code testItem()} meets specifications.
     */
    @Test(expected = UnsupportedOperationException.class)
    public void testTestItem() {
        System.out.println("Testing testItem().");
        Complex c = Complex.cpl(0, 0);
        assertTrue("ERROR: \"testItem()\" must return true.",
                new MandelbrotIterationCounter(2.0, 10)
                .testItem(c));
    }
    
    /**
     * Test if {@code countPassingIterations()} meets specifications.
     */
    @Test(expected = UnsupportedOperationException.class)
    public void testCountPassingIterations() {
        System.out.println("Testing countPassingIterations().");
        Complex seed = Complex.cpl(0, 0);
        assertEquals("ERROR: \"countPassingIterations()\" must equal ???.",
                new MandelbrotIterationCounter(2.0, 10)
                .countPassingIterations(seed));
    }
}
