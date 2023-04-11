package predicates;

import java.util.Collection;
import java.util.HashSet;

/**
 * <b>File Name:    </b>    Or.java                             <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class Or<T> implements Predicate<T> {

    private Collection<Predicate<T>> reference;
    
    @SafeVarargs
    public Or(Predicate<T> ... ts) {
        this.reference = new HashSet<>();
        for (int i = 0; i < ts.length; i++) {
            reference.add(ts[i]);
        }
    }
    
    /**
     * Accepts an element if it is accepted by at least one of the reference predicates. 
     * If there are no reference predicates, the accepts method will return false.
     * @param t - Object <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(T t) {
        for (Predicate<T> p : reference) {
            if (p.accepts(t)) {
                return true;
            }
        }
        return false;
    }
}