
/**
 * Project Name:    Assignment 2        <br>
 * File Name:       Args.java         <br>
 * Description:     This Args class stores command-line argument information about the program that will use it.
 *                      Can be modified with more arguments to store if needed. <br><br>
 * 
 * Date Created:    10/10/22            <br>
 * Date Modified:   10/27/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * Argument Flags:
 * <ul>
 *      <li> -f 'FILENAME'  : [REQUIRED] Reads training data from the file named 'FILENAME' (specified as a String).
 *      <li> -b 'INTEGER'   : Specify the base training group size; default is 10.
 *      <li> -i 'INTEGER'   : Specify the increment in training group size; default is 10.
 *      <li> -l 'INTEGER'   : Specify the limit for training group size; default is 100.
 *      <li> -t 'INTEGER'   : Sets the number of trials to perform at each training group size; default is 20.
 *      <li> -d 'INTEGER'   : Specifies the maximum depth limit to be used when building the decision tree; 
 *                              if unspecified, then no depth limit is used.
 *      <li> -v 'INTEGER'   : Specifies a verbosity level from 1 to 5, indicating how much output the program should 
 *                              produce; default is 1.
 * </ul>
 *  
 * @version 1.0
 * @author Kong Jimmy Vang
 */
public class Args 
{
    // Flag arguments.
    protected String      fileName;             // flag -f
    protected int         baseTrainingGroup;    // flag -b
    protected int         increment;            // flag -i
    protected int         limit;                // flag -l
    protected int         trials;               // flag -t
    protected int         depthLimit;           // flag -d
    protected int         verbosityLevel;       // flag -v
    protected int         splitLimit;           // flag -s
    protected boolean     printTreeBool;        // flag -p
    
    // Non-Flag arguments.
    protected int         p;                    // Value p; Number of Attributes.
    
    public Args() 
    {
        // Flag Initial Default Values
        fileName             = null;             // flag -f
        baseTrainingGroup    = 10;               // flag -b
        increment            = 10;               // flag -i
        limit                = 100;              // flag -l
        trials               = 20;               // flag -t
        depthLimit           = -1;               // flag -d
        verbosityLevel       = 1;                // flag -v
        splitLimit           = -1;               // flag -s
        printTreeBool        = false;            // flag -p
        
        // Non-Flag Initial Default Values
        p                    = 0;                // Value p; Number of Attributes.
    }
}
