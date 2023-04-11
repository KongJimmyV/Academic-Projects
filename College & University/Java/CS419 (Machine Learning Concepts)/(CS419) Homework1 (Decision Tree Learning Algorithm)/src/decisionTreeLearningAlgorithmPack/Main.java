//////////////////////////////////////////////////////////////////
// File Name:   Main.java
// Author:      Kong Jimmy Vang
// Date:        9/27/2018
// 

package decisionTreeLearningAlgorithmPack;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.RoundingMode;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Random;
import java.util.Scanner;

/**
 * This class contains the code used to run the Decision Tree Learning Algorithm.
 * <br><br>
 * I separated this code from the DecisionTreeLearningAlgorithm class to make it easier 
 *      to run this package in the command prompt.
 * 
 * @author Kong Jimmy Vang
 *
 */
public class Main {

    //************************************************************
    
    //*** Field Variables for "main". ***
    /** Decision Tree Learning Algorithm. */
    private static DecisionTreeLearningAlgorithm dTreeLearnAlg;
    
    /** The tree that will be trained. */
    private static DecisionTree trainedTree;
    
    /** This linked list will store the statistics (testing results). */
    private static LinkedList<String> testingResultsList = new LinkedList<>();
    
    //**************************************************************************************************************************
    /** Main method. Runs the Decision Tree Learning Algorithm on a set of mushroom data with a set of properties/attributes. */
    static public void main(String[] args) {
        try {
            
            // Prompt the user for the input of S and I.
            promptForUserInput();   // S = Training set size, I = Training set increment
            
            System.out.println("Loading Property Information from file.");
            getPropertyInformation();   // Gather the properties of the mushrooms.
            
            System.out.println("Loading Data from database.");
            getDataSet();       // Get the data set from the file.
            
            System.out.println("\nCollecting set of " + dTreeLearnAlg.getS() + " training examples.");
            getTrainingSet();   // Get the training set of size S.
            
            //System.out.println("\nRunning with " + dTreeLearnAlg.getICount() + " examples in training set.");
            startTraining();    // Train, starting with I examples.
            
            
        } catch (IOException e) {
            
            // An exception should never occur unless the setup is wrong, or the written code is bugged.
            e.printStackTrace();
            System.out.println("\n\n");
            System.out.println("\tAn exception should never occur in this program. "
                    + "If it does, then the exception message is the cause "
                    + "or a particular bug in the written code is the culprit.");
        }
        
        // Signal to the user that the program has ended.
        //System.out.println("\n*********************");
        //System.out.println("*** PROGRAM ENDED ***\n");
    }
    //**************************************************************************************************************************
    
    //*** Functions/Methods ***
    /**
     * Prompt in the console for the user's input.
     * @throws IOException
     */
    static private void promptForUserInput() throws IOException {
        
        //*** Ask for user input ***
        Scanner scanner = new Scanner(System.in);
        int S = 0, I = 0;
        
        // Ask for the training set size, S.
        String message = "Please enter a training set size (a positive multiple of 250 that is <= 1000): ";
        System.out.print(message);
        while (scanner.hasNext()) {
            try {
                
                S = Integer.parseInt(scanner.nextLine());
                
                // If "S" is NOT a positive multiple of 250 that is <= 1000, then prompt/warn the user.
                if (S < DecisionTreeLearningAlgorithm.S_LOWERBOUND || S > DecisionTreeLearningAlgorithm.S_UPPERBOUND
                        || S % 250 != 0){
                    System.out.println("\n*** Invalid Input: Values of S must be a positive multiple of 250 that is <= 1000. ***");
                    System.out.print(message);
                    continue;
                }
                
                break;
            } catch (NumberFormatException e) {
                System.out.println("\n*** Invalid Input: The value typed must be an Integer. ***");
                System.out.print(message);
            }
        }
        
        // Ask for the training set increment, I.
        message = "Please enter a training increment (either 10, 25, or 50): ";
        System.out.print(message);
        while (scanner.hasNext()) {
            try {
                I = Integer.parseInt(scanner.nextLine());
                //System.out.println("I: "+I);
                
                if (I != 10 && I != 25 && I != 50){
                    System.out.println("\n*** Invalid Input: The value, \"I\", must be 10, 25, or 50. ***");
                    System.out.print(message);
                    continue;
                }
                
                break;
            } catch (NumberFormatException e) {
                System.out.println("\n*** Invalid Input: The value typed must be an Integer. ***");
                System.out.print(message);
            }
        }
        
        // Create the learning algorithm.
        // Start with the user input of S and I.
        dTreeLearnAlg = new DecisionTreeLearningAlgorithm(S, I);
        
        System.out.println();
        scanner.close();
    }
    
    /**
     * Get the property information of the mushrooms from the file "properties.txt".
     * @throws FileNotFoundException
     */
    static private void getPropertyInformation() throws FileNotFoundException {

        Path path = Paths.get("input_files", "properties.txt");    
        //boolean directoryExists = Files.exists(path);
        
        Scanner scanner = new Scanner(new File(path.toAbsolutePath().toString()));
        
        int index = 0;
        while(scanner.hasNextLine()) {
            String s = scanner.nextLine();
            
            // Split the property name from the values. 
            // In the array "split", "split[0]" is the property name and "split[1]" contains the values.
            String[] split = s.split(":");
            
            // Trim "split[1]" (Get rid of leading/trailing white-spaces) and get each individual value from "split[1]".
            split[1] = split[1].trim();
            String[] splitValues = split[1].trim().split(" ");
            
            // Build the Attribute object.
            LinkedList<String> listOfValues = new LinkedList<>(Arrays.asList(splitValues));
            Attribute a = new Attribute(index, split[0], listOfValues);
            
            // Add the Attribute to the learning algorithm's properties list.
            dTreeLearnAlg.properties.add(a);
            //System.out.println(s);
            
            index++;
        }
        
        // ### DEBUG TOOL: Print the number of Properties/Attributes detected. ###
        //System.out.println("\tNumber of Properties/Attributes: " + dTreeLearnAlg.properties.size());
        //System.out.println("" + dTreeLearnAlg.properties.toString());
        
        scanner.close();
    }
    
    /**
     * Get the whole data set of mushroom from the file "mushroom_data.txt".
     * @throws FileNotFoundException
     */
    static private void getDataSet() throws FileNotFoundException {
        
        // Get the path of the whole data set.
        Path path = Paths.get("input_files", "mushroom_data.txt");    
        //boolean directoryExists = Files.exists(path);
        
        // Read from the file and store the data set for use by this algorithm.
        Scanner scanner = new Scanner(new File(path.toAbsolutePath().toString()));
        
        // Add the whole dData set to the learning algorithm's data set list.
        while(scanner.hasNextLine()) {
            String s = scanner.nextLine();
            Example e = new Example(s);
            dTreeLearnAlg.dataSet.add(e);
        }
        
        // ### DEBUG TOOL: Print the data set size. ###
        //System.out.println("\tDATA_SET_SIZE: " + dTreeLearnAlg.dataSet.size());
        
        scanner.close();
    }
    
    /** Get/Choose a training set of S examples, each example being randomly selected from the overall data set. */
    static private void getTrainingSet() {
        
        // Get the stored S.
        int S = dTreeLearnAlg.getS();
        
        // Add S amount of examples to the learning algorithm's training set, randomly gathered/selected from the data set.
        Random rand = new Random();
        while (S > 0) {
            int bound = dTreeLearnAlg.dataSet.size();
            
            // Add to the training set.
            dTreeLearnAlg.trainingSet.add(dTreeLearnAlg.dataSet.remove(rand.nextInt(bound)));
            S--;
        }
        
        // ### DEBUG TOOL: Print the training set size. ###
        //System.out.println("\tTRAINING_SET_SIZE: " + dTreeLearnAlg.trainingSet.size());
        //System.out.println("" + dTreeLearnAlg.trainingSet.toString());
    }
    
    /** Starts training some decision trees and print their results on how many classifications each tree got correct. */
    static private void startTraining() {
        
        // Train in increments of I until the max training set size S is met.
        int j = 0;
        while (dTreeLearnAlg.getICounter() <= dTreeLearnAlg.trainingSet.size()) {
            System.out.println("\nRunning with " + dTreeLearnAlg.getICounter() + " examples in training set.");
            
            // Get the training set examples.
            while (j < dTreeLearnAlg.getICounter()) {
                dTreeLearnAlg.trainingSubSet.add(dTreeLearnAlg.trainingSet.get(j));
                j++;
            }
            
            SetOfExamples examples = dTreeLearnAlg.trainingSubSet;
            SetOfAttributes attributes = dTreeLearnAlg.properties.clone();
            
            // Build the decision tree.
            trainedTree = decisionTreeLearning(examples, attributes, null);
            
            // Test the trained tree against the rest of the data set.
            trainedTree.startAtRoot();
            
            int correct = 0;
            int total = dTreeLearnAlg.dataSet.size();
            
            for (int i = 0; i < dTreeLearnAlg.dataSet.size(); i++) {
                Example e = dTreeLearnAlg.dataSet.get(i);
                String classification = trainedTree.classify(e);
                
                if (e.getResult().equalsIgnoreCase(classification)) {
                    correct++;
                }
            }
            
            // Print the results.
            DecimalFormat df = new DecimalFormat("#.####"); // For rounding the percentage.
            df.setRoundingMode(RoundingMode.HALF_UP);
            
            double percent = ((double)correct / (double)total) * 100;
            
            System.out.println("\nGiven current tree, there are " + correct + " correct classifications "
                    + "\nout of " + total + " possible (a success rate of " + df.format(percent) + " percent).");
            
            // Store the results.
            testingResultsList.add("Training set size: " + dTreeLearnAlg.getICounter() + ".  Success: " + df.format(percent) + " percent.");
            
            // Increase the set of examples to build a tree with.
            dTreeLearnAlg.incrementICounter();
        }
        
        // Summarize and display the results.
        System.out.println();
        System.out.println("\t----------");
        System.out.println("\tStatistics");
        System.out.println("\t----------");
        System.out.println();
        
        for (int i = 0; i < testingResultsList.size(); i++) {
            System.out.println(testingResultsList.get(i));
        }
        
    }
    
    
    //*****************************************************************************
    //*** HELPER METHODS ***
    /**
     * Creates and trains a {@code DecisionTree} on a set of examples, {@code examples}, 
     * using the given set of attributes, {@code attributes}. <br><br>
     * 
     * Returns the tree after training it on the set of examples.
     * 
     * @param examples - A set of examples.
     * @param attributes - A set of attributes.
     * @param parentExamples - The parent of {@code examples}.
     * @return Returns a trained {@code DecisionTree}.
     */
    static private DecisionTree decisionTreeLearning(SetOfExamples examples,
                                             SetOfAttributes attributes,
                                             SetOfExamples parentExamples) {
        // Base Case 1: If the examples are empty, return the plurality value of the parent examples.
        if (examples.isEmpty()) {
            return pluralityValue(parentExamples);
        
        // Base Case 2: If all examples have the same classification, return a decision tree with the very same classification.
        } else if (examples.isAllPostive()) {
            DecisionTree dTree = new DecisionTree();
            LinkedList<String> listOfValues = new LinkedList<>();
            
            listOfValues.add("POS");
            dTree.addChildNode(0, new Attribute(dTreeLearnAlg.properties.size(), "POS", listOfValues));
            return dTree;
            
        } else if (examples.isAllNegative()) {
            DecisionTree dTree = new DecisionTree();
            LinkedList<String> listOfValues = new LinkedList<>();
            
            listOfValues.add("NEG");
            dTree.addChildNode(0, new Attribute(dTreeLearnAlg.properties.size(), "NEG", listOfValues));
            return dTree;
            
        // Base Case 3: If the attributes are empty, return the plurality value of examples.
        } else if (attributes.isEmpty()) {
            return pluralityValue(examples);
        
        // Base Case 4: Create the decision tree and train it. Add a new subtree with a new attribute A.
        } else {
            
            // Find the Attribute with the most information gain.
            for (int i = 0; i < attributes.size(); i++) {
                Attribute a = attributes.get(i);
                a.setInformationGain(importance(a, examples));
            }
            
            Attribute A = argmax(attributes);
            
            // Create a new decision tree with the test root A.
            DecisionTree tree = new DecisionTree(A);
            
            // For each value vk of A, create a branch from the dTree.
            for (int k = 0; k < A.getListOfValues().size(); k++) {
                
                // Add e to exs if (e is an element of examples AND e.A = v at k).
                SetOfExamples exs = new SetOfExamples(new LinkedList<>());
                
                String v = A.getListOfValues().get(k);
                for (Example e : examples.getExamplesList()) {
                    if (e.getExampleAttributeAt(A.getAttributeIndex()).equalsIgnoreCase(v)) {
                        exs.add(e);
                        //System.out.println("EXS: ADDED e");
                    }
                }
                
                // Recurse and create a new subtree.
                attributes.remove(A);
                DecisionTree subTree = decisionTreeLearning(exs, attributes, examples);
                //System.out.println(attributes.toString());
                
                // Add a branch to tree with label (A = vk) and subtree "subtree".
                tree.addChildNode(tree.getAmountOfChildren(), A, A.getListOfValues().get(k), subTree);
            }
            
            return tree;
        }
    }
    
    /**
     * Calculate the information gain heuristic of an Attribute, {@code a}, and set of examples, {@code examples}.
     * @param a - An Attribute.
     * @param examples - A set of Examples.
     * @return Returns the information gain heuristic.
     */
    static private double importance(final Attribute a, final SetOfExamples examples) {
        
        // Get Entropy
        double entropy = findEntropy(examples);
        double remainingEntropy = findRemainingEntropy(a, examples);
        
        double gain = entropy - remainingEntropy;
        return gain;
    }
    
    /**
     * Calculates the Entropy of a particular set of examples, {@code examples}.
     * @param examples - A set of Examples.
     * @return Returns the entropy value.
     */
    static private double findEntropy(final SetOfExamples examples) {
        int p = examples.getP();
        int n = examples.getN();
        double H = 0;
        if (p == 0 || n == 0) {
            H = 0;
        } else {
            //H = -(((double)p/(double)(p+n)) * Math.log((double)p/(double)(p+n))/Math.log(2.0) 
            //        + ((double)n/(double)(p+n)) * Math.log((double)n/(double)(p+n))/Math.log(2.0));
            H = ((double)p/((double)p+(double)n));
        }
        
        return H;
    }
    
    /**
     * Calculates the remaining entropy of a set of {@code examples}, regarding an Attribute {@code a}.
     * @param a - One particular Attribute.
     * @param examples - A set of Examples.
     * @return Returns the remaining entropy (or the remainder).
     */
    static private double findRemainingEntropy(final Attribute a, final SetOfExamples examples) {
        
        // Get d.
        int d = a.getD();
        
        // Divide our training set into a list of subsets for E1, ..., Ed.
        LinkedList<SetOfExamples> listOfExampleSubsets = new LinkedList<>();
        for (int i = 0; i < d; i++) {
            SetOfExamples subset = new SetOfExamples(new LinkedList<>());
            
            for (int i2 = 0; i2 < examples.size(); i2++) {
                Example e = examples.get(i2);
                
                int attributeIndex = a.getAttributeIndex();
                String attributeValue = e.getExampleAttributeAt(attributeIndex);
                
                if (attributeValue.equalsIgnoreCase(a.getListOfValues().get(i))) {
                    subset.add(e);
                }
            }
            
            listOfExampleSubsets.add(subset);
        }
        
        // Calculate Remainder(a).
        double remainder = 0;
        for (int k = 1; k <= d; k++) {
            int p = listOfExampleSubsets.get(k-1).getP();
            int n = listOfExampleSubsets.get(k-1).getN();
            int totalP = examples.getP();
            int totalN = examples.getN();
            
            if (totalP + totalN == 0) {
                remainder += 0;
            } else {
                remainder += (((double)p+(double)n)/((double)totalP+(double)totalN)) 
                        * findEntropy(listOfExampleSubsets.get(k-1));
            }
        }
        
        return remainder;
    }
    
    /**
     * Finds the Attribute with the max information gain or importance.
     * @param attributes
     * @return Returns an Attribute with the most information gain.
     */
    static private Attribute argmax(SetOfAttributes attributes) {
        double max = Double.MIN_VALUE;
        int index = 0;
        
        for (int i = 0; i < attributes.size(); i++) {
            double infomationGain = attributes.get(i).getInformationGain();
            if (infomationGain > max) {
                max = infomationGain;
                index = i;
            }
        }
        
        return attributes.get(index);
    }
    
    /**
     * Selects the most common output value among a set of examples, breaking ties randomly. <br><br>
     * 
     * "p" represents the amount of positive examples in the set {@code examples}.<br>
     * "n" represents the amount of negative examples in the set {@code examples}.
     * 
     * @param examples - A set of examples. (A set of {@code Example} objects)
     * @return Returns a Decision Tree with a classification of POSITIVE if {@code examples} has (p > n). <br>
     * Returns a Decision Tree with a classification of NEGATIVE if {@code examples} has (p < n). <br>
     * 
     */
    static private DecisionTree pluralityValue(SetOfExamples examples) {
        
        Random rand = new Random();
        
        DecisionTree dTree = new DecisionTree();
        LinkedList<String> listOfValues = new LinkedList<>();
        
        // Case 1: If null (If there are NO examples to use), return a tree with a random classification.
        //      A null is possible in the case where "parent_examples" is null (or where "examples" has no parent).
        if (examples == null) {
            
            // dTreeLearnAlg.properties.size() = 22 for the mushrooms.
            double r = rand.nextDouble();
            if (r < 0.5) {
                listOfValues.add("POS");
                dTree.addChildNode(0, new Attribute(dTreeLearnAlg.properties.size(), "POS", listOfValues));
            } else {
                listOfValues.add("NEG");
                dTree.addChildNode(0, new Attribute(dTreeLearnAlg.properties.size(), "NEG", listOfValues));
            }
        } 
        
        // Case 2: If there are examples to use, then return a tree with a classification of POSITIVE --> POS (if p > n), or NEGATIVE --> NEG (if p < n).
        // If a tie occurs (p == n), then choose a random classification.
        //
        //      NOTE:
        //          p = The amount of Positive Examples in the set "examples".
        //          n = The amount of Negative Examples in the set "examples".
        else {
        
            // Get the number of positive and negative examples.
            int p = examples.getP();
            int n = examples.getN();
            
            // (p > n)
            if (p > n) {
                listOfValues.add("POS");
                dTree.addChildNode(0, new Attribute(dTreeLearnAlg.properties.size(), "POS", listOfValues));
            // (p < n)
            } else if (p < n) {
                listOfValues.add("NEG");
                dTree.addChildNode(0, new Attribute(dTreeLearnAlg.properties.size(), "NEG", listOfValues));
            // (p == n)
            } else {
                double r = rand.nextDouble();
                if (r < 0.5) {
                    listOfValues.add("POS");
                    dTree.addChildNode(0, new Attribute(dTreeLearnAlg.properties.size(), "POS", listOfValues));
                } else {
                    listOfValues.add("NEG");
                    dTree.addChildNode(0, new Attribute(dTreeLearnAlg.properties.size(), "NEG", listOfValues));
                }
            }
        }
        
        return dTree;
    }
    
}
