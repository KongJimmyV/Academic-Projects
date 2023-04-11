import java.io.File;
import java.util.LinkedHashMap;
import java.util.ArrayList;
//import java.util.Arrays;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Project Name:    Assignment 3        <br>
 * File Name:       Driver.java         <br>
 * Description:     This Driver Class simulates the training and evaluation of a neural
 *                      network for multi-class classification. 
 *                      
 *                  This program will allow the user to specify the structure of
 *                      a multi-layer feed-forward neural network and then will train 
 *                      that network using backpropagation in conjunction with 
 *                      mini-batch gradient descent. <br><br>
 * 
 * Date Created:    11/18/22            <br>
 * Date Modified:   11/28/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * Argument Flags:
 * <ul>
 *      <li> -f 'FILENAME': Reads training data from the file named 'FILENAME' (specified as a String).
 *      <li> -h 'NH' 'S1' 'S2' ..
 *              <br> Specifies the number of hidden layers 'NH' followed by 'NH' additional integers 
 *              corresponding to the sizes of these hidden layers. You can assume that 'NH' is a non-negative integer 
 *              no greater than 10. The following integer(s) 'S1', 'S2', etc. represent the sizes of hidden layer
 *              1, hidden layer 2, and so on. There will be 'NH' size values, and you can assume that each of
 *              these values will be a positive integer no greater than 500. For example, -h 2 10 5 specifies
 *              a neural network with two hidden layers, the first containing 10 neurons and the second
 *              containing 5. Note that 'NH' may be 0, in which case there are no hidden layers and no
 *              additional integers following. (Using zero hidden layers is the default.)
 *      <li> -a 'DOUBLE': Specifies the learning rate α in mini-batch gradient descent; default is 0.01.
 *      <li> -e 'INTEGER': Specifies the epoch limit in mini-batch gradient descent; default is 1000.
 *      <li> -m 'INTEGER': Specifies the batch size in mini-batch gradient descent; 
 *              default is 1 for stochastic gradient descent (using -m 0 should be interpreted as full batch gradient descent).
 *      <li> -l 'DOUBLE': Specifies the regularization hyperparameter λ; default is 0.0 (no regularization).
 *      <li> -r: If specified, this flag (which has no arguments) enables randomization of data for 
 *              the train/validation split and for batch construction at the start of each epoch; if this flag is not
 *              specified, then data should not be randomized (which is the default behavior; this is to
 *              make testing and debugging easier).
 *      <li> -w 'DOUBLE': Specifies the value ε for weight initialization; default is 0.1.
 *      <li> -g 'NAME': Specifies the name of the activation function to be used at neurons in the hidden layers, where 'NAME' 
 *              is a String that matches one of the following (case-insensitive):
 *                   'NAME'     : DESCRIPTION
 *                  - logistic  : The standard logistic function.
 *                  - relu      : The rectified linear unit.
 *                  - softplus  : The softplus function.
 *                  - tanh      : The hyperbolic tangent function.
 *      <li> -v 'INTEGER': Specifies a verbosity level from 1 to 5, indicating how much output the program 
 *              should produce; default is 1.
 * </ul>
 *  
 * @version 1.0
 * @author Kong Jimmy Vang
 */
public class Driver 
{
    /**
     * Main method.
     * @param args - command-line arguments
     * @throws Exception Thrown if invalid arguments are found or files related issues occurred.
     */
    public static void main(String[] args) throws Exception
    {
        //*** DEBUG: Showing command-line args ***
        //System.out.println("\r\n* DEBUG: Showing command-line args (arguments)");
        //System.out.println(Arrays.toString(args));
        
        //====== Process command-line arguments ======
        // See "Args.java" for more information.
        Args arguments = new Args(args);
        
        //====== Load data from the specified file. ======
        // *** LOG: Reading file ***
        if (arguments.verbosityLevel >= 1) {
            System.out.println(String.format("* Reading %s", arguments.fileName));
        }
        
        // Setup scanner.
        final File file = new File(arguments.fileName);
        final Scanner scanner = new Scanner(file);
        
        // Initialize training set
        final LinkedHashMapSet<Double> trainingFeatureSet = new LinkedHashMapSet<>();
        final LinkedHashMapSet<Double> trainingOutputSet = new LinkedHashMapSet<>();
        
        // Initialize validation set
        final LinkedHashMapSet<Double> validationFeatureSet = new LinkedHashMapSet<>();
        final LinkedHashMapSet<Double> validationOutputSet = new LinkedHashMapSet<>();
        
        // Parse the file for data. Store the data in the training set for now.
        parseData(scanner, trainingFeatureSet, trainingOutputSet);
        
        //*** LOG: Show the parsed feature set and output set ***
        if (arguments.verbosityLevel >= 5) {
            System.out.println("  * DEBUG: Show the Parsed Data");
            System.out.println(String.format("    trainingFeatureSet:   %s", trainingFeatureSet));
            System.out.println(String.format("    trainingOutputSet:    %s", trainingOutputSet));
        }
        
        //====== Randomly split data into training and validation sets (use 80% of data for training) ======
        if (arguments.verbosityLevel >= 1) {
            System.out.println(String.format("* Doing train/validation split"));
        }
        
        // Split the data into the training set and validation set.
        splitData(arguments, trainingFeatureSet, trainingOutputSet, validationFeatureSet, validationOutputSet);
        
        if (arguments.verbosityLevel >= 5) {
            System.out.println("  * DEBUG: Show the Split Data");
            System.out.println(String.format("    trainingFeatureSet:   %s", trainingFeatureSet));
            System.out.println(String.format("    trainingOutputSet:    %s", trainingOutputSet));
            System.out.println(String.format("    validationFeatureSet: %s", validationFeatureSet));
            System.out.println(String.format("    validationOutputSet:  %s", validationOutputSet));
        }
        
        //====== Learn min-max normalization (feature scaling) parameters from the training set ======
        if (arguments.verbosityLevel >= 1) {
            System.out.println(String.format("* Scaling features"));
        }
        
        // Initialize the min/max maps.
        LinkedHashMap<Integer, Double> mapMin = new LinkedHashMap<>();
        LinkedHashMap<Integer, Double> mapMax = new LinkedHashMap<>();
        
        // Perform the min/max normalization on the training set and store the min/max values in mapMin and mapMax.
        doMinMaxNormalization(trainingFeatureSet, mapMin, mapMax);
        
        //*** LOG: Show the min/max values for each feature on the training set. ***
        if (arguments.verbosityLevel >= 2) {
            System.out.println(String.format("  * min/max values on training set: "));
            for (int i = 0; i < mapMin.size(); i++) {
                System.out.println(String.format("    Feature %d: %.3f, %.3f", i + 1, mapMin.get(i), mapMax.get(i)));
            }
        }
        
        //====== Use the "learned" scaling parameters to rescale attribute values for all data ======
        rescaleFeatureValues(trainingFeatureSet, mapMin, mapMax);
        rescaleFeatureValues(validationFeatureSet, mapMin, mapMax);
        
        //*** LOG: Show all of the rescaled attribute values in the data set ***
        if (arguments.verbosityLevel >= 5) {
            System.out.println("  * DEBUG: Show rescaled attribute values for all data");
            System.out.println(String.format("    rescaledTrainingSetInputs:   %s", trainingFeatureSet));
            System.out.println(String.format("    rescaledValidationSetInputs: %s", validationFeatureSet));
        }
        
        //====== Set up neural network architecture based on command-line arguments ======
        if (arguments.verbosityLevel >= 1) {
            System.out.println(String.format("* Building network"));
        }
        
        // Create the neural network.
        FeedForwardNeuralNetwork network = 
                createNeuralNetwork(arguments, trainingFeatureSet, trainingOutputSet);
        
        //*** LOG: Display the neural network ***
        if (arguments.verbosityLevel >= 5) {
            System.out.println("------------------------------------");
            System.out.println("* DEBUG: Display Neural Network Data");
            System.out.print(String.format("%s", network));
            System.out.println("------------------------------------");
        }
        
        //====== Train the neural network on the training data ======
        if (arguments.verbosityLevel >= 1) {
            System.out.println(String.format("* Training network (using %d examples)", trainingFeatureSet.size()));
        }
        
        // Train network.
        network.train(trainingFeatureSet, 
                      trainingOutputSet, 
                      arguments.batchSize,
                      arguments.alpha,
                      arguments.regularizationLambda, 
                      arguments.weightInitEpsilon);
        
        //====== Evaluate the accuracy of the neural network on the validation set ======
        if (arguments.verbosityLevel >= 1) {
            System.out.println(String.format("* Evaluating accuracy"));
        }
        
        // Get final accuracy statistics.
        double trainingAccuracy = network.calculateAccuracy(trainingFeatureSet, trainingOutputSet);
        double validationAccuracy = network.calculateAccuracy(validationFeatureSet, validationOutputSet);
        
        //*** LOG: Print training and validation accuracy. ***
        if (arguments.verbosityLevel >= 1) {
            System.out.print(  String.format("  TrainAcc: %f\r\n", trainingAccuracy));
            System.out.print(  String.format("  ValidAcc: %f\r\n", validationAccuracy));
        }
        System.out.println();
        
        //*** LOG: Print the final Network Weights and end the program. ***
        if (arguments.verbosityLevel >= 5) {
            network.printWeights();
            System.out.println("\r\n*** END PROGRAM ***");
        }
    }
    
    /**
     * Creates a feed forward neural network.
     * @param arguments - arguments
     * @param trainingFeatureSet - feature data set
     * @param trainingOutputSet - output data set
     * @return
     */
    private static FeedForwardNeuralNetwork createNeuralNetwork(
            final Args arguments, 
            final LinkedHashMapSet<Double> trainingFeatureSet,
            final LinkedHashMapSet<Double> trainingOutputSet) 
    {
        int numOfInputs = trainingFeatureSet.get(0).size();
        int numOfOutputs = trainingOutputSet.get(0).size();
        
        if (arguments.verbosityLevel >= 5) {
            System.out.println("\r\n* DEBUG: Display Hidden Layer List Size and Values");
            System.out.println(String.format("  List Size: %s", arguments.hiddenLayers.size()));
        }
        ArrayList<Integer> listHiddenLayerSizes = new ArrayList<>();
        for (int i = 0; i < arguments.hiddenLayers.size(); i++) {
            listHiddenLayerSizes.add(arguments.hiddenLayers.get(i));
            if (arguments.verbosityLevel >= 5) {
                System.out.println(String.format("  hiddenLayers[%d]: %s", i, arguments.hiddenLayers.get(i)));
            }
        }
        
        //long seed = 0;
        FeedForwardNeuralNetwork network = new FeedForwardNeuralNetwork(
                //seed, 
                numOfInputs, 
                listHiddenLayerSizes, 
                numOfOutputs, 
                arguments.epochLimit, 
                arguments.bRandomization, 
                arguments.verbosityLevel, 
                arguments.activationFunction);
        
        return network;
    }

    /**
     * Parse file data from the input file.
     * @param scanner - must be the scanner that has the input file opened.
     * @param featureSet - feature data set.
     * @param trainingOutputSet - output data set.
     */
    private static void parseData(final Scanner scanner, 
                                  final LinkedHashMapSet<Double> featureSet, 
                                  final LinkedHashMapSet<Double> trainingOutputSet) 
    {
        Pattern p = Pattern.compile("\\(([^)]+)\\)");
        Matcher m;
        
        while (scanner.hasNextLine()) 
        {
            String line = scanner.nextLine();
            
            // Ignore comments
            if (containsCommentOrEmptyLine(line)) {
                continue;
            }
            
            //System.out.println(line);
            
            m = p.matcher(line);
            
            LinkedHashMap<Integer, String> tempMapStr = new LinkedHashMap<>();
            int k = 0;
            while(m.find()) {
                //System.out.println(m.group(1));
                tempMapStr.put(k++, m.group(1));
            }
            
            String strInputSet = tempMapStr.get(0);
            String strOutputSet = tempMapStr.get(1);
            
            String[] splitInput = strInputSet.split(" ");
            String[] splitOutput = strOutputSet.split(" ");
            
            LinkedHashMap<Integer, Double> tempMapDouble = new LinkedHashMap<>();
            for (int j = 0; j < splitInput.length; j++) {
                tempMapDouble.put(j, Double.parseDouble(splitInput[j].trim()));
            }
            featureSet.add(tempMapDouble);
            
            tempMapDouble = new LinkedHashMap<>();
            for (int j = 0; j < splitOutput.length; j++) {
                tempMapDouble.put(j, Double.parseDouble(splitOutput[j].trim()));
            }
            trainingOutputSet.add(tempMapDouble);
        }
    }
    
    /**
     * Split the data. 80% for training, 20% for validation.
     * @param trainingFeatureSet - training set with feature data
     * @param trainingOutputSet -  training set with output data
     * @param validationFeatureSet - validation set with feature data
     * @param validationOutputSet -  validation set with output data
     */
    private static void splitData(final Args arguments,
                                  final LinkedHashMapSet<Double> trainingFeatureSet, 
                                  final LinkedHashMapSet<Double> trainingOutputSet, 
                                  final LinkedHashMapSet<Double> validationFeatureSet, 
                                  final LinkedHashMapSet<Double> validationOutputSet) 
    {
        int max = (int) Math.floor(trainingFeatureSet.size() * 0.2);
        if (arguments.bRandomization) 
        {
            Random r = new Random();
            for (int i = 0; i < max; i++) 
            {
                if (trainingFeatureSet.size() > 0) 
                {
                    int j = r.nextInt(trainingFeatureSet.size());
                    validationFeatureSet.add( trainingFeatureSet.remove(j) );
                    validationOutputSet.add( trainingOutputSet.remove(j) );
                }
            }
        }
        else
        {
            for (int i = 0; i < max; i++) {
                validationFeatureSet.add( trainingFeatureSet.remove(trainingFeatureSet.size() - 1) );
                validationOutputSet.add( trainingOutputSet.remove(trainingOutputSet.size() - 1) );
            }
        }
    }
    
    /**
     * Does min-max normalization across a given training set and store the min/max values in mapMin and mapMax.
     * @param featureSet - data set with feature values.
     * @param mapMin - stores minimum values for each feature across the training set.
     * @param mapMax - stores maximum values for each feature across the training set.
     */
    private static void doMinMaxNormalization(final LinkedHashMapSet<Double> featureSet, 
                                              final LinkedHashMap<Integer, Double> mapMin, 
                                              final LinkedHashMap<Integer, Double> mapMax) 
    {
        for (int i = 0; i < featureSet.size(); i++) {
            LinkedHashMap<Integer, Double> data = featureSet.get(i);
            for (Map.Entry<Integer, Double> j : data.entrySet()) {
                Integer key = j.getKey();
                
                Double dataValue = data.get(key);
                Double min = mapMin.get(key);
                Double max = mapMax.get(key);
                
                if (null == min) {
                    mapMin.put(key, dataValue);
                } else {
                    if (Double.compare(dataValue, min) < 0) {
                        mapMin.put(key, dataValue);
                    }
                }
                
                if (null == max) {
                    mapMax.put(key, dataValue);
                } else {
                    if (Double.compare(dataValue, max) > 0) {
                        mapMax.put(key, dataValue);
                    }
                }
            }
        }
    }
    
    /**
     * Rescale feature values for a given data set using a min map and max map, which stores each feature.
     * @param featureSet - data set with feature values.
     * @param mapMin - stores minimum values for each feature across the training set.
     * @param mapMax - stores maximum values for each feature across the training set.
     */
    private static void rescaleFeatureValues(final LinkedHashMapSet<Double> featureSet,
                                             final LinkedHashMap<Integer, Double> mapMin, 
                                             final LinkedHashMap<Integer, Double> mapMax) 
    {
        for (int i = 0; i < featureSet.size(); i++) {
            LinkedHashMap<Integer, Double> data = featureSet.get(i);
            for (int j = 0; j < data.size(); j++) {
                Double dataValue = data.get(j);
                Double min = mapMin.get(j);
                Double max = mapMax.get(j);
                
                Double newDataValue = -1.0;
                if (Double.compare(min, max) != 0) {
                    newDataValue += 2.0 * ((dataValue - min) / (max - min));
                }
                data.put(j, newDataValue);
            }
        }
    }
    
    /**
     * Returns true if a comment is detected in the line or the string is empty.
     * @param line - string
     * @return Returns true if a comment is detected in the line or the string is empty.
     */
    public static boolean containsCommentOrEmptyLine(final String line) {
        return containsComment(line) || containsEmptyLine(line);
    }
    
    /**
     * Returns true if a comment is detected in the line.
     * @param line - string
     * @return Returns true if a comment is detected in the line.
     */
    public static boolean containsComment(final String line) 
    {
        for (int i = 0; i < line.length(); i++)
        {
            switch (line.charAt(i)) 
            {
                case ' ':
                    continue;
                case '#':
                    return true;
                default:
                    return false;
            }
        }
        return false;
    }
    
    /**
     * Returns true if the string is empty.
     * @param line - string
     * @return Returns true if the string is empty.
     */
    public static boolean containsEmptyLine(final String line) {
        return line.isEmpty();
    }
}
