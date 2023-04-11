
/**
 * Project Name:    Assignment 4        <br>
 * File Name:       FeatureEnv1.java    <br>
 * Description:     Feature class for feature-based learning.       <br><br>
 *                      s = state                                   <br>
 *                      a = action                                  <br>
 *                      s1 = state prime 1                          <br><br>
 *                      
 *                      f(s) = (x coordinate of s) / xMax           <br>
 *                      f(s, a) = f(s1)                             <br><br>
 *                      
 * Date Created:    12/13/22            <br>
 * Date Modified:   12/14/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * @see FeatureEnv
 * @author Kong Jimmy Vang
 */
public class FeatureEnv1 extends FeatureEnv 
{
    //=== FIELDS ===
    private int xMax;
    
    //=== CONSTRUCTORS ===
    public FeatureEnv1(final Environment2D environment) {
        super(environment);
        setFeatureName("scaled-X");
        this.xMax = environment.getCells().get(0).size();
    }
    
    //=== METHODS ===
    @Override
    public double f(final EnvCell2D state) {
        return (double)(state.getX() + 1) / (double)xMax;
    }
    
    @Override
    public double f(final EnvCell2D state, final Agent.Action action) {
        EnvCell2D state1 = getEnvironment().simulateAction(state, action, 1);
        return f(state1);
    }
    
    //=== FIELD GETTERS AND SETTERS ===
    // see "FeatureEnv.java" for more information.
}
