// 
// HuffmanDecode.java
// Created by: Kong Jimmy Vang
// Date Created: 3/6/2018
// 

import java.io.*;
//import java.util.*;

/**
 * {@code HuffmanDecode} uses the main method to decode an input file to
 * an output file. See the Javadoc of main ({@link #main}) for more info.
 * 
 * @see {@link #main}
 * @author Kong Jimmy Vang
 */
public class HuffmanDecode {
    
    //*** Fields ***
    private static final char NON_LEAF = 128;
    
    private int totalChars;
        
    //*** Constructors ***
    /**
     * Implements the huffman decoding algorithm.
     * 
     * @param in - Input file location.
     * @param out - Output file location.
     */
    public HuffmanDecode(String in, String out) {
        //*** INPUTS *** (The input should be a binary file.)
        // 1. Read the representation of the Huffman tree from
        //      the input file and rebuild the Huffman tree.
        //*** PROGRAM *** (Decode)
        // 2. Read the number of characters from the input file.
        //*** OUTPUTS *** (The output should ideally be a text file that is larger than the original binary file.)
        // 3. Starting at the root of the Huffman tree, read each
        //      bit from the input file and walk down the Huffman tree.
        //      When a leaf is reached write the character value in the
        //      leaf to the output file and go back to the root of the
        //      Huffman tree.
        // 4. Repeat step 3 until the number of characters written
        //      to the output file match the value found in step 2.
        
        HuffmanInputStream his = new HuffmanInputStream(in);    // Step 1.
        HuffmanTree mainTree = 
                new HuffmanTree(his.getTree(), NON_LEAF);       // Step 1.
        this.totalChars = his.getTotalChars();                  // Step 2.
        decodeToFile(in, out, his, mainTree);                   // Steps 3-4.
        
        // DEBUG TOOLS:
        /*
        System.out.println(mainTree.toString());
        System.out.println(this.totalChars);
        */
    }
    
    //*** Methods/Functions ***
    /**
     * Decode the input file into the output file using a HuffmanTree.
     * 
     * @param in - The input file (to be decoded).
     * @param out - The output file (decoded file).
     * @param his - {@code HuffmanInputStream} object. Can be set to {@code null} 
     *          to create a new {@code HuffmanInputStream} object.
     * @param mainTree - The {@code HuffmanTree} to use when decoding.
     */
    private void decodeToFile(String in, String out, 
                              HuffmanInputStream his, HuffmanTree mainTree) {
        try {
            if (his == null) his = new HuffmanInputStream(in);
            
            BufferedWriter bw = new BufferedWriter(new FileWriter(out));
            
            while (this.totalChars > 0) {
                int bit = his.readBit();
                
                //System.out.println("totalChars: " + this.totalChars);
                //System.out.println("bit: " + bit);
                
                if (bit == 0) {
                    mainTree.moveToLeft();
                } else if (bit == 1) {
                    mainTree.moveToRight();
                } else {
                    System.out.println("Error: Invalid bit detected. Ask the creator to fix.");
                    System.exit(-1);
                }
                
                if (mainTree.atLeaf()) {
                    bw.write(mainTree.current());
                    this.totalChars--;
                    mainTree.moveToRoot();
                }
            }
            
            his.close();
            bw.close();
            
        } catch (IOException e) {
            if (his != null) his.close();
            e.printStackTrace();
            System.exit(-1);
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Main.
    /**
     * This is the Main program. It will take 2 command line arguments. <br>
     * The first argument is an input file's location. <br>
     * The second argument is an output file's location. <br>
     * <br>
     * The input file will be decompressed using the Huffman Decoding
     * Algorithm. The result is the uncompressed output file. <br>
     * 
     * @param args - Argument 1 will take the location of an input file that will be 
     *              decompressed.<br>
     *             - Argument 2 will take the location of an output file that is the 
     *              result of being uncompressed.<br>
     */
    public static void main(String args[]) {
        System.out.println("*** " + HuffmanDecode.class.getCanonicalName() + " ***");
        System.out.println();
        System.out.println("*** Start ***");
        
        // Check arguments.
        if (args.length == 2) {
            System.out.println("\tDecoding File: \"" + args[0] + "\" --> \""
                    + args[1] + "\"");
            System.out.println("\tWaiting to finish...");
            
            //***** Start decoding here. *****
            new HuffmanDecode(args[0], args[1]);
            
        } else {
            System.out.println("Error: The command line arguments are not correct. "
                    + "Please enter the locations of an input file and an output file "
                    + "into the command line.");
            System.exit(-1);
        }
        
        System.out.println("*** Success/End ***");
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////

}