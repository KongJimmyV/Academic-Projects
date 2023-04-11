// 
// DBTable.java
// Created by: Kong Jimmy Vang
// Date Created: 4/5/2018
// 

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.HashSet;
import java.util.LinkedList;

/**
 * DBTable data structure.
 * @author Kong Jimmy Vang
 */
public class DBTable {
    private RandomAccessFile rows;      // The file that stores the rows in the table
    private long free;                  // Head of the free list space for rows
    private int numOtherFields;         // The number of other fields to store in DBTable.
    private int[] otherFieldLengths;    // Contains the lengths of each other field.
    
    private BTree bTree;                // B+Tree data structure to store DBTable rows and keep track of.
    private int dbTableBlockSize;       // Keeps track of the DBTable's block size.
    private int dbTableStartingAddress; // Keeps track of the first address allowed in the DBTable.
    
    // Holds all the values in the free list on a hash set for quick access. 
    // (Used for the print() method, and Row's getRow() method)
    private HashSet<Long> freeList = new HashSet<>();
    
    /**
     * DBTable's Row objects. <br><br>
     * 
     * Each row consists of unique key and one or more character array fields.<br><br>
     * 
     * Each character array field is a fixed length field (for example 10 characters).
     * Each field can have a different length.
     * Fields are padded with null characters so a field with a length of x characters 
     * always uses space for x characters.
     * 
     * @author Kong Jimmy Vang
     */
    private class Row {
        private int keyField;           // The unique key of this Row.
        private char otherFields[][];   // Array field of characters.
        
        private long address;           // Address location of this Row.
        
        //*** Constructors ***
        
        /**
         * Create a new row by using the given parameters.
         * @param keyField
         * @param otherFields
         */
        /*private Row(int keyField, char otherFields[][]) {
            this.keyField = keyField;
            this.otherFields = otherFields;
        }*/
        
        /**
         * Create a new row by using the given parameters.
         * @param keyField
         * @param otherFields
         * @param address
         */
        private Row(int keyField, char otherFields[][], long address) {
            this.keyField = keyField;
            this.otherFields = otherFields;
            this.address = address;
        }
        
        /**
         * Create a new row by seeking to the address {@code addr}, 
         * and reading the contents of the file at that address.
         * @param addr
         * @throws IOException
         */
        private Row(long addr) throws IOException {
            rows.seek(addr);
            this.keyField = rows.readInt();
            this.otherFields = new char[numOtherFields][];
            this.address = addr;
            for (int i = 0; i < numOtherFields; i++) {
                this.otherFields[i] = new char[otherFieldLengths[i]];
                for (int j = 0; j < otherFieldLengths[i]; j++) {
                    this.otherFields[i][j] = rows.readChar();
                }
            }
        }

        //*** Methods/Functions ***
        
        /**
         * Write this row to a particular address {@code addr} in the file.
         * @param addr - The address location to write this row's contents to.
         * @throws IOException 
         */
        private void writeRow(long addr) throws IOException {
            // Write the row to the particular address.
            rows.seek(addr);
            
            rows.writeInt(this.keyField);
            for (int i = 0; i < numOtherFields; i++) {
                for (int j = 0; j < otherFieldLengths[i]; j++) {
                    rows.writeChar(otherFields[i][j]);
                }
            }
        }
        
        /**
         * Get the other fields of this row in a list format. 
         * If {@code includeKey} == true, include a key at list's index 0 and let the
         * other fields be in the list's indexes greater than 0.
         * @param includeKey - If true, add the row's {@code keyField} to the start of the list.
         * @return Returns a linked list, with each index in the list containing each other fields.
         * @throws IOException
         */
        private LinkedList<String> getOtherFields(boolean includeKey) throws IOException {
            LinkedList<String> list = new LinkedList<>();
            
            String s = "";
            
            if (includeKey)
                list.add(String.valueOf(this.keyField));
            
            rows.seek(this.address + 4);
            for (int i = 0; i < numOtherFields; i++) {
                for (int j = 0; j < otherFieldLengths[i]; j++) {
                    char c = rows.readChar();
                    if (c != '\u0000') {
                        s += c;
                    }
                }
                list.add(s);
                s = "";
            }
            
            return list;
        }
        
        /**
         * Get the other fields of this row in a list format.
         * @return 
         * @throws IOException
         */
        /*private String getOtherFields(int field) throws IOException {
            String s = "";
            
            rows.seek(this.address + 4);
            
            for (int j = 0; j < otherFieldLengths[field]; j++) {
                char c = rows.readChar()
                if (c != '\u0000') {
                    s += c;
                }
            }
            
            return s;
        }*/
        
        /**
         * Get and return a string representation of this row.
         * @return Return a string representation of this row.
         * @throws IOException
         */
        private String getRow() throws IOException {
            String s = "";
            
            rows.seek(this.address);
            s += rows.getFilePointer() + " ";
            
            // If this row is in the free list, print the address stored here.
            long num = rows.readLong();
            if (freeList.contains(num) || num == 0) {
                s += num;
            } 
            // Else print the other values.
            else {
                rows.seek(this.address);
                s += rows.readInt() + "";
                for (int i = 0; i < numOtherFields; i++) {
                    s += " [";
                    for (int j = 0; j < otherFieldLengths[i]; j++) {
                        s += rows.readChar() + "";
                    }
                    s += "]";
                }
            }
            s += "\n";
            return s;
        }
        
        public String toString() {
            try {
                return getRow();
            } catch (IOException e) {
                e.printStackTrace();
                return "[This Row Cannot Be Displayed Due To An Exception]\n "
                        + "- Displaying Object Address: "
                        + "" + getClass().getName() + '@' + Integer.toHexString(hashCode());
            }
        }
    }
    
    /**
     * Create a new DBTable. <br><br>
     * The {@code fileName} is the name of the file used to store the table. <br>
     * The {@code fieldLengths} is an array that stores the lengths of the otherField's fieldLengths. <br>
     * The {@code fieldLengths.length} variable indicates how many other fields are part of the row. <br>
     * The {@code bSize} is the block size that will be used for the B+Tree. (Order M = bSize/12) <br>
     * It is used to calculate the order of the B+Tree. A B+Tree must be created for
     * the key field in the table. If a file with name of {@code fileName} exists, the file
     * will be deleted before the new file is created.
     * 
     * @param fileName - File location and name.
     * @param fieldLengths - An array of field lengths.
     * @param bSize - Block size of a particular B+Tree, used to calculate it's order M. (Order M = bSize/12)
     * @throws IOException
     */
    public DBTable(String fileName, int[] fieldLengths, int bSize) throws IOException {
        /*
         * Use this constructor to create a new DBTable. filename is the name of the
         * file used to store the table. fieldLengths is the lengths of the otherField's fieldLengths. 
         * fieldLengths.length indicates how many other fields are part of the row. bsize is the block size.
         * It is used to calculate the order of the B+Tree. A B+Tree must be created for
         * the key field in the table. If a file with name filename exists, the file
         * should be deleted before the new file is created.
         */
        
        // Setup file path.
        File path = new File(fileName);
        
        if (path.exists())
            path.delete();

        // Create BTree file.
        bTree = new BTree(fileName + ".BTree", bSize);
        
        // Create DBTable file.
        rows = new RandomAccessFile(fileName, "rw");
        rows.seek(0);
        
        // Setup fields by reading parameters and store some fields as the file's contents.
        this.numOtherFields = fieldLengths.length;
        this.otherFieldLengths = fieldLengths;
        this.free = 0;
        
        rows.writeInt(this.numOtherFields);
        for (int i = 0; i < this.numOtherFields; i++) {
            rows.writeInt(this.otherFieldLengths[i]);
        }
        rows.writeLong(this.free);
        
        // Setup a blockSize for the DBTable.
        int blockSize = 0;
        for (int i = 0; i < this.otherFieldLengths.length; i++) {
            blockSize += this.otherFieldLengths[i];
        }
        blockSize *= Character.BYTES;
        this.dbTableBlockSize = blockSize + Integer.BYTES;
        
        // Get the starting point for the rows in the DBTable.
        this.dbTableStartingAddress = Integer.BYTES + Long.BYTES + (this.numOtherFields * Integer.BYTES);
    }
    
    /**
     * Opens an existing DBTable file.
     * @param fileName - File location and name.
     * @throws IOException
     */
    public DBTable(String fileName) throws IOException {
        
        // Setup file path.
        File path = new File(fileName);
        
        // Make sure the file exists before reopening it.
        if (!path.exists()) {
            System.out.println("Error: The DBTable does not exist at this location, \""
                    + path.getCanonicalPath() + "\".");
            System.exit(-1);
        }
        
        // Reopen BTree file.
        bTree = new BTree(fileName + ".BTree");
        
        // Access the DBTable.
        rows = new RandomAccessFile(fileName, "rw");
        rows.seek(0);
        
        // Setup fields by reading contents from the file.
        this.numOtherFields = rows.readInt();
        this.otherFieldLengths = new int[this.numOtherFields];
        for (int i = 0; i < this.numOtherFields; i++) {
            this.otherFieldLengths[i] = rows.readInt();
        }
        this.free = rows.readLong();
        
        // Setup a blockSize for the DBTable.
        int blockSize = 0;
        for (int i = 0; i < this.otherFieldLengths.length; i++) {
            blockSize += this.otherFieldLengths[i];
        }
        blockSize *= Character.BYTES;
        this.dbTableBlockSize = blockSize + Integer.BYTES;
        
        // Get the starting point for the rows in the DBTable.
        this.dbTableStartingAddress = Integer.BYTES + Long.BYTES + (this.numOtherFields * Integer.BYTES);
    }
    
    /**
     * Removes then returns a node from the free list.
     * 
     * @return Removes then returns a node from the free list.
     * @throws IOException
     */
    private long getFree() throws IOException {
        if (free == 0) return rows.length();
        
        long tNode = free;
        rows.seek(free);
        free = rows.readLong();
        
        freeList.remove(new Long(free));
        return tNode;
    }
    
    /**
     * Add the given {@code addr} to the free list.
     * @param addr - Add this node to the free list.
     * @throws IOException
     */
    private void addFree(final long addr) throws IOException {
        //System.out.println("ADD FREE: " + addr + " old free: " + free);
        rows.seek(addr);
        rows.writeLong(free);
        free = addr;
        
        freeList.add(new Long(addr));
    }
    
    /**
     * Precondition: The length of each row's fields matches the expected length. <br><br>
     * 
     * Insert a key and character field array into the DBTable.
     * 
     * @param key - The key to store.
     * @param fields - Field char[][] to store.
     * @return Return true if the row and {@code key} was added. Otherwise return false.
     * @throws IOException
     */
    public boolean insert(int key, char fields[][]) throws IOException {
        
        // Precondition: Check if the length of each row's fields matches the expected length.
        if (fields.length == numOtherFields) {
            for (int i = 0; i < numOtherFields; i++) {
                if (fields[i].length != otherFieldLengths[i]) {
                    System.out.println("WARNING: The char array, \"fields\", "
                            + "does not match the expected length. "
                            + "fields[i].length: " + fields[i].length + " != " + otherFieldLengths[i]);
                    return false;
                }
            }
        } else {
            System.out.println("WARNING: The char array, \"fields\", "
                    + "does not match the expected length. "
                    + "fields.length: " + fields.length + " != " + numOtherFields);
            return false;
        }

        // Get an open or free row in DBTable.
        long address = getFree();
        
        // True if the key is successfully inserted into the B+Tree.
        boolean isInserted = bTree.insert(key, address);
        if (isInserted) {
            
            // Create and write the row to the particular "address".
            Row row = new Row(key, fields, address);
            row.writeRow(address);
        }
        
        return isInserted;
    }
    
    /**
     * Remove a {@code key} from this DBTable.
     * @param key - The key to remove.
     * @return - Return true if the row containing the {@code key} was removed, otherwise return false.
     * @throws IOException
     */
    public boolean remove(int key) throws IOException {
        
        // Remove the key from the B+Tree.
        long removedAddress = bTree.remove(key);
        
        // True if the key is successfully removed from the B+Tree.
        boolean isRemoved = (removedAddress != 0);
        if (isRemoved) {
            
            // Add the node to the free list.
            addFree(removedAddress);
        }
        
        return isRemoved;
    }
    
    /**
     * Search this DBTable for a {@code key} that matches a row and return that row's other fields in a list.
     * 
     * @param key - The key to search for.
     * @return If the key is found, return a list of other fields in the row 
     *          matching this {@code key}. If the key is not found, return an empty list.
     * @throws IOException
     */
    public LinkedList<String> search(int key) throws IOException {
        
        // Get the address and search the B+Tree for the key value.
        long address = bTree.search(key);
        LinkedList<String> list = new LinkedList<>();
        
        if (address != 0) {
            Row row = new Row(address);
            list = row.getOtherFields(false);
        }
        
        return list;
    }
    
    /**
     * Precondition: {@code low} <= {@code high}
     * 
     * For each row that contains a key in the range low to high, inclusive return a list that contains
     * other lists. Each single one of these other lists contain multiple Strings, a key and other fields. <br><br>
     * 
     * @param low - Minimum key range.
     * @param high - Maximum key range.
     * @return Inclusive return a list of other lists. Each single one of these other lists contain 
     *          multiple Strings, a key and other fields. Return an empty list if there are no rows with a key
     *          within the range low to high.
     * @throws IOException
     */
    public LinkedList<LinkedList<String>> rangeSearch(int low, int high) throws IOException {
        
        // List.
        LinkedList<LinkedList<String>> list = new LinkedList<>();
        
        // Precondition: low <= high.
        if (low > high) {
            System.out.println("WARNING: An invalid range search was called."
                    + " \"low\" must be <= \"high\".");
            return list;
            //throw new IOException("WARNING: An invalid range search was called."
            //        + " \"low\" must be <= \"high\".");
        }
        
        // Perform Range search in bTree.
        LinkedList<Long> listOfAddresses = bTree.rangeSearch(low, high);
        
        for (int i = 0; i < listOfAddresses.size(); i++) {
            Row row = new Row(listOfAddresses.get(i));
            list.add(row.getOtherFields(true));
        }
        
        // Return the list.
        return list;
    }

    /**
     * Print the rows to standard output is ascending order (based on the keys).
     * One row per line.
     * @throws IOException
     */
    public void print() throws IOException {
        String s = "";
        
        //rows.seek(this.dbTableStartingAddress);
        
        // Print other info.
        rows.seek(0);
        s += rows.getFilePointer() + " numOtherFields: " + rows.readInt() + "\n";
        for (int i = 0; i < this.numOtherFields; i++) {
            s += rows.getFilePointer() + " Length " + (i+1) + ": " + rows.readInt() + "\n";
        }
        s += rows.getFilePointer() + " Free: " + free + "\n"; rows.readLong();
        
        // Print rows (ordered by key fields in ascending order).
        int amountOfRows = 0;
        long a = rows.getFilePointer();
        while (a < rows.length()) {
            amountOfRows++;
            a += this.dbTableBlockSize;
        }
        
        Row[] rowArray = new Row[amountOfRows];
        int i = 0;
        a = rows.getFilePointer();
        while (a < rows.length()) {
            Row row = new Row(a);
            rowArray[i] = row;
            rows.seek(a);
            //s += rows.getFilePointer() + " ";
            //s += row.getRow();
            a += this.dbTableBlockSize;
            i++;
        }
        
        insertionSort(rowArray);
        
        for (int j = 0; j < rowArray.length; j++) {
            s += rowArray[j].getRow();
        }
        
        System.out.println(s);
        //return s;
    }
    
    /**
     * Close this DBTable.
     * @throws IOException
     */
    public void close() throws IOException {
        rows.seek(this.dbTableStartingAddress - Long.BYTES);
        rows.writeLong(free);
        bTree.close();
        rows.close();
    }
    
    /**
     * Sort an array of rows by their {@code keyFields} in ascending order.
     * @param arr
     */
    private void insertionSort(Row[] rows) {
        for(int i = 1; i < rows.length; i++) {
            Row selectedValue = rows[i];
            
            int j = i;
            while(j >= 1 && rows[j - 1].keyField > selectedValue.keyField) {
                rows[j] = rows[j - 1];
                j--;
            }
            
            // Insert selectedValue into home.
            rows[j] = selectedValue;
        }
    }
}
