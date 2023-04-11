
/**
 * Project Name:    Assignment 3        <br>
 * File Name:       ActivationFunctionLogistic.java <br>
 * Description:     A logistic activation function for neurons. <br><br>
 * Date Created:    11/18/22            <br>
 * Date Modified:   11/28/22            <br>
 * @author Kong Jimmy Vang
 */
public class ActivationFunctionLogistic implements ActivationFunction 
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
