import java.util.HashSet;

/**
 * Project Name:    Assignment 4        <br>
 * File Name:       Args.java           <br>
 * Description:     This Args class stores command-line argument information about the program that will use it.
 *                      Can be modified with more arguments to store if needed. <br><br>
 * 
 * Date Created:    10/10/22            <br>
 * Date Modified:   12/13/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * Argument Flags:
 * <ul>
 *      <li> -f 'FILENAME': Reads training data from the file named 'FILENAME' (specified as a String).
 *      <li> -a 'DOUBLE':  Specifies the (initial) learning rate (step size) α ∈ [0, 1]; default is 0.9.
 *      <li> -e 'INTEGER': Specifies the (initial) policy randomness value ε ∈ [0, 1]; default is 0.9.
 *      <li> -g 'DOUBLE': Specifies the discount rate γ ∈ [0, 1] to use during learning; default is 0.9.
 *      <li> -na 'INTEGER': Specifies the value Nα which controls the decay of the learning rate (step size) α; default is 1000.
 *      <li> -ne 'INTEGER': Specifies the value Nε which controls the decay of the random action threshold ε; default is 200.
 *      <li> -p 'DOUBLE': Specifies the action success probability p ∈ [0, 1]; default is 0.8.
 *      <li> -q: Toggles the use of Q-Learning with off-policy updates (instead of SARSA with on-policy updates, which is the default).
 *      <li> -T 'INTEGER': Specifies the number of learning episodes (trials) to perform; default is 10000.
 *      <li> -u: Toggles the use of Unicode characters in printing; disabled by default.
 *      <li> -l 'DOUBLE': Specifies the λ parameter for eligibility trace decay; default is 0.0 
 *              (meaning that eligibility traces should not be used by default).
 *      <li> -w: Specifies that the agent should use a weighted sum of features to estimate Q values for each state-action pair 
 *              instead of maintaining these values in a table; disabled by default.
 *      <li> -v 'INTEGER': Specifies a verbosity level from 1 to 6, indicating how much output the program 
 *              should produce; default is 1.
 *              Verbosity 5 shows the initial environment, policy, and q values. 
 *              Verbosity 6 prints the policy at the end of each episode during the learning phase.
 * </ul>
 * 
 * @author Kong Jimmy Vang
 */
public class Args 
{
    //======================================================================
    //=== Variables ===
    
    //--- Flag arguments (with Default Values) ---
    protected String    fileName                        = null;     // flag -f
    protected double    aLearningRate                   = 0.9;      // flag -a
    protected double    ePolicyRandomness               = 0.9;      // flag -e
    protected double    gDiscountRate                   = 0.9;      // flag -g
    protected int       nLearningRateDecay              = 1000;     // flag -na
    protected int       nRandomActionThresholdDecay     = 200;      // flag -ne
    protected double    pActionSuccessProbability       = 0.8;      // flag -p
    protected boolean   bQLearning                      = false;    // flag -q
    protected int       tNumOfLearningEpisodes          = 10000;    // flag -T
    protected boolean   bUnicode                        = false;    // flag -u
    protected double    lEligibilityTraceDecay          = 0;        // flag -l
    protected boolean   bFeatureBasedLearning           = false;    // flag -w
    protected int       verbosityLevel                  = 1;        // flag -v
    
    //--- Non-Flag arguments (with Default Values) ---
    final protected int MIN_VERBOSITY = 1; 
    final protected int MAX_VERBOSITY = 6;
    
    //======================================================================
    //=== Constructors ===
    /**
     * Create this object with the default argument values.
     */
    public Args() 
    {
        this(null);
    }
    
    /**
     * Create this object and automatically parse the String array for valid arguments.
     * @param args - a String array of arguments
     */
    public Args(String[] args) 
    {
        if (null != args) {
            this.parseArgs(args);
            this.guardParseArgs();
        }
    }
    
    //======================================================================
    //=== Methods ===
    /**
     * Parse command-line arguments.
     * @param args - a String array of command line inputs.
     * @return Returns a class object <code>Args</code> that stores the command line arguments.
     */
    public void parseArgs(String[] args) 
    {
        // This HashSet is to prevent duplicate flags.
        HashSet<String> flagHashSet = new HashSet<>();
        
        // Current Argument String
        String curArgStr = "";
        
        try 
        {
            for (int i = 0; i < args.length; i++)
            {
                // Set Current Argument String.
                curArgStr = args[i];
                
                // This is for preventing repeated flags.
                if (flagHashSet.contains(curArgStr)) 
                {
                    System.err.println(
                            String.format("\r\nERROR: Flag %s was parsed multiple times. Cannot have duplicate flags in the command-line arguments.", curArgStr) );
                    System.exit(-1);
                }
                
                // Flag Cases
                switch (curArgStr) 
                {
                    case "-f":
                        try {
                            flagHashSet.add(curArgStr);
                            this.fileName = args[i+1];
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid FILE-LOCATION. Example: %s 'FILE_LOCATION'\r\n", curArgStr, curArgStr));
                            System.exit(-1);
                        }
                        break;
                    case "-a":
                        try {
                            flagHashSet.add(curArgStr);
                            this.aLearningRate = Double.parseDouble(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid double. Example: %s 'DOUBLE'\r\n", curArgStr, curArgStr));
                            System.exit(-1);
                        }
                        break;
                    case "-e":
                        try {
                            flagHashSet.add(curArgStr);
                            this.ePolicyRandomness = Double.parseDouble(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid double. Example: %s 'DOUBLE'\r\n", curArgStr, curArgStr));
                            System.exit(-1);
                        }
                        break;
                    case "-g":
                        try {
                            flagHashSet.add(curArgStr);
                            this.gDiscountRate = Double.parseDouble(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid double. Example: %s 'DOUBLE'\r\n", curArgStr, curArgStr));
                            System.exit(-1);
                        }
                        break;
                    case "-na":
                        try {
                            flagHashSet.add(curArgStr);
                            this.nLearningRateDecay = Integer.parseInt(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid integer. Example: %s 'INTEGER'\r\n", curArgStr, curArgStr));
                            System.exit(-1);
                        }
                        break;
                    case "-ne":
                        try {
                            flagHashSet.add(curArgStr);
                            this.nRandomActionThresholdDecay = Integer.parseInt(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid integer. Example: %s 'INTEGER'\r\n", curArgStr, curArgStr));
                            System.exit(-1);
                        }
                        break;
                    case "-p":
                        try {
                            flagHashSet.add(curArgStr);
                            this.pActionSuccessProbability = Double.parseDouble(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid double. Example: %s 'DOUBLE'\r\n", curArgStr, curArgStr));
                            System.exit(-1);
                        }
                        break;
                    case "-q":
                        flagHashSet.add(curArgStr);
                        this.bQLearning = true;
                        break;
                    case "-T":
                        try {
                            flagHashSet.add(curArgStr);
                            this.tNumOfLearningEpisodes = Integer.parseInt(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid integer. Example: %s 'INTEGER'\r\n", curArgStr, curArgStr));
                            System.exit(-1);
                        }
                        break;
                    case "-u":
                        flagHashSet.add(curArgStr);
                        this.bUnicode = true;
                        break;
                    case "-l":
                        try {
                            flagHashSet.add(curArgStr);
                            this.lEligibilityTraceDecay = Double.parseDouble(args[i+1]);
                        } catch (Exception e) {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid double. Example: %s 'DOUBLE'\r\n", curArgStr, curArgStr));
                            System.exit(-1);
                        }
                        break;
                    case "-w":
                        flagHashSet.add(curArgStr);
                        this.bFeatureBasedLearning = true;
                        break;
                    case "-v":
                        if (i+1 < args.length) {
                            flagHashSet.add(curArgStr);
                            this.verbosityLevel = Integer.parseInt(args[i+1]);
                        } else {
                            System.err.println(String.format("\r\nThe flag, %s requires a valid integer. Example: %s 'INTEGER'\r\n", curArgStr, curArgStr));
                            System.exit(-1);
                        }
                        break;
                    default:
                        // Prevents invalid flags with no specifications.
                        if (curArgStr.charAt(0) == '-') {
                            // check to make sure this is not a negative number.
                            try {
                                Double.parseDouble(curArgStr);
                            } catch (Exception e) {
                                System.err.println(String.format("\r\nERROR: Invalid flag found in arguments: %s  \r\n", curArgStr));
                                e.printStackTrace();
                                System.exit(-1);
                            }
                        }
                }
            }
        } catch (NumberFormatException e) {
            System.err.println(String.format("\r\nEXCEPTION THROWN: Invalid argument parsed for flag %s.\r\n"
                                            + "    ARGUMENT CAUSING EXCEPTION: %s\r\n", curArgStr, e.getMessage()) );
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
                            + "ERROR: The arg for -v, the verbosity level (Current Value = %d),"
                            + " must be inclusively between %d and %d. (1 being the least verbose)"
                            + "\r\n", this.verbosityLevel, MIN_VERBOSITY, MAX_VERBOSITY));
            System.exit(-1);
        }
        // Warn user about invalid learning rate.
        if (Double.compare(this.aLearningRate, 0) < 0 || Double.compare(this.aLearningRate, 1) > 0) 
        {
            System.err.println(
                    String.format("\r\n\r\n"
                            + "ERROR: The arg for -a, the learning rate (Current Value = %f),"
                            + " must be inclusively between %d and %d."
                            + "\r\n", this.aLearningRate, 0, 1));
            System.exit(-1);
        }
        // Warn user about invalid policy randomness
        if (Double.compare(this.ePolicyRandomness, 0) < 0 || Double.compare(this.ePolicyRandomness, 1) > 0) 
        {
            System.err.println(
                    String.format("\r\n\r\n"
                            + "ERROR: The arg for -e, the policy randomize (Current Value = %f),"
                            + " must be inclusively between %d and %d."
                            + "\r\n", this.ePolicyRandomness, 0, 1));
            System.exit(-1);
        }
        // Warn user about invalid discount rate
        if (Double.compare(this.gDiscountRate, 0) < 0 || Double.compare(this.gDiscountRate, 1) > 0) 
        {
            System.err.println(
                    String.format("\r\n\r\n"
                            + "ERROR: The arg for -e, the discount rate (Current Value = %f),"
                            + " must be inclusively between %d and %d."
                            + "\r\n", this.gDiscountRate, 0, 1));
            System.exit(-1);
        }
        // Warn user about invalid action success probability
        if (Double.compare(this.pActionSuccessProbability, 0) < 0 || Double.compare(this.pActionSuccessProbability, 1) > 0) 
        {
            System.err.println(
                    String.format("\r\n\r\n"
                            + "ERROR: The arg for -e, the action success probability (Current Value = %f),"
                            + " must be inclusively between %d and %d."
                            + "\r\n", this.pActionSuccessProbability, 0, 1));
            System.exit(-1);
        }
        //=== End of Guard Method ===
    }
}
