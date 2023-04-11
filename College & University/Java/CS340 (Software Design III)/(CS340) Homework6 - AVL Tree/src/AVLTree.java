// 
// AVLTree.java
// Created by: Kong Jimmy Vang
// Date Created: 3/26/2018
// 

import java.io.*;
//import java.util.*;

/**
 * Implements a AVL tree of ints stored in a random access file. Duplicates are
 * recorded by a count field associated with the int.
 */
public class AVLTree {
    
    static final int CREATE = 0;
    static final int REUSE = 1;
    
    private RandomAccessFile f;
    protected long root; // the address of the root node in the file
    protected long free; // the address in the file of the first node in the free list
    
    /** Helper Node class. Can only be used in this AVLTree. */
    private class Node {
        private int data;
        private int count;
        private int height;
        private long left;
        private long right;
        
        /**
         * Constructor for a new node.
         * @param left
         * @param data
         * @param right
         */
        private Node(long left, int data, long right) {
            this.data = data;
            this.count = 1;
            this.height = 0;
            this.left = left;
            this.right = right;
        }
        
        /**
         * Constructor for a node that exists at {@code addr} and is stored in the file.
         * @param addr
         * @throws IOException
         */
        private Node(long addr) throws IOException {
            f.seek(addr);
            this.data = f.readInt();
            this.count = f.readInt();
            this.height = f.readInt();
            this.left = f.readLong();
            this.right = f.readLong();
        }
        
        /**
         * Writes the node to the file at location {@code addr}.
         * @param addr
         * @throws IOException
         */
        private void writeNode(long addr) throws IOException {
            f.seek(addr);
            f.writeInt(this.data);
            f.writeInt(this.count);
            f.writeInt(this.height);
            f.writeLong(this.left);
            f.writeLong(this.right);
        }
    }
    
    //*** CONSTRUCTORS ***
    /**
     * Constructor for a new {@code AVLTree} object. <br><br>
     * 
     * If mode is {@code CREATE}, a new empty file is created. <br><br>
     * 
     * If mode is {@code CREATE}, and a file with file name {@code fname} 
     * exists the file with {@code fname} must be deleted before the new 
     * empty file is created. <br><br>
     * 
     * If mode is {@code REUSE}, an existing file is used if it exists 
     * otherwise a new empty file is created.
     * 
     * @param fileName - The file that this {@code AVLTree} will be stored in.
     * @param mode - <li>{@code CREATE} or 0. Creates a new file. If a file
     *                  {@code fname} already exists, replace it. <br>
     *               <li>{@code REUSE} or 1. Reuses the current file {@code fname}.
     * @throws IOException
     */
    public AVLTree(String fileName, int mode) throws IOException {
        
        File path = new File(fileName);
        
        // Case 1: mode == CREATE.
        if (mode == CREATE && path.exists())
            path.delete();
        
        f = new RandomAccessFile(path, "rw");
        if (mode == CREATE) {
            root = 0;
            free = 0;
            f.writeLong(root);
            f.writeLong(free);
        }
        
        // Case 2: mode == REUSE.
        else {
            f.seek(0);
            root = f.readLong();
            free = f.readLong();
        }
    }
    
    
    //*** METHODS/FUNCTIONS ***
    /**
     * Insert {@code d} into the tree {@code root}.
     * If {@code d} is in the tree, increment the count field associated 
     * with {@code d}.
     * 
     * @param d - Data value to insert into the tree, {@code root}.
     * @throws IOException
     */
    public void insert(int d) throws IOException {
        root = insert(root, d);
        checkIfBalanced(root, 0);
    }
    
    /**
     * Insert {@code d} into the subtree whose root is found at {@code r}.
     * If {@code d} is in the tree, increment the count field associated 
     * with {@code d}.
     * 
     * @param r - Root of a particular tree.
     * @param d - Data value to insert into the particular tree.
     * @return Return the address of the particular tree with {@code d} 
     *          inserted into the tree.
     * @throws IOException
     */
    private long insert(long r, int d) throws IOException {
        Node rNode;
        
        // Base Case: r == 0.
        if (r == 0) {
            rNode = new Node(0, d, 0);
            long addr = getFree();
            rNode.writeNode(addr);
            return addr;
        }
        
        rNode = new Node(r);
        if (d < rNode.data)         // Case 1: d < r.data.
            rNode.left = insert(rNode.left, d);
        else if (d > rNode.data)    // Case 2: d > r.data.
            rNode.right = insert(rNode.right, d);
        else                        // Case 3: d == r.data.
            rNode.count++;
        
        // Write to "r" and return "r".
        rNode.writeNode(r);
        return r;
    }
    
    /**
     * Returns a count value of the data value {@code d} 
     * starting from {@code root}. Return 0 if {@code d}
     * is not found.
     * 
     * @param d - Data value to find starting at {@code root}.
     * @return If {@code d} is in the tree return the value of count 
     *          associated with {@code d}, otherwise return 0.
     * @throws IOException
     */
    public int find(int d) throws IOException {
        return find(root, d);
    }
    
    /**
     * Returns a count value of the data value {@code d} 
     * in a particular tree {@code r}.
     * 
     * @param r - Root of a particular tree.
     * @param d - Data value to find in the particular tree.
     * @return Returns {@code d}'s count value.
     * @throws IOException
     * @see {@link AVLTree#find(int)}
     */
    private int find(long r, int d) throws IOException {
        // Base Case: r == 0.
        if (r == 0) return 0;
        
        Node rNode = new Node(r);
        
        if (d < rNode.data) {           // Case 1: d < r.data.
            return find(rNode.left, d);
        } else if (d > rNode.data) {    // Case 2: d > r.data.
            return find(rNode.right, d);
        } else {                        // Case 3: d == r.data.
            final int count = rNode.count;
            return count;
        }
    }
    
    /**
     * Remove one count/copy of {@code d} from the tree.
     * If the one count/copy is the last one, remove {@code d} 
     * from the tree.
     * If {@code d} is not in the tree, the method has no effect.
     * 
     * @param d - Data value to remove starting at {@code root}.
     * @throws IOException
     */
    public void removeOne(int d) throws IOException {
        root = remove(root, d, false);
        checkIfBalanced(root, 0);
    }
    
    /**
     * Remove all counts of {@code d} from the tree.
     * If {@code d} is not in the tree, the method has no effect.
     * 
     * @param d - Data value to remove starting at {@code root}.
     * @throws IOException
     */
    public void removeAll(int d) throws IOException {
        root = remove(root, d, true);
        checkIfBalanced(root, 0);
    }
    
    /**
     * Remove {@code d} from a tree's root node {@code r}. <br><br>
     * 
     * Can set {@code removeAll} to {@code true} to remove all counts of 
     * {@code d} or can set {@code removeAll} to {@code false} to remove 
     * one count of {@code d}.
     * 
     * @param r - Root of a particular tree.
     * @param d - Data value to remove from the particular tree.
     * @param removeAll - If true, remove {@code d} from the tree, else remove 
     *          one count from {@code d}.
     * @return Return the address of the particular tree with {@code d} removed
     *          or with {@code d}'s count subtracted.
     * @throws IOException
     * @see {@link AVLTree#removeOne(int)}
     * @see {@link AVLTree#removeAll(int)}
     */
    private long remove(long r, int d, boolean removeAll) throws IOException {
        // Base Case: r == 0.
        if (r == 0) return r;
        
        Node rNode = new Node(r);
        
        // Case 1: d < x.data.
        if (d < rNode.data)
            rNode.left = remove(rNode.left, d, removeAll);
        // Case 2: d > x.data.
        else if (d > rNode.data)
            rNode.right = remove(rNode.right, d, removeAll);
        // Case 3: d == x.data.
        else {
            // Check for multiple nodes.
            if (removeAll) rNode.count = 0;
            else if (rNode.count >= 1) rNode.count--;
            
            if (rNode.count == 0) {
                // Case 1: "r" is a Leaf.
                if (rNode.left == 0 && rNode.right == 0) {
                    //System.out.println("LEAF");
                    addFree(r);
                    return 0;
                }
                // Case 2: "r" has One Right Child.
                else if (rNode.left == 0) {
                    //System.out.println("ONE CHILD (RIGHT): " + x.data);
                    addFree(r);
                    return rNode.right;
                }
                // Case 3: "r" has One Left Child.
                else if (rNode.right == 0) {
                    //System.out.println("ONE CHILD (LEFT): " + x.data);
                    addFree(r);
                    return rNode.left;
                }
                // Case 4: "r" has Two Children.
                else {
                    //System.out.println("TWO CHILDREN: " + x.data);
                    //addFree(r);
                    
                    // Replace "r" with a max or min replacement value.
                    double random = Math.random();
                    
                    boolean findMax;
                    if (random >= 0.5) findMax = true;
                    else findMax = false;
                    
                    // Force the algorithm to find a max replacement value
                    // for the node "r".
                    findMax = true;
                    
                    //System.out.println("TWO CHILDREN: Choice = " + choice);
                    if (findMax == true) {
                        // Find a max value in the left subtree.
                        Node maxValueNode = new Node(findMaxValue(rNode.left, d));
                        
                        // Replace node "r" with the max value found.
                        rNode.data = maxValueNode.data;
                        rNode.count = maxValueNode.count;
                        
                        // Remove the max value found in the left subtree of "r".
                        rNode.left = remove(rNode.left, maxValueNode.data, true);
                    } 
                    else {
                        // Find a min value in the right subtree.
                        Node minValueNode = new Node(findMinNode(rNode.right, d));
                        
                        // Replace node "r" with the min value found.
                        rNode.data = minValueNode.data;
                        rNode.count = minValueNode.count;
                        
                        // Remove the min value found in the right subtree of "r".
                        rNode.right = remove(rNode.right, minValueNode.data, true);
                    }
                }
            }
        }
        
        // Write to "r" and return r.
        rNode.writeNode(r);
        return r;
    }
    
    /**
     * Helper method for {@code remove()}; <br><br>
     * 
     * Find the max value in the right children of {@code r} 
     * that is less than {@code r}'s data value, {@code d}, by
     * traversing all right children connected to {@code r}. <br><br>
     * 
     * Returns the node with a max value that is less than {@code d}.
     * 
     * @param r - Root of a particular tree.
     * @param d - Data value.
     * @return Returns the node with a max value that is less than {@code d}.
     * @throws IOException 
     * @see {@link AVLTree#remove(long, int, boolean)}
     * @see {@link AVLTree#remove(long, int, boolean)}
     */
    private long findMaxValue(long r, int d) throws IOException {
        // Base Case: r == 0.
        if (r == 0) return 0;
        
        Node rNode = new Node(r);
        
        // Case 1: Max value NOT found.
        if (d > rNode.data && rNode.right != 0) {
            return findMaxValue(rNode.right, d);
        }
        
        // Case 2: Max value found.
        return r;
    }
    
    /**
     * Helper method for {@code remove()}; <br><br>
     * 
     * Find the min value in the left children  of {@code r} 
     * that is less than {@code r}'s data value, {@code d}, by
     * traversing all left children connected to {@code r}. <br><br>
     * 
     * Returns the node with a min value that is less than {@code d}.
     * 
     * @param r - Root of a particular tree.
     * @param d - Data value.
     * @return Returns the node with a min value that is less than {@code d}.
     * @throws IOException 
     * @see {@link AVLTree#remove(long, int, boolean)}
     * @see {@link AVLTree#remove(long, int, boolean)}
     */
    private long findMinNode(long r, int d) throws IOException {
        // Base Case: r == 0.
        if (r == 0) return 0;
        
        Node rNode = new Node(r);
        
        // Case 1: Min value NOT found.
        if (d < rNode.data && rNode.left != 0) {
            return findMinNode(rNode.left, d);
        }
        
        // Case 2: Min value found.
        return r;
    }
    
    /**
     * Removes then returns a node from the free list.
     * 
     * @return Removes then returns a node from the free list.
     * @throws IOException
     */
    private long getFree() throws IOException {
        if (free == 0) return f.length();
        
        long tNode = free;
        f.seek(free);
        free = f.readLong();
        return tNode;
    }
    
    /**
     * Add the given {@code addr} to the free list.
     * @param addr - Add this node to the free list.
     * @throws IOException
     */
    private void addFree(long addr) throws IOException {
        //System.out.println("ADD FREE: " + addr);
        f.seek(addr);
        f.writeLong(free);
        free = addr;
    }
    
    /**
     * Close the random access file and update the values of 
     * root and free if necessary.
     * 
     * @throws IOException
     */
    public void close() throws IOException {
        f.seek(0);
        f.writeLong(root);
        f.writeLong(free);
        f.close();
    }
    
    /**
     * Check if the node at {@code addr} is balanced. 
     * This is a helper method to maintain balance in the AVL tree. <br><br>
     * 
     * <b>Balance Rule:</b> The node at {@code addr} must have 
     * a left subtree and a right subtree with a height difference of at most 2.
     * 
     * @param addr - Node to check for balance issues.
     * @param parent - Parent of {@code addr}. 0 if null (if addr has no parent).
     * @throws IOException
     * @see {@link AVLTree#singleRotation}
     * @see {@link AVLTree#doubleRotation}
     */
    private void checkIfBalanced(long addr, final long parent) throws IOException {
        
        // Base Case
        if (addr == 0) return;
        
        //*** Get data from addr.
        Node xNode = new Node(addr);
        
        checkIfBalanced(xNode.left, addr);
        checkIfBalanced(xNode.right, addr);
        
        //*** Setup Single Rotation Variables.
        long t1 = 0, t2 = 0, t3 = 0;
        
        int addrLeftHeight = height(xNode.left, true);
        int addrRightHeight = height(xNode.right, true);
        int heightDifference = addrLeftHeight - addrRightHeight;
        if (heightDifference >= 2) {
            //*** Case 1: The Left Child is greater than the Right Child by a difference of 2 or more.
            // Setup Patterns.
            Node yNode = new Node(xNode.left);      // y
            t1 = yNode.left;                        // t1
            t2 = yNode.right;                       // t2
            
            // Perform Double Rotation.
            if (height(t2, false) > height(t1, false)) {
                addr = doubleRotation(addr, parent, heightDifference);
            // Perform Single Rotation.
            } else {
                addr = singleRotation(addr, parent, heightDifference);
            }
            
        } else if (heightDifference <= -2) {
            //*** Case 2: The Right Child is greater than the Left Child by a difference of 2 or more.
            // Setup Patterns.
            Node yNode = new Node(xNode.right);     // y
            t2 = yNode.left;                        // t2
            t3 = yNode.right;                       // t3
            
            // Perform Double Rotation.
            if (height(t2, false) > height(t3, false)) {
                addr = doubleRotation(addr, parent, heightDifference);
            // Perform Single Rotation.
            } else {
                addr = singleRotation(addr, parent, heightDifference);
            }
        } 
    }
    
    /**
     * Perform a single rotation at the chosen pivot, {@code addr}, "x".<br><br>
     * 
     * (heightDifference = addrLeftHeight - addrRightHeight)    <br>
     * If heightDifference >= 2 ...                             <br>
     * pivot --> x                           y      <br>
     *          / \                         / \     <br>
     *         y  t3    Single Rotation    t1  x    <br>
     *        / \             -->             / \   <br>
     *       t1 t2                           t2 t3  <br>
     *                                              <br>
     * (heightDifference = addrLeftHeight - addrRightHeight)    <br>
     * If heightDifference <= -2 ...                            <br>
     * pivot --> x                           y      <br>
     *          / \                         / \     <br>
     *         t1  y    Single Rotation    x  t3    <br>
     *            / \         -->         / \       <br>
     *           t2 t3                   t1 t2      <br>
     * 
     * @param addr - Current node "x".
     * @param parent - Parent of the node at {@code addr}. 0 if null (if addr has no parent).
     * @param heightDifference - Height difference of the left and right subtrees.
     *          (heightDifference = addrLeftHeight - addrRightHeight)
     *          A positive number means to rotate from left to right. 
     *          A negative number means to rotate from right to left.
     * @return Returns the node "y" after the rotation.
     * 
     * @throws IOException
     */
    private long singleRotation(long addr, final long parent,
                                final int heightDifference) throws IOException {
        
        // Base Case
        if (addr == 0) return addr;
        
        //*** Get stats from addr.
        Node xNode = new Node(addr);
        long addrLeft = xNode.left;
        long addrRight = xNode.right;
        
        //*** Setup Single Rotation Variables.
        long x, y, t1, t2, t3;
        
        //int data = xNode.data;
        //System.out.println("SingleR: addr:" + addr + " parent:" + parent + " data-pivot:" + data);
        
        //*** Check if there is a balance problem in the AVL Tree.
        //int addrLeftHeight = height(addrLeft);
        //int addrRightHeight = height(addrRight);
        //int heightDifference = addrLeftHeight - addrRightHeight;
        //System.out.println("HDiff: " + heightDifference + " " + addr + " " + parent);
        if (heightDifference >= 2) {
            //*** Case 1: The Left Child is greater than the Right Child by a difference of 2 or more.
            // Setup Patterns.
            x = addr;               // x
            
            y = addrLeft;           // y
            Node yNode = new Node(y);
            
            t1 = yNode.left;        // t1
            t2 = yNode.right;       // t2
            
            t3 = xNode.right;       // t3
            
            //System.out.println("\t" + x + " " + y + " " + t1 + " " + t2 + " " + t3);
            // Perform Rotation.
            if (parent == 0) {
                f.seek(parent);
                f.writeLong(y);
                root = y;
                //System.out.println("\t" + "root: " + parent + " " + y);
            } else {
                f.seek(parent + 12);
                long pLeft = f.readLong();
                long pRight = f.readLong();
                
                if (pLeft == x) {
                    f.seek(parent + 12);
                    f.writeLong(y);
                } else if (pRight == x) {
                    f.seek(parent + 20);
                    f.writeLong(y);
                } else {
                    throw new IOException("Rotation Failed.");
                }
            }
            
            yNode.left = t1;
            yNode.right = x;
            yNode.writeNode(y);
            xNode.left = t2;
            xNode.right = t3;
            xNode.writeNode(x);
            
            addr = y;
            
        } else if (heightDifference <= -2) {
            //*** Case 2: The Right Child is greater than the Left Child by a difference of 2 or more.
            // Setup Patterns.
            x = addr;               // x
            
            y = addrRight;          // y
            Node yNode = new Node(y);
            
            t2 = yNode.left;        // t2
            t3 = yNode.right;       // t3
            
            t1 = xNode.left;        // t1
            
            // Perform Rotation.
            if (parent == 0) {
                f.seek(0);
                f.writeLong(y);
                root = y;
            } else {
                f.seek(parent + 12);
                long pLeft = f.readLong();
                long pRight = f.readLong();
                
                if (pLeft == x) {
                    f.seek(parent + 12);
                    f.writeLong(y);
                } else if (pRight == x) {
                    f.seek(parent + 20);
                    f.writeLong(y);
                } else {
                    throw new IOException("Rotation Failed.");
                }
            }
            
            yNode.left = x;
            yNode.right = t3;
            yNode.writeNode(y);
            xNode.left = t1;
            xNode.right = t2;
            xNode.writeNode(x);
            
            addr = y;
            
        }
        
        //singleRotation(addrLeft, addr);
        //singleRotation(addrRight, addr);
        return addr;
    }
    
    /**
     * Perform a double rotation at the chosen pivot, {@code addr}, "x".<br><br>
     * 
     * (heightDifference = addrLeftHeight - addrRightHeight)    <br>
     * If heightDifference >= 2 ...                             <br>
     * pivot --> x                           z      <br>
     *          / \                        /   \    <br>
     *         y  t4    Double Rotation   y     x   <br>
     *        / \             -->        / \   / \  <br>
     *       t1  z                      t1 t2 t3 t4 <br>
     *          / \                                 <br>
     *         t2 t3                                <br>
     *                                              <br>
     * (heightDifference = addrLeftHeight - addrRightHeight)    <br>
     * If heightDifference <= -2 ...                <br>
     * pivot --> x                           z      <br>
     *          / \                        /   \    <br>
     *         t1  y    Double Rotation   x     y   <br>
     *            / \         -->        / \   / \  <br>
     *           z  t4                  t1 t2 t3 t4 <br>
     *          / \                                 <br>
     *         t2 t3                                <br>
     * 
     * @param addr - Current node "x".
     * @param parent - Parent of the node at {@code addr}. 0 if null (if addr has no parent).
     * @param heightDifference - Height difference of the left and right subtrees.
     *          (heightDifference = addrLeftHeight - addrRightHeight) 
     *          A positive number means to rotate from left to right. 
     *          A negative number means to rotate from right to left.
     * @return Returns the node "z" after the rotation.
     * @throws IOException
     */
    private long doubleRotation(long addr, final long parent,
                                final int heightDifference) throws IOException {
        
        // Base Case
        if (addr == 0) return addr;
        
        //*** Get stats from addr.
        Node xNode = new Node(addr);
        long addrLeft = xNode.left;
        long addrRight = xNode.right;
        
        //*** Setup Single Rotation Variables.
        long x, y, z, t1, t2, t3, t4;
        
        //int data = xNode.data;
        //System.out.println("DoubleR: addr:" + addr + " parent:" + parent + " data-pivot:" + data);
        
        //*** Check if there is a balance problem in the AVL Tree.
        //int addrLeftHeight = height(addrLeft);
        //int addrRightHeight = height(addrRight);
        //int heightDifference = addrLeftHeight - addrRightHeight;
        if (heightDifference >= 2) {
            //*** Case 1: The Left Child is greater than the Right Child by a difference of 2 or more.
            // Setup Patterns.
            x = addr;               // x
            
            y = addrLeft;           // y
            Node yNode = new Node(y);
            
            t1 = yNode.left;        // t1
            z = yNode.right;        // z
            Node zNode = new Node(z);
            
            t2 = zNode.left;        // t2
            t3 = zNode.right;       // t3
            
            t4 = xNode.right;       // t4
            
            // Perform Rotation.
            if (parent == 0) {
                f.seek(parent);
                f.writeLong(z);
                root = z;
            } else {
                f.seek(parent + 12);
                long pLeft = f.readLong();
                long pRight = f.readLong();
                
                if (pLeft == x) {
                    f.seek(parent + 12);
                    f.writeLong(z);
                } else if (pRight == x) {
                    f.seek(parent + 20);
                    f.writeLong(z);
                } else {
                    throw new IOException("Rotation Failed.");
                }
            }
            
            zNode.left = y;
            zNode.right = x;
            zNode.writeNode(z);
            yNode.left = t1;
            yNode.right = t2;
            yNode.writeNode(y);
            xNode.left = t3;
            xNode.right = t4;
            xNode.writeNode(x);
            
            addr = z;
            
        } else if (heightDifference <= -2) {
            //*** Case 2: The Right Child is greater than the Left Child by a difference of 2 or more.
            // Setup Patterns.
            x = addr;               // x
            
            y = addrRight;          // y
            Node yNode = new Node(y);
            
            z = yNode.left;         // z
            t4 = yNode.right;       // t4
            Node zNode = new Node(z);
            
            t2 = zNode.left;        // t2
            t3 = zNode.right;       // t3
            
            t1 = xNode.left;        // t1
            
            // Perform Rotation.
            if (parent == 0) {
                f.seek(parent);
                f.writeLong(z);
                root = z;
            } else {
                f.seek(parent + 12);
                long pLeft = f.readLong();
                long pRight = f.readLong();
                
                if (pLeft == x) {
                    f.seek(parent + 12);
                    f.writeLong(z);
                } else if (pRight == x) {
                    f.seek(parent + 20);
                    f.writeLong(z);
                } else {
                    throw new IOException("Rotation Failed.");
                }
            }
            
            zNode.left = x;
            zNode.right = y;
            zNode.writeNode(z);
            yNode.left = t3;
            yNode.right = t4;
            yNode.writeNode(y);
            xNode.left = t1;
            xNode.right = t2;
            xNode.writeNode(x);
            
            addr = z;
            
        }
        
        //doubleRotation(addrLeft, addr);
        //doubleRotation(addrRight, addr);
        return addr;
    }
    
    /**
     * Return the height of the {@code root} of the AVL tree. 
     * Write all heights in the tree into file if necessary.
     * 
     * @param write - If true, write the height. Else, do not write.
     * @return Return the height of the {@code root} of the AVL tree.
     * @throws IOException
     * @see {@link AVLTree#height(long, boolean)}
     */
    protected int height(final boolean write) throws IOException {
        int height = height(root, write);
        if (root != 0 && write) {
            f.seek(root + 8);
            f.writeInt(height);
        }
        return height;
    }
    
    /**
     * Returns the height at the node of {@code r}.
     * Write all heights in the tree into file if necessary.<br><br>
     * 
     * Helper method for {@link AVLTree#height(boolean)}.
     * 
     * @param r - A particular node.
     * @param write - If true, write the height. Else, do not write.
     * @return Returns the height at the node of {@code r}.
     * @throws IOException
     * @see {@link AVLTree#height(boolean)}
     */
    private int height(final long r, final boolean write) throws IOException {
        
        if (r == 0) return -1;
        
        Node x = new Node(r);
        
        //System.out.println(x.height);
        if (x.left == 0 && x.right == 0) {
            if (write) {
                x.height = 0;
                x.writeNode(r);
            }
            //System.out.println(" HeightAddr: " + r + " H: 0");
            return 0;
        }
        
        int heightLeft = height(x.left, write) + 1;
        int heightRight = height(x.right, write) + 1;
        
        //System.out.println(" HeightAddr: " + r + " L: " + heightLeft + " R: " + heightRight);
        
        if (heightLeft > heightRight) {
            if (write) {
                x.height = heightLeft;
                x.writeNode(r);
            }
            return heightLeft;
        } else {
            if (write) {
                x.height = heightRight;
                x.writeNode(r);
            }
            return heightRight;
        }
    }
    
    ///////////////////////////////////////////////////////////////////////
    // *** Debugger Methods ***
//    /**
//     * Return a string of the integers using in-order transversal.
//     * 
//     * @return Return a string of the integers in the tree using in-order.
//     * @throws IOException 
//     */
//    private String inorder() throws IOException {
//        String s = inorder(root);
//        
//        // Trim the ", " String at the end of the string 's'.
//        if (s.length() > 2) 
//            s = s.substring(0, s.length() - 2);
//        
//        // Return the string 's'.
//        return s;
//    }
//    
//    /**
//     * Helper method for {@code inorder()}.
//     * 
//     * @param r - Subtree root.
//     * @return Return a string of the integers in the subtree {@code r} 
//     *          using in-order.
//     * @throws IOException
//     */
//    private String inorder(final long r) throws IOException {
//        if (r == 0) return "";
//        
//        Node x = new Node(r);
//        
//        String s = "";
//        if (x.right != 0) s += inorder(x.left);
//        s += String.valueOf(x.data) + " H(" + x.height + "), ";
//        if (x.right != 0) s += inorder(x.right);
//        
//        return s;
//    }
    
    /**
     * Prints a list of nodes in the AVL tree.<br><br>
     * 
     * Debugger Method.
     * 
     * @throws IOException
     */
    public void print() throws IOException {
        print(root);
        System.out.println();
    }
    
    /**
     * Helper Method for {@link AVLTree#print()}.<br><br>
     * 
     * @see {@link AVLTree#print()}
     * @param r
     * @throws IOException
     */
    private void print(final long r) throws IOException {
        if (r == 0)
            return;
        Node x = new Node(r);
        print(x.left);
        System.out.print(" (" + x.data + "," + x.count + ") ");
        print(x.right);
    }
}
