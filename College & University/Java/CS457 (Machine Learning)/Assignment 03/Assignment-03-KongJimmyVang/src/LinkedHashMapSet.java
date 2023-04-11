import java.util.Collections;
import java.util.LinkedHashMap;

/**
 * Project Name:    Assignment 3            <br>
 * File Name:       LinkedHashMapSet.java   <br>
 * Description:     This is a LinkedHashMap set, each set mapping to a 
 *                      LinkedHashMap which maps to a generic value <code> V</code>.                <br><br>
 *                      
 *                      Each LinkedHashMap is mapped using an <code>Integer</code> key.
 *                      The generic value <code> V</code> is mapped to each set's LinkedHashMap.    <br><br>
 * 
 * Date Created:    10/10/22                <br>
 * Date Modified:   11/28/22                <br>
 * Class:           CS457 (Fall 2022)       <br><br>
 * 
 * @author Kong Jimmy Vang
 *
 * @param <V> - A generic class object that will be mapped as a value to each set's LinkedHashMap.
 */
public class LinkedHashMapSet<V> extends LinkedHashMap<Integer, LinkedHashMap<Integer, V>> 
{
    //======================================================================
    //=== Variables ===
    /** Serial UID */
    private static final long serialVersionUID = 8524813080544963669L;
    
    //======================================================================
    //=== Constructors ===
    /**
     * Constructs an empty <code>LinkedHashMapSet</code> with an initial default capacity of 16.
     */
    public LinkedHashMapSet() {
        super();
    }
    
    /**
     * Constructs an empty <code>LinkedHashMapSet</code> with the specified initial capacity.
     * @param initialCapacity - the initial capacity of the set
     * @throws IllegalArgumentException if the specified initial capacity is negative.
     */
    public LinkedHashMapSet(final int initialCapacity) {
        super(initialCapacity);
    }
    
    //======================================================================
    //=== Methods ===
    /**
     * Returns the data value V stored at keyJ from the set using a given keyI.
     * @param keyI - Set index
     * @param keyJ - Data index
     * @return Returns the data value V.
     */
    public V getDataValueAt(final Integer keyI, final Integer keyJ) {
        return this.get(keyI).get(keyJ);
    }
    
    /**
     * Add a LinkedHashMap which stores data to this DataSet. Map it to the index "this.size()".
     * @param value - value <code> V</code> to store.
     * @return Returns the value stored.
     */
    public LinkedHashMap<Integer, V> add(final LinkedHashMap<Integer, V> value) {
        return this.put(this.size(), value);
    }
    
    @Override
    public LinkedHashMap<Integer, V> remove(final Object key) 
    {
        LinkedHashMap<Integer, V> value = super.remove(key);
        Integer intKey = (Integer) key;
        for (int i = intKey + 1; i < this.size() + 1; i++) 
        {
            this.put(i - 1, this.get(i));
        }
        this.values().removeAll(Collections.singleton(null));
        return value;
    }
    
    @Override
    public boolean remove(final Object key, final Object value) 
    {
        boolean isRemoved = super.remove(key, value);
        if (isRemoved) 
        {
            Integer intKey = (Integer) key;
            for (int i = intKey + 1; i < this.size() + 1; i++) 
            {
                this.put(i - 1, this.get(i));
            }
            this.values().removeAll(Collections.singleton(null));
        }
        return isRemoved;
    }
}
