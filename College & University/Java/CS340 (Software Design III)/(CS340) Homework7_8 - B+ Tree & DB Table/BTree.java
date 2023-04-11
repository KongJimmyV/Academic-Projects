import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.EmptyStackException;
import java.util.LinkedList;
import java.util.Stack;

public class BTreeTim {
    RandomAccessFile f;
    static int order;
    int blockSize;
    long root;
    long free;
    Stack<BTreeNode> path = new Stack<>();
    static int maxKeys;
    static int maxChildren;

    // add instance variables as needed.
    private class BTreeNode {
        private int count;
        private int keys[];
        private long children[];
        private long address; // the address of the node in the file
        // constructors and other method
        private long next;

        private BTreeNode(int c, int[] k, long[] ch) throws IOException {
            count = c;
            int hardCount = Math.abs(count);
            keys = new int[maxKeys];
            children = new long[order];
            
            //TODO: To fix the array not printing properly,
            //TODO: I changed it from... ( I changed = to <=)
            //TODO:     for (int i = 0; i = hardCount - 1; i++) {
            //TODO: to...
            //TODO:     for (int i = 0; i <= hardCount - 1; i++) {
            //
            //Example statements. 
            //c = -1, 
            //count = c = -1, 
            //hardCount = 1, 
            //hardCount - 1 = 0
            //for (int i = 0; i < hardCount - 1; i++) {
            //     that above equals the below statement
            //for (int i = 0; i < 0; i++) {
            //it will never add anything to keys[i].
            for (int i = 0; i <= hardCount - 1; i++) {
                keys[i] = k[i];
            }
            
            //TODO: To fix the array not printing properly,
            //TODO: I changed it from... ( I changed = to <=)
            //TODO:     for (int i = 0; i = hardCount; i++) {
            //TODO: to...
            //TODO:     for (int i = 0; i <= hardCount; i++) {
            for (int i = 0; i <= hardCount; i++) {
                children[i] = ch[i];
            }

        }

        private BTreeNode(long address) throws IOException {
            f.seek(address);
            count = f.readInt();
            keys = new int[maxKeys];
            children = new long[order];
            this.address = address; //TODO: I added this statement to update the address field with the parameter.
            
            for (int i = 0; i < keys.length; i++) { //TODO: I changed this from hardCount.
                keys[i] = f.readInt();
            }
            for (int i = 0; i < children.length; i++) { //TODO: I changed this from hardCount.
                children[i] = f.readLong();
            }
            // next = f.readLong();
        }

        private void writeBTreeNode(long address) throws IOException {
            // writes the node to the file at location addr
            f.seek(address);
            f.writeInt(count);
            for (int i = 0; i < keys.length; i++) { //TODO: I changed this from hardCount.
                f.writeInt(keys[i]);
            }
            for (int i = 0; i < children.length; i++) { //TODO: I changed this from hardCount.
                f.writeLong(children[i]);
            }

        }

        public String toString() {
            String s = "";
            s += address + " " + count + ", keys:";
            for (int i = 0; i <= Math.abs(count) - 1; i++) { //TODO: I changed = to <=
                s += " " + keys[i];
            }
            s += ", children:";
            for (int i = 0; i <= Math.abs(count); i++) { //TODO: I changed = to <=
                s += " " + children[i];
            }
            return s;
        }
    }

    public BTreeTim(String filename, int bsize) throws IOException {
        // bsize is the block size. This value is used to calculate the order
        // of the B+Tree
        // all B+Tree nodes will use bsize bytes
        // makes a new B+tree

        File path = new File(filename);
        path.delete();
        f = new RandomAccessFile(path, "rw");
        
        root = 0;
        free = 0;
        blockSize = bsize; //TODO: I added this.
        f.writeLong(root);
        f.writeLong(free);
        f.writeInt(blockSize); //TODO: I added this to fix the f.length() == 16 problem.
        
        order = bsize / 12;
        maxKeys = order - 1;

    }

    public BTreeTim(String filename) throws IOException {
        // open an existing B+Tree
        File path = new File(filename);
        path.delete();
        f = new RandomAccessFile(path, "rw");
        f.seek(0);
        root = f.readLong();
        free = f.readLong();
        blockSize = f.readInt();
        order = blockSize / 12;
        maxKeys = order - 1;
    }

    public boolean insert(int key, long addr) throws IOException {
        /*
         * If key is not a duplicate add, key to the B+tree addr (in DBTable) is the
         * address of the row that contains the key return true if the key is added
         * return false if the key is a duplicate
         */

        clearPath();
        
        if (search(key) == 0) {
            insert(path, key, addr);
            return true;
        } else {
            return false;
        }

    }

    private void insert(Stack<BTreeNode> path, int key, long addr) throws IOException {

        int val = 0;
        long loc = 0;

        BTreeNode node;
        BTreeNode newNode;

        if (root == 0) {

            int[] k = new int[maxKeys];
            long[] ch = new long[order];
            k[0] = key;
            ch[0] = addr;
            ch[1] = 0;
            BTreeNode root = new BTreeNode(-1, k, ch);
            root.address = getFree();
            root.writeBTreeNode(root.address);
            return;

        }

        node = path.pop();
        int hardCount = Math.abs(node.count);
        boolean split = true;

        if (hardCount < maxKeys) {

            addToLeaf(node, key, addr);

            split = false;

        } else {

            splitTheLeaf(node, key, addr);
            newNode = new BTreeNode(node.next);
            val = newNode.keys[0];
            loc = newNode.address;

        }
        split = true;

        //no longer at a leaf
        while (!path.empty() && split) {

        

            node = path.pop();
            int harderCount = Math.abs(node.count);

            if (harderCount < maxKeys) {

                node.count++;
                addToNonLeaf(node, key, addr);

                split = false;

            } else {

                // split the nonleaf
                // grab val and loc

                split = true;

            }
        }

    }

    public long remove(int key) throws IOException {
        return key;
        /*
         * If the key is in the Btree, remove the key and return the address of the row
         * return 0 if the key is not found in the B+tree
         */
    }

    public long search(int k) throws IOException {
        /*
         * This is an equality search If the key is found return the address of the row
         * with the key otherwise return 0
         */
        return search(root, k);

    }

    private long search(long addr, int k) throws IOException {
        //TODO: I moved this to prevent the EOFException with BTreeNode x = new BTreeNode(addr);
        //TODO: The EOF happens because a node doesn't exist yet when the root == 0.
        if (root == 0) {
            return 0;
        }
        
        BTreeNode x = new BTreeNode(addr);
        int i = 0;
        path.push(x);
        
        if (isLeaf(x.address) && hasKey(x.address, k)) {
            return x.address;
        }
        if (isLeaf(x.address)) {
            return 0;
        }try {
            while (i <= x.keys.length && x.keys[i] < k) {
                i++;
            }
        } catch (ArrayIndexOutOfBoundsException e) {
            return search(x.children[x.children.length - 1], k);
        }
     
        if (i <= x.keys.length && x.keys[i] == k && isLeaf(addr)) {
            return addr;
        }
   
        if (i <= x.keys.length && x.keys[i] == k) {
            return search(x.children[i + 1], k);
        }
        return search(x.children[i], k);

    }

    private boolean hasKey(long addr, int k) throws IOException {
        BTreeNode x = new BTreeNode(addr);
        for (int i = 0; i < x.keys.length; i++) {
            if (x.keys[i] == k) {
                return true;
            }
        }
        return false;
    }

    private boolean isLeaf(long addr) throws IOException {
        BTreeNode x = new BTreeNode(addr);
        if (x.count < 0) {
            return true;
        }
        return false;
    }

    private void splitTheLeaf(BTreeNode node, int newKey, long newLoc) throws IOException {
        // keys
        int halfKey1 = maxKeys / 2;
        int halfKey2 = maxKeys - halfKey1;
        int[] keys1 = new int[maxKeys];
        int[] keys2 = new int[maxKeys];

        // children
        int halfOrder1 = order / 2;
        int halfOrder2 = order - halfOrder1;
        long[] children1 = new long[order];
        long[] children2 = new long[order];

        // first half goes to node
        for (int j = 0; j < halfKey1; j++) {
            keys1[j] = node.keys[j];
        }
        for (int j = 0; j < halfOrder1; j++) {
            children1[j] = node.children[j];
        }

        // second half goes to newNode
        for (int j = 0; j < halfKey2; j++) {
            keys2[j] = node.keys[halfKey1];
            halfKey1++;
        }

        for (int j = 0; j < halfOrder2; j++) {
            children2[j] = node.children[halfOrder1];
            halfOrder1++;
        }

        int i = halfOrder2 - 1;

        while (i > 0 && node.keys[i] > newKey) {

            keys2[i] = keys2[i - 1];
            i--;

        }

        keys2[i] = newKey;
        children2[i] = newLoc;

        BTreeNode newNode = new BTreeNode(-1 * halfKey2, keys2, children2);
        node.count = -1 * halfKey1;
        node.keys = keys1;
        newNode.address = getFree();
        children1[halfOrder1] = newNode.address;
        node.children = children1;
        node.next = newNode.address;
        node.writeBTreeNode(node.address);
        newNode.writeBTreeNode(newNode.address);

    }

    private void splitTheNonLeaf(BTreeNode node, int newKey, long newLoc) throws IOException {
        // keys
        int halfKey1 = maxKeys / 2;
        int halfKey2 = maxKeys - halfKey1;
        int[] keys1 = new int[maxKeys];
        int[] keys2 = new int[maxKeys];

        // children
        int halfOrder1 = order / 2;
        int halfOrder2 = order - halfOrder1;
        long[] children1 = new long[order];
        long[] children2 = new long[order];

        // first half goes to node
        for (int j = 0; j < halfKey1; j++) {
            keys1[j] = node.keys[j];
        }
        for (int j = 0; j < halfOrder1; j++) {
            children1[j] = node.children[j];
        }

        // second half goes to newNode
        for (int j = 0; j < halfKey2; j++) {
            keys2[j] = node.keys[halfKey1];
            halfKey1++;
        }

        for (int j = 0; j < halfOrder2; j++) {
            children2[j] = node.children[halfOrder1];
            halfOrder1++;
        }

        int i = halfOrder2 - 1;

        while (i > 0 && node.keys[i] > newKey) {

            keys2[i] = keys2[i - 1];
            i--;

        }

        keys2[i] = newKey;
        children2[i] = newLoc;

        BTreeNode newNode = new BTreeNode(-1 * halfKey2, keys2, children2);
        node.count = -1 * halfKey1;
        node.keys = keys1;
        newNode.address = getFree();
        children1[halfOrder1] = newNode.address;
        node.children = children1;
        node.next = newNode.address;
        node.writeBTreeNode(node.address);
        newNode.writeBTreeNode(newNode.address);

    }

    private void addToLeaf(BTreeNode node, int key, long addr) throws IOException {

        int i = Math.abs(node.count) - 1;

        while (i > 0 && node.keys[i] > key) {

            node.keys[i] = node.keys[i - 1];
            node.children[i] = node.children[i - 1];
            i--;

        }
        // might have to
        node.keys[i] = key;
        node.children[i] = addr;
        node.count--;
        node.writeBTreeNode(node.address);
    }

    private void addToNonLeaf(BTreeNode node, int key, long addr) throws IOException {

        int i = Math.abs(node.count) - 1;
        int j = Math.abs(node.count);

        while (i > 0 && node.keys[i] > key) {

            node.keys[i] = node.keys[i - 1];
            node.children[j] = node.children[j - 1];
            i--;
            j--;

        }

        node.keys[i] = key;
        node.children[j] = addr;
        node.count++;
        node.writeBTreeNode(node.address);
    }

    public LinkedList<Long> rangeSearch(int low, int high) throws IOException {
        return null;
        // PRE: low <= high
        /*
         * return a list of row addresses for all keys in the range low to high
         * inclusive return an empty list when no keys are in the range
         */
    }

    public void print() throws IOException {
        // print the B+Tree to standard output
        // print one node per line
        // This method can be helpful for debugging
        f.seek(20);
        while (f.getFilePointer() < f.length()) {
            BTreeNode x = new BTreeNode(f.getFilePointer());
            System.out.println(x.toString());
            f.seek(f.getFilePointer() + blockSize);
        }

    }

    private void clearPath() {
        path = new Stack<BTreeNode>();
    }

    private long getFree() throws IOException {
        f.seek(8);
        long head = f.readLong();
        if (head == 0) {
            return f.length();
        }
        f.seek(head);
        long newHead = f.readLong();
        f.seek(8);
        f.writeLong(newHead);
        return head;
    }

    public void close() throws IOException {
        // close the B+tree. The tree should not be accessed after close is called
        f.seek(0);
        f.writeLong(root);
        f.close();
    }

    public static void main(String args[]) throws IOException {
        BTree b = new BTree("x", 60);
        b.insert(10, 5000);
        System.out.println(b.search(10));
    }

}
