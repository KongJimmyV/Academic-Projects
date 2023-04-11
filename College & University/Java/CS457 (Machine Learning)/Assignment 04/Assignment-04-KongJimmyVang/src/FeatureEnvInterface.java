
/**
 * Project Name:    Assignment 4        <br>
 * File Name:       FeatureEnvInterFace.java    <br>
 * Description:     The Feature Interface for feature-based q-learning. <br><br>
 *                      
 * Date Created:    12/13/22            <br>
 * Date Modified:   12/14/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public interface FeatureEnvInterface 
{
    public double f(final State2D state);
    public double f(final EnvCell2D state);
    public double f(final State2D state, final Agent.Action action);
    public double f(final EnvCell2D state, final Agent.Action action);
}
