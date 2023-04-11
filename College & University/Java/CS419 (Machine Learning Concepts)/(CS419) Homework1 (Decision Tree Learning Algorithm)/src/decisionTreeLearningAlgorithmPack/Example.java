//////////////////////////////////////////////////////
// File Name:   Example.java
// Author:      Kong Jimmy Vang
// Date:        9/27/2018
// 

package decisionTreeLearningAlgorithmPack;

import java.util.Arrays;
import java.util.LinkedList;

/**
 * Represents an Example, x.
 * 
 * @author Kong Jimmy Vang
 */
public class Example {
    
    //*** Instance/Field Variables ***
    private boolean isPositive; // If true, this is a positive example.
    private String example;     // String of the example.
    
    /** A result that says if this is a positive or negative example.<br>
     *      Result can equal "POS" or "NEG". */
    private String result;      // Result. (Positive or Negative example).
    
    /** A Linked List the attributes from the {@code example} string. */
    private LinkedList<String> exampleAttributes;
    
    
    //*** Constructors ***
    /**
     * Create an Example containing the given string {@code example}. 
     * @param example - An example.
     */
    public Example(String example) {
        this.example = example;
        isPositive();
        
        // Store Attributes of the example.
        String[] splitAttributes = example.split(" ");
        this.exampleAttributes = new LinkedList<>(Arrays.asList(splitAttributes));
    }
    
    
    //*** Functions/Methods and Getters/Setters ***
    /** Returns true if this particular {@code Example} is a positive example. */
    public boolean isPositive() {
        this.isPositive = true;
        this.result = "POS";
        String[] temp = example.split(" ");
        String result = temp[temp.length - 1];
        if (!"e".equalsIgnoreCase(result)) {
            this.result = "NEG";
            this.isPositive = false;
        }
        return this.isPositive;
    }
    
    /** Returns the string result. Result is expected to be of string "POS" or "NEG". (Positive example or Negative example) */
    public String getResult() {
        return this.result;
    }
    
    /** Returns the string representing this example. */
    public String getExample() {
        return this.example;
    }
    
    /** Returns the linked list, where each element contains an attribute value string. */
    public LinkedList<String> getExampleAttributes() {
        return this.exampleAttributes;
    }
    
    /** Returns attribute value string, contained at index. */
    public String getExampleAttributeAt(int index) {
        return this.exampleAttributes.get(index);
    }
    
    /** Returns the content in this particular Example. */
    public String toString() {
        return "Example Content: [" + exampleAttributes + "], isPositive?: " + isPositive + "\n";
    }
}