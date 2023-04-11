// 
// HuffmanOutputStream.java
// Created by: Kong Jimmy Vang
// Date Created: 3/6/2018
// 

import java.io.IOException;

/**
 * Opens an output stream that stores data into a file.<br><br>
 * 
 * Also extends {@code BitInputStream}.
 * 
 * @author Kong Jimmy Vang
 */
public class HuffmanOutputStream extends BitOutputStream {
    
    //*** Fields ***
    // None.
    
    //*** Constructor(s) ***
    /**
     * Stores data into a {@code filename} by opening an output stream to the file.
     * 
     * @param filename - A File Path. (File can be of any format.)
     * @param tree - The post-order transversal string of a tree. (A HuffmanTree is recommended).
     * @param totalChars - The total amount of characters that will be encoded.
     */
    public HuffmanOutputStream(String filename, String tree, int totalChars) {
        super(filename);
        
        try {
            this.d.writeUTF(tree);
            this.d.writeInt(totalChars);
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }
    
    //*** Methods/Functions ***
    // None.
    
}