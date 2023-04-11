
/* SorterList.java
 *
 * Description (Short): 
 *      - This is a {@code SorterList} build as a sorted doubly-linked list.
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/sorter-list/
 *      - https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html
 *      - https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html
 *      - (Merge Sort) http://faculty.cs.uwlax.edu/~jmaraist/220-fall-2017/notes.pdf
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/an-example-of-using-the-iterator-method-in-cs220-assignment-4/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-assignment-4-questions/
 *       
 * Description (Long):  
 *      - This class, when instantiated as an object, will become a
 *          doubly-linked list that can store the object type of <T>
 *          defined by the user when creating a new SorterList.
 *          
 *      - SorterList is sorted using the merge sort algorithm.
 *          
 *      - SorterList uses a default Comparator build-in that can
 *          handle most Comparable objects. SorterList also accepts
 *          other types of Comparators.
 *          
 */

import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;

/**
 * This {@code SorterList} is built as a sorted doubly-linked list and can store an object type of {@code T}
 * into this list.
 * 
 * @author Kong Jimmy Vang
 *
 * @param <T> - {@code T} is an object type that will be stored in this linked-list of {@code SorterList}.
 */
public class SorterList<T> implements SorterListInterface<T> {

    //*** Field Variables ***//
    private final Node headSentinal = new Node();
    private final Node tailSentinal = new Node();
    private Comparator<T> comparator;
    
    private int size;
    
    //*** Constructors ***//
    public SorterList() {
        clear();
        this.comparator = new SorterListComparator();
    }
    
    public SorterList(final Comparator<T> comparator) {
        clear();
        this.comparator = comparator;
    }
    
    //*** Methods ***//
    
    /**
     * Gets a particular {@code T} at the given index and return it.
     * @param index - The index used to return an object of type {@code T} at a certain
     * position in this {@code SorterList}.
     * @return Returns an object of type {@code T} at the given {@code index} of this 
     * {@code SorterList}.
     * @throws IndexOutOfBoundsException If the index is invalid and out of bounds.
     */
    protected T get(final int index) {
        // Check for an invalid index.
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Invalid index at: " + index);
        }
        Node currentNode = headSentinal.nextNode;
        for (int i = 0; i < index; i++) {
            currentNode = currentNode.nextNode; // Advance to correct position
        }
        return currentNode.data;
    }

    /**
     * Gets a particular {@code Node} at the given index and return it.
     * @param index - The index used to return a {@code Node} at a certain
     * position in this {@code SorterList}.
     * @return Returns the {@code Node} at the given {@code index} of this 
     * {@code SorterList}.
     * @throws IndexOutOfBoundsException If the index is invalid and out of bounds.
     */
    private Node getNode(final int index) {
        // Check for an invalid index.
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Invalid index at: " + index);
        }
        Node currentNode = headSentinal.nextNode;
        for (int i = 0; i < index; i++) {
            currentNode = currentNode.nextNode; // Advance to correct position
        }
        return currentNode;
    }
    
    /**
     * Adds <code>item</code> to this list.  The <code>item</code>
     * should be positioned according to the order given by {@link
     * SorterListInterface#getComparator getComparator}.
     */
    @Override
    public void add(final T item) {
        if(size < 0) {
            System.err.println("Warning: If you get this warning, "
                    + "then the size was less than 0 when calling \"add()\". "
                    + "The \"add()\" method will continue but ERRORS may occur.");
        }
        
        if(size == 0) {
            // Add the first Node.
            headSentinal.nextNode = new Node(item, headSentinal, tailSentinal);
            tailSentinal.previousNode = headSentinal.nextNode;
            size++;
            
        } else { // size > 0
            // Start at the position of the head.
            Node currentNode = headSentinal;
            
            // Iterate to the end of the list.
            while(currentNode != null && currentNode.nextNode != tailSentinal) {
                currentNode = currentNode.nextNode;
            }
            
            // Add a new Node to the end of the list.
            currentNode.nextNode = new Node(item, currentNode, tailSentinal);
            tailSentinal.previousNode = currentNode.nextNode;
            size++;
        }
        
        // Maintain sort order.
        mergeSort();
    }
    
    /**
     * Removes the first occurrence of the specified <code>item</code>
     * from this list, if it is present.  If this list does not contain
     * <code>item</code>, then the list should not be changed.
     * @return <code>true</code> if this list did contain
     * <code>item</code>
     */
    @Override
    public boolean remove(final T item) {
        
        // Start at the head's next node.
        Node currentNode = headSentinal.nextNode;
        
        // Iterate through the list until we reach the end of the list.
        while(currentNode != null && currentNode != tailSentinal) {
            
            // Check if the "currentNode" contains the "item".
            // If so, remove it and retain the list.
            if(currentNode.data != null && currentNode.data.equals(item)) {
                currentNode.nextNode.previousNode = currentNode.previousNode;
                currentNode.previousNode.nextNode = currentNode.nextNode;
                currentNode.nextNode = null;
                currentNode.previousNode = null;
                size--;
                return true;
            }
            
            // Iterate to the next Node if the "currentNode" did not contain the "item".
            currentNode = currentNode.nextNode;
        }
        
        // No "item" was removed if we reached the end of the list.
        return false;
    }

    /**
     * Removes all elements from this list, so that it is empty.
     */
    @Override
    public void clear() {
        this.headSentinal.nextNode = tailSentinal;
        this.tailSentinal.previousNode = headSentinal;
        this.size = 0;
    }
    
    /**
     * Returns the number of elements currently contained in this list.
     */
    @Override
    public int size() {
        return this.size;
    }

    /**
     * Returns <code>true</code> exactly when this list contains no
     * elements.
     */
    @Override
    public boolean isEmpty() {
        return this.size == 0;
    }

    /**
     * Tests whether <code>value</code> is currently contained in this
     * list.
     * @param value - The value to find in this list
     * @return <code>true</code> exactly when <code>value</code> is
     * contained in this list.
     */
    @Override
    public boolean contains(final T value) {
        
        // Start at the head's next node.
        Node currentNode = headSentinal.nextNode;
        
        // Iterate through the list until we reach the end of the list.
        while(currentNode != null && currentNode != tailSentinal) {
            
            // Check if the "currentNode" contains the "value".
            // Return true if the "value" is found.
            if(currentNode.data != null && currentNode.data.equals(value)) {
                return true;
            }
            
            // Iterate to the next Node if the "currentNode" did not contain the "value".
            currentNode = currentNode.nextNode;
        }
        
        // No "value" was found if we reached the end of the list.
        return false;
    }
    
    /**
     * Returns the current {@link java.util.Comparator Comparator} by
     * which this list is sorted.
     */
    @Override
    public Comparator<T> getComparator() {
        return this.comparator;
    }

    /**
     * Set the {@link java.util.Comparator Comparator} by which this
     * list is sorted.  Calling this method should re-sort the stored
     * list according to the new <code>comparator</code>, and to store
     * subsequently-added elements according to its order.
     * @param comparator - a new ordering for the elements of this list
     */
    @Override
    public void setComparator(final Comparator<T> comparator) {
        this.comparator = comparator;
    }

    /**
     * {@inheritDoc} It must be possible for multiple {@list
     * java.util.Iterator Iterator}s, possibly using different {@link
     * java.util.Comparator Comparator}s, produced by this method or by
     * the <code>iterator(Comparator<T>)</code> method, to be active in
     * a program at the same time.
     */
    @Override
    public java.util.Iterator<T> iterator() {
        return (java.util.Iterator<T>) new SorterListIterator();
    }

    /**
     * Provides an {@link java.util.Iterator Iterator} for the elements
     * of this list in the order given by <code>comparator</code>.
     * Calling this list must <em>not</em> change the order of the list
     * itself, not even temporarily.  It must be possible for multiple
     * {@list java.util.Iterator Iterator}s, possibly using different
     * {@link java.util.Comparator Comparator}s, produced by this method
     * or by the <code>iterator()</code> method, to be active in a
     * program at the same time.
     *
     * @param ordering for the elements of this list as will be
     * generated by the resulting {@link java.util.Iterator Iterator}
     * @return A new {@link java.util.Iterator Iterator} for the
     * elements of this list, to be produced in the order given by
     * <code>comparator</code> instead of in the list's current order
     */
    @Override
    public java.util.Iterator<T> iterator(final Comparator<T> comparator) {
        SorterList<T> newList = new SorterList<>(comparator);
        for(int i = 0; i < this.size(); i++) {
            newList.add(this.get(i));
        }
        return newList.iterator();
    }
    
    /**
     * Sorts this {@code SorterList} using this list's default built-in comparator.
     */
    protected void mergeSort() {
        mergeSort(this.comparator);
    }
    
    /**
     * Sorts this {@code SorterList} with a {@code comparator}.
     * @param comparator - {@code Comparator} used to decide the order of this {@code}.
     */
    protected void mergeSort(final Comparator<? super T> comparator) {
        Node headHolder = this.headSentinal.nextNode;
        Node tailHolder = this.tailSentinal.previousNode;
        this.headSentinal.nextNode = null;
        this.tailSentinal.previousNode = null;
        headHolder.previousNode = null;
        tailHolder.nextNode = null;
        
        this.headSentinal.nextNode = mergeSort(headHolder, comparator);
        this.headSentinal.nextNode.previousNode = this.headSentinal;
        
        Node pos = this.headSentinal.nextNode;
        while(pos.nextNode != null) {
            pos = pos.nextNode;
        }
        pos.nextNode = this.tailSentinal;
        this.tailSentinal.previousNode = pos;
        
    }
    
    /**
     * Sorts the {@code first} node then return a sorted node.
     * @param first - First {@code Node}.
     * @param comparator - {@code Comparator} used to decide the order of the returned linked node.
     * @return Returns one sorted linked-list of nodes.
     */
    private Node mergeSort(Node first, final Comparator<? super T> comparator) {
        
        // Base Case.
        if (first.nextNode == null) {
            return first;
        }
        
        // Split the first and get the second node.
        Node second = split(first);
        
        // Recursively sort the smaller groups of Nodes.
        first = mergeSort(first, comparator); 
        second = mergeSort(second, comparator);
        
        // Merge the sorted halves back together.
        return merge(first, second, comparator);
    }
    
    /**
     * Splits the {@code first} node's linked-list in half.
     * @param first - First {@code Node} that will be split using the right half of itself.
     * @return Returns a second node using the right half of {@code first}.
     */
    private Node split(final Node first) {
        Node second = first;
        Node second2 = first;
        
        int i = 0;
        while (second.nextNode != null && second2.nextNode != null && second2.nextNode.nextNode != null) {
            second = second.nextNode;
            second2 = second2.nextNode.nextNode;
            i++;
        }
        
        Node tempSecond = null;
        if (i == 0) {
            second = second.nextNode;
            second.previousNode.nextNode = null;
            second.previousNode = null;
            tempSecond = second;
        } else {
            second2.previousNode.nextNode = null;
            second2.previousNode = null;
            tempSecond = second2;
        }
        
        return tempSecond;
    }
    
    /**
     * Sort and Merge two linked nodes ({@code first}, {@code second}) into one linked node and return it.
     * @param first - First {@code Node}.
     * @param second - Second {@code Node}.
     * @param comparator - {@code Comparator} used to decide the order of the returned linked node.
     * @return Returns one sorted linked {@code Node} put together by {@code first} and {@code second} node.
     */
    private Node merge(final Node first,
                        final Node second,
                        final Comparator<? super T> comparator) {
        
        // Base Cases.
        if (first == null) {
            return second;
        }
        if (second == null) {
            return first;
        }
            
        // Compare the data of the first and second Node.
        if (comparator.compare(first.data, second.data) < 0) {
            first.nextNode = merge(first.nextNode, second, comparator);
            first.nextNode.previousNode = first;
            return first;
        } else {
            second.nextNode = merge(first, second.nextNode, comparator);
            second.nextNode.previousNode = second;
            return second;
        }
    }
    
    //*** Inner Classes ***//
    
    /**
     * This generic class consists of a single Node that supports 
     * implementations of DoublyLinkedLists.
     * 
     * <br> Mean't for use by the outer class, {@code SorterList.java}".
     * 
     * @param <E> - Generic Type (String, Int, Long, Double, Bool, etc...) 
     * for data storage.
     */
    private class Node {
        
        private T data;
        private Node previousNode;
        private Node nextNode;
        
        /**
         * Builds a {@code Node} with no data and that is linked to no other nodes.
         */
        public Node() {
            this(null,null,null);
        }
        
        /**
         * Builds a {@code Node} and store into the {@code Node}, an object of type 
         * {@code T} from {@code SorterList}.
         * <br>
         * <br> Also link this {@code Node} to a {@code previousNode} and to a
         * {@code nextNode}.
         * 
         * @param data - Data of type {@code T} that will be stored into this {@code Node}.
         * @param previousNode - A {@code Node} that will be linked to {@code previousNode} 
         * of this {@code Node}.
         * @param nextNode - A {@code Node} that will be linked to {@code nextNode} of 
         * this {@code Node}.
         */
        public Node(T data, Node previousNode, Node nextNode) {
            this.data = data;
            this.nextNode = nextNode;
            this.previousNode = previousNode;
        }
    }
    
    /**
     * This is the default comparator for the {@code SorterList}.
     */
    private class SorterListComparator implements Comparator<T> {

        @Override
        public int compare(T o1, T o2) {
            
            // Strings (sorts based on String.compareTo())
            if (o1 instanceof String && o2 instanceof String) {
                String s1 = (String) o1;
                String s2 = (String) o2;
                return s1.compareTo(s2);
            }
            
            // Comparable Objects
            if (o1 instanceof Comparable && o2 instanceof Comparable) {
                Comparable c1 = (Comparable) o1;
                Comparable c2 = (Comparable) o2;
                
                return c1.compareTo((T) c2);
            }
            
            throw new ClassCastException("This built-in from \"" + this.getClass() + "\" "
                    + "cannot be used to compare \"" + o1.getClass()
                    + "Please use a different supported Comparator.");
        }
        
    }
    
    /**
     * This is the default iterator, used by {@code SorterList}.
     */
    private class SorterListIterator implements Iterator<T> {
        
        Node position;
        
        public SorterListIterator() {
            this.position = headSentinal;
        }
        
        @Override
        public boolean hasNext() {
            if (isEmpty()) {
                return false;
            } else if (position.nextNode == tailSentinal) {
                return false;
            }
            return true;
        }
        
        @Override
        public T next() {
            if (!hasNext()) {
                throw new NoSuchElementException();
            }
            
            this.position = position.nextNode;
            return position.data;
        }
    };
}
