
/**
 * Project Name:    Assignment 3        <br>
 * File Name:       ActivationFunctionSoftplus.java <br>
 * Description:     A softplus activation function for neurons. <br><br>
 * Date Created:    11/18/22            <br>
 * Date Modified:   11/28/22            <br>
 * @author Kong Jimmy Vang
 */
public class ActivationFunctionSoftplus implements ActivationFunction 
{
    private ActivationFunction sigmoid = new ActivationFunctionSigmoid();
    
    @Override
    public double g(final double t) {
        return Math.log(1.0 + Math.exp(t));
    }
    
    @Override
    public double gPrime1(final double t) {
        return sigmoid.g(t);
    }
}
