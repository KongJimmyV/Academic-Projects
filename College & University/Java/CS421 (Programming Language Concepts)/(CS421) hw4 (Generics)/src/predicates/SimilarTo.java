package predicates;

/**
 * <b>File Name:    </b>    SimilarTo.java                      <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class SimilarTo<T> implements Predicate<T> {

    private T reference;
    private Metric<T> metric;
    private double threshold;
    
    public SimilarTo(T t, Metric<T> m, double d) {
        this.reference = t;
        this.metric = m;
        this.threshold = d;
    }
    
    /**
     * Accepts an object <code>T</code> which has a distance to 
     *      the reference that is less than or equal to the threshold.
     * @param t - Object <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(T t) {
        return getMetric().distance(getReference(), t) <= getThreshold();
    }

    protected T getReference() {
        return reference;
    }

    protected Metric<T> getMetric() {
        return metric;
    }

    protected double getThreshold() {
        return threshold;
    }
}