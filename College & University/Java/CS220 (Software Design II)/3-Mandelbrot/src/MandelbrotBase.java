
/* MandelbrotBase.java
 *
 * Description (Short): 
 *      - The "MandelbrotBase" class contains functions for the Mandelbrot Set, fc(x)=x^2 + c.
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-5/
 *       
 * Description (Long):  
 *      - The "MandelbrotBase" class current contains only 2 functions which are the
 *          constructor, and the method apply().
 */

/**
 * Contains functions for the Mandelbrot Set, fc(x)=x^2 + c.
 * @author Kong Jimmy Vang
 */
public class MandelbrotBase implements Function1<Complex> {
    
    /** A complex number that represents the constant "c" in the
     * Mandelbrot Set, fc(x)=x^2 + c.
     * */
    private Complex c;
    
    //*** Constructors/Methods ***
    /**
     * 
     * @param c - a complex number
     */
    public MandelbrotBase(final Complex c) {
        this.c = c;
    }

    /**
     * Apply the function of the Mandelbrot Set to a complex number.
     * @param arg - a complex number.
     */
    @Override
    public Complex apply(final Complex x) {
        return x.multiply(x).add(this.c);
    }

    
    //*** Getters/Setters ***
    
    /** Get the complex number {@code c} stored in this object.
     * @return Returns the complex number {@code c} stored in this object.
     */
    private Complex getC() {
        return c;
    }
    
    /** Set complex number {@code this.c} of this object equal to {@code c}. */
    private void setC(Complex c) {
        this.c = c;
    }
    
    
}
