import java.util.*;

/**
 * File: Algorithm.java
 * Description:
 *      - The Scheduling Problem's Algorithm (Greedy Algorithm)
 *      
 * Project:     Assignment 01 - ex1 Scheduling Problem
 * Class:       CS353
 * 
 * @author Dr. Lei Wang [Code Template Author]
 * @author Kong Jimmy Vang [Completed Code Template]
 */
public class Algorithm {
    
    // the scheduling algorithm
    /*
     * Inputs:
     *   tasks - an integer array of task indexes
     *   pTime - an array of processing times of tasks
     * Output:
     *   the best schedule
     */
    public int[] scheduling(int[] tasks, double[] pTimes)
    {
        // Guard Clauses
        if (null == tasks) {
            System.err.println("ERROR: scheduling() method found null array for 'int[] tasks'.");
            System.exit(-1);
        }
        if (null == pTimes) {
            System.err.println("ERROR: scheduling() method found null array for 'double[] pTimes'.");
            System.exit(-1);
        }
        if (tasks.length != pTimes.length) {
            System.err.println("ERROR: scheduling() method length mismatch "
                    + "--> 'int[] tasks' does not have the same length as 'double[] pTimes'.");
            System.exit(-1);
        }
        
        //**** Scheduling Algorithm ****//
        // Organize into list of comparable tasks Tasks.
        ArrayList<Task> listTasks = new ArrayList<>();
        for (int i = 0; i < tasks.length; i++) {
            Task t = new Task(tasks[i], pTimes[i]);
            listTasks.add(t);
        }
        
        // Sort Tasks from the shortest to the longest task.
        Collections.sort(listTasks);
        //******************************//
        
        // DEBUG: print sorted pTimes.
        /*for (int i = 0; i < listTasks.size(); i++) {
            if (i == listTasks.size() - 1) {
                System.out.print(listTasks.get(i).pTime + "\n");
            } else {
                System.out.print(listTasks.get(i).pTime + ", ");
            }
        }*/
        
        // Return an int array of the sorted task IDs.
        int[] sortedTasks = new int[tasks.length];
        
        for (int i = 0; i < sortedTasks.length; i++) {
            sortedTasks[i] = listTasks.get(i).taskId;
        }
        return sortedTasks;
    }
}
