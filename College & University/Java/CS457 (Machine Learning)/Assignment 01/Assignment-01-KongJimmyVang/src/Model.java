import java.text.DecimalFormat;
import java.time.Clock;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
import java.util.Map.Entry;

/**
 * Project Name:    Assignment 1        <br>
 * File Name:       Model.java          <br>
 * Description:     This Model Class implements Multiple Linear Regression and Polynomial Regression 
 *      (excluding interaction terms). The training and fitting function is Mini-Batch Gradient Descent. </b></b>
 * 
 * Date Created:    9/26/22             <br>
 * Date Modified:   9/30/22             <br>
 * Class:           CS457 (Fall 2022)   <br>
 * 
 * @author Kong Jimmy Vang
 */
public class Model {
    
    /** Determines when to print during batch gradient descent */
    final private int EPOCH_PRINT_CONSTANT = 1000;
    
    /** Determines the stopping condition for the cost and delta cost. */
    final private double COST_LIMIT = Math.pow(10, -10);
    
    private HashMap<Integer, Double> weights;
    private HashMap<Integer, Double> inputs;
    private int originalInputs;
    private int numOfInputs;
    private int degree;
    private double trainingCost;
    
    /**
     * Creates a Multiple Linear Regression and Polynomial Regression model that 
     *      supports only Augmented Data Sets.
     * @param numOfInputs - number of inputs (attributes)
     * @param degree - polynomial degree
     */
    public Model(final int numOfInputs, final int degree) {
        this.weights = new HashMap<>();
        this.inputs = new HashMap<>();
        
        this.originalInputs = numOfInputs;
        this.numOfInputs = numOfInputs;
        this.degree = degree;
    }
    
    /**
     * Initialize the weights of this model to 0.0 for all weights.
     */
    private void initializeWeights() {
        weights.put(0, 0.0);
        for (int j = 1; j < numOfInputs; j++) 
        {
            weights.put(j, 0.0);
        }
    }
    
    /**
     * Randomize the weights of this model from -1.0 to 1.0 inclusive.
     */
    protected void randomizeWeights() {
        Random r = new Random();
        
        weights.put(0, (r.nextDouble() * 2.0) - 1.0);
        for (int j = 1; j < numOfInputs; j++) 
        {
            weights.put(j, (r.nextDouble() * 2.0) - 1.0);
        }
    }
    
    /**
     * Set the weights of this model using an List up to the list size.
     *      The list must be >= the this object's 'numOfInputs' size.
     * @param weights - list of weights
     */
    protected void setWeights(final ArrayList<Double> weights) {
        for (int j = 0; j < numOfInputs; j++) 
        {
            this.weights.put(j, weights.get(j));
        }
    }
    
    /**
     * Gets the weights associated with this model.
     * @return Returns a list of weights associated with this model.
     */
    protected ArrayList<Double> getWeights() {
        ArrayList<Double> weights = new ArrayList<>();
        
        Iterator<Entry<Integer, Double>> it = this.weights.entrySet().iterator();
        while ( it.hasNext() ) 
        {
            Entry<Integer, Double> entry = it.next();
            weights.add(entry.getValue());
        }
        return weights;
    }
    
    /**
     * Sets the inputs (attributes) according to a list of attributes.
     *      This list must be Augmented.
     * @param attributes - a list of augmented attributes
     */
    protected void setInputs(final ArrayList<Double> attributes) {
        inputs.put(0, 1.0);
        for (int j = 1; j < numOfInputs; j++) 
        {
            inputs.put(j, attributes.get(j));
        }
    }
    
    /**
     * Gets the augmented inputs (attributes) currently stored in this model.
     * @return Returns a list of the current augmented inputs (attributes).
     */
    protected ArrayList<Double> getInputs() {
        ArrayList<Double> inputs = new ArrayList<>();;
        
        Iterator<Entry<Integer, Double>> it = this.inputs.entrySet().iterator();
        while ( it.hasNext() ) 
        {
            Entry<Integer, Double> entry = it.next();
            inputs.add(entry.getValue());
        }
        return inputs;
    }
    
    /**
     * Sets the total number of augmented inputs (attributes) for this model.
     * @param numOfInputs - number of inputs (attributes)
     */
    protected void setNumOfInputs(final int numOfInputs) {
        this.numOfInputs = numOfInputs;
    }
    
    /**
     * Gets the total number of augmented inputs (attributes) from this model.
     * @return Returns the total number of inputs (attributes) from this model.
     */
    protected int getNumOfInputs() {
        return this.numOfInputs;
    }
    
    /**
     * Sets the original number of non-augmented inputs (attributes) for this model.
     * @param numOfInputs - number of inputs (attributes)
     */
    protected void setOriginalInputs(final int originalInputs) {
        this.originalInputs = originalInputs;
    }
    
    /**
     * Gets the original number of non-augmented inputs (attributes) from this model.
     * @return Returns the total number of inputs (attributes) from this model.
     */
    protected int getOriginalInputs() {
        return this.originalInputs;
    }
    
    /**
     * Sets the polynomial degree of this model.
     * @param degree - polynomial degree
     */
    protected void setDegree(final int degree) {
        this.degree = degree;
    }
    
    /**
     * 
     * Gets the polynomial degree of this model.
     * @return Returns the polynomial degree of this model.
     */
    protected int getDegree() {
        return this.degree;
    }
    
    /**
     * Gets the training cost recently calculated by this model's gradient descent method.
     * @return Returns the training cost recently calculated by this model's gradient descent method.
     */
    public double getTrainingCost() {
        return this.trainingCost;
    }
    
    /**
     * Returns the absolute error.
     * @param output - actual output
     * @param predictedOutput - predicted output
     * @return Returns the absolute error.
     */
    protected double getAbsoluteError(final double output, final double predictedOutput) {
        double error = Math.abs(output - predictedOutput);
        return error;
    }
    
    /**
     * Returns the squared error.
     * @param output - actual output
     * @param predictedOutput - predicted output
     * @return Returns the squared error.
     */
    protected double getSquaredError(final double output, final double predictedOutput) {
        double error = Math.pow(output - predictedOutput, 2);
        return error;
    }
    
    /**
     * Returns the loss that this model predicts by applying it's current weights to a give set of data.
     * @param data - a list of data points.
     * @return Returns the loss that this model predicts by applying it's current weights to a list of data points.
     */
    public double getLoss(ArrayList<Double> data) {
        return getSquaredError(data.get(data.size() - 1), calcHypothesisFunction(data));
    }
    
    /**
     * Determine the cost by applying the weights of this model to a set of data.
     * @param dataSet - set of data.
     * @return Returns the cost.
     */
    public double getCost(final DataSet<Double> dataSet) {
        double cost = 0;
        for (int i = 0; i < dataSet.size(); i++) 
        {
            cost += getLoss(dataSet.get(i));
        }
        cost /= (double) dataSet.size();
        return Math.abs(cost);
    }
    
    /**
     * Determine the validation error by applying the weights of this model to a set of data.
     * @param dataSet - set of data.
     * @return Returns the validation error.
     */
    public double getValidationError(final DataSet<Double> dataSet) {
        return getCost(dataSet);
    }
    
    /**
     * Apply the hypothesis function of this model to a list of data points.
     * @param data - list of data points
     * @return Returns the function's predicted output.
     */
    public double calcHypothesisFunction(ArrayList<Double> data) 
    {
        double hx = 0;
        for (int j = 0; j < numOfInputs; j++) 
        {
            hx += weights.get(j) * data.get(j);
        }
        return hx;
    }
    
    /**
     * Train this model on Mini-Batch Gradient Descent to fit a line (d <= 1) 
     *      or curve (d > 1) to this model. <br><br>
     * 
     * Trains like Stochastic Gradient Descent if "batchSize" is equal to 1. <br>
     * Trains like Full Batch Gradient Descent if "batchSize" is equal to 0
     *      or if "batchSize" is equal to the size of the "trainingDataSet".
     * 
     * @param trainingDataSet - training data set
     * @param alpha - alpha
     * @param batchSize - batch size
     * @param epochLimit - epoch limit
     */
    public void miniBatchGradientDescent(final DataSet<Double> trainingDataSet, 
                                         final double alpha, 
                                         int batchSize, 
                                         final int epochLimit) 
    {
        // Guard Clauses
        if (batchSize <= 0) {
            // if batchSize is non-positive, do full batch gradient descent on full training data set.
            batchSize = trainingDataSet.size();
        }
        
        //*** LOG ***
        if (Driver.verbosityLevel >= 3) {
            System.out.println("    * Beginning mini-batch gradient descent");
            System.out.println(
                    String.format("      (alpha=%f, epochLimit=%d, batchSize=%d", alpha, epochLimit, batchSize));
        }
        
        // Initialize Weights
        initializeWeights();
        
        // Initialize Counter Variables
        int t = 0; // current iteration
        int e = 0; // current epoch
        
        // Initialize Cost Variables
        double cost = Double.MAX_VALUE;
        double deltaCost = Double.MAX_VALUE;
        
        // Initialize Logging Variables
        Clock clock = Clock.systemDefaultZone();
        long initialTimeMillisPerIter = 0;
        long finalTimeMillisPerIter = 0;
        long deltaTimeMillisPerIter = 0;
        double averageTimeMillisPerIter = 0;
        long totalTimeMillis = 0;
        
        // Perform mini-batch gradient descent.
        while ( e < epochLimit && cost >= COST_LIMIT && deltaCost >= COST_LIMIT ) 
        {
            //*** LOG ***
            if (e % EPOCH_PRINT_CONSTANT == 0 && e < epochLimit - 1) {
                if (Driver.verbosityLevel >= 3) {
                    System.out.print(String.format("      Epoch %6s", e));
                    System.out.print(String.format(" (iter %6s):", t));
                }
            }
            
            //*** LOG ***
            if (e % EPOCH_PRINT_CONSTANT == 0 && e < epochLimit - 1) {
                if (Driver.verbosityLevel >= 3) {
                    cost = this.getCost(trainingDataSet);
                    System.out.print(String.format(" Cost = %18.12f;", cost));
                    if (Driver.verbosityLevel >= 4)
                        System.out.print(String.format("    %s", this.toString()));
                    System.out.println();
                }
            }
            
            //***
            /* Divide {1, 2, . . . , n} into random mini-batches of m data points each
             *  If m does not evenly divide n, then the last mini-batch should have size n mod m */
            ArrayList<DataSet<Double>> dataSetBatches = new ArrayList<>();
            DataSet<Double> dataSetBatch = new DataSet<>();
            
            // SHUFFLE FOR BATCH
            Collections.shuffle(trainingDataSet);
            
            int batchCount = 1;
            for (int i = 0; i < trainingDataSet.size(); i++) 
            {
                if (batchCount % batchSize == 0) {
                    dataSetBatch.add(trainingDataSet.get(i));
                    dataSetBatches.add(dataSetBatch);
                    dataSetBatch = new DataSet<>();
                    batchCount = 0;
                } else {
                    dataSetBatch.add(trainingDataSet.get(i));
                }
                batchCount++;
            }
            if (!dataSetBatch.isEmpty()) {
                dataSetBatches.add(dataSetBatch);
            }
            
            //*** DEBUG: Showing Batches. ***
            /*int debugCount = 0;
            System.out.println("\r\nDEBUG: Showing Batches");
            for (DataSet<Double> batch : dataSetBatches) {
                System.out.print(String.format("Batch %d: ", debugCount));
                System.out.println(batch);
                debugCount++;
            } //*/
            
            int p = this.numOfInputs;
            for (DataSet<Double> miniBatch : dataSetBatches) 
            {
                initialTimeMillisPerIter = clock.millis();
                
                double error = 0;
                for (int k = 0; k < p; k++) 
                {
                    double sumI = 0;
                    for (int i = 0; i < miniBatch.size(); i++) 
                    {
                        double sumJ = 0;
                        for (int j = 0; j < p; j++) 
                        {
                            //System.out.println(String.format("%d, %d, %d, %f, %f, %f, %f", k, i, j, sumI, sumJ, this.weights.get(j), this.weights.get(k)));
                            sumJ += this.weights.get(j) * miniBatch.get(i).get(j);
                        }
                        sumJ = miniBatch.getOutputAt(i) - sumJ;
                        sumI += -2 * miniBatch.get(i).get(k) * sumJ;
                    }
                    error = (1.0 / Math.abs(miniBatch.size())) * sumI;
                    double weightUpdate = this.weights.get(k) - alpha * error;
                    this.weights.put(k, weightUpdate);
                }
                // Get final time.
                finalTimeMillisPerIter = clock.millis();
                deltaTimeMillisPerIter = Math.abs(finalTimeMillisPerIter - initialTimeMillisPerIter);
                totalTimeMillis += deltaTimeMillisPerIter;
                
                // Calculate cost and delta cost.
                double oldCost = cost;
                cost = Math.abs(error);
                deltaCost = Math.abs(oldCost - cost);
                
                t++;
            }
            e++;
        }
        
        // More LOG variables
        DecimalFormat df1 = new DecimalFormat("0");
        DecimalFormat df2 = new DecimalFormat("0.0");
        df2.setMaximumFractionDigits(15);
        
        // Calculate average time
        averageTimeMillisPerIter = (double) totalTimeMillis / (double) t;
        
        //*** LOG ***
        if (Driver.verbosityLevel >= 3) 
        {
            System.out.print(String.format("      Epoch %6s (iter %6s):", e, t));
            System.out.print(String.format(" Cost = %18.12f;", this.getCost(trainingDataSet)));
            if (Driver.verbosityLevel >= 4)
                System.out.print(String.format("    %s", this.toString()));
            System.out.println();
            System.out.println("    * Done with fitting!");
        }
        if (Driver.verbosityLevel >= 2) 
        {
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
            System.out.println(String.format("    %s", this.toString()));
        }
        
        this.trainingCost = getCost(trainingDataSet);
        //--- END OF FUNCTION ---
    }
    
    /**
     * Returns a text representation of this model with it's current weights shown.
     */
    public String toString() 
    {
        String strModel = "Model: ";
        strModel += "Y = ";
        strModel += String.format("%#.4f", weights.get(0));
        
        int xI = 1;
        int degree = 1;
        for (int weightI = 1; weightI < numOfInputs; weightI++) 
        {
            if (xI > originalInputs) {
                xI = 1;
                degree++;
            }
            if (degree <= 1) 
            {
                strModel += String.format(" + %#.4f", weights.get(weightI));
                strModel += String.format(" X%d", xI);
            } 
            else 
            {
                strModel += String.format(" + %#.4f", weights.get(weightI));
                strModel += String.format(" X%d^%d", xI, degree);
            }
            xI++;
        }
        return strModel;
    }
}
