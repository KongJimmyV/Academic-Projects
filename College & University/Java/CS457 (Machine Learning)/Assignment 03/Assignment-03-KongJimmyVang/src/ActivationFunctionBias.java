
/**
 * Project Name:    Assignment 3        <br>
 * File Name:       ActivationFunctionBias.java <br>
 * Description:     A bias activation function for neurons. <br><br>
 * Date Created:    11/18/22            <br>
 * Date Modified:   11/25/22            <br>
 * @author Kong Jimmy Vang
 */
public class ActivationFunctionBias implements ActivationFunction 
{
    @Override
    public double g(final double t) {
        return 1.0;
    }
    
    @Override
    public double gPrime1(final double t) {
        return 0.0;
    }
}
