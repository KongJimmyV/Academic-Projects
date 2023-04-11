package predicates;

/**
 * <b>File Name:    </b>    Negation.java                       <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class Negation<T> implements Predicate<T> {

    private Predicate<T> reference;
    
    public Negation(Predicate<T> t) {
        this.reference = t;
    }
    
    /**
     * Accepts any object <code>T</code> that is not accepted by the reference.
     * @param t - Object <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(T t) {
        return !reference.accepts(t);
    }
}
