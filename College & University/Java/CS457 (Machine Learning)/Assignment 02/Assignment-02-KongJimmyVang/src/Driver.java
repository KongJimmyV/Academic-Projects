import java.io.File;
import java.util.LinkedHashMap;
//import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

/**
 * Project Name:    Assignment 2        <br>
 * File Name:       Driver.java         <br>
 * Description:     This Driver Class simulates decision trees, the training process, 
 *                      and evaluates their performance. <br><br>
 * 
 * Date Created:    10/10/22            <br>
 * Date Modified:   10/27/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * Argument Flags:
 * <ul>
 *      <li> -f 'FILENAME'  : Reads training data from the file named 'FILENAME' (specified as a String).
 *      <li> -b 'INTEGER'   : Specify the base training group size; default is 10.
 *      <li> -i 'INTEGER'   : Specify the increment in training group size; default is 10.
 *      <li> -l 'INTEGER'   : Specify the limit for training group size; default is 100.
 *      <li> -t 'INTEGER'   : Sets the number of trials to perform at each training group size; default is 20.
 *      <li> -d 'INTEGER'   : Specifies the maximum depth limit to be used when building the decision tree; 
 *                              if unspecified, then no limit is used.
 *      <li> -v 'INTEGER'   : Specifies a verbosity level from 1 to 5, indicating how much output the program should 
 *                              produce; default is 1.
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
        //System.out.println("\r\nDEBUG: Showing command-line args (arguments)");
        //System.out.println(Arrays.toString(args));
        
        //============================================
        //====== Process command-line arguments ======
        
        // Attempt to parse arguments.
        Args arguments = parseArgs(args);
        
        //====== Load full data set from the given file. ======
        final File file = new File(arguments.fileName);
        final Scanner scanner = new Scanner(file);
        
        final LinkedHashMapSet<String> mapSetDataSet = new LinkedHashMapSet<>();
        final LinkedHashMapSet<String> mapSetAttributes = new LinkedHashMapSet<>();
        final LinkedHashMap<Integer, String> mapAttributeNames = new LinkedHashMap<>();
        final LinkedHashMap<String, String> mapClasses = new LinkedHashMap<>();
        
        try 
        {
            // Parse the number of attributes, p.
            arguments.p = parseP(scanner);
            
            // Parse the attributes.
            parseAttributes(arguments, scanner, mapSetAttributes, mapAttributeNames);
            
            // Parse the Output Classes.
            parseOutputClasses(scanner, mapClasses);
            
            // Parse the Records.
            parseRecords(scanner, mapSetDataSet);
        } 
        catch (Exception e) 
        {
            // If an exception occurs, safely close the Scanner first before throwing the Exception for Main to handle.
            scanner.close();
            throw e;
        } 
        finally 
        {
            // If all is well, close the Scanner as it is no longer needed.
            scanner.close();
        }
        
        if (arguments.verbosityLevel >= 5) {
            //*** DEBUG: Showing variable p, number of attributes ***
            System.out.println("\r\nDEBUG: Showing variable p, number of attributes");
            System.out.println(String.format("==> %d", arguments.p));
            
            //*** DEBUG: Showing Full Data Set. ***
            System.out.println("\r\nDEBUG: Showing Full Data Set");
            System.out.println(String.format("==> %s", mapSetDataSet));
            
            //*** DEBUG: Showing Output Classes. ***
            System.out.println("\r\nDEBUG: Showing Output Classes");
            System.out.println(String.format("==> %s", mapClasses));
            
            //*** DEBUG: Showing Attributes. ***
            System.out.println("\r\nDEBUG: Showing Attributes");
            System.out.println(String.format("==> %s", mapSetAttributes));
            System.out.println(String.format("==> Map Set Attributes Size = %d", mapSetAttributes.size()));
            System.out.println();
        }
        
        /* ====== For Each Training Group, 
         * ====== perform training, predict, and calculate accuracies with Decision Trees. ====== */
        performDecisionTreeLearning(arguments, mapSetDataSet, mapSetAttributes, mapAttributeNames, mapClasses);
        
        if (arguments.verbosityLevel >= 5) {
            System.out.println("\r\n*** END PROGRAM ***");
        }
    }
    
    /**
     * Parse command-line arguments.
     * @param args - a String array of command line inputs.
     * @return Returns a class object <code>Args</code> that stores the command line arguments.
     */
    public static Args parseArgs(String[] args) 
    {
        Args arguments = new Args();
        
        // This HashSet is to prevent duplicate flags.
        HashSet<String> flagHashSet = new HashSet<>();
        
        // Temporary String for logging purposes.
        String tempStr = "";
        
        try 
        {
            for (int i = 0; i < args.length; i++)
            {
                // Set Temporary String.
                tempStr = args[i];
                
                // This is for preventing repeated flags.
                if (flagHashSet.contains(tempStr)) 
                {
                    System.err.println(
                            String.format("\r\nERROR: Flag %s was parsed multiple times. Cannot have duplicate flags in the command-line arguments.", tempStr) );
                    System.exit(-1);
                }
                
                // Flag Cases
                switch (tempStr) 
                {
                    case "-f":
                        if (i+1 < args.length) {
                            flagHashSet.add(tempStr);
                            arguments.fileName = args[i+1];
                        } else {
                            System.err.println(String.format("\r\nThe flag, %s must be a valid FILE-LOCATION. Example: %s 'FILE_LOCATION'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-b":
                        if (i+1 < args.length) {
                            flagHashSet.add(tempStr);
                            arguments.baseTrainingGroup = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println(String.format("\r\nThe flag, %s must be a valid integer. Example: %s 'INTEGER'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-i":
                        if (i+1 < args.length) {
                            flagHashSet.add(tempStr);
                            arguments.increment = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println(String.format("\r\nThe flag, %s must be a valid integer. Example: %s 'INTEGER'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-l":
                        if (i+1 < args.length) {
                            flagHashSet.add(tempStr);
                            arguments.limit = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println(String.format("\r\nThe flag, %s must be a valid integer. Example: %s 'INTEGER'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-t":
                        if (i+1 < args.length) {
                            flagHashSet.add(tempStr);
                            arguments.trials = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println(String.format("\r\nThe flag, %s must be a valid integer. Example: %s 'INTEGER'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-d":
                        if (i+1 < args.length) {
                            flagHashSet.add(tempStr);
                            arguments.depthLimit = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println(String.format("\r\nThe flag, %s must be a valid integer. Example: %s 'INTEGER'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-v":
                        if (i+1 < args.length) {
                            flagHashSet.add(tempStr);
                            arguments.verbosityLevel = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println(String.format("\r\nThe flag, %s must be a valid integer. Example: %s 'INTEGER'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-s":
                        if (i+1 < args.length) {
                            flagHashSet.add(tempStr);
                            arguments.splitLimit = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println(String.format("\r\nThe flag, %s must be a valid integer. Example: %s 'INTEGER'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-p":
                        flagHashSet.add(tempStr);
                        arguments.printTreeBool = true;
                        break;
                    default:
                        // Prevents invalid flags
                        if (tempStr.charAt(0) == '-') {
                            System.err.println(String.format("\r\nERROR: Invalid flag argument --> %s  ", tempStr));
                            System.exit(-1);
                        }
                }
            }
        } catch (NumberFormatException e) {
            System.err.println(String.format("\r\nERROR: Invalid argument parsed for flag %s  "
                                            + " ==> %s\r\n", tempStr, e.getMessage()) );
            System.exit(-1);
        }
        
        //=== Guard Clauses against invalid arguments. ===
        // Null filename or filename not specified.
        if (arguments.fileName == null) {
            System.err.println("\r\nERROR: The file name was not specified with flag -f. Required flag: -f 'FILE_LOCATION'");
            System.exit(-1);
        }
        
        // Warn user about an invalid argument for flag -v.
        int minV = 1, maxV = 5;
        if (arguments.verbosityLevel < minV || arguments.verbosityLevel > maxV) {
            System.err.println(
                    String.format("\r\n\r\n"
                            + "ERROR: The arg for -v, the verbosity level (d = %d),"
                            + " must be inclusively between %d and %d. (1 being the least verbose)"
                            + "\r\n", arguments.verbosityLevel, minV, maxV));
            System.exit(-1);
        }
        
        // Warn user about having a limit, l, smaller than the base training group size, b.
        if (arguments.limit < arguments.baseTrainingGroup) {
            System.err.println(
                    String.format("WARNING: The training group size limit, l, is less than the base training group size, b. "
                            + "\r\n   In short, l < b   (l=%d < b=%d).\r\n"
                            + "\r\n   This will not run any training processes at all."
                            + "\r\n   It is recommended to set -l to be larger than -b.", 
                            arguments.limit, arguments.baseTrainingGroup));
        }
        return arguments;
    }
    
    public static int parseP(Scanner scanner) {
        int p = 0;
        while (scanner.hasNextLine()) 
        {
            String line = scanner.nextLine();
            
            // Ignore comments
            if (containsCommentOrEmptyLine(line)) {
                continue;
            }
            
            p = Integer.parseInt(line);
            break;
        }
        return p;
    }
    
    public static void parseAttributes(Args arguments, 
                                      Scanner scanner, 
                                      LinkedHashMapSet<String> mapSetAttributes,
                                      LinkedHashMap<Integer, String> mapAttributeNames) {
        for (int i = 0; i < arguments.p && scanner.hasNextLine(); i++) 
        {
            String line = scanner.nextLine();
            
            // Ignore comments
            if (containsCommentOrEmptyLine(line)) {
                i--;
                continue;
            }
            
            // Parse attribute.
            LinkedHashMap<Integer, String> mapAttributeValues = new LinkedHashMap<>();
            
            String[] lineSplit = line.split(":");
            String tempAttributeName = lineSplit[0].trim();
            String tempAttributeValues = lineSplit[1].trim();
            String[] values = tempAttributeValues.split(" ");
            
            for (int j = 0; j < values.length; j++) 
            {
                mapAttributeValues.put(j, values[j]);
            }
            
            mapSetAttributes.put(i, mapAttributeValues);
            mapAttributeNames.put(i, tempAttributeName);
        }
    }
    
    public static void parseOutputClasses(Scanner scanner, LinkedHashMap<String, String> mapClasses) {
        while (scanner.hasNextLine()) 
        {
            String line = scanner.nextLine();
            
            // Ignore comments
            if (containsCommentOrEmptyLine(line)) {
                continue;
            }
            
            line = line.replaceFirst(":", "").trim();
            String[] lineSplit = line.split(" ");
            
            for (int j = 0; j < lineSplit.length; j++) 
            {
                String[] strSplit = lineSplit[j].split("=");
                mapClasses.put(strSplit[0], strSplit[1]);
            }
            break;
        }
    }
    
    public static void parseRecords(Scanner scanner, LinkedHashMapSet<String> mapSetDataSet) {
        int i = 0;
        while (scanner.hasNextLine()) 
        {
            String line = scanner.nextLine();
            
            // Ignore comments
            if (containsCommentOrEmptyLine(line)) {
                continue;
            }
            
            String[] lineSplit = line.split(" ");
            
            LinkedHashMap<Integer, String> data = new LinkedHashMap<>();
            
            for (int j = 0; j < lineSplit.length; j++) {
                data.put(j, lineSplit[j].trim());
            }
            mapSetDataSet.put(i++, data);
        }
    }
    
    /**
     * Perform learning and predictions on a tree with given arguments and data sets.
     * @param arguments - command-line arguments object
     * @param mapSetDataSet - data set
     * @param mapSetAttributes - set of attributes
     * @param mapAttributeNames - map of attribute names from integer to string
     * @param mapClasses - map of class outputs
     */
    public static void performDecisionTreeLearning(final Args arguments,
                                  final LinkedHashMapSet<String> mapSetDataSet, 
                                  final LinkedHashMapSet<String> mapSetAttributes,
                                  final LinkedHashMap<Integer, String> mapAttributeNames,
                                  final LinkedHashMap<String, String> mapClasses) 
    {
        //====== Build the decision tree model. ======
        DecisionTree decisionTree = new DecisionTree(arguments.depthLimit, 
                                                     arguments.splitLimit, 
                                                     arguments.verbosityLevel, 
                                                     mapAttributeNames, 
                                                     mapClasses);
        
        //====== Training/Trial Process + Validation Process ======
        for (int trainSize = arguments.baseTrainingGroup; 
                 trainSize <= arguments.limit; 
                 trainSize = trainSize + arguments.increment) 
        {
            if (arguments.verbosityLevel >= 1) {
                System.out.println(String.format("----------------------------------"));
                System.out.println(String.format("* Using training group of size %d", trainSize));
            }
            
            // *** WARNING: Training Size > Full Data Set Size ***
            if (trainSize > mapSetDataSet.size()) {
                System.err.println(
                        String.format("  !!! WARNING: Training Size = %d, Full Data Set Size = %d."
                                + "\r\n    ==> The training size is larger than the full data set size."
                                + "\r\n    ==> This may potentially cause odd/strange behavior in the learning process.", 
                                trainSize, mapSetDataSet.size()));
            }
            
            double avgTrainingAccuracy = 0;
            double avgValidationAccuracy = 0;
            
            for (int trial = 1; trial <= arguments.trials; trial++) 
            {
                if (arguments.verbosityLevel >= 2) {
                    System.out.println(String.format("  * Trial %d:", trial));
                }
                
                //=== Create a training set by taking a random subset of appropriate size from the full data
                LinkedHashMapSet<String> trainingDataSet = new LinkedHashMapSet<>();
                LinkedHashMapSet<String> validationDataSet = new LinkedHashMapSet<>();
                validationDataSet.putAll(mapSetDataSet);
                
                // Put "trainSize" amounts of data into the training set.
                //      Do this by removing random sets of data from the validation set.
                Random r = new Random();
                for (int i = 0; i < trainSize; i++) 
                {
                    if (validationDataSet.size() > 0) 
                    {
                        trainingDataSet.add( validationDataSet.remove( r.nextInt(validationDataSet.size()) ) );
                    }
                }
                
                //====== Fit a decision tree on the training set ======
                decisionTree.decisionTreeLearn(trainingDataSet, 
                                               mapSetAttributes);
                
                /*====== Compute the accuracy of the fitted tree on both the training and validation sets 
                 *======   (the validation set is all data not used for training). */
                double trainingAccuracy = calculateAccuracy(decisionTree, trainingDataSet);
                double validationAccuracy = calculateAccuracy(decisionTree, validationDataSet);
                
                // Print training and validation accuracy.
                if (arguments.verbosityLevel >= 2) {
                    System.out.print(  String.format("    Training and validation accuracy:"));
                    System.out.print(  String.format("      %f", trainingAccuracy));
                    System.out.print(  String.format("      %f\r\n", validationAccuracy));
                    System.out.println();
                }
                
                // Sum accuracies to prepare for averaging.
                avgTrainingAccuracy += trainingAccuracy;
                avgValidationAccuracy += validationAccuracy;
            }
            
            // Calculate average accuracies across every trial performed.
            avgTrainingAccuracy /= arguments.trials;
            avgValidationAccuracy /= arguments.trials;
            
            //====== Report summary statistics across trials ======
            if (arguments.verbosityLevel >= 1) {
                System.out.println(String.format("  * Average accuracy across %d trials:", arguments.trials));
                System.out.print(  String.format("    Training and validation accuracy:"));
                System.out.print(  String.format("      %f", avgTrainingAccuracy));
                System.out.print(  String.format("      %f\r\n", avgValidationAccuracy));
                System.out.println();
            }
        }
        // Print the last decision tree built in the last trial if flag -p is set.
        if (arguments.printTreeBool) {
            System.out.println(String.format("----------------------------------"));
            System.out.print(  String.format("* Final decision tree:"));
            System.out.print(  String.valueOf(decisionTree));
        }
    }
    
    /**
     * Calculate the prediction accuracy of the given decision tree for a given data set.
     * @param decisionTree - decision tree
     * @param dataSet - data set
     * @return Returns the accuracy of the given decision tree
     */
    public static double calculateAccuracy(final DecisionTree decisionTree, 
                                           final LinkedHashMapSet<String> dataSet) {
        long correctNumOfOutputs = 0;
        
        // data set predictions and accuracy
        correctNumOfOutputs = 0;
        for (Map.Entry<Integer, LinkedHashMap<Integer, String>> set : dataSet.entrySet()) 
        {
            LinkedHashMap<Integer, String> data = set.getValue();
            
            String correctOutput = data.get(data.size() - 1);
            String predictedOutput = decisionTree.decisionTreePredict(data);
            if (correctOutput.equals(predictedOutput)) {
                correctNumOfOutputs++;
            }
        }
        
        if (dataSet.size() == 0) {
            return 0;
        } else {
            return (double) correctNumOfOutputs / (double) dataSet.size();
        }
    }
    
    /**
     * Returns true if a comment is detected in the line;
     * @param line
     * @return
     */
    public static boolean containsCommentOrEmptyLine(String line) {
        if (line.contains("#") || line.isEmpty()) {
            return true;
        }
        return false;
    }
}
