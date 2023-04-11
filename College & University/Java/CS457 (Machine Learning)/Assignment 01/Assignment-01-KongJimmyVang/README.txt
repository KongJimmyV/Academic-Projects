
#######################################
 * File:            README.txt
 * Project Name:    Assignment 1
 * Class:           CS457 (Fall 2022)
#######################################

Prerequisites:
    - Install JDK if not installed: https://www.oracle.com/java/technologies/downloads/
    - Install Java if not installed: https://www.java.com/en/download/
    
How To Compile Java Files:
    1. Open a Terminal, Shell, or Command-Line interface
    2. Navigate to the "src" folder.
    3. Find the "Driver.java" file.
    4. Run the command "javac Driver.java". Wait for the command to finish.
    
How To Run The Program:
    1. Run the command "java Driver -f <FILENAME>" on a training set file. Some examples are stored in the "data" folder
    2. The -f flag is required, other flags are optional.
    
FLAGS:
    -f <FILENAME>:  [REQUIRED] Reads training data from the file named <FILENAME> (specified as a String)
    -k <INTEGER>:   Specifies the number of folds for k-fold cross-validation; default is 5; using 
                        option -k 1 trains a model on the full data set (see the Output section for more details)
    -d <INTEGER>:   Specifies the smallest polynomial degree to evaluate; default is 1
    -D <INTEGER>:   Specifies the largest polynomial degree to evaluate; if not specified, then only
                        evaluate one degree (the degree value specified through the -d flag or its default value)
    -a <DOUBLE>:    Specifies the learning rate in mini-batch gradient descent; default is 0.005
    -e <INTEGER>:   Specifies the epoch limit in mini-batch gradient descent; default is 10000
    -m <INTEGER>:   Specifies the batch size in mini-batch gradient descent; default is 0, which
        should be interpreted as specifying full batch gradient descent
    -v <INTEGER>:   Specifies a verbosity level, indicating how much output the program should
                        produce; default is 1 (see the Output section for details)