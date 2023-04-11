//////////////////////////////////////////////////////
// File Name:   Run.java
// Author:      Kong Jimmy Vang
// Date:        12/11/2018
// 

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Runs a Q-Learning Algorithm and a Feature-Based Q-Learning Algorithm in a 2D Environment. <br>
 * Requires {@code Environment2D.java} to run this class.
 * 
 * @author Kong Jimmy Vang
 */
public class Run {

    public static void main(String[] args) {
        try {
            
            //***************************************************
            //*** Build the environment for "pipe_world.txt". ***
            Environment2D env = new Environment2D("pipe_world.txt");
            
            //***********************************************
            //*** Perform Q-Learning on "pipe_world.txt". ***
            System.out.println("*** Q-Learning Policy ***");
            String[][] policy = env.qLearning();
            printPolicy(policy);
                    
            // Write rewards from tests to file.
            env.writeAverageRewards("TestRun_AverageRewards.csv");
            
            System.out.println();
            
            //*************************************************************
            //*** Perform Feature-based Q-Learning on "pipe_world.txt". ***
            System.out.println("*** Feature-Based Q-Learning Policy ***");
            String[][] policy2 = env.featureBasedQLearning();
            printPolicy(policy2);
            
            // Write rewards from tests to file.
            env.writeAverageRewards("TestRun_FeatureBasedAverageRewards.csv");
            
            //*************************************
            //*** Write out policies to a file. ***
            writePolicies("Final_Policies.txt", 
                            policy, policy2,
                            "*** Q-Learning Policy ***", "*** Feature-Based_Q-Learning_Policy.txt ***");
            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public static void printPolicy(String[][] policy) {
        for (int r = 0; r < policy.length; r++) {
            for (int c = 0; c < policy[r].length; c++) {
                System.out.print(policy[r][c]);
            }
            
            System.out.println();
        }
    }
    
    /**
     * Write out two given policies to a file.
     * @param file - File location or name to store policies in.
     * @param policy1 - 1st policy.
     * @param policy2 - 2nd policy.
     * @param header1 - Header of the 1st policy.
     * @param header2 - Header of the 2nd policy.
     * @throws FileNotFoundException 
     */
    public static void writePolicies(String file, String[][] policy1, String[][] policy2, String header1, String header2) throws FileNotFoundException {
        PrintWriter pw = new PrintWriter(new File(file));
        
        pw.println(header1);
        for (int r = 0; r < policy1.length; r++) {
            for (int c = 0; c < policy1[r].length; c++) {
                pw.print(policy1[r][c]);
            }
            
            pw.println();
        }
        
        pw.println();
        pw.println(header2);
        for (int r = 0; r < policy2.length; r++) {
            for (int c = 0; c < policy2[r].length; c++) {
                pw.print(policy2[r][c]);
            }
            
            pw.println();
        }
        
        pw.close();
    }
    
}
