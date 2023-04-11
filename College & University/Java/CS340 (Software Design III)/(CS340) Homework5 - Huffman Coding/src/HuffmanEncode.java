// 
// HuffmanEncode.java
// Created by: Kong Jimmy Vang
// Date Created: 3/6/2018
// 

import java.io.*;
import java.util.*;

/**
 * {@code HuffmanEncode} uses the main method to encode an input file to
 * an output file. See the Javadoc of main ({@link #main}) for more info.
 * 
 * @see {@link #main}
 * @author Kong Jimmy Vang
 */
public class HuffmanEncode {
    
    //*** Fields ***
    private static final char NON_LEAF = 128;
    
    private PriorityQueue<HuffmanTreeComparable> hTreeCompPriQueue;
    private HashMap<Character, Integer> charFreqHMap;
    private HashMap<Character, String> encodingsHMap;
    private int totalChars;
    
    //*** Constructors ***
    /**
     * Implements the huffman encoding algorithm.
     * 
     * @param in - Input file location.
     * @param out - Output file location.
     */
    public HuffmanEncode(String in, String out) {
        //*** Start Huffman Encoding Algorithm Here. ***
        try {
            ////*** INPUTS *** (The input should be a text file.)
            ////*** PROGRAM *** (Encode)
            // 1: Find the frequencies of each unique character.
            // 2: Build a Huffman Tree from the frequency data.
            // 3: Build the encodings for each character found in the input file 
            //      by traversing the Huffman Tree.
            ////*** OUTPUTS *** (The output should ideally be a binary file that is smaller than the original text file.)
            // 4. Write a representation of the Huffman Tree to the output file.
            // 5. Write the number of characters in the input file to the output file.
            // 6. For each character in the input file, write the bits of the Huffman 
            //      encoding to the output file.
            
            this.charFreqHMap = new HashMap<>();
            this.encodingsHMap = new HashMap<>();
            this.totalChars = 0;
            findFrequencies(in);                        // Step 1.
            HuffmanTree mainTree = buildHuffmanTree();  // Step 2.
            buildEncodings(mainTree);                   // Step 3.
            encodeToFile(in, out, mainTree);            // Steps 4-6.
            
            // DEBUG TOOLS:
            /*
            for (Character c : charFreqMap.keySet()) {
                System.out.println(c + " " + charFreqMap.get(c));
            } 
            System.out.println();
            for (Character c : encodings.keySet()) {
                System.out.println(c + encodings.get(c));
            }
            System.out.println();
            System.out.println(mainTree.toString());
            */
            
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }
    
    //*** Methods/Functions ***
    /**
     * Find the frequencies of the characters in a particular file.
     * Store them in a character-frequency map, {@code charFreqMap}.
     * 
     * @param file - The particular file's location.
     * @throws IOException
     */
    private void findFrequencies(String file) throws IOException {
        BufferedReader br = new BufferedReader(new FileReader(file));
        int fileByte = br.read();
        while (fileByte != -1) {
            
            // Get the current character byte.
            Character c = (char) fileByte;
            totalChars++;
            
            // Store the characters and frequencies of each character.
            if (charFreqHMap.containsKey(c)) {
                // Update the existing character's frequency by +1.
                charFreqHMap.put(c, charFreqHMap.get(c) + 1);
            } else {
                // Add a new character to the map.
                charFreqHMap.put(c, 1);
            }
            
            // Read the next byte if possible.
            fileByte = br.read();
        }
        br.close();
    }
    
    /**
     * Build the encodings from a particular {@code tree} and
     * store them in the {@code encodings} HashMap.
     * 
     * @param tree - A particular tree to get encodings from.
     */
    private void buildEncodings(HuffmanTree tree) {
        Iterator<String> iter = tree.iterator();
        while (iter.hasNext()) {
            //System.out.println("INF LOOP TEST");
            String encode = iter.next();
            encodingsHMap.put(encode.charAt(0), encode.substring(1, encode.length()));
        }
    }
    
    /**
     * Builds a Huffman Tree using a priority queue and returns a new tree.
     * 
     * @return Returns the root of a new {@code HuffmanTree} object.
     */
    private HuffmanTree buildHuffmanTree() {
        
        //*** Build the PriorityQueue to store HuffmanTreeComparable objects.
        hTreeCompPriQueue = new PriorityQueue<>(this.totalChars);
        
        for (Character c : charFreqHMap.keySet()) {
            //System.out.println(c + " " + charFreqMap.get(c));
            hTreeCompPriQueue.add(
                    new HuffmanTreeComparable(
                            charFreqHMap.get(c), new HuffmanTree(c)));
        }
        //System.out.println();
        
        //*** Case 1: The input file contains more than 1 character.
        if (charFreqHMap.size() > 1) {
            while (hTreeCompPriQueue.size() > 1) {
                
                // Remove 2 comparable trees that contain the minimum frequencies
                // from the queue.
                HuffmanTreeComparable treeComp1 = hTreeCompPriQueue.poll();
                HuffmanTreeComparable treeComp2 = hTreeCompPriQueue.poll();
                HuffmanTree tree1 = treeComp1.huffmanTree;
                HuffmanTree tree2 = treeComp2.huffmanTree;
                
                // Attach "tree1" and "tree2" to a common "nonLeafRoot". 
                // ("tree1" is the left child of "nonLeafRoot", 
                // "tree2" is the right child of "nonLeafRoot".)
                HuffmanTree nonLeafRoot = new HuffmanTree(tree1, tree2, NON_LEAF);
                HuffmanTreeComparable nonLeafRootComp = 
                        new HuffmanTreeComparable(
                                treeComp1.frequency + treeComp2.frequency, nonLeafRoot);
                
                // Add the comparable tree "nonLeafRootComp" back to the list/queue.
                hTreeCompPriQueue.add(nonLeafRootComp);
            }
        } 
        
        //*** Case 2: The input file contains less than 1 character or only 1 character.
        else if (charFreqHMap.size() == 1) {
            // Remove the single tree.
            HuffmanTreeComparable childComp = hTreeCompPriQueue.poll();
            HuffmanTree child = childComp.huffmanTree;
            
            // Attach the characters to a Non Leaf node.
            HuffmanTree nonLeafRoot = new HuffmanTree(child, child, NON_LEAF);
            HuffmanTreeComparable nonLeafRootComp = 
                    new HuffmanTreeComparable(
                            childComp.frequency, nonLeafRoot);
            
            // Add the comparable tree "nonLeafRootComp" back to the list/queue.
            hTreeCompPriQueue.add(nonLeafRootComp);
        }
        
        //*** Case 3: The input file contains no characters.
        else {
            System.out.println("The input file contains no characters."
                    + " This is currently not supported");
            System.out.println("The encoding process will cancel early to prevent errors.");
            System.out.println("Exiting program...");
            System.exit(0);
        }
        
        //*** Return the completed/built HuffmanTree.
        return hTreeCompPriQueue.poll().huffmanTree;
    }

    /**
     * Encode the input file into the output file using a HuffmanTree.
     * 
     * @param in - Input file.
     * @param out - Output file.
     * @param mainTree - Huffman Tree used for encoding.
     * @throws IOException - Signals that an I/O exception of some sort has occurred. 
     *      This class is the general class of exceptions produced by failed or interrupted I/O operations.
     */
    private void encodeToFile(String in, String out, HuffmanTree mainTree) throws IOException {
        HuffmanOutputStream hos = 
                new HuffmanOutputStream(out, mainTree.toString(), totalChars);
        
        BufferedReader br = new BufferedReader(new FileReader(in));
        //HuffmanTree mainTree = new HuffmanTree(tree, NON_LEAF);
        
        int fileByte = br.read();
        while (fileByte != -1) {
            
            // Get current Character byte.
            Character c = (char) fileByte;
            
            // Write the encoding of "c" to the output file.
            String strEncoding = encodingsHMap.get(c);
            
            if (strEncoding == null) {
                System.out.println("ERROR: An encoding was not found. "
                        + "The \"encodings\" HashMap was not created correctly.");
                System.out.println("The program will now exit...");
                System.exit(0);
            }
            
            for (int i = 0; i < strEncoding.length(); i++) {
                hos.writeBit(strEncoding.charAt(i));
            }
            
            fileByte = br.read();
        }
        br.close();
        hos.close();
    }
    
    //*** Helper Classes
    /**
     * Helper class for {@code HuffmanTree} objects. <br><br>
     * 
     * Allows {@code HuffmanTree} objects to be comparable and allows each tree 
     * to be sorted by a priority queue with the minimum frequency being the
     * top priority in the queue. <br><br>
     * 
     * Stores a {@code frequency} of characters used in {@code tree} 
     * and stores a {@code HuffmanTree} object.
     */
    private class HuffmanTreeComparable implements Comparable<HuffmanTreeComparable> {
        private int frequency;
        private HuffmanTree huffmanTree;
        
        /**
         * Build a {@code HuffmanTreeComparable} object that stores
         *      a {@code frequency} int and the a {@code HuffmanTree} object.
         * @param freq - The frequency of characters used in {@code tree}.
         * @param tree - The {@code HuffmanTree} to be stored.
         */
        private HuffmanTreeComparable(int freq, HuffmanTree tree) {
            frequency = freq;
            huffmanTree = tree;
        }
        
        public int compareTo(HuffmanTreeComparable obj) {
            return frequency - obj.frequency;
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Main.
    /**
     * This is the Main program. It will take 2 command line arguments. <br>
     * The first argument is an input file's location. <br>
     * The second argument is an output file's location. <br>
     * <br>
     * The input file will be compressed using the Huffman Encoding Algorithm. The
     * result is the compressed output file. <br>
     * 
     * @param args - Argument 1 will take the location of an input file that will be
     *              compressed.<br>
     *             - Argument 2 will take the location of an output file that is the
     *              result of being compressed.<br>
     */
    public static void main(String args[]) {
        System.out.println("*** " + HuffmanEncode.class.getCanonicalName() + " ***");
        System.out.println();
        System.out.println("*** Start ***");

        // Check arguments.
        if (args.length == 2) {
            System.out.println("\tEncoding File: \"" + args[0] + "\" --> \"" + args[1] + "\"");
            System.out.println("\tWaiting to finish...");

            // ***** Start encoding here. *****
            new HuffmanEncode(args[0], args[1]);

        } else {
            System.out.println("Error: The command line arguments are not correct. "
                    + "Please enter the locations of an input file and an output file " + "into the command line.");
            System.exit(-1);
        }

        System.out.println("*** Success/End ***");
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
}