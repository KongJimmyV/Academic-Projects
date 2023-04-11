//////////////////////////////////////////////////////
// File Name:   Environment2D.java
// Author:      Kong Jimmy Vang
// Date:        12/11/2018
// 

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Vector;

/**
 * 2D test environment for an agent using Q-Learning and Feature-based Q-Learning.
 * 
 * @author Kong Jimmy Vang
 */
public class Environment2D {
    
    //*** All Global Variables ***
    // Possible States Types
    final static protected String START = "S";
    final static protected String GOAL = "G";
    final static protected String MINE = "M";
    final static protected String EMPTY_TILE = "_";
    
    // Actions
    final static protected int UP = 0;
    final static protected int DOWN = 1;
    final static protected int LEFT = 2;
    final static protected int RIGHT = 3;
    final static protected int ACTIONS[] = {UP, DOWN, LEFT, RIGHT};
    
    // Control Parameters
    private double y = 0.9;  // Future Discount: y = 0.9
    private double e = 0.9;  // Policy Randomness: e = 0.9
    private double a = 0.9;  // Learning Rate: a = 0.9
    
    // Map/State Variables
    private int width;              // Width of the map.
    private int height;             // Height of the map.
    private String map[][];         // Map of environment (All Possible States).
    private boolean wasStateVisited[][]; // Map of visited states (Used to help make policy by flagging unvisited states).
    
    // Agent Variables
    private State startingState;        // The starting state of this world or environment.
    private State agentCurrentState;    // The current state the agent is at.
    private State agentNextState;       // The next state the agent might be observing or would like to go to.
    private int reward;                 // reward storage (for one-step reward)
    private String policy[][];          // policy
    private Q q;                        // Q(s,a)
    
    // Feature-Based Q-Learning Variables
    Vector<Double> w;
    Vector<Double> f;
    
    // CSV related help
    ArrayList<Double> averageRewards = new ArrayList<>(); // Stores the average rewards to be printed out later.
    
    //*** Constructors ***
    /**
     * Build an environment using this file location string.
     * @param file - The file to build an environment with.
     * @throws IOException
     */
    public Environment2D(final String file) throws IOException {
        this(new File(file));
    }
    
    /**
     * Build an environment using this file.
     * @param file - The file to build an environment with.
     * @throws IOException
     */
    public Environment2D(final File file) throws IOException {
        
        // Read the txt environment into a 2D map...
        RandomAccessFile raf = new RandomAccessFile(file, "r");
        
        // Get Height of map.
        raf.seek(0);
        height = 0;
        while (raf.getFilePointer() < raf.length()) {
            raf.readLine();
            height++;
        }
        
        // Get Width of map.
        raf.seek(0);
        width = raf.readLine().length();
        
        // Place terrain on map. Also set the starting state for the agent.
        raf.seek(0);
        map = new String[height][width];
        
        int row = 0;
        while (raf.getFilePointer() < raf.length()) {
            String str = raf.readLine();
            
            for (int col = 0; col < map[row].length; col++) { 
                String tile = Character.toString(str.charAt(col));
                
                // Place terrain on map at current row and column.
                map[row][col] = tile;
                
                // Set starting state.
                if ("S".equals(tile))
                    startingState = new State(row, col);
            }
            
            row++;
        }
        
        raf.close();
        
        // Create Q values or Q(s,a).
        q = new Q();
        
        // Create a map of flags that track if a particular state was visited. (Helpful for creating policy).
        wasStateVisited = new boolean[height][width];
        
        // Setup weight vectors and the feature vectors.
        w = new Vector<>();
        w.add(new Double(0.0));
        w.add(new Double(0.0));
        
        f = new Vector<>();
        f.add(new Double(0.0));
        f.add(new Double(0.0));
    }
    
    //*** Methods/Functions ***
    /**
     * Print a map of this environment.
     */
    protected void printMap() {
        System.out.println(toString());
    }
    
    /**
     * Return a string representation of the map for this environment.
     */
    @Override
    public String toString() {
        String s = "";
        
        for (int row = 0; row < map.length; row++) { 
            for (int col = 0; col < map[row].length; col++) { 
                s += map[row][col];
            }
            
            if (row < map.length - 1)
                s += "\n";
        }
        
        return s;
    }
    
    /**
     * Perform Q-Learning.
     * @return Returns a grid-like/map policy.
     */
    public String[][] qLearning() {
        
        // Reset the flags for each state. (set all booleans from "wasStateVisited" to false).
        resetFlags();
        
        // Clear rewards
        averageRewards.clear();
        
        // Set all possible states and actions in Q(s,a) = 0.
        for (int row = 0; row < q.Q.length; row++) {
            for (int col = 0; col < q.Q[row].length; col++) {
                for (int action = 0; action < q.Q[row][col].length; action++) {
                    State state = new State(row, col);
                    q.setQ(state, action, 0.0);
                }
            }
        }
        
        e = 0.9; // Policy Randomness.
        a = 0.9; // Learning Rate.
        
        int MAX_EPISODES = 10000;
        for (int episode = 1; episode <= MAX_EPISODES; episode++) {
            
            // Every 100 learning episodes, we will pause here and do 50 test-runs of
            //      the current greedy policy.
            if (episode % 100 == 0) {
                createPolicy(q); // Update the policy.
                testRun();
            }
            
            //*** Set starting state. ***
            agentCurrentState = startingState;
            
            //*** Iterate through time-steps until the episode is terminated. ***
            //      (Termination via reaching the goal, hitting a mine, 
            //      or taking time-steps >= the environment/map itself.)
            
            int t = 0; // Time-Step t.
            while (!agentCurrentState.tile.equals("G") &&
                    !agentCurrentState.tile.equals("M") &&
                    t < width*height) {
                
                // Flag that this state was visited.
                wasStateVisited[agentCurrentState.row][agentCurrentState.column] = true;
                
                //*** Set Action a. ***
                double qValues[] = new double[ACTIONS.length];
                int currentLargestQValueIndex = 0;
                
                // Get the index of "q" with the largest Q Value.
                for (int i = 0; i < ACTIONS.length; i++) {
                    qValues[i] = q.getQ(agentCurrentState, i);
                    if (qValues[i] > qValues[currentLargestQValueIndex]) {
                        currentLargestQValueIndex = i;
                    }
                }
                
                // Set policy randomness "e" equal to 0 on the very last episode.
                if (episode == MAX_EPISODES) {
                    e = 0;
                }
                
                // Set action based on largest Q Value.
                int action = currentLargestQValueIndex;
                
                // Set random action.
                if (e > Math.random()) {
                    action = (int)(Math.random() * 4);
                }
                
                //*** Take action with largest Q Value. Also observe next state s' and take one-step reward. ***
                agentNextState = takeActionAndSetReward(agentCurrentState, action);
                
                // In this environment, the agent begins in the starting location, and can move in one of four directions
                //      (up, down, left, and right). Any move that attempts to leave the bounds of the map fails (and
                //      the agent stays where it is). For any other move, the move succeeds with probability 0.8, and the
                //      agent enters the desired square; with probability 0.2, the agent slips to one side or the other as it
                //      moves in the expected direction, with each direction of slippage being equally probable. Thus, for
                //      instance, if the agent starts in the state marked S in the figure below and attempts to go to the
                //      right, it will end up in one of 3 possible locations, each with the probability given.
                if (0.2 > Math.random()) {
                    if (0.5 > Math.random()) {
                        switch (action) {
                            case UP:    agentNextState = takeActionAndSetReward(agentNextState, RIGHT);
                            case DOWN:  agentNextState = takeActionAndSetReward(agentNextState, LEFT);
                            case LEFT:  agentNextState = takeActionAndSetReward(agentNextState, UP);
                            case RIGHT: agentNextState = takeActionAndSetReward(agentNextState, DOWN);
                        }
                    } else {
                        switch (action) {
                            case UP:    agentNextState = takeActionAndSetReward(agentNextState, LEFT);
                            case DOWN:  agentNextState = takeActionAndSetReward(agentNextState, RIGHT);
                            case LEFT:  agentNextState = takeActionAndSetReward(agentNextState, DOWN);
                            case RIGHT: agentNextState = takeActionAndSetReward(agentNextState, UP);
                        }
                    }
                }
                
                //*** Update Q Values. [Q(s, a) <-- ...] ***
                // First get the max Q(s',a')
                double maxQValue = -Double.MAX_VALUE;
                for (int tAction = 0; tAction < ACTIONS.length; tAction++) {
                    if (q.getQ(agentNextState, tAction) > maxQValue) {
                        maxQValue = q.getQ(agentNextState, tAction);
                    }
                }
                
                double currentQValue = q.getQ(agentCurrentState, action);
                double newQValue = currentQValue + a * (reward + y * maxQValue - currentQValue);
                
                // Set Q equal to the new Q Value for that action.
                q.setQ(agentCurrentState, action, newQValue);
                
                //*** s <-- s' ***
                agentCurrentState = agentNextState;
                wasStateVisited[agentCurrentState.row][agentCurrentState.column] = true; // Flag this state as visited.
                
                t++;
            }
            
            // Setup policy randomness, "e". Also reduce "e" every 200 episodes.
            e = 0.9/(Math.floor((double)episode/200.0) + 1.0);
            
            // Reduce learning rate "a" every 1000 episodes.
            a = 0.9/(Math.floor((double)episode/1000.0) + 1.0);
            
        }
        
        // Create and return a new policy.
        createPolicy(q);
        return policy;
    }
    
    /**
     * Perform a testRun for the method {@link #qLearning()}.
     */
    private void testRun() {
        
        int totalReward = 0;
        
        // Get the total reward from 50 runs.
        int MAX_TEST_RUNS = 50;
        for (int testRun = 1; testRun <= MAX_TEST_RUNS; testRun++) {
            
            //*** Set starting state. ***
            State testAgentCurrentState = startingState;
            
            //*** Iterate through time-steps until the run is terminated. ***
            //      (Termination via reaching the goal, hitting a mine, 
            //      or taking time-steps >= the environment/map itself.)
            
            int t = 0; // Time-Step t.
            while (!testAgentCurrentState.tile.equals("G") &&
                    !testAgentCurrentState.tile.equals("M") &&
                    t < width*height) {
                
                //*** Set Action a, choosing from the action that maximizes Q(s,a). ***
                double qValues[] = new double[ACTIONS.length];
                int currentLargestQValueIndex = 0;
                
                // Get the index of "q" with the largest Q Value.
                for (int tAction = 0; tAction < ACTIONS.length; tAction++) {
                    qValues[tAction] = q.getQ(testAgentCurrentState, tAction);
                    if (qValues[tAction] > qValues[currentLargestQValueIndex]) {
                        currentLargestQValueIndex = tAction;
                    }
                }
                
                // Set action based on largest Q Value.
                int action = currentLargestQValueIndex;
                
                //*** Take action with largest Q Value. Also observe next state s'. ***
                State testAgentNextState = takeActionAndSetReward(testAgentCurrentState, action);
                
                // In this environment, the agent begins in the starting location, and can move in one of four directions
                //      (up, down, left, and right). Any move that attempts to leave the bounds of the map fails (and
                //      the agent stays where it is). For any other move, the move succeeds with probability 0.8, and the
                //      agent enters the desired square; with probability 0.2, the agent slips to one side or the other as it
                //      moves in the expected direction, with each direction of slippage being equally probable. Thus, for
                //      instance, if the agent starts in the state marked S in the figure below and attempts to go to the
                //      right, it will end up in one of 3 possible locations, each with the probability given.
                if (0.2 > Math.random()) {
                    if (0.5 > Math.random()) {
                        switch (action) {
                            case UP:    testAgentNextState = takeActionAndSetReward(testAgentNextState, RIGHT);
                            case DOWN:  testAgentNextState = takeActionAndSetReward(testAgentNextState, LEFT);
                            case LEFT:  testAgentNextState = takeActionAndSetReward(testAgentNextState, UP);
                            case RIGHT: testAgentNextState = takeActionAndSetReward(testAgentNextState, DOWN);
                        }
                    } else {
                        switch (action) {
                            case UP:    testAgentNextState = takeActionAndSetReward(testAgentNextState, LEFT);
                            case DOWN:  testAgentNextState = takeActionAndSetReward(testAgentNextState, RIGHT);
                            case LEFT:  testAgentNextState = takeActionAndSetReward(testAgentNextState, DOWN);
                            case RIGHT: testAgentNextState = takeActionAndSetReward(testAgentNextState, UP);
                        }
                    }
                }
                
                //*** s <-- s' ***
                testAgentCurrentState = testAgentNextState;
                
                totalReward += reward;
                t++;
            }
        }
        
        // Calculate the average reward.
        double averageReward = (double)totalReward / (double)MAX_TEST_RUNS;
        
        // Store for printing later.
        averageRewards.add(averageReward);
    }
    
    /**
     * Build the policy from a set of Q values.
     * @param q - The set of Q values to use.
     */
    private void createPolicy(final Q q) {
        
        // Build policy.
        policy = new String[height][width];
        for (int row = 0; row < policy.length; row++) {
            for (int col = 0; col < policy[row].length; col++) {
                policy[row][col] = map[row][col];
            }
        }
        
        // Check every state and set the policy greedily.
        for (int row = 0; row < policy.length; row++) {
            for (int col = 0; col < policy[row].length; col++) {
                
                State cState = new State(row, col);
                
                // Skip the start, goal and mines when creating the policy.
                String tile = cState.tile;
                if (tile.equals(GOAL) || tile.equals(MINE)) {
                    continue;
                }
                
                // Label the best action at this particular state if possible.
                double largestQValue = -Double.MAX_VALUE;
                int currentBestAction = -1;
                for (int action = 0; action < ACTIONS.length; action++) {
                    double qValue = q.getQ(cState, action);
                    
                    // If this tile/state was never visited, skip it and do not apply to policy.
                    if (!wasStateVisited[row][col]) {
                        continue;
                    } else {
                        if (qValue > largestQValue) {
                            largestQValue = qValue;
                            currentBestAction = action;
                        }
                    }
                }
                
                if (currentBestAction != -1) {
                    if (currentBestAction == UP) {
                        policy[row][col] = "U";
                    } else if (currentBestAction == DOWN) {
                        policy[row][col] = "D";
                    } else if (currentBestAction == LEFT) {
                        policy[row][col] = "L";
                    } else if (currentBestAction == RIGHT) {
                        policy[row][col] = "R";
                    } else {
                        throw new RuntimeException("Invalid action detected. This is not good.");
                    }
                }
            }
        }
    }

    /**
     * Perform Feature-Based Q-Learning.
     * @return Returns a grid-like/map policy.
     */
    public String[][] featureBasedQLearning() {
        
        // Reset the flags for each state. (set all booleans from "wasStateVisited" to false).
        resetFlags();
        
        // Clear rewards
        averageRewards.clear();
        
        e = 0.9; // Policy Randomness.
        a = 0.9; // Learning Rate.
        
        // Initialize the weight vector, "w" = (0, 0).
        w.set(0, new Double(0.0));
        w.set(1, new Double(0.0));
        
        int MAX_EPISODES = 10000;
        for (int episode = 1; episode <= MAX_EPISODES; episode++) {
            
            // Every 100 learning episodes, we will pause here and do 50 test-runs of
            //      the current greedy policy.
            if (episode % 100 == 0) {
                createPolicy(q); // Update the policy.
                featureBasedTestRun();
            }
            
            //*** Set starting state. ***
            agentCurrentState = startingState;
            
            //*** Iterate through time-steps until the episode is terminated. ***
            //      (Termination via reaching the goal, hitting a mine, 
            //      or taking time-steps >= the environment/map itself.)
            
            int t = 0; // Time-Step t.
            while (!agentCurrentState.tile.equals("G") &&
                    !agentCurrentState.tile.equals("M") &&
                    t < width*height) {
                
                //*** Set Action a. ***
                double qVal[] = new double[ACTIONS.length];
                int action = 0;
                
                // Get the action that results in the largest Q Value.
                for (int i = 0; i < ACTIONS.length; i++) {
                    f.set(0, calculateF1(agentCurrentState, i));
                    f.set(1, calculateF2(agentCurrentState, i));
                    qVal[i] = w.get(0)*f.get(0) + w.get(1)*f.get(1);
                }
                
                for (int i = 0; i < ACTIONS.length; i++) {
                    if (qVal[i] > qVal[action]) {
                        action = i;
                    }
                }
                
                // Set policy randomness "e" equal to 0 on the very last episode.
                if (episode == MAX_EPISODES) {
                    e = 0;
                }
                
                // Set random action.
                if (e > Math.random()) {
                    action = (int)(Math.random() * 4);
                }
                
                //*** Take action with largest Q Value. Also observe next state s' and take one-step reward. ***
                agentNextState = takeActionAndSetReward(agentCurrentState, action);
                
                // In this environment, the agent begins in the starting location, and can move in one of four directions
                //      (up, down, left, and right). Any move that attempts to leave the bounds of the map fails (and
                //      the agent stays where it is). For any other move, the move succeeds with probability 0.8, and the
                //      agent enters the desired square; with probability 0.2, the agent slips to one side or the other as it
                //      moves in the expected direction, with each direction of slippage being equally probable. Thus, for
                //      instance, if the agent starts in the state marked S in the figure below and attempts to go to the
                //      right, it will end up in one of 3 possible locations, each with the probability given.
                if (0.2 > Math.random()) {
                    if (0.5 > Math.random()) {
                        switch (action) {
                            case UP:    agentNextState = takeActionAndSetReward(agentNextState, RIGHT);
                            case DOWN:  agentNextState = takeActionAndSetReward(agentNextState, LEFT);
                            case LEFT:  agentNextState = takeActionAndSetReward(agentNextState, UP);
                            case RIGHT: agentNextState = takeActionAndSetReward(agentNextState, DOWN);
                        }
                    } else {
                        switch (action) {
                            case UP:    agentNextState = takeActionAndSetReward(agentNextState, LEFT);
                            case DOWN:  agentNextState = takeActionAndSetReward(agentNextState, RIGHT);
                            case LEFT:  agentNextState = takeActionAndSetReward(agentNextState, DOWN);
                            case RIGHT: agentNextState = takeActionAndSetReward(agentNextState, UP);
                        }
                    }
                }
                
                //f.set(0, calculateF1(agentCurrentState, action));
                
                //*** Update Q Values. [ Q(s,a) <-- w * f(s,a) ] ***
                // First get the action that results in the max Q(s',a') value.
                double qValPrime[] = new double[ACTIONS.length];
                int action2 = 0;
                
                for (int i = 0; i < ACTIONS.length; i++) {
                    f.set(0, calculateF1(agentCurrentState, i));
                    f.set(1, calculateF2(agentCurrentState, i));
                    qValPrime[i] = w.get(0)*f.get(0) + w.get(1)*f.get(1);
                }
                
                for (int i = 0; i < ACTIONS.length; i++) {
                    if (qValPrime[i] > qValPrime[action2]) {
                        action2 = i;
                    }
                }
                
                //*** Update the weight vector "w". ***
                double currentQValue = qVal[action];
                double maxQValuePrime = qValPrime[action2];
                
                for (int i = 0; i < w.size(); i++) {
                    Double newWeight = w.get(i) + a * (reward + y * maxQValuePrime - currentQValue) * f.get(i);
                    w.set(i, newWeight);
                    
                    if (w.get(i).equals(Double.NaN)) {
                        throw new RuntimeException("NaN: " + w.get(i) + " " + i);
                    }
                }
                
                //*** s <-- s' ***
                agentCurrentState = agentNextState;
                t++;
            }
            
            // Setup policy randomness, "e". Also reduce "e" every 200 episodes.
            e = 0.9/(Math.floor((double)episode/200.0) + 1.0);
            
            // Reduce learning rate "a" every 1000 episodes.
            a = 0.9/(Math.floor((double)episode/1000.0) + 1.0);
            
        }
        
        // Create and return a new policy.
        createPolicyFeatureBased(w, f);
        return policy;
    }
    
    /**
     * Perform a testRun for the method {@link #featureBasedQLearning()}.
     */
    private void featureBasedTestRun() {
        
        int totalReward = 0;
        
        // Get the total reward from 50 runs.
        int MAX_TEST_RUNS = 50;
        for (int testRun = 1; testRun <= MAX_TEST_RUNS; testRun++) {
            
            //*** Set starting state. ***
            State testAgentCurrentState = startingState;
            
            //*** Iterate through time-steps until the run is terminated. ***
            //      (Termination via reaching the goal, hitting a mine, 
            //      or taking time-steps >= the environment/map itself.)
            
            int t = 0; // Time-Step t.
            while (!testAgentCurrentState.tile.equals("G") &&
                    !testAgentCurrentState.tile.equals("M") &&
                    t < width*height) {
                
                //*** Set Action a, choosing from the action that maximizes Q(s,a). ***
                double qVal[] = new double[ACTIONS.length];
                int action = 0;
                
                // Get the action that results in the largest Q Value.
                for (int i = 0; i < ACTIONS.length; i++) {
                    f.set(0, calculateF1(testAgentCurrentState, i));
                    f.set(1, calculateF2(testAgentCurrentState, i));
                    qVal[i] = w.get(0)*f.get(0) + w.get(1)*f.get(1);
                }
                
                for (int i = 0; i < ACTIONS.length; i++) {
                    if (qVal[i] > qVal[action]) {
                        action = i;
                    }
                }
                
                //*** Take action with largest Q Value. Also observe next state s'. ***
                State testAgentNextState = takeActionAndSetReward(testAgentCurrentState, action);
                
                // In this environment, the agent begins in the starting location, and can move in one of four directions
                //      (up, down, left, and right). Any move that attempts to leave the bounds of the map fails (and
                //      the agent stays where it is). For any other move, the move succeeds with probability 0.8, and the
                //      agent enters the desired square; with probability 0.2, the agent slips to one side or the other as it
                //      moves in the expected direction, with each direction of slippage being equally probable. Thus, for
                //      instance, if the agent starts in the state marked S in the figure below and attempts to go to the
                //      right, it will end up in one of 3 possible locations, each with the probability given.
                if (0.2 > Math.random()) {
                    if (0.5 > Math.random()) {
                        switch (action) {
                            case UP:    testAgentNextState = takeActionAndSetReward(testAgentNextState, RIGHT);
                            case DOWN:  testAgentNextState = takeActionAndSetReward(testAgentNextState, LEFT);
                            case LEFT:  testAgentNextState = takeActionAndSetReward(testAgentNextState, UP);
                            case RIGHT: testAgentNextState = takeActionAndSetReward(testAgentNextState, DOWN);
                        }
                    } else {
                        switch (action) {
                            case UP:    testAgentNextState = takeActionAndSetReward(testAgentNextState, LEFT);
                            case DOWN:  testAgentNextState = takeActionAndSetReward(testAgentNextState, RIGHT);
                            case LEFT:  testAgentNextState = takeActionAndSetReward(testAgentNextState, DOWN);
                            case RIGHT: testAgentNextState = takeActionAndSetReward(testAgentNextState, UP);
                        }
                    }
                }
                
                //*** s <-- s' ***
                testAgentCurrentState = testAgentNextState;
                
                totalReward += reward;
                t++;
            }
        }
        
        // Calculate the average reward.
        double averageReward = (double)totalReward / (double)MAX_TEST_RUNS;
        
        // Store for printing later.
        averageRewards.add(averageReward);
    }
    
    /**
     * Calculate the feature f1 from a particular state, resulting from an action taken from that particular state. <br>
     * 
     * f1 is a normalized Manhattan distance metric, calculated by assuming that the action 
     * a occurs with no slippage, and then returning f1 = MD(s') / MD+, where s' is the 
     * location that would result from that action, MD(s') is the Manhattan distance* 
     * from s' to the goal location, and MD+ is the maximum possible such distance.
     * 
     * @param s - Particular state to be in when taking the given action.
     * @param a - Action to take.
     * @return
     */
    protected double calculateF1(final State s, final int a) {
        
        //*** Calculate MD+ ***
        // Maximum possible distance from the goal to the farthest possible state.
        int goalRow = 0;
        int goalCol = 0;
        
        for (int row = 0; row < policy.length; row++) {
            for (int col = 0; col < policy[row].length; col++) {
                
                State tState = new State(row, col);
                
                if (tState.tile.equals(GOAL)) {
                    goalRow = row;
                    goalCol = col;
                }
            }
        }
        
        // Prepare the corner states of this map.
        State fourCorners[] = new State[4];
        fourCorners[0] = new State(0, 0);
        fourCorners[1] = new State(0, width - 1);
        fourCorners[2] = new State(height - 1, 0);
        fourCorners[3] = new State(height - 1, width - 1);
        
        double mdPlus = 0; // MD+ (Max Possible Distance)
        double tManhattanDistance = 0; // Temporary MD
        
        // Find the maximum possible distance to the goal G.
        for (int i = 0; i < fourCorners.length; i++) {
            int cornerRow = fourCorners[i].row;
            int cornerCol = fourCorners[i].column;
            tManhattanDistance = Math.abs(goalRow - cornerRow) + Math.abs(goalCol - cornerCol);
            
            // Set max distance.
            if (tManhattanDistance > mdPlus) {
                mdPlus = tManhattanDistance;
            }
        }
        
        //*** Calculate MD(s') ***
        // Find the manhattan distance from the new state, resulting from this function's given action "a".
        
        double mdSPrime = 0; // MD(s') (Distance from the new state, "sPrime", to the goal)
        State sPrime = s.observeAction(a);
        
        // Get distance from state "sPrime" to the goal.
        mdSPrime = Math.abs(goalRow - sPrime.row) + Math.abs(goalCol - sPrime.column);
        
        //*** Calculate f1 and return it. ***
        double f1 = mdSPrime / mdPlus;
        return f1;
    }
    
    /**
     * Calculate the feature f2 from a particular state, resulting from an action taken from that particular state. <br>
     * 
     * f2 is based upon the action a and two inverse distance metrics, calculated based 
     * upon the distance to the mines to the left and right of an agent. As shown in the 
     * image below, each inverse distance is 1=d, where d is the number of moves needed 
     * to reach the mine in that direction.
     * 
     * @param s - Particular state to be in when taking the given action.
     * @param a - Action to take.
     * @return
     */
    protected double calculateF2(final State s, final int a) {
        
        // Calculate the distances when taking an action "LEFT" to reach a mine.
        int distanceToLeft = 0;
        
        State tState = new State(s.row, s.column);
        while (!map[tState.row][tState.column].equals(MINE)) {
            tState = tState.observeAction(LEFT);
            distanceToLeft++;
        }
        
        // Calculate the distances when taking an action "RIGHT" to reach a mine.
        int distanceToRight = 0;
        
        tState = new State(s.row, s.column);
        while (!map[tState.row][tState.column].equals(MINE)) {
            tState = tState.observeAction(RIGHT);
            distanceToRight++;
        }
        
        //*** Calculate f2. ***
        double f2 = 0;
        if (a == LEFT) {
            // Calculate inverse distance to the left.
            f2 = 1.0 / (double)distanceToLeft;
            
        } else if (a == RIGHT) {
            // Calculate inverse distance to the right.
            f2 = 1.0 / (double)distanceToRight;
            
        } else { // else if (a == UP || a == DOWN) {
            // Calculate the minimum of the two distances. Set f2 equal to that minimum distance.
            double f2Left = 1.0 / (double)distanceToLeft;
            double f2Right = 1.0 / (double)distanceToRight;
            
            // Is f2Right the minimum distance?
            if (f2Right < f2Left) {
                // Yes.
                f2 = f2Right;
            } else {
                // No.
                f2 = f2Left;
            }
        }
        
        if (Double.isNaN(f2))
            return 0;
        if (Double.isInfinite(f2))
            return 0;
        return f2;
    }
    
    /**
     * Build the policy from a weight vector {@code w} and a feature vector {@code f}.
     * @param w - The weight vector to use in building this policy.
     * @param f - The feature vector to use in building this policy.
     */
    private void createPolicyFeatureBased(final Vector<Double> w, final Vector<Double> f) {
        
        // Build policy.
        policy = new String[height][width];
        for (int row = 0; row < policy.length; row++) {
            for (int col = 0; col < policy[row].length; col++) {
                policy[row][col] = map[row][col];
            }
        }
        
        // Check every state and set the policy based on features and weights learned.
        for (int row = 0; row < policy.length; row++) {
            for (int col = 0; col < policy[row].length; col++) {
                
                State cState = new State(row, col);
                
                // Skip the start, goal and mines when creating the policy.
                String tile = cState.tile;
                if (tile.equals(GOAL) || tile.equals(MINE)) {
                    continue;
                }
                
                // Label the best action at this particular state if possible.
                double qVal[] = new double[ACTIONS.length];
                int currentBestAction = 0;
                
                for (int i = 0; i < ACTIONS.length; i++) {
                    f.set(0, calculateF1(cState, i));
                    f.set(1, calculateF2(cState, i));
                    qVal[i] = w.get(0)*f.get(0) + w.get(1)*f.get(1);
                }
                
                for (int i = 0; i < ACTIONS.length; i++) {
                    if (qVal[i] > qVal[currentBestAction]) {
                        currentBestAction = i;
                    }
                }
                
                if (currentBestAction != -1) {
                    if (currentBestAction == UP) {
                        policy[row][col] = "U";
                    } else if (currentBestAction == DOWN) {
                        policy[row][col] = "D";
                    } else if (currentBestAction == LEFT) {
                        policy[row][col] = "L";
                    } else if (currentBestAction == RIGHT) {
                        policy[row][col] = "R";
                    } else {
                        throw new RuntimeException("Invalid action detected. This is not good.");
                    }
                }
            }
        }
    }
    
    /**
     * Tell the agent to take the given action a from a given state s.
     * @param s - The current state the agent is in.
     * @param a - The action to take. (0 = UP, 1 = DOWN, 2 = LEFT, 3 = RIGHT)
     */
    private State takeActionAndSetReward(final State s, final int a) {
        
        // Observe next state s'.
        State nextState = s.observeAction(a);
        
        int row = nextState.row;
        int col = nextState.column;
        
        // One-step reward.
        if (map[row][col].equals(START)) {
            reward = -1;
        }
        else if (map[row][col].equals(GOAL)) {
            reward = 0;
        }
        else if (map[row][col].equals(MINE)) {
            reward = -100;
        }
        else if (map[row][col].equals(EMPTY_TILE)) {
            reward = -1;
        }
        else {
            reward = -1;
        }
        
        return nextState;
    }

    /**
     * Resets the boolean flags to {@code false} in {@code wasStateVisited}.
     */
    private void resetFlags() {
        for (int row = 0; row < wasStateVisited.length; row++) {
            for (int col = 0; col < wasStateVisited[row].length; col++) {
                wasStateVisited[row][col] = false;
            }
        }
        
    }
    
    /**
     * Writes out the average rewards, discovered during each of the test runs.
     * @throws FileNotFoundException
     */
    protected void writeAverageRewards(String file) throws FileNotFoundException {
        PrintWriter pw = new PrintWriter(file);
        pw.println("Episodes, Average Reward");
        for (int i = 0; i < averageRewards.size(); i++) {
            pw.println(100 * (i+1) + ", " + averageRewards.get(i).doubleValue());
        }
        
        pw.close();
    }
    
    //*** Inner Classes ***
    /**
     * Data Structure for storing explicit values Q(s,a) for all possible states and actions
     *      of this particular environment.
     */
    private class Q {
        
        /**
         * This is Q. <br><br>
         * 
         * State "s" is the map, represented by a row and column. <br>
         * Action "a" is represented by an integer value. <br><br>
         * 
         * Q[row][column][action] = Q(s,a), 
         *      where [row][column] = s, and [action] = a.
         */
        private double Q[][][];
        
        /** Construct Q. */
        public Q() {
            Q = new double[map.length][map[0].length][ACTIONS.length];
        }
        
        /**
         * Set Q(s,a) at a particular state and action.
         * @param state - State "s", which contains a map with row and columns.
         * @param action - Action "a".
         * @param value - Value to store at Q(s,a)
         */
        public void setQ(final State state, final int action, final double value) {
            Q[state.row][state.column][action] = value;
        }
        
        /**
         * Set Q(s,a) at a particular state and action.
         * @param state - State "s", which contains a map with row and columns.
         * @param action - Action "a".
         * @return Returns the value stored at Q(s,a).
         */
        public double getQ(final State state, final int action) {
            return Q[state.row][state.column][action];
        }
    }
    
    /**
     * A representation of a State for a particular position on the map or environment.
     */
    private class State {
        protected int row;
        protected int column;
        protected String tile;
        
        /**
         * Create some particular State.
         * @param row - The row of the State.
         * @param column - The column of the State.
         */
        public State(final int row, final int column) {
            this.row = row;
            this.column = column;
            
            if (!isInvalid())
                tile = map[this.row][this.column];
            else
                tile = "?";
            
        }
        
        /**
         * Compares this state with some other state.
         * @param otherState - The other state.
         * @return Return {@code true} if both states have an identical row and column.
         *          Otherwise, return false.
         */
        public boolean equals(final State otherState) {
            if (this.row == otherState.row
                    && this.column == otherState.column) {
                return true;
            } else
                return false;
        }
        
        /**
         * Observe the action taken from this current state and return a new State as a result.
         * @param action - The given action.
         * @return Return a new {@code State} that results from the given action.
         */
        public State observeAction(final int action) {
            State newState = new State(this.row, this.column);
            
            // Observe Action.
            if (action == UP) {
                newState.row--;
            } else if (action == DOWN) {
                newState.row++;
            } else if (action == LEFT) {
                newState.column--;
            } else if (action == RIGHT) {
                newState.column++;
            } else {
                throw new RuntimeException("There was no valid action to observe. Ask the developer to fix this.");
            }
            
            // Return New State.
            if (newState.isInvalid())
                return this;
            else
                return newState;
        }
        
        /**
         * Check if this State is not possible. 
         * This State is invalid if it is out of bounds of the {@code map}.
         * 
         * @return Returns {@code true} if this State is invalid.
         */
        private boolean isInvalid() {
            if (row < 0 || row >= map.length
                    || column < 0 || column >= map[0].length) {
                return true;
            }
            
            return false;
        }
        
        /**
         * Returns a representation of this State. 
         * (Includes the {@code row} and {@code column}, and the {@code tile} of this State.)
         */
        @Override
        public String toString() {
            return "State: [" + this.row + ", " + this.column + "] Tile: [\"" + tile + "\"]";
        }
    }
}
