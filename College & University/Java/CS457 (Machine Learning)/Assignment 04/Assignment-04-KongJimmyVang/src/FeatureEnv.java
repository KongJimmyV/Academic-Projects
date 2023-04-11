
/**
 * Project Name:    Assignment 4        <br>
 * File Name:       FeatureEnv.java     <br>
 * Description:     Abstract feature class for feature-based learning.
 *                  Build other features using this abstract class.         <br><br>
 *                      s = state                                           <br>
 *                      a = action                                          <br>
 *                      s1 = state prime 1                                  <br><br>
 *                      
 *                      f(s) = ?                                            <br>
 *                      f(s, a) = ?                                         <br><br>
 * 
 * Date Created:    12/13/22            <br>
 * Date Modified:   12/14/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public abstract class FeatureEnv implements FeatureEnvInterface 
{
    //=== FIELDS ===
    /** The name of the feature */
    private String featureName;
    
    /** The Environment */
    private Environment2D environment;
    
    /** The weight stored for this feature */
    private double weight;
    
    //=== CONSTRUCTORS ===
    /**
     * Constructs this feature and store an environment for referencing use.
     * @param environment
     */
    FeatureEnv(final Environment2D environment) 
    { 
        setFeatureName("NO_NAME");
        this.environment = environment;
        this.weight = 1; 
    }
    
    //=== METHODS ===
    /**
     * Function f(s) for generic 2D states.
     * @param state - the given state
     * @return Returns f(s) value. (see the description for the value returned).
     */
    public double f(final State2D state) {
        EnvCell2D envState = this.getEnvironment().getCellAt(state.getX(), state.getY());
        return f(envState);
    }
    
    /**
     * Function f(s) for environment 2D states.
     * @param state - the given state
     * @return Returns f(s) value. (see the description for the value returned).
     */
    public abstract double f(final EnvCell2D state);
    
    /**
     * Function f(s, a) for generic 2D states.
     * @param state - the given state
     * @param action - the action to take in the given state
     * @return Returns f(s, a) value. (see the description for the value returned).
     */
    public double f(final State2D state, final Agent.Action action) {
        EnvCell2D envState = this.getEnvironment().getCellAt(state.getX(), state.getY());
        return f(envState, action);
    }
    
    /**
     * Function f(s, a) for environment 2D states.
     * @param state - the given state
     * @param action - the action to take in the given state
     * @return Returns f(s, a) value. (see the description for the value returned).
     * @see FeatureEnv
     */
    public abstract double f(final EnvCell2D state, final Agent.Action action);
    
    //=== FIELD GETTERS AND SETTERS ===
    /**
     * Get the feature's name.
     * @return Returns the feature's name.
     */
    public String getFeatureName() {
        return featureName;
    }

    /**
     * Set the feature's name.
     * @param featureName - the feature's new name
     */
    public void setFeatureName(String featureName) {
        this.featureName = featureName;
    }
    
    /**
     * Returns the environment being used for this feature.
     * @return Returns the environment.
     */
    public Environment2D getEnvironment() {
        return environment;
    }

    /**
     * Sets the environment to be used for this feature.
     * @param environment
     */
    public void setEnvironment(final Environment2D environment) {
        this.environment = environment;
    }

    /**
     * Gets the weight of this feature.
     * @return Returns the weight value.
     */
    public double getWeight() {
        return weight;
    }

    /**
     * Sets the weight of this feature.
     * @param weight
     */
    public void setWeight(final double weight) {
        this.weight = weight;
    }
}
