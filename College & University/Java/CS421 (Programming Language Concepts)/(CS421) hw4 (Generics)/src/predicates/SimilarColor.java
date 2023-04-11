package predicates;

import java.awt.Color;

/**
 * <b>File Name:    </b>    SimilarColor.java                   <br>
 * <b>Project Name: </b>    hw4 (Java Generics)                 <br>
 * <b>Class:        </b>    CS421 (Spring)                      <br>
 * <b>Date Modified:</b>    4/16/2022                           <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class SimilarColor extends SimilarTo<Color> {
    
    public SimilarColor(Color c, double d) {
        super(c, null, d);
    }
    
    /**
     * Accepts only Color objects that are similar to the reference object. 
     *      Two colors are similar if the sum of the absolute differences 
     *      in the 8-bit red, green, and blue components is less than or 
     *      equal to the threshold.
     * @param t - Object <code>T</code>
     * @return Return true if <code>t</code> is accepted, otherwise false.
     */
    @Override
    public boolean accepts(Color t) {
        double dr = getReference().getRed() - t.getRed();
        double dg = getReference().getGreen() - t.getGreen();
        double db = getReference().getBlue() - t.getBlue();
        return Math.sqrt( dr * dr + dg * dg + db * db ) <= getThreshold();
    }
}