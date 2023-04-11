//
// IntTree.java
// Created by: Kong Jimmy Vang
// Date Created: 2/26/2018
// 

//import java.io.*;
import java.util.*;

/**
 * {@code IntTree} is a tree which stores integer values
 * in each node. Each tree can have many children,
 * represented by {@code firstChild} and {@code sibling}
 * nodes.
 * 
 * @author Kong Jimmy Vang
 */
public class IntTree {
    
    // Other classes.
    private class Node {
        private int data;
        private Node firstChild;
        private Node sibling;
        private Node parent;
        
        private Node(int data, 
                     Node firstChild, 
                     Node sibling, 
                     Node parent) {
            this.data = data;
            this.firstChild = firstChild;
            this.sibling = sibling;
            this.parent = parent;
        }
    }
    
    // Fields
    private Node root;
    
    // Constructors
    /**
     * Create a new tree with one single node {@code d}.
     * 
     * @param d - A single data value.
     */
    public IntTree(int d) {
        this.root = new Node(d, null, null, null);
    }
    
    /**
     * Create a new tree whose child is the IntTree 
     * {@code c} and whose root value is {@code d}.
     * 
     * @param d - A single data value.
     * @param c - A single {@code IntTree} object.
     */
    public IntTree(int d, IntTree c) {
        this.root = new Node(d, c.root, null, null);
        c.root.parent = this.root;
    }
    
    /**
     * Create a new tree whose children are the trees 
     * in {@code t} and whose root value is {@code d}.
     * 
     * @param d - A single data value.
     * @param t - An array of {@code IntTree} objects.
     */
    public IntTree(int d, IntTree t[]) {
        this.root = new Node(d, t[0].root, null, null);
        
        for (int i = 0; i < t.length; i++) {
            if (t[i] == null) {
                continue;
            }
            
            t[i].root.parent = this.root;
            //t[i].root.firstChild = null;
            
            if (i < t.length - 1 && t[i+1] != null) {
                t[i].root.sibling = t[i+1].root;
            } else {
                t[i].root.sibling = null;
            }
        }
    }
    
    /**
     * Create a tree with {@code d[0]} as the root value and 
     * the other values as children of the root.
     * 
     * @param d - An array of data values.
     */
    public IntTree(int d[]) {
        // 
        // 
        this.root = new Node(d[0], null, null, null);
        
        Node prevChild = null;
        int startingIndex = 1;
        for (int i = startingIndex; i < d.length; i++) {
            Node child = new Node(d[i], null, null, this.root);
            
            if (i == startingIndex) {
                this.root.firstChild = child;
            } else if (i > startingIndex) {
                prevChild.sibling = child;
            }
            
            prevChild = child;
        }
    }
    
    // Methods and Functions
    /**
     * Return a string of the integers in 
     * the tree in preorder.
     * 
     * @return Return a string of the integers in 
     *      the tree in preorder.
     */
    public String preorder() {
        // the implementation must be recursive
        return preorder(this.root);
    }
    
    /**
     * @param r - Node.
     * @see {@link #preorder()}
     */
    private String preorder(Node r) {
        // Visit a Node and then visit the Children.
        String s = String.valueOf(r.data);
        
        if (r.firstChild != null) {
            s += ", " + preorder(r.firstChild);
        }
        if (r.sibling != null) {
            s += ", " + preorder(r.sibling);
        }
        
        return s;
    }
    
    /**
     * Return a string of the integers in the tree in postorder.
     * 
     * @return Return a string of the integers in the 
     *      tree in postorder.
     */
    public String postorder() {
        // the implementation must be recursive
        return postorder(this.root);
    }
    
    /**
     * @param r - Node.
     * @see {@link #postorder()}
     */
    private String postorder(Node r) {
        // Visit the firstChild and siblings, 
        // then visit the current node.
        String s = "";
        
        if (r == null) return s;
        
        if (r.firstChild != null) {
            s += postorder(r.firstChild) + ", ";
        }
        
        s += String.valueOf(r.data);
        
        if (r.sibling != null) {
            s += ", " + postorder(r.sibling);
        }
        
        return s;
    }
    
    /**
     * Return a string of the integers using level-order transversal.
     * 
     * @return Return a string of the integers in the tree in level 
     * order (also know a breadth first order).
     */
    public String levelorder() {
        // the implementation must be iterative
        String s = "";
        
        ArrayList<Node> queue = new ArrayList<>();
        queue.add(this.root);
        
        while(!queue.isEmpty()) {
            Node pos = queue.remove(0);
            s += pos.data + ", ";
            
            Node sibling = pos.firstChild;
            while (sibling != null) {
                if (sibling != null) {
                    queue.add(sibling);
                }
                
                sibling = sibling.sibling;
            }
        }
        
        // Trim the ", " String at the end of the string 's'.
        if (s.length() > 2) 
            s = s.substring(0, s.length() - 2);
        
        // Return the string 's'.
        return s;
    }
    
    /**
     * Find the height of the Tree.
     * @return Returns the height of the Tree.
     */
    public int height() {
        return height(this.root);
    }
    
    private int height(Node r) {
        
        if (r == null) return 0;
        
        int height1 = height(r.firstChild) + 1;
        int height2 = height(r.sibling);
        
        if (height1 > height2) {
            return height1;
        } else {
            return height2;
        }
        
    }
    
    /**
     * Return a path represented by a string of integers 
     * starting from the first occurrence of {@code d} in the 
     * tree to the root of the tree. <br><br>
     * 
     * The "first occurrence" means the first occurrence found in 
     * a preorder traversal.
     * 
     * @param d - The integer data value to create a path from.
     * @return Return a path represented by a string of integers 
     *      starting from the first occurrence of {@code d} in the 
     *      tree to the root of the tree.
     */
    public String path(int d) {
        // the implementation must be iterative
        if (this.root == null) {
            return "";
        }
        
        String s = "";
        
        Stack<Node> stack = new Stack<>();
        stack.push(this.root);
        
        while(!stack.isEmpty()) {            
            Node pos = stack.pop();
            
            // Return a path here when 'd' is found in the Tree.
            if (pos.data == d) {
                while (pos != null) {
                    s += pos.data + ", ";
                    pos = pos.parent;
                }
                
                break;
            }
            
            // Perform pre-order transversal of the Tree.
            if (pos.firstChild != null) {
                stack.push(pos.firstChild);
                
            } else {
                if (pos.sibling != null) {
                    stack.push(pos.sibling);
                } else {
                    while(pos != null && pos.sibling == null) {
                        if (pos.parent != null && pos.parent.sibling != null) {
                            stack.push(pos.parent.sibling);
                        }
                        pos = pos.parent;
                    }
                }
            }
            
        }
        
        // Trim the ", " String at the end of the string 's'.
        if (s.length() > 2) 
            s = s.substring(0, s.length() - 2);
        
        // Return the string 's'.
        return s;
    }
    
    /**
     * Return the number of times {@code d} appears in the tree.
     * @param d - The integer data value to count.
     * @return Return the number of times {@code d} appears in the tree.
     */
    public int count(int d) {
        // the implementation must be recursive
        return count(this.root, d);
    }
    
    private int count(Node r, int d) {
        int v = 0;
        if (r.data == d) {
            v += 1;
        }
        if (r.firstChild != null) {
            v += count(r.firstChild, d);
        }
        if (r.sibling != null) {
            v += count(r.sibling, d);
        }
        
        return v;
    }
    
    /**
     * Return the sum of the integers in the tree.
     * @return Return the sum of the integers in the tree.
     */
    public int sum() {
        // the implementation must be iterative
        int v = 0;
        
        ArrayList<Node> queue = new ArrayList<>();
        queue.add(this.root);
        
        while(!queue.isEmpty()) {
            Node pos = queue.remove(0);
            v += pos.data;
            
            Node sibling = pos.firstChild;
            while (sibling != null) {
                if (sibling != null) {
                    queue.add(sibling);
                }
                
                sibling = sibling.sibling;
            }
        }
        
        // Return v.
        return v;
    }
    
    
    /////////////////////////////////////////////////////////
    
    /**
     * Main program. Customized Tester for this class {@code IntTree}.
     * @param args
     */
    public static void main(String[] args) {
        System.out.println("*** Custom Tester ***");
        
        //*** Make 3 IntTrees and test their methods on themselves.
        System.out.println("Setup IntTrees For Tester...");
        
        // Setup data.
        int[] datum = new int[10];
        for (int i = 0; i < datum.length; i++) {
            datum[i] = i + 1;
        }
        
        int[] datum2 = new int[3];
        datum2[0] = 2;
        datum2[1] = 5;
        datum2[2] = 6;
        int[] datum3 = new int[5];
        datum3[0] = 4;
        datum3[1] = 8;
        datum3[2] = 9;
        datum3[3] = 10;
        datum3[4] = 11;
        int[] datum4 = new int[3];
        datum4[0] = 7;
        datum4[1] = 12;
        datum4[2] = 13;
        
        // Setup Tree #3's structure to 
        // match the "h4.pdf" example tree diagram.
        IntTree[] tempTrees = new IntTree[3];
        tempTrees[0] = new IntTree(datum2);
        tempTrees[1] = new IntTree(3);
        tempTrees[2] = new IntTree(datum3);
        
        IntTree[] tempTrees2 = new IntTree[1];
        tempTrees2[0] = new IntTree(datum4);
        tempTrees[1] = new IntTree(3, tempTrees2);
        
        // Setup Trees #1-3.
        IntTree[] intTrees = new IntTree[3];
        intTrees[0] = new IntTree(datum[0]);
        intTrees[1] = new IntTree(datum);
        intTrees[2] = new IntTree(1, tempTrees);
        
        System.out.println("\tSetup Finished.");
        
        System.out.println("Pre-order Test...");
        for (int i = 0; i < intTrees.length; i++) {
            System.out.println("\tTesting IntTree #" + i);
            System.out.println("\t\t" + intTrees[i].preorder());
        }
        
        System.out.println("Post-order Test...");
        for (int i = 0; i < intTrees.length; i++) {
            System.out.println("\tTesting IntTree #" + i);
            System.out.println("\t\t" + intTrees[i].postorder());
        }
        
        System.out.println("Level-order Test...");
        for (int i = 0; i < intTrees.length; i++) {
            System.out.println("\tTesting IntTree #" + i);
            System.out.println("\t\t" + intTrees[i].levelorder());
        }
        
        System.out.println("Path Test...");
        for (int i = 0; i < intTrees.length; i++) {
            System.out.println("\tTesting IntTree #" + i);
            System.out.println("\t\tpath(1): \t" + intTrees[i].path(1));
            System.out.println("\t\tpath(8): \t" + intTrees[i].path(8));
            System.out.println("\t\tpath(10): \t" + intTrees[i].path(10));
            System.out.println("\t\tpath(13): \t" + intTrees[i].path(13));
        }
        
        System.out.println("Count Test...");
        for (int i = 0; i < intTrees.length; i++) {
            System.out.println("\tTesting IntTree #" + i);
            System.out.println("\t\tcount(8): \t" + intTrees[i].count(8));
        }
        
        System.out.println("Sum Test...");
        for (int i = 0; i < intTrees.length; i++) {
            System.out.println("\tTesting IntTree #" + i);
            System.out.println("\t\t" + intTrees[i].sum());
        }
        
        System.out.println("*** End ***");
    }
}
