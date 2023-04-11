//////////////////////////////////////////////////////
// File Name:   NeuralNetwork.java
// Author:      Kong Jimmy Vang
// Date:        10/31/2018
// 

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Vector;

/**
 * A Fully-Connected Neural Network.
 * @author Kong Jimmy Vang
 */
public class NeuralNetwork implements Serializable {
    
    /** Default Serial UID (Allows for file storage) */
    private static final long serialVersionUID = 1L;
    
    // *** Fields/Instance Variables ***
    /** An list of layers for this network containing neurons. */
    protected ArrayList<Layer> layers;
    
    // *** Constructors ***
    /** Builds a neural network.
     * 
     * @param numOfInputs - The initial number of input neurons.
     * @param numOfHiddenLayers - The initial number of hidden layers.
     * @param sizesOfHiddenLayers - An ArrayList of Integers, 
     *          each element representing the amount of neurons in each hidden layer. <br><br>
     *          
     *          EX: ArrayList [2,5,10]                                      <br>
     *                                 ==> Hidden Layer 1 has a size of 2 neurons.  <br>
     *                                 ==> Hidden Layer 2 has a size of 5 neurons.  <br>
     *                                 ==> Hidden Layer 3 has a size of 10 neurons. <br>
     * @param numOfOutputs - The initial number of output neurons.
     */
    public NeuralNetwork(
            final int numOfInputs, 
            final int numOfHiddenLayers, 
            final ArrayList<Integer> sizesOfHiddenLayers, 
            final int numOfOutputs) {
        
        buildFullyConnectedNeuralNetwork(numOfInputs, numOfHiddenLayers, sizesOfHiddenLayers, numOfOutputs);
    }
    
    // *** Methods/Functions ***
    /** 
     * [Helper Method for {@link #NeuralNetwork(int, int, ArrayList, int)}] <br><br>
     * 
     * Builds a fully connected nerual network. See the link or listed helper method for the parameter infomation.
     * @see {@link #NeuralNetwork(int, int, ArrayList, int)}
     */
    private void buildFullyConnectedNeuralNetwork(final int numOfInputs,
                                   final int numOfHiddenLayers,
                                   final ArrayList<Integer> sizesOfHiddenLayers, 
                                   final int numOfOutputs) {
        
        layers = new ArrayList<>();
        
        // Add the input layer to this network.
        layers.add(new Layer(numOfInputs));
        
        // Add the hidden layers to this network.
        if (numOfHiddenLayers > 0 && sizesOfHiddenLayers != null) {
            for (int i = 0; i < numOfHiddenLayers; i++) {
                layers.add(new Layer( sizesOfHiddenLayers.get(i) ));
            }
        }
        
        // Add the output layer to this network.
        layers.add(new Layer(numOfOutputs));
        
        // Fully connect the layers together.
        for (int i = 0; i < layers.size() - 1; i++) {
            layers.get(i).connectTo( layers.get(i + 1) );
        }
    }
    
    /** Randomize all the weights in this network. */
    protected void randomizeWeights() {
        for(int i = 0; i < this.layers.size(); i++) {
            this.layers.get(i).randomizeWeights();
        }
    }
    
    /** Returns the input layer of this network. */
    protected Layer getInputLayer() {
        return this.layers.get(0);
    }
    
    /** Returns the output layer of this network. */
    protected Layer getOutputLayer() {
        return this.layers.get(this.layers.size() - 1);
    }
    
    /** 
     * Classifies an example using this network.
     * 
     * @param example - An example to classify.
     * @return Returns true, if the network correctly classifies the example. Otherwise, return false.
     */
    public boolean classify(ArrayList<Vector<Double>> example) {
        Layer inputLayer = getInputLayer();
        for (int i = 0; i < inputLayer.neurons.size(); i++) {
            inputLayer.neurons.get(i).applyInput(example.get(0).get(i));
            inputLayer.neurons.get(i).calculateOutput();
        }
        
        for (int i = 1; i < this.layers.size(); i++) {
            this.layers.get(i).calculateOutputs();
        }
        
        Layer outputLayer = getOutputLayer();
        Neuron highestOutputNeuron = outputLayer.neurons.get(0);
        int highestOutputNeuronIndex = 0;
        for (int i = 0; i < outputLayer.neurons.size(); i++) {
            // Find the highest output value.
            if (outputLayer.neurons.get(i).output > highestOutputNeuron.output) {
                highestOutputNeuron = outputLayer.neurons.get(i);
                highestOutputNeuronIndex = i;
            }
        }
        
        if (example == null || 
                Math.ceil(outputLayer.neurons.get(highestOutputNeuronIndex).output) 
                != example.get(1).get(highestOutputNeuronIndex)) {
            return false;
        }
        
        return true;
    }
    
}
