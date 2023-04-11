import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Project Name:    Assignment 2            <br>
 * File Name:       LinkedHashMapSet.java   <br>
 * Description:     This is a LinkedHashMap set, each set mapping to a 
 *                      LinkedHashMap which maps to a generic value <code> V</code>.                <br><br>
 *                      
 *                      Each LinkedHashMap is mapped using an <code>Integer</code> key.
 *                      The generic value <code> V</code> is mapped to each set's LinkedHashMap.    <br><br>
 * 
 * Date Created:    10/10/22                <br>
 * Date Modified:   10/27/22                <br>
 * Class:           CS457 (Fall 2022)       <br><br>
 * 
 * @author Kong Jimmy Vang
 *
 * @param <V> - A generic class object that will be mapped as a value to each set's LinkedHashMap.
 */
public class LinkedHashMapSet<V> extends LinkedHashMap<Integer, LinkedHashMap<Integer, V>> {
    
    /** Serial UID */
    private static final long serialVersionUID = 8524813080544963669L;
    
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
    
    /**
     * Returns a LinkedHashMap at a given key for this set.
     * @param index - the index
     * @return Returns a LinkedHashMap at a given index for this set.
     */
    public LinkedHashMap<Integer, V> getDataAt(final Integer key) {
        return this.get(key);
    }
    
    /**
     * Returns an Output at a given index for this set.
     * @param index - the index
     * @return Returns an Output at a given index for this set.
     */
    public V getOutputAt(final Integer index) {
        LinkedHashMap<Integer, V> data = this.get(index);
        return data.get( data.size() - 1 );
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
