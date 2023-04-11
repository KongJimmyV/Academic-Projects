import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * Project Name:    Assignment 3        <br>
 * File Name:       Args.java           <br>
 * Description:     This Args class stores command-line argument information about the program that will use it.
 *                      Can be modified with more arguments to store if needed. <br><br>
 * 
 * Date Created:    10/10/22            <br>
 * Date Modified:   11/26/22            <br>
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
 * @author Kong Jimmy Vang
 */
public class Args 
{
    //======================================================================
    //=== Variables ===
    
    //--- Flag arguments ---
    protected String                fileName;               // flag -f
    protected List<Integer>         hiddenLayers;           // flag -h
    protected double                alpha;                  // flag -a
    protected int                   epochLimit;             // flag -e
    protected int                   batchSize;              // flag -m
    protected double                regularizationLambda;   // flag -l
    protected boolean               bRandomization;         // flag -r
    protected double                weightInitEpsilon;      // flag -w
    protected ActivationFunction    activationFunction;     // flag -g
    protected int                   verbosityLevel;         // flag -v
    
    //--- Non-Flag arguments ---
    final protected int MIN_VERBOSITY = 1; 
    final protected int MAX_VERBOSITY = 5;
    
    //======================================================================
    //=== Constructors ===
    public Args() 
    {
        this(null);
    }
    
    public Args(String[] args) 
    {
        this.setDefaultValues();
        if (null != args) {
            this.parseArgs(args);
            this.guardParseArgs();
        }
    }
    
    //======================================================================
    //=== Methods ===
    private void setDefaultValues() {
        // Flag Initial Default Values
        this.fileName               = null;
        this.hiddenLayers           = new ArrayList<>();
        this.alpha                  = 0.01;
        this.epochLimit             = 1000;
        this.batchSize              = 1;
        this.regularizationLambda   = 0.0;
        this.bRandomization         = false;
        this.weightInitEpsilon      = 0.1;
        this.activationFunction     = new ActivationFunctionLogistic();
        this.verbosityLevel         = 1;
        
        // Non-Flag Initial Default Values
        //      N/A
    }
    
    /**
     * Parse command-line arguments.
     * @param args - a String array of command line inputs.
     * @return Returns a class object <code>Args</code> that stores the command line arguments.
     */
    public void parseArgs(String[] args) 
    {
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
                        try {
                            flagHashSet.add(tempStr);
                            this.fileName = args[i+1];
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid FILE-LOCATION. Example: %s 'FILE_LOCATION'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-h":
                        Integer numOfHiddenLayers = Integer.parseInt(args[i+1]);
                        for (int j = i + 2; j < numOfHiddenLayers + i + 2; j++) {
                            try 
                            {
                                Integer parsedInt = Integer.parseInt(args[j]);
                                this.hiddenLayers.add(parsedInt);
                            }
                            catch (NumberFormatException e)
                            {
                                if (!args[j].contains("-")) {
                                    System.err.println(
                                            String.format(
                                                    "\r\nEXCEPTION THROWN: Invalid arguments parsed for flag %s.\r\n\r\n"
                                                    + "One or More Valid Integer Arguments Required: \r\n"
                                                    + "    %s <NH> <S1> <S2> .. <SN>\r\n", tempStr, tempStr) );
                                    e.printStackTrace();
                                    System.exit(-1);
                                }
                                break;
                            }
                        }
                        break;
                    case "-a":
                        try {
                            flagHashSet.add(tempStr);
                            this.alpha = Double.parseDouble(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid double. Example: %s 'DOUBLE'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-e":
                        try {
                            flagHashSet.add(tempStr);
                            this.epochLimit = Integer.parseInt(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid integer. Example: %s 'INTEGER'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-m":
                        try {
                            flagHashSet.add(tempStr);
                            this.batchSize = Integer.parseInt(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid integer. Example: %s 'INTEGER'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-l":
                        try {
                            flagHashSet.add(tempStr);
                            this.regularizationLambda = Double.parseDouble(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid double. Example: %s 'DOUBLE'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-r":
                        flagHashSet.add(tempStr);
                        this.bRandomization = true;
                        break;
                    case "-w":
                        try {
                            flagHashSet.add(tempStr);
                            this.weightInitEpsilon = Double.parseDouble(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid double. Example: %s 'DOUBLE'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-g":
                        try {
                            flagHashSet.add(tempStr);
                            
                            // check for valid activation function string
                            switch (args[i+1]) {
                                case "logistic":
                                    this.activationFunction = new ActivationFunctionLogistic();
                                    break;
                                case "relu":
                                    this.activationFunction = new ActivationFunctionRelu(); 
                                    break;
                                case "softplus":
                                    this.activationFunction = new ActivationFunctionSoftplus(); 
                                    break;
                                case "tanh":
                                    this.activationFunction = new ActivationFunctionHyperbolicTanh(); 
                                    break;
                                default:
                                    throw new Exception(String.format("EXCEPTION: Invalid activation function for flag %s.", tempStr));
                            }
                        } catch (Exception e) {
                            System.err.println(
                                    String.format("\r\nThe flag, %s requires a valid name."
                                                + "  Example: %s 'NAME'\r\n", tempStr, tempStr));
                            System.err.println(
                                    String.format("=== Possible 'NAME' values ===\r\n"
                                                + "      logistic\r\n"
                                                + "      relu\r\n"
                                                + "      softplus\r\n"
                                                + "      tanh\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    case "-v":
                        if (i+1 < args.length) {
                            flagHashSet.add(tempStr);
                            this.verbosityLevel = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid integer. Example: %s 'INTEGER'\r\n", tempStr, tempStr));
                            System.exit(-1);
                        }
                        break;
                    default:
                        // Prevents invalid flags with no specifications.
                        if (tempStr.charAt(0) == '-') {
                            // check to make sure this is not a negative number.
                            try {
                                Double.parseDouble(tempStr);
                            } catch (Exception e) {
                                System.err.println(String.format("\r\nERROR: Invalid flag found in arguments: %s  \r\n", tempStr));
                                e.printStackTrace();
                                System.exit(-1);
                            }
                        }
                }
            }
        } catch (NumberFormatException e) {
            System.err.println(String.format("\r\nEXCEPTION THROWN: Invalid argument parsed for flag %s.\r\n"
                                            + "    ARGUMENT CAUSING EXCEPTION: %s\r\n", tempStr, e.getMessage()) );
            e.printStackTrace();
            System.exit(-1);
        }
    }
    
    /**
     * Guards this class against specified invalid Arguments.
     * Exits the program and warns the user about invalid arguments.
     */
    private void guardParseArgs() {
        // Null filename or filename not specified.
        if (this.fileName == null) {
            System.err.println("\r\nERROR: The file name was not specified with flag -f. Required flag: -f 'FILE_LOCATION'");
            System.exit(-1);
        }
        
        // Warn user about an invalid argument for flag -v.
        
        if (this.verbosityLevel < MIN_VERBOSITY || this.verbosityLevel > MAX_VERBOSITY) {
            System.err.println(
                    String.format("\r\n\r\n"
                            + "ERROR: The arg for -v, the verbosity level (d = %d),"
                            + " must be inclusively between %d and %d. (1 being the least verbose)"
                            + "\r\n", this.verbosityLevel, MIN_VERBOSITY, MAX_VERBOSITY));
            System.exit(-1);
        }
    }
}
