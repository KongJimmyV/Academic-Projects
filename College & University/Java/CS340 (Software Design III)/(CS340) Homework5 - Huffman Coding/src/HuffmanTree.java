// 
// HuffmanTree.java
// Created by: Kong Jimmy Vang
// Date Created: 3/6/2018
// 

import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Stack;

/**
 * {@code HuffmanTree} is used for encoding/decoding purposes in order to compress a 
 * file using the Huffman Encoding/Decoding Algorithms.
 * 
 * @author Kong Jimmy Vang
 */
public class HuffmanTree {
    
    //*** Other Classes ***
    private class Node {
        
        //* Fields *
        private Node left;
        private char data;
        private Node right;
        private Node parent;
        
        //* Constructor(s) *
        private Node(Node L, char d, Node R, Node P) {
            this.left = L;
            this.data = d;
            this.right = R;
            this.parent = P;
        }
    }
    
    //*** Fields ***
    private Node root;
    private Node current;   // this value is changed by the move methods
    
    //*** Constructor(s) ***
    public HuffmanTree() {
        this.root = null;
        this.current = null;
    }

    /**
     * Makes a single node tree.
     * @param d - Character data.
     */
    public HuffmanTree(char d) {
        this.root = new Node(null, d, null, null);
        this.current = this.root;
    }

    /**
     * Creates a new tree from the given post order string {@code t}. <br>
     * Example of "t": A B 128 C D 128 E 128 128
     * 
     * @param t - Post order representation of a particular {@code HuffmanTree}.
     * @param nonLeaf - Nonleaf character.
     */
    public HuffmanTree(String t, char nonLeaf) {
        
        // Post order stack building.
        Stack<Node> stack = new Stack<>();
        for (int i = 0; i < t.length(); i += 1) {
            char currentCharInT = 0;
            currentCharInT = t.charAt(i);
            
            if (currentCharInT != nonLeaf) {
                // The current character in t is != to a nonLeaf character.
                Node newNode = new Node(null, currentCharInT, null, null);
                stack.push(newNode);
            } else {
                // The current character in t is == to a nonLeaf character.
                Node right = null;
                Node left = null;
                if (!stack.isEmpty()) right = stack.pop();
                if (!stack.isEmpty()) left = stack.pop();
                
                Node newNode = new Node(left, nonLeaf, right, null);
                left.parent = newNode;
                right.parent = newNode;
                this.root = newNode;
                stack.push(newNode);
            }
        }
        
        this.current = this.root;
    }

    /**
     * Makes a new tree where {@code b1} is the left subtree and {@code b2} is the 
     * right subtree {@code d} is the data in the root.
     * 
     * @param b1 - Left subtree.
     * @param b2 - Right subtree.
     * @param d - Character data in the root node.
     */
    public HuffmanTree(HuffmanTree b1, HuffmanTree b2, char d) {
        if (b1 != null && b2 != null) {
            this.root = new Node(b1.root, d, b2.root, null);
            b1.root.parent = this.root;
            b2.root.parent = this.root;
        }
        else if (b1 != null && b2 == null) {
            this.root = new Node(b1.root, d, null, null);
            b1.root.parent = this.root;
        }
        else if (b1 == null && b2 != null) {
            this.root = new Node(null, d, b2.root, null);
            b2.root.parent = this.root;
        }
        else {
            this.root = new Node(null, d, null, null);
        }
        
        this.current = this.root;
    }
    
    
    //*** Methods/Functions ***
    
    // Use the move methods to traverse the tree.
    // The move methods change the value of current.
    
    /** Changes the value of {@code current} to equal the value of root. */
    public void moveToRoot() {
        this.current = this.root;
    }
    
    /** Changes the value of {@code current} to equal the value of its left child. */
    public void moveToLeft() {
        this.current = this.current.left;
    }
    
    /** Changes the value of {@code current} to equal the value of its right child. */
    public void moveToRight() {
        this.current = this.current.right;
    }
    
    /** Changes the value of {@code current} to equal the value of its parent node. */
    public void moveToParent() {
        this.current = this.current.parent;
    }
    
    /** Returns true if current references a leaf node otherwise returns false. */
    public boolean atLeaf() {
        return this.current.left == null && this.current.right == null;
    }
    
    /** Returns the data value in the node referenced by current. */
    public char current() {
        return this.current.data;
    }
    
    /**
     *  The PathIterator returns the path (a series of 0s and 1s) to each leaf 
     *  each time {@code next()} is called.
     *  @author Kong Jimmy Vang
     */
    public class PathIterator implements Iterator<String> {
        
        //* Fields *
        /** This stack keeps track of which child nodes were visited. 
         * 0 means left, 1 means right. */
        private Stack<String> stackEncodings;
        
        private boolean wasLeft = false;   // FLAG: Check whether the parent node visited a left node
        private boolean wasRight = false;  // FLAG: Check whether the parent node visited a right node.
        private boolean done = false;      // FLAG: Check whether there are more elements to look at.
        
        //* Constructor(s) *
        public PathIterator() {
            current = root;
            this.stackEncodings = new Stack<>();
        }
        
        //* Methods/Functions *
        public boolean hasNext() {
            return !done;
        }

        public String next() {
            
            // Throw an exception if there are no more elements to look at.
            if (done) {
                throw new NoSuchElementException("No more elements to look at.");
            }
            
            //*** Perform a post-order transversal of this tree iteratively. ***
            
            // Visit the left nodes of "current" until a leaf is reached.
            while (stackEncodings.isEmpty() || !atLeaf()) {
                moveToLeft();
                stackEncodings.push("0");
            }
            
            // "s" is the string that will hold one character and the encoding in a String.
            String s = "";
            
            // CASE 1: This node is the left node of its parent and is a leaf node.
            if (stackEncodings.peek().equals("0") && atLeaf()) {
                s = String.valueOf(current()) + "";
                for (int i = 0; i < stackEncodings.size(); i++) {
                    s += stackEncodings.get(i);
                }
                
                moveToParent();
                String direction = stackEncodings.pop();
                if (direction.equals("0")) {
                    wasLeft = true; wasRight = false;}
                else if (direction.equals("1")) {
                    wasLeft = false; wasRight = true;}
                
                moveToRight();
                stackEncodings.push("1");
                
            }
            
            // CASE 2: This node is the right node of its parent and is a leaf node.
            else if (stackEncodings.peek().equals("1") && atLeaf()) {
                s = String.valueOf(current()) + "";
                for (int i = 0; i < stackEncodings.size(); i++) {
                    s += stackEncodings.get(i);
                }
                
                moveToParent();
                String direction = stackEncodings.pop();
                if (direction.equals("0")) {
                    wasLeft = true; wasRight = false;}
                else if (direction.equals("1")) {
                    wasLeft = false; wasRight = true;}
                
                while (wasRight == true && current != null) {
                    moveToParent();
                    if (!stackEncodings.isEmpty()) {
                        direction = stackEncodings.pop();
                        //System.out.print(" Temp: " + temp);
                        
                        if (direction.equals("0")) {
                            wasLeft = true; wasRight = false;}
                        else if (direction.equals("1")) {
                            wasLeft = false; wasRight = true;}
                    }
                }
                
                // Move to the right once.
                if (wasLeft == true) {
                    moveToRight();
                    stackEncodings.push("1");
                }
                
                // If the current node is null, then there is no more elements to look at.
                if (current == null) {
                    done = true;
                }
                
            } 
            
            // CASE 3: This node is the left node of its parent and is NOT a leaf node.
            else if (stackEncodings.peek().equals("0") && !atLeaf()) {
                System.out.println("ERROR: This error message must not appear. "
                        + "The code for the PathIterator might be incorrectly implemented.");
                System.exit(-1);
            } 
            
            // CASE 4: This node is the right node of its parent and is NOT a leaf node.
            else if (stackEncodings.peek().equals("1") && !atLeaf()) {
                System.out.println("ERROR: This error message must not appear. "
                        + "The code for the PathIterator might be incorrectly implemented.");
                System.exit(-1);
            }
            
            //System.out.println("Iter String: " + s + " " + current);
            
            // Reset the boolean flags and return the String "s".
            wasLeft = false; wasRight = false;
            return s;
        }
        
        public void remove() {
            // Optional: method not implemented.
            throw new UnsupportedOperationException("This method is not supported.");
        }
    }
    
    /**
     * Return a {@code PathIterator} object.
     * @return Return a {@code PathIterator} object.
     */
    public Iterator<String> iterator() {
        return new PathIterator();
    }
    
    /**
     * Return a post order string representation of this tree. <br>
     * Example: AB?CD?E?? (will have no spaces in between)
     */
    public String toString() {
        return postorder();
    }
    
    /**
     * Helper method for {@code toString()}. <br><br>
     * Return the postorder transversal string of this Huffman Tree.
     * 
     * @return Return a postorder transversal string of this 
     *          Huffman Tree.
     */
    private String postorder() {
        return postorder(this.root);
    }
    
    /**
     * @param r - Node.
     * @see {@link #postorder()}
     */
    private String postorder(final Node r) {
        String s = "";
        if (r == null) return s;
        if (r.left != null) s += postorder(r.left) + "";
        if (r.right != null) s += postorder(r.right) + "";
        return s + String.valueOf(r.data);
    }
    
}