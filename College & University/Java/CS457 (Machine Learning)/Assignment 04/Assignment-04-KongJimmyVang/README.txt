
#######################################
 * File:            README.txt
 * Project Name:    Assignment 4
 * Date Modified:   12/14/2022
 * Class:           CS457 (Fall 2022)
 * Instructor:      Dr. Jason Sauppe
#######################################

Prerequisites:
    - Install JDK if not installed: https://www.oracle.com/java/technologies/downloads/
    - Install Java if not installed: https://www.java.com/en/download/

How To Compile Java Files:
    1. Open a Terminal, Shell, or Command-Line interface
    2. Navigate to the folder "src", where this README file is located.
    3. Find the "Driver.java" file.
    4. Run the command, "javac Driver.java". Wait for the command to finish.

How To Run The Program:
    1. Run the command, "java Driver -f <FILENAME>", where <FILENAME> is a file location. 
        Some example files to use with this program are stored in the "data" folder.
    2. The -f flag is required, other flags are optional.


NOTES:
- This program has every flag completed.
- I experimented with some other features, but I will have them commented out.
    - [Features are added in "Agent.java" in the method "addFeatures()".]
    - Feature for mines which is: f(s) = ((L1 distance from s to the nearest mine) / (xMax + yMax))
    - Feature for blocks which is: f(s) = ((L1 distance from s to the nearest block) / (xMax + yMax))
    - Feature for cliff which is: f(s) = ((L1 distance from s to the nearest mine) / (xMax + yMax))
    
    - Interesting Note: I noticed "pipe-world.txt" have a more stable policy if Feature #7 is turned off, 
                            and the feature I created for the L1 distance to mines is turned on.


ALL FLAGS:
    -f 'FILENAME': Reads training data from the file named 'FILENAME' (specified as a String).
    -a 'DOUBLE':  Specifies the (initial) learning rate (step size) α ∈ [0, 1]; default is 0.9.
    -e 'INTEGER': Specifies the (initial) policy randomness value ε ∈ [0, 1]; default is 0.9.
    -g 'DOUBLE': Specifies the discount rate γ ∈ [0, 1] to use during learning; default is 0.9.
    -na 'INTEGER': Specifies the value Nα which controls the decay of the learning rate (step size) α; default is 1000.
    -ne 'INTEGER': Specifies the value Nε which controls the decay of the random action threshold ε; default is 200.
    -p 'DOUBLE': Specifies the action success probability p ∈ [0, 1]; default is 0.8.
    -q: Toggles the use of Q-Learning with off-policy updates (instead of SARSA with on-policy updates, which is the default).
    -T 'INTEGER': Specifies the number of learning episodes (trials) to perform; default is 10000.
    -u: Toggles the use of Unicode characters in printing; disabled by default.
    -l 'DOUBLE': Specifies the λ parameter for eligibility trace decay; default is 0.0 
        (meaning that eligibility traces should not be used by default).
    -w: Specifies that the agent should use a weighted sum of features to estimate Q values for each state-action pair 
        instead of maintaining these values in a table; disabled by default.
    -v 'INTEGER': Specifies a verbosity level from 1 to 6, indicating how much output the program 
        should produce; default is 1.
        Verbosity 5 shows the initial environment, policy, and q values. 
        Verbosity 6 prints the policy at the end of each episode during the learning phase.


