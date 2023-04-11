//////////////////////////////////////////////////////
// File Name:   SetOfAttributes.java
// Author:      Kong Jimmy Vang
// Date:        9/27/2018
// 

package decisionTreeLearningAlgorithmPack;

import java.util.LinkedList;

/**
 * Represents a set of Attributes.
 * 
 * @author Kong Jimmy Vang
 */
public class SetOfAttributes {
    
    //*** Field/Instance Varaibles ***
    /** A linked list containing a set of attributes. */
    private LinkedList<Attribute> attributes;
    
    
    //*** Constructors ***
    /**
     * Create a set of attributes contained in a linked list.
     * @param attributes - The linked list of attributes to use.
     */
    public SetOfAttributes(LinkedList<Attribute> attributes) {
        this.attributes = attributes;
    }
    
    /**
     * Completely clone and create a new SetOfAttributes and return it.
     */
    public SetOfAttributes clone() {
        SetOfAttributes s = new SetOfAttributes(new LinkedList<>());
        for (int i = 0; i < attributes.size(); i++) {
            s.add(attributes.get(i));
        }
        return s;
    }
    
    
    //*** Functions/Methods and Getters/Setters ***
    /** Returns an Attribute from the set at {@code index}. */
    public Attribute get(int index) {
        return this.attributes.get(index);
    }
    
    /** Adds an Attribute to the end of this set. */
    public void add(Attribute a) {
        this.attributes.add(a);
    }
    
    /** Removes an Attribute from this set at {@code index}. */
    public Attribute remove(int index) {
        return this.attributes.remove(index);
    }
    
    /** Removes an Attribute {@code setA} from this set. */
    public SetOfAttributes remove(Attribute setA) {
        this.attributes.remove(setA);
        return this;
    }
    
    /** Returns the amount of Attributes stored in this set. */
    public int size() {
        return this.attributes.size();
    }
    
    /** Returns true if this set is empty. */
    public boolean isEmpty() {
        return this.attributes.isEmpty();
    }
    
    /** Returns the content of this entire set as a String. */
    public String toString() {
        return attributes.toString();
    }
}