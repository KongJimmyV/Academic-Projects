
/**
 * File: Algorithm.java
 * Description:
 *      - The Binary Merge Sort Algorithm
 *      
 * Project:     Assignment 02 - ex4_mergeSort
 * Class:       CS353
 * 
 * @author Dr. Lei Wang [Code Template Author]
 * @author Kong Jimmy Vang [Completed Code Template]
 */
public class Algorithm {
    
    /** Group Size K for subgroups to use insertion sort on. */
    public static final int K = 5;
    
    // binary merge sort algorithm
    /*
     * inputs:
     *   A - the array to be sorted 
     * output:
     *   in-place sorting result
     */
    public void sort(int[] A)
    {
        // WRITE YOUR CODE HERE
        mergeSort(A, 0, A.length - 1);
    }
    
    
    // CREATE METHODS WHEN NECESSARY
    
    /**
     * Perform an in-place merge sort of the given array.
     * @param A - The array to sort.
     * @param left - leftmost index
     * @param right - rightmost index
     */
    private void mergeSort(int[] A, int left, int right) {
        if (right - left > K)
        {
            int mid = (left + right) / 2;
            
            mergeSort(A, left, mid);
            mergeSort(A, mid + 1, right);
            merge(A, left, mid, right);
        } 
        else 
        {
            insertionSort(A, left, right);
        }
    }
    
    /**
     * Perform an in-place merge from the start index to the end index.
     * @param A - The array to do in-place merging with.
     * @param startLeft - start index for left array
     * @param mid - middle index
     * @param end - end index
     */
    private void merge(int A[], int startLeft, int mid, int end) {
        
        // Start index for right array.
        int startRight = mid + 1;

        // Return if array A is already sorted.
        if (A[mid] <= A[startRight]) 
        {
            return;
        }
        
        // Merge and sort left and right arrays.
        while (startLeft <= mid && startRight <= end) 
        {
            if (A[startLeft] <= A[startRight]) 
            {
                startLeft++;
            } 
            else 
            {
                int value = A[startRight];
                int index = startRight;
                
                while (index != startLeft) 
                {
                    A[index] = A[index - 1];
                    index--;
                }
                A[startLeft] = value;
                
                startLeft++;
                mid++;
                startRight++;
            }
        }
    }
    
    /**
     * Performs an in-place insertion sort on the given array.
     * @param A - The array to sort
     * @param start - start index
     * @param end - end index
     */
    private void insertionSort(int[] A, int start, int end) {
        for(int i = start + 1; i <= end; i++) 
        {
            int selectedValue = A[i];
            int j = i;
            
            while(j > start && A[j - 1] > selectedValue) 
            {
                A[j] = A[j - 1];
                j--;
            }
            // Insert selectedValue into home.
            A[j] = selectedValue;
        }
    }
}
