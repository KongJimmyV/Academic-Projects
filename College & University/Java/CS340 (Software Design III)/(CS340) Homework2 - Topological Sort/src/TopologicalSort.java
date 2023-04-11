//
// TopologicalSort.java
// Created by: Kong Jimmy Vang
//

import java.io.*;
import java.util.*;

/**
 * Adjacency list representation of a directed graph.
 *      
 * @author Kong Jimmy Vang
 */
public class TopologicalSort {
    
    // *** Node Classes ***
    /**
     * Vertex node of a directed graph.
     */
    private class VertexNode {
        private String name;
        private VertexNode nextV;
        private EdgeNode edges;
        private int indegree;

        private VertexNode(String n, VertexNode v) {
            name = n;
            nextV = v;
            edges = null;
            indegree = 0;
        }
    }
    
    /**
     * Edge node of a directed graph.
     */
    private class EdgeNode {
        private VertexNode vertex1;
        private VertexNode vertex2;
        private EdgeNode nextE;

        private EdgeNode(VertexNode v1, VertexNode v2, EdgeNode e) {
            vertex1 = v1;
            vertex2 = v2;
            nextE = e;
        }
    }

    // *** Field Variables, Constructors, and Methods ***
    private VertexNode vertices;    // Head of the list of vertex nodes
    private int numVertices;        // The number of vertices in the list.

    /**
     * 
     */
    public TopologicalSort() {
        vertices = null;
        numVertices = 0;
    }

    /**
     * Adds a Vertex named, {@code s}, to the {@code vertices} list.<br>
     * <br>
     * PRE: The vertex list is sorted in ascending order using the name as the key.<br>
     * POST: A vertex with name s has been add to the vertex list and the vertex
     * list is sorted in ascending order using the name as the key.
     * 
     * @param s - The name of the vertex.
     */
    public void addVertex(String s) {
        
        //*** Create Temporary Node References. ***
        VertexNode v1 = this.vertices;
        VertexNode vPrev = null;
        
        //*** Attempt to add the Vertex name of "s".
        // Case 1: numVertices <= 0
        if (this.numVertices <= 0) {
            this.vertices = new VertexNode(s, v1);
            this.numVertices++;
        }
        
        // Case 2: numVertices > 0
        else {
            // Find the position that keeps this list properly sorted.
            while (v1 != null) {
                
                // Compare items/datum.
                if (s.compareTo(v1.name) <= 0) {
                    // Insert Item into the list.
                    VertexNode newNode = new VertexNode(s, v1);
                    
                    if (vPrev != null) {
                        vPrev.nextV = newNode;
                    }
                    if (v1 == this.vertices) {
                        this.vertices = newNode;
                    }
                    
                    this.numVertices++;
                    break;
                }
                
                if (v1.nextV == null) {
                    // Insert Item into the list.
                    v1.nextV = new VertexNode(s, null);
                    this.numVertices++;
                    break;
                }
                
                // Goto the next node in the list.
                vPrev = v1;
                v1 = v1.nextV;
            }
        }
        
    }

    /**
     * Creates an Edge from {@code n1} to {@code n2} and adds them 
     *      to the {@code n1} edge list.<br>
     * <br>
     * PRE: The vertices n1 and n2 have already been added.<br>
     * POST: The new edge (n1, n2) has been added to the n1 edge list.
     * @param n1 - Vertex. Add n2 to n1's edge list.
     * @param n2 - Vertex.
     */
    public void addEdge(String n1, String n2) {
        //*** Prevent an edge from being added to an empty list. ***
        if (this.vertices == null) {
            System.out.println("Error: No vertices exist. Cannot add the edge.");
            return;
        }
        
        //*** Create Temporary Node References. ***
        VertexNode vertex1 = this.vertices;
        VertexNode vertex2 = this.vertices;
        
        //*** Iterate vertex1 and vertex2 to the correct vertices. ***
        // Iterate the vertex list v1.
        while (vertex1 != null) {
            if (vertex1.name.equals(n1)) {
                break;
            }
            vertex1 = vertex1.nextV;
        }
        
        if (vertex1 == null) {
            System.out.println("Error: The vertex node of n1 does not exist. Cannot add the edge. (" + n1 + ", " + n2 + ")");
            return;
        }
        
        // Iterate the vertex list vertex2.
        while (vertex2 != null) {
            if (vertex2.name.equals(n2)) {
                break;
            }
            vertex2 = vertex2.nextV;
        }
        
        if (vertex2 == null) {
            System.out.println("Error: The vertex node of n2 does not exist. Cannot add the edge. (" + n1 + ", " + n2 + ")");
            return;
        }
        
        //*** Add the edge to the EdgeNode list of "v1.edges". ***
        EdgeNode e = vertex1.edges;
        
        // Case A1: Edge does not exist.
        if (e == null) {
            e = new EdgeNode(vertex1, vertex2, null);
            vertex1.edges = e;
            
            //System.out.println("\tA1");
        }
        // Case A2: Edge exists.
        else {
            //System.out.println("\tA2");
            
            // Iterate through e.
            while (e != null) {
                VertexNode v1 = e.vertex1;
                VertexNode v2 = e.vertex2;
                
                // Case B1: The vertex containing n1
                //      already contains the edge (n1 --> n2).
                if (v1.name.compareTo(n1) == 0
                        && v2.name.compareTo(n2) == 0) {
                    //System.out.println("Warning: The edge of n1 and n2 already exist. Cannot add the edge (" + n1 + ", " + n2 + ").");
                    e = e.nextE;
                    continue;
                }
                
                // Case B2: n2 is less than or equal to 'v2.name'.
                if (n2.compareTo(v2.name) <= 0) {
                    // Insert the new edge before the EdgeNode e.
                    EdgeNode newEdge = new EdgeNode(vertex1, vertex2, e);
                    
                    // Increment vertex1 and vertex2 in-degrees.
                    vertex2.indegree++;
                    
                    if (e == vertex1.edges) {
                        vertex1.edges = newEdge;
                    }
                    
                    break;
                }
                
                // Case B3: n1 is greater than n2.
                    // Do Case B4.
                
                // Case B4: e.nextE == null.
                if (e.nextE == null) {
                    e.nextE = new EdgeNode(vertex1, vertex2, null);
                    
                    // Increment vertex1 and vertex2 in-degrees.
                    vertex2.indegree++;
                } 
                
                e = e.nextE;
            }
        }
    }

    //*** Topological Ordering Methods ***
    int[] indegree;
    LinkedList<Integer> queue;
    int[][] gMatrix;
    
    /**
     * Sorts the directed graph in topological order.
     * 
     * @return - Return {@code null} if the graph contains a cycle.<br>
     *          - Otherwise return a string containing the names of vertices separated by
     *          blanks in a topological order.
     */
    public String topoSort() {
        
        // Setup fields for indegree and queueInt.
        indegree = new int[numVertices];
        queue = new LinkedList<>();
        
        // Build an adjacency matrix.
        buildMatrix();
        
        // Get the in-degrees and initialize the queue.
        calcIndegrees();
        
        // Initialize the queue.
        initQueue();
        
        // Start Topological Sort.
        String topologicalOrder = "";
        int topoIterationCount = 0;
        while (queue.size() != 0) {
            int i = queue.remove();
            
            int counter = i;
            VertexNode v = this.vertices;
            while (v != null && counter > 0) {
                counter--;
                v = v.nextV;
            }
            
            topologicalOrder += v.name + " ";
            updateIndegrees(i);
            topoIterationCount++;
        }
        
        // If a cycle is not detected/found,
        //      return the Topological Order string.
        if (topoIterationCount == numVertices)
            return topologicalOrder;
        
        // If a cycle was detected/found, return null.
        return null;
    }
    
    /**
     * Builds the adjacency matrix, {@code gMatrix}, 
     *      for the directed graph to be used by {@code topoSort}.
     */
    private void buildMatrix() {
        gMatrix = new int[numVertices][numVertices];
         
        VertexNode v = this.vertices;
        
        int i = 0;
        while (v != null) {
            int j = 0;
            EdgeNode e = v.edges;
            
            while (e != null) {
                
                j = 0;
                VertexNode v2 = this.vertices;
                while (v2 != null) {
                    //System.out.println(v2.name + " " + e.vertex2.name);
                    if (v2.name.equals(e.vertex2.name)) {
                        break;
                    }
                    
                    v2 = v2.nextV;
                    j++;
                }
                
                // Add a connection.
                gMatrix[i][j] = 1;
                
                e = e.nextE;
            }
            
            v = v.nextV;
            i++;
        }
        
        // DEBUG: Print gMatrix.
//        for (int r = 0; r < gMatrix.length; r++) {
//            for (int c = 0; c < gMatrix[r].length; c++) {
//                System.out.print(gMatrix[r][c] + " ");
//            }
//            System.out.println();
//        }
        
    }
    
    /**
     * Calculate the in-degrees for the array, {@code indegree},
     *      to be used by {@code topoSort()}.
     */
    private void calcIndegrees() {
        for (int i = 0; i < numVertices; i++)
            indegree[i] = 0;
        for (int j = 0; j < numVertices; j++)
            for (int i = 0; i < numVertices; i++)
                indegree[j] = indegree[j] + gMatrix[i][j];
    }
    
    /**
     * Initializes {@code queue} for {@code topoSort()}.
     */
    private void initQueue() {
        for (int i = 0; i < numVertices; i++) {
            if (indegree[i] == 0)
            queue.add(i);
        }
    }
    
    /**
     * Updates the in-degrees of {@code vertex} 
     *      to be used by {@code topoSort()}.
     * @param vertex - vertex to have its in-degrees updated.
     */
    private void updateIndegrees(int vertex) {
        for (int j = 0; j < numVertices; j++) {
            if (gMatrix[vertex][j] == 1) {
                indegree[j]--;
                if (indegree[j] == 0)
                    queue.add(j);
            }
        }
    }
    
    //*** Visualization Methods ***
    /** DEBUG METHOD
     * Gets a string adjacency list of this graph.
     * @return Returns a String visualization of a directed graph 
     *      in the form of a adjacency list.
     */
    private String getAdjacencyList() {
        String adjacencyList = "";
        
        VertexNode v = this.vertices;
        
        while (v != null) {
            adjacencyList += v.name + " --> ";
            
            EdgeNode e = v.edges;
            while (e != null) {
                
                if (e.nextE != null) {
                    adjacencyList += e.vertex2.name + " --> ";
                } else {
                    adjacencyList += e.vertex2.name + "";
                }
                e = e.nextE;
            }
            
            if (v.nextV != null) {
                adjacencyList += "\n";
            }
            v = v.nextV;
        }
        
        return adjacencyList;
    }
    
    /** DEBUG METHOD
     * Get the in-degrees of each vertex in string form.
     * @return Returns the in-degrees of each vertex in string form.
     */
    private String getIndegrees() {
        String indegrees = "";
        
        VertexNode v = this.vertices;
        
        while (v != null) {
            indegrees += v.name + "";
            indegrees += " (In-degree: " + v.indegree + ")";
            
            if (v.nextV != null) {
                indegrees += "\n";
            }
            v = v.nextV;
        }
        
        return indegrees;
    }
    
///////////////////////////////////////////////////////////////
    /**
     * Main program. Expects one command line argument consisting
     *      of a file's location.
     */
    public static void main(String args[]) throws IOException {
        // Check for a command line argument.
        if (args.length == 1) {
            //*** Create a TopologicalSort object "t".
            TopologicalSort t = new TopologicalSort();
            
            //*** Process the input file.
            String[] inputs = processInput(args[0]);
            
            // DEBUG: Print "inputs" from the input file.
//            for (int i = 0; i < inputs.length; i++) {
//                System.out.println("Inputs[" + i + "]\t: " + inputs[i]);
//            }
            
            //*** Get the vertices and add them to the list of "t".
            String[] vertices = inputs[0].split(" ");
            for (int i = 0; i < vertices.length; i++) {
                t.addVertex(vertices[i]);
                //System.out.println("Added Vertex: " + vertices[i] + ".");
            }
            
            //*** Get the edges and add them to the vertices of "t".
            for (int i = 1; i < inputs.length; i++) {
                String[] edges = inputs[i].split(" ");
                if (edges.length >= 2) {
                    t.addEdge(edges[0], edges[1]);
                }
                
                //System.out.println("Added Edge: (" + edges[0] + ", " + edges[1] + ").");
            }
            
            // DEBUG: Print the Adjacency List and In-degrees of the Directed Graph.
//            System.out.println("\n=== Adjacency List ===\n" + 
//                                t.getAdjacencyList() + "\n");
//            System.out.println("=== Indegrees Of Each Vertex ===\n" + 
//                                t.getIndegrees() + "\n");
            
            //*** Print Topological Order to the console.
            String sTopologicalOrder = t.topoSort();
            
            if (sTopologicalOrder == null) {
                System.out.println("No topological ordering exists for the graph.");
            } else {
                System.out.println("Topological Order: " + sTopologicalOrder);
            }
            
        } 
        
        // Error on command line.
        else {
            System.out.println(
                    "Error:"
                    + " You must provide 1 command line argument of"
                    + " a readable/compatible text file's location."
                    + " (Example: input.txt)");
            System.exit(-1);
        }
    }
    
    /**
     * Process the input from {@code fileName} and return a String array, representing
     *      inputs from the text(txt) file.
     * 
     * @param fileName
     * @return
     * @throws FileNotFoundException
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
    
///////////////////////////////////////////////////////////////
    
}