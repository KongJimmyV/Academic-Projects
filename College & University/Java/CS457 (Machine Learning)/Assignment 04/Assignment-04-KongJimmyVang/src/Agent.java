import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Project Name:    Assignment 4        <br>
 * File Name:       Agent.java          <br>
 * Description:     This simulates an agent that can interact with an Environment. <br><br>
 * 
 * Date Created:    12/5/22            <br>
 * Date Modified:   12/14/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class Agent 
{
    /** The set of actions that can be taken by the Agent. */
    public enum Action { LEFT, UP, RIGHT, DOWN };
    
    /** Environment */
    private Environment2D environment;
    
    /** A list of Features for Feature-Based Q-Learning (All weights are stored in each feature object) */
    private List<FeatureEnv> features;
    
    /** e (Eligibility Traces) state-action pairs for each state */
    private LinkedHashMapSet<ECell2D> e;
    
    /** Q state-action pairs for each state */
    private LinkedHashMapSet<QCell2D> q;
    
    /** Policy π */
    private Policy policy;
    
    /** Agent ID */
    private int id;
    
    /** Agent Name */
    private String name;
    
    /** Agent Max Health */
    private int maxHealth;
    
    /** Agent Current Health */
    private int health;
    
    /** Agent Location */
    private int x;
    private int y;
    
    /** The verbosity level */
    private int verbosityLevel;
    
    /** Agent Learning Rate (Step Size) α */
    private double learningRate;
    
    /** Agent Policy Randomness Value ε */
    private double policyRandomness;
    
    /** Agent Discount Rate γ */
    private double discountRate;
    
    /** Agent eligibility Trace Decay λ */
    private double eligibilityTraceDecay;
    
    /** If true, use Q-Learning. Otherwise use SARSA.  */
    private boolean bUseQLearning;
    
    /** If true, use Feature Based Learning for Q value updates. */
    private boolean bFeatureBasedLearning;
    
    /** If true, display Agent's policy in unicode */
    private boolean bUnicode;
    
    /**
     * Creates an agent.
     * @param environment - the environment the agent will play in.
     * @param id - the agent's assigned id number.
     * @param name - the agent's name.
     * @param maxHealth - the max health that the agent will have.
     * @param verbosityLevel - verbosity level with 1 being the least verbose.
     * @param learningRate - the agent's learning rate α.
     * @param policyRandomness - the agent's policy randomness ε.
     * @param discountRate - the agent's discount rate γ.
     * @param eligibilityTraceDecay - the agent's eligibility trace decay λ.
     * @param bUseQLearning - if true, use Q-Learning. Otherwise use SARSA.
     * @param bFeatureBasedLearning - if true, use Feature Based Learning for Q value updates.
     * @param bUnicode - if true, return toString representation of the policy in unicode.
     */
    public Agent(final Environment2D environment,
                 final int id, 
                 final String name, 
                 final int maxHealth,
                 final int verbosityLevel,
                 final double learningRate,
                 final double policyRandomness,
                 final double discountRate,
                 final double eligibilityTraceDecay,
                 final boolean bUseQLearning,
                 final boolean bFeatureBasedLearning,
                 final boolean bUnicode) 
    {
        // Set field variables
        setId(id);
        setName(name);
        setMaxHealth(maxHealth);
        setHealth(maxHealth);
        setVerbosityLevel(verbosityLevel);
        setLearningRate(learningRate);
        setPolicyRandomness(policyRandomness);
        setDiscountRate(discountRate);
        setEligibilityTraceDecay(eligibilityTraceDecay);
        setbUseQLearning(bUseQLearning);
        setbFeatureBasedLearning(bFeatureBasedLearning);
        setbUnicode(bUnicode);
        
        // Setup environment and other necessary stuff for the agent.
        setEnvironment(environment);
    }
    
    /**
     * Adds and initializes a list of features for this agent to use.
     */
    private void addFeatures() 
    {
        this.features = new ArrayList<>();
        this.features.add( new FeatureEnv0(this.environment) );
        this.features.add( new FeatureEnv1(this.environment) );
        this.features.add( new FeatureEnv2(this.environment) );
        this.features.add( new FeatureEnv3(this.environment) );
        this.features.add( new FeatureEnv4(this.environment) );
        this.features.add( new FeatureEnv5(this.environment) );
        this.features.add( new FeatureEnv6(this.environment) );
        this.features.add( new FeatureEnv7(this.environment) );
        
        //this.features.add( new FeatureEnvDistMine(this.environment) );
        //this.features.add( new FeatureEnvDistBlock(this.environment) );
        //this.features.add( new FeatureEnvDistCliff(this.environment) );
    }
    
    /**
     * This will prompt the agent to "move towards" to the starting cell.
     */
    public void goToStart() {
        EnvCell2D cell = this.environment.getStartCell();
        this.setLocation(cell.getX(), cell.getY());
    }
    
    /**
     * Executes the action.
     * @param action
     */
    public EnvCell2D executeAction(Agent.Action action) 
    {
        //EnvCell2D currentState = this.getCurrentState();
        EnvCell2D newState = this.getEnvironment().executeAction(this, action);
        return newState;
    }
    
    /**
     * Move this agent to the state's location.
     * @param state - state to move to
     */
    public void moveTo(EnvCell2D state) {
        this.setLocation(state.getX(), state.getY());
    }
    
    /**
     * Get the current state that this agent resides in.
     * @return
     */
    public EnvCell2D getCurrentState() {
        return this.getEnvironment().getCellAt(getX(), getY());
    }

    /**
     * Agent signals that they have reached any goal.
     * @return Returns true if the agent's position is the same as any goal cell. Otherwise false.
     */
    public boolean hasReachedGoal() 
    {
        boolean hasReachedGoal = false;
        List<EnvCell2D> goalCells = this.environment.getGoalCells();
        
        for (EnvCell2D goal : goalCells) 
        {
            if (this.getX() == goal.getX() && this.getY() == goal.getY()) {
                hasReachedGoal = true;
                break;
            }
        }
        return hasReachedGoal;
    }
    
    /**
     * Agent signals that they are still alive with health.
     * @return Returns true if agent's health is greater than 0. Otherwise false.
     */
    public boolean isAlive() {
        return getHealth() > 0;
    }
    
    /**
     * Revive the agent from death or injures to full max health.
     */
    public void revive() {
        setHealth(getMaxHealth());
    }
    
    /**
     * Heals the agent for a given amount.
     * @param healAmount - the heal amount
     */
    public void heal(final int healAmount) {
        setHealth(getHealth() + healAmount);
    }
    
    /**
     * Damage the agent for a given amount.
     * @param damageAmount - the damage amount
     */
    public void takeDamage(final int damageAmount) {
        setHealth(getHealth() - damageAmount);
    }
    
    /**
     * Gets the action that this agent thinks is the best at the given state to it's greedy policy.
     * @param state - the given state
     * @param policyRandomness - the policy randomness value ε.
     * @return Returns the agent's greedy action choice.
     */
    public Agent.Action greedy(final EnvCell2D state, double policyRandomness) {
        return this.getPolicy().greedy(state, policyRandomness);
    }
    
    /**
     * Performs learning for this agent to find a "best" policy π, with actions chosen greedily for each state.
     * 
     * Will perform SARSA with on-policy updates if <code>useQLearning</code> is set to false.
     * Will perform Q-Learning with off-policy updates if <code>useQLearning</code> is set to true.
     * 
     * When <code>bLearn</code> is true, the agent will update it's Q values to learn.
     *      Otherwise, the agent will evaluate it's own performance instead.
     * 
     * @param learningRateDecay - the learning rate decay
     * @param randomActionThresholdDecay - the random action threshold decay
     * @param numOfEpisodes - the max number of episodes to perform
     * @param bLearn - if true, the agent will learn during the episodes. 
     *              Otherwise, perform an evaluation and do not learn during episodes.
     * @param bPrintAvgTotalReward - if true, will print the episode and average total reward 
     *              for the policy during the episode.
     * @return Returns the learned policy π, with actions chosen greedily for each state.
     */
    public Policy performEpisodes(final int learningRateDecay,
                                  final int randomActionThresholdDecay,
                                  final int numOfEpisodes,
                                  final boolean bLearn,
                                  final boolean bPrintAvgTotalReward) 
    {
        // *** LOG: Begin Learning ***
        if (verbosityLevel >= 1) {
            if (bLearn) {
                if (bUseQLearning) {
                    System.out.println(String.format("* Beginning %d learning episodes with Q-Learning...", numOfEpisodes));
                } else {
                    System.out.println(String.format("* Beginning %d learning episodes with SARSA...", numOfEpisodes));
                }

                if (verbosityLevel >= 3) {
                    System.out.println(String.format("  * After     Avg. Total Reward for"));
                    System.out.println(String.format("  * Episode   Current Greedy Policy"));
                }
            } else {
                if (!bPrintAvgTotalReward) {
                    System.out.println(String.format("* Beginning %d evaluation episodes...", numOfEpisodes));
                }
            }
        }
        
        // Create temporary vars.
        double avgTotalReward = 0.0;
        double learningRate = getLearningRate();
        double policyRandomness = getPolicyRandomness();
        double eligibilityTraceDecay = getEligibilityTraceDecay();
        final double discountRate = getDiscountRate();
        
        long envHeight = this.getEnvironment().getCells().size();
        long envWidth = this.getEnvironment().getCells().get(0).size();
        long sizeOfEnv = envHeight * envWidth;
        
        if (!bLearn) {
            // During evaluation, the agent should always act greedily.
            policyRandomness = 0;
        } else {
            // During learning, Sets all Q values to 0, where the agent contains Q values for all state-action pairs, (s,a) ∈ S x A.
            this.setAllQValues(0.0);
        }
        
        //====================================================
        //=== Perform Episodes. Episodes are denoted as t. ===
        for (int t = 1; t <= numOfEpisodes; t++) 
        {
            // Reset eligibility values
            if (bLearn && Double.compare(eligibilityTraceDecay, 0) > 0) {
                this.setAllEValues(0.0);
            }
            
            // Temp vars
            double totalReward = 0;
            long actionsDone = 0;
            
            // Revive the agent back to full health if they were destroyed.
            this.revive();
            
            // Move the agent to the starting state.
            this.goToStart();
            EnvCell2D s = this.getCurrentState();
            
            // Get the next action to take at the agent's current state from this agent's policy π.
            if (bLearn) {
                this.updatePolicyAt(s);
            }
            Agent.Action a = this.greedy(s, policyRandomness);
            
            // Begin the current episode t.
            while (this.isAlive() && !this.hasReachedGoal() && actionsDone < sizeOfEnv) 
            {
                //===============================
                // Execute action and observe new state and reward.
                EnvCell2D s1 = this.executeAction(a);
                actionsDone++;
                double reward = this.getEnvironment().reward(s, a, s1);
                totalReward += reward;
                
                //===============================
                // Get the next action to take at at state s1 from this agent's policy π.
                if (bLearn) {
                    this.updatePolicyAt(s1);
                }
                Agent.Action a1 = this.greedy(s1, policyRandomness);
                
                //====================
                // Perform updates.
                if (bLearn) {
                    performUpdates(s, a, s1, a1, reward, learningRate, discountRate, eligibilityTraceDecay);
                }
                
                // Update to next state and action
                s = s1;
                a = a1;
            }
            
            // Do periodic evaluation if conditions are met.
            if (verbosityLevel >= 3 
                    && bLearn
                    && !bPrintAvgTotalReward
                    && (t % ((double)numOfEpisodes / 10.0) == 0)) 
            {
                System.out.print(String.format("    %7d", t));
                
                // Save the state of this agent.
                EnvCell2D savedState = this.getCurrentState();
                
                //=== Have the agent evaluate itself for 50 episodes. ===
                performEpisodes(learningRateDecay, randomActionThresholdDecay, 50, false, true);
                
                // Restore the previous state of this agent.
                this.setLocation(savedState.getX(), savedState.getY());
            }
            
            //========================
            //=== End of episode t ===
            if (bLearn) {
                if (t % learningRateDecay == 0) {
                    learningRate = getLearningRate() / (double)(1 + (t / learningRateDecay));
                    
                    // *** LOG: Print new alpha value ***
                    if (verbosityLevel >= 4) {
                        System.out.println(String.format("    (after episode %d, alpha to %.5f)", t, learningRate));
                    }
                }
                if (t % randomActionThresholdDecay == 0) {
                    policyRandomness = getPolicyRandomness() / (double)(1 + (t / randomActionThresholdDecay));
                    
                    // *** LOG: Print new epsilon value ***
                    if (verbosityLevel >= 4) {
                        System.out.println(String.format("    (after episode %d, epsilon to %.5f)", t, policyRandomness));
                    }
                }
                
                // *** LOG: Print resulting policy in episode t ***
                if (verbosityLevel >= 6) {
                    System.out.println(String.format("%s\r\n  * Resulting Policy of Episode %d\r\n", this.getPolicy(), t));
                    this.updatePolicy();
                }
            }
            
            
            avgTotalReward += totalReward;
        }
        
        // Calculate average total reward.
        avgTotalReward /= numOfEpisodes;
        
        // *** LOG: Show Rewards ***
        if (verbosityLevel >= 3 && bPrintAvgTotalReward) {
            System.out.println(String.format("    %7.3f", avgTotalReward));
        }
        
        // *** LOG: Done with learning ***
        if (verbosityLevel >= 1 && !bPrintAvgTotalReward) {
            if (bLearn) {
                System.out.println(String.format("  Done with learning!"));
            } else {
                System.out.println(String.format("  Avg. Total Reward of Learned Policy: %.3f", avgTotalReward));
            }
        }
        
        // Update the final policy
        this.updatePolicy();
        
        // Return the final learned policy π.
        return this.getPolicy();
    }

    /**
     * Performs updates to Q values, e values, and feature weights depending on the boolean parameters.
     * 
     * @param s - state
     * @param a - action
     * @param s1 - state prime 1
     * @param a1 - action prime 1
     * @param reward - reward for use in updates
     * @param bUseQLearning - if true, use Q-Learning. Otherwise use SARSA. 
     * @param bFeatureBasedLearning - if true, add on Feature Based Learning.
     */
    private void performUpdates(EnvCell2D s, 
                                Agent.Action a,
                                EnvCell2D s1,
                                Agent.Action a1,
                                double reward,
                                double learningRate,
                                double discountRate,
                                double eligibilityTraceDecay) 
    {
        // Variables
        double tdError;
        Agent.Action aStar = null;
        
        //================================
        //====== Calculate TD Error ======
        //================================
        if (bUseQLearning) {
            //=== Q-Learning: Calculate TD Error ===
            // If we have two or more optimal actions, pick one randomly.
            HashSet<Agent.Action> optimalActions = this.getBestActionsAt(s1.getX(), s1.getY());
            int optimalIndex = this.getPolicy().rand.nextInt(optimalActions.size());
            int optimalCount = 1;
            
            Iterator<Agent.Action> iter = optimalActions.iterator();
            aStar = iter.next();
            
            while (iter.hasNext()) {
                aStar = iter.next();
                if (optimalCount >= optimalIndex) {
                    break;
                }
                optimalCount++;
            }
            
            // Get TD error with aStar (optimal action)
            tdError = reward + discountRate * this.getQValueAt(s1, aStar) - this.getQValueAt(s, a);
        } else {
            //=== SARSA: Calculate TD Error ===
            tdError = reward + discountRate * this.getQValueAt(s1, a1) - this.getQValueAt(s, a);
        }
        
        //==================================================================
        //====== Update Q values; e values;                           ======
        //====== (Only update values depending on Agent's Parameters) ======
        //==================================================================
        if (Double.compare(eligibilityTraceDecay, 0) > 0) 
        {
            //======================================
            //=== Update WITH eligibility traces ===
            this.setEValueAt(s, a, this.getEValueAt(s, a) + 1);
            
            // For each, (s2, a2) ∈ S x A do
            for(Map.Entry<Integer, LinkedHashMap<Integer, QCell2D>> row : this.q.entrySet()) {
                LinkedHashMap<Integer, QCell2D> value = row.getValue();
                
                for (Map.Entry<Integer, QCell2D> column : value.entrySet()) {
                    QCell2D s2 = column.getValue();
                    
                    for (Map.Entry<Agent.Action, Double> qEntry : s2.getQValues().entrySet()) {
                        Agent.Action a2 = qEntry.getKey();
                        Double qValue = qEntry.getValue();
                        Double eValue = this.getEValueAt(s2, a2);
                        
                        // Update Q value.
                        if (!bFeatureBasedLearning) {
                            this.setQValueAt(s2, a2, qValue + learningRate * tdError * eValue);
                        }
                        
                        // Update e value.
                        if (bUseQLearning) {
                            // Q-Learning: e-value update
                            if (a1 == aStar) {
                                this.setEValueAt(s2, a2, discountRate * eligibilityTraceDecay * eValue);
                            } else {
                                this.setEValueAt(s2, a2, 0.0);
                            }
                        } else {
                            // SARSA: e-value update
                            this.setEValueAt(s2, a2, discountRate * eligibilityTraceDecay * eValue);
                        }
                    }
                }
            }
        } else {
            //============================================
            //=== Update WITHOUT do eligibility traces ===
            // Update Q value.
            if (!bFeatureBasedLearning) {
                this.setQValueAt(s, a, this.getQValueAt(s, a) + learningRate * tdError);
            }
        }
        
        // Update all weights if using feature based learning..
        if (bFeatureBasedLearning) {
            updateFeatureWeights(s, a, learningRate, tdError);
        }
        //=== Updates finished. ===
    }
    
    private void updateFeatureWeights(final State2D s,
                                      final Agent.Action a,
                                      final double learningRate, 
                                      final double tdError) 
    {
        for (FeatureEnv feature : this.features) 
        {
            // Calculate the feature function
            double fj = feature.f(s, a);
            double wj = feature.getWeight();
            
            // Update each feature's weight
            //System.out.println(String.format("Feature (%s): fj:%s wj:%s", feature.getFeatureName(), fj, wj));
            feature.setWeight( wj + learningRate * tdError * fj );
        }
    }
    
    /**
     * Gets the best actions for this agent at it's current location.
     * @return Returns the best actions.
     */
    public HashSet<Agent.Action> getBestActionsAtCurrentCell() {
        return getBestActionsAt(this.y, this.x);
    }
    
    /**
     * Gets the best actions at a given coordinate.
     * @param x - x coordinate
     * @param y - y coordinate
     * @return Returns the best actions.
     */
    public HashSet<Agent.Action> getBestActionsAt(final int x, final int y) 
    {
        return getBestActionsAt(this.q.get(y).get(x));
    }
    
    /**
     * Get the best actions at a particular cell using the Q values at a cell (state).
     * @param qCell
     * @return Returns the best actions at a particular cell.
     */
    public HashSet<Agent.Action> getBestActionsAt(final QCell2D qCell) 
    {
        HashMap<Action, Double> qValues = qCell.getQValues();
        HashSet<Agent.Action> bestActions = new HashSet<>();
        
        // Determine the best Q value.
        Double bestValue = Double.NEGATIVE_INFINITY;
        for(Map.Entry<Agent.Action, Double> entry : qValues.entrySet()) 
        {
            //Agent.Action key = entry.getKey();
            Double value = entry.getValue();
            
            // Get the best Q value.
            if (Double.compare(bestValue, value) < 0) {
                bestValue = value;
            }
        }
        
        // Add all actions the are equal to the best value.
        for(Map.Entry<Agent.Action, Double> entry : qValues.entrySet()) 
        {
            Agent.Action key = entry.getKey();
            Double value = entry.getValue();
            
            if (Double.compare(bestValue, value) <= 0) {
                bestActions.add(key);
            }
        }
        
        return bestActions;
    }
    
    /**
     * Gets the best set of actions that the agent can take in the environment at every state (cell).
     * @return Returns the best set of actions at every state (cell).
     */
    protected LinkedHashMapSet<HashSet<Agent.Action>> getBestSetOfActions() 
    {
        LinkedHashMapSet<HashSet<Agent.Action>> bestSetOfActions = new LinkedHashMapSet<>();
        
        for (Map.Entry<Integer, LinkedHashMap<Integer, QCell2D>> set : this.q.entrySet()) 
        {
            Integer key = set.getKey();
            LinkedHashMap<Integer, QCell2D> value = set.getValue();
            
            LinkedHashMap<Integer, HashSet<Agent.Action>> mapOfBestActions = new LinkedHashMap<>();
            bestSetOfActions.put(key, mapOfBestActions);
            
            for (Map.Entry<Integer, QCell2D> set2 : value.entrySet()) 
            {
                Integer key2 = set2.getKey();
                QCell2D value2 = set2.getValue();
                
                // Put best actions in the grid set.
                mapOfBestActions.put(key2, getBestActionsAt(value2));
            }
        }
        // Return the grid set of best actions.
        return bestSetOfActions;
    }
    
    /**
     * Get the environment that the agent is in.
     * @return Returns the environment.
     */
    public Environment2D getEnvironment() {
        return this.environment;
    }
    
    /**
     * Set the environment the agent will be in. Create a new Q state-action pairs and a new policy.
     * @param environment
     */
    private void setEnvironment(final Environment2D environment) 
    {
        this.environment = environment;
        addFeatures();
        createE();
        createQ();
        createPolicy();
        updatePolicy();
    }
    
    /**
     * Get the list of features for this agent.
     *      Each feature has a weight component.
     * @return Returns the list of features for this agent.
     */
    public List<FeatureEnv> getFeatures() {
        return this.features;
    }

    /**
     * Set the new list of features for this agent.
     * @param features - a list of new features
     */
    public void setFeatures(final List<FeatureEnv> features) {
        this.features = features;
    }
    
    /**
     * Creates and initializes the e state-action pairs for the environment.
     */
    private void createE() 
    {
        this.e = new LinkedHashMapSet<>();
        LinkedHashMapSet<EnvCell2D> cells = this.environment.getCells();
        
        for (Map.Entry<Integer, LinkedHashMap<Integer, EnvCell2D>> set: cells.entrySet()) 
        {
            Integer y = set.getKey();
            LinkedHashMap<Integer, EnvCell2D> value = set.getValue();
            
            LinkedHashMap<Integer, ECell2D> eCellMap = new LinkedHashMap<Integer, ECell2D>();
            this.e.put(y, eCellMap);
            
            for (Map.Entry<Integer, EnvCell2D> set2: value.entrySet()) 
            {
                Integer x = set2.getKey();
                //EnvCell value2 = set2.getValue();
                
                ECell2D eCell = new ECell2D(x, y);
                eCell.setEValues(0.0);
                
                eCellMap.put(x, eCell);
            }
        }
    }
    
    /**
     * Set the e values for all state-action pairs in every state (cell).
     * @param qValue - the e value
     */
    public void setAllEValues(final Double eValue) 
    {
        for (Map.Entry<Integer, LinkedHashMap<Integer, ECell2D>> set: this.e.entrySet()) 
        {
            //Integer key = set.getKey();
            LinkedHashMap<Integer, ECell2D> value = set.getValue();
            
            for (Map.Entry<Integer, ECell2D> set2: value.entrySet()) 
            {
                //Integer key2 = set2.getKey();
                ECell2D value2 = set2.getValue();
                
                value2.setEValues(eValue);
            }
        }
    }
    
    /**
     * Sets the state-action pair's e value.
     * @param state - state
     * @param action - action
     * @param qValue - the e value
     */
    public void setEValueAt(final State2D state, 
                            final Agent.Action action, 
                            final Double qValue) 
    {
        this.e.get(state.getY()).get(state.getX()).setE(action, qValue);
    }
    
    /**
     * Gets the state-action pair's e value.
     * @param state - state
     * @param action - action
     * @return Returns the e value.
     */
    public double getEValueAt(final State2D state, 
                              final Agent.Action action) 
    {
        return this.e.get(state.getY()).get(state.getX()).getE(action);
    }
    
    /**
     * Creates and initializes the Q state-action pairs for the environment.
     */
    private void createQ() 
    {
        this.q = new LinkedHashMapSet<>();
        LinkedHashMapSet<EnvCell2D> cells = this.environment.getCells();
        
        for (Map.Entry<Integer, LinkedHashMap<Integer, EnvCell2D>> set: cells.entrySet()) 
        {
            Integer y = set.getKey();
            LinkedHashMap<Integer, EnvCell2D> value = set.getValue();
            
            LinkedHashMap<Integer, QCell2D> qCellMap = new LinkedHashMap<Integer, QCell2D>();
            this.q.put(y, qCellMap);
            
            for (Map.Entry<Integer, EnvCell2D> set2: value.entrySet()) 
            {
                Integer x = set2.getKey();
                //EnvCell value2 = set2.getValue();
                
                QCell2D qCell = new QCell2D(x, y);
                qCell.setQValues(0.0);
                
                qCellMap.put(x, qCell);
            }
        }
    }
    
    /**
     * Set the Q values for all state-action pairs in every state (cell).
     * @param qValue - the Q value
     */
    public void setAllQValues(final Double qValue) 
    {
        for (Map.Entry<Integer, LinkedHashMap<Integer, QCell2D>> set: this.q.entrySet()) 
        {
            //Integer key = set.getKey();
            LinkedHashMap<Integer, QCell2D> value = set.getValue();
            
            for (Map.Entry<Integer, QCell2D> set2: value.entrySet()) 
            {
                //Integer key2 = set2.getKey();
                QCell2D value2 = set2.getValue();
                
                value2.setQValues(qValue);
            }
        }
    }
    
    /**
     * Sets the state-action pair's Q value.
     * @param state - state
     * @param action - action
     * @param qValue - the Q value
     */
    public void setQValueAt(final State2D state, 
                            final Agent.Action action, 
                            final Double qValue) 
    {
        this.q.get(state.getY()).get(state.getX()).setQ(action, qValue);
    }
    
    /**
     * Gets the state-action pair's Q value.
     * @param state - state
     * @param action - action
     * @return Returns the Q value.
     */
    public double getQValueAt(final State2D state, 
                              final Agent.Action action) 
    {
        if (bFeatureBasedLearning) {
            double qValue = 0;
            for (FeatureEnv feature : this.features) {
                qValue += feature.getWeight() * feature.f(state, action);
            }
            return qValue;
        } else {
            return this.q.get(state.getY()).get(state.getX()).getQ(action);
        }
    }
    
    /**
     * Gets the max Q value at a given state for all state-actions pairs in the given state.
     * @param state - state
     * @return Returns the max Q value.
     */
    public double getMaxQValueAt(final State2D state) 
    {
        // Get the best actions with the highest Q values.
        HashSet<Agent.Action> actions = getBestActionsAt(state.getX(), state.getY());
        
        // Pick any action in this set because all actions in this set are same max value.
        Agent.Action maxAction = actions.iterator().next();
        
        // Return the Q value for the max valued action.
        return this.q.get(state.getY()).get(state.getX()).getQ(maxAction);
    }
    
    /**
     * Creates a new policy for this agent.
     */
    private void createPolicy() 
    {
        this.policy = new Policy(this, this.bUnicode);
    }
    
    /**
     * Update this agent's policy to the agent's best Q values for every state-action pair in all states (cells).
     */
    public void updatePolicy() 
    {
        if (bFeatureBasedLearning) {
            // Replace all Q values for every state if feature based.
            for (Map.Entry<Integer, LinkedHashMap<Integer, QCell2D>> set: this.q.entrySet()) {
                for (Map.Entry<Integer, QCell2D> set2: set.getValue().entrySet()) {
                    QCell2D state = set2.getValue();
                    Agent.Action[] actions = Agent.Action.values();
                    for (Agent.Action action : actions) {
                        this.setQValueAt(state, action, this.getQValueAt(state, action) );
                    }
                }
            }
        }
        // Update Policy based on current Q Values.
        this.policy.updatePolicy();
    }
    
    /**
     * Updates the best action for the policy, but only at a given state.
     * @param state - the state to update for the policy.
     */
    private void updatePolicyAt(State2D state) 
    {
        if (bFeatureBasedLearning) {
            Agent.Action[] actions = Agent.Action.values();
            for (Agent.Action action : actions) {
                this.setQValueAt(state, action, this.getQValueAt(state, action) );
            }
        }
        this.policy.updatePolicyAt(state);
    }
    
    /**
     * Return this agent's policy.
     * @return Returns the policy.
     */
    public Policy getPolicy() {
        return this.policy;
    }
    
    /**
     * Gets this agent's id.
     * @return Returns agent's id.
     */
    protected int getId() {
        return this.id;
    }
    
    /**
     * Sets this agent's id.
     * @param id
     */
    protected void setId(final int id) {
        this.id = id;
    }
    
    /**
     * Gets this agent's name.
     * @return Returns agent's name.
     */
    protected String getName() {
        return this.name;
    }
    
    /**
     * Sets this agent's name
     * @param name
     */
    protected void setName(final String name) {
        this.name = name;
    }
    
    /**
     * Gets the max health of this agent.
     * @return Returns the max health.
     */
    public int getMaxHealth() {
        return this.maxHealth;
    }
    
    /**
     * Sets the max health of this agent.
     * @param maxHealth - agent max health
     */
    public void setMaxHealth(final int maxHealth) {
        this.maxHealth = maxHealth;
    }
    
    /**
     * Gets the current health of this agent. 
     * @return Returns the current health.
     */
    public int getHealth() {
        return this.health;
    }
    
    /**
     * Sets the current health of this agent.
     * @param health - agent health
     */
    private void setHealth(final int health) 
    {
        int maxHealth = getMaxHealth();
        if (health > maxHealth) {
            setHealth(maxHealth);
        } else if (health < 0) {
            setHealth(0);
        } else {
            this.health = health;
        }
    }
    
    /**
     * Set the location of this agent.
     * @param x - x location
     * @param y - y location
     */
    public void setLocation(final int x, final int y) {
        if (null == this.getEnvironment().getCellAt(x, y)) {
            System.err.println(
                    String.format(
                            "Agent %s (id:%d) tried to set their location to an invalid state.", this.getName(), this.getId()));
            return;
        }
        setX(x);
        setY(y);
    }
    
    /**
     * Gets the x position of this agent.
     * @return Returns the x position.
     */
    public int getX() {
        return this.x;
    }
    
    /**
     * Sets the x position of this agent.
     * @param x - x location
     */
    private void setX(final int x) {
        this.x = x;
    }
    
    /**
     * Gets the y position of this agent.
     * @return Returns the y position.
     */
    public int getY() {
        return this.y;
    }
    
    /**
     * Sets the y position of this agent.
     * @param y - y location
     */
    private void setY(final int y) {
        this.y = y;
    }
    
    /**
     * Sets the verbosity level for logging purposes.
     * @param verbosityLevel
     */
    private void setVerbosityLevel(final int verbosityLevel) {
        this.verbosityLevel = verbosityLevel;
    }
    
    /**
     * Get the agent's learning rate.
     * @return Returns the agent's learning rate.
     */
    public double getLearningRate() {
        return this.learningRate;
    }
    
    /**
     * Set the agent's learning rate.
     */
    public void setLearningRate(final double learningRate) {
        this.learningRate = learningRate;
    }
    
    /**
     * Get the agent's policy randomness.
     * @return Returns the agent's policy randomness.
     */
    public double getPolicyRandomness() {
        return this.policyRandomness;
    }
    
    /**
     * Set the agent's policy randomness.
     */
    public void setPolicyRandomness(final double policyRandomness) {
        this.policyRandomness = policyRandomness;
    }
    
    /**
     * Get the agent's discount rate.
     * @return Returns the agent's discount rate.
     */
    public double getDiscountRate() {
        return this.discountRate;
    }
    
    /**
     * Set the agent's discount rate.
     */
    public void setDiscountRate(final double discountRate) {
        this.discountRate = discountRate;
    }
    
    /**
     * Get the agent's eligibility trace decay.
     * @return Returns the agent's eligibility trace decay.
     */
    public double getEligibilityTraceDecay() {
        return this.eligibilityTraceDecay;
    }
    
    /**
     * Set the agent's eligibility trace decay.
     */
    public void setEligibilityTraceDecay(final double eligibilityTraceDecay) {
        this.eligibilityTraceDecay = eligibilityTraceDecay;
    }
    
    /**
     * Check if this agent is using Q-Learning or SARSA.
     * @return Returns true if using Q-Learning. Otherwise return false if using SARSA.
     */
    public boolean isbUseQLearning() {
        return bUseQLearning;
    }
    
    /**
     * Set true to use Q-Learning. Otherwise set false to use SARSA.
     * @param bUseQLearning
     */
    public void setbUseQLearning(final boolean bUseQLearning) {
        this.bUseQLearning = bUseQLearning;
    }
    
    /**
     * Check if this agent is using feature based learning.
     * @return Returns true if using feature based learning.
     */
    public boolean isbFeatureBasedLearning() {
        return bFeatureBasedLearning;
    }
    
    /**
     * Set true to use Feature Based Learning for Q value updates. 
     * @param bFeatureBasedLearning
     */
    public void setbFeatureBasedLearning(final boolean bFeatureBasedLearning) {
        this.bFeatureBasedLearning = bFeatureBasedLearning;
    }
    
    /**
     * If true, then this agent's policy will display in Unicode.
     * Otherwise display in ASCII.
     * @param bUnicode
     */
    public void setbUnicode(final boolean bUnicode) {
        if (null != this.getPolicy()) {
            this.getPolicy().setbUnicode(bUnicode);
        }
        this.bUnicode = bUnicode;
    }
    
    /**
     * Print the Agent's Q values for every state-action pair in each state (cell).
     */
    public void printQValues() 
    {
        int maxR = this.q.size();
        
        StringBuilder sb = new StringBuilder();
        
        int maxCFinal = 0;
        for (int r = 0; r < maxR; r++) 
        {
            int maxC = this.q.get(r).size();
            
            sb.append("-");
            for (int c = 0; c < maxC; c++) {
                sb.append("-----------");
            }
            sb.append("\r\n");
            for (int c = 0; c < maxC; c++) {
                sb.append(String.format("|  %6.1f  ", this.q.get(r).get(c).getQ(Agent.Action.UP)));
            }
            sb.append("|\r\n");
            for (int c = 0; c < maxC; c++) {
                sb.append(String.format("|%-6.1f    ", this.q.get(r).get(c).getQ(Agent.Action.LEFT)));
            }
            sb.append("|\r\n");
            for (int c = 0; c < maxC; c++) {
                sb.append(String.format("|    %6.1f", this.q.get(r).get(c).getQ(Agent.Action.RIGHT)));
            }
            sb.append("|\r\n");
            for (int c = 0; c < maxC; c++) {
                sb.append(String.format("|  %6.1f  ", this.q.get(r).get(c).getQ(Agent.Action.DOWN)));
            }
            sb.append("|\r\n");
            maxCFinal = maxC;
        }
        
        sb.append("-");
        for (int c = 0; c < maxCFinal; c++) {
            sb.append("-----------");
        }
        
        System.out.println( sb.toString() );
    }
}
