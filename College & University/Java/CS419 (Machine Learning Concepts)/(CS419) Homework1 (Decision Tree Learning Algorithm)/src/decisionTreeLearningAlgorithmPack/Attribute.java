//////////////////////////////////////////////////////
// File Name:   Attribute.java
// Author:      Kong Jimmy Vang
// Date:        9/27/2018
// 

package decisionTreeLearningAlgorithmPack;

import java.util.LinkedList;

/**
 * Represents an Attribute to test against some particular examples.
 * 
 * @author Kong Jimmy Vang
 */
public class Attribute {
    
    //*** Instance/Field Variables ***
    /** A helpful index variable. Used to locate the column when parsing an Example string containing all the Attributes.
     * <br><br>
     *      attributeIndexes -->   | 0          | 1          | 2          | 3                   |   <br>
     *                  ___________________________________________________________________________________ <br>
     *                  | Examples | Attribute1 | Attribute2 | Attribute3 | Result              |   <br>
     *                  | x1       | "b"        | "y"        | "w"        | "edible" or "e"     |   <br>
     *                  | x2       | "x"        | "y"        | "w"        | "poisonous" or "p"  |   <br>
     */
    private int attributeIndex;
    
    /** A String used to store the attribute's name. */
    private String attributeName;
    
    /** This is a list used to hold the Attribute's possible outcomes or values. (Possible {@code String} values) */
    private LinkedList<String> listOfValues;    // The list of values allowed for the attribute.
    
    /** Holds the number of distinct values {@code d} for this attribute. */
    private int d;
    
    /** Temporary variable to help hold the information gain when the {@link #importance} method is running in
     * {@code Main}. */
    private double informationGain = 0.0;
    
    
    //*** Constructors ***
    /**
     * Create an Attribute containing it's column location in the table, {@code attributeIndex},
     *      it's name, {@code attributeName}, and the linked list that stores the attribute's possible 
     *      outcomes or values, {@code listOfValues}.
     * @param attributeIndex
     * @param attributeName
     * @param listOfValues
     */
    public Attribute(int attributeIndex, String attributeName, LinkedList<String> listOfValues) {
        this.attributeIndex = attributeIndex;
        this.attributeName = attributeName;
        this.listOfValues = listOfValues;
        this.d = this.listOfValues.size();
    }
    
    
    //*** Functions/Methods and Getters/Setters ***
    /** Returns the index representing the column associated with this Attribute. */
    public int getAttributeIndex() {
        return this.attributeIndex;
    }
    
    /** Returns this Attribute's Name. */
    public String getAttributeName() {
        return this.attributeName;
    }
    
    /** Returns the linked list holding the possible values of this attribute. */
    public LinkedList<String> getListOfValues() {
        return this.listOfValues;
    }
    
    /** Returns the number of distinct values {@code d} of this attribute. */
    public int getD() {
        return this.d;
    }
    
    /** Returns the stored information gain associated with this Attribute. */
    public double getInformationGain() {
        return this.informationGain;
    }
    
    /** Stores the given information gain in this Attribute. */
    public void setInformationGain(double informationGain) {
        this.informationGain = informationGain;
    }
    
    /** Returns the content of this particular Attribute. */
    public String toString() {
        return "attributeIndex: " + attributeIndex + ", d: " + d + ", PropertyName: " + attributeName + ", " + listOfValues.toString() + "\n";
    }
}
