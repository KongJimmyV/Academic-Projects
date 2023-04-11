
/* Complex.java
 *
 * Description (Short): 
 *      - This class represents a single complex number.
 *
 * Author: John Maraist
 * Edited/Implemented by: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://mathworld.wolfram.com/ComplexNumber.html
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-1/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-2/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-4/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-5/
 *       
 * Description (Long):  
 *      - This class, when instantiated as an object, will represent 
 *          a single complex number.
 *          
 *      - The methods in this class are able to perform simple
 *          arithmetic on the complex number including adding,
 *          subtracting, multiplication, and division.
 */

/**
 * Complex numbers and arithmetic.
 */
public class Complex {

    private double real;
    private double imaginary;
    
    /**
     * A convenient method, shorter than a constructor call, for creating complex
     * numbers.
     * 
     * @param real - The real component of the number.
     * @param imaginary - The imaginary component of the number.
     * @return Returns an immutable instance of <code>Complex</code> representing the
     *         indicated number.
     */
    public static Complex cpl(double real, double imaginary) {
        return new Complex(real, imaginary);
    }
    
    /** 
     * Create a single complex number.
     * 
     * @param real - The real component of the number.
     * @param imaginary - The imaginary component of the number.
     */
    private Complex(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }
    
    /** The real component of this number. */
    public double getReal() {
        return this.real;
    }

    /** The imaginary component of this number. */
    public double getImaginary() {
        return this.imaginary;
    }

    /** Returns <code>true</code> if this number is zero. */
    public boolean isZero() {
        return this.real == 0 && this.imaginary == 0;
    }

    /**
     * The magnitude of this number, calculated as the square root of the sum of the
     * square of the real component and the square of the imaginary component.
     */
    public double getMagnitude() {
        return Math.sqrt(
                Math.pow(this.real, 2) + Math.pow(this.imaginary, 2));
    }

    /**
     * Returns the sum of this number and <code>that</code>. Does not change either
     * <code>this</code> or the argument. We use the standard definition of complex
     * arithmetic; see for example http://mathworld.wolfram.com/ComplexNumber.html .
     */
    public Complex add(Complex that) {
        return new Complex(
                this.real + that.real, 
                this.imaginary + that.imaginary);
    }

    /**
     * Returns the difference of this number and <code>that</code>. Does not change
     * either <code>this</code> or the argument. We use the standard definition of
     * complex arithmetic; see for example
     * http://mathworld.wolfram.com/ComplexNumber.html .
     */
    public Complex subtract(Complex that) {
        return new Complex(
                this.real - that.real, 
                this.imaginary - that.imaginary);
    }

    /**
     * Returns the product of this number and <code>that</code>. Does not change
     * either <code>this</code> or the argument. We use the standard definition of
     * complex arithmetic; see for example
     * http://mathworld.wolfram.com/ComplexNumber.html .
     */
    public Complex multiply(Complex that) {
        double a = this.getReal();
        double b = this.getImaginary();
        double c = that.getReal();
        double d = that.getImaginary();
        
        return new Complex(
                (a*c - b*d), 
                (a*d + b*c));
    }

    /**
     * Returns the quotient of this number over <code>that</code>. Does not change
     * either <code>this</code> or the argument. We use the standard definition of
     * complex arithmetic; see for example
     * http://mathworld.wolfram.com/ComplexNumber.html .
     */
    public Complex dividedBy(Complex that) {
        double a = this.getReal();
        double b = this.getImaginary();
        double c = that.getReal();
        double d = that.getImaginary();
        
        return new Complex(
                (a*c + b*d) / (Math.pow(c, 2) + Math.pow(d, 2)), 
                (b*c - a*d) / (Math.pow(c, 2) + Math.pow(d, 2)));
    }
}