//////////////////////////////////////////////////////
// File Name:   SetOfExamples.java
// Author:      Kong Jimmy Vang
// Date:        9/27/2018
// 

package decisionTreeLearningAlgorithmPack;

import java.util.LinkedList;

/**
 * Represents a set of Examples, {x1,x2, ... ,xn}.
 * 
 * @author Kong Jimmy Vang
 */
public class SetOfExamples {
    
    //*** Instance/Field Variables ***
    private boolean allPositive;            // If true, all examples in this set are positive examples.
    private boolean allNegative;            // If true, all examples in this set are negative examples.
    private LinkedList<Example> examples;   // 
    private int p;  //
    private int n;  //
    
    
    //*** Constructors ***
    /**
     * 
     * @param examples - The Linked List of {@code Example} objects.
     */
    public SetOfExamples(LinkedList<Example> examples) {
        this.examples = examples;
        isAllPostive();
        isAllNegative();
        
        // Get p and n.
        this.p = 0;
        this.n = 0;
        for (int i = 0; i < examples.size(); i++) {
            Example e = examples.get(i);
            if (e.isPositive()) {
                this.p++;
            } else {
                this.n++;
            }
        }
    }
    
    
    //*** Functions/Methods and Getters/Setters ***
    /** Returns true if this particular set of {@code Example} objects contains all positive examples. */
    public boolean isAllPostive() {
        allPositive = true;
        for (int i = 0; i < examples.size(); i++) {
            Example e = examples.get(i);
            if (!e.isPositive()) {
                allPositive = false;
                break;
            }
        }
        return allPositive;
    }
    
    /** Returns true if this particular set of {@code Example} objects contains all negative examples. */
    public boolean isAllNegative() {
        allNegative = true;
        for (int i = 0; i < examples.size(); i++) {
            Example e = examples.get(i);
            if (e.isPositive()) {
                allNegative = false;
                break;
            }
        }
        return allNegative;
    }
    
    /** Get an {@code Example} from this set of examples at {@code index} */
    public Example get(int index) {
        return this.examples.get(index);
    }
    
    /** Add an {@code Example} to this set. */
    public void add(Example e) {
        if (e.isPositive()) {
            this.p++;
        } else {
            this.n++;
        }
        this.examples.add(e);
    }
    
    /** Remove an {@code Example} from this set at {@code index}. */
    public Example remove(int index) {
        Example e = this.examples.get(index);
        if (e.isPositive()) {
            this.p--;
        } else {
            this.n--;
        }
        return this.examples.remove(index);
    }
    
    /** Returns the amount of examples stored in this set. */
    public int size() {
        return this.examples.size();
    }
    
    /** Returns true if the set is empty and has no examples.*/
    public boolean isEmpty() {
        return this.examples.isEmpty();
    }
    
    /** Returns the amount of positive examples in this set. */
    public int getP() {
        return this.p;
    }
    
    /** Returns the amount of negative examples in this set. */
    public int getN() {
        return this.n;
    }
    
    /** Returns the linked list that contains the set of examples. */
    public LinkedList<Example> getExamplesList() {
        return this.examples;
    }
    
    /** Returns the content of this entire set as a String. */
    public String toString() {
        return "[p = " + p + ", n = " + n + ", " + examples.toString() + "]";
    }
}