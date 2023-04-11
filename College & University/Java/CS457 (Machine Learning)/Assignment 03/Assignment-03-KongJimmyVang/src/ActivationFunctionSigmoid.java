
/**
 * Project Name:    Assignment 3        <br>
 * File Name:       ActivationFunctionSigmoid.java <br>
 * Description:     A sigmoid activation function for neurons. <br><br>
 * Date Created:    11/18/22            <br>
 * Date Modified:   11/28/22            <br>
 * @author Kong Jimmy Vang
 */
public class ActivationFunctionSigmoid implements ActivationFunction 
{
    @Override
    public double g(final double t) {
        return 1.0 / (1.0 + Math.exp(-t));
    }
    
    @Override
    public double gPrime1(final double t) {
        return g(t) * (1.0 - g(t));
    }
}
