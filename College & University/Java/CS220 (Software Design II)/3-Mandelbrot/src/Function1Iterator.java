
/* Function1Iterator.java
 *
 * Description (Short): 
 *      - Generates the sequence of values arising from successive applications of a function.
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://javapapers.com/core-java/java-iterator/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-5/
 *       
 * Description (Long):  
 *      - Implements the class Iterator.
 */

import java.util.ArrayList;
import java.util.Iterator;
import java.util.NoSuchElementException;

/**
 * Generates the sequence of values arising from successive applications of a function.
 * @author Kong Jimmy Vang
 */
public class Function1Iterator<X> implements Iterator<X> {
    
    /** The function which takes in a type X. */
    private final Function1<X> function;
    
    /** The current x value of the function f(x). */
    private X initial;
    
    /** The maximum amount of iterations of the function f(x). */
    private int maxIterations;
    
    /** The counter which shows the current iteration of the function f(x). */
    private int currentIteration;
    
    public Function1Iterator(final Function1<X> function, final X initial) {
        this(function, initial, Integer.MAX_VALUE);
    }

    public Function1Iterator(final Function1<X> function,
            final X initial,
            final int maxIterations) {
        this.function = function;
        this.initial = initial;
        this.maxIterations = maxIterations;
        this.currentIteration = 0;
    }
    
    /**
     * The Mandelbrot Set is a fractal and has a boundary which is infinite, 
     *      which means that this method will always return true.
     *      
     * @return Always returns true.
     */
    @Override
    public boolean hasNext() {
        if (this.currentIteration < this.maxIterations) {
            return true;
        } else { //if (this.currentIteration >= this.maxIterations) {
            return false;
        }
        
    }

    /**
     * Returns the current result of f(x).
     * Apply (plug in) x into the function f(x) and iterate (or set) x to equal the new f(x).
     * 
     * @return Returns the current result of f(x) before iterating x.
     */
    @Override
    public X next() {
        if (this.hasNext() == false) {
            throw new NoSuchElementException();
            
        } else {
            X current = this.initial;
            
            // Apply (plug in) x into the function f(x) and iterate (or set) x to equal the new f(x).
            this.initial = function.apply(this.initial);
            this.currentIteration++;
            return current;
        }
    }
}