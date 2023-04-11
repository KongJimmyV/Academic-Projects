
// 
// BTree.java
// Created by: Kong Jimmy Vang
// Date Created: 4/5/2018
// 

import java.io.*;
import java.util.*;

/**
 * B+Tree data structure.
 * @author Kong Jimmy Vang
 */
public class BTree {
    
    //*** Instance/Field Variables ***
    private RandomAccessFile f; // Allows access to internal drive storage.
    private int order;          // Order size of the B+Tree.
    private int blockSize;      // Block size of the B+Tree (Used for structuring each node properly when using RandomAccessFile).
    private long root;          // Root node address of the B+Tree.
    private long free;          // Free node address the B+Tree's Linked List of nodes with free space.
    
    /**
     * B+Tree Node for the B+Tree class.
     * @author Kong Jimmy Vang
     */
    private class BTreeNode {
        private int count;          // Amount of keys in this Node.
        private int[] keys;         // This node's keys.
        private long[] children;    // This node's children.
        private long address;       // The address of the node in the file.
        
        
        //*** Constructors ***
        
        /**
         * Create a new BTreeNode with their default values.
         */
        private BTreeNode() {
            this.count = 0;
            this.keys = new int[order - 1];
            this.children = new long[order];
            this.address = 0;
        }
        
        /**
         * Create a new BTreeNode using the RandomAccessFile {@code f} 
         * and read the {@code address} value in the file.
         * @param address - The address value in the file to read from.
         * @throws IOException
         */
        private BTreeNode(long address) throws IOException {
            f.seek(address);
            
            // Read 'count' from "f" and add it to the node.
            this.count = f.readInt();
            
            if (Math.abs(this.count) > order - 1) {
                /*throw new IOException("WARNING: This address has an invalid "
                        + "count value. The maximum key size is "
                        + (order - 1) + " for the B+Tree class. "
                        + "The invalid count value is " 
                        + this.count + ".");*/
                System.out.println("WARNING: This address has an invalid "
                        + "count value. The maximum key size is "
                        + (order - 1) + " for the B+Tree class. "
                        + "The invalid count value is " 
                        + this.count + ".");
            }
            
            // Read 'keys' from "f" and add it to the node.
            this.keys = new int[order - 1];
            for (int i = 0; i < order - 1; i++) {
                this.keys[i] = f.readInt();
            }
            
            // Read 'children' from "f" and add it to the node.
            this.children = new long[order];
            for (int i = 0; i < order; i++) {
                this.children[i] = f.readLong();
            }
            
            // Take 'address' and add it to the node.
            this.address = address;
        }
        
        /**
         * Create a new BTreeNode and put all parameters into the node.
         * @param count - Count for node.
         * @param key - Key value keys[0].
         * @param firstChild - Address Value for children[0].
         * @param address - Address for node.
         */
        private BTreeNode(int count, 
                int key, 
                long firstChild, 
                long address) {
           this(count, key, firstChild, 0, address);
        }
        
        /**
         * Create a new BTreeNode and put all parameters into the node.
         * @param count - Count for node.
         * @param key - Key value keys[0].
         * @param firstChild - Address Value for children[0].
         * @param secondChild - Address Value for children[1].
         * @param address - Address for node.
         */
        private BTreeNode(int count, 
                int key, 
                long firstChild, long secondChild, 
                long address) {
           this.count = count;
           
           this.keys = new int[order - 1];
           this.keys[0] = key;
           
           this.children = new long[order];
           this.children[0] = firstChild;
           this.children[1] = secondChild;
           
           this.address = address;
        }
        
        /**
         * Create a new BTreeNode and put all parameters into the node.
         * @param count - Count for node.
         * @param keys - Keys array for node.
         * @param children - Children array for node.
         * @param address - Address for node.
         */
        private BTreeNode(int count, 
                         int[] keys, 
                         long[] children, 
                         long address) {
            this.count = count;
            this.keys = keys;
            this.children = children;
            this.address = address;
        }
        
        //*** Methods/Functions ***
        
        /**
         * Writes the BTreeNode to the file at location {@code addr}.
         * @param addr - Address to write this node into.
         * @throws IOException
         */
        private void writeNode(long addr) throws IOException {
            f.seek(addr);
            f.writeInt(this.count);
            for (int i = 0; i < this.keys.length; i++)
                f.writeInt(this.keys[i]);
            for (int i = 0; i < this.children.length; i++)
                f.writeLong(this.children[i]);
        }
        
        /**
         * Get and return a string that contains info about this BTreeNode.
         * @return Return a string that contains info about this BTreeNode.
         * @throws IOException
         */
        private String getNode() throws IOException {
            
            String s = "";
            
            f.seek(address);
            s += address + " ";
            
            // If this row is in the free list, print the address stored here.
            int count = f.readInt();
            if (count == 0) {
                f.seek(address);
                s += f.readLong() + "\n";
                return s;
            }
            
            // Else print the other values.
            s += count + " [ ";
            //for (int i = 0; i < this.keys.length; i++)
            //    s += f.readInt() + " ";
            for (int i = 0; i < Math.abs(this.count); i++)
                s += f.readInt() + " ";
            for (int i = 0; i < this.keys.length - Math.abs(this.count); i++)
                f.readInt();
            s += "] [ ";
            //for (int i = 0; i < this.children.length; i++)
            //    s += f.readLong() + " ";
            for (int i = 0; i < Math.abs(this.count) + 1; i++)
                s += f.readLong() + " ";
            for (int i = 0; i < this.children.length - (Math.abs(this.count) + 1); i++)
                f.readLong();
            s += "]\n";
            
            return s;
        }
        
        /**
         * Get and return a string that contains info about this BTreeNode.
         */
        public String toString() {
            try {
                return getNode();
            } catch (IOException e) {
                e.printStackTrace();
                return "[This BTreeNode Cannot Be Displayed Due To An Exception]\n "
                        + "- Displaying Object Address: "
                        + "" + getClass().getName() + '@' + Integer.toHexString(hashCode());
            }
        }
        
    }

    /**
     * Create a new B+Tree with a file name of {@code fileName}. <br><br>
     * 
     * The {@code bSize} is the block size. This value is used to calculate the 
     * order M value of this B+Tree. <br><br>
     * 
     * All B+Tree nodes will use {@code bSize} bytes.
     * 
     * @param fileName - The name and location of the B+Tree file.
     * @param bSize - Block size of this B+Tree, used to calculate it's order M. (Order M = bSize/12)
     * @throws IOException
     */
    public BTree(String fileName, int bSize) throws IOException {
        File path = new File(fileName);
        
        if (path.exists())
            path.delete();
        
        f = new RandomAccessFile(fileName, "rw");
        f.seek(0);
        
        this.root = 0;
        this.free = 0;
        this.blockSize = bSize;
        this.order = this.blockSize/12;
        
        f.writeLong(this.root);
        f.writeLong(this.free);
        f.writeInt(this.blockSize);
    }
    
    /**
     * Opens an existing B+Tree file with a file location at {@code fileName}.
     * 
     * @param fileName - The name and location of the B+Tree file to open.
     * @throws IOException
     */
    public BTree(String fileName) throws IOException {
        File path = new File(fileName);
        
        if (!path.exists()) {
            System.out.println("Error: The BTree does not exist at this location, \""
                    + path.getCanonicalPath() + "\".");
            System.exit(-1);
        }
        
        f = new RandomAccessFile(fileName, "rw");
        f.seek(0);
        
        this.root = f.readLong();
        this.free = f.readLong();
        this.blockSize = f.readInt();
        this.order = this.blockSize/12;
        
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
    private void addFree(final long addr) throws IOException {
        //System.out.println("ADD FREE: " + addr + " old free: " + free);
        f.seek(addr);
        f.writeLong(free);
        free = addr;
    }
    
    /**
     * Insert a {@code key} with an address, {@code addr}, into this B+Tree. <br><br>
     * 
     * If the {@code key} is not a duplicate, add the {@code key} to the B+tree. <br><br>
     * 
     * @param key - The key to insert into the B+tree.
     * @param addr - The address to store with the {@code key}.
     * @return Return {@code true} if the {@code key} is successfully added. <br>
     *          Return {@code false} if the {@code key} is a duplicate key..
     * @throws IOException
     */
    public boolean insert(int key, long addr) throws IOException {
        
        // CASE 1: root == 0 (The root is null or does not exist).
        if (this.root == 0) {
            long address = getFree();
            this.root = address;
            BTreeNode tNode = new BTreeNode(-1, key, addr, address);
            tNode.writeNode(address);
        } 
        // CASE 2: root != 0.
        else {
            
            //--- Build a path to where the key will be inserted. ---
            Stack<BTreeNode> path = getSearchPath(key);
            
            //--- Insert The Key into this B+Tree. ---
            return insert(key, addr, path);
        }
        
        return true;
    }
    
    /**
     * Helper Method for {@link #insert(int key, long addr)}.
     * 
     * @param key - The key to insert into the B+tree.
     * @param addr - The address to store with the {@code key}.
     * @param path - A stack that contains a path to where key will be stored.
     * @return Returns {@code true} if no duplicate key was found, 
     *              otherwise return {@code false}.
     * @throws IOException
     */
    private boolean insert(int key, long addr,
                              Stack<BTreeNode> path) throws IOException {
        
        boolean split = true;
        while (!path.empty() && split) {
            
            //--- Get a node from the stack. ---
            BTreeNode tNode = path.pop();
            int[] keys = tNode.keys;            // Temp reference to tNode.keys
            long[] children = tNode.children;   // Temp reference to tNode.children
            
            int keyIndex = 0;                   // keyIndex will be tNode's key array index to place the key in.
            
            //*** Find a location to place the key ***
            while (keyIndex < Math.abs(tNode.count)) {
                if (key <= keys[keyIndex])
                    break;
                if (keyIndex == keys.length - 1)
                    break;
                keyIndex++;
            }
            
            //*** Duplicate Key Found ***
            if (keys[keyIndex] == key && (keyIndex < Math.abs(tNode.count))) {
                return false;
            }
            
            //*****--- Insert the Key ---*****
            //***--- CASE A Insert: There is room in the tNode for a new key value. ---***
            if (Math.abs(tNode.count) < order - 1) {
                
                // Case A1: Node is a leaf node.
                if (tNode.count <= 0) {
                    // At (keyIndex), insert the 'key' into tNode's key array.
                    // At (keyIndex), insert the 'addr' into tNode's children array.
                    tNode.keys = arrayInsertShiftRight(keys, keyIndex, key);
                    tNode.children = arrayInsertShiftRight(children, keyIndex, addr);
                }
                // Case A2: Node is a non-leaf node.
                else {
                    // At (keyIndex), insert the 'key' into tNode's key array.
                    // At (keyIndex + 1), insert the 'addr' into tNode's children array.
                    tNode.keys = arrayInsertShiftRight(keys, keyIndex, key);
                    tNode.children = arrayInsertShiftRight(children, keyIndex + 1, addr);
                }
                
                // Increment the tNode's count
                if (tNode.count <= 0) 
                    tNode.count--;
                else 
                    tNode.count++;
                
                //*** Write tNode to file ***
                tNode.writeNode(tNode.address);
                split = false;
                
            } 
            //***--- CASE B Insert: NO room for the key, split the tNode into two nodes. ---***
            else {
                
                // Case B1 SPLIT: Node is a leaf node.
                if (tNode.count <= 0) {
    
                    // Create a new node.
                    int[] newKeys = new int[order - 1];
                    long[] newChildren = new long[order];
                    BTreeNode newNode = new BTreeNode(
                            0,
                            newKeys,
                            newChildren,
                            getFree());
                    
                    int middleKeyIndex = (int) Math.floor(order / 2.0);
    
                    // Update counts
                    tNode.count = -1 * (middleKeyIndex);
                    newNode.count = -1 * (middleKeyIndex + (order % 2));
                    
                    // Starting at the middleKeyIndex...
                    // Populate the newNode with keys and addresses from tNode.
                    int j = 0;
                    for (int i = middleKeyIndex; i < keys.length; i++) {
                        newKeys[j++] = keys[i];
                    }
                    j = 0;
                    for (int i = middleKeyIndex; i < children.length; i++) {
                        newChildren[j++] = children[i];
                    }
                    
                    // Insert "key" while maintaining a sorted B+Tree.
                    int tempSlotKey = key;      // Temp slot for key values.
                    long tempSlotChild = addr;  // Temp slot for child addresses.
                    for (int i = 0; i < middleKeyIndex; i++) {
                        if (tempSlotKey < keys[i]) {
                            int temp1 = keys[i];
                            keys[i] = tempSlotKey;
                            tempSlotKey = temp1;
                            
                            long temp2 = children[i];
                            children[i] = tempSlotChild;
                            tempSlotChild = temp2;
                        }
                    }
                    for (int i = 0; i < middleKeyIndex + 1; i++) {
                        if (tempSlotKey < newKeys[i] || (newKeys[i] == 0 && i == Math.abs(newNode.count) - 1)) {
                            int temp1 = newKeys[i];
                            newKeys[i] = tempSlotKey;
                            tempSlotKey = temp1;
                            
                            long temp2 = newChildren[i];
                            newChildren[i] = tempSlotChild;
                            tempSlotChild = temp2;
                        }
                    }
                    
                    // Update children addresses.
                    tNode.children[Math.abs(tNode.count)] = newNode.address;
                    newNode.children[Math.abs(newNode.count)] = tNode.children[tNode.children.length - 1];
                    
                    // Write nodes into their address locations.
                    tNode.writeNode(tNode.address);     //*** Write tNode to file ***
                    newNode.writeNode(newNode.address); //*** Write newNode to file ***
                    
                    //*** Root Split Case for a leaf node ***
                    if (tNode.address == root) {
                        BTreeNode newRoot = new BTreeNode(
                                1, 
                                newKeys[0], 
                                tNode.address,
                                newNode.address,
                                getFree());
                        this.root = newRoot.address;
                        newRoot.writeNode(newRoot.address); //*** Write newRoot to file ***
                    }
                    
                    // Setup the key and addr for the next node in the path stack.
                    key = newNode.keys[0];
                    addr = newNode.address;
                    split = true;
                } 
                // Case B2 SPLIT: Node is a non-leaf node.
                else {
                    
                    // Create a new node.
                    int[] newKeys = new int[order - 1];
                    long[] newChildren = new long[order];
                    long newNodeAddress = getFree();
                    BTreeNode newNode = new BTreeNode(
                            0,
                            newKeys,
                            newChildren,
                            newNodeAddress);
                    
                    int middleKeyIndex = (int) Math.floor(order / 2.0);
                    
                    // Update counts
                    tNode.count = middleKeyIndex;
                    newNode.count = middleKeyIndex - 1 + (order % 2);
                    
                    // Starting at the middleKeyIndex...
                    // Populate the newNode with keys and addresses from tNode.
                    int j = 0;
                    for (int i = middleKeyIndex + 1; i < keys.length; i++) {
                        newKeys[j++] = keys[i];
                    }
                    j = 0;
                    for (int i = middleKeyIndex + 1; i < children.length; i++) {
                        newChildren[j++] = children[i];
                    }
                    
                    // Insert "key" while maintaining a sorted B+Tree.
                    int tempSlotKey = key;      // Temp slot for key values.
                    long tempSlotChild = addr;  // Temp slot for child addresses.
                    for (int i = 0; i < middleKeyIndex + 1 && i < keys.length; i++) {
                        if (tempSlotKey < keys[i]) {
                            int temp1 = keys[i];
                            keys[i] = tempSlotKey;
                            tempSlotKey = temp1;
                            
                            long temp2 = children[i + 1];
                            children[i + 1] = tempSlotChild;
                            tempSlotChild = temp2;
                        }
                    }
                    for (int i = 0; i < middleKeyIndex && i < newKeys.length; i++) {
                        if (tempSlotKey < newKeys[i] || (newKeys[i] == 0 && i == Math.abs(newNode.count) - 1)) {
                            int temp1 = newKeys[i];
                            newKeys[i] = tempSlotKey;
                            tempSlotKey = temp1;
                            
                            long temp2 = newChildren[i + 1];
                            newChildren[i + 1] = tempSlotChild;
                            tempSlotChild = temp2;
                        }
                    }
                    
                    // Update children addresses.
                    //tNode.children[Math.abs(tNode.count)] = newNode.address;
                    newNode.children[0] = tNode.children[middleKeyIndex + 1];
                    
                    // Write nodes into their address locations.
                    tNode.writeNode(tNode.address);     //*** Write tNode to file ***
                    newNode.writeNode(newNode.address); //*** Write newNode to file ***
                    
                    //*** Root Split Case for a non-leaf node ***
                    if (tNode.address == root) {
                        BTreeNode newRoot = new BTreeNode(
                                1, 
                                tNode.keys[middleKeyIndex], 
                                tNode.address,
                                newNode.address,
                                getFree());
                        this.root = newRoot.address;
                        newRoot.writeNode(newRoot.address); //*** Write newRoot to file ***
                    }
                    
                    // Setup the key and addr for the next node in the path stack.
                    key = tNode.keys[middleKeyIndex];
                    addr = newNode.address;
                    split = true;
                    
                }
            }
        }
        
        return true;
    }
    
    /**
     * Removes the {@code key,} and returns and address stored with this key.
     * Returns 0 if the key, {@code k}, is not found in the B+Tree or cannot be removed.
     * 
     * @param key - The key to remove.
     * @return Return the address stored with this {@code key}.
     *          Return 0 if the {@code key} is not found in the B+Tree 
     *          or cannot be removed.
     * @throws IOException
     */
    public long remove(int key) throws IOException {
        
        boolean tooSmall = false;   // True, if a node has too few keys.
        
        // *** Get search path. ***
        Stack<BTreeNode> path = getSearchPath(key);
        
        // Return false if the path is empty. An empty path means that the value does not exist in this tree.
        if (path.empty()) {
            return 0;
        }
        
        // *** Peek at the top node (Should initially be a leaf node) and find the key. ***
        BTreeNode tNode = path.pop();
        
        // If "key" is found in tNode, then keyIndex is the indexed location of the key.
        int keyIndex = binarySearch(tNode.keys, key, 0, Math.abs(tNode.count) - 1);
        
        // *** Remove the key if it exists in tNode and return true. ***
        if (keyIndex != -1) {
            
            //*** Remove key from the node. ***
            long addressToRemove = tNode.children[keyIndex]; // This will be returned once removed.
            arrayRemove(tNode.keys, keyIndex);
            arrayRemove(tNode.children, keyIndex);
            
            // Decrease the tNode's count
            if (tNode.count <= 0) 
                tNode.count++;
            else 
                tNode.count--;
            
            tNode.writeNode(tNode.address);
            
            // Handle the cases where the root is too small and a node is too small.
            if (this.root == tNode.address) {
                
                //*** Set tooSmall if the initial root has < 1 key. ***
                if (Math.abs(tNode.count) < 1) {
                    tNode.children[0] = 0;
                    tooSmall = true;
                    
                    // The method after the while loop will handle removing the root.
                }
            } else {
                
                //*** Set tooSmall as true if tNode has less than [ceiling(M/2) - 1] keys. ***
                if (Math.abs(tNode.count) < ((int) (Math.ceil(order / 2.0)) - 1)) {
                    tooSmall = true;
                }
            }
            
            // Setup Parent node for the while loop.
            BTreeNode parent = tNode;
            
            // If the path stack has nodes and the current parent node is too small, perform a borrow or combine operation
            // until the parent node is not too small.
            while (!path.empty() && tooSmall) {
                BTreeNode child = parent;    // The node that is too small.
                parent = path.pop();         // The parent of child.
                //System.out.println(getList());
                
                //************************************************
                //*** Get the neighbor nodes of the child node ***
                
                //--- The index in the parent (parent node) to reference from. ---
                int parentIndex = binaryProximitySearch(parent.keys, key, 0, Math.abs(parent.count) - 1, 0);
                
                //--- Find the left neighbor and right neighbor indexes in parent's children array. ---
                int leftparentIndex = -1;   // Index of parent.children (address of leftNeighbor).
                int middleNodeIndex = -1;   // Index of parent.children (address of child).
                int rightparentIndex = -1;  // Index of parent.children (address of rightNeighbor), (very helpful for removing non-leaf nodes).
                if (key < parent.keys[parentIndex]) {
                    if (parentIndex == 0) {
                        leftparentIndex = -1;
                        middleNodeIndex = parentIndex;
                        rightparentIndex = parentIndex + 1;
                    } else {
                        leftparentIndex = parentIndex;
                        middleNodeIndex = parentIndex + 1;
                        rightparentIndex = parentIndex + 2;
                    }
                    
                } else { // if (key >= parent.keys[parentIndex]) {
                    if (parentIndex == Math.abs(parent.count) - 1) {
                        leftparentIndex = parentIndex;
                        middleNodeIndex = parentIndex + 1;
                        rightparentIndex = -1;
                    } else {
                        leftparentIndex = parentIndex;
                        middleNodeIndex = parentIndex + 1;
                        rightparentIndex = parentIndex + 2;
                    }
                }
                
                //====== Setup the left neighbor and right neighbor nodes. ======
                BTreeNode leftNeighbor = null;
                BTreeNode rightNeighbor = null;
                
                //--- Setup LEFT (using the parent.children array.) ---
                if (leftparentIndex != -1 && 
                        child.address != parent.children[leftparentIndex]) {
                    leftNeighbor = new BTreeNode(parent.children[leftparentIndex]);
                }
                
                //--- Setup RIGHT (using the linked list of the leaf node, unless we are removing a non-leaf node.) ---
                // Right is a Leaf node: A Linked List exists. Use the linked list.
                if (rightparentIndex != -1 && 
                        child.count < 0 && 
                        0 != child.children[Math.abs(child.count)]) {
                    rightNeighbor = new BTreeNode(child.children[Math.abs(child.count)]);
                } 
                // Right is a Non-leaf node: A Linked List will not exist. Use the parent.children array.
                else if (rightparentIndex != -1 && 
                        child.address != parent.children[rightparentIndex] &&
                        rightparentIndex <= Math.abs(parent.count)) {
                    rightNeighbor = new BTreeNode(parent.children[rightparentIndex]);
                }
                
                //====== Choose the neighbor to borrow from if possible. ======
                // If borrowing is not possible, 
                //      choose a neighbor to combine the child node with instead.
                BTreeNode neighborToBorrowFrom = null;
                BTreeNode neighborToCombineWith = null;
                boolean borrowing = false;
                
                // Case 1: leftNeighbor exists && is large enough for a borrow.
                if (leftNeighbor != null && Math.abs(leftNeighbor.count) > (Math.ceil(order / 2.0) - 1)) {
                    neighborToBorrowFrom = leftNeighbor;
                    borrowing = true;
                } 
                // Case 2: rightNeighbor exists && is large enough for a borrow.
                else if (rightNeighbor != null && Math.abs(rightNeighbor.count) > (Math.ceil(order / 2.0) - 1)) {
                    neighborToBorrowFrom = rightNeighbor;
                    borrowing = true;
                } 
                // Case 3: leftNeighbor exists && is small enough for a combine.
                else if (leftNeighbor != null && Math.abs(leftNeighbor.count) <= (Math.ceil(order / 2.0) - 1)) {
                    neighborToCombineWith = leftNeighbor;
                } 
                // Case 4: rightNeighbor exists && is small enough for a combine.
                else if (rightNeighbor != null && Math.abs(rightNeighbor.count) <= (Math.ceil(order / 2.0) - 1)) {
                    neighborToCombineWith = rightNeighbor;
                }
                // Case 5: Something terrible has happened.
                else {
                    throw new IOException("Something terrible has happened. "
                            + "Calling \"remove(" + key + ")\" should never reach this case. "
                            + "The exception occured while... \n"
                            + "tooSmall = " + tooSmall + "\n"
                            + "Child = " + child
                            + "Parent = " + parent
                            + "Left Neighbor = " + leftNeighbor
                            + "Right Neighbor = " + rightNeighbor
                            + "path.peek() = " + path.peek());
                }
                
                //*** If borrowing is possible from a particular neighbor, borrow a value from the neighbor. ***
                if (borrowing) {
                    
                    //*** Borrow a key value from the neighbor and insert the key value into the child node. ***
                    borrow(neighborToBorrowFrom, 
                            leftNeighbor, rightNeighbor, 
                            parent, child, middleNodeIndex);
                            
                    tooSmall = false;
                    
                    // Done borrowing.
                } 
                //*** Otherwise, combine two nodes. (Combine the child node with a particular neighbor.) ***
                else {
                    
                    //*** Combine and merge the neighbor node and child node into 1 node. ***
                    combine(neighborToCombineWith, 
                            leftNeighbor, rightNeighbor, 
                            parent, child, middleNodeIndex);
                    
                    //--- Set tooSmall = false, if and only if the number of keys in the parent is >= the minimum # of keys. 
                    // (minKeys = ceiling(M/2.0) - 1) for an order M tree.
                    if (Math.abs(parent.count) >= Math.ceil(order / 2.0) - 1) {
                        tooSmall = false;
                    }
                    
                    //--- Set tooSmall = false, if and only if the parent node is the root and
                    // the root node's number of keys is >= 1.
                    if (this.root == parent.address && Math.abs(parent.count) >= 1) {
                        tooSmall = false;
                    }
                    
                    // Done combining.
                }
            }
            
            //*** Root is empty. ***
            if (tooSmall) {
                // Set the "root" to the leftmost child of the empty root.
                this.root = parent.children[0];
                
                // Free space.
                addFree(parent.address);
            }
            
            //System.out.println(getList());
            return addressToRemove;
        }
        
        // *** Return false if the key does not exist in the B+Tree. ***
        //System.out.println("Removing ("+ key +") Returned False: KEYINDEX == -1");
        return 0;
    }
    
    /**
     * Borrow a key value from the {@code neighborToBorrowFrom} and insert the key value into the {@code child} node.
     * @param neighborToBorrowFrom - The neighbor to borrow a value from. The value is stored in the child node's arrays.
     * @param leftNeighbor - Left neighbor of the child node.
     * @param rightNeighbor - Right neighbor of the child node.
     * @param parent - The parent node of the child node.
     * @param child - This is the child of the parent node.
     * @param middleNodeIndex - Index number of the parent.children array which holds the child's address.
     * @throws IOException
     */
    private void borrow(BTreeNode neighborToBorrowFrom,
                           BTreeNode leftNeighbor,
                           BTreeNode rightNeighbor,
                           BTreeNode parent,
                           BTreeNode child,
                           int middleNodeIndex) throws IOException {
        /*System.out.println("Borrowing:"
                + " n: " + neighborToBorrowFrom 
                + " c: " + child
                + " p: " + parent
                + " L: " + leftNeighbor 
                + " R: " + rightNeighbor);
        */
        int tempSlotKey = 0;        // Temp slot for key valeues.
        long tempSlotChild = 0;     // Temp slot for child addresses.
        
        //*** Borrow the key and shift values amongst the neighbor node and child node. ***
        // Case 1: neighbor is a leaf node.
        if (neighborToBorrowFrom.count < 0) {
            // Case 1A: neighbor is the leftNeighbor.
            if (neighborToBorrowFrom == leftNeighbor) {
                //System.out.println("Case 1A");
                int temp = Math.abs(neighborToBorrowFrom.count) - 1;
                tempSlotKey = neighborToBorrowFrom.keys[temp];
                tempSlotChild = neighborToBorrowFrom.children[temp];
                arrayRemove(neighborToBorrowFrom.keys, temp);
                arrayRemove(neighborToBorrowFrom.children, temp);
                arrayInsertShiftRight(child.keys, 0, tempSlotKey);
                arrayInsertShiftRight(child.children, 0, tempSlotChild);
                parent.keys[middleNodeIndex - 1] = tempSlotKey;
            } 
            // Case 1B: neighbor is the rightNeighbor.
            else { //(neighborToBorrowFrom == rightNeighbor) {
                //System.out.println("Case 1B");
                tempSlotKey = neighborToBorrowFrom.keys[0];
                tempSlotChild = neighborToBorrowFrom.children[0];
                arrayRemove(neighborToBorrowFrom.keys, 0);
                arrayRemove(neighborToBorrowFrom.children, 0);
                int temp = Math.abs(child.count);
                arrayInsertShiftRight(child.keys, temp, tempSlotKey);
                arrayInsertShiftRight(child.children, temp, tempSlotChild);
                parent.keys[middleNodeIndex] = neighborToBorrowFrom.keys[0];
            }
            neighborToBorrowFrom.count++;
            child.count--;
        } 
        // Case 2: neighbor is a non-leaf node.
        else {
            // Case 2A: neighbor is the leftNeighbor.
            if (neighborToBorrowFrom == leftNeighbor) {
                //System.out.println("Case 2A");
                int temp = Math.abs(neighborToBorrowFrom.count) - 1;
                int parentSlotKey = parent.keys[middleNodeIndex - 1];
                tempSlotKey = neighborToBorrowFrom.keys[temp];
                tempSlotChild = neighborToBorrowFrom.children[temp + 1];
                arrayRemove(neighborToBorrowFrom.keys, temp);
                arrayRemove(neighborToBorrowFrom.children, temp + 1);
                arrayInsertShiftRight(child.keys, 0, parentSlotKey);
                arrayInsertShiftRight(child.children, 0, tempSlotChild);
                parent.keys[middleNodeIndex - 1] = tempSlotKey;
            } 
            // Case 2B: neighbor is the rightNeighbor.
            else { //(neighborToBorrowFrom == rightNeighbor) {
                //System.out.println("Case 2B");
                int parentSlotKey = parent.keys[middleNodeIndex];
                tempSlotKey = neighborToBorrowFrom.keys[0];
                tempSlotChild = neighborToBorrowFrom.children[0];
                arrayRemove(neighborToBorrowFrom.keys, 0);
                arrayRemove(neighborToBorrowFrom.children, 0);
                int temp = Math.abs(child.count);
                arrayInsertShiftRight(child.keys, temp, parentSlotKey);
                arrayInsertShiftRight(child.children, temp + 1, tempSlotChild);
                parent.keys[middleNodeIndex] = tempSlotKey;
            }
            neighborToBorrowFrom.count--;
            child.count++;
        }
        
        // Update file.
        //System.out.println("Updating");
        parent.writeNode(parent.address);
        child.writeNode(child.address);
        neighborToBorrowFrom.writeNode(neighborToBorrowFrom.address);
    }
    
    /**
     * Combine the {@code child} node with {@code neighborToCombineWith}.
     * @param neighborToCombineWith - The neighbor to combine the child with.
     * @param leftNeighbor - Left neighbor of the child node.
     * @param rightNeighbor - Right neighbor of the child node.
     * @param parent - The parent node of the child node.
     * @param child - This is the child of the parent node.
     * @param middleNodeIndex - Index number of the parent.children array which holds the child's address.
     * @throws IOException
     */
    private void combine(BTreeNode neighborToCombineWith,
                         BTreeNode leftNeighbor,
                         BTreeNode rightNeighbor,
                         BTreeNode parent,
                         BTreeNode child,
                         int middleNodeIndex) throws IOException {
        /*System.out.println("Combining:"
              + " n: " + neighborToCombineWith 
              + " c: " + child
              + " p: " + parent
              + " L: " + leftNeighbor 
              + " R: " + rightNeighbor);
        */
        int tempSlotKey = 0;        // Temp slot for key valeues.
        long tempSlotChild = 0;     // Temp slot for child addresses.
        
        //*** Combine and merge the neighbor node and child node into 1 node. ***
        // Case 1: neighbor is a leaf node.
        if (neighborToCombineWith.count < 0) {
            // Case 1A: neighbor is the leftNeighbor.
            if (neighborToCombineWith == leftNeighbor) {
                //System.out.println("Case 1A");
                
                // Move all key values into the neighbor node.
                while (child.count < 0) {
                    tempSlotKey = child.keys[0];
                    tempSlotChild = child.children[0];
                    arrayRemove(child.keys, 0);
                    arrayRemove(child.children, 0);
                    child.count++; //leaf nodes have a negative count, so decrease by adding.
                    
                    int temp = Math.abs(neighborToCombineWith.count);
                    arrayInsertShiftRight(neighborToCombineWith.keys, temp, tempSlotKey);
                    arrayInsertShiftRight(neighborToCombineWith.children, temp, tempSlotChild);
                    neighborToCombineWith.count--; //leaf nodes have a negative count, so increase by subtracting.
                }
                // Maintain linked list for leaves.
                neighborToCombineWith.children[Math.abs(neighborToCombineWith.count)] = child.children[Math.abs(child.count)];
                
                // Remove key from parent node.
                arrayRemove(parent.keys, middleNodeIndex - 1);
                arrayRemove(parent.children, middleNodeIndex);
                parent.count--; //parents of leaf nodes always have a positive count, so decrease by subtracting.
                
                // Update file and nodes.
                parent.writeNode(parent.address);
                //child.writeNode(child.address);
                neighborToCombineWith.writeNode(neighborToCombineWith.address);
                addFree(child.address); //free up the node.
            } 
            // Case 1B: neighbor is the rightNeighbor.
            else { //(neighborToBorrowFrom == rightNeighbor) {
                //System.out.println("Case 1B");
                
                // Move all key values into the child node.
                while (neighborToCombineWith.count < 0) {
                    int temp = Math.abs(child.count);
                    tempSlotKey = neighborToCombineWith.keys[0];
                    tempSlotChild = neighborToCombineWith.children[0];
                    arrayRemove(neighborToCombineWith.keys, 0);
                    arrayRemove(neighborToCombineWith.children, 0);
                    neighborToCombineWith.count++; //leaf nodes have a negative count, so decrease by adding.
                    
                    arrayInsertShiftRight(child.keys, temp, tempSlotKey);
                    arrayInsertShiftRight(child.children, temp, tempSlotChild);
                    child.count--; //leaf nodes have a negative count, so increase by subtracting.
                }
                // Maintain linked list for leaves.
                child.children[Math.abs(child.count)] = neighborToCombineWith.children[Math.abs(neighborToCombineWith.count)];
                
                // Remove key from parent node.
                arrayRemove(parent.keys, middleNodeIndex);
                arrayRemove(parent.children, middleNodeIndex + 1);
                parent.count--; //parents of leaf nodes always have a positive count, so decrease by subtracting.
                
                // Update file and nodes.
                parent.writeNode(parent.address);
                child.writeNode(child.address);
                //neighborToCombineWith.writeNode(neighborToCombineWith.address);
                addFree(neighborToCombineWith.address); //free up the node.
            }
        } 
        // Case 2: neighbor is a non-leaf node.
        else {
            // Case 2A: neighbor is the leftNeighbor.
            if (neighborToCombineWith == leftNeighbor) {
                //System.out.println("Case 2A");
                
                // Take the parent node's key and store it into neighbor's node.
                arrayInsertShiftRight(neighborToCombineWith.keys, 
                        Math.abs(neighborToCombineWith.count),
                        parent.keys[middleNodeIndex - 1]);
                arrayInsertShiftRight(neighborToCombineWith.children, 
                        Math.abs(neighborToCombineWith.count) + 1, 
                        child.children[0]);
                
                neighborToCombineWith.count++; //non-leaf nodes have a positive count, so increase by adding.
                
                // Move all key values into the neighbor node.
                while (child.count > 0) {
                    tempSlotKey = child.keys[0];
                    tempSlotChild = child.children[0];
                    arrayRemove(child.keys, 0);
                    arrayRemove(child.children, 0);
                    child.count--; //non-leaf nodes have a positive count, so decrease by subtracting.
                    int temp = Math.abs(neighborToCombineWith.count);
                    arrayInsertShiftRight(neighborToCombineWith.keys, temp, tempSlotKey);
                    arrayInsertShiftRight(neighborToCombineWith.children, temp, tempSlotChild);
                    neighborToCombineWith.count++; //non-leaf nodes have a positive count, so increase by adding.
                }
                
                // Add-on the last address from the childd into the neighbor node.
                neighborToCombineWith.children[Math.abs(neighborToCombineWith.count)] = child.children[0];
                
                // Remove key from parent node.
                arrayRemove(parent.keys, middleNodeIndex - 1);
                arrayRemove(parent.children, middleNodeIndex);
                parent.count--; //parents of non-leaf nodes always have a positive count, so decrease by subtracting.
                
                // Update file and nodes.
                parent.writeNode(parent.address);
                //child.writeNode(child.address);
                neighborToCombineWith.writeNode(neighborToCombineWith.address);
                addFree(child.address); //free up the node.
            } 
            // Case 2B: neighbor is the rightNeighbor.
            else { //(neighborToBorrowFrom == rightNeighbor) {
                //System.out.println("Case 2B");
                
                // Take the parent node's key and store it into child's node.
                arrayInsertShiftRight(child.keys, 
                        Math.abs(child.count), 
                        parent.keys[middleNodeIndex]);
                arrayInsertShiftRight(child.children, 
                        Math.abs(child.count) + 1, 
                        neighborToCombineWith.children[0]);
                
                child.count++; //non-leaf nodes have a positive count, so increase by adding.
                
                // Move all key values into the child node.
                while (neighborToCombineWith.count > 0) {
                    int temp = Math.abs(child.count);
                    tempSlotKey = neighborToCombineWith.keys[0];
                    tempSlotChild = neighborToCombineWith.children[0];
                    arrayRemove(neighborToCombineWith.keys, 0);
                    arrayRemove(neighborToCombineWith.children, 0);
                    neighborToCombineWith.count--; //non-leaf nodes have a positive count, so decrease by subtracting.
                    
                    arrayInsertShiftRight(child.keys, temp, tempSlotKey);
                    arrayInsertShiftRight(child.children, temp, tempSlotChild);
                    child.count++; //non-leaf nodes have a positive count, so increase by adding.
                }
                
                // Add-on the last address from the neighbor into the child node.
                child.children[Math.abs(child.count)] = neighborToCombineWith.children[0];
                
                // Remove key from parent node.
                arrayRemove(parent.keys, middleNodeIndex);
                arrayRemove(parent.children, middleNodeIndex + 1);
                parent.count--; //parents of non-leaf nodes always have a positive count, so decrease by subtracting.
                
                // Update file and nodes.
                parent.writeNode(parent.address);
                child.writeNode(child.address);
                //neighborToCombineWith.writeNode(neighborToCombineWith.address);
                addFree(neighborToCombineWith.address); //free up the node.
            }
        }
        
        // Update file and nodes.
//        parent.writeNode(parent.address);
//        child.writeNode(child.address);
//        neighborToCombineWith.writeNode(neighborToCombineWith.address);
        
    }
    
    /**
     * Search for the {@code key} and return the address of the row that contains this key. <br><br>
     * 
     * This is an equality search. <br>
     * Also, this method creates a path in this B+Tree that leads to where the {@code key} would be stored.
     * 
     * @param key - The key to search for.
     * @return If the key is found, return the address of the row with the key, otherwise return 0.
     * @throws IOException 
     */
    public long search(int key) throws IOException {
        //System.out.println("search(" + k + ")");
        
        // *** Get search path. ***
        Stack<BTreeNode> path = getSearchPath(key);
        
        // Return a 0 if the path is empty.
        if (path.empty()) {
            return 0;
        }
        
        // *** Peek at the top node (Should be a leaf node) and find the key. ***
        BTreeNode leafNode = path.peek();
        
        // If "key" is found in leafNode, then keyIndex is the location of the key.
        
        // Binary Search
        int keyIndex = binarySearch(leafNode.keys, key, 0, Math.abs(leafNode.count) - 1);
        
        // Linear Search.
        /*int keyIndex = -1;
        for (int i = 0; i < Math.abs(tNode.count); i++) {
            if (k == leafNode.keys[i]) {
                keyIndex = i;
                break;
            }
        }*/
        
        //if (keyIndex != -1) System.out.println("s(k)1 " + leafNode.address + " " + leafNode.children[keyIndex] + " " + keyIndex);
        //else System.out.println("s(k)2 " + leafNode.address + " " + keyIndex);
            
        // *** Return the address row in the leaf if the key, "k", exists. ***
        if (keyIndex != -1) {
            return leafNode.children[keyIndex];
        }
        
        // *** Otherwise, return 0. ***
        return 0;
    }
    
    /**
     * Returns a Stack, containing a stack of nodes that lead to the {@code key}.
     * Helper method for {@link #search(int)} and other methods.
     * @param key
     * @return
     * @throws IOException
     */
    private Stack<BTreeNode> getSearchPath(int key) throws IOException {
        
        Stack<BTreeNode> path = new Stack<>();
        
        // If the root does not exist, return an empty path to prevent a EOFException caused by "new BTreeNode(0)".
        if(this.root == 0) {
            return path;
        }
        
        // *** Search for the "key". ***
        path.push(new BTreeNode(this.root));
        while (path.peek().count > 0) {
            BTreeNode tNode = path.peek();
            int[] keys = tNode.keys;
            
            // If "key" is found in tNode, then keyIndex is the location of the key.
            // tNode should be a leaf node.
            
            // Binary Proximity Search.
            int keyIndex = binaryProximitySearch(keys, key, 0, Math.abs(tNode.count) - 1, 0);
            
            // Linear Proximity Search.
            /*int keyIndex = 0;
            for (int i = 0; i < Math.abs(tNode.count); i++) {
                keyIndex = i;
                if (k <= tNode.keys[i]) {
                    break;
                }
            }*/
            
            // Compare the "key" with tNode's keys and push the correct node onto the stack.
            // Case 1: Push onto the stack, the left child of the key. (key < keys[keyIndex])
            if (key < keys[keyIndex]) {
                path.push(new BTreeNode(tNode.children[keyIndex]));
                //System.out.println("sP(k)1 " + tNode.address + " " + tNode.children[keyIndex] + " " + keyIndex);
            } 
            // Case 2: Push onto the stack, the right child of the key. (key >= keys[keyIndex])
            else { // if (key >= keys[keyIndex]) {
                path.push(new BTreeNode(tNode.children[keyIndex + 1]));
                //System.out.println("sP(k)2 " + tNode.address + " " + tNode.children[keyIndex + 1] + " " + (keyIndex + 1));
            }
            
        }
        
        return path;
    }
    
    /**
     * Precondition: {@code low} <= {@code high} <br><br>
     * 
     * Return a list of addresses for all keys in the range from low to high.
     * Inclusive return an empty list when no keys are in the range.
     * 
     * @param low - Minimum key range.
     * @param high - Maximum key range.
     * @return
     * @throws IOException
     */
    public LinkedList<Long> rangeSearch(int low, int high) throws IOException {

        // List.
        LinkedList<Long> list = new LinkedList<>();
        
        // Precondition: low <= high.
        if (low > high) {
            System.out.println("WARNING: An invalid range search was called."
                    + " \"low\" must be <= \"high\".");
            return list;
            //throw new IOException("WARNING: An invalid range search was called."
            //        + " \"low\" must be <= \"high\".");
        }
        
        // *** Get the search path to the lowest key value. ***
        Stack<BTreeNode> path = getSearchPath(low);
        
        // Return an empty list if a path is not found.
        if (path.isEmpty()) {
            return list;
        }
        
        // Peek.
        BTreeNode tNode = path.peek();
        
        // Search the linked leaf nodes.
        while (true) {
            for (int i = 0; i < Math.abs(tNode.count); i++) {
                if (tNode.keys[i] >= low && tNode.keys[i] <= high) {
                    list.add(tNode.children[i]);
                }
            }
            long nextLinkedNodeAddress = tNode.children[Math.abs(tNode.count)];
            if (nextLinkedNodeAddress == 0) {
                break;
            } else {
                tNode = new BTreeNode(nextLinkedNodeAddress);
            }
        }
        
        return list;
    }
    
    /**
     * Print the B+Tree to standard output.
     * Print one node per line.
     * 
     * @return A string of nodes per line.
     * @throws IOException
     */
    public void print() throws IOException {
        
        String s = "";
        
        //f.seek(20);
        
        // Print other info.
        f.seek(0);
        s += f.getFilePointer() + " Root: " + root + "\n"; f.readLong();
        s += f.getFilePointer() + " Free: " + free + "\n"; f.readLong();
        s += f.getFilePointer() + " BlockSize: " + f.readInt() + "\n";
        
        // Print nodes.
        long a = f.getFilePointer();
        while (a < f.length()) {
            //System.out.print("a: " + a + ", f.length: " + f.length() + " | ");
            BTreeNode node = new BTreeNode(a);
            f.seek(a);
            //s += f.getFilePointer() + " ";
            s += node.getNode();
            a += blockSize;
        }
        
        System.out.println(s);
        //return s;
    }
    
    public void close() throws IOException {
        // close the B+tree. The tree should not be accessed after close is called
        f.seek(0);
        f.writeLong(this.root);
        f.writeLong(this.free);
        f.close();
    }
    
    
    //*** Helper methods ***
    
    /**
     * Helper Method for {@link #insert(int key, long addr)} 
     * and {@link #remove(int key)}.
     * @param arr
     * @param index
     * @param value
     * @return
     */
    private int[] arrayInsertShiftRight(final int[] arr, 
                            final int index, 
                            final int value) {
        for (int i = arr.length - 1; i >= index; i--) {
            
            if (i > index) {
                int temp = arr[i];
                arr[i] = arr[i - 1];
                arr[i - 1] = temp;
            } else if (i == index) 
                arr[i] = value;
        }
        return arr;
    }
    
    /**
     * Helper Method for {@link #insert(int key, long addr)} 
     * and {@link #remove(int key)}.
     * @param arr
     * @param index
     * @param value
     * @return
     */
    private long[] arrayInsertShiftRight(final long[] arr, 
                             final int index, 
                             final long value) {
        for (int i = arr.length - 1; i >= index; i--) {
            
            if (i > index) {
                long temp = arr[i];
                arr[i] = arr[i - 1];
                arr[i - 1] = temp;
            } else if (i == index) 
                arr[i] = value;
        }
        return arr;
    }
    
    /**
     * Helper Method for {@link #remove(int key)}.
     * @param arr
     * @param index
     * @param value
     * @return
     */
    private int[] arrayRemove(final int[] arr, 
                            final int index) {
        for (int i = index; i < arr.length; i++) {
            
            if (i < arr.length - 1) {
                int temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
            } else if (i == arr.length - 1) 
                arr[i] = 0;
        }
        return arr;
    }
    
    /**
     * Helper Method for {@link #remove(int key)}.
     * @param arr
     * @param index
     * @param value
     * @return
     */
    private long[] arrayRemove(final long[] arr, 
                             final int index) {
        for (int i = index; i < arr.length; i++) {
            
            if (i < arr.length - 1) {
                long temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
            } else if (i == arr.length - 1) 
                arr[i] = 0;
        }
        return arr;
    }
    
    /**
     * Search a particular array, {@code arr}, for a target value.
     * 
     * @param arr - The array to search in.
     * @param target - The target value to find in the array.
     * @return Returns the index of {@code arr} that contains the target 
     *              value. Otherwise, return -1 if the target is not found.
     */
    /*private int binarySearch(final int[] arr,
                             final int target) {
        return binarySearch(arr, target, 0, arr.length - 1);
    }*/
    
    /**
     * Search a particular array, {@code arr}, for a target value.
     * 
     * @param arr - The array to search in.
     * @param target - The target value to find in the array.
     * @param lowerbound - Search indices higher than lowerbound.
     * @param upperbound - Search indices loweer than upperbound.
     * @return Returns the index of {@code arr} that contains the target 
     *              value. Otherwise, return -1 if the target is not found.
     */
    private int binarySearch(final int[] arr, 
                             final int target,
                             int lowerbound,
                             int upperbound) {
        
        if(lowerbound > upperbound) {
            //System.out.println("Target not found. Returning index -1.");
            return -1;
        }
        
        if(target > arr[upperbound]) {
            //System.out.println("Target not found. Returning index -1.");
            return -1;
        }
        if(target < arr[lowerbound]) {
            //System.out.println("Target not found. Returning index -1.");
            return -1;
        }
        
        int middlebound = (lowerbound + upperbound)/2;
        
        while(target != arr[middlebound]) {
            if(lowerbound > upperbound) {
                //System.out.println("Target not found. Returning index -1.");
                return -1;
            }
            
            // Search left of the middlebound index.
            if (target < arr[middlebound]) {
                upperbound = middlebound - 1;
                middlebound = (lowerbound + upperbound)/2;
            }
            // Search right of the middlebound index.
            else if (target > arr[middlebound]) {
                lowerbound = middlebound + 1;
                middlebound = (lowerbound + upperbound)/2;
            }
            // The target is found, return the index containing the target.
            else {//if (target == arr[middlebound]) {
                return middlebound;
            }
        }
        
        return middlebound;
    }
    
    /**
     * In a particular array, {@code arr}, search for a target value and return
     *      the closest index to the target value.
     * 
     * @param arr - The array to search in.
     * @param target - The target value to find in the array.
     * 
     * @return Return the index of {@code arr} that contains the target value.
     *              Otherwise, return the closest index in the array, 
     *              {@code arr} that has a value closest to {@code target}.
     */
    /*private int binaryProximitySearch(final int[] arr, 
                                      final int target) {
        return binaryProximitySearch(arr, target, -1);
    }*/
    
    /**
     * In a particular array, {@code arr}, search for a target value and return
     *      an index depending on the {@code mode}.
     * 
     * @param arr - The array to search in.
     * @param target - The target value to find in the array.
     * @param mode - See the <b>Returns</b> description for more info.
     * 
     * @return 
     *          Return the index of {@code arr} that contains the target value. <br><br>
     * 
     *          Otherwise, if the target is not found... <br>
     *          If mode == 0, return the index that contains a value closest and less than 
     *              the {@code target} value. 
     *              (The index must exist, otherwise return the closest existing index) <br>
     *          If mode == 1, return the index that contains a value closest and greater than 
     *              the {@code target} value. 
     *              (The index must exist, otherwise return the closest existing index) <br>
     *          Else if the mode is != 0 or != 1, 
     *              return the index that contains a value closest to the {@code target} value.
     */
    /*private int binaryProximitySearch(final int[] arr, 
                                      final int target, 
                                      final int mode) {
        return binaryProximitySearch(arr, target, 0, arr.length - 1, mode);
    }*/
    
    /**
     * In a particular array, {@code arr}, search for a target value and return
     *      an index depending on the {@code mode}.
     * 
     * @param arr - The array to search in.
     * @param target - The target value to find in the array.
     * @param lowerbound - Search indices higher than lowerbound.
     * @param upperbound - Search indices loweer than upperbound.
     * @param mode - See the <b>Returns</b> description for more info.
     * 
     * @return 
     *          Return the index of {@code arr} that contains the target value. <br><br>
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
    private int binaryProximitySearch(final int[] arr, 
                                      final int target, 
                                      int lowerbound, int upperbound, 
                                      final int mode) {
        if(target > arr[upperbound]) {
            return upperbound;
        }
        if(target < arr[lowerbound]) {
            return lowerbound;
        }
        
        //int lowerbound = 0;
        //int upperbound = arr.length - 1;
        int middlebound = (lowerbound + upperbound)/2;
        
        while(target != arr[middlebound]) {
            // The target was NOT found, return the index containing the value closest to the target value.
            if(lowerbound > upperbound) {
                if (mode == 0) {
                    return middlebound;
                } else if (mode == 1) {
                    return lowerbound;
                } else {
                    if (Math.abs(target - arr[middlebound]) <= Math.abs(target - arr[lowerbound])) {
                        return middlebound;
                    } else {
                        return lowerbound;
                    }
                }
            }
            
            // Search left of the middlebound index.
            if (target < arr[middlebound]) {
                upperbound = middlebound - 1;
                middlebound = (lowerbound + upperbound)/2;
            }
            // Search right of the middlebound index.
            else if (target > arr[middlebound]) {
                lowerbound = middlebound + 1;
                middlebound = (lowerbound + upperbound)/2;
            }
            // The target is found, return the index containing the target.
            else {//if (target == arr[middlebound]) {
                return middlebound;
            }
        }
        
        return middlebound;
    }
    
    //*** Debug Helper Methods ***
    /*protected String getList() throws IOException {
        
        String s = "";
        
        f.seek(0);
        s += f.getFilePointer() + " " + root + "\n"; f.readLong();
        s += f.getFilePointer() + " " + free + "\n"; f.readLong();
        s += f.getFilePointer() + " " + f.readInt() + "\n";
        
        long a = f.getFilePointer();
        while (a < f.length()) {
            //System.out.print("a: " + a + ", f.length: " + f.length() + " | ");
            BTreeNode node = new BTreeNode(a);
            f.seek(a);
            //s += f.getFilePointer() + " ";
            s += node.getNode();
            a += blockSize;
        }
        
        //System.out.println();
        return s;
    }
    
    protected String getFreeList() throws IOException {
        
        String s = "";
        
        if (free == 0)
            s += "free --> " + free + "\n";
        else
            s += "free --> " + free + " --> " + "";
        s += getFreeList(free);
        s += "\n";
        
        return s;
    }
    
    private String getFreeList(long fNode) throws IOException {
        String s = "";
        //System.out.println("fNode: " + fNode);
        if (fNode <= 0) return s;
        
        f.seek(fNode);
        long node = f.readLong();
        
        if (node <= 0) s += node;
        else s += node + " --> ";
        
        return s + getFreeList(node);
    }
    
    private static void printArray(final int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            if (i < arr.length - 1)
                System.out.print(arr[i] + ", ");
            else
                System.out.print(arr[i]);
        }
        System.out.println();
    }
    
    private static void printArray(final long[] arr) {
        for (int i = 0; i < arr.length; i++) {
            if (i < arr.length - 1)
                System.out.print(arr[i] + ", ");
            else
                System.out.print(arr[i]);
        }
        System.out.println();
    }*/
    
    /*
    public static void main(String[] args) {
        BTree t = null;
        
        try {
            t = new BTree("BTree.txt", 60);
            
            int[] arr = new int[7];
            arr[0] = 1;
            arr[1] = 3;
            arr[2] = 8;
            arr[3] = 9;
            arr[4] = 10;
            arr[5] = 120;
            arr[6] = 150;
            
            long[] arr2 = new long[5];
            arr2[0] = 1;
            arr2[1] = 3;
            arr2[2] = 8;
            arr2[3] = 9;
            arr2[4] = 10;
            
            System.out.println(t.binarySearch(arr, 9, 0, 2));
            //System.out.println(t.binaryProximitySearch(arr, 4, 1));
            
            printArray(arr);
            arr = t.arrayRemove(arr, 1);
            printArray(arr);
            
            printArray(arr2);
            arr2 = t.arrayRemove(arr2, 1);
            printArray(arr2);
            
            t.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    */
    
}
