
/**
 * File: Algorithm.java
 * Description:
 *      - The Quick Sort Algorithm
 *      
 * Project:     Assignment 02 - ex5_quickSort
 * Class:       CS353
 * 
 * @author Dr. Lei Wang [Code Template Author]
 * @author Kong Jimmy Vang [Completed Code Template]
 */
public class Algorithm {
    
    // quick sort algorithm
    /*
     * inputs:
     *   A - the array to be sorted 
     * output:
     *   in-place sorting result
     */
    public void sort(int[] A)
    {
        // WRITE YOUR CODE HERE
        sort(A, 0, A.length - 1);
    }
    
    /**
     * Performs an in-place recursive quick sort on a given array.
     * @param A - the array to be sorted 
     * @param low - start index
     * @param high - end index
     */
    private void sort(int[] A, int low, int high) {
        if (low >= high) {
            return;
        }
        
        int partitioningIndex = partition(A, low, high);
        sort(A, low, partitioningIndex - 1);  // Sort left partition of Partitioning Index
        sort(A, partitioningIndex + 1, high); // Sort right partition of Partitioning Index
    }
    
    /**
     * Picks a pivot, then:
     *     Places all elements smaller than the pivot to the left.
     *     Places all elements larger than the pivot to the right.
     * @param A - the array to be partitioned
     * @param low - start index
     * @param high - end index
     * @return Returns the partitioning index.
     */
    private int partition(int[] A, int low, int high) {
        
        // Select pivot.
        int pivot = A[high];
        int i = low - 1;
        
        for (int j = low; j <= high - 1; j++) 
        {
            if (A[j] < pivot) 
            {
                i++;
                
                int temp = A[i];
                A[i] = A[j];
                A[j] = temp;
            }
        }
        
        int temp = A[i + 1];
        A[i + 1] = A[high];
        A[high] = temp;
        
        // Return partitioning index or pivot index.
        return i + 1;
    }
}
