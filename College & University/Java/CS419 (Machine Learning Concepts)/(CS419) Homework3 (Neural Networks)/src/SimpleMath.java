//////////////////////////////////////////////////////
// File Name:   SimpleMath.java
// Author:      Kong Jimmy Vang
// Date:        11/5/2018
// 

/**
 * A Simple Math Class containing useful math functions for a neural network.
 * @author Kong Jimmy Vang
 */
public class SimpleMath {
    
    /** Calculates the sigmoid of the input value, {@code in}. */
    public static double sigmoid(double in) {
        return 1.0 / (1.0 + Math.pow(Math.E, -in));
    }
    
    /** Calculates the sigmoid's derivative of the input value, {@code in}. */
    public static double sigmoidDerivative(double in) {
        return sigmoid(in) * (1 - sigmoid(in));
    }
}
