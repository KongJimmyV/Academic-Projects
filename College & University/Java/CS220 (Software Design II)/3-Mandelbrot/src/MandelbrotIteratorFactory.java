
/* MandelbrotIteratorFactory.java
 *
 * Description (Short): 
 *      - Produces Iterations of the Mandelbrot function up to a limit.
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-6/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/questions-on-assignment-3-5/
 *       
 * Description (Long):  
 *      - Produces Iterations of the Mandelbrot function up to a limit.
 *      - Uses the generic class Factory<Iterator<Complex>,Complex> and has a limit that restrict the Iterator's size.
 *      - There is 1 field variable "limit".
 *      - "limit" is used to determine the max size of the returned Iterator when calling "build()".
 *      
 */

import java.util.Iterator;

/**
 * 
 * 
 * @author ATPHHe
 *
 */
public class MandelbrotIteratorFactory implements Factory<Iterator<Complex>,Complex> {

    /** Limits the size of the Iterator returned by {@code build()}. */
    private final int limit;
    
    /**
     * Constructor for the Mandelbrot Iterator Factory.
     * @param limit
     */
    public MandelbrotIteratorFactory(int limit) {
        this.limit = limit;
    }

    /**
     * Builds an Iterator containing the function of the Mandelbrot Set and returns it.
     * 
     * @return Returns the built Iterator containing the function of the Mandelbrot Set.
     */
    @Override
    public Iterator<Complex> build(Complex item) {
        Complex C = item;
        Complex x = Complex.cpl(0, 0);
        MandelbrotBase mandelbrot = new MandelbrotBase(C);
        Function1Iterator<Complex> iterator = 
                new Function1Iterator<Complex>(mandelbrot, x, this.limit + 1);
        
        return iterator;
    }
    
}
