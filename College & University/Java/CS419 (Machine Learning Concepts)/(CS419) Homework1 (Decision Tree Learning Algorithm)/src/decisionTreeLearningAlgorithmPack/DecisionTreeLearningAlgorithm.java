//////////////////////////////////////////////////////
// File Name:   DecisionTreeLearningAlgorithm.java
// Author:      Kong Jimmy Vang
// Date:        9/27/2018
// 

package decisionTreeLearningAlgorithmPack;

import java.io.*;
import java.util.*;

/**
 * This is the Decision Tree Learning Algorithm. This class has it's main method split off into the class {@code Main}. 
 * <br><br>
 * I separated "main" from the DecisionTreeLearningAlgorithm class to make it easier 
 *      to run this package in the command prompt.
 *      <br><br>
 * "POS" is a positive example, "NEG" is a negative example.
 * @author Kong Jimmy Vang
 */
public class DecisionTreeLearningAlgorithm {
    
    //*** Instance/Field Variables ***
    /** {@code S} is the max training set size. */
    private int S;
    public static final int S_LOWERBOUND = 250;   // Lowerbound of S.
    public static final int S_UPPERBOUND = 1000;  // Upperbound of S.
    
    /** {@code I} is the training set increment. */
    private int I;
    
    /** {@code ICounter} keeps track of the current training set size used to create a decision tree.*/
    private int ICounter;
    
    // Contains Sets of data and properties. 
    /** The data set from "mushrooms.txt" */
    protected SetOfExamples dataSet = new SetOfExamples(new LinkedList<Example>());
    
    /** The training set. */
    protected SetOfExamples trainingSet = new SetOfExamples(new LinkedList<Example>());
    
    /** The subset of the training set, {@code trainingSet}, used to train trees in increasing increments sets of I. */
    protected SetOfExamples trainingSubSet = new SetOfExamples(new LinkedList<Example>());
    
    /** The data set from "mushrooms.txt" */
    protected SetOfAttributes properties = new SetOfAttributes(new LinkedList<Attribute>());
    
    
    //*** Constructors ***
    /**
     * Creates a Decision Tree Learning Algorithm and stores the training set size {@code S} 
     * and the training set increment {@code I} for use by the algorithm.
     * @param S - The training set size.
     * @param I - The training set increment.
     * @throws IOException Throws an IOException if {@code S} is not within the bounds (250 <= S <= 1000).
     */
    public DecisionTreeLearningAlgorithm(final int S, final int I) throws IOException {
        
        // Store S as a variable.
        //
        // - Checks if training set size meets this should be some integer value S that 
        // is a multiple of 250, within the bounds 250 <= S <= 1000.
        // - Throw an exception if this bound is not met.
        // S_LOWERBOUND = 200 (DEFAULT)
        // S_UPPERBOUND = 1000 (DEFAULT)
        if (S < S_LOWERBOUND) {
            throw new IOException("Exception Occurred - "
                    + "Reason: The training set size, S: " + S + ", is less than " + S_LOWERBOUND + ".");
        } else if (S > S_UPPERBOUND) {
            throw new IOException("Exception Occurred - "
                    + "Reason: The training set size, S: " + S + ", is greater than " + S_UPPERBOUND + ".");
        } else {
            this.S = S;
        }
        
        // Store I as a variable.
        // - Throw an exception if a negative integer is given for I.
        if (I > 0) {
            this.I = I;
            this.ICounter = this.I;
        }
        else 
            throw new IOException("Exception - Reason: The Training Set Increment is less than 0. That may not be correct or valid. "
                    + "(trainingSetIncrement = " + I + ")");
    }
    
    
    //*** Functions/Methods and Getters/Setters ***
    /** Returns the training set size {@code S}. */
    protected int getS() {
        return this.S;
    }
    
    /** Returns the training set increment {@code I}. */
    protected int getI() {
        return this.I;
    }
    
    /** Returns the counter keeping track of the training subset size, {@code ICounter}. */
    protected int getICounter() {
        return this.ICounter;
    }
    
    /** Increments the counter of {@code ICounter} by 1. This counter is used to keep track of the 
     * training subset. */
    protected void incrementICounter() {
        this.ICounter += this.I;
    }
    
}
