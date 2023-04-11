
/**
 * Project Name:    Assignment 4        <br>
 * File Name:       FeatureEnv7.java    <br>
 * Description:     Feature class for feature-based learning.       <br><br>
 *                      s = state                                   <br>
 *                      a = action                                  <br>
 *                      s1 = state prime 1                          <br><br>
 *                      
 *                      f(s) = 0                                    <br>
 *                      f(s, a) = 1 if s = s1, 0 otherwise          <br><br>
 *                      
 * Date Created:    12/13/22            <br>
 * Date Modified:   12/14/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * @see FeatureEnv
 * @author Kong Jimmy Vang
 */
public class FeatureEnv7 extends FeatureEnv 
{
    //=== FIELDS ===
    // see "FeatureEnv.java" for more information.
    
    //=== CONSTRUCTORS ===
    public FeatureEnv7(final Environment2D environment) {
        super(environment);
        setFeatureName("ind-move");
    }
    
    //=== METHODS ===
    @Override
    public double f(final EnvCell2D state) 
    {
        return 0;
    }
    
    @Override
    public double f(final EnvCell2D state, final Agent.Action action) {
        EnvCell2D state1 = getEnvironment().simulateAction(state, action, 1);
        if (state == state1) {
            return 1;
        } else {
            return 0;
        }
    }
    
    //=== FIELD GETTERS AND SETTERS ===
}
