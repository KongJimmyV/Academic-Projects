import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Project Name:    Assignment 4                    <br>
 * File Name:       Policy.java                     <br>
 * Description:     This represents a Policy π. <br><br>
 * 
 * Date Created:    12/5/22                <br>
 * Date Modified:   12/14/22                <br>
 * Class:           CS457 (Fall 2022)       <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class Policy 
{
    /** Represents the Environment with the set of greedy actions to take at any particular state. */
    private LinkedHashMapSet<HashSet<Agent.Action>> policyActions;
    
    /** The Agent that has this Policy */
    private Agent agent;
    
    /** If true, output best action sets in each cell in unicode */
    private boolean bUnicode;
    
    /** Random Number Generator for Policy */
    protected Random rand;
    
    /**
     * Constructs a policy for an agent and a given environment. Generates a random seed for the random number generator.
     * @param agent - the agent this policy belongs to
     * @param bUnicode - if true, return toString representation of the policy in unicode.
     */
    public Policy(final Agent agent, final boolean bUnicode) 
    {
        this(agent, bUnicode, new Random().nextLong());
    }
    
    /**
     * Constructs a policy for an agent and a given environment with a given seed for the random number generator.
     * @param agent - the agent this policy belongs to
     * @param bUnicode - if true, return toString representation of the policy in unicode.
     * @param seed - the seed for RNG
     */
    public Policy(final Agent agent, final boolean bUnicode, long seed) 
    {
        this.policyActions = new LinkedHashMapSet<>();
        this.agent = agent;
        setbUnicode(bUnicode);
        this.rand = new Random(seed);
        initializePolicy();
    }
    
    /**
     * Returns this policy's greedy action, based on the given state, using the policy's Q policy.
     * @param state - the given state
     * @param policyRandomness - the policy randomness, ε.
     * @return Returns this policy's greedy action.
     */
    public Agent.Action greedy(final EnvCell2D state, final double policyRandomness) 
    {
        Agent.Action pickedAction = null;
        
        double r = rand.nextDouble();
        
        if (r < policyRandomness) {
            // Choose an action at random.
            Agent.Action[] actions = Agent.Action.values();
            pickedAction = actions[ rand.nextInt(actions.length) ];
        } else {
            // Choose an action greedily via argmax(a element of A) [Q(s, a)].
            List<Agent.Action> actions = new ArrayList<>( this.policyActions.get(state.getY()).get(state.getX()));
            pickedAction = actions.get( rand.nextInt(actions.size()) );
        }
        
        return pickedAction;
    }
    
    /**
     * Initializes the policy to the agent's environment.
     */
    private void initializePolicy() 
    {
        this.policyActions.clear();
        LinkedHashMapSet<EnvCell2D> cells = this.agent.getEnvironment().getCells();
        
        for (Map.Entry<Integer, LinkedHashMap<Integer, EnvCell2D>> set: cells.entrySet()) 
        {
            Integer key = set.getKey();
            LinkedHashMap<Integer, EnvCell2D> value = set.getValue();
            
            LinkedHashMap<Integer, HashSet<Agent.Action>> actions = new LinkedHashMap<>();
            this.policyActions.put(key, actions);
            
            for (Map.Entry<Integer, EnvCell2D> set2: value.entrySet()) 
            {
                Integer key2 = set2.getKey();
                //EnvCell value2 = set2.getValue();
                
                actions.put(key2, new HashSet<Agent.Action>());
            }
        }
    }
    
    /**
     * Update this policy's agent to the agent's best Q values for every state-action pair in all states (cells).
     */
    public void updatePolicy() 
    {
        this.policyActions = this.agent.getBestSetOfActions();
    }
    
    public void updatePolicyAt(State2D state) 
    {
        int x = state.getX();
        int y = state.getY();
        //System.out.println(this.agent.getBestActionsAt(x, y));
        this.policyActions.get(y).put(x, this.agent.getBestActionsAt(x, y));
    }
    
    /**
     * Get this policy's best action as a character at the given coordinates.
     * @param x - x coordinate
     * @param y - y coordinate
     * @return Returns this policy's best action as a character.
     */
    private char getActionChar(final int x, final int y) 
    {
        char cellType = this.agent.getEnvironment().getCells().get(y).get(x).getCellType();
        HashSet<Agent.Action> set = this.policyActions.get(y).get(x);
        
        // Return the cell type char instead of action char.
        if (cellType == EnvCell2D.CellType.MINE.toChar()
                || cellType == EnvCell2D.CellType.GOAL.toChar()
                || cellType == EnvCell2D.CellType.BLOCK.toChar()) 
        {
            return cellType;
        }
        
        // Find and return the action char.
        char c = '?';
        if (set.contains(Agent.Action.UP)
                && set.contains(Agent.Action.DOWN)
                && set.contains(Agent.Action.LEFT)
                && set.contains(Agent.Action.RIGHT)) {
            if (bUnicode) { c = '+'; } else { c = '+'; }
        } else if (set.contains(Agent.Action.UP)
                && set.contains(Agent.Action.LEFT)
                && set.contains(Agent.Action.RIGHT)) {
            if (bUnicode) { c = '\u22a5'; } else { c = '^'; }
        } else if (set.contains(Agent.Action.DOWN)
                && set.contains(Agent.Action.LEFT)
                && set.contains(Agent.Action.RIGHT)) {
            if (bUnicode) { c = '\u22a4'; } else { c = 'v'; }
        } else if (set.contains(Agent.Action.UP)
                && set.contains(Agent.Action.DOWN)
                && set.contains(Agent.Action.LEFT)) {
            if (bUnicode) { c = '\u22a3'; } else { c = '<'; }
        } else if (set.contains(Agent.Action.UP)
                && set.contains(Agent.Action.DOWN)
                && set.contains(Agent.Action.RIGHT)) {
            if (bUnicode) { c = '\u22a2'; } else { c = '>'; }
        } else if (set.contains(Agent.Action.DOWN)
                && set.contains(Agent.Action.LEFT)) {
            if (bUnicode) { c = '\u2199'; } else { c = '/'; }
        } else if (set.contains(Agent.Action.DOWN)
                && set.contains(Agent.Action.RIGHT)) {
            if (bUnicode) { c = '\u2198'; } else { c = '\\'; }
        } else if (set.contains(Agent.Action.UP)
                && set.contains(Agent.Action.RIGHT)) {
            if (bUnicode) { c = '\u2197'; } else { c = '/'; }
        } else if (set.contains(Agent.Action.UP)
                && set.contains(Agent.Action.LEFT)) {
            if (bUnicode) { c = '\u2196'; } else { c = '\\'; }
        } else if (set.contains(Agent.Action.UP)
                && set.contains(Agent.Action.DOWN)) {
            if (bUnicode) { c = '\u2195'; } else { c = '|'; }
        } else if (set.contains(Agent.Action.LEFT)
                && set.contains(Agent.Action.RIGHT)) {
            if (bUnicode) { c = '\u2194'; } else { c = '-'; }
        } else if (set.contains(Agent.Action.DOWN)) {
            if (bUnicode) { c = '\u2193'; } else { c = 'v'; }
        } else if (set.contains(Agent.Action.RIGHT)) {
            if (bUnicode) { c = '\u2192'; } else { c = '>'; }
        } else if (set.contains(Agent.Action.UP)) {
            if (bUnicode) { c = '\u2191'; } else { c = '^'; }
        } else if (set.contains(Agent.Action.LEFT)) {
            if (bUnicode) { c = '\u2190'; } else { c = '<'; }
        }
        return c;
    }
    
    /**
     * If true, then this policy will display in Unicode.
     * Otherwise display in ASCII.
     * @param bUnicode
     */
    public void setbUnicode(boolean bUnicode) {
        this.bUnicode = bUnicode;
    }

    @Override
    public String toString() 
    {
        StringBuilder sb = new StringBuilder();
        
        int maxR = this.policyActions.size();
        for (int r = 0; r < maxR; r++) 
        {
            int maxC = this.policyActions.get(r).size();
            for (int c = 0; c < maxC; c++) 
            {
                sb.append(getActionChar(c, r));
            }
            sb.append("\r\n");
        }
        sb.delete(sb.length() - 2, sb.length());
        return sb.toString();
    }
}
