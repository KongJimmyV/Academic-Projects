
/* MandelbrotIterationCounterTests.java
 *
 * Description (Short): 
 *      - Test the class file "MandelbrotIteratorFactory.java".
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-6/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/questions-on-assignment-3-5/
 *       
 * Description (Long):  
 *      - Test the class file "MandelbrotIteratorFactory.java".
 *      - The test includes testing of all constructors and methods
 *          of "MandelbrotIteratorFactory.java".
 *      
 */

import static org.junit.Assert.*;
import java.util.Iterator;
import java.util.NoSuchElementException;

import org.junit.Test;

/**
 * Test for "MandelbrotIteratorFactory.java".
 * @author Kong Jimmy Vang
 */
public class MandelbrotIteratorFactoryTests {
    
    /**
     * Test if the constructor can be built.
     */
    @Test()
    public void testMandelbrotIteratorFactory() {
        System.out.println("Testing MandelbrotIteratorFactory().");
        MandelbrotIteratorFactory mIFactory = new MandelbrotIteratorFactory(2);
        
    }

    /**
     * Test if {@code build()}} meets specifications.
     */
    @Test(expected = NoSuchElementException.class)
    public void testBuild() {
        System.out.println("Testing build().");
        int limit = 3;
        MandelbrotIteratorFactory mIFactory = new MandelbrotIteratorFactory(limit);
        Iterator<Complex> iterator = 
                mIFactory.build(Complex.cpl(2, 3));
        
        Complex complexResult = null;

        // 1st Iteration of the Mandelbrot function.
        complexResult = iterator.next();
        System.out.println(complexResult.getReal() + " " + complexResult.getImaginary());
        assertEquals("ERROR: The 1st iteration of \"next()\" did not return the "
                    + "correct real number from the MandelbrotBase function."
                , 0.0, complexResult.getReal(), 0.0001);
        assertEquals("ERROR: The 1st iteration of \"next()\" did not return the "
                    + "correct imaginary number from the MandelbrotBase function."
                , 0.0, complexResult.getImaginary(), 0.0001);
        assertEquals("ERROR: The 1st iteration of \"next()\" did not return the "
                    + "correct magnitude from the MandelbrotBase function."
                , 0, complexResult.getMagnitude(), 0.0001);
        
        // 2nd Iteration of the Mandelbrot function.
        complexResult = iterator.next();
        System.out.println(complexResult.getReal() + " " + complexResult.getImaginary());
        assertEquals("ERROR: The 2nd iteration of \"next()\" did not return the "
                    + "correct real number from the MandelbrotBase function."
                , 2.0, complexResult.getReal(), 0.0001);
        assertEquals("ERROR: The 2nd iteration of \"next()\" did not return the "
                    + "correct imaginary number from the MandelbrotBase function."
                , 3.0, complexResult.getImaginary(), 0.0001);
        assertEquals("ERROR: The 2nd iteration of \"next()\" did not return the "
                    + "correct magnitude from the MandelbrotBase function."
                , 3.605551275, complexResult.getMagnitude(), 0.0001);
        
        // 3rd Iteration of the Mandelbrot function.
        complexResult = iterator.next();
        System.out.println(complexResult.getReal() + " " + complexResult.getImaginary());
        assertEquals("ERROR: The 3rd iteration of \"next()\" did not return the "
                    + "correct real number from the MandelbrotBase function."
                , -3.0, complexResult.getReal(), 0.0001);
        assertEquals("ERROR: The 3rd iteration of \"next()\" did not return the "
                    + "correct imaginary number from the MandelbrotBase function."
                , 15.0, complexResult.getImaginary(), 0.0001);
        assertEquals("ERROR: The 3rd iteration of \"next()\" did not return the "
                    + "correct magnitude from the MandelbrotBase function."
                , 15.29705854, complexResult.getMagnitude(), 0.0001);
        
        // 4th Iteration of the Mandelbrot function.
        complexResult = iterator.next();
        complexResult = iterator.next();
    }
}
