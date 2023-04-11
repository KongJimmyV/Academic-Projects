package predicates;

import java.util.Collection;
import java.util.HashSet;

/**
 * <b>File Name:    </b>    And.java                            <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class And<T> implements Predicate<T> {

    private Collection<Predicate<T>> reference;
    
    @SafeVarargs
    public And(Predicate<T> ... ts) {
        this.reference = new HashSet<>();
        for (int i = 0; i < ts.length; i++) {
            reference.add(ts[i]);
        }
    }
    
    /**
     * Accepts an element if it is accepted by each of the reference predicates. 
     * If there are no reference predicates, the accepts method will return true.
     * @param t - Object <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(T t) {
        for (Predicate<T> p : reference) {
            if (!p.accepts(t)) {
                return false;
            }
        }
        return true;
    }
}
