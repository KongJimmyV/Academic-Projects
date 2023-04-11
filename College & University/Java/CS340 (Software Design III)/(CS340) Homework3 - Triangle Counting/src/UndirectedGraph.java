//
// UndirectedGraph.java
// Created by: Kong Jimmy Vang
// Date Created: 2/15/2018
// 

import java.io.*;
import java.util.*;

/**
 * This class is the representation of an undirected graph.
 * 
 * @author Kong Jimmy Vang
 */
public class UndirectedGraph {
    
    //*** Private Classes ***
    private class Vertex {
        private EdgeNode edges1;
        private EdgeNode edges2;
        private int numNeighbors; // This is the same as the degree of the vertex
        private int orderedNeighbors[]; // Set of ordered neighbors
        // We will learn others ways to store sets but for this assignment
        // you must store the set in an array

        private Vertex() {
            this.edges1 = null;
            this.edges2 = null;
            this.numNeighbors = 0;
            this.orderedNeighbors = null;
        }
    }

    private class EdgeNode {
        private int vertex1;
        private int vertex2;
        private EdgeNode next1;
        private EdgeNode next2;

        /**
         * PRE: v1 < v2
         * Each edge node is stored only once but it will be part of two lists.
         * 
         * @param v1 - Vertex #1 of this edge node.
         * @param v2 - Vertex #2 of this edge node.
         * @param e1 - List of edge nodes with v2 >= this.v1.
         * @param e2 - List of edge nodes with v1 < this.v2.
         */
        private EdgeNode(int v1, int v2, EdgeNode e1, EdgeNode e2) {
            if (v1 > v2) {
                int temp = v1;
                v1 = v2;
                v2 = temp;
            }
            
            this.vertex1 = v1;
            this.vertex2 = v2;
            this.next1 = e1;
            this.next2 = e2;
        }
    }
    
    
    //*** Class Fields, Constructors, and Methods ***
    private Vertex[] g;

    public UndirectedGraph(int size) {
        // Create a graph with size vertices
        // The vertices will be identified by ints between 0 and size-1
        // The vertices are stored in a array
        g = new Vertex[size];
        for (int i = 0; i < size; i++) {
            g[i] = new Vertex();
        }
    }

    /**
     * Add a new edge between v1 and v2.
     * 
     * @param v1 - Vertex 1 of the new edge.
     * @param v2 - Vertex 2 of the new edge.
     */
    public void addEdge(int v1, int v2) {
        
        // Swap values to follow adjacency list rules.
        if (v1 > v2) {
            int temp = v1;
            v1 = v2;
            v2 = temp;
        }
        
        //System.out.println("\n*** addEdge() ***");
        //System.out.println(v1 + ", " + v2);
        
        //*** Create vertices for v1 and v2.
        Vertex vertex1 = this.g[v1];
        Vertex vertex2 = this.g[v2];
        
        // Set numNeighbors/degree.
        vertex1.numNeighbors++;
        vertex2.numNeighbors++;
        
        //*** Add the new edge.
        EdgeNode newEdge = new EdgeNode(v1, v2, null, null);
        
        EdgeNode v1Edges1 = vertex1.edges1;
        EdgeNode v2Edges2 = vertex2.edges2;
        
        if (v1Edges1 != null) {
            //System.out.println("v1e1 is != NULL");
            while (v1Edges1 != null) {
                if (v1Edges1.next1 == null) {
                    v1Edges1.next1 = newEdge;
                    break;
                }
                if (v1Edges1.next1 != null &&
                        v1Edges1.next1.vertex2 > v2)  {
                    newEdge.next1 = v1Edges1.next1;
                    v1Edges1.next1 = newEdge;
                    break;
                }
                if (v1Edges1.next1 != null &&
                        v1Edges1.next1.vertex1 == v1 &&
                        v1Edges1.next1.vertex2 == v2)  {
                    System.out.println("Warning: The edge (" 
                        + v1 + ", "
                        + v2 
                        + ") already exists.");
                    return;
                }
                v1Edges1 = v1Edges1.next1;
            }
        } else {
            //System.out.println("v1e1 is == NULL");
            vertex1.edges1 = newEdge;
            //v1Edges1 = newEdge;
        }
        
        if (v2Edges2 != null) {
            //System.out.println("v2e2 is != NULL");
            while (v2Edges2 != null) {
                if (v2Edges2.next2 == null) {
                    v2Edges2.next2 = newEdge;
                    break;
                }
                if (v2Edges2.next2 != null &&
                        v2Edges2.next2.vertex1 < v1)  {
                    newEdge.next2 = v2Edges2.next2;
                    v2Edges2.next2 = newEdge;
                    break;
                }
                if (v2Edges2.next2 != null &&
                        v2Edges2.next2.vertex1 == v1 &&
                        v2Edges2.next2.vertex2 == v2)  {
                    System.out.println("Warning: The edge (" 
                        + v1 + ", "
                        + v2 
                        + ") already exists.");
                    return;
                }
                v2Edges2 = v2Edges2.next2;
            } 
        } else {
            //System.out.println("v2e2 is == NULL");
            vertex2.edges2 = newEdge;
            //v2Edges2 = newEdge;
        }
        
        //*** Populate the ordered neighbors.
        //populateOrderedNeighbors();
    }

    /**
     * Print the neighbors of each vertex to standard output.
     */
    public void printNeighbors() {
        
        // Build the neighbors list.
        String neighbors = "";
        ArrayList<Integer> queue = new ArrayList<>();
        
        for (int i = 0; i < this.g.length; i++) {
            Vertex v = this.g[i];
            
            neighbors += i;
            int s = neighbors.split(" ")[0].length();
            
            EdgeNode e1 = v.edges1;
            neighbors += ": ";
            while (e1 != null) {
                if (e1.next1 != null) {
                    if (!queue.contains(e1.vertex2))
                        queue.add(e1.vertex2);
                } else {
                    if (!queue.contains(e1.vertex2))
                        queue.add(e1.vertex2);
                }
                e1 = e1.next1;
            }
            
            EdgeNode e2 = v.edges2;
            while (e2 != null) {
                if (e2.next2 != null) {
                    if (!queue.contains(e2.vertex1))
                        queue.add(e2.vertex1);
                } else {
                    if (!queue.contains(e2.vertex1))
                        queue.add(e2.vertex1);
                }
                e2 = e2.next2;
            }
            
            while (!queue.isEmpty()) {
                
                // Find min neighbor.
                int min = Integer.MAX_VALUE;
                int minIndex = Integer.MAX_VALUE;
                
                for (int i2 = 0; i2 < queue.size(); i2++) {
                    if (queue.get(i2) < min) {
                        min = queue.get(i2);
                        minIndex = i2;
                    }
                }
                
                int vertex = queue.remove(minIndex);
                
                if (queue.isEmpty()) {
                    neighbors += vertex + "";
                } else {
                    neighbors += vertex + ", ";
                }
                
            }
            
            neighbors += "\n";
        }
        
        // Print neighbors list.
        if (neighbors == "") {
            System.out.println("This list is empty.");
        }
        
        System.out.println(neighbors);
    }

    /**
     * Find the ordered neighbors of each vertex.<br>
     * Each orderedNeighbor set should be sorted in ascending order.
     */
    private void populateOrderedNeighbors() {
        
        //*** Reset the ordered neighbors in each vertex.
        for (int i = 0; i < this.g.length; i++) {
            Vertex v = this.g[i];
            v.orderedNeighbors = null;
        }
        
        //*** Populate the ordered neighbors of each vertex.
        for (int v1Index = 0; v1Index < this.g.length; v1Index++) {
            for (int v2Index = v1Index; v2Index < this.g.length; v2Index++) {
                
                // Allow edges only.
                Vertex v1 = this.g[v1Index];
                Vertex v2 = this.g[v2Index];
                boolean isEdge = false;
                
                EdgeNode v1Edges1 = v1.edges1;
                EdgeNode v2Edges2 = v2.edges2;
                
                while (v1Edges1 != null && isEdge == false) {
                    if (v1Edges1.vertex1 == v1Index &&
                            v1Edges1.vertex2 == v2Index) {
                        isEdge = true;
                        break;
                    }
                    v1Edges1 = v1Edges1.next1;
                }
                
                while (v2Edges2 != null && isEdge == false) {
                    if (v2Edges2.vertex1 == v1Index &&
                            v2Edges2.vertex2 == v2Index) {
                        isEdge = true;
                        break;
                    }
                    v2Edges2 = v2Edges2.next2;
                }
                
                if (!isEdge) {
                    continue;
                }
                
                // Setup ordered neighbors.
                if ((v1.numNeighbors < v2.numNeighbors) ||
                        (v1.numNeighbors == v2.numNeighbors 
                        && v1Index < v2Index)) {
                    if (v1.orderedNeighbors == null) {
                        v1.orderedNeighbors = new int[1];
                        v1.orderedNeighbors[0] = v2Index;
                    } else {
                        int[] temp = v1.orderedNeighbors;
                        v1.orderedNeighbors = addToArray(temp, v2Index);
                        mergeSort(v1.orderedNeighbors);
                    }
                } else {
                    if (v2.orderedNeighbors == null) {
                        v2.orderedNeighbors = new int[1];
                        v2.orderedNeighbors[0] = v1Index;
                    } else {
                        int[] temp = v2.orderedNeighbors;
                        v2.orderedNeighbors = addToArray(temp, v1Index);
                        mergeSort(v2.orderedNeighbors);
                    }
                }
            }
        }
    }
    
    /**
     * Find the number of elements in the intersection of the 
     * orderedNeighbors of v1 and the orderedNeighbors of v2.
     * 
     * @param v1 - First Vertex.
     * @param v2 - Second Vertex.
     * @return Returns the number of elements in the intersection of 
     *      the orderedNeighbors of v1 and the orderedNeighbors of v2.
     */
    private int intersectionSize(int v1, int v2) {
        
        // Get the number of elements.
        int elements = 0;
        
        int[] v1OrderedN = this.g[v1].orderedNeighbors;
        int[] v2OrderedN = this.g[v2].orderedNeighbors;
        
        if (v1OrderedN != null && v2OrderedN != null) {
            for (int i = 0; i < v1OrderedN.length; i++) {
                for (int j = 0; j < v2OrderedN.length; j++) {
                    
                    // Found an intersection?
                    if (v1OrderedN[i] == v2OrderedN[j]) {
                        elements += 1;
                    }
                }
            }
        }
        
        //System.out.println("Elements: " + elements 
        //                    + "  v1: " + v1
        //                    + "  v2: " + v2);
        return elements;
    }

    /**
     * Return the number of triangles in the graph.
     * @return Return the number of triangles in the graph.
     */
    public int countTriangles() {
        
        populateOrderedNeighbors();
        
        int triangles = 0;
        
        for (int v1 = 0; v1 < this.g.length; v1++) {
            if (this.g[v1].orderedNeighbors != null) {
                for (int temp = 0; temp < this.g[v1].orderedNeighbors.length; temp++) {
                    int v2 = this.g[v1].orderedNeighbors[temp];
                    triangles += intersectionSize(v1, v2);
                }
            }
        }
        
        return triangles;
    }
    
    
    //*** Helpful Methods ***
    /**
     * Adds a integer value to the end of a integer array.
     * @param oldArr - Array that will add the new {@code value}.
     * @param value - Value to be added to {@code oldArr}.
     * @return Return a new array that contains the new {@code value}
     *          at the end of the new array.
     */
    private int[] addToArray(int[] oldArr, int value) {
        int[] newArr = new int[oldArr.length + 1];
        
        for(int i = 0; i < oldArr.length; i++) {
            newArr[i] = oldArr[i];
        }
        for(int i = oldArr.length; i < newArr.length; i++) {
            newArr[i] = value;
        }
        
        return newArr;
    }
    
    /**
     * Sorts a integer array in order from smallest to the largest value.
     * @param arr - The array that will be sorted.
     */
    private void bubbleSort(int[] arr) {
        boolean swap = true;

        // Comparisons.
        while (swap) {
            swap = false;

            // Check 'arr' and sort.
            for (int j = 1; j < arr.length; j++) {
                if (arr[j - 1] > arr[j]) {
                    int temp = arr[j - 1];
                    arr[j - 1] = arr[j];
                    arr[j] = temp;
                    swap = true;
                }
            }
        }
    }
    
    /**
     * Perform an insertion sort on the given array.
     * Ordered Smallest to Largest integer.
     * 
     * @param arr - The integer array to sort.
     */
    public void insertionSort(int[] arr) {
        // Create Variables here.
        for(int i = 1; i < arr.length; i++) {
            
            int selectedValue = arr[i];
            
            int j = i;
            while(j >=1 && arr[j-1] > selectedValue) {
                arr[j] = arr[j-1];
                //printArray(arr);
                j--;
            }
            
            // Insert selectedValue into home.
            arr[j] = selectedValue;
        }
    }
    
    /**
     * Perform a merge sort of an integer array. 
     * Ordered Smallest to Largest integer.
     * 
     * @param arr - The integer array to sort.
     * @return - An integer array.
     */
    public int[] mergeSort(int[] arr) {
        //Thread.yield();
        
        //### Base Case ###
        if(arr.length == 1) {
            return arr;
        }
        
        //### Split ###
        int[] leftArr = null;
        int[] rightArr = null;
        
        int mid = arr.length / 2;
        
        // Check Even
        if (arr.length % 2 == 0) {
            leftArr = new int[mid];
            rightArr = new int[mid];
        }
        else {
            leftArr = new int[mid];
            rightArr = new int[mid+1];
        }
        
        // Fill Left
        for(int i = 0; i < leftArr.length; i++) {
            //Thread.yield();
            leftArr[i] = arr[i];
        }
        // Fill Right
        for(int i = 0; i < rightArr.length; i++) {
            //Thread.yield();
            rightArr[i] = arr[mid + i];
        }
        
        leftArr = mergeSort(leftArr);
        rightArr = mergeSort(rightArr);
        
        //### Merge ###
        return mergeSort(leftArr, rightArr);
    }
    
    /**
     * Merges 2 integer arrays.
     * 
     * @param leftArr - The left integer array.
     * @param rightArr - The right integer array.
     * @return mergedArr - Returns the merged integer array.
     */
    private int[] mergeSort(int[] leftArr, int[] rightArr) {
        //Thread.yield();
        
        int[] mergedArr = new int[leftArr.length + rightArr.length];
        
        int leftIndex = 0;
        int rightIndex = 0;
        
        int mergedCount = 0;
        while(mergedCount < mergedArr.length && leftIndex < leftArr.length && rightIndex < rightArr.length) {
            //Thread.yield();
            
            int leftValue = leftArr[leftIndex];
            int rightValue = rightArr[rightIndex];
            
            if(leftValue < rightValue) {
                // Copy from left
                mergedArr[mergedCount++] = leftValue;
                leftIndex++;
            }
            else {
                // Copy from left
                mergedArr[mergedCount++] = rightValue;
                rightIndex++;
            }
        }
        
        // Feed remaining left
        while (leftIndex < leftArr.length) {
            //Thread.yield();
            mergedArr[mergedCount++] = leftArr[leftIndex++];
        }
        
        // Feed remaining right
        while (rightIndex < rightArr.length) {
            //Thread.yield();
            mergedArr[mergedCount++] = rightArr[rightIndex++];
        }
        return mergedArr;
    }
    
    
    //*** Other Visualization Methods ***
    /** DEBUG METHOD
     * Gets a string adjacency list of this graph.
     * @return Returns a String visualization of a directed graph 
     *      in the form of a adjacency list.
     */
    private String getAdjacencyList() {
        String adjacencyList = "*** Adjacency List *** \n";
        
        for (int i = 0; i < this.g.length; i++) {
            Vertex v = this.g[i];
            
            adjacencyList += i;
            int s = adjacencyList.split(" ")[4].length() - 1;
            
            EdgeNode e1 = v.edges1;
            adjacencyList += " | edges1:";
            while (e1 != null) {
                adjacencyList += " --> ";
                if (e1.next1 != null) {
                    adjacencyList += e1.vertex1 + " ";
                    adjacencyList += e1.vertex2 + "";
                } else {
                    adjacencyList += e1.vertex1 + " ";
                    adjacencyList += e1.vertex2 + "";
                }
                e1 = e1.next1;
            }
            
            adjacencyList += "\n";
            for (int i2 = s; i2 > 0; i2--) {
                adjacencyList += " ";
            }
            
            EdgeNode e2 = v.edges2;
            adjacencyList += " | edges2:";
            while (e2 != null) {
                adjacencyList += " --> ";
                if (e2.next2 != null) {
                    adjacencyList += e2.vertex1 + " ";
                    adjacencyList += e2.vertex2 + "";
                } else {
                    adjacencyList += e2.vertex1 + " ";
                    adjacencyList += e2.vertex2 + "";
                }
                e2 = e2.next2;
            }
            
            adjacencyList += "\n";
        }
        
        if (adjacencyList == "") {
            return "This list is empty.";
        }
        
        return adjacencyList;
    }
    
    /** DEBUG METHOD
     * Prints to the console the list of vertices  
     *      in the undirected graph.
     */
    private void printVertices() {
        System.out.println();
        System.out.println("*** Vertices ***");
        System.out.print("(");
        for (int i = 0; i < this.g.length; i++) {
            if (i == this.g.length - 1) {
                System.out.print(i + ")"); break;
            }
            if (i != 0 && i%10 == 0) {
                System.out.println();
            }
            System.out.print(i + ", ");
        }
        System.out.println();
        System.out.println();
    }

    /** DEBUG METHOD
     * Prints to the console the list of each vertex's  
     *      ordered neighbor.
     */
    private void printOrderedNeighbors() {
        System.out.println();
        System.out.println("*** Ordered Neighbors ***");
        
        populateOrderedNeighbors();
        
        for (int i = 0; i < this.g.length; i++) {
            Vertex v = g[i];
            int[] orderedN = v.orderedNeighbors;
            
            System.out.print(i + ": ");
            
            if (orderedN != null) {
                for (int i2 = 0; i2 < orderedN.length; i2++) {
                    if (i2 == orderedN.length - 1) {
                        System.out.print(orderedN[i2] + "");
                        break;
                    }
                    System.out.print(orderedN[i2] + ", ");
                }
            }
            
            //System.out.print("  NumNeighbors: " + v.numNeighbors);
            System.out.println();
        }
        System.out.println();
        System.out.println();
    }
    
    
    ///////////////////////////////////////////////////////////
    
    /**
     * Main program. Expects one command line argument that is
     *      the location of a input file.
     */
    public static void main(String args[]) throws IOException {
        // Check for a command line argument.
        if (args.length == 1) {
            
            //*** Process the input file line by line.
            String[] inputLines = processInput(args[0]);
            
            // DEBUG: Print "inputs" from the input file.
            //for (int i = 0; i < inputLines.length; i++) {
            //    System.out.println("Inputs[" + i + "]\t: " + inputLines[i]);
            //}
            
            //*** Build the graph and find the number of triangles.
            int size = Integer.parseInt(inputLines[0]);
            UndirectedGraph g = new UndirectedGraph(size);
            
            // Build the graph.
            for (int i = 1; i < inputLines.length; i++) {
                String[] vertices = inputLines[i].split(" ");
                if (vertices.length >= 2) {
                    int v1 = Integer.parseInt(vertices[0]);
                    int v2 = Integer.parseInt(vertices[1]);
                    
                    // Add edges to the graphs.
                    g.addEdge(v1, v2);
                }
            }
            
            // CUSTOM DEBUG: Other options.
            //g.printVertices();
            //System.out.println(g.getAdjacencyList());
            //g.printOrderedNeighbors();
            
            // DEBUG: Print the neighbors of each vertex.
            //System.out.println("*** Neighbors List ***");
            //g.printNeighbors();
            
            // Count and print out the number of triangles.
            System.out.println("The number of triangles is " + g.countTriangles() + ".");
            
            //System.out.println("\n\n*** END ***\n\n");
        }
        
        // Error on command line.
        else {
            System.out.println(
                    "Error:"
                    + " You must provide 1 command line argument"
                    + " that is the location of a readable text file."
                    + " (Example: input.txt)");
            System.exit(-1);
        }

    }
    
    /**
     * Process the input from {@code fileName} and return a String array, 
     *      where each element is one line from {@code fileName}.
     * 
     * @param fileName - The file to process input from.
     * @return Returns a string array, where each element
     *      represents one line from the input file {@code fileName}
     *      from top to bottom.
     * @throws FileNotFoundException Thrown if the given file name 
     *      is not found.
     */
    private static String[] processInput(String fileName) throws FileNotFoundException {
        int amountOfLines = 0;
        
        // Scan the amount of lines in the file.
        Scanner lineScanner = new Scanner(new File(fileName));
        while(lineScanner.hasNextLine()) {
            lineScanner.nextLine();
            amountOfLines++;
        }
        
        lineScanner.close();
        
        // Create a string array of size "amountOfLines".
        String[] sInputArray = new String[amountOfLines];
        
        // Scan input from the file "fileName".
        Scanner inputScanner = new Scanner(new File(fileName));
        
        int i = 0;
        while(inputScanner.hasNextLine()) {
            String line = inputScanner.nextLine();
            sInputArray[i] = line ;//+ "\n";
            i++;
        }
        
        inputScanner.close();
        
        // Return the string array.
        return sInputArray;
    }

}
