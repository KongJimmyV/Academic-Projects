
#######################################
 * File:            README.txt
 * Project Name:    Assignment 2
 * Date Modified:   10/27/2022
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
    -f 'FILENAME'  : [REQUIRED] Reads training data from the file named <FILENAME> (specified as a String).
    -b 'INTEGER'   : Specify the base training group size; default is 10.
    -i 'INTEGER'   : Specify the increment in training group size; default is 10.
    -l 'INTEGER'   : Specify the limit for training group size; default is 100.
    -t 'INTEGER'   : Sets the number of trials to perform at each training group size; default is 20.
    -d 'INTEGER'   : Specifies the maximum depth limit to be used when building the decision tree; 
                        if unspecified, then no depth limit is used.
    -v 'INTEGER'   : Specifies a verbosity level from 1 to 5, indicating how much output the program should 
                        produce; default is 1.