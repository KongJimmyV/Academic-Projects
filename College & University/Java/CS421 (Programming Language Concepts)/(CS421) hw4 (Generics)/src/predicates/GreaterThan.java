package predicates;

/**
 * <b>File Name:    </b>    GreaterThan.java                    <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class GreaterThan<T extends Comparable<T>> implements Predicate<T> {

    private T reference;
    
    public GreaterThan(T t) {
        this.reference = t;
    }
    
    /**
     * Accepts objects of <code>T</code> type that are greater than the reference.
     * @param t - Object <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(T t) {
        return t.compareTo(reference) > 0;
    }
}
