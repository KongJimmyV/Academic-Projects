
/* ComplexTests.java
 *
 * Description (Short): 
 *       - This class contains JUnit Tests to test the methods of "Complex.java".
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *       - http://mathworld.wolfram.com/ComplexNumber.html
 *       - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot/
 *       - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-1/
 *       - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-3/
 *       - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-5/
 *       
 * Description (Long):  
 *       - This class contains JUnit Tests to test the methods of "Complex.java".
 *          This will tests if "Complex.java" meets all given requirements/specifications
 *          derived from the URLs above.
 */

import static org.junit.Assert.*;
import org.junit.Test;

/**
 * A JUnit Test class that tests another class, {@code Complex.java}, to see 
 * if it meet the specifications/requirements.
 * 
 * @author Kong Jimmy Vang
 *
 */
public class ComplexTests {
    
    // Test Variables for Loops
    private final double DELTA          = 0.1;
    private double real                 = 0;
    private double imaginary            = 0;
    private double magnitude            = 0;
    
    /**
     * Test getReal().
     */
    @Test()
    public void testGetReal () {
        System.out.println("Testing getReal()");
        
        // Test the real numbers of -100 to 100.
        real = 0;
        Complex c = Complex.cpl(real, 0);
        assertEquals("Wrong real number initialized: ", real, c.getReal(), DELTA);
        
        for (real = -100; real <= 100; real += 0.5) {
            c = Complex.cpl(real, 0);
            assertEquals("Wrong real number initialized: ", real, c.getReal(), DELTA);
        }
        
        // Test the real number of Double's max value.
        real = Double.MAX_VALUE;
        c = Complex.cpl(real, 0);
        assertEquals("Wrong real number initialized: ", real, c.getReal(), DELTA);
        
        // Test the real number of Double's min value.
        real = Double.MIN_VALUE;
        c = Complex.cpl(real, 0);
        assertEquals("Wrong real number initialized: ", real, c.getReal(), DELTA);
        
    }
    
    /**
     * Test getImaginary().
     */
    @Test()
    public void testGetImaginary() {
        System.out.println("Testing getImaginary()");
        
        // Test the complex numbers of -100 to 100.
        imaginary = 0;
        Complex c = Complex.cpl(0, imaginary);
        assertEquals("Wrong imaginary number initialized: ", imaginary, c.getImaginary(), DELTA);
        
        for (imaginary = -100; imaginary <= 100; imaginary += 0.5) {
            c = Complex.cpl(0, imaginary);
            assertEquals("Wrong imaginary number initialized: ", imaginary, c.getImaginary(), DELTA);
        }
        
        // Test the complex number of Double's max value.
        imaginary = Double.MAX_VALUE;
        c = Complex.cpl(0, imaginary);
        assertEquals("Wrong imaginary number initialized: ", imaginary, c.getImaginary(), DELTA);
        
        // Test the complex number of Double's min value.
        imaginary = Double.MIN_VALUE;
        c = Complex.cpl(0, imaginary);
        assertEquals("Wrong imaginary number initialized: ", imaginary, c.getImaginary(), DELTA);
        
    }
    
    /**
     * Test isZero().
     */
    @Test()
    public void testIsZero() {
        System.out.println("Testing isZero()");
        
        real = 0;
        imaginary = 0;
        Complex c = Complex.cpl(real, imaginary);
        assertTrue("\"isZero()\" should return true: ", c.isZero());
        
        // Test the real and imaginary numbers from -100 to 100.
        for (real = -100; real <= 100; real += 0.5) {
            for (imaginary = -100; imaginary <= 100; imaginary += 0.5) {
                if (real == 0 && imaginary == 0) {
                    continue;
                }
                
                c = Complex.cpl(real, imaginary);
                assertFalse("\"isZero()\" should return false: ", c.isZero());
            }
        }
        
    }
    
    /**
     * Test getMagnitude().
     */
    @Test()
    public void testGetMagnitude() {
        System.out.println("Testing getMagnitude()");
        // Test the real and imaginary numbers from -100 to 100.
        for (real = -100; real <= 100; real += 0.5) {
            for (imaginary = -100; imaginary <= 100; imaginary += 0.5) {
                
                magnitude = Math.sqrt(Math.pow(real, 2) + Math.pow(imaginary, 2));
                Complex c = Complex.cpl(real, imaginary);
                
                assertEquals("Wrong magnitude calculated: ", magnitude, c.getMagnitude(), DELTA);
            }
        }
    }
    
    /**
     * Test add().
     */
    @Test()
    public void testAdd() {
        System.out.println("Testing add()");
        // Test the real and imaginary numbers from -100 to 100.
        for (real = -100; real <= 100; real += 0.5) {
            for (imaginary = -100; imaginary <= 100; imaginary += 0.5) {
                
                Complex c1 = Complex.cpl(real, imaginary);
                Complex c2 = Complex.cpl(20, 20);
                
                double a = c1.getReal();
                double b = c1.getImaginary();
                double c = c2.getReal();
                double d = c2.getImaginary();
                
                double expectedReal = a + c;
                double expectedImaginary = b + d;
                magnitude = Math.sqrt(Math.pow(expectedReal, 2) + Math.pow(expectedImaginary, 2));
                
                Complex result = c1.add(c2);
                
                assertEquals("Wrong real number calculated: ", expectedReal, result.getReal(), DELTA);
                assertEquals("Wrong imaginary number calculated: ", expectedImaginary, result.getImaginary(), DELTA);
                assertEquals("Wrong magnitude calculated: ", magnitude, result.getMagnitude(), DELTA);
            }
        }
    }
    
    /**
     * Test subtract().
     */
    @Test()
    public void testSubtract() {
        System.out.println("Testing subtract()");
        // Test the real and imaginary numbers from -100 to 100.
        for (real = -100; real <= 100; real += 0.5) {
            for (imaginary = -100; imaginary <= 100; imaginary += 0.5) {
                
                Complex c1 = Complex.cpl(real, imaginary);
                Complex c2 = Complex.cpl(20, 20);
                
                double a = c1.getReal();
                double b = c1.getImaginary();
                double c = c2.getReal();
                double d = c2.getImaginary();

                double expectedReal = a - c;
                double expectedImaginary = b - d;
                magnitude = Math.sqrt(Math.pow(expectedReal, 2) + Math.pow(expectedImaginary, 2));
                
                Complex result = c1.subtract(c2);
                
                assertEquals("Wrong real number calculated: ", expectedReal, result.getReal(), DELTA);
                assertEquals("Wrong imaginary number calculated: ", expectedImaginary, result.getImaginary(), DELTA);
                assertEquals("Wrong magnitude calculated: ", magnitude, result.getMagnitude(), DELTA);
            }
        }
    }
    
    /**
     * Test multiply().
     */
    @Test()
    public void testMultiply() {
        System.out.println("Testing multiply()");
        // Test the real and imaginary numbers from -100 to 100.
        for (real = -100; real <= 100; real += 0.5) {
            for (imaginary = -100; imaginary <= 100; imaginary += 0.5) {
                
                Complex c1 = Complex.cpl(real, imaginary);
                Complex c2 = Complex.cpl(20, 20);
                
                double a = c1.getReal();
                double b = c1.getImaginary();
                double c = c2.getReal();
                double d = c2.getImaginary();
                
                double expectedReal = (a*c - b*d);
                double expectedImaginary = (a*d + b*c);
                magnitude = Math.sqrt(Math.pow(expectedReal, 2) + Math.pow(expectedImaginary, 2));
                
                Complex result = c1.multiply(c2);
                
                assertEquals("Wrong real number calculated: ", expectedReal, result.getReal(), DELTA);
                assertEquals("Wrong imaginary number calculated: ", expectedImaginary, result.getImaginary(), DELTA);
                assertEquals("Wrong magnitude calculated: ", magnitude, result.getMagnitude(), DELTA);
            }
        }
    }
    
    /**
     * Test dividedBy().
     */
    @Test()
    public void testDividedBy() {
        System.out.println("Testing dividedBy()");
        
        // Test the real and imaginary numbers from -100 to 100.
        for (real = -100; real <= 100; real += 0.5) {
            for (imaginary = -100; imaginary <= 100; imaginary += 0.5) {
                
                Complex c1 = Complex.cpl(real, imaginary);
                Complex c2 = Complex.cpl(20, 20);
                
                double a = c1.getReal();
                double b = c1.getImaginary();
                double c = c2.getReal();
                double d = c2.getImaginary();
                
                double expectedReal = (a*c + b*d) / (Math.pow(c, 2) + Math.pow(d, 2));
                double expectedImaginary = (b*c - a*d) / (Math.pow(c, 2) + Math.pow(d, 2));
                magnitude = Math.sqrt(Math.pow(expectedReal, 2) + Math.pow(expectedImaginary, 2));
                
                Complex result = c1.dividedBy(c2);
                
                assertEquals("Wrong real number calculated: ", expectedReal, result.getReal(), DELTA);
                assertEquals("Wrong imaginary number calculated: ", expectedImaginary, result.getImaginary(), DELTA);
                assertEquals("Wrong magnitude calculated: ", magnitude, result.getMagnitude(), DELTA);
            }
        }
    }
    
}