package predicates;

import java.util.Collection;

/**
 * <b>File Name:    </b>    AcceptsMostOf.java                  <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class AcceptsMostOf<T> implements Predicate<Predicate<T>> {

    private Collection<T> reference;
    
    public AcceptsMostOf(Collection<T> t) {
        this.reference = t;
    }
    
    /**
     * Accepts a Predicate that itself accepts at least half of (rounded down) 
     *      the reference elements.
     * @param t - Object <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(Predicate<T> t) {
        int acceptedAmt = 0;
        int half = reference.size() / 2;
        
        for (T element : reference) {
            if (t.accepts(element)) {
                acceptedAmt++;
                if (acceptedAmt > half) {
                    return true;
                }
            }
        }
        return false;
    }
}
