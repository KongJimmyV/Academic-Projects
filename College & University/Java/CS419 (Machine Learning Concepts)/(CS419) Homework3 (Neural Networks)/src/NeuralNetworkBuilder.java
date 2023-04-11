//////////////////////////////////////////////////////
// File Name:   NeuralNetworkBuilder.java
// Author:      Kong Jimmy Vang
// Date:        10/31/2018
// 

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;
import java.util.Vector;

/**
 * Builds a neural network. Can save and load neural networks. <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class NeuralNetworkBuilder {
    
    // *** Field/Instance Variables ***
    /** Scanner for user input. */
    private static Scanner sUser = new Scanner(System.in);
    
    /** The resolution of the data. */
    private static int resolutionOfData;
    
    /** The number of hidden layers for creating a neural network. */
    private static int numOfHiddenLayers;
    
    /** The set/list that holds the amount of neurons in each layer. */
    private static ArrayList<Integer> sizesOfHiddenLayers;
    
    
    /** The number of features. */
    private static int numOfFeatures;
    
    /** The number of outputs. */
    private static int numOfOutputs;
    
    // *** Main ***
    /** MAIN */
    public static void main(final String[] args) {
        try {
            
            while (true) {
                
                // Give the available options for the program to the user.
                System.out.print("\nEnter L to load trained network, T to train a new one, Q to quit: ");
                String uInput = sUser.nextLine();
                System.out.println();
                
                if ("L".equalsIgnoreCase(uInput)) {
                    // Load a previously trained network.
                    NeuralNetwork network = loadNetwork();
                    
                    if (network != null)
                        testNetwork(network); // Test network.
                    
                } else if ("T".equalsIgnoreCase(uInput)) {
                    // Train a new network.
                    NeuralNetwork network = trainNewNetwork();
                    
                    testNetwork(network); // Test network.
                    saveNetwork(network); // Ask if the user would like to save the network.
                    
                } else if ("Q".equalsIgnoreCase(uInput)) 
                    // Quit the program.
                    break;
                else {
                    System.out.println("\n\n*** Warning: Invalid Input. Please try again. ***");
                }
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        System.out.println("Goodbye.");
    }
    
    /** 
     * Asks the user to input training parameters. <br>
     * Then, trains a new network on a given set of image data. <br>
     * Afterwards, a newly trained network is returned. <br><br>
     * 
     * Trained using back-propagation.
     * 
     * @return A neural network trained by back-propagation.
     * @throws FileNotFoundException - Throws this, if the image set file for training doesn't exist.
     */
    private static NeuralNetwork trainNewNetwork() throws FileNotFoundException {
        
        //*** Ask for Resolution of Data. ***
        boolean isInvalid = false;
        do {
            System.out.print("Resolution of data (5/10/15/20): ");
            resolutionOfData = Integer.parseInt(sUser.nextLine());
            
            isInvalid = resolutionOfData % 5 != 0 || resolutionOfData < 5 || resolutionOfData > 20;
            if (isInvalid) {
                System.out.println("\n\n*** Warning: Invalid Resolution of data. "
                        + "Must choose a resolution of 5, 10, 15, or 20. "
                        + "Please try again. ***");
            }
        } while (isInvalid);
        
        //*** Ask for Number of Hidden Layers. ***
        do {
            System.out.print("Number of hidden layers: ");
            numOfHiddenLayers = Integer.parseInt(sUser.nextLine());
            
            if (numOfHiddenLayers < 0) {
                System.out.println("\n\n*** Warning: Invalid Response. "
                        + "The number of Hidden Layers must be >= 0, (must be a non-negative number). ***");
            }
        } while (numOfHiddenLayers < 0);
        
        sizesOfHiddenLayers = new ArrayList<>(numOfHiddenLayers);
        if (numOfHiddenLayers >= 1) {
            for (int i = 0; i < numOfHiddenLayers; i++) {
                System.out.print("Size of hidden layer " + (i+1) + ": ");
                sizesOfHiddenLayers.add(sUser.nextInt());
            }
        }
        
        //*** Initialize the network. ***
        System.out.println();
        System.out.println("Initializing network...");
        
        /* 
         * Read from the corresponding training set file.
         *
         *      Files consist of single lines, each containing
         *      a vector of features, and a vector of output values.
         *      Features have been extracted from images of characters.
         *      Output vectors have a single 1, indicating the character,
         *      in order: 'C' 'A' 'M' 'F' '0' '1' '2' '3' '4' '5' '6' '7' '8' '9' 
         */
        DecimalFormat df = new DecimalFormat("00");
        String trainSet = "trainSet_" + df.format(resolutionOfData) + ".dat";
        Path trainSetPath = Paths.get("trainSet_data", trainSet);
        
        boolean directoryExists = false;
        directoryExists = Files.exists(trainSetPath);
        if (!directoryExists) {
            System.out.println();
            System.out.println("*** Warning: That file does not exist. An exception may occur! ***");
        }
        
        // Put the training examples into a set or list.
        ArrayList< ArrayList<Vector<Double>> > examples = new ArrayList<>();
        
        Scanner fScan = new Scanner(trainSetPath.toFile());
        while (fScan.hasNextLine()) {
            
            // Get the current line in "trainSet_##.dat".
            String line = fScan.nextLine().trim();
            
            // A parser which ignore lines that contain comments.
            if (line.contains("#")) {
                continue;
            }
            
            // Parse this character '(' in the particular data set.
            //      This calculates the splitting index, which is helpful to split the features and outputs later.
            int splittingIndex = 0;
            for (int i = line.length() - 1; i >= 0; i--) {
                if (line.charAt(i) == '(') {
                    break;
                }
                splittingIndex++;
            }
            
            // Split the features and outputs into two vectors.
            String sFeatures = line.substring(1, line.length() - (splittingIndex + 3));
            String sOutputs = line.substring(line.length() - splittingIndex, line.length() - 1);
            String[] sFeaturesSplit = sFeatures.split(" ");
            String[] sOutputsSplit = sOutputs.split(" ");
            
            Vector<Double> v1 = new Vector<>();
            for (int i = 0; i < sFeaturesSplit.length; i++) {
                
                // NORMALIZE THE FEATURES FOR GRAYSCALE OR RAW PIXEL DATA.
                // Only if the feature is not yet normalized between "0.0" and "1.0".
                double normalizedFeature = Double.parseDouble(sFeaturesSplit[i]);
                if (normalizedFeature > 1.0) {
                    normalizedFeature = normalizedFeature / 255.0;
                }
                v1.add(normalizedFeature);
            }
            Vector<Double> v2 = new Vector<>();
            for (int i = 0; i < sOutputsSplit.length; i++) {
                v2.add(Double.parseDouble(sOutputsSplit[i]));
            }
            
            // Add these vectors to a set/list of examples.
            ArrayList<Vector<Double>> example = new ArrayList<>();
            example.add(v1);
            example.add(v2);
            examples.add(example);
        }
        fScan.close();
        
        // Get the number of features and outputs, helpful in building the neural network.
        ArrayList<Vector<Double>> example = examples.get(0);
        numOfFeatures = example.get(0).size();
        numOfOutputs = example.get(1).size();
        
        //*** Build fully connected neural network. ***
        NeuralNetwork network = new NeuralNetwork(numOfFeatures, numOfHiddenLayers, sizesOfHiddenLayers, numOfOutputs);
        
        //*** Train the built neural network on the set of examples. ***
        System.out.println("Training on " + trainSet + "...");
        backPropLearning(examples, network);
        
        return network;
    }
    
    /** 
     * Performs back-propagation on a set of {@code examples}.
     * Returns a new neural network after learning.
     * 
     * @param examples - A set of examples. Each example in the set contains 2 vectors, the input and the output vectors.
     * @param network - A network to perform back-propagation on using the given set of examples.
     * @return Returns a new neural network that has back-propagation learning performed on it.
     */
    private static NeuralNetwork backPropLearning(
            final ArrayList< ArrayList<Vector<Double>> > examples,
            final NeuralNetwork network) {
        
        // Local Variables
        //Vector<Double> delta = new Vector<>();
        double maximumError = 0;
        
        // Randomize each weight in the network.
        network.randomizeWeights();
        
        // Repeat
        int trainingIterations = 0;
        do {
            // SHUFFLE the examples list.
            Collections.shuffle(examples);
            
            // RESET the current max error and FIND a new max error.
            maximumError = 0;
            for (int e = 0; e < examples.size(); e++) {
                
                // Extract the example at index e.
                ArrayList<Vector<Double>> example = examples.get(e);
                
                /* Propagate the inputs forwards to compute the outputs */
                ArrayList<Neuron> neurons = network.getInputLayer().neurons;
                for (int i = 0; i < neurons.size(); i++) {
                    Vector<Double> features = example.get(0);
                    neurons.get(i).output = features.get(i); // Apply the feature, x_i, to the output, a_i.
                }
                for (int l = 1; l < network.layers.size(); l++) {
                    neurons = network.layers.get(l).neurons;
                    for (int j = 0; j < neurons.size(); j++) {
                        neurons.get(j).calculateInput();  // Calculate in_j
                        neurons.get(j).calculateOutput(); // Calculate a_j.
                    }
                }
                
                /* Propagate deltas backward from output layer to input layer */
                //// Calculate all output neuron delta errors.
                neurons = network.getOutputLayer().neurons;
                for (int j = 0; j < neurons.size(); j++) {
                    // example      outputs     output at index j
                    // example      .get(1)     .get(j);
                    int expectedOutput = (int) Math.round(example.get(1).get(j));
                    neurons.get(j).deltaError = SimpleMath.sigmoidDerivative(neurons.get(j).input) * neurons.get(j).calculateError( expectedOutput );
                }
                
                //// Propagate delta errors from the highest hidden layer to the input layer.
                for (int layerIndex = (network.layers.size() - 1) - 1; 
                        layerIndex >= 0; layerIndex--) {
                    
                    neurons = network.layers.get(layerIndex).neurons;
                    for (int i = 0; i < neurons.size(); i++) {
                        
                        Layer nextLayer = network.layers.get(layerIndex + 1);
                        
                        // Get Sum of the (weights i_j * delta_errors[j]).
                        double sum = 0;
                        for (int j = 0; j < nextLayer.neurons.size(); j++) {
                            // sum += w_i_j * delta_error[j]
                            sum += nextLayer.neurons.get(j).inputWeights.get(i) * nextLayer.neurons.get(j).deltaError;
                        }
                        
                        // Calculate final value of delta[i].
                        neurons.get(i).deltaError = SimpleMath.sigmoidDerivative(neurons.get(i).input) * sum;
                    }
                }
                
                /* Update every weight in network using deltas */
                for (int layerIndex = network.layers.size() - 1; layerIndex >= 1; layerIndex--) {
                    for (int j = 0; j < network.layers.get(layerIndex).neurons.size(); j++) {
                        for (int i = 0; i < network.layers.get(layerIndex).neurons.get(j).inputWeights.size(); i++) { 
                            
                            // QUICK NOTES:
                            //  layerIndex = Index of the current layer we are at.
                            //  j = Index of the current neuron we are at.
                            //  i = Index of the neuron to get input weights and outputs from.
                            double w_i_j = network.layers.get(layerIndex).neurons.get(j).inputWeights.get(i);
                            double a = 1;
                            double a_i = network.layers.get(layerIndex).neurons.get(j).inputNeurons.get(i).output;
                            double deltaError = network.layers.get(layerIndex).neurons.get(j).deltaError;
                            
                            // QUICK NOTES:
                            //  Updates the current weight, w_i_j. (w_i,j)
                            // 
                            //  Update Equation: w_i_j <-- w_i_j + a * a_i * deltaError;
                            //  w_i_j represents the weight connection from i to j.
                            //  
                            network.layers
                                    .get(layerIndex)
                                    .neurons.get(j)
                                    .inputWeights.set(i, w_i_j + a * a_i * deltaError);
                        }
                    }
                }
                
                // Find the maximum error amount in one of the output neurons.
                for (int i = 0; i < network.getOutputLayer().numOfNeurons; i++) {
                    if (Math.abs(maximumError) < Math.abs(network.getOutputLayer().neurons.get(i).error))
                        maximumError = network.getOutputLayer().neurons.get(i).error;
                }
            }
            
            trainingIterations++; // Increment num of Training Iterations.
            
            //System.out.println("MAX ERROR: " + maximumError); //TODO: Debug max error.
            
        } while (trainingIterations < 1000 && Math.abs(maximumError) > 0.01);
        
        return network;
    }
    
    /** 
     * Tests a particular network. Returns it's accuracy percentage after testing.
     * 
     * @param network - The particular network to test.
     * @throws FileNotFoundException - Throws this, if the testing image set file does not exist.
     */
    private static void testNetwork(NeuralNetwork network) throws FileNotFoundException {
        
        //*** Read test set data. ***
        DecimalFormat df = new DecimalFormat("00");
        String testSet = "testSet_" + df.format(resolutionOfData) + ".dat";
        Path testSetPath = Paths.get("testSet_data", testSet);
        
        System.out.println("Testing on " + testSet + "...");
        
        boolean directoryExists = false;
        directoryExists = Files.exists(testSetPath);
        if (!directoryExists) {
            System.out.println();
            System.out.println("*** Warning: That file does not exist. An exception may occur! ***");
        }
        
        // Put the test set of data into a set or list.
        ArrayList< ArrayList<Vector<Double>> > examples = new ArrayList<>();
        
        Scanner fScan = new Scanner(testSetPath.toFile());
        while (fScan.hasNextLine()) {
            
            // Get the current line in "testSet##.dat".
            String line = fScan.nextLine().trim();
            
            // A parser which ignore lines that contain comments.
            if (line.contains("#")) {
                continue;
            }
            
            // Parse this character '(' in the particular data set.
            //      This calculates the splitting index, which is helpful to split the features and outputs later.
            int splittingIndex = 0;
            for (int i = line.length() - 1; i >= 0; i--) {
                if (line.charAt(i) == '(') {
                    break;
                }
                splittingIndex++;
            }
            
            String sFeatures = line.substring(1, line.length() - (splittingIndex + 3));
            String sOutputs = line.substring(line.length() - splittingIndex, line.length() - 1);
            String[] sFeaturesSplit = sFeatures.split(" ");
            String[] sOutputsSplit = sOutputs.split(" ");
            
            Vector<Double> v1 = new Vector<>();
            for (int i = 0; i < sFeaturesSplit.length; i++) {
                // NORMALIZE THE FEATURES FOR GRAYSCALE OR RAW PIXEL DATA.
                // Only if the feature is not yet normalized between "0.0" and "1.0".
                double normalizedFeature = Double.parseDouble(sFeaturesSplit[i]);
                if (normalizedFeature > 1.0) {
                    normalizedFeature = normalizedFeature / 255.0;
                }
                v1.add(normalizedFeature);
            }
            Vector<Double> v2 = new Vector<>();
            for (int i = 0; i < sOutputsSplit.length; i++) {
                v2.add(Double.parseDouble(sOutputsSplit[i]));
            }
            
            // Add these vectors to a set/list of examples.
            ArrayList<Vector<Double>> example = new ArrayList<>();
            example.add(v1);
            example.add(v2);
            examples.add(example);
        }
        fScan.close();
        
        //*** Test on the test image data set and return the network's accuracy on it. ***
        int correct = 0;
        int incorrect = 0;
        double accuracy = 0;
        
        for (int i = 0; i < examples.size(); i++) {
            boolean isCorrect = network.classify(examples.get(i));
            if (isCorrect) {
                correct++;
            } else {
                incorrect++;
            }
        }
        
        accuracy = (double)correct / ((double)correct + (double)incorrect);
        accuracy *= 100;
        
        DecimalFormat df2 = new DecimalFormat("0.#");
        System.out.println("Accuracy achieved: " + df2.format(accuracy) + "%");
    }
    
    /**
     * Saves a given Neural Network to a file. 
     * 
     * @param network - A given neural network.
     * @throws IOException - Will be thrown, if the file cannot be written or the writing process is interrupted.
     */
    private static void saveNetwork(NeuralNetwork network) throws IOException {
        
        while (true) {
            System.out.print("\nSave network (Y/N)? ");
            String uInput = sUser.nextLine();
            
            if ("Y".equalsIgnoreCase(uInput)) {
                System.out.print("File-name: ");
                uInput = sUser.nextLine();
                
                System.out.println("Saving network...");
                FileOutputStream fos = new FileOutputStream(new File(uInput));
                ObjectOutputStream oos = new ObjectOutputStream(fos);
                
                oos.writeObject(network);
                oos.writeInt(resolutionOfData);
                
                oos.close();
                
                System.out.println("Network saved to file: " + uInput);
                
                break;
            } else if ("N".equalsIgnoreCase(uInput)) {
                break;
            } else {
                System.out.print("\n\n*** Invalid Input: Please try again. ***");
            }
        }
    }
    
    /**
     * Asks the user what neural network file to load.
     * Loads the Neural Network from a given file-name.
     * 
     * @return Returns the neural network.
     * @throws ClassNotFoundException - Will throw this, if the file does not contain a compatible or 
     *              readable neural network object that matches the class of {@code NeuralNetwork}.
     */
    private static NeuralNetwork loadNetwork() throws ClassNotFoundException {
        
        while (true) {
            
            System.out.print("Network file-name: ");
            String uInput = sUser.nextLine();
            
            System.out.println("Loading network from: " + uInput + "...");
            NeuralNetwork network = null;
            
            try {
                FileInputStream fis = new FileInputStream(new File(uInput));
                ObjectInputStream oos = new ObjectInputStream(fis);
                
                network = (NeuralNetwork) oos.readObject();
                resolutionOfData = oos.readInt();
                
                oos.close();
                fis.close();
                
            } catch (IOException e) {
                System.out.print("\n\n*** Warning: The file was not found. ***");
            } 
            
            System.out.println("Input layer size: " + network.getInputLayer().numOfNeurons + " nodes");
            if (network.layers.size() > 2) {
                System.out.print("Hidden layer sizes: ");
                for (int i = 1; i < network.layers.size() - 1; i++) {
                    if (i == network.layers.size() - 2) {
                        System.out.print(network.layers.get(i).numOfNeurons + "");
                    } else {
                        System.out.print(network.layers.get(i).numOfNeurons + ", ");
                    }
                }
                System.out.println();
            }
            
            System.out.println("Output layer size: " + network.getOutputLayer().numOfNeurons + " nodes");
            
            return network;
        }
    }
}
