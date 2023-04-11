
/* MandelbrotIterationCounter.java
 *
 * Description (Short): 
 *      - Counts the number of times the result of an iterator's "next()" method
 *          satisfies the method "testItem()".
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-6/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/questions-on-assignment-3-5/
 *       
 * Description (Long):  
 *      - Counts the number of times the result of an iterator's "next()" method
 *          satisfies the method "testItem()".
 *      - Uses the concrete class MandelbrotIteratorFactory and has a maximum value to iterate across.
 *      - There are 2 field variables "c" and "maximum".
 *      - "c" represents the constant c of the Mandelbrot Set's function.
 *      - "maximum" is used to determine the max amount of times to iterate across 
 *          an iterator built by "factory".
 *      
 */

/**
 * Counts the number of times the result of an iterator's {@code next()} method
 * satisfies the method {@code testItem()}.
 * 
 * @author Kong Jimmy Vang
 */
public class MandelbrotIterationCounter extends IterationCounter<Complex> {
    
    /**
     * Constructor.
     * @param divergenceMagnitude
     * @param maximum
     */
    public MandelbrotIterationCounter(final double divergenceMagnitude,
                                      final int maximum) {
        super(new MandelbrotIteratorFactory(maximum), maximum);
    }

    /**
     * Test the {@code item} if it satisfies the result of the iterator's {@code next()}
     * method.
     * 
     * @param item
     */
    @Override
    public boolean testItem(Complex item) {
        throw new UnsupportedOperationException();
    }

}
