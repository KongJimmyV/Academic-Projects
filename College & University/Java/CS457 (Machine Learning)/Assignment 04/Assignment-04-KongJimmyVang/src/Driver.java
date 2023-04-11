import java.io.FileNotFoundException;
import java.util.List;

/**
 * Project Name:    Assignment 4        <br>
 * File Name:       Driver.java         <br>
 * Description:     This Driver Class simulates the SARSA and Q-Learning algorithms for 
 *                      an Agent in a simple grid world Environment. <br><br>
 * 
 * Date Created:    12/5/22            <br>
 * Date Modified:   12/14/22            <br>
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
        // See "Args.java" for more information
        Args arguments = new Args(args);
        
        //====== Load environment from the specified file ======
        // *** LOG: Reading the file. ***
        if (arguments.verbosityLevel >= 1) {
            System.out.println(String.format("* Reading %s...", arguments.fileName));
        }
        
        // Initialize the Environment
        Environment2D environment = null;
        try 
        {
            environment = new Environment2D(arguments.fileName, arguments.pActionSuccessProbability);
        } 
        catch (FileNotFoundException e) 
        {
            System.err.println(String.format("\r\n%s\r\n", e.getLocalizedMessage()));
            //e.printStackTrace();
            System.err.println();
            System.exit(-1);
        }
        
        //*** LOG: Show the Environment ***
        if (arguments.verbosityLevel >= 5) {
            System.out.println("* DEBUG: Show the Environment");
            System.out.println(environment);
            System.out.println();
        }
        
        // Create Agent
        Agent agent = new Agent(environment,
                                0,
                                "Agent Smiles",
                                100,
                                arguments.verbosityLevel,
                                arguments.aLearningRate,
                                arguments.ePolicyRandomness,
                                arguments.gDiscountRate,
                                arguments.lEligibilityTraceDecay,
                                arguments.bQLearning,
                                arguments.bFeatureBasedLearning,
                                arguments.bUnicode);
        
        //*** LOG: Show the Agent's current policy ***
        if (arguments.verbosityLevel >= 5) {
            System.out.println("* DEBUG: Show the Agent's current policy");
            System.out.println(agent.getPolicy());
            System.out.println();
        }
        //*** LOG: Show the Agent's current Q Values ***
        if (arguments.verbosityLevel >= 5) {
            System.out.println("* DEBUG: Show the Agent's Q Values");
            agent.printQValues();
            System.out.println();
        }
        
        //====== Perform learning episodes, with periodic parameter updates and/or evaluation ======
        // Learning Episodes
        agent.performEpisodes(arguments.nLearningRateDecay,
                              arguments.nRandomActionThresholdDecay,
                              arguments.tNumOfLearningEpisodes,
                              true,
                              false);
        
        // Evaluation Episodes
        agent.performEpisodes(arguments.nLearningRateDecay,
                              arguments.nRandomActionThresholdDecay,
                              50,
                              false,
                              false);
        
        //*** LOG: Show the Agent's Learned Policy ***
        if (arguments.verbosityLevel >= 1) 
        {
            System.out.println("* Learned greedy policy:");
            System.out.println(agent.getPolicy());
            
            //*** LOG: Show the Agent's Learned Q Values ***
            if (arguments.verbosityLevel >= 2) 
            {
                System.out.println("* Learned Q values:");
                agent.printQValues();
                
                //*** LOG: Show the Agent's Learned weights ***
                if (arguments.bFeatureBasedLearning) 
                {
                    System.out.println("* Learned weights");
                    List<FeatureEnv> features = agent.getFeatures();
                    for (int j = 0; j < features.size(); j++) 
                    {
                        FeatureEnv f = features.get(j);
                        System.out.println(String.format("  Feature %d (%s): %7.3f", j, f.getFeatureName(), f.getWeight()));
                    }
                }
            }
        }
        
        //*** LOG: End Program ***
        if (arguments.verbosityLevel >= 5) {
            System.out.println("\r\n*** END PROGRAM ***");
        }
    }
}
