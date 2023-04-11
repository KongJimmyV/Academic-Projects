import java.text.DecimalFormat;
import java.time.Clock;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;

/**
 * Project Name:    Assignment 3        <br>
 * File Name:       FeedForwardNeuralNetwork.java <br>
 * Description:     A Feed Forward Neural Network. <br><br>
 * Date Created:    11/18/22            <br>
 * Date Modified:   11/28/22            <br>
 * @author Kong Jimmy Vang
 */
public class FeedForwardNeuralNetwork 
{
    //======================================================================
    //=== Variables ===
    
    //--- Global Constants ---
    /** Determines when to print during batch gradient descent */
    final private int EPOCH_PRINT_CONSTANT = 10;
    
    /** Determines the stopping condition for the cost and delta cost. */
    final private double COST_LIMIT = Math.pow(10, -10);
    
    //--- Neural Network Variables ---
    /** Number of neurons in the neural network. */
    private int networkSize;
    
    /** The Bias Neuron. */
    private Neuron biasNeuron;
    
    /** The Input Layer. */
    private LinkedHashMap<Integer, Neuron> inputLayer;
    
    /** The Map of Hidden Layers. */
    private LinkedHashMap<Integer, LinkedHashMap<Integer, Neuron>> hiddenLayers;
    
    /** The Output Layer. */
    private LinkedHashMap<Integer, Neuron> outputLayer;
    
    /** The Activation Function for the input layer and the hidden layer. */
    private ActivationFunction activationFunction;
    
    /** The Activation Function for the output layer. */
    private ActivationFunction activationFunctionOutputLayer;
    
    //--- RNG variables ---
    /**
     * [EXPERIMENTAL] The Random object. 
     * Used set each neuron's Random Number Generator.
     * Determines what seed each neuron gets.
     */
    private Random r;
    
    /**
     * [EXPERIMENTAL] Stores the RNG seed of the Random object. 
     */
    private long seed;
    
    //=== Global Variables ===
    /** The epoch limit. */
    private int epochLimit;
    
    /** The verbosity level from 1 to 4, 1 being the least verbose. */
    private int verbosityLevel;
    
    /** If true, will randomize order of batch construction at the start of each training epoch. */
    private boolean bRandomization;
    
    //=== Temporary Global Variables ===
    /** Counter for logging a current example */
    private int exampleCounter;
    
    /** Stores last calculated cost */
    private double cost;
    
    /** Stores last calculated loss */
    private double loss;
    
    //======================================================================
    //=== Constructors ===
    /**
     * Constructs a Feed Forward Neural Network. Use a randomly generated seed for the Random Number Generator.
     * 
     * @param numOfInputs - number of inputs for the input layer (does not include bias neuron)
     * @param listHiddenLayerSizes - a list, each element stores the size of each hidden layer.
     * @param numOfOutputs - number of outputs for the output layer
     * @param epochLimit - epoch limit
     * @param bRandomization - if true, randomize order of batch construction
     * @param verbosityLevel - the verbosity level from 1 to 4, 1 being the least verbose.
     * @param activationFunction - the activation function to store in all nodes, excluding the bias neuron.
     */
    public FeedForwardNeuralNetwork(final int numOfInputs, 
                                    final List<Integer> listHiddenLayerSizes, 
                                    final int numOfOutputs,
                                    final int epochLimit,
                                    final boolean bRandomization,
                                    final int verbosityLevel,
                                    final ActivationFunction activationFunction) 
    {
        this(new Random().nextLong(), 
             numOfInputs, 
             listHiddenLayerSizes, 
             numOfOutputs, 
             epochLimit, 
             bRandomization, 
             verbosityLevel, 
             activationFunction);
    }
    
    /**
     * Constructs a Feed Forward Neural Network with an Random Number Generator seed for weight randomization.
     * 
     * @param seed - RNG seed for weight randomization
     * @param numOfInputs - number of inputs for the input layer (does not include bias neuron)
     * @param listHiddenLayerSizes - a list, each element stores the size of each hidden layer.
     * @param numOfOutputs - number of outputs for the output layer
     * @param epochLimit - epoch limit
     * @param bRandomization - if true, randomize order of batch construction
     * @param verbosityLevel - the verbosity level from 1 to 4, 1 being the least verbose.
     * @param activationFunction - the activation function to store in all nodes, excluding the bias neuron.
     */
    public FeedForwardNeuralNetwork(final long seed,
                                    final int numOfInputs, 
                                    final List<Integer> listHiddenLayerSizes, 
                                    final int numOfOutputs, 
                                    final int epochLimit, 
                                    final boolean bRandomization, 
                                    final int verbosityLevel, 
                                    final ActivationFunction activationFunction) 
    {
        this.seed = seed;
        this.r = new Random(this.seed);
        this.networkSize = 0;
        this.inputLayer = new LinkedHashMap<>();
        this.hiddenLayers = new LinkedHashMap<>();
        this.outputLayer = new LinkedHashMap<>();
        this.epochLimit = epochLimit;
        this.bRandomization = bRandomization;
        this.verbosityLevel = verbosityLevel;
        this.activationFunction = activationFunction;
        this.activationFunctionOutputLayer = new ActivationFunctionLogistic();
        
        //=== Create Neurons ===
        // Create Bias Neuron
        this.biasNeuron = new Neuron(Integer.toString(this.networkSize++), 
                                     r.nextLong(), 
                                     new ActivationFunctionBias());
        this.biasNeuron.setInput(1.0);
        this.biasNeuron.setOutput(1.0);
        
        // Create and Connect Layers
        initLayers(numOfInputs, listHiddenLayerSizes, numOfOutputs);
    }
    
    //======================================================================
    //=== Methods ===
    /**
     * Initialize Layers and connect them together.
     * @param numOfInputs
     * @param listHiddenLayerSizes
     * @param numOfOutputs
     */
    private void initLayers(final int numOfInputs, 
                            final List<Integer> listHiddenLayerSizes, 
                            final int numOfOutputs) 
    {
        if (this.inputLayer.isEmpty()) {
            this.inputLayer.clear();
            this.hiddenLayers.clear();
            this.outputLayer.clear();
        }
        
        if (verbosityLevel >= 2) {
            System.out.println(String.format("  * Layer sizes (excluding bias neuron(s)): "));
        }
        
        // Input Layer
        for (int i = 0; i < numOfInputs; i++) {
            Neuron n = new Neuron(Integer.toString(this.networkSize++), r.nextLong(), this.activationFunction);
            this.inputLayer.put(i, n);
        }
        if (verbosityLevel >= 2) {
            System.out.println(String.format("    Layer %2d (input) : %4d", 1, this.inputLayer.size()));
        }
        
        // Hidden Layer
        for (int i = 0; i < listHiddenLayerSizes.size(); i++) 
        {
            int hiddenLayerSize = listHiddenLayerSizes.get(i);
            LinkedHashMap<Integer, Neuron> layer = new LinkedHashMap<>();
            
            for (int j = 0; j < hiddenLayerSize; j++) 
            {
                Neuron n = new Neuron(Integer.toString(this.networkSize++), r.nextLong(), this.activationFunction);
                layer.put(j, n);
            }
            this.hiddenLayers.put(i, layer);
            if (verbosityLevel >= 2) 
            {
                System.out.println(String.format("    Layer %2d (hidden): %4d", i + 2, this.hiddenLayers.get(i).size()));
            }
        }
        
        // Output Layer
        for (int i = 0; i < numOfOutputs; i++) {
            Neuron n = new Neuron(Integer.toString(this.networkSize++), r.nextLong(), this.activationFunctionOutputLayer);
            this.outputLayer.put(i, n);
        }
        if (verbosityLevel >= 2) {
            System.out.println(
                    String.format("    Layer %2d (output): %4d", listHiddenLayerSizes.size() + 2, this.outputLayer.size()));
        }
        
        // Connect the layers together.
        connectLayers();
    }
    
    /**
     * Connect this entire network's layers. (Layers must be initialized first and must not be already connected)
     */
    private void connectLayers() 
    {
        if (hiddenLayers.size() == 0) 
        {
            connectLayerToLayer(inputLayer, outputLayer);
        } 
        else 
        {
            connectLayerToLayer(inputLayer, hiddenLayers.get(0));
            for (int i = 0; i < hiddenLayers.size() - 1; i++) 
            {
                connectNeuronToLayer(biasNeuron, hiddenLayers.get(i));
                connectLayerToLayer(hiddenLayers.get(i), hiddenLayers.get(i+1));
            }
            connectNeuronToLayer(biasNeuron, hiddenLayers.get(hiddenLayers.size() - 1));
            connectLayerToLayer(hiddenLayers.get(hiddenLayers.size() - 1), outputLayer);
        }
        connectNeuronToLayer(biasNeuron, outputLayer);
    }
    
    /**
     * Connects a neuron to a layer's nodes.
     * @param neuron - neuron
     * @param layer - layer of nodes
     */
    private void connectNeuronToLayer(final Neuron neuron,  
                                      final LinkedHashMap<Integer, Neuron> layer) 
    {
        for (int i = 0; i < layer.size(); i++) {
            Neuron layerNeuron = layer.get(i);
            neuron.addOutputEdge(layerNeuron);
            layerNeuron.addInputEdge( neuron);
        }
    }
    
    /**
     * Connects layer1's nodes to layer2's nodes.
     * @param layer1 - 1st layer of nodes
     * @param layer2 - 2nd layer of nodes
     */
    private void connectLayerToLayer(final LinkedHashMap<Integer, Neuron> layer1,  
                                     final LinkedHashMap<Integer, Neuron> layer2) 
    {
        for (int i = 0; i < layer1.size(); i++) {
            Neuron layerNeuron1 = layer1.get(i);
            for (int j = 0; j < layer2.size(); j++) {
                Neuron layerNeuron2 = layer2.get(j);
                layerNeuron1.addOutputEdge(layerNeuron2);
                layerNeuron2.addInputEdge(layerNeuron1);
            }
        }
    }
    
    /**
     * Predict the class given a single data point with features.
     * @param features - a single data point with features
     * @return Returns the predicted class.
     */
    public int predict(final LinkedHashMap<Integer, Double> features) 
    {
        forwardPropagate(features, null, 0, false);
        
        int classK = 0;
        double hx = Double.MIN_VALUE;
        for (Map.Entry<Integer, Neuron> set: this.outputLayer.entrySet()) 
        {
            
            Integer i = set.getKey();
            Neuron n = set.getValue();
            if (hx < n.getOutput() || hx == Double.MIN_VALUE) {
                hx = n.getOutput();
                classK = i;
            }
            //System.out.println("  T: " + n.getLabel() + " " + n.getOutput());
        }
        return classK;
    }
    
    /**
     * Calculate the prediction accuracy of this neural network for a given data set.
     * @param featureSet - a set of data point with features
     * @param outputSet - a set of data point with outputs
     * @return Return the prediction accuracy of this neural network for a given data set.
     */
    public double calculateAccuracy(final LinkedHashMapSet<Double> featureSet, 
                                    final LinkedHashMapSet<Double> outputSet) 
    {
        int correctPredictions = 0;
        
        for (Map.Entry<Integer, LinkedHashMap<Integer, Double>> data1 : featureSet.entrySet()) 
        {
            int predictedClass = this.predict(data1.getValue());
            int actualClass = 0;
            
            for (Map.Entry<Integer, Double> data2 : outputSet.get(data1.getKey()).entrySet()) 
            {
                Double value = data2.getValue();
                if (Double.compare(value, 1.0) == 0) {
                    actualClass = data2.getKey();
                    break;
                }
            }
            //System.out.println(predictedClass + " " + actualClass);
            
            if (predictedClass == actualClass) {
                correctPredictions++;
            }
        }
        //System.out.println(correctPredictions + " " + featureSet.size());
        
        if (featureSet.size() == 0) {
            return 0;
        } else {
            return (double) correctPredictions / (double) featureSet.size();
        }
    }
    
    /**
     * Trains on a data set of features and outputs.
     * @param trainingFeatureSet - a data set of points with features
     * @param trainingOutputSet - a data set of points with features
     * @param maxBatchSize - maximum batch size
     * @param alpha - alpha value for weight updates.
     * @param regularizationLambda - lambda value used for regularization
     * @param epsilon - determine weight randomized within a range in [-epsilon, epsilon]
     */
    public void train(final LinkedHashMapSet<Double> trainingFeatureSet, 
                      final LinkedHashMapSet<Double> trainingOutputSet, 
                      int maxBatchSize,
                      final double alpha, 
                      final double regularizationLambda, 
                      final double epsilon) 
    {
        // Guard Clauses
        if (maxBatchSize <= 0) {
            // if batchSize is non-positive, do full batch gradient descent on full training data set.
            maxBatchSize = trainingFeatureSet.size();
        }
        
        //*** LOG ***
        if (this.verbosityLevel >= 2) {
            System.out.println("  * Beginning mini-batch gradient descent");
            System.out.println(
                    String.format(
                            "    (batchSize=%d, epochLimit=%d, learningRate=%.4f, lambda=%.4f)", 
                            maxBatchSize, 
                            epochLimit, 
                            alpha, 
                            regularizationLambda));
        }
        
        // Weight initialization
        initWeights(epsilon);
        
        // Perform Gradient Descent Training
        miniBatchGradientDescent(trainingFeatureSet, 
                                 trainingOutputSet, 
                                 maxBatchSize,
                                 alpha, 
                                 regularizationLambda, 
                                 epsilon);
    }
    
    /**
     * Initialize this neural network's weights.
     */
    private void initWeights(final double epsilon) 
    {
        //*** LOG: Weight Initialization ***
        if (this.verbosityLevel >= 5) {
            System.out.println(String.format("\r\n  * DEBUG: Weight Initialization"));
        }
        
        // Initialize Weights between all layers.
        if (epsilon >= 0) 
        {
            //------------------------------------------------------------------------
            //--- (epsilon >= 0): Perform non-deterministic weight initialization. ---
            
            // Bias Neuron Direct Edge Weights
            this.biasNeuron.initOutputWeights(epsilon);
            
            // Input Layer Direct Edge Weights
            for (Map.Entry<Integer, Neuron> iSet : this.inputLayer.entrySet()) 
            {
                Neuron iN = iSet.getValue();
                iN.initOutputWeights(epsilon);
            }
            
            // Hidden Layer Direct Edge Weights
            for (Entry<Integer, LinkedHashMap<Integer, Neuron>> hiddenLayer : this.hiddenLayers.entrySet()) 
            {
                for (Map.Entry<Integer, Neuron> iSet : hiddenLayer.getValue().entrySet()) 
                {
                    Neuron iN = iSet.getValue();
                    iN.initOutputWeights(epsilon);
                }
            }
        } 
        else 
        {
            //-------------------------------------------------------------------
            //--- (epsilon < 0): Perform deterministic weight initialization. ---
            
            // Bias Neuron Direct Edge Weights
            this.biasNeuron.setOutputWeights(0.1);
            
            // Input Layer Direct Edge Weights
            int i = 1;
            for (Map.Entry<Integer, Neuron> iSet : this.inputLayer.entrySet()) 
            {
                int j = 1;
                Neuron iN = iSet.getValue();
                for (Map.Entry<String, Double> jSet : iN.getOutputWeights().entrySet()) 
                {
                    String jLabel = jSet.getKey();
                    iN.setOutputWeightAt(jLabel, 1.0 / (i * Math.pow(2, j - 1)));
                    //iN.setOutputWeightAt(jLabel, (1.0 / i) * (1.0 / Math.pow(2, j - 1)));
                    j++;
                }
                i++;
            }
            
            // Hidden Layer Direct Edge Weights
            for (Entry<Integer, LinkedHashMap<Integer, Neuron>> hiddenLayer : this.hiddenLayers.entrySet()) 
            {
                i = 1;
                for (Map.Entry<Integer, Neuron> iSet : hiddenLayer.getValue().entrySet()) 
                {
                    int j = 1;
                    Neuron iN = iSet.getValue();
                    for (Map.Entry<String, Double> jSet : iN.getOutputWeights().entrySet()) 
                    {
                        String jLabel = jSet.getKey();
                        iN.setOutputWeightAt(jLabel, 1.0 / (i * Math.pow(2, j - 1)));
                        j++;
                    }
                    i++;
                }
            }
        }
        
        //*** LOG: Print Weights ***
        if (this.verbosityLevel >= 5) {
            printWeights();
        }
    }
    
    /**
     * Print this neural network's weights.
     */
    public void printWeights() {
        System.out.println(String.format("  Weight Values For Output Directed Edges"));
        
        // Bias Neuron weight
        System.out.print(String.format("    %s", this.biasNeuron));
        for (Map.Entry<String, Double> set: this.biasNeuron.getOutputWeights().entrySet()) {
            System.out.print(String.format("\r\n      [Weight (Node %s to Node %s): %.4f]", this.biasNeuron.getLabel(), set.getKey(), set.getValue()));
        }
        System.out.println();
        
        // Input Layer weights
        for (Map.Entry<Integer, Neuron> iSet : this.inputLayer.entrySet()) 
        {
            Neuron iN = iSet.getValue();
            System.out.print(String.format("    %s", iN));
            for (Map.Entry<String, Double> set: iN.getOutputWeights().entrySet()) {
                System.out.print(String.format("\r\n      [Weight (Node %s to Node %s): %.4f]", iN.getLabel(), set.getKey(), set.getValue()));
            }
            System.out.println();
        }
        
        // Hidden Layer weights
        for (Entry<Integer, LinkedHashMap<Integer, Neuron>> hiddenLayer : this.hiddenLayers.entrySet()) 
        {
            for (Map.Entry<Integer, Neuron> iSet : hiddenLayer.getValue().entrySet()) 
            {
                Neuron iN = iSet.getValue();
                System.out.print(String.format("    %s", iN));
                for (Map.Entry<String, Double> set: iN.getOutputWeights().entrySet()) {
                    System.out.print(String.format("\r\n      [Weight (Node %s to Node %s): %.4f]", iN.getLabel(), set.getKey(), set.getValue()));
                }
                System.out.println();
            }
        }
        System.out.println();
    }
    
    /**
     * [Helper Function] Perform Gradient Descent.
     * @param trainingFeatureSet - a data set of points with features
     * @param trainingOutputSet - a data set of points with features
     * @param maxBatchSize - maximum batch size
     * @param alpha - alpha value for weight updates.
     * @param regularizationLambda - lambda value used for regularization
     * @param epsilon - determine weight randomized within a range in [-epsilon, epsilon]
     */
    private void miniBatchGradientDescent(final LinkedHashMapSet<Double> trainingFeatureSet, 
                                          final LinkedHashMapSet<Double> trainingOutputSet, 
                                          final int maxBatchSize, 
                                          final double alpha, 
                                          final double regularizationLambda, 
                                          final double epsilon) 
    {
        // EPOCH constants
        final int EPOCH_PRINT_LOCAL_CONSTANT = (int) Math.ceil((double) epochLimit / (double) EPOCH_PRINT_CONSTANT);
        
        // Counter Variables
        int t = 0;
        int e = 0;
        this.exampleCounter = 0;
        
        // Cost Variables
        cost = Double.MAX_VALUE;
        double deltaCost = Double.MAX_VALUE;
        deltaCost = 0.5;
        
        // Initialize Logging Variables
        Clock clock = Clock.systemDefaultZone();
        long initialTimeMillisPerIter = 0;
        long finalTimeMillisPerIter = 0;
        long deltaTimeMillisPerIter = 0;
        double averageTimeMillisPerIter = 0;
        long totalTimeMillis = 0;
        
        //--- EPOCH LOOP ---
        while ( e < epochLimit 
                && Double.compare(cost, COST_LIMIT) >= 0 
                && Double.compare(deltaCost, COST_LIMIT) >= 0 ) 
        {
            this.exampleCounter = 0;
            
            //*** LOG: Display Model ***
            if (this.verbosityLevel >= 3) {
                if (e == 0) {
                    if (epsilon >= 0) {
                        System.out.print(String.format("    Initial model with random weights :"));
                    } else {
                        System.out.print(String.format("    Initial model with determ. weights:"));
                    }
                    printModelInfo(trainingFeatureSet, trainingOutputSet, regularizationLambda);
                } else if (e % (EPOCH_PRINT_LOCAL_CONSTANT) == 0 && e < epochLimit - 1) {
                    System.out.print(String.format("    After %6s epochs", e));
                    System.out.print(String.format(" (%6s iter.):", t));
                }
            }
            
            //***
            /* Divide {1, 2, . . . , n} into random mini-batches of m data points each
             *  If m does not evenly divide n, then the last mini-batch should have size n mod m */
            // List of batches.
            ArrayList<LinkedHashMapSet<Double>> trainingFeatureBatches = new ArrayList<>();
            ArrayList<LinkedHashMapSet<Double>> trainingOutputBatches = new ArrayList<>();
            
            // Create mini batches and store them in trainingFeatureBatches and trainingOutputBatches.
            createMiniBatches(trainingFeatureSet,
                              trainingOutputSet,
                              trainingFeatureBatches, 
                              trainingOutputBatches, 
                              maxBatchSize);
            
            //*** DEBUG: Show mini Batches. ***
            if (this.verbosityLevel >= 5) {
                int debugCount = 0;
                System.out.println("\r\n    * DEBUG: Showing Batches");
                for (int i = 0; i < trainingFeatureBatches.size(); i++) {
                    LinkedHashMapSet<Double> featureBatch = trainingFeatureBatches.get(i);
                    LinkedHashMapSet<Double> outputBatch = trainingOutputBatches.get(i);
                    System.out.println(String.format("      Batch %d: ", debugCount));
                    System.out.println(String.format("        Feature Batch: %s ", featureBatch));
                    System.out.println(String.format("        Output Batch: %s ", outputBatch));
                    debugCount++;
                }
            }
            
            //--- ITERATION LOOP ---: For each mini-batch B
            for (int b = 0; b < trainingFeatureBatches.size(); b++)
            {
                // Store Initial Time
                initialTimeMillisPerIter = clock.millis();
                
                // Batch sets.
                LinkedHashMapSet<Double> miniFeatureBatch = trainingFeatureBatches.get(b);
                LinkedHashMapSet<Double> miniOutputBatch = trainingOutputBatches.get(b);
                
                // A set that stores for each example, delta and output values.
                LinkedHashMap<Integer, LinkedHashMap<String, Double>> deltaExamples = new LinkedHashMap<>();
                LinkedHashMap<Integer, LinkedHashMap<String, Double>> outputExamples = new LinkedHashMap<>();
                
                // For each example index in mini-batch B
                for (int exampleIndex = 0; exampleIndex < miniFeatureBatch.size(); exampleIndex++) {
                    LinkedHashMap<Integer, Double> exampleFeatures = miniFeatureBatch.get(exampleIndex);
                    LinkedHashMap<Integer, Double> exampleOutputs = miniOutputBatch.get(exampleIndex);
                    backPropagate(exampleFeatures, exampleOutputs, deltaExamples, outputExamples, exampleIndex, true);
                }
                
                // for each edge(i, j) in A. A is denoted as all the output direct edges in the neural network.
                updateWeightEdges(miniFeatureBatch, 
                                  miniOutputBatch, 
                                  deltaExamples, 
                                  outputExamples, 
                                  alpha, 
                                  regularizationLambda);
                
                // Calculate Total Time Spent.
                finalTimeMillisPerIter = clock.millis();
                deltaTimeMillisPerIter = Math.abs(finalTimeMillisPerIter - initialTimeMillisPerIter);
                totalTimeMillis += deltaTimeMillisPerIter;
                
                // End of Iteration
                t++;
            }
            
            // Calculate new cost and a delta cost.
            double oldCost = cost;
            cost = this.cost(trainingFeatureSet, trainingOutputSet, regularizationLambda);
            deltaCost = Math.abs(oldCost - cost);
            
            //*** LOG: print CURRENT EPOCH and ITERATION statistics ***
            if (this.verbosityLevel >= 3) {
                if (e != 0 && e % (EPOCH_PRINT_LOCAL_CONSTANT) == 0 && e < epochLimit - 1) {
                    printModelInfo(trainingFeatureSet, trainingOutputSet, regularizationLambda);
                }
            }
            
            // End of Epoch
            e++;
        }
        
        // Decimal formats for logging purposes
        DecimalFormat df1 = new DecimalFormat("0");
        DecimalFormat df2 = new DecimalFormat("0.0");
        df2.setMaximumFractionDigits(9);
        
        // Calculate average time
        averageTimeMillisPerIter = (double) totalTimeMillis / (double) t;
        
        //*** LOG: print LAST EPOCH and ITERATION statistics ***
        if (this.verbosityLevel >= 3) 
        {
            System.out.print(String.format("    After %6s epochs", e));
            System.out.print(String.format(" (%6s iter.):", t));
            printModelInfo(trainingFeatureSet, trainingOutputSet, regularizationLambda);
        }
        
        //*** LOG: Done with Printing Stats. ***
        if (this.verbosityLevel >= 2) 
        {
            System.out.println("  * Done with fitting!");
            System.out.println(
                    String.format(
                            "    Training took %sms, %d epochs, %d iterations (%sms / iteration)", 
                            df1.format(totalTimeMillis), e, t, df2.format(averageTimeMillisPerIter)));
            System.out.print(String.format("    GD Stop condition: "));
            if ( e >= epochLimit) 
            {
                System.out.println(String.format("Epoch Limit"));
            } 
            else if (cost < COST_LIMIT) 
            {
                System.out.println(String.format("Cost ~= %s", df2.format(cost)));
            } 
            else if (deltaCost < COST_LIMIT) 
            {
                System.out.println(String.format("DeltaCost ~= %s", df2.format(deltaCost)));
            }
            else 
            {
                System.err.println(String.format("WARNING - An unknown stop condition occurred."));
                System.out.println(String.format("    Cost ~= %s", df2.format(cost)));
                System.out.println(String.format("    DeltaCost ~= %s", df2.format(deltaCost)));
            }
        }
    }
    
    /**
     * [Helper Function] Prints the model statistics of cost, loss, and accuracy for the given data sets of features and outputs.
     * @param featureSet - data set with feature values
     * @param outputSet - data set with output values
     * @param regularizationLambda - lambda
     */
    private void printModelInfo(final LinkedHashMapSet<Double> featureSet, 
                                final LinkedHashMapSet<Double> outputSet, 
                                final double regularizationLambda) 
    {
        this.cost(featureSet, outputSet, regularizationLambda);
        System.out.print(String.format(" Cost = %.6f;", cost));
        System.out.print(String.format(" Loss = %.6f;", loss));
        System.out.print(String.format(" Acc = %.4f", this.calculateAccuracy(featureSet, outputSet)));
        System.out.println();
    }
    
    /**
     * [Helper Function] Create Mini Batches.
     * @param trainingFeatureSet - a data set of points with features
     * @param trainingOutputSet - a data set of points with features
     * @param trainingFeatureBatches - list that will store training feature batches
     * @param trainingOutputBatches - list that will store training output batches
     * @param maxBatchSize - maximum batch size
     */
    private void createMiniBatches(final LinkedHashMapSet<Double> trainingFeatureSet,
                                   final LinkedHashMapSet<Double> trainingOutputSet,
                                   final ArrayList<LinkedHashMapSet<Double>> trainingFeatureBatches, 
                                   final ArrayList<LinkedHashMapSet<Double>> trainingOutputBatches, 
                                   final int maxBatchSize) 
    {
        LinkedHashMapSet<Double> trainingFeatureBatch = new LinkedHashMapSet<>();
        LinkedHashMapSet<Double> trainingOutputBatch = new LinkedHashMapSet<>();
        
        int batchCount = 1;
        List<Integer> keys = new ArrayList<>(trainingFeatureSet.keySet());
        
        if (bRandomization) 
        {
            Collections.shuffle(keys);
            for (Object o : keys) {
                // Access keys/values in a random order
                LinkedHashMap<Integer, Double> trainingFeatureMap = trainingFeatureSet.get(o);
                LinkedHashMap<Integer, Double> trainingOutputMap = trainingOutputSet.get(o);
                
                if (batchCount % maxBatchSize == 0) 
                {
                    trainingFeatureBatch.add(trainingFeatureMap);
                    trainingFeatureBatches.add(trainingFeatureBatch);
                    trainingFeatureBatch = new LinkedHashMapSet<>();
                    
                    trainingOutputBatch.add(trainingOutputMap);
                    trainingOutputBatches.add(trainingOutputBatch);
                    trainingOutputBatch = new LinkedHashMapSet<>();
                    
                    batchCount = 0;
                } 
                else 
                {
                    trainingFeatureBatch.add(trainingFeatureMap);
                    trainingOutputBatch.add(trainingOutputMap);
                }
                batchCount++;
            }
            if (!trainingFeatureBatch.isEmpty()) {
                trainingFeatureBatches.add(trainingFeatureBatch);
            }
            if (!trainingOutputBatch.isEmpty()) {
                trainingOutputBatches.add(trainingOutputBatch);
            }
        }
        else 
        {
            for (int i = 0; i < trainingFeatureSet.size(); i++) {
                // Access keys/values in a random order
                LinkedHashMap<Integer, Double> trainingFeatureMap = trainingFeatureSet.get(i);
                LinkedHashMap<Integer, Double> trainingOutputMap = trainingOutputSet.get(i);
                
                if (batchCount % maxBatchSize == 0) 
                {
                    trainingFeatureBatch.add(trainingFeatureMap);
                    trainingFeatureBatches.add(trainingFeatureBatch);
                    trainingFeatureBatch = new LinkedHashMapSet<>();
                    
                    trainingOutputBatch.add(trainingOutputMap);
                    trainingOutputBatches.add(trainingOutputBatch);
                    trainingOutputBatch = new LinkedHashMapSet<>();
                    
                    batchCount = 0;
                } 
                else 
                {
                    trainingFeatureBatch.add(trainingFeatureMap);
                    trainingOutputBatch.add(trainingOutputMap);
                }
                batchCount++;
            }
            if (!trainingFeatureBatch.isEmpty()) {
                trainingFeatureBatches.add(trainingFeatureBatch);
            }
            if (!trainingOutputBatch.isEmpty()) {
                trainingOutputBatches.add(trainingOutputBatch);
            }
        }
    }
    
    /**
     * [Helper Function] Update all all weighted edges.
     * @param featureSet - a data set of points with features
     * @param outputSet - a data set of points with outputs
     * @param deltaExamples - a set of delta examples. (if null, don't store a delta value at exampleIndex)
     * @param outputExamples - a set of output examples. (if null, don't store a delta value at exampleIndex)
     * @param alpha - alpha value for weight updates.
     * @param regularizationLambda - lambda value used for regularization
     */
    private void updateWeightEdges(final LinkedHashMapSet<Double> featureSet, 
                                   final LinkedHashMapSet<Double> outputSet, 
                                   final LinkedHashMap<Integer, LinkedHashMap<String, Double>> deltaExamples, 
                                   final LinkedHashMap<Integer, LinkedHashMap<String, Double>> outputExamples, 
                                   final double alpha, 
                                   final double regularizationLambda) 
    {
        // This outer for loops find all weight directed edge outputs in the Input Layer.
        for (Map.Entry<Integer, Neuron> iSet : this.inputLayer.entrySet()) 
        {
            Neuron iNeuron = iSet.getValue();
            LinkedHashMap<String, Double> iNodeWeights = iNeuron.getOutputWeights();
            for (Map.Entry<String, Double> jSet : iNodeWeights.entrySet()) {
                String edgeLabel = jSet.getKey();
                Double edgeWeightT = jSet.getValue();
                Neuron jNeuron = iNeuron.getOutputEdges().get(edgeLabel);
                
                // Calculate new weight value.
                Double edgeWeightT1 = costPrimeRegularization(iNeuron, 
                                                              jNeuron, 
                                                              deltaExamples, 
                                                              outputExamples, 
                                                              alpha, 
                                                              regularizationLambda, 
                                                              edgeWeightT);
                // Store new weight value.
                iNodeWeights.put(edgeLabel, edgeWeightT1);
            }
        }
        // This outer for loops find all weight directed edge outputs in the Hidden Layers.
        for (Entry<Integer, LinkedHashMap<Integer, Neuron>> hiddenLayer : this.hiddenLayers.entrySet()) 
        {
            for (Map.Entry<Integer, Neuron> iSet : hiddenLayer.getValue().entrySet()) 
            {
                Neuron iNeuron = iSet.getValue();
                LinkedHashMap<String, Double> iNodeWeights = iNeuron.getOutputWeights();
                for (Map.Entry<String, Double> jSet : iNodeWeights.entrySet()) {
                    String edgeLabel = jSet.getKey();
                    Double edgeWeightT = jSet.getValue();
                    Neuron jNeuron = iNeuron.getOutputEdges().get(edgeLabel);
                    
                    // Calculate new weight value.
                    Double edgeWeightT1 = costPrimeRegularization(iNeuron, 
                                                                  jNeuron, 
                                                                  deltaExamples, 
                                                                  outputExamples, 
                                                                  alpha, 
                                                                  regularizationLambda, 
                                                                  edgeWeightT);
                    // Store new weight value.
                    iNodeWeights.put(edgeLabel, edgeWeightT1);
                }
            }
        }
    }
    
    /**
     * Calculates the regularized and partially derived cost. 
     * The cost, or J(w), is the regularized and approximated partially derived value for two neurons i and j.
     * 
     * @param iNeuron - i neuron
     * @param jNeuron - j neuron
     * @param deltaExamples - a set of delta examples. (if null, don't store a delta value at exampleIndex)
     * @param outputExamples - a set of output examples. (if null, don't store a delta value at exampleIndex)
     * @param alpha - alpha value for weight updates.
     * @param regularizationLambda - lambda value used for regularization
     * @param edgeWeightT - weight value at iteration t.
     * @return Returns the regularized cost.
     */
    private double costPrimeRegularization(final Neuron iNeuron, 
                                           final Neuron jNeuron, 
                                           final LinkedHashMap<Integer, LinkedHashMap<String, Double>> deltaExamples, 
                                           final LinkedHashMap<Integer, LinkedHashMap<String, Double>> outputExamples, 
                                           final double alpha, 
                                           final double regularizationLambda, 
                                           final double edgeWeightT) 
    {
        double value = edgeWeightT - costPrime(iNeuron, jNeuron, deltaExamples, outputExamples, alpha);
        value -= (2 * alpha * regularizationLambda * edgeWeightT);
        if (Double.isNaN(value)) {
            value = 0.0;
        }
        return value;
    }
    
    /**
     * Calculates the partially derived cost. 
     * The cost, or J(w), is the approximated partially derived value for two neurons i and j.
     * 
     * @param iNeuron - i neuron
     * @param jNeuron - j neuron
     * @param deltaExamples - a set of delta examples. (if null, don't store a delta value at exampleIndex)
     * @param outputExamples - a set of output examples. (if null, don't store a delta value at exampleIndex)
     * @param alpha - alpha value for weight updates.
     * @return Returns the cost.
     */
    private double costPrime(final Neuron iNeuron,
                             final Neuron jNeuron,
                             final LinkedHashMap<Integer, LinkedHashMap<String, Double>> deltaExamples, 
                             final LinkedHashMap<Integer, LinkedHashMap<String, Double>> outputExamples, 
                             final double alpha) 
    {
        if (deltaExamples.size() == 0) {
            return 0.0;
        }
        
        double value = 0.0;
        for (int exampleIndex = 0; exampleIndex < deltaExamples.size(); exampleIndex++) {
            LinkedHashMap<String, Double> deltaExample = deltaExamples.get(exampleIndex);
            LinkedHashMap<String, Double> outputExample = outputExamples.get(exampleIndex);
            value += deltaExample.get(jNeuron.getLabel()) * outputExample.get(iNeuron.getLabel());
        }
        value /= deltaExamples.size();
        value *= alpha;
        if (Double.isNaN(value)) {
            value = 0.0;
        }
        return value;
    }
    
    /**
     * Calculates the cost over a data set of points.
     * @param outputSet - a data set of points with outputs
     * @param regularizationLambda - lambda value used for regularization
     * @return
     */
    public double cost(final LinkedHashMapSet<Double> featureSet, 
                       final LinkedHashMapSet<Double> outputSet, 
                       final double regularizationLambda) 
    {
        // Calculate Average Loss.
        double cost = averageLoss(featureSet, outputSet);
        
        // Calculate Regularized Term
        double regTerm = 0;
        for (int j = 0; j < this.inputLayer.size(); j++) {
            Neuron nJ = this.inputLayer.get(j);
            LinkedHashMap<String, Double> weights = nJ.getOutputWeights();
            for (Map.Entry<String, Double> wSet : weights.entrySet()) {
                regTerm += wSet.getValue();
            }
        }
        for (int l = 0; l < this.hiddenLayers.size(); l++) {
            LinkedHashMap<Integer, Neuron> layer = this.hiddenLayers.get(l);
            for (int j = 0; j < layer.size(); j++) {
                Neuron nJ = layer.get(j);
                LinkedHashMap<String, Double> weights = nJ.getOutputWeights();
                for (Map.Entry<String, Double> wSet : weights.entrySet()) {
                    regTerm += wSet.getValue();
                }
            }
        }
        cost += regTerm * regularizationLambda;
        
        if (Double.isNaN(cost)) {
            cost = 1.0;
        }
        
        // Store last calculated cost.
        this.cost = cost;
        
        // Return cost.
        return cost;
    }
    
    /**
     * Calculates the average loss over a data set of points.
     * @param outputSet - a data set of points with outputs
     * @param regularizationLambda - lambda value used for regularization
     * @return
     */
    public double averageLoss(final LinkedHashMapSet<Double> featureSet, 
                              final LinkedHashMapSet<Double> outputSet) 
    {
        // Calculate average loss over the set
        double averageLoss = 0.0;
        for (int i = 0; i < outputSet.size(); i++) 
        {
            averageLoss += loss(featureSet.get(i), outputSet.get(i));
        }
        averageLoss /= outputSet.size();
        
        if (Double.isNaN(averageLoss)) {
            averageLoss = 1.0;
        }
        
        // Store last calculated loss.
        this.loss = averageLoss;
        
        // Return loss.
        return averageLoss;
    }
    
    /**
     * Calculates the loss for a given single data point. (K is the size of the data point for outputs)
     * @param features - a single data point with features
     * @param outputs - a single data point with outputs
     * @return Returns the loss.
     */
    public double loss(final LinkedHashMap<Integer, Double> features, 
                       final LinkedHashMap<Integer, Double> outputs) 
    {
        // Calculate h_(x) using forward propagation for the data point.
        forwardPropagate(features, null, 0, false);
        
        // Calculate the loss for K distinct classes using.
        double sum = 0.0;
        for (Map.Entry<Integer, Double> set : outputs.entrySet()) {
            Integer k = set.getKey();
            Double y = set.getValue();
            double hx = this.outputLayer.get(k).getOutput();
            sum += loss(y, hx);
        }
        return sum;
    }
    
    /**
     * Calculate the squared loss value.
     * @param actual - the actual value
     * @param predicted - the predicted value
     * @return Returns the squared loss value.
     */
    private double loss(final double actual, final double predicted) {
        return Math.pow(actual - predicted, 2);
    }
    
    /**
     * Calculate the partially derived squared loss value.
     * @param actual - the actual value
     * @param predicted - the predicted value
     * @return Returns partially derived squared loss value.
     */
    private double lossPrime(final double actual, final double predicted) {
        return -2 * (actual - predicted);
    }
    
    /**
     * Do forward propagation on this neural network for a single given data point.
     * @param features - a single data point with features
     * @param outputExamples - a set of output examples. (if null, don't store an output value at exampleIndex)
     * @param exampleIndex - the index to store the delta and output in the set of delta and output examples.
     * @param bShowVerbose - if true, show logging information.
     */
    private void forwardPropagate(final LinkedHashMap<Integer, Double> features, 
                                  final LinkedHashMap<Integer, LinkedHashMap<String, Double>> outputExamples, 
                                  final int exampleIndex, 
                                  final boolean bShowVerbose) 
    {
        if (bShowVerbose && this.verbosityLevel >= 4) 
        {
            System.out.print(String.format("    * Forward Propagation on example %d", ++exampleCounter));
            System.out.println();
        }
        
        // Create links to nodes for output values. (String = Node.getLabel(), Double = output value).
        LinkedHashMap<String, Double> nodes = null;
        if (null != outputExamples) {
            nodes = new LinkedHashMap<>();
            outputExamples.put(exampleIndex, nodes);
        }
        
        // Forward Propagate Input Layer (includes bias neuron)
        if (bShowVerbose && this.verbosityLevel >= 4) 
        {
            System.out.print(String.format("      Layer %d (input) :     a_j:%7.3f", 1, this.biasNeuron.getOutput()));
        }
        
        for (int j = 0; j < inputLayer.size(); j++) 
        {
            Neuron jN = inputLayer.get(j);
            Double dataValue = features.get(j);
            
            // Set a_j
            jN.setOutput(dataValue);
            
            if (null != outputExamples) {
                nodes.put(jN.getLabel(), jN.getOutput());
            }
            if (bShowVerbose && this.verbosityLevel >= 4) 
            {
                System.out.print(String.format("%7.3f", jN.getOutput()));
                if (j == inputLayer.size() - 1) {
                    System.out.println();
                }
            }
        }
        
        // Forward Propagate Hidden Layers
        for (int l = 0; l < hiddenLayers.size(); l++) 
        {
            LinkedHashMap<Integer, Neuron> layer = hiddenLayers.get(l);
            
            if (bShowVerbose && this.verbosityLevel >= 4) 
            {
                System.out.print(String.format("      Layer %d (hidden):    in_j:", l + 2));
            }
            
            for (int j = 0; j < layer.size(); j++) 
            {
                Neuron jN = layer.get(j);
                
                LinkedHashMap<String, Neuron> inputEdges = jN.getInputEdges();
                double sum = 0.0;
                for (Map.Entry<String, Neuron> set : inputEdges.entrySet()) 
                {
                    Neuron iN = set.getValue();
                    sum += iN.getOutputWeightAt(jN.getLabel()) * iN.getOutput();
                }
                
                // Set in_j
                jN.setInput(sum);
                
                // Set a_j
                double output = jN.calcOutput();
                
                if (null != outputExamples) {
                    nodes.put(jN.getLabel(), output);
                }
                if (bShowVerbose && this.verbosityLevel >= 4) 
                {
                    System.out.print(String.format("%7.3f", jN.getInput()));
                    if (j == layer.size() - 1) {
                        System.out.println();
                    }
                }
            }
            
            if (bShowVerbose && this.verbosityLevel >= 4) 
            {
                System.out.print(String.format("                      :     a_j:", l + 2));
            }
            
            for (int j = 0; j < layer.size(); j++) 
            {
                Neuron jN = layer.get(j);
                
                if (bShowVerbose && this.verbosityLevel >= 4) 
                {
                    System.out.print(String.format("%7.3f", jN.getOutput()));
                    if (j == layer.size() - 1) {
                        System.out.println();
                    }
                }
            }
        }
        
        // Forward Propagate Output Layer Neurons
        if (bShowVerbose && this.verbosityLevel >= 4) 
        {
            System.out.print(String.format("      Layer %d (output):    in_j:", this.hiddenLayers.size() + 2));
        }
        
        for (int j = 0; j < outputLayer.size(); j++) 
        {
            Neuron jN = outputLayer.get(j);
            
            LinkedHashMap<String, Neuron> inputEdges = jN.getInputEdges();
            double sum = 0.0;
            for (Map.Entry<String, Neuron> set : inputEdges.entrySet()) 
            {
                Neuron iN = set.getValue();
                sum += iN.getOutputWeightAt(jN.getLabel()) * iN.getOutput();
            }
            
            // Set in_j
            jN.setInput(sum);
            
            // Set a_j
            double output = jN.calcOutput();
            
            if (null != outputExamples) {
                nodes.put(jN.getLabel(), output);
            }
            if (bShowVerbose && this.verbosityLevel >= 4) 
            {
                System.out.print(String.format("%7.3f", jN.getInput()));
                if (j == outputLayer.size() - 1) {
                    System.out.println();
                }
            }
        }
        
        if (bShowVerbose && this.verbosityLevel >= 4) 
        {
            System.out.print(String.format("                            a_j:", this.hiddenLayers.size() + 2));
        }
        
        for (int j = 0; j < outputLayer.size(); j++) 
        {
            Neuron jN = outputLayer.get(j);
            
            if (bShowVerbose && this.verbosityLevel >= 4) 
            {
                System.out.print(String.format("%7.3f", jN.getOutput()));
                if (j == outputLayer.size() - 1) {
                    System.out.println();
                }
            }
        }
    }
    
    /**
     * Do backpropagation on this neural network for a single given data point.
     * @param features - a single data point with features
     * @param outputs - a single data point with outputs
     * @param deltaExamples - a set of delta examples. (if null, don't store a delta value at exampleIndex)
     * @param outputExamples - a set of output examples. (if null, don't store an output value at exampleIndex)
     * @param exampleIndex - the index to store the delta and output in the set of delta and output examples.
     * @param bShowVerbose - if true, show logging information.
     */
    private void backPropagate(final LinkedHashMap<Integer, Double> features, 
                               final LinkedHashMap<Integer, Double> outputs, 
                               final LinkedHashMap<Integer, LinkedHashMap<String, Double>> deltaExamples, 
                               final LinkedHashMap<Integer, LinkedHashMap<String, Double>> outputExamples, 
                               final int exampleIndex, 
                               final boolean bShowVerbose) 
    {
        //=== Forward Propagation ===
        forwardPropagate(features, outputExamples, exampleIndex, bShowVerbose);
        
        //=== Backpropagation ===
        if (bShowVerbose && this.verbosityLevel >= 4) 
        {
            System.out.print(String.format("    * Backward Propagation on example %d", exampleCounter));
            System.out.println();
        }
        
        // Create links to nodes for delta values. (String = Node.getLabel(), Double = delta value).
        LinkedHashMap<String, Double> nodes = null;
        if (null != deltaExamples) {
            nodes = new LinkedHashMap<>();
            deltaExamples.put(exampleIndex, nodes);
        }
        
        // Back Propagate Output Layer
        if (bShowVerbose && this.verbosityLevel >= 4) 
        {
            System.out.print(String.format("      Layer %d (output): Delta_j:", this.hiddenLayers.size() + 2));
        }
        for (int j = 0; j < outputLayer.size(); j++) 
        {
            Neuron jN = outputLayer.get(j);
            
            // Get actual value, y, for a Class Output at j or at K.
            double y = outputs.get(j);
            
            double delta = jN.getActivationFunction().gPrime1(jN.getInput());
            delta *= lossPrime(y, jN.getOutput());
            
            // Set delta_j
            jN.setDelta(delta);
            
            if (null != deltaExamples) {
                nodes.put(jN.getLabel(), jN.getDelta());
            }
            if (bShowVerbose && this.verbosityLevel >= 4) 
            {
                System.out.print(String.format("%7.3f", jN.getDelta()));
                if (j == outputLayer.size() - 1) {
                    System.out.println();
                }
            }
        }
        
        // Back Propagate Hidden Layers
        for (int l = hiddenLayers.size() - 1; l >= 0; l--) 
        {
            LinkedHashMap<Integer, Neuron> layer = hiddenLayers.get(l);
            if (bShowVerbose && this.verbosityLevel >= 4) 
            {
                System.out.print(String.format("      Layer %d (output): Delta_j:", l + 2));
            }
            
            for (int j = 0; j < layer.size(); j++) 
            {
                Neuron jN = layer.get(j);
                
                LinkedHashMap<String, Neuron> outputEdges = jN.getOutputEdges();
                double sum = 0.0;
                for (Map.Entry<String, Neuron> set : outputEdges.entrySet()) 
                {
                    String jN2Label = set.getKey();
                    Neuron jN2 = set.getValue();
                    sum += jN.getOutputWeightAt(jN2Label) * jN2.getDelta();
                }
                
                double delta = jN.getActivationFunction().gPrime1(jN.getInput()) * sum;
                
                // Set delta_j
                jN.setDelta(delta);
                
                if (null != deltaExamples) {
                    nodes.put(jN.getLabel(), jN.getDelta());
                }
                if (bShowVerbose && this.verbosityLevel >= 4) 
                {
                    System.out.print(String.format("%7.3f", jN.getDelta()));
                    if (j == layer.size() - 1) {
                        System.out.println();
                    }
                }
            }
        }
        
        if (bShowVerbose && this.verbosityLevel >= 4) 
        {
            System.out.print(String.format("             example's actual y:", this.hiddenLayers.size() + 2));
        }
        for (int j = 0; j < outputs.size(); j++) 
        {
            Double jValue = outputs.get(j);
            
            if (bShowVerbose && this.verbosityLevel >= 4) 
            {
                System.out.print(String.format("%7.3f", jValue));
                if (j == outputLayer.size() - 1) {
                    System.out.println();
                }
            }
        }
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("Network Size       : %s\r\n", this.networkSize));
        sb.append(String.format("Bias Neuron        : %s\r\n", this.biasNeuron));
        sb.append(String.format("InputLayer         : %s\r\n", this.inputLayer));
        for (Map.Entry<Integer, LinkedHashMap<Integer, Neuron>> set: this.hiddenLayers.entrySet()) 
        {
            Integer l = set.getKey();
            LinkedHashMap<Integer, Neuron> layer = set.getValue();
            sb.append(String.format(
                                "HiddenLayer %-4d   : %s\r\n", l + 1, layer));
        }
        sb.append(String.format("OutputLayer        : %s\r\n", this.outputLayer));
        sb.append(String.format("ActivationFunction : %s\r\n", this.activationFunction));
        return sb.toString();
    }
}
