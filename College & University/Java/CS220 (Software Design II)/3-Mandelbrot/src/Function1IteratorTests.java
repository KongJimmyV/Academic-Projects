
/* Function1IteratorTests.java
 *
 * Description (Short): 
 *      - Test the class file "Function1Iterator.java".
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-5/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/questions-on-assignment-3-5/
 *       
 * Description (Long):  
 *      - Test the class file "Function1Iterator.java".
 *      - The test includes testing of all constructors and methods
 *          of "Function1Iterator.java".
 *      
 */

import static org.junit.Assert.*;

import java.util.NoSuchElementException;

import org.junit.Test;

/**
 * Test for "Function1Iterator.java".
 * @author Kong Jimmy Vang
 */
public class Function1IteratorTests {
    
    /**
     * Test if the constructor can be built.
     */
    @Test()
    public void testFunction1Iterator() {
        System.out.println("Testing Function1Iterator()");
        Complex C = Complex.cpl(2, 3);
        Complex x = Complex.cpl(3, 2);
        MandelbrotBase mandelbrot = new MandelbrotBase(C);
        Function1Iterator<Complex> iterator = 
                new Function1Iterator<Complex>(mandelbrot, x);
    }

    /**
     * Test if {@code hasNext()} meets the correct specifications.
     */
    @Test()
    public void testHasNext() {
        System.out.println("Testing hasNext()");
        Complex C = Complex.cpl(2, 3);
        Complex x = Complex.cpl(3, 2);
        MandelbrotBase mandelbrot = new MandelbrotBase(C);
        
        Function1Iterator<Complex> functionIterator = 
                new Function1Iterator<Complex>(mandelbrot, x);
        assertEquals("ERROR: The method \"hasNext()\" did not return true."
                , true
                , functionIterator.hasNext()); 
        
        functionIterator = 
                new Function1Iterator<Complex>(mandelbrot, x, 0);
        assertEquals("ERROR: The method \"hasNext()\" did not return false."
                , false
                , functionIterator.hasNext()); 
        
    }

    /**
     * Test if {@code next()} meets the correct specifications.
     */
    @Test()
    public void testNext() {
        System.out.println("Testing next()");
        Complex C = Complex.cpl(2, 3);
        Complex x = Complex.cpl(3, 2);
        MandelbrotBase mandelbrot = new MandelbrotBase(C);
        Function1Iterator<Complex> iterator = 
                new Function1Iterator<Complex>(mandelbrot, x);
        
        Complex complexResult = null;
        
        // 1st (initial) Iteration of the Mandelbrot function.
        complexResult = iterator.next();
        assertEquals("ERROR: The 1st iteration of \"next()\" did not return the "
                    + "correct real number from the MandelbrotBase function."
                , 3.0, complexResult.getReal(), 0.0001);
        assertEquals("ERROR: The 1st iteration of \"next()\" did not return the "
                    + "correct imaginary number from the MandelbrotBase function."
                , 2.0, complexResult.getImaginary(), 0.0001);
        assertEquals("ERROR: The 1st iteration of \"next()\" did not return the "
                    + "correct magnitude from the MandelbrotBase function."
                , 3.605551265, complexResult.getMagnitude(), 0.0001);
        
        // 2nd (next) Iteration of the Mandelbrot function.
        complexResult = iterator.next();
        assertEquals("ERROR: The 2nd iteration of \"next()\" did not return the "
                    + "correct real number from the MandelbrotBase function."
                , 7.0, complexResult.getReal(), 0.0001);
        assertEquals("ERROR: The 2nd iteration of \"next()\" did not return the "
                    + "correct imaginary number from the MandelbrotBase function."
                , 15.0, complexResult.getImaginary(), 0.0001);
        assertEquals("ERROR: The 2nd iteration of \"next()\" did not return the "
                    + "correct magnitude from the MandelbrotBase function."
                , 16.55294536, complexResult.getMagnitude(), 0.0001);
    }
    
    /**
     * 1st test of {@code next()}. Checks if the method will correctly throw NoSuchElementException().
     * An exception is expected to be thrown here.
     */
    @Test(expected = NoSuchElementException.class)
    public void testNextNoSuchElementException1() {
        System.out.println("Testing next() for NoSuchElementException. (Version 1)");
        Complex C = Complex.cpl(2, 3);
        Complex x = Complex.cpl(3, 2);
        MandelbrotBase mandelbrot = new MandelbrotBase(C);
        Function1Iterator<Complex> iterator = 
                new Function1Iterator<Complex>(mandelbrot, x, 1);
        
        iterator.next();
        iterator.next();
        iterator.next();
    }
    
    /**
     * 2nd test of {@code next()}. Checks if the method will correctly throw NoSuchElementException().
     * An exception should not be thrown here.
     */
    @Test()
    public void testNextNoSuchElementException2() {
        System.out.println("Testing next() for NoSuchElementException. (Version 2)");
        Complex C = Complex.cpl(2, 3);
        Complex x = Complex.cpl(3, 2);
        MandelbrotBase mandelbrot = new MandelbrotBase(C);
        Function1Iterator<Complex> iterator = 
                new Function1Iterator<Complex>(mandelbrot, x, 1);
        
        iterator.next();
    }
}
