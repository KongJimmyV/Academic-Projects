// 
// BitInputStream.java
// Created by: Kong Jimmy Vang
// Date Created: 3/6/2018
// 

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * Opens an input stream and reads individual bits from a particular file.
 * @author Kong Jimmy Vang
 */
public class BitInputStream {
    
    // Fields
    protected DataInputStream d;
    private int b;
    private int i;
    
    // Constructors
    public BitInputStream(String filename) {
        try {
            this.d = new DataInputStream(new FileInputStream(filename));
            this.b = 0;
            this.i = 0;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    // Methods/Functions
    /**
     * Return the next bit in the file.
     * @return Return the next bit in the file.
     */
    public int readBit() {
        int lowerBit = 0;
        
        try {
            // Load a Byte into b and read each individual bit from left to right.
            //      To do this using the mod function, the order of the 
            //      bits must be reversed. This allows the bits to be 
            //      read in the correct order when using the mod function (b % 2).
            //      
            //      EX: (b is an integer)
            //          b = readUnsignedByte() 
            //          
            //          00000000 00000000 00000000 10110110
            //                      | Integer.reverse(b) |
            //          01101101 00000000 00000000 00000000
            //                      | Shift >>> 24 |
            //          00000000 00000000 00000000 01101101
            if (i == 0 || i % 8 == 0) {
                b = this.d.readUnsignedByte();  // Read an unsigned byte byte.
                b = Integer.reverse(b);         // Reverse Integer byte.
                b = b >>> (Integer.SIZE - 8);   // Performed an Unsigned Shift the 24 bytes right >>>.
            }
            
            //System.out.println(i + " : " + Integer.toBinaryString(b));
            
            // Extract/Get the lower bit.
            lowerBit = b % 2;
            
            // Shift the bits right.
            b = b / 2;
            
            // Move to the next bit. (Increment i).
            i++;
            
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(-1);
        }
        
        // Return the extracted lower bit.
        return lowerBit;
    }

    /**
     * Close the DataInputStream stream {@code d}
     * and close the BitInputStream.
     */
    public void close() {
        try {
            d.close();
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }
}