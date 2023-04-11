// 
// BitOutputStream.java
// Created by: Kong Jimmy Vang
// Date Created: 3/6/2018
// 

import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Opens a output stream and stores individual bits to a particular file.
 * @author Kong Jimmy Vang
 */
public class BitOutputStream {
    
    // Fields
    protected DataOutputStream d;
    protected int b;
    protected int i;
    
    // Constructors
    public BitOutputStream(String filename) {
        try {
            this.d = new DataOutputStream(new FileOutputStream(filename));
            this.b = 0;
            this.i = 1;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Methods/Functions
    /**
     * Pre-condition: The {@code bit} is a '0' or a '1'. <br><br>
     * 
     * Writes a single bit to the constructor-given 'filename'.
     * 
     * @param bit - The bit to write into a file. (0 or 1)
     */
    public void writeBit(char bit) {
        try {
            if (bit != '0' && bit != '1'
                    && (int)bit != 0 && (int)bit != 1) {
                System.out.println("'writeBit()' was called incorrectly."
                        + " The bit must be a '0' or a '1'."
                        + " (The Bit that is causing the error: " + ((int) bit) + ")"
                        + " ");
                return;
            }
            
            //System.out.println("BIT" + bit);
            int iBit = bit;
            if (bit == '0') iBit = 0;
            else if (bit == '1') iBit = 1;
            
            //System.out.println(i);
            if (i == 1 || i % 8 != 0) {
                b = b*2 + iBit;
            } else {
                b = b*2 + iBit;
                //System.out.println(Integer.toBinaryString(b));
                this.d.writeByte(b);
                b = 0;
            }
            
            //System.out.println(Integer.toBinaryString(b));
            
            i++;
            
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }

    /**
     * Finish writing to the output file, then close the 
     * DataOutputStream stream {@code d} and 
     * close the BitOutputStream.
     */
    public void close() {
        boolean isDone = false;
        while (isDone == false) {
            if (i % 8 == 0) isDone = true;
            writeBit('0');
        }
        
        try {
            d.close();
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }
    
}