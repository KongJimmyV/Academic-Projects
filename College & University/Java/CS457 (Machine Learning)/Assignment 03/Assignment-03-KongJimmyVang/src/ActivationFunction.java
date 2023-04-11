
/**
 * Project Name:    Assignment 3        <br>
 * File Name:       ActivationFunction.java <br>
 * Description:     An activation function interface for neurons. <br><br>
 * Date Created:    11/18/22            <br>
 * Date Modified:   11/25/22            <br>
 * @author Kong Jimmy Vang
 */
public interface ActivationFunction {
    public double g(final double t);
    public double gPrime1(final double t);
}
