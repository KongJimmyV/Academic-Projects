
/**
 * Project Name:    Assignment 4        <br>
 * File Name:       FeatureEnv5.java    <br>
 * Description:     Feature class for feature-based learning.       <br><br>
 *                      s = state                                   <br>
 *                      a = action                                  <br>
 *                      s1 = state prime 1                          <br><br>
 *                      
 *                      f(s) = 1 if s is a goal cell, 0 otherwise   <br>
 *                      f(s, a) = f(s1)                             <br><br>
 *                      
 * Date Created:    12/13/22            <br>
 * Date Modified:   12/14/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * @see FeatureEnv
 * @author Kong Jimmy Vang
 */
public class FeatureEnv5 extends FeatureEnv 
{
    //=== FIELDS ===
    // see "FeatureEnv.java" for more information.
    
    //=== CONSTRUCTORS ===
    public FeatureEnv5(final Environment2D environment) {
        super(environment);
        setFeatureName("   ind-G");
    }
    
    //=== METHODS ===
    @Override
    public double f(final EnvCell2D state) {
        if (state.getCellTypeEnum() == EnvCell2D.CellType.GOAL) {
            return 1;
        } else {
            return 0;
        }
    }
    
    @Override
    public double f(final EnvCell2D state, final Agent.Action action) {
        EnvCell2D state1 = getEnvironment().simulateAction(state, action, 1);
        return f(state1);
    }
    
    //=== FIELD GETTERS AND SETTERS ===
    // see "FeatureEnv.java" for more information.
}
