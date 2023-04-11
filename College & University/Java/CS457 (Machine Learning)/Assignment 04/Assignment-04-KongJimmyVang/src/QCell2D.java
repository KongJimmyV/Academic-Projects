import java.util.HashMap;

/**
 * Project Name:    Assignment 4            <br>
 * File Name:       QCell2D.java            <br>
 * Description:     This is a state (cell) that stores Q values for each state-action pair in this state. <br><br>
 * 
 * Date Created:    12/9/22                <br>
 * Date Modified:   12/13/22                <br>
 * Class:           CS457 (Fall 2022)       <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class QCell2D extends State2D
{
    /** Store Q values for the state-action pairs at this state (cell) */
    private HashMap<Agent.Action, Double> qValues;
    
    /**
     * Construct the cell with the given coordinates.
     * @param x - x coordinate
     * @param y - y coordinate
     */
    public QCell2D(final int x, final int y) 
    {
        super(x, y);
        this.qValues = new HashMap<Agent.Action, Double>();
        //initializeQValues(0.0);
    }
    
    /**
     * Set all Q values to a given value.
     * @param value - given value
     */
    public void setQValues(final Double value) 
    {
        for (Agent.Action action : Agent.Action.values()) {
            setQ(action, value);
        }
    }
    
    /**
     * Gets the map of all Q values for at this cell (state).
     * @return Returns the map of Q values.
     */
    public HashMap<Agent.Action, Double> getQValues() {
        return this.qValues;
    }
    
    /**
     * Set the Q value for the given action to a given value.
     * @param action - given action
     * @param value - given value
     */
    public void setQ(final Agent.Action action, final Double value) {
        this.qValues.put(action, value);
    }
    
    /**
     * Get the Q value given an action at this cell (state).
     * @param action - given action
     * @return Returns the Q value for an action at this cell (state).
     */
    public Double getQ(final Agent.Action action) {
        return this.qValues.get(action);
    }
    
    @Override
    public String toString() 
    {
        // Return a string representation of Q values for this state (cell).
        StringBuilder sb = new StringBuilder();
        sb.append("------------\r\n");
        sb.append(String.format("|  %6.1f  |\r\n", getQ(Agent.Action.UP)));
        sb.append(String.format("|%-6.1f    |\r\n", getQ(Agent.Action.LEFT)));
        sb.append(String.format("|    %6.1f|\r\n", getQ(Agent.Action.RIGHT)));
        sb.append(String.format("|  %6.1f  |\r\n", getQ(Agent.Action.DOWN)));
        sb.append("------------\r\n");
        return sb.toString();
    }
}
