
/**
 * Project Name:    Assignment 3        <br>
 * File Name:       ActivationFunctionRelu.java <br>
 * Description:     A ReLU (Rectified Linear Unit) activation function for neurons. <br><br>
 * Date Created:    11/18/22            <br>
 * Date Modified:   11/28/22            <br>
 * @author Kong Jimmy Vang
 */
public class ActivationFunctionRelu implements ActivationFunction 
{
    @Override
    public double g(final double t) {
        return Math.max(0, t);
    }
    
    @Override
    public double gPrime1(final double t) {
        if (t > 0) {
            return 1;
        } else {
            return 0;
        }
    }
}
