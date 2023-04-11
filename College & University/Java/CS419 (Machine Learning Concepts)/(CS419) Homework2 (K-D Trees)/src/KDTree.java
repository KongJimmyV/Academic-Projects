//////////////////////////////////////////////////////
// File Name:   KDTree.java
// Author:      Kong Jimmy Vang
// Date:        10/8/2018
// 

import java.util.ArrayList;
import java.util.Vector;

/**
 * A K-D Tree.
 * @author Kong Jimmy Vang
 */
public class KDTree {
    
    // *** Fields/Instance Variables ***
    /** This is the root of this KDTree. */
    private KDTreeNode<ArrayList<Vector<Double>>> root;
    
    /** Contains information about this KDTree's leaf nodes in a List. */
    private ArrayList<String> leaves = new ArrayList<>();
    
    /** Contains information about this KDTree's leaf nodes in a String format. */
    private String toStringLeaves;
    
    // *** Constructors ***
    /**
     * Creates a new KDTree.
     * @param root - This KDTreeNode will be the root of this KDTree object.
     */
    protected KDTree(final KDTreeNode<ArrayList<Vector<Double>>> root) {
        this.root = root;
        preorderLeaves();
    }

    /**
     * Creates a new KDTree and store {@code data} into the root node.
     * @param data - A list of vectors that stores Double values.
     */
    public KDTree(final ArrayList<Vector<Double>> data) {
        this.root = new KDTreeNode<ArrayList<Vector<Double>>>(null, data);
        preorderLeaves();
    }
    
    /**
     * Creates a new KDTree and store {@code data} into the root node.
     * @param data - A list of vectors that stores Double values.
     * @param left - Left child of this root node.
     * @param right - Right child of this root node.
     */
    protected KDTree(final ArrayList<Vector<Double>> data,
                    final KDTreeNode<ArrayList<Vector<Double>>> left, 
                    final KDTreeNode<ArrayList<Vector<Double>>> right) {
        this.root = new KDTreeNode<ArrayList<Vector<Double>>>(null, data, left, right);
        preorderLeaves();
    }
    
    // *** Methods/Functions ***
    /** Returns the root of this tree. */
    protected KDTreeNode<ArrayList<Vector<Double>>> getRoot() {
        return root;
    }
    
    /** Sets the root of this tree to a new root. */
    protected void setRoot(KDTreeNode<ArrayList<Vector<Double>>> root) {
        this.root = root;
        preorderLeaves();
    }
    
    /**
     * Removes all commas from a string, except for the "]," string.
     * @param string - A string that will have most of its commas removed.
     * @return Return a new string with no commas, except for the "]," string.
     */
    private static String removeCommas(String string) {
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
    
    /** Create a list of strings, containing information about each leaf node. */
    private void preorderLeaves() {
        this.leaves.clear();
        preorderLeaves(this.root, "");
        
        this.toStringLeaves = "";
        for (int i = 0; i < this.leaves.size(); i++) {
            this.toStringLeaves += i + ". " + this.leaves.get(i) + "\n\n";
        }
    }
    
    /** [Helper Method for {@link #preorderLeaves()}] */
    private void preorderLeaves(KDTreeNode<ArrayList<Vector<Double>>> node, String position) {
        if (node.getLeft() != null) {
            preorderLeaves(node.getLeft(), position + "L");
        } 
        if (node.getRight() != null) {
            preorderLeaves(node.getRight(), position + "R");
        }
        
        if (node.getLeft() == null && node.getRight() == null) {
            // Store the string for printing use.
            if (!node.getData().isEmpty()) {
                leaves.add(position + ": Bounding Box: " + removeCommas(node.getBoundingBox().toString())
                        + "\nData in leaf: " + removeCommas(node.getData().toString()));
            }
        }
    }
    
    /**
     * Returns a string, containing this object's information about it's leaf nodes.
     */
    public String toString() {
        return this.toStringLeaves;
    }
}
