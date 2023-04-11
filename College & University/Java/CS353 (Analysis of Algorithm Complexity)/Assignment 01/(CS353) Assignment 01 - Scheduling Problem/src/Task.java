
/**
 * File: Task.java
 * Description:
 *      - A Task object for the scheduling problem.
 *      
 * Project:     Assignment 01 - ex1 Scheduling Problem
 * Class:       CS353
 * 
 * @author Kong Jimmy Vang
 */
public class Task implements Comparable<Task>{
    
    int taskId = 0;
    double pTime = 0;
    
    public Task(int taskId, double pTime) {
        this.taskId = taskId;
        this.pTime = pTime;
    }
    
    @Override
    public int compareTo(Task other) {
        return Double.compare(pTime, other.pTime);
    }
}
