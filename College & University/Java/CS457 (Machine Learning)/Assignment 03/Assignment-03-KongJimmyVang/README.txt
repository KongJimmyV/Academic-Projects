
#######################################
 * File:            README.txt
 * Project Name:    Assignment 3
 * Date Modified:   11/28/2022
 * Class:           CS457 (Fall 2022)
 * Instructor:      Dr. Jason Sauppe
#######################################

Prerequisites:
    - Install JDK if not installed: https://www.oracle.com/java/technologies/downloads/
    - Install Java if not installed: https://www.java.com/en/download/

How To Compile Java Files:
    1. Open a Terminal, Shell, or Command-Line interface
    2. Navigate to the folder "src", where this README file is located.
    3. Find the "Driver.java" file.
    4. Run the command, "javac Driver.java". Wait for the command to finish.

How To Run The Program:
    1. Run the command, "java Driver -f <FILENAME>", where <FILENAME> is a file location. 
        Some example files to use with this program are stored in the "data" folder.
    2. The -f flag is required, other flags are optional.



ALL FLAGS:
    -f 'FILENAME': [REQUIRED] Reads training data from the file named <FILENAME> (specified as a String).
    -h 'NH' 'S1' 'S2' ..
            Specifies the number of hidden layers 'NH' followed by 'NH' additional integers 
            corresponding to the sizes of these hidden layers. You can assume that 'NH' is a non-negative integer 
            no greater than 10. The following integer(s) 'S1', 'S2', etc. represent the sizes of hidden layer
            1, hidden layer 2, and so on. There will be 'NH' size values, and you can assume that each of
            these values will be a positive integer no greater than 500. For example, -h 2 10 5 specifies
            a neural network with two hidden layers, the first containing 10 neurons and the second
            containing 5. Note that 'NH' may be 0, in which case there are no hidden layers and no
            additional integers following. (Using zero hidden layers is the default.)
    -a 'DOUBLE': Specifies the learning rate α in mini-batch gradient descent; default is 0.01.
    -e 'INTEGER': Specifies the epoch limit in mini-batch gradient descent; default is 1000.
    -m 'INTEGER': Specifies the batch size in mini-batch gradient descent; 
            default is 1 for stochastic gradient descent (using -m 0 should be interpreted as full batch gradient descent).
    -l 'DOUBLE': Specifies the regularization hyperparameter λ; default is 0.0 (no regularization).
    -r: If specified, this flag (which has no arguments) enables randomization of data for 
            the train/validation split and for batch construction at the start of each epoch; if this flag is not
            specified, then data should not be randomized (which is the default behavior; this is to
            make testing and debugging easier).
    -w 'DOUBLE': Specifies the value ε for weight initialization; default is 0.1.
    -g 'NAME': Specifies the name of the activation function to be used at neurons in the hidden layers, where 'NAME' 
            is a String that matches one of the following (case-insensitive):
                 'NAME'     : DESCRIPTION
                - logistic  : The standard logistic function.
                - relu      : The rectified linear unit.
                - softplus  : The softplus function.
                - tanh      : The hyperbolic tangent function.
    -v 'INTEGER': Specifies a verbosity level from 1 to 5, indicating how much output the program should 
                        produce; default is 1.
