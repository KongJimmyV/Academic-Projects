import java.util.List;

/**
 * Project Name:    Assignment 4        <br>
 * File Name:       FeatureEnvDistMine.java    <br>
 * Description:     Feature class for feature-based learning.       <br><br>
 *                      s = state                                   <br>
 *                      a = action                                  <br>
 *                      s1 = state prime 1                          <br><br>
 *                      
 *                      f(s) = (L1 distance from s to nearest mine) / (xMax + yMax)     <br>
 *                      f(s, a) = f(s1)                                                 <br><br>
 *                      
 * Date Created:    12/13/22            <br>
 * Date Modified:   12/14/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * @see FeatureEnv
 * @author Kong Jimmy Vang
 */
public class FeatureEnvDistMine extends FeatureEnv 
{
    //=== FIELDS ===
    private List<EnvCell2D> mines;
    private int xMax;
    private int yMax;
    
    //=== CONSTRUCTORS ===
    public FeatureEnvDistMine(final Environment2D environment) {
        super(environment);
        setFeatureName("  dist-M");
        this.mines = environment.mines;
        this.xMax = environment.getCells().get(0).size();
        this.yMax = environment.getCells().size();
    }
    
    //=== METHODS ===
    @Override
    public double f(final EnvCell2D state) 
    {
        int distanceToNearest = Integer.MAX_VALUE;
        for (EnvCell2D cell : mines) 
        {
            int distance = state.distanceToL1(cell);
            if (distanceToNearest > distance) {
                distanceToNearest = distance;
            }
        }
        if (distanceToNearest == Integer.MAX_VALUE) {
            distanceToNearest = 0;
        }
        return (double)distanceToNearest / (double)(xMax + yMax);
    }
    
    @Override
    public double f(final EnvCell2D state, final Agent.Action action) {
        EnvCell2D state1 = getEnvironment().simulateAction(state, action, 1);
        return f(state1);
    }
    
    //=== FIELD GETTERS AND SETTERS ===
    /**
     * Sets the environment to be used for this feature.
     * @param environment
     */
    @Override
    public void setEnvironment(final Environment2D environment) {
        super.setEnvironment(environment);
        this.mines = environment.mines;
    }
}
