package predicates;

/**
 * <b>File Name:    </b>    StartsWith.java                     <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class StartsWith<T extends CharSequence> implements Predicate<T> {

    private T prefix;
    
    public StartsWith(T t) {
        this.prefix = t;
    }
    
    /**
     * Accepts objects of <code>T</code> that start with, in a case-insensitive manner, 
     *      the sequence of characters denoted by the prefix.
     * @param t - Object <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(T t) {
        if (t.length() >= prefix.length()) {
            for (int i = 0; i < prefix.length(); i++) {
                if (Character.toLowerCase(prefix.charAt(i)) != Character.toLowerCase(t.charAt(i))) {
                    return false;
                }
            }
        } else {
            return false;
        }
        return true;
    }
}
