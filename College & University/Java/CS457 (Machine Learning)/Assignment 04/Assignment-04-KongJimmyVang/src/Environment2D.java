import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

/**
 * Project Name:    Assignment 4        <br>
 * File Name:       Environment2D.java  <br>
 * Description:     This simulates a simple grid world environment. <br><br>
 * 
 * Date Created:    12/5/22            <br>
 * Date Modified:   12/14/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class Environment2D 
{
    /** A HashMap of all cells (states) */
    private LinkedHashMapSet<EnvCell2D> cells;
    
    /** The starting cell (state) */
    private EnvCell2D startCell;
    
    /** The list of goal cells (states) */
    private List<EnvCell2D> goalCells;
    
    /** The list of block cells (states) */
    protected List<EnvCell2D> blocks;
    
    /** The list of mine cells (states) */
    protected List<EnvCell2D> mines;
    
    /** The list of cliff cells (states) */
    protected List<EnvCell2D> cliffs;
    
    /** Action Success Probability in this Environment */
    private double actionSuccessProbability;
    
    /** Random Number Generator for Environment */
    private Random rand;
    
    /**
     * Constructs an environment based on a path name to a file, and the parameters.
     * @param pathname - the path to a file
     * @throws FileNotFoundException thrown if the given file cannot be found.
     */
    public Environment2D(final String pathname, 
                         double actionSuccessProbability) throws FileNotFoundException 
    {
        this(pathname, actionSuccessProbability, new Random().nextLong());
    }
    
    /**
     * Constructs an environment based on a path name to a file, and the parameters.
     * @param pathname - the path to a file
     * @param actionSuccessProbability - specifies the action success probability
     * @param seed - the seed for RNG
     * @throws FileNotFoundException thrown if the given file cannot be found.
     */
    public Environment2D(final String pathname, 
                         double actionSuccessProbability,
                         long seed) throws FileNotFoundException 
    {
        this(new File(pathname), actionSuccessProbability, seed);
    }
    
    /**
     * Constructs an environment based on a given File, and the parameters.
     * @param file - the file
     * @throws FileNotFoundException thrown if the given file cannot be found.
     */
    public Environment2D(final File file, 
                         double actionSuccessProbability,
                         long seed) throws FileNotFoundException 
    {
        this.actionSuccessProbability = actionSuccessProbability;
        this.rand = new Random(seed);
        buildEnvironment(file);
    }
    
    /**
     * Builds the environment with the given file as input.
     * @param file - the file
     * @throws FileNotFoundException thrown if the given file cannot be found.
     */
    private void buildEnvironment(final File file) throws FileNotFoundException 
    {
        this.cells = new LinkedHashMapSet<>();
        this.goalCells = new ArrayList<>();
        this.blocks = new ArrayList<>();
        this.mines = new ArrayList<>();
        this.cliffs = new ArrayList<>();
        
        final Scanner scanner = new Scanner(file);
        
        // Read file.
        int r = 0;
        while (scanner.hasNextLine()) 
        {
            String line = scanner.nextLine();
            
            // Ignore comments
            if (Utilities.containsCommentOrEmptyLine(line)) {
                continue;
            }
            //System.out.println(line);
            
            LinkedHashMap<Integer, EnvCell2D> mapColumns = new LinkedHashMap<>();
            this.cells.put(r, mapColumns);
            
            // Build columns
            int c = 0;
            int i = 0;
            while (c < line.length()) 
            {
                Character character = line.charAt(i++);
                if (character == ' ') {
                    continue;
                }
                
                EnvCell2D cell = new EnvCell2D(c, r, character);
                mapColumns.put(c, cell);
                
                if (character == EnvCell2D.CellType.START.toChar()) {
                    this.startCell = cell;
                } else if (character == EnvCell2D.CellType.GOAL.toChar()) {
                    goalCells.add(cell);
                } else if (character == EnvCell2D.CellType.BLOCK.toChar()) {
                    blocks.add(cell);
                } else if (character == EnvCell2D.CellType.MINE.toChar()) {
                    mines.add(cell);
                } else if (character == EnvCell2D.CellType.CLIFF.toChar()) {
                    cliffs.add(cell);
                }
                
                c++;
            }
            r++;
        }
        scanner.close();
    }
    
    /**
     * Give feedback to the agent that wants to executed a given action.
     * Move the agent to the new State for executing the given action.
     * 
     * @param agent - the agent that wants to execute the action
     * @param action - the action to execute
     * @return Returns the new state that the Environment has put the agent in.
     */
    public EnvCell2D executeAction(final Agent agent, final Agent.Action action) 
    {
        //=================================
        //=== Simulate the Action first ===
        // This simple simulation function will see what happens when the agent tries to execute the action.
        // The simulation will return the state that this agent will end up in if it executes the action.
        EnvCell2D finalState = simulateAction(agent, action);
        
        //===========================
        //=== Execute the Action. ===
        agent.moveTo(finalState);
        
        //=== Effects for the Agent based on the State that was entered. ===
        switch (finalState.getCellTypeEnum()) 
        {
            case START: // No Effect
                break;
            case GOAL:  // No Effect
                break;
            case EMPTY: // No Effect
                break;
            case BLOCK: // No Effect
                break;
            case MINE:  // Destroy the Agent.
                agent.takeDamage(agent.getMaxHealth());
                break;
            case CLIFF: // No Effect
                break;
            default:    // No Effect
        }
        
        //=== Return the final state that the agent has moved to. ===
        return finalState;
    }
    
    /**
     * Simulates the action for an agent.
     * @param agent - the agent that wants to simulate the action
     * @param action - the action to simulate for the agent
     * @return Returns the final state that the simulation predicts.
     */
    protected EnvCell2D simulateAction(final Agent agent, final Agent.Action action) {
        return this.simulateAction(agent.getCurrentState(), action);
    }
    
    /**
     * Simulates the action at a given state.
     * @param state - the state to start at
     * @param action - the action to simulate at this state
     * @return Returns the final state that the simulation predicts.
     */
    protected EnvCell2D simulateAction(final EnvCell2D state, final Agent.Action action) {
        return simulateAction(state, action, this.actionSuccessProbability);
    }
    /**
     * Simulates the action at a given state.
     * @param state - the state to start at
     * @param action - the action to simulate at this state
     * @return Returns the final state that the simulation predicts.
     */
    protected EnvCell2D simulateAction(final EnvCell2D state,
                                       final Agent.Action action,
                                       final double actionSuccessProbability) 
    {
        EnvCell2D possibleState = null;
        EnvCell2D finalState = null;
        int x = 0;
        int y = 0;
        
        if (state.getCellTypeEnum() == EnvCell2D.CellType.CLIFF) 
        {
            // Acting in a cliff cell would simulate the agent returning to the start state.
            x = this.getStartCell().getX();
            y = this.getStartCell().getY();
        } 
        else 
        {   
            // Normal simulated movement.
            switch (action) 
            {
                case LEFT:
                    x = state.getX() - 1;
                    y = state.getY();
                    break;
                case UP:
                    x = state.getX();
                    y = state.getY() - 1;
                    break;
                case RIGHT:
                    x = state.getX() + 1;
                    y = state.getY();
                    break;
                case DOWN:
                    x = state.getX();
                    y = state.getY() + 1;
                    break;
            }
        }
        
        //=== Attempt movement with action success probability. ===
        double p = rand.nextDouble();
        if ((Double.compare(p, actionSuccessProbability) >= 0)) 
        {
            // Action did not succeed as intended, now drifting
            double drift = rand.nextDouble();
            if (Double.compare(drift, 0.5) < 0) 
            {
                // Drift to the agent's left.
                switch (action) 
                {
                    case LEFT:
                        y++;
                        break;
                    case UP:
                        x--;
                        break;
                    case RIGHT:
                        y--;
                        break;
                    case DOWN:
                        x++;
                        break;
                }
            } 
            else 
            {
                // Drift to the agent's right.
                switch (action) 
                {
                    case LEFT:
                        y--;
                        break;
                    case UP:
                        x++;
                        break;
                    case RIGHT:
                        y++;
                        break;
                    case DOWN:
                        x--;
                        break;
                }
            }
        }
        
        // Get the state that would result from this movement.
        possibleState = getCellAt(x, y);
        
        //=== Validate the possible state and execute the action to enter the state. ===
        if (null != possibleState) 
        {
            // non-null state (in bounds): Attempt to move.
            boolean isValid;
            switch (possibleState.getCellTypeEnum()) 
            {
                case START: // Validate the action
                    isValid = true;
                    break;
                case GOAL:  // Validate the action
                    isValid = true;
                    break;
                case EMPTY: // Validate the action
                    isValid = true;
                    break;
                case BLOCK: // Invalidate the action
                    isValid = false;
                    break;
                case MINE:  // Validate the action
                    isValid = true;
                    break;
                case CLIFF: // Validate the action
                    isValid = true;
                    break;
                default:
                    isValid = false;
                    break;
            }
            if (isValid) {
                finalState = possibleState;
            } else {
                finalState = state;
            }
        } 
        else 
        {
            // null state (out of bounds): This action goes out of bounds, 
            //      it will result in the agent returning to their current state.
            finalState = state;
        }
        
        // Return the final state calculated from the simulation.
        return finalState;
    }
    
    /**
     * Calculate the reward for performing an action from the current state to the new state.
     * @param currentState - current state
     * @param action - action
     * @param newState - new state
     * @return Returns the calculated one-step reward.
     */
    public double reward(final EnvCell2D currentState, 
                         final Agent.Action action, 
                         final EnvCell2D newState) 
    {
        double reward = 0;
        
        switch (newState.getCellTypeEnum()) 
        {
            case GOAL:  // Entering a goal cell yields a reward of +10.
                reward = 10;
                break;
            case MINE:  // Entering a mine cell yields a reward of −100.
                reward = -100;
                break;
            case CLIFF: // Entering a cliff cell yields a reward of −20.
                reward = -20;
                break;
            default:    // Any other result yields a reward of −1.
                reward = -1;
        }
        
        switch (currentState.getCellTypeEnum()) 
        {
            case CLIFF:
                switch (newState.getCellTypeEnum()) 
                {
                    case START:  // Acting in a cliff cell and returning to the start yields a reward of −10.
                        reward = -10;
                        break;
                    default:
                }
                break;
            default:
        }
        
        return reward;
    }
    
    
    public LinkedHashMapSet<EnvCell2D> getCells() {
        return this.cells;
    }
    
    /**
     * Get the cell at a given coordinate.
     * @param x - x coordinate
     * @param y - y coordinate
     * @return Returns the cell, otherwise return null if state was not found.
     */
    public EnvCell2D getCellAt(final int x, final int y) {
        if (null == this.cells.get(y)) {
            return null;
        }
        return this.cells.get(y).get(x);
    }
    
    /**
     * Get the start cell.
     * @return Return the start cell.
     */
    public EnvCell2D getStartCell() {
        return this.startCell;
    }
    
    /**
     * Get the list of goal cells.
     * @return Return the list of goal cells.
     */
    public List<EnvCell2D> getGoalCells() {
        return this.goalCells;
    }
    
    /**
     * Set the action success probability.
     * @param actionSuccessProbability
     */
    protected void setActionSuccessProbability(double actionSuccessProbability) {
        this.actionSuccessProbability = actionSuccessProbability;
    }
    
    /**
     * Get the action success probability.
     * @return Returns the action success probability.
     */
    protected double getActionSuccessProbability() {
        return this.actionSuccessProbability;
    }
    
    @Override
    public String toString() 
    {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<Integer, LinkedHashMap<Integer, EnvCell2D>> set: this.cells.entrySet()) 
        {
            //Integer key = set.getKey();
            LinkedHashMap<Integer, EnvCell2D> value = set.getValue();
            
            for (Map.Entry<Integer, EnvCell2D> set2: value.entrySet()) 
            {
                //Integer key2 = set2.getKey();
                EnvCell2D value2 = set2.getValue();
                sb.append(value2);
            }
            sb.append("\r\n");
        }
        sb.delete(sb.length() - 2, sb.length());
        return sb.toString();
    }
}
