
/* IterationCounter.java
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
 *      - Uses a generic class Factory<Iterator<X>, X> and has a maximum value to iterate across.
 *      - There are 2 field variables "factory" and "maximum".
 *      - "factory" is used to build an iterator.
 *      - "maximum" is used to determine the max amount of times to iterate across 
 *          an iterator built by "factory".
 *      
 */

import java.io.UncheckedIOException;
import java.util.Iterator;

/**
 * Counts the number of times the result of an iterator's {@code next()} method
 * satisfies the method {@code testItem()}.
 */
public abstract class IterationCounter<X> {

    protected final Factory<Iterator<X>, X> factory;
    protected final int maximum;
    
    /**
     * Initialize the counter for a particular way of building Iterators
     *
     * @param factory
     *            A factory which produces an Iterator given some seed value.
     * @param maximum
     *            The maximum number of calls to next() made on behalf of one call
     *            to countPassing().
     */
    public IterationCounter(final Factory<Iterator<X>, X> factory, 
                            final int maximum) {
        this.factory = factory;
        this.maximum = maximum;
    }

    /**
     * Template method which expresses the condition which each result of next()
     * might satisfy.
     */
    public abstract boolean testItem(X item);

    /**
     * For an Iterator received from the factory for the given value seed, count the
     * number of times its next() method returns a value which satisfies testItem().
     */
    public int countPassingIterations(X seed) {
//        int numOfItemsSatisfied = 0;
//        
//        Iterator<X> i = factory.build(seed);
//        
//        while(i.hasNext()) {
//            if (testItem(i.next()) && numOfItemsSatisfied < this.maximum) {
//                numOfItemsSatisfied++;
//            }
//        }
//        
//        return numOfItemsSatisfied;
        throw new UnsupportedOperationException();
    }
}