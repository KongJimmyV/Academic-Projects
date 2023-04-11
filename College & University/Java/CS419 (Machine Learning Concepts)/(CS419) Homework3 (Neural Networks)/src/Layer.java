//////////////////////////////////////////////////////
// File Name:   Layer.java
// Author:      Kong Jimmy Vang
// Date:        10/31/2018
// 

import java.io.Serializable;
import java.util.ArrayList;

/**
 * A layer for a neural network.
 * @author Kong Jimmy Vang
 */
public class Layer implements Serializable {
    
    /** Default Serial UID */
    private static final long serialVersionUID = 2L;
    
    // *** Fields/Instance Variables ***
    /** A list of neurons in this layer. */
    protected ArrayList<Neuron> neurons;
    
    /** The number of neurons in this layer. */
    protected int numOfNeurons;
    
    // *** Constructors ***
    /** Constructs a new layer. */
    public Layer(int numOfNeurons) {
        this.numOfNeurons = numOfNeurons;
        this.neurons = new ArrayList<>(numOfNeurons);
        
        for (int i = 0; i < numOfNeurons; i++) {
            this.neurons.add(new Neuron());
        }
    }
    
    // *** Methods/Functions ***
    /** Connects this layer to another layer in front. */
    protected void connectTo(Layer nextLayer) {
        for (int i = 0; i < neurons.size(); i++) {
            for (int j = 0; j < nextLayer.neurons.size(); j++) {
                neurons.get(i).connectOutputTo(nextLayer.neurons.get(j));
            }
        }
    }
    
    /** Randomizes the input weights of the neurons in this layer. */
    protected void randomizeWeights() {
        for(int i = 0; i < this.neurons.size(); i++) {
            neurons.get(i).randomizeWeights();
        }
    }
    
    /** Calculates the inputs and outputs on every single one of the layer's neurons. */
    protected void calculateOutputs() {
        for (int i = 0; i < neurons.size(); i++) {
            neurons.get(i).calculateInput();
            neurons.get(i).calculateOutput();
        }
    }
}
