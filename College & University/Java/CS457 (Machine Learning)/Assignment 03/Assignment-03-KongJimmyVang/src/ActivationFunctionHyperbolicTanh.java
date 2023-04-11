
/**
 * Project Name:    Assignment 3        <br>
 * File Name:       ActivationFunctionHyperbolicTan.java <br>
 * Description:     A hyperbolic tangent activation function for neurons. <br><br>
 * Date Created:    11/18/22            <br>
 * Date Modified:   11/28/22            <br>
 * @author Kong Jimmy Vang
 */
public class ActivationFunctionHyperbolicTanh implements ActivationFunction 
{
    @Override
    public double g(final double t) {
        double et = Math.exp(t);
        double etMinus = Math.exp(-t);
        return (et - etMinus) / (et + etMinus);
    }
    
    @Override
    public double gPrime1(final double t) {
        double gt = g(t);
        return 1.0 - (gt * gt);
    }
}
