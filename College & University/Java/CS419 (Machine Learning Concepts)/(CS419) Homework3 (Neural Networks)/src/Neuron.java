//////////////////////////////////////////////////////
// File Name:   Neuron.java
// Author:      Kong Jimmy Vang
// Date:        10/31/2018
// 

import java.io.Serializable;
import java.util.ArrayList;

/**
 * A neuron for a neural network.
 * @author Kong Jimmy Vang
 */
public class Neuron implements Serializable {
    
    /** Default Serial UID */
    private static final long serialVersionUID = 3L;
    
    // *** Fields/Instance Variables ***
    /** The bias. (bias = 1) */
    protected Double bias;
    /** The weight of the bias. */
    protected Double biasWeight;
    
    //------------------------------------------------
    /** The total input, in_j. */
    protected Double input;
    
    /** The List of weights connected to this neuron from other neuron outputs. Use with input neurons. 
     *      List of w_i.
     */
    protected ArrayList<Double> inputWeights;
    
    /** The List of neurons connected to this neuron from other neuron outputs. Use with input weights.
     *      List of neurons, to get each neuron's output, a_i.
     */
    protected ArrayList<Neuron> inputNeurons;
    
    /** The output of this neuron, a_j. */
    protected Double output;
    //------------------------------------------------
    
    /** The error produced by this neuron. (Used for the output errors) */
    protected Double error;
    /** The delta error of this neuron. (Used for back-propagation learning) */
    protected Double deltaError;
    
    // *** Constructors ***
    /** Builds a new neuron */
    public Neuron() {
        this.bias = 1.0;
        this.biasWeight = Math.random();
        this.input = 0.0;
        this.inputWeights = new ArrayList<>();
        this.inputNeurons = new ArrayList<>();
        this.output = 0.0;
        this.error = 0.0;
        this.deltaError = 0.0;
    }
    
    // *** Methods/Functions ***
    /** 
     * Add a connection from this neuron's input to another neuron's output. 
     * 
     * @param inputNeuron - The other neuron to connect to.
     */
    protected void connectInputTo(Neuron inputNeuron) {
        inputWeights.add(Math.random());
        inputNeurons.add(inputNeuron);
    }
    
    /** 
     * Add a connection from this neuron's output, a_j, to another neuron's input.
     * 
     * @param outputNeuron - The other neuron to connect to.
     */
    protected void connectOutputTo(Neuron outputNeuron) {
        outputNeuron.inputWeights.add(Math.random());
        outputNeuron.inputNeurons.add(this);
    }
    
    /** Randomize all the input weights to this neuron. */
    protected void randomizeWeights() {
        this.biasWeight = Math.random();
        for(int i = 0; i < this.inputWeights.size(); i++) {
            this.inputWeights.set(i, Math.random());
        }
    }
    
    /** 
     * Sets the input of this neuron manually.
     * 
     * @param input - The input to set, in_j.
     */
    protected void applyInput(double input) {
        this.input = input;
    }
    
    /** 
     * Calculates this neuron's input, in_j, using the connected input neurons, 
     * (List of connected "a_i" and "w_i" values).
     */
    protected void calculateInput() {
        this.input = this.bias * this.biasWeight;
        
        for (int i = 0; i < inputNeurons.size(); i++) {
            double w = inputWeights.get(i);
            double a = inputNeurons.get(i).output;
            this.input += w * a;
        }
    }
    
    /** Calculates the output for this neuron. */
    protected void calculateOutput() {
        //calculateInput();
        this.output = SimpleMath.sigmoid(this.input);
    }
    
    /** 
     * Calculates the error for this neuron. <br>
     * Error = (expectedOutput) - (neuron's output).
     * 
     * @param expectedOutput - The expected output.
     * @return Returns the calculated error for this neuron.
     */
    protected double calculateError(int expectedOutput) {
        this.error = expectedOutput - output;
        return this.error;
    }
}
