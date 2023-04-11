/* Complex.java
 *
 * Abstract specification of methods supported for complex numbers.
 *
 * Author: John Maraist
 *
 * We use this version of this class to allow us to write tests on
 * method behavior which we can be certain will compile.
 */

/**
 * Complex numbers and arithmetic.
 */
public abstract class Complex_backup {

    /**
     * A convenence method, shorter than a constructor call, for creating complex
     * numbers.
     * 
     * @param real The real component of the number.
     * @param imaginary The imaginary component of the number.
     * @return An immutable instance of <code>Complex</code> representing the
     *         indicated number.
     */
    public static Complex cpl(double real, double imaginary) {
        throw new UnsupportedOperationException();
    }

    /** The real component of this number. */
    public abstract double getReal();

    /** The imaginary component of this number. */
    public abstract double getImaginary();

    /** Returns <code>true</code> if this number is zero. */
    public abstract boolean isZero();

    /**
     * The magnitude of this number, calculated as the square root of the sum of the
     * square of the real component and the square of the imaginary component.
     */
    public abstract double getMagnitude();

    /**
     * Returns the sum of this number and <code>that</code>. Does not change either
     * <code>this</code> or the argument. We use the standard definition of complex
     * arithmetic; see for example http://mathworld.wolfram.com/ComplexNumber.html .
     */
    public abstract Complex add(Complex that);

    /**
     * Returns the difference of this number and <code>that</code>. Does not change
     * either <code>this</code> or the argument. We use the standard definition of
     * complex arithmetic; see for example
     * http://mathworld.wolfram.com/ComplexNumber.html .
     */
    public abstract Complex subtract(Complex that);

    /**
     * Returns the product of this number and <code>that</code>. Does not change
     * either <code>this</code> or the argument. We use the standard definition of
     * complex arithmetic; see for example
     * http://mathworld.wolfram.com/ComplexNumber.html .
     */
    public abstract Complex multiply(Complex that);

    /**
     * Returns the quotient of this number over <code>that</code>. Does not change
     * either <code>this</code> or the argument. We use the standard definition of
     * complex arithmetic; see for example
     * http://mathworld.wolfram.com/ComplexNumber.html .
     */
    public abstract Complex dividedBy(Complex that);
}