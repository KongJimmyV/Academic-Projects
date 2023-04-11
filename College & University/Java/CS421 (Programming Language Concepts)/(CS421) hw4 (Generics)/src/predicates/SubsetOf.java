package predicates;

import java.util.Collection;

/**
 * <b>File Name:    </b>    SubsetOf.java                       <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class SubsetOf<T> implements Predicate<Collection<? extends T>> {

    private Collection<T> reference;
    
    public SubsetOf(Collection<T> t) {
        this.reference = t;
    }
    
    /**
     * This function operates only on Collections of a generic sub-type 
     *      specified in the constructor and only accepts those collections 
     *      where each of the elements are also elements of the reference Collection.
     * @param t - Collection of any sub-type <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(Collection<? extends T> t) {
        return reference.containsAll(t);
    }
}
