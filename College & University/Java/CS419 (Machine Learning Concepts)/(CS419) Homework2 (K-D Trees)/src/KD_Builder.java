//////////////////////////////////////////////////////
// File Name:   KD_Builder.java
// Author:      Kong Jimmy Vang
// Date:        10/8/2018
// 

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.Vector;

/**
 * Builds a K-D Tree. Check out the documentation of {@link #main(String[])} for more information.
 * @see #main(String[])
 * @author Kong Jimmy Vang
 */
public class KD_Builder {
    
    // *** Field/Instance Variables ***
    /** This list represents a set of vectors that will be used to build the K-D Tree, {@code kdTree}. */
    final static private ArrayList<Vector<Double>> setOfInputs = new ArrayList<>();
    
    /** This list represents a set of vectors that will be tested with the K-D Tree, {@code kdTree}. */
    final static private ArrayList<Vector<Double>> setOfTestInputs = new ArrayList<>();
    
    /** The K-D Tree to build and test with. */
    static private KDTree kdTree;
    
    /** Stores the n-dimension of the vectors globally. */
    static private int globalDimension;
    
    // *** Main ***
    /**
     * During runtime, this will build a K-D Tree, {@code kdTree}, and test some vectors using the nearest
     *      neighbor algorithm.
     * @param args - An array of arguments. Must contain 2 arguments or the program will not run. <br>
     *                  - arg[0] is the data-file from which to read. <br>
     *                  - arg[1] is the minimal set-size S.
     */
    public static void main(final String[] args) {
        try {
            
            // *** Get vectors from a given file to setup the KD-Tree. ***
            
            // *Check the given arguments, "args", for validity.
            if (args.length > 2) {
                System.err.println("\nWarning: More than 2 command-line arguments were given. "
                        + "Only the first 2 arguments will be used.\n");
            } else if (args.length <= 0) {
                //System.err.println("\nWarning: No command-line arguments were given.\n");
                throw new IOException("No command-line arguments were given.");
            }
            
            // *Find the path to the given fileName. (Located in the folder, "inputData")
            String fileName = args[0];
            Path path = Paths.get("inputData", fileName);    
            //boolean directoryExists = Files.exists(path);
            
            // *Parse the file line by line.
            //      - The first line should be an integer value d that give the dimensionality of the data.
            //      - The remaining lines should consist of d amount of floating-point values v,
            //          0 <= v < 1, that define data-points.
            Scanner fileScanner = new Scanner(new File(path.toAbsolutePath().toString()));
            
            // Set S and the dimension d (global) accordingly.
            int S = Integer.parseInt(args[1]);
            globalDimension = Integer.parseInt(fileScanner.nextLine());
            
            while(fileScanner.hasNextLine()) {
                String s = fileScanner.nextLine(); // Read the current raw line with a I/O object (Scanner).
                String[] split = s.split(" "); // Get the vector info from that particular line.
                
                // Add this vector into the list (or set of vectors).
                Vector<Double> input = new Vector<>();
                for (int j = 0; j < split.length; j++) {
                    input.add(Double.parseDouble(split[j]));
                }
                setOfInputs.add(input);
            }
            fileScanner.close();
            
            // *** Build the K-D Tree. ***
            kdTree = buildTree(setOfInputs, 0, S);
            
            // *** Print Tree Leaves? Ask if the user wants to print the tree. ***
            Scanner user = new Scanner(System.in);
            System.out.print("\nPrint tree leaves? (Enter Y for yes, anything else for no): ");
            if (user.nextLine().equalsIgnoreCase("Y")) {
                System.out.println();
                System.out.println("------------------------\n");
                System.out.print(kdTree); // Print kdTree here.
                System.out.println("------------------------\n");
            }
            
            // *** Test Data? Ask if the user wants to test some data from a particular test file. ***
            while(true) { // While loop. (Asks the same question until user quits or types a valid file.)
                System.out.print("Test data? (Enter Y for yes, anything else to quit): ");
                if (user.nextLine().equalsIgnoreCase("Y")) {
                    
                    // *Ask for the name and location of the data-file or test file.
                    System.out.print("Name of data-file: ");
                    String testFile = user.nextLine();
                    Path testFilePath = Paths.get("inputData", testFile);
                    
                    boolean directoryExists = Files.exists(testFilePath);
                    if (!directoryExists) {
                        System.out.println();
                        System.out.println("*** Error: That file does not exists. ***");
                        continue;
                    }
                    
                    // *Scan the lines for the dimension and vectors in "testFile".
                    fileScanner = new Scanner(testFilePath);
                    globalDimension = Integer.parseInt(fileScanner.nextLine());
                    
                    while(fileScanner.hasNextLine()) {
                        String s = fileScanner.nextLine(); // Read the current raw line with a I/O object (Scanner).
                        String[] split = s.split(" "); // Get the vector info from that particular line.
                        
                        // Add this vector into the list (or set of vectors).
                        Vector<Double> input = new Vector<>();
                        for (int j = 0; j < split.length; j++) {
                            input.add(Double.parseDouble(split[j]));
                        }
                        setOfTestInputs.add(input);
                    }
                    
                    fileScanner.close();
                    
                    // *** Find/Print the nearest neighbor of each vector obtained from "testFile". ***
                    System.out.println();
                    System.out.println("------------------------\n");
                    
                    for (int i = 0; i < setOfTestInputs.size(); i++) {
                        Vector<Double> vector = setOfTestInputs.get(i);
                        findNearestNeighbor(vector, 0);
                    }
                    
                    System.out.println("------------------------\n");
                } else {
                    System.out.println();
                    System.out.println("------------------------\n");
                }
                
                user.close();
                break;
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        // *Politely wish the user Goodbye. 
        System.out.println("Goodbye.\n");
    }
    
    // *** Methods/Functions ***
    /**
     * Builds a K-D Tree from the set {@code X}.
     * 
     * @param X - The set of n-dimensional data-points, and of size depth d.
     * @param d - The current depth of the tree. 
     *              Sets the feature (which is an element of X) that will be used to divide data into separate subsets.
     * @param S - The minimal set-size of when to stop splitting data.
     * @return Return the new K-D Tree.
     */
    private static KDTree buildTree(final ArrayList<Vector<Double>> X, 
                                  final int d,
                                  final int S) {
        KDTree k = new KDTree(buildTreeNode(null, X, d, S));
        
        //return new KDTree(buildTreeNode(null, X, d, S));
        return k;
    }
    
    /** [Helper List for {@link #findMedian(ArrayList, int)}] <br><br>
     * The list, tX1 or tX-, is a temporary subset of X, that will store values <= the median. */
    private static ArrayList<Vector<Double>> tX1;
    /** [Helper List for {@link #findMedian(ArrayList, int)}] <br><br>
     * The list, tX2 or tX+, is a temporary subset of X, that will store values > the median. */
    private static ArrayList<Vector<Double>> tX2;
    
    /**
     * [Helper Method for {@link #buildTree(ArrayList, int, int)}] 
     *      Builds a tree out of nodes and returns the root node.
     * 
     * @param X - The set of n-dimensional data-points, and of size depth d.
     * @param d - The current depth of the tree. 
     *              Sets the feature (which is an element of X) that will be used to divide data into separate subsets.
     * @param S - The minimal set-size of when to stop splitting data.
     * @return Return the root node.
     */
    private static KDTreeNode<ArrayList<Vector<Double>>> 
                        buildTreeNode(final KDTreeNode<ArrayList<Vector<Double>>> parent,
                                      final ArrayList<Vector<Double>> X, 
                                      final int d,
                                      final int S) {
        
        // *** Case 1: If |X.size| <= S, return a node containing X. ***
        if (Math.abs(X.size()) <= S) {
            
            // Create bounding box.
            ArrayList<Vector<Double>> boundingBox = calculateBoundingBox(X);
            
            // Return the node containing the set/list X (and boundingBox).
            return new KDTreeNode<ArrayList<Vector<Double>>>(parent, X, boundingBox);
        } 
        
        // *** Case 2: Split the set X into subsets X- and X+. ***
        //              X1 = X- (The set of all data-points x.i <= m.delta (m = median))
        //              X2 = X+ (The set of all data-points x.j > m.delta (m = median))
        else {
            
            // Find the median value starting at a dimension "delta".
            int n = globalDimension;
            int delta = (d % n) + 1;
            double median = findMedian(X, delta);
            
            // Build the list that will contain the median value and be stored in a "node".
            ArrayList<Vector<Double>> LIST_CONTAINING_MEDIAN_VALUE = new ArrayList<>();
            Vector<Double> vector = new Vector<>();
            vector.add(median);
            //vector.add((double)delta);
            LIST_CONTAINING_MEDIAN_VALUE.add(vector);
            
            // Build the lists that will be stored in the left and right children of a "node".
            ArrayList<Vector<Double>> X1 = tX1;  // Get X1 with values <= the median.
            ArrayList<Vector<Double>> X2 = tX2;   // Get X2 with values > the median.
            
            // Create the node and it's left and right children.
            KDTreeNode<ArrayList<Vector<Double>>> node = new KDTreeNode<>(parent, LIST_CONTAINING_MEDIAN_VALUE);
            node.setLeft(buildTreeNode(node, X1, d + 1, S));  // Recurse left.
            node.setRight(buildTreeNode(node, X2, d + 1, S)); // Recurse right.
            
            // Create bounding box for "node".
            ArrayList<Vector<Double>> boundingBox = calculateBoundingBox(X);
            
            // Return "node" which contains the Median Value.
            node.setBoundingBox(boundingBox);
            
            return node;
        }
        
    }
    
    /**
     * Finds the median value in a set of vectors at a particular dimension (Vector[x, y, z, etc.]; x is the first dimension).
     * 
     * @param X - A list/set of vectors.
     * @param dimension - The dimension index in a set of vectors.
     * @return Return a median value.
     */
    private static double findMedian(
            ArrayList<Vector<Double>> X, 
            final int dimension) {
        
        // Sort the vector values at the current dimension. (allows for an easier median search)
        quickSort(X, dimension - 1);
        
        // *** Find median of the current dimension. ***
        // HELPFUL NOTES BELOW:
        // 
        //                                middle1 middle2
        // Even Sized ArrayList    [1.0, 2.0,    3.0,      9.0]
        //      median = 2.5;
        // 
        //                                     middle1
        //                                     middle2  
        // Odd Sized ArrayList     [1.0, 2.0, 3.0,     9.0, 12.0]
        //      median = 3.0;
        // 
        int middle1 = 0;    // Index for the sortedList.
        int middle2 = 0;    // Index for the sortedList.
        
        double medianValue = 0;
        if (X.size() <= 0) {
            // No elements in the list.
            return -1;
        } else if (X.size() % 2 == 0) {
            // Even sized list
            middle1 = (X.size()/2) - 1;
            middle2 = (X.size()/2) - 0;
            medianValue = (X.get(middle1).get(dimension - 1) 
                    + X.get(middle2).get(dimension - 1)
                    ) / 2.0;
        } else {
            // Odd sized list
            middle1 = (X.size()/2) - 0;
            //middle2 = (sortedList.size()/2) - 0;
            medianValue = X.get(middle1).get(dimension - 1);
        }
        
        // Format the median value (round to 6 decimal places).
        DecimalFormat df = new DecimalFormat("0.######");
        medianValue = Double.parseDouble(df.format(medianValue));
        
        // Split the sorted list into temporary sublists tX1 and tX2.
        int medianIndex = binaryProximitySearch(X, medianValue, 
                dimension - 1, 0, X.size() - 1, 0);
        
        // Shift the index to split at.
        int splitIndex = medianIndex;
        while (splitIndex < X.size() - 1 
                && X.get(splitIndex).get(dimension - 1).equals(X.get(splitIndex + 1).get(dimension - 1))) {
            splitIndex++;
        }
        
        tX1 = new ArrayList<>(X.subList(0, splitIndex + 1));
        tX2 = new ArrayList<>(X.subList(splitIndex + 1, X.size()));
        
        // Return the median value.
        return medianValue;
    }
    
    /**
     * Given a {@code point}, find the nearest neighbor in a list of vectors.
     *      The list that will be used is contained in the tree, {@code kdTree}. <br><br>
     *      
     *      After the nearest neighbor is found, this function will print out a message, 
     *          containing info about the nearest neighbor, to the user's console.
     *          
     * @param point - A given point or vector.
     * @param d - The dimension index in a set of vectors.
     */
    private static void findNearestNeighbor(
            final Vector<Double> point, 
            final int d) {
        
        if (kdTree == null) {
            throw new NullPointerException("The \"kdTree\" is null! A bug in the code may be the culprit.");
        }
        
        // *** Query the "kdTree" and return a leaf "node", which contains a list of possible vectors near the given vector "point". ***
        KDTreeNode<ArrayList<Vector<Double>>> node = findNearestNeighbor(kdTree.getRoot(), point, d);
        if (node == null) {
            throw new NullPointerException("A null KDTreeNode was detected here. "
                    + "You should not see this message under normal circumstances.");
        }
        
        // *** Get the nearest neighbor (nearest vector) close to the given vector "point". ***
        Vector<Double> nearestNeighbor = findNearestNeighborVector(point, node);
        DecimalFormat df = new DecimalFormat("0.000000");
        
        // *** Check if the "nearestNeighbor" node has no neighbor in the list in "node". ***
        // Case 1: "nearestNeighbor" has no neighbor in the list of "node".
        if (nearestNeighbor.isEmpty()) {
            // Print that there is no nearest neighbor.
            System.out.println(point + " has no nearest neighbor (in an empty set).");
            System.out.println();
        }
        // Case 2: "nearestNeighbor" has one neighbor in the list of "node".
        else {
            // Print vector information/etc.
            System.out.println(removeCommas(point.toString()) + " is in the set: " + removeCommas(node.getData().toString()));
            System.out.println("Nearest neighbor: " + removeCommas(nearestNeighbor.toString())
                    + " (distance = " + df.format(calculateDistance(point, nearestNeighbor)) + ")");
            //System.out.println("Node L: " + node.getLeft() + " | Node R: " + node.getRight());
            System.out.println();
        }
    }
    
    /**
     * [Helper Method for {@link #findNearestNeighbor(Vector, int)}]
     * Given a {@code point}, find the nearest neighbor in a list of vectors. 
     *      The list that will be used is contained in a particular {@code node}.
     *      
     * @param node - A node containing a list of vectors.
     * @param point - A given point or vector.
     * @param d - The dimension index in a set of vectors.
     * @return Returns the node containing a vector being the nearest neighbor to another vector, {@code point}.
     */
    private static KDTreeNode<ArrayList<Vector<Double>>> findNearestNeighbor(
            final KDTreeNode<ArrayList<Vector<Double>>> node,
            final Vector<Double> point, 
            final int d) {
        
        int n = globalDimension;
        int delta = (d % n) + 0;
        
        // Base Case 1: "node" is a leaf node.
        if (node.getLeft() == null && node.getRight() == null) {
            return node;
        } 
        // Base Case 2: "node" has an empty list.
        if (node.getData().size() == 0) {
            return node;
        }
        
        Double pointValue = point.get(delta);   // pointValue = Vector.get(dimension).Double
        Double nodeValue = node.getData().get(0).get(0);    // nodeValue = KDTreeNode.ArrayList.Vector.Double
        
        // Traversal Case 1: Traverse the left child node if vector point's dimensional value is <= node's median value.
        if (node.getLeft() != null && pointValue.compareTo(nodeValue) <= 0) {
            return findNearestNeighbor(node.getLeft(), point, d + 1);
        }
        // Traversal Case 2: Traverse the right child node if vector point's dimensional value is > node's median value.
        if (node.getRight() != null && pointValue.compareTo(nodeValue) > 0) {
            return findNearestNeighbor(node.getRight(), point, d + 1);
        }
        // Traversal Case 3: Return the current node if we cannot traverse anymore and call that returned node the nearest neighbor.
        return node;
    }
    
    /**
     * Find a vector, which is the nearest neighbor in the {@code node}'s list, that is closest to the vector {@code v1}.
     * @param v1 - 1st Vector.
     * @param node - A node containing a list of vectors.
     * @return Return a vector, representing the nearest neighbor, that is closest to v1.
     */
    private static Vector<Double> findNearestNeighborVector(
            final Vector<Double> v1,
            final KDTreeNode<ArrayList<Vector<Double>>> node) {
        
        Vector<Double> nearestNeighbor = new Vector<>();
        double distance1 = Double.MAX_VALUE;
        
        for (int i = 0; i < node.getData().size(); i++) {
            Vector<Double> vector = node.getData().get(i);
            
            double distance2 = calculateDistance(v1, vector);
            if (distance2 < distance1) {
                nearestNeighbor = vector;
                distance1 = distance2;
            }
        }
        
        return nearestNeighbor;
    }
    
    /**
     * Calculates the distance between two vectors, {@code v1} and {@code v2}, using the distance formula. <br><br>
     * 
     * Pre-condition: Vectors v1 and v2 must both contain an equal amount of dimensions. [ v1.size() == v2.size() ].
     *      Otherwise, a warning is given and the program is terminated.
     * 
     * @param v1 - 1st Vector.
     * @param v2 - 2nd Vector.
     * @return Return the distance between the vector {@code v1} and vector {@code v2}.
     */
    private static Double calculateDistance(final Vector<Double> v1, final Vector<Double> v2) {
        
        // Vectors v1 and v2 must contain an equal amount of dimensions. Otherwise, a warning is given and the program is terminated.
        if (v1.size() != v2.size()) {
            try {
                throw new Exception("Exception! - Reason: The Vectors, v1 and v2, do not have an equal amount of dimensions "
                        + "(or are not equal in size). Cannot calculate two vectors of with different dimensions. Wrong test files?"
                        + "\n\nHelpful Information:\n"
                        + "   Size Info:         v1.size() = " + v1.size() + ", v2.size() = " + v2.size() + "\n"
                        + "   Vector Contents:   v1: " + v1 + ", v2: " + v2 + "\n");
                
            } catch (Exception e) {
                e.printStackTrace();
                System.exit(-1);
            }
        }
        
        // Calculate distance.
        double distance = 0;
        for (int i = 0; i < v1.size(); i++) {
            distance += Math.pow((v2.get(i) - v1.get(i)), 2);
        }
        distance = Math.sqrt(distance);
        
        DecimalFormat df = new DecimalFormat("0.######");
        return Double.parseDouble(df.format(distance));
    }
    
    /**
     * Calculates the bounding box of a list/set of vectors.
     * @param X - A list/set of vectors.
     * @return Returns the bounding box of a list/set of vectors.
     */
    private static ArrayList<Vector<Double>> calculateBoundingBox(final ArrayList<Vector<Double>> X) {
        
        int dimension = globalDimension;
        Vector<Double> minVector = new Vector<>();
        Vector<Double> maxVector = new Vector<>();
        if (!X.isEmpty()) {
            for (int i = 0; i < dimension; i++) {
                minVector.add(Double.MAX_VALUE);
                maxVector.add(Double.MIN_VALUE);
            }
        } else {
            for (int i = 0; i < dimension; i++) {
                minVector.add(0.0);
                maxVector.add(0.0);
            }
        }
        
        for (int i = 0; i < X.size(); i++) {
            Vector<Double> vector = X.get(i);
            for (int j = 0; j < vector.size(); j++) {
                if (vector.get(j) < minVector.get(j)) {
                    minVector.remove(j);
                    minVector.add(j, vector.get(j));
                }
                if (vector.get(j) > maxVector.get(j)) {
                    maxVector.remove(j);
                    maxVector.add(j, vector.get(j));
                }
            }
        }
        
        ArrayList<Vector<Double>> boundingBox = new ArrayList<>();
        boundingBox.add(minVector);
        boundingBox.add(maxVector);
        return boundingBox;
    }
    
    /**
     * Removes all commas from a string, except for the "]," string.
     * @param string - A string that will have most of its commas removed.
     * @return Return a new string with no commas, except for the "]," string.
     */
    private static String removeCommas(final String string) {
        
        StringBuilder sb = new StringBuilder();
        String s = string;
        for (int i = 0; i < s.length(); i++) {
            if (',' != s.charAt(i) || 
                    (i > 0 && ']' == s.charAt(i-1) && ',' == s.charAt(i))) {
                sb.append(s.charAt(i));
            }
        }
        s = sb.toString();
        
        return s;
    }
    
    /**
     * Quicksorts a list of vectors in the given dimension.
     * 
     * @param vectors - A list of vectors.
     * @param dimension - The dimension index in the set of vectors.
     */
    protected static void quickSort(ArrayList<Vector<Double>> vectors, 
            int dimension) {
        quickSort(vectors, dimension, 0, vectors.size() - 1);
    }
    
    /** The CUTOFF is used to sort sublists of a set size (Default: 10). */
    private static final int CUTOFF = 10;
     
    /**
     * [Helper Method for {@link #quickSort(ArrayList, int)}] <br><br>
     * 
     * Quicksorts a list of vectors in the given dimension.
     *      Uses the median-of-three partitioning and a cutoff of 10.
     * 
     * @param vectors - A list of vectors.
     * @param dimension - The dimension index in the set of vectors.
     * @param low - Starting index (inclusive).
     * @param high - Ending index (inclusive).
     */
    private static void quickSort(ArrayList<Vector<Double>> vectors, 
            int dimension, int low, int high) {
        
        if(low + CUTOFF > high)
            insertionSort(vectors, dimension, low, high);
        else {
            
            // Sort low, middle, high.
            int middle = (low + high) / 2;
            if(vectors.get(middle).get(dimension).compareTo(vectors.get(low).get(dimension)) < 0)
                swap(vectors, low, middle);
            if(vectors.get(high).get(dimension).compareTo(vectors.get(low).get(dimension)) < 0)
                swap(vectors, low, high);
            if(vectors.get(high).get(dimension).compareTo(vectors.get(middle).get(dimension)) < 0)
                swap(vectors, middle, high);
            
            // Place pivot at position high - 1
            swap(vectors, middle, high - 1);
            Double pivot = vectors.get(high - 1).get(dimension);
            
            // Partition
            int i, j;
            for(i = low, j = high - 1; ; ) {
                while(vectors.get(++i).get(dimension).compareTo(pivot) < 0)
                    ;
                while(pivot.compareTo(vectors.get(--j).get(dimension)) < 0)
                    ;
                if(i >= j)
                    break;
                swap(vectors, i, j);
            }
            
            // Restore pivot
            swap(vectors, i, high - 1);
            
            // Recurse
            quickSort(vectors, dimension, low, i - 1);    // Sort small elements
            quickSort(vectors, dimension, i + 1, high);   // Sort large elements
        }
    }
    
    /**
     * Swaps two vectors at index1 and index2 in the list of vectors, {@code vectors}.
     * @param vectors - A list of vectors.
     * @param index1 - The index of the first vector.
     * @param index2 - The index of the second vector.
     */
    private static final void swap(ArrayList<Vector<Double>> vectors, 
            int index1, int index2) {
        
        Vector<Double> temp = vectors.get(index1);
        vectors.set(index1, vectors.get(index2));
        vectors.set(index2, temp);
    }
    
    /**
     * [Helper Method for {@link #quickSort(ArrayList, int, int, int)}] <br><br>
     * 
     * Internal insertion sort for sublists of the given list, {@code vectors}.
     * 
     * @param vectors - A list of vectors.
     * @param low - The left-most index of the sublists.
     */
    private static void insertionSort(ArrayList<Vector<Double>> vectors, 
            int dimension, int low, int high) {
        
        for(int p = low + 1; p <= high; p++) {
            Vector<Double> temp = vectors.get(p);
            int j;
            
            for(j = p; j > low && temp.get(dimension).compareTo(vectors.get(j - 1).get(dimension)) < 0; j--) {
                vectors.set(j, vectors.get(j - 1));
            }
            vectors.set(j, temp);
        }
    }
    
    /**
     * [Helper Method for... <br>
     *      {@link #findMedian(ArrayList, int)}] <br><br>
     *      
     * In a particular list of vectors, {@code vectors}, search for a target value 
     *      in the given dimension and return an index depending on the given value, {@code mode}. 
     *      The function of the value, {@code mode}, is explained in the return documentation below.
     *      
     * @param vectors - The list of vectors to search in.
     * @param target - The target value to find in the list of vectors at a given dimension.
     * @param dimension - The given dimension index in all vectors.
     * @param lowerbound - Search indices higher than lowerbound (inclusive).
     * @param upperbound - Search indices lower than upperbound (inclusive).
     * @param mode - See the <b>Returns</b> description for more info.
     * 
     * @return 
     *          Return the index of {@code vectors} in the given dimension that contains the target value. <br><br>
     * 
     *          Otherwise, if the target is not found... <br>
     *          If (mode == 0), return the index that contains a value closest and less than 
     *              the {@code target} value. 
     *              (The index must exist, otherwise return the closest existing index) <br>
     *          If (mode == 1), return the index that contains a value closest and greater than 
     *              the {@code target} value. 
     *              (The index must exist, otherwise return the closest existing index) <br>
     *          Else if the mode is != 0 or != 1, 
     *              return the index that contains a value closest to the {@code target} value.
     */
    private static int binaryProximitySearch(
            ArrayList<Vector<Double>> vectors, 
            final Double target, final int dimension, 
            int lowerbound, int upperbound, 
            final int mode) {
        
        if(target > vectors.get(upperbound).get(dimension)) {
            return upperbound;
        }
        if(target < vectors.get(lowerbound).get(dimension)) {
            return lowerbound;
        }
        
        int middlebound = (lowerbound + upperbound)/2;
        
        while(target != vectors.get(middlebound).get(dimension)) {
            // The target was NOT found, return the index containing the value closest to the target value.
            if(lowerbound > upperbound) {
                if (mode == 0) {
                    return middlebound;
                } else if (mode == 1) {
                    return lowerbound;
                } else {
                    if (Math.abs(target - vectors.get(middlebound).get(dimension)) 
                            <= Math.abs(target - vectors.get(lowerbound).get(dimension))) {
                        return middlebound;
                    } else {
                        return lowerbound;
                    }
                }
            }
            
            // Search left of the middlebound index.
            if (target < vectors.get(middlebound).get(dimension)) {
                upperbound = middlebound - 1;
                middlebound = (lowerbound + upperbound)/2;
            }
            // Search right of the middlebound index.
            else if (target > vectors.get(middlebound).get(dimension)) {
                lowerbound = middlebound + 1;
                middlebound = (lowerbound + upperbound)/2;
            }
            // The target is found, return the index containing the target.
            else {//if (target == vectors.get(middlebound).get(dimension)) {
                return middlebound;
            }
        }
        
        return middlebound;
    }
}
