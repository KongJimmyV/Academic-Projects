package predicates;

import java.util.Collection;
import java.util.HashSet;

/**
 * <b>File Name:    </b>    PredicateUtilities.java             <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class PredicateUtilities {
    
    /**
     * Filters out and returns a Collection of <code>T</code> elements of the inputs 
     *      that are accepted by the predicate.
     * @param <T> - Object type <code>T</code>
     * @param c - Inputs.
     * @param p - Predicate.
     * @return Returns a Collection of <code>T</code> elements of the inputs that are accepted by the predicate.
     */
    public static <T> Collection<T> filter(Collection<T> c, Predicate<T> p) {
        Collection<T> acceptedCollection = new HashSet<>();
        for (T element : c) {
            if (p.accepts(element)) {
                acceptedCollection.add(element);
            }
        }
        return acceptedCollection;
    }
}
