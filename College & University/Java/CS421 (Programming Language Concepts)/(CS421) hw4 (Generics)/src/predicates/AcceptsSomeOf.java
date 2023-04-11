package predicates;

import java.util.Collection;

/**
 * <b>File Name:    </b>    AcceptsSomeOf.java                  <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class AcceptsSomeOf<T> implements Predicate<Predicate<T>> {

    private Collection<T> reference;
    
    public AcceptsSomeOf(Collection<T> t) {
        this.reference = t;
    }
    
    /**
     * Accepts a predicate that accepts at least one Accepts of the elements of the reference.
     * @param t - Object <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(Predicate<T> t) {
        for (T element : reference) {
            if (t.accepts(element)) {
                return true;
            }
        }
        return false;
    }
}
