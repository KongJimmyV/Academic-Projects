
/* MandelbrotBaseTests.java
 *
 * Description (Short): 
 *      - Test the class file "MandelbrotBase.java".
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-5/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/questions-on-assignment-3-5/
 *       
 * Description (Long):  
 *      - Test the class file "MandelbrotBase.java".
 *      - The test includes testing of all constructors and methods
 *          of "MandelbrotBase.java".
 */

import static org.junit.Assert.*;
import org.junit.Test;

/**
 * Test for "MandelbrotBase.java".
 * @author Kong Jimmy Vang
 */
public class MandelbrotBaseTests {

    /**
     * Test if the constructor can be built.
     */
    @Test()
    public void testMandelbrotBase() {
        System.out.println("Testing MandelbrotBase().");
        final Function1<Complex> f = new MandelbrotBase(Complex.cpl(2, 3));
    }
    
    /**
     * Test if {@code apply()} meets the correct specifications.
     */
    @Test()
    public void testApply() {
        System.out.println("Testing apply().");
        final Function1<Complex> f = new MandelbrotBase(Complex.cpl(2, 3));
        Complex complexResult = f.apply(Complex.cpl(3, 2));
        
        // fc(3 + 2i) = (3+2i)^2 + c, where c = 2+3i.
        assertEquals("The method \"getReal()\" did not return the correct real number in the results."
                , 7.0
                , complexResult.getReal()
                , 0.0001);
        assertEquals("The method \"getImaginary()\" did not return the correct imaginary number in the results."
                , 15.0
                , complexResult.getImaginary()
                , 0.0001);
        assertEquals("The method \"getMagnitude()\" did not return the correct magnitude in the results."
                , 16.55294536   // Sqrt(7^2 + 15^2);
                , complexResult.getMagnitude()
                , 0.0001);
    }
}
