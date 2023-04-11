import java.util.ArrayList;

/**
 * Project Name:    Assignment 1        <br>
 * Class:           CS                  <br>
 * File Name:       DataSet.java        <br>
 * Description:     This DataSet stores a list of data for a list of Attributes and Output pairs. <br><br>
 * 
 * Date Created:    9/26/22             <br>
 * Date Modified:   9/30/22             <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 *      Example DataSets: (x's denote attributes, y's denote outputs)
 *      <ul>
 *          <li>  [[x1, y1], [x2, y2], [x3, y3]] <br>
 *          <li>  [[9, 8], [7, 6], [5, 4]] <br><br>
 *          
 *          <li>  [[x1-1, x1-2, y1], [x2-1, x2-2, y2], [x3-1, x3-2, y3]] <br>
 *          <li>  [[9, 8, 7], [6, 5, 4], [3, 2, 1]] <br><br><br>
 *      </ul>
 * 
 * 
 * @author Kong Jimmy Vang
 *
 * @param <X> - Any generic class object that can be stored in a List.
 */
public class DataSet<X> extends ArrayList<ArrayList<X>> {
    
    /** Serial UID */
    private static final long serialVersionUID = 3282003343417719413L;
    
    /**
     * Constructs an empty data set list with an initial capacity of ten.
     */
    public DataSet() {
        super();
    }
    
    /**
     * Constructs an empty data set with the specified initial capacity.
     * @param initialCapacity the initial capacity of the data set
     * @throws IllegalArgumentException if the specified initial capacity is negative
     */
    public DataSet(final int initialCapacity) {
        super(initialCapacity);
    }
    
    /**
     * Returns the amount of Attributes that this DataSet contains.
     * @return Returns the amount of Attributes that this DataSet contains.
     */
    public int getAttributeSize() {
        return this.get(0).size() - 1;
    }
    
    /**
     * Returns a List of attributes at a given index for this DataSet.
     * @param index - the index
     * @return Returns a List of attributes at a given index for this DataSet.
     */
    public ArrayList<X> getAttributesAt(final int index) {
        ArrayList<X> attrs = new ArrayList<>();
        ArrayList<X> data = this.get(index);
        
        for (int i = 0; i < data.size() - 1; i++) {
            attrs.add( data.get(i) );
        }
        return attrs;
    }
    
    /**
     * Returns an Output at a given index for this DataSet.
     * @param index - the index
     * @return Returns an Output at a given index for this DataSet.
     */
    public X getOutputAt(final int index) {
        ArrayList<X> data = this.get(index);
        return data.get( data.size() - 1 );
    }
}
