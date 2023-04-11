
/* Function1.java
 *
 * Description (Short): 
 *      - Represents functions of one variable.
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/mandelbrot-5/
 *       
 * Description (Long):  
 *      - Represents functions of one variable.
 *          Uses the generic type X to represent the one variable.
 *          X can be applied to the function by calling upon apply(X arg)
 *          in a class implementing "Function1".
 */

/**
 * Represents functions of one variable.
 * @author Kong Jimmy Vang
 */
public interface Function1<X> {
    
    /** Apply the function to a value. */
    public X apply(X arg);
    
}