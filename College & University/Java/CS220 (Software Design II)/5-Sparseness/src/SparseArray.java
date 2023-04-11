
/* SparseArray.java
 *
 * Description (Short): 
 *      - A generic 1D sparse array.
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-assignment-5-sparseness/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/a-test-case-for-cs220-assignment-5/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/question-on-cs220-assignment-5/
 *      - https://docs.oracle.com/middleware/1221/adf/api-reference-model/oracle/jbo/server/SparseArray.html
 *      
 * Description (Long):  
 *      - This array can store the object types of <Content> 
 *          defined by the user when creating a new SparseArray.
 *          
 *      - This class provides a set of functions defined in the 
 *          Javadocs below.
 *          
 */

import java.util.function.Function;
import java.util.function.BiFunction;

/**
 * A generic sparse single-dimensional array with configurable default entry.
 *
 * @param <Content>
 *            The type of the elements of the array
 */
public class SparseArray<Content> {

    private final Node headSentinel;
    private final Node tailSentinel;
    
    private Node lastNode;
    private long lastIndex;
    
    private long size;
    private final long DECLARED_SIZE;
    private final Content DEFAULT_CONTENT;

    /**
     * Construct a sparse array with the given capacity. The default value of the
     * entries of the array should be <code>null</code>. Array indices should run
     * from zero up to (but not including) the <code>size</code>.
     *
     * @param size
     *            the number of entries allowed in the array.
     */
    public SparseArray(final long size) {
        this(size, null);
    }

    /**
     * Construct a sparse array with the given capacity and default entries. Array
     * indices should run from zero up to (but not including) the <code>size</code>.
     *
     * @param size
     *            the number of entries allowed in the array.
     * @param dft
     *            the (default) initial contents of every index into the array.
     */
    public SparseArray(final long size, final Content dft) {
        
        // Setup the Head and Tail sentinels of the list.
        this.headSentinel = new Node(null, null, null);
        this.tailSentinel = new Node(null, null, this.headSentinel);
        this.headSentinel.nextNode = this.tailSentinel;
        
        this.headSentinel.index = -1;
        this.tailSentinel.index = size;
        
//        // Build the list and store the dft (default) values into each element.
//        for(int i = 0; i < size; i++) {
//            Node newNode = new Node(dft, this.headSentinel.nextNode, this.headSentinel);
//            this.headSentinel.nextNode.prevNode = newNode;
//            this.headSentinel.nextNode = newNode;
//        }
        
        // Setup pointers.
        this.lastNode = this.headSentinel;
        this.lastIndex = 0;
        
        // Setup fields.
        this.size = 0;
        this.DECLARED_SIZE = size;
        this.DEFAULT_CONTENT = dft;
    }

    /**
     * Return the value which is assumed by default to be stored at each entry of
     * the array <i>except</i> where explicitly set to some other value.
     */
    public Content getDefaultContent() {
        return this.DEFAULT_CONTENT;
    }

    /**
     * Return the conceptual size of the array: the maximum number of elements which
     * it is declared to store, as opposed to the number of actual explicit entries.
     */
    public long getDeclaredSize() {
        return this.DECLARED_SIZE;
    }

    /**
     * Returns the number of values stored in this array which differ from the
     * default.
     */
    public int getStoredEntries() {
        return (int) this.size;
    }

    /**
     * Returns the value stored at a particular index in this array.
     * 
     * @param index
     *            the index to be searched. If the index is negative, or is equal to
     *            or greater than the declared size of the array, then this method
     *            will throw a {@link java.lang.ArrayIndexOutOfBoundsException
     *            ArrayIndexOutOfBoundsException}
     * @return The value associated with the particular row and column, which will
     *         be the default value for the array if no value has been explicitly
     *         stored here
     */
    public Content get(final long index) {
        if(index < 0 || index >= this.getDeclaredSize()) {
            throw new ArrayIndexOutOfBoundsException(
                    "The index, " + index + ", is out of bounds.");
        }
        
        // Go to the index in the list.
        if(this.lastNode == this.headSentinel) {
            this.lastNode = this.headSentinel.nextNode;
            this.lastIndex = this.lastNode.index;
        }
        if(this.lastNode == this.tailSentinel) {
            this.lastNode = this.tailSentinel.prevNode;
            this.lastIndex = this.lastNode.index;
        }
        
        Node current = this.lastNode;
        this.lastIndex = current.index;
        
        while(this.lastIndex != -1 &&
                this.lastIndex < index) {
            current = current.nextNode;
            this.lastIndex = current.index;
        }
        while(this.lastIndex != -1 &&
                this.lastIndex > index) {
            current = current.prevNode;
            this.lastIndex = current.index;
        }
        
        this.lastNode = current;
        
        
        if(this.lastIndex != index)
            // Index not found, Return the default content.
            return this.getDefaultContent();
        else
            // Return the value found at the index.
            return current.data;
    }

    /**
     * Stores a value at a particular index in this array.
     * 
     * @param index
     *            the index to be used for storage
     * @param value
     *            the value to be stored
     */
    public void set(final long index, final Content value) {
        if(index < 0 || index >= this.getDeclaredSize()) {
            throw new ArrayIndexOutOfBoundsException(
                    "The index, " + index + ", is out of bounds.");
        }

        // Go to the index in the list.
        if(this.lastNode == this.headSentinel) {
            this.lastNode = this.headSentinel.nextNode;
            this.lastIndex = this.lastNode.index;
        }
        if(this.lastNode == this.tailSentinel) {
            this.lastNode = this.tailSentinel.prevNode;
            this.lastIndex = this.lastNode.index;
        }
        
        Node current = this.lastNode;
        this.lastIndex = current.index;
        
        while(this.lastIndex < index) {
            current = current.nextNode;
            this.lastIndex = current.index;
        }
        while(this.lastIndex > index) {
            current = current.prevNode;
            this.lastIndex = current.index;
        }
        
        this.lastNode = current;
        
        if(this.lastIndex != index) {
            //System.out.println(lastIndex + " : " + index);
            Node newNode = new Node(value, current.nextNode, current);
            current.nextNode.prevNode = newNode;
            current.nextNode = newNode;
            newNode.index = index;
            this.size++;
        }
    }

    /**
     * Returns <code>true</code> when a value which differs from the array's default
     * has been stored at a particular index in the array.
     * 
     * @return Always returns a boolean, even if the <col>index</col> is out of
     *         bounds. In the latter case, the result should be <code>false</code>.
     */
    public boolean isSet(final long index) {
        return (index >= 0 && index < this.DECLARED_SIZE) && 
                (this.get(index) != this.getDefaultContent());
    }

    /**
     * Remove any setting to a non-default value at the given index. Has no effect
     * if there is no such setting.
     */
    public void unset(final long index) {
        this.get(index);
        if(this.get(index) != this.getDefaultContent()) {
            Node current = this.lastNode;
            this.lastNode = this.lastNode.prevNode;
            current.nextNode.prevNode = current.prevNode;
            current.prevNode.nextNode = current.nextNode;
            current.nextNode = null;
            current.prevNode = null;
            this.size--;
        }
    }

    /**
     * Transforms one sparse array into another by applying the given
     * <code>function</code> to each element of the current array. The default value
     * of the result is formed by applying the function to this array's default
     * value; the function maps elements to the same positions in the new array.
     */
    public <Result> SparseArray<Result> map(
            final Function<Content, Result> function) {
        
        SparseArray<Result> newArray = 
                new SparseArray<>(
                        this.getDeclaredSize(), 
                        function.apply(this.getDefaultContent()));
        
        Node current = this.headSentinel.nextNode;
        while(current != this.tailSentinel) {
            long i = current.index;
            Result result = function.apply(this.get(i));
            newArray.set(i, result);
            current = current.nextNode;
        }
        
        return newArray;
    }

    /**
     * Transforms two sparse arrays into a third result array by applying the given
     * <code>function</code> to respective pairs of elements from this array and the
     * argument array. The default value of the result is formed by applying the
     * function to the two arrays' default values; the function maps elements to the
     * same indices in the new array.
     */
    public <Content2, Result> SparseArray<Result> combine(
            final BiFunction<Content, Content2, Result> function,
            final SparseArray<Content2> that) {
        
        SparseArray<Result> newArray = 
                new SparseArray<>(
                        this.getDeclaredSize(), 
                        function.apply(
                                this.getDefaultContent(), 
                                that.getDefaultContent()));
        
        Node current = this.headSentinel.nextNode;
        while(current != this.tailSentinel) {
            long i = current.index;
            Result result = function.apply(this.get(i), that.get(i));
            newArray.set(i, result);
            current = current.nextNode;
        }
        
        SparseArray<Content2>.Node currentThat = that.headSentinel.nextNode;
        while(currentThat != that.tailSentinel) {
            long i = currentThat.index;
            Result result = function.apply(this.get(i), that.get(i));
            newArray.set(i, result);
            currentThat = currentThat.nextNode;
        }
        
        return newArray;
    }

    /**
     * For two arrays of numbers, calculate the dot product of the numbers, that is,
     * the sum of the products of pairs of numbers at the same position at the two
     * arrays.
     * 
     * @param array1
     *            the first array of numbers
     * @param array2
     *            the second array of numbers. 
     * @throws IllegalArgumentException 
     *            This method will throw an
     *            {@link java.lang.IllegalArgumentException
     *            IllegalArgumentException} if the two arrays are not the same
     *            declared size.
     */
    public static Double dotProduct(
            final SparseArray<Double> array1, 
            final SparseArray<Double> array2) {
        
        if (array1.getDeclaredSize() != array2.getDeclaredSize()) {
            throw new IllegalArgumentException(
                    "The two arrays are not the same declared size.");
        }
        
        Double sum1 = 0.0;
        Double sum2 = 0.0;
        long counter1 = 0;
        long counter2 = 0;
        
        // Calculate dot product.
        SparseArray<Long> queue = new SparseArray<>(Long.MAX_VALUE, (long) -1);
        
        SparseArray<?>.Node current1 = array1.headSentinel.nextNode;
        while(current1 != array1.tailSentinel) {
            long i = current1.index;
            queue.set(i, i);
            sum1 += array1.get(i) * array2.get(i);
            counter1++;
            current1 = current1.nextNode;
        }
        SparseArray<?>.Node current2 = array2.headSentinel.nextNode;
        while(current2 != array2.tailSentinel) {
            long i = current2.index;
            if(queue.get(i) != i) {
                sum2 += array1.get(i) * array2.get(i);
            }
            counter2++;
            current2 = current2.nextNode;
        }
        
        Double sum3 = ((array1.getDeclaredSize() - counter1) * array1.getDefaultContent()) +
                ((array2.getDeclaredSize() - counter2) * array2.getDefaultContent());
        
        return sum1 + sum2 + sum3;
    }
    
    protected void print() {
        Node current = this.headSentinel.nextNode;
        //System.out.print(this.headSentinel.data + ", ");
        while(current != this.tailSentinel) {
            System.out.print(current.data + ", ");
            current = current.nextNode;
        }
        //System.out.print(this.tailSentinel.data + ", Forwards");
        System.out.println();
        
//        current = this.tailSentinel.prevNode;
//        System.out.print(this.tailSentinel.data + ", ");
//        while(current != this.headSentinel) {
//            System.out.print(current.data + ", ");
//            current = current.prevNode;
//        }
//        System.out.print(this.headSentinel.data + ", Backwards");
//        System.out.println();
    }
    
    protected Node getHeadSentinel() {
        return headSentinel;
    }

    protected Node getTailSentinel() {
        return tailSentinel;
    }

    protected long size() {
        return this.size;
    }
    
    /**
     * This generic class consists of a single Node that supports implementations of
     * DoublyLinkedLists.
     * 
     * <br>
     * Mean't for use by the outer class, {@code SorterList.java}".
     * 
     * @param <E>
     *            - Generic Type (String, Int, Long, Double, Bool, etc...) for data
     *            storage.
     */
    protected class Node {

        private Content data;
        private long index;
        protected Node nextNode;
        protected Node prevNode;

//        /**
//         * Builds a {@code Node} with no data and that is linked to no other nodes.
//         */
//        public Node() {
//            this(null, null, null);
//        }

        /**
         * Builds a {@code Node} and store into the {@code Node}, an object of type
         * {@code T} from {@code SorterList}. <br>
         * <br>
         * Also link this {@code Node} to a {@code previousNode} and to a
         * {@code nextNode}.
         * 
         * @param data
         *            - Data of type {@code T} that will be stored into this
         *            {@code Node}.
         * @param nextNode
         *            - A {@code Node} that will be linked to {@code nextNode} of this
         *            {@code Node}.
         * @param previousNode
         *            - A {@code Node} that will be linked to {@code previousNode} of
         *            this {@code Node}.

         */
        public Node(Content data, Node nextNode, Node previousNode) {
            this.data = data;
            this.nextNode = nextNode;
            this.prevNode = previousNode;
        }
        
        public void setIndex(long index) {
            this.index = index;
        }
        
        public long getIndex() {
            return this.index;
        }
        
    }
    
}