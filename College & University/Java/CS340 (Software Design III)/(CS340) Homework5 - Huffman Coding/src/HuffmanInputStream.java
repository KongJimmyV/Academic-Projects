// 
// HuffmanInputStream.java
// Created by: Kong Jimmy Vang
// Date Created: 3/6/2018
// 

import java.io.IOException;

/**
 * Opens an input stream that first reads from a file
 * that is encoded by the Huffman Encoding Algorithm.<br><br>
 * 
 * Also extends {@code BitInputStream}.
 * 
 * @author Kong Jimmy Vang
 */
public class HuffmanInputStream extends BitInputStream {
    
    //*** Fields ***
    private String tree;
    private int totalChars;

    //*** Constructor(s) ***
    /**
     * Reads data from a {@code filename} by opening an input stream to the file.
     * 
     * @param filename - A File Path. (Must be a file that is encoded
     *              by the {@code HuffmanEncode}'s encoding algorithm.)
     */
    public HuffmanInputStream(String filename) {
        super(filename);
        try {
            this.tree = d.readUTF();
            this.totalChars = d.readInt();
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }

    //*** Methods/Functions ***
    /**
     * Returns the tree that was read from the encoded file.
     * @return Returns the tree that was read from the encoded file.
     */
    public String getTree() {
        return this.tree;
    }

    /**
     * Returns the total amount of characters used to encode the file.
     * @return Returns the total amount of characters used to encode 
     * the file.
     */
    public int getTotalChars() {
        return this.totalChars;
    }
}