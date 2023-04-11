import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

/**
 * Project Name:    Assignment 1        <br>
 * File Name:       Driver.java         <br>
 * Description:     This Driver Class simulates the mini-batch gradient descent algorithm 
 *      for multiple linear regression and polynomial regression (excluding interaction terms) 
 *      and implements k-fold cross-validation to aid in tuning model hyperparameters. </b></b>
 * 
 * Date Created:    9/26/22             <br>
 * Date Modified:   9/30/22             <br>
 * Class:           CS457 (Fall 2022)   <br>
 * 
 * Flags:
 * <ul>
 *      <li> -f 'FILENAME'  : Reads training data from the file named 'FILENAME' (specified as a String).
 *      <li> -k 'INTEGER'   : Specifies the number of folds for k-fold cross-validation; default is 5; using
 *                              option -k 1 trains a model on the full data set (see the Output section 
 *                              for more details).
 *      <li> -d 'INTEGER'   : Specifies the smallest polynomial degree to evaluate; default is 1.
 *      <li> -D 'INTEGER'   : Specifies the largest polynomial degree to evaluate; 
 *                              if not specified, then only evaluate one degree 
 *                              (the degree value specified through the -d flag or its default value).
 *      <li> -a 'DOUBLE'    : Specifies the learning rate in mini-batch gradient descent; default is 0.005.
 *      <li> -e 'INTEGER'   : Specifies the epoch limit in mini-batch gradient descent; default is 10000.
 *      <li> -m 'INTEGER'   : Specifies the batch size in mini-batch gradient descent; default is 0, which 
 *                              should be interpreted as specifying full batch gradient descent.
 *      <li> -v 'INTEGER'   : Specifies a verbosity level, indicating how much output the program should 
 *                              produce; default is 1 (see the Output section for details).
 *  </ul>
 *  
 * @version 1.0
 * @author Kong Jimmy Vang
 */
public class Driver {

    // Initial default values.
    static String      fileName                = null;                 // flag -f
    static int         k                       = 5;                    // flag -k
    static int         smallestPolyDegree      = 1;                    // flag -d
    static int         largestPolyDegree       = smallestPolyDegree;   // flag -D
    static double      alpha                   = 0.005;                // flag -a
    static int         epochLimit              = 10000;                // flag -e
    static int         batchSize               = 0;                    // flag -m
    static int         verbosityLevel          = 1;                    // flag -v
    
    /**
     * Takes a data set and augments it for Multiple Linear Regression with a given Polynomial Degree.
     * @param degree - polynomial degree
     * @param dataSet - the data set to be augmented
     * @return Returns a data set augmented for Multiple Linear Regression.
     */
    public static DataSet<Double> augmentDataSet(final int degree, DataSet<Double> dataSet) {
        DataSet<Double> augmentedDataSet = new DataSet<>();
        for (ArrayList<Double> data : dataSet) 
        {
            ArrayList<Double> newData = new ArrayList<>();
            newData.add(1.0);
            for (int j = 1; j <= degree; j++) 
            {
                for (int i = 0; i < data.size() - 1; i++) 
                {
                    newData.add( Math.pow(data.get(i), j) );
                }
            }
            newData.add( data.get(data.size() - 1) );
            augmentedDataSet.add(newData);
        }
        return augmentedDataSet;
    }
    
    /**
     * Main method.
     * @param args - command-line arguments
     * @throws Exception Thrown if illegal arguments are found or files related issues occurred.
     */
    public static void main(String[] args) throws Exception
    {
        //*** DEBUG: Showing command-line args ***
        //System.out.println("\r\nDEBUG: Showing command-line args (arguments)");
        //System.out.println(Arrays.toString(args));
        
        ArrayList<String> strArgs = new ArrayList<>();
        strArgs.add(args[0]);
        
        // Process command-line arguments.
        String tempStr = "";
        try {
            for (int i = 0; i < args.length; i++)
            {
                tempStr = args[i];
                switch (tempStr) 
                {
                    case "-f":
                        if (i+1 < args.length) {
                            fileName = args[i+1];
                        } else {
                            System.err.println("\r\nThe flag, -f must be a valid FILE-LOCATION. Example: -f 'FILE_LOCATION'\r\n");
                            System.exit(-1);
                        }
                        break;
                    case "-k":
                        if (i+1 < args.length) {
                            k = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println("\r\nThe flag, -k must be a valid integer. Example: -k 'INTEGER'\r\n");
                            System.exit(-1);
                        }
                        break;
                    case "-d":
                        if (i+1 < args.length) {
                            smallestPolyDegree = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println("\r\nThe flag, -d must be a valid integer. Example: -d 'INTEGER'\r\n");
                            System.exit(-1);
                        }
                        break;
                    case "-D":
                        if (i+1 < args.length) {
                            largestPolyDegree = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println("\r\nThe flag, -D must be a valid integer. Example: -D 'INTEGER'\r\n");
                            System.exit(-1);
                        }
                        break;
                    case "-a":
                        if (i+1 < args.length) {
                            alpha = Double.parseDouble(args[i+1]);
                        } else {
                            System.err.println("\r\nThe flag, -a must be a valid double. Example: -a 'DOUBLE'\r\n");
                            System.exit(-1);
                        }
                        break;
                    case "-e":
                        if (i+1 < args.length) {
                            epochLimit = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println("\r\nThe flag, -e must have a valid integer. Example: -e 'INTEGER'\r\n");
                            System.exit(-1);
                        }
                        break;
                    case "-m":
                        if (i+1 < args.length) {
                            batchSize = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println("\r\nThe flag, -m must have a valid integer. Example: -m 'INTEGER'\r\n");
                            System.exit(-1);
                        }
                        break;
                    case "-v":
                        if (i+1 < args.length) {
                            verbosityLevel = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println("\r\nThe flag, -v must have a valid integer. Example: -v 'INTEGER'\r\n");
                            System.exit(-1);
                        }
                        break;
                }
            }
        } catch (NumberFormatException e) {
            System.err.println(String.format("\r\nERROR: Illegal argument parsed for flag %s  "
                                            + " ==> %s\r\n", tempStr, e.getMessage()) );
            System.exit(-1);
            //throw e;
        }
        
        //=== Guard Clauses against invalid arguments. ===
        // Null filename or filename not specified.
        if (fileName == null) {
            System.err.println("\r\nERROR: The file name was not specified with flag -f. Required flag: -f 'FILE_LOCATION'");
            System.exit(-1);
        }
        // Warn user about an illegal argument for flag -k.
        if (k <= 0) {
            System.err.println(
                    String.format("\r\n\r\n"
                            + "ERROR: The arg for -k,"
                            + " the number of folds for k-fold cross-validation (k = %d),"
                            + " cannot be a zero or a negative integer."
                            + "\r\n", k));
            System.exit(-1);
        }
        // Warn user about an illegal argument for flag -d.
        if (smallestPolyDegree < 0) {
            System.err.println(
                    String.format("\r\n\r\n"
                            + "ERROR: The arg for -d, the smallest polynomial degree (d = %d),"
                            + " must be greater than or equal to 1."
                            + "\r\n", smallestPolyDegree));
            System.exit(-1);
        }
        // Warn user about an illegal argument for flag -v.
        if (verbosityLevel < 1 || verbosityLevel > 4) {
            System.err.println(
                    String.format("\r\n\r\n"
                            + "ERROR: The arg for -v, the verbosity level (d = %d),"
                            + " must be inclusively between 1 and 4. (1 being the least verbose)"
                            + "\r\n", verbosityLevel));
            System.exit(-1);
        }
        // Set largest to smallest if true
        if (smallestPolyDegree > largestPolyDegree) {
            largestPolyDegree = smallestPolyDegree;
        }
        
        //=== Load full data set from the given file. ===
        File file = new File(fileName);
        Scanner s = new Scanner(file);
        
        DataSet<Double> dataSet = new DataSet<>();
        
        try {
            while (s.hasNextLine()) {
                String line = s.nextLine();
                
                // Check for comments and ignore comments
                if (line.contains("#") || line.isEmpty()) {
                    continue;
                }
                // Parse for attributes and output.
                String[] lineSplit = line.split(" ");
                
                ArrayList<Double> values = new ArrayList<>();
                
                for (int i = 0; i < lineSplit.length; i++) {
                    values.add( Double.parseDouble( lineSplit[i] ) );
                }
                
                dataSet.add( values );
                
                //System.out.println(line);
            }
        } catch (Exception e) {
            // If an exception occurs, safely close the Scanner first before throwing the Exception.
            s.close();
            throw e;
        } finally {
            // If all is well, close the Scanner as it is no longer needed.
            s.close();
        }
        
        //*** DEBUG: Showing Full Data Set. ***
        //System.out.println("\r\nDEBUG: Showing Full Data Set");
        //System.out.println(dataSet);
        
        // SHUFFLE DATASET
        Collections.shuffle(dataSet);
        
        //*** DEBUG: Showing Shuffled Full Data Set. ***
        //System.out.println("\r\nDEBUG: Showing Shuffled Full Data Set");
        //System.out.println(dataSet);
        
        //=== SPLIT full data set into k FOLDS ===
        ArrayList<DataSet<Double>> dataSetFolds = new ArrayList<>();
        
        int divisor;
        if (k <= 1) {
            divisor = dataSet.size();
        } else {
            divisor = dataSet.size() / k;
        }
        
        DataSet<Double> tempDataSet = new DataSet<Double>();
        int tempK = 0;
        for (int i = 0; i < dataSet.size(); i++) 
        {
            // add data to fold set
            tempDataSet.add(dataSet.get(i));
            
            if ( i % divisor == divisor - 1) 
            {
                // increment to next k
                dataSetFolds.add(tempDataSet);
                
                tempDataSet = new DataSet<Double>();
                tempK++;
            }
        }
        // If there is extra data, add the extra training data to the last Fold in the list of folds.
        if (!tempDataSet.isEmpty()) {
            dataSetFolds.get(dataSetFolds.size() - 1).addAll(tempDataSet);
        }
        
        if (tempK < k) {
            throw new Exception("ERROR: There is not enough training data in the input file for k-fold splitting.");
        }
        
        //*** DEBUG: Showing Folds. ***
        /* int debugCount = 0;
        System.out.println("\r\nDEBUG: Showing Folds and Test Set");
        for (DataSet<Double> dataSetFold : dataSetFolds) {
            System.out.print(String.format("Fold %d: ", debugCount));
            System.out.println(dataSetFold);
            debugCount++;
        }
        System.out.println(); //*/
        
        //*** LOG ***
        if (Driver.verbosityLevel >= 1)
        {
            if (k <= 1) {
                System.out.println("Skipping cross-validation.");
            } else {
                System.out.println(String.format("Using %d-fold cross-validation", k));
            }
        }
        
        // Prepare original size for model.
        int originalInputSize = dataSet.getAttributeSize();
        
        //=== For each degree d, do... ===
        for (int d = smallestPolyDegree; d <= largestPolyDegree; d++) 
        {
            //*** LOG ***
            if (Driver.verbosityLevel >= 1) {
                System.out.println(String.format("----------------------------------"));
                System.out.println(String.format("* Using model of degree %d", d));
            }
            
            // Create model
            Model model = new Model(originalInputSize, d);
            
            // Set up error values
            double avgTrainingError = 0;
            double avgValidationError = 0;
            
            //=== For each fold, do... ===
            for (int f = 0; f < dataSetFolds.size(); f++) 
            {
                //*** LOG ***
                if (Driver.verbosityLevel >= 1)
                    System.out.println(String.format("  * Training on all data except Fold %d:", f+1));
                
                // Augment data sets with polynomial degree 'd', exclude Fold f.
                DataSet<Double> augmentedFolds = new DataSet<>();
                for (int f2 = 0; f2 < dataSetFolds.size(); f2++) 
                {
                    if (k <= 1) 
                    {
                        augmentedFolds.addAll(augmentDataSet(d, dataSetFolds.get(f2)));
                    } 
                    else 
                    {
                        if (f2 == f) {
                            continue;
                        } else {
                            augmentedFolds.addAll(augmentDataSet(d, dataSetFolds.get(f2)));
                        }
                    }
                }
                // SHUFFLE AUGMENTED FOLDS
                Collections.shuffle(augmentedFolds);
                
                //*** DEBUG: Showing Augmented Fold ***
                //System.out.println("\r\n    DEBUG: Showing Augmented Fold");
                //System.out.println("    " + augmentedFolds + "\r\n");
                
                // Set model inputs to the augmented folds attribute size.
                model.setNumOfInputs(augmentedFolds.getAttributeSize());
                
                //=== Perform mini-batch gradient descent. ===
                model.miniBatchGradientDescent(augmentedFolds, alpha, batchSize, epochLimit);
                
                //=== Get validation error. ===
                double validationError;
                if (k <= 0) {
                    validationError = model.getValidationError(augmentedFolds);
                } else {
                    validationError = model.getValidationError(augmentDataSet(d, dataSetFolds.get(f)));
                }
                
                //=== Get average errors. ===
                avgTrainingError += model.getTrainingCost();
                avgValidationError += validationError;
                
                //*** LOG ***
                if (Driver.verbosityLevel >= 1) {
                    System.out.println(String.format("    Training and validation errors:      %f      %f", model.getTrainingCost(), validationError));
                    System.out.println();
                }
            }
            
            avgTrainingError /= (double) dataSetFolds.size();
            avgValidationError /= (double) dataSetFolds.size();
            
            //*** LOG ***
            if (Driver.verbosityLevel >= 1) {
                if (k > 1) {
                    System.out.println(String.format("  * Average errors across the folds:     %f      %f", avgTrainingError, avgValidationError));
                }
                System.out.println();
            }
        }
        
        //System.out.println("*** END ***");
    }
}
