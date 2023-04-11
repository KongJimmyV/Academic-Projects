import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Random;

/**
 * Project Name:    Assignment 3        <br>
 * File Name:       Neuron.java         <br>
 * Description:     A Neural Network Neuron that can be singly-linked or doubly-linked with other neurons. <br><br>
 * Date Created:    11/18/22            <br>
 * Date Modified:   11/28/22            <br>
 * @author Kong Jimmy Vang
 */
public class Neuron 
{
    //======================================================================
    //=== Variables ===
    
    //--- Neuron Variables ---
    /** Neuron Label */
    private String label;
    
    /** Neuron input in */
    private double input;
    
    /** Neuron output a */
    private double output;
    
    /** Neuron delta value */
    private double delta;
    
    /** Mapped inputs from Neuron outputs via their String Label */
    private LinkedHashMap<String, Neuron> inputEdges;
    
    /** Mapped outputs to Neurons inputs via their String Label */
    private LinkedHashMap<String, Neuron> outputEdges;
    
    /** Mapped output weights to Neurons inputs via their String Label  */
    private LinkedHashMap<String, Double> outputWeights;
    
    /** The Activation Function of this node. */
    private ActivationFunction activationFunction;
    
    //--- Other ---
    /**
     * [EXPERIMENTAL] The Random object.
     * Used to randomly generate weights for each directed output weight.
     */
    private Random r;
    
    //======================================================================
    //=== Constructors ===
    /**
     * Constructs a new Neuron with a logistic activation function by default.
     * @param label - Neuron label.
     * @param seed - Seed value. Determines the values for weight randomization.
     */
    public Neuron(final String label, final long seed) 
    {
        this(label, seed, new ActivationFunctionLogistic());
    }
    
    /**
     * Constructs a new Neuron with a given activation function.
     * @param label - Neuron label.
     * @param seed - Seed value. Determines the values for weight randomization.
     * @param activationFunction - Activation Function for this neuron.
     */
    public Neuron(final String label, final long seed, final ActivationFunction activationFunction) 
    {
        this.r = new Random(seed);
        this.label = label;
        this.input = 0.0;
        this.output = 0.0;
        this.inputEdges = new LinkedHashMap<>();
        this.outputEdges = new LinkedHashMap<>();
        this.outputWeights = new LinkedHashMap<>();
        this.activationFunction = activationFunction;
    }
    
    //======================================================================
    //=== Methods ===
    /**
     * Gets the Neuron's label.
     * @return Returns the label.
     */
    public String getLabel() {
        return this.label;
    }
    
    /**
     * Links a given Neuron that will act as an input to this neuron.
     * @param label
     * @param neuron
     */
    public void addInputEdge(final Neuron neuron) {
        this.inputEdges.put(neuron.getLabel(), neuron);
    }
    
    /**
     * Gets the linked input edges to this neuron.
     * @return Returns the input edges.
     */
    public LinkedHashMap<String, Neuron> getInputEdges() {
        return this.inputEdges;
    }
    
    /**
     * Links this Neuron's output to an given Neuron.
     * @param neuron - Other Neuron.
     */
    public void addOutputEdge(final Neuron neuron) {
        this.outputEdges.put(neuron.getLabel(), neuron);
        this.outputWeights.put(neuron.getLabel(), 0.0);
    }
    
    /**
     * Gets the linked output edges from this neuron.
     * @return Returns the output edges.
     */
    public LinkedHashMap<String, Neuron> getOutputEdges() {
        return this.outputEdges;
    }
    
    /**
     * Initializes all output weights to a random value within a range in [-epsilon, epsilon].
     * @param epsilon - determines the range of randomly generated weights.
     */
    public void initOutputWeights(final double epsilon) 
    {
        for (Map.Entry<String, Double> set : this.outputWeights.entrySet()) 
        {
            String label = set.getKey();
            
            double rangeMin = -epsilon;
            double rangeMax = epsilon;
            Double value = rangeMin + (rangeMax - rangeMin) * r.nextDouble();
            this.outputWeights.put(label, value);
        }
    }
    
    /**
     * Set all output weights to the given value.
     * @param epsilon - determines the range of randomly generated weights.
     */
    public void setOutputWeights(final double weight) 
    {
        for (Map.Entry<String, Double> set : this.outputWeights.entrySet()) 
        {
            this.outputWeights.put(set.getKey(), weight);
        }
    }
    
    /**
     * Sets the weight value connected from this Neuron to a Neuron labeled j.
     * @return Returns the weight value given a label j.
     */
    public Double setOutputWeightAt(final String j, final double weight) {
        return this.outputWeights.put(j, weight);
    }
    
    /**
     * Get all output weight edges from this neuron.
     * @return Returns all output weight edges.
     */
    public LinkedHashMap<String, Double> getOutputWeights() {
        return this.outputWeights;
    }
    
    /**
     * Gets the weight value connected from this Neuron to a Neuron labeled j.
     * @return Returns the weight value given a label j.
     */
    public Double getOutputWeightAt(final String j) {
        return this.outputWeights.get(j);
    }
    
    /**
     * Sets the input at this neuron.
     * @param input
     */
    public void setInput(final double input) {
        this.input = input;
    }
    
    /**
     * Gets the input at this neuron.
     * @return Returns the input.
     */
    public double getInput() {
        return this.input;
    }
    
    /**
     * Calculates and gets the output at this neuron.
     * @return Returns the calculated output.
     */
    public double calcOutput() {
        this.output = this.getActivationFunction().g(this.input);
        return this.output;
    }
    
    /**
     * Sets the output at this neuron.
     * @param output
     */
    public void setOutput(final double output) {
        this.output = output;
    }
    
    /**
     * Gets the output at this neuron.
     * @return Returns the output.
     */
    public double getOutput() {
        return this.output;
    }
    
    /**
     * Returns the <code>ActivationFunction</code> object at this neuron.
     * @return
     */
    public ActivationFunction getActivationFunction() 
    {
        return this.activationFunction;
    }
    
    /**
     * Sets the delta value at this neuron.
     * @param delta
     */
    public void setDelta(final double delta) {
        this.delta = delta;
    }
    
    /**
     * Gets the delta value at this neuron.
     * @return
     */
    public double getDelta() {
        return this.delta;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        /*sb.append(String.format("("));
        sb.append(String.format("w:%s, ", weight));
        sb.append(String.format("i:%s, ", input));
        sb.append(String.format("o:%s, ", output));
        sb.append(String.format("oNeurons:%s, ", outputsNeurons.size()));
        sb.append(String.format("%s", this.activationFunction));
        sb.append(String.format(")"));*/
        
        // Neuron Label
        sb.append(String.format("[Node:%s", this.getLabel()));
        
        // Neuron Output Value.
        //sb.append(String.format("[%s]", String.valueOf(this.getOutput())));
        
        // Neuron Directed Output Edges
        sb.append(String.format(" (DirEdges:"));
        if (outputEdges.size() == 0) {
            sb.append("None ");
        }
        for (Map.Entry<String, Neuron> set : outputEdges.entrySet()) 
        {
            sb.append(String.format("%s", String.valueOf(set.getValue().getLabel())));
            sb.append(',');
        }
        sb.setCharAt(sb.length() - 1, ')');
        sb.append(']');
        
        // Return String
        return sb.toString();
    }
}
