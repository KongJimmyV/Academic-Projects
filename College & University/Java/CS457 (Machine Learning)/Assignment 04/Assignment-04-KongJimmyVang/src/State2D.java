
/**
 * Project Name:    Assignment 4            <br>
 * File Name:       State2D.java            <br>
 * Description:     This is a basic State for any 2D Environment. <br><br>
 * 
 * Date Created:    12/9/22                <br>
 * Date Modified:   12/14/22                <br>
 * Class:           CS457 (Fall 2022)       <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class State2D 
{
    /** X coordinate location */
    private int x;
    
    /** Y coordinate location */
    private int y;
    
    /**
     * Constructs a state at the given coordinates.
     * @param x - x coordinate
     * @param y - y coordinate
     */
    public State2D(final int x, final int y) {
        this.x = x;
        this.y = y;
    }
    
    /**
     * Get the x coordinate of this state.
     * @return Returns x.
     */
    public int getX() {
        return this.x;
    }
    
    /**
     * Get the y coordinate of this state.
     * @return Returns y.
     */
    public int getY() {
        return this.y;
    }
    
    /**
     * Gets the distance from this state to another state.
     * @param state - another state
     * @return Returns the distance between this state and another state.
     */
    public double distanceTo(final State2D state) {
        double xDist = Math.pow(this.getX() - state.getX(), 2);
        double yDist = Math.pow(this.getY() - state.getY(), 2);
        return Math.sqrt(xDist + yDist);
    }
    
    /**
     * Gets the L1 Manhattan distance from this state to another state.
     * @param state - another state
     * @return Returns the distance between this state and another state.
     */
    public int distanceToL1(final State2D state) {
        return Math.abs(state.getX() - this.getX()) + Math.abs(state.getY() - this.getY());
    }
    
    
    
    @Override
    public String toString() {
        return String.format("[x:%d,y:%d]", getX(), getY());
    }
}
