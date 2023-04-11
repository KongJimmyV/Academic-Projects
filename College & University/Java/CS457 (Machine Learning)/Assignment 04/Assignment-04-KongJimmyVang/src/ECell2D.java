import java.util.HashMap;

/**
 * Project Name:    Assignment 4            <br>
 * File Name:       ECell2D.java            <br>
 * Description:     This is a state (cell) that stores e values (Eligibility Traces) 
 *                      for each state-action pair in this state. <br><br>
 * 
 * Date Created:    12/11/22                <br>
 * Date Modified:   12/13/22                <br>
 * Class:           CS457 (Fall 2022)       <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class ECell2D extends State2D
{
    /** Store e values for the state-action pairs at this state (cell) */
    private HashMap<Agent.Action, Double> eValues;
    
    /**
     * Construct the cell with the given coordinates.
     * @param x - x coordinate
     * @param y - y coordinate
     */
    public ECell2D(final int x, final int y) 
    {
        super(x, y);
        this.eValues = new HashMap<Agent.Action, Double>();
        //initializeQValues(0.0);
    }
    
    /**
     * Set all e values to a given value.
     * @param value - given value
     */
    public void setEValues(final Double value) 
    {
        for (Agent.Action action : Agent.Action.values()) {
            setE(action, value);
        }
    }
    
    /**
     * Gets the map of all e values for at this cell (state).
     * @return Returns the map of e values.
     */
    public HashMap<Agent.Action, Double> getEValues() {
        return this.eValues;
    }
    
    /**
     * Set the e value for the given action to a given value.
     * @param action - given action
     * @param value - given value
     */
    public void setE(final Agent.Action action, final Double value) {
        this.eValues.put(action, value);
    }
    
    /**
     * Get the e value given an action at this cell (state).
     * @param action - given action
     * @return Returns the e value for an action at this cell (state).
     */
    public Double getE(final Agent.Action action) {
        return this.eValues.get(action);
    }
    
    @Override
    public String toString() 
    {
        // Return a string representation of e values for this state (cell).
        StringBuilder sb = new StringBuilder();
        sb.append("------------\r\n");
        sb.append(String.format("|  %6.1f  |\r\n", getE(Agent.Action.UP)));
        sb.append(String.format("|%-6.1f    |\r\n", getE(Agent.Action.LEFT)));
        sb.append(String.format("|    %6.1f|\r\n", getE(Agent.Action.RIGHT)));
        sb.append(String.format("|  %6.1f  |\r\n", getE(Agent.Action.DOWN)));
        sb.append("------------\r\n");
        return sb.toString();
    }
}
