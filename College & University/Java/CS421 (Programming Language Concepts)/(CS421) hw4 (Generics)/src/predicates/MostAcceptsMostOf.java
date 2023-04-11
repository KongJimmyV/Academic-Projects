package predicates;

import java.util.Collection;

/**
 * <b>File Name:    </b>    MostAcceptsMostOf.java              <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class MostAcceptsMostOf<T> implements Predicate<Collection<Predicate<T>>> {

    private Collection<T> reference;
    
    public MostAcceptsMostOf(Collection<T> t) {
        this.reference = t;
    }
    
    /**
     * Accepts a Collection where at least half of (rounded down) the predicates 
     *      in the Collection accept at least half of (rounded down) the reference elements.
     * @param t - Object <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(Collection<Predicate<T>> t) {
        int acceptedPredicates = 0;
        int acceptedReferences = 0;
        int halfPredicates = t.size() / 2;
        int halfReferences = reference.size() / 2;
        
        for (T element : reference) {
            for (Predicate<T> p : t) {
                if (p.accepts(element)) {
                    acceptedReferences++;
                }
                if (acceptedReferences > halfReferences) {
                    acceptedPredicates++;
                    break;
                }
            }
            if (acceptedPredicates > halfPredicates) {
                return true;
            }
            acceptedReferences = 0;
        }
        return false;
    }
}
