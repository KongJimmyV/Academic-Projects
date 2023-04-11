import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Modifier;

import static org.junit.Assert.*;
import org.junit.Test;

public class JUnitTester {

    @Test()
    public void testDecode() {
        try {
            MipsInstructionDecode decoder = new MipsInstructionDecode();
            File inputFile = new File("./src/trace.txt");
            File outputFile = new File("./src/statistics.txt");
            //System.out.println(in.getCanonicalPath());

            decoder.decode(inputFile);
            System.out.println(decoder.getStats());
            
            decoder.saveStatsToFile(outputFile);
            
        } catch (IOException e) {
            System.err.println("EXCEPTION: " + e.getMessage());
            fail("An exception should not occur: " + e);
        } catch (Exception e) {
            e.printStackTrace();
            fail("An exception should not occur: " + e);
            System.exit(-1);
        }
    }
    
    @Test()
    public void testDecodeSingleAndMultipleInstructions() {
        try {
            // Create the pc and instructions.
            String strInput = 
                    "00400000 014B4820\r\n" + 
                    "00400004 21490010\r\n" + 
                    "00400008 25490010\r\n" + 
                    "0040000C 014B4821\r\n" + 
                    "00400010 014B4824\r\n" + 
                    "00400014 31490010\r\n" + 
                    "00400018 112A0012\r\n" + 
                    "0040001C 112A0012\r\n" + 
                    "00400028 152A0012\r\n" + 
                    "0040002C 152A0012\r\n" + 
                    "00400038 08000008\r\n" + 
                    "00400044 0C000008\r\n" + 
                    "00400050 01200008\r\n" + 
                    "0040005C 91490000\r\n" + 
                    "00400060 C1490000\r\n" + 
                    "00400064 3C090012\r\n" + 
                    "00400068 8D490000\r\n" + 
                    "0040006C 014B4827\r\n" + 
                    "00400070 014B4825\r\n" + 
                    "00400074 3549000F\r\n" + 
                    "00400078 014B482A\r\n" + 
                    "0040007C 41404800\r\n" + 
                    "00400080 2D49000F\r\n" + 
                    "00400084 014B482B\r\n" + 
                    "00400088 000A4840\r\n" + 
                    "0040008C 000A4842\r\n" + 
                    "00400090 A1490000\r\n" + 
                    "00400094 E1490000\r\n" + 
                    "00400098 A5490000\r\n" + 
                    "0040009C AD490000\r\n" + 
                    "004000A0 014B4822\r\n" + 
                    "004000A4 014B4823\r\n" + 
                    "004000A8 012A001A\r\n" + 
                    "004000AC 012A001B\r\n" + 
                    "004000B0 C5490000\r\n" + 
                    "004000B4 D5490000\r\n" + 
                    "004000B8 00004810\r\n" + 
                    "004000BC 00004812\r\n" + 
                    "004000C0 29495000\r\n" + 
                    "004000C4 012A0018\r\n" + 
                    "004000C8 012A0019\r\n" + 
                    "004000CC 000A4843\r\n" + 
                    "004000D0 E5490000\r\n" + 
                    "004000D4 F5490000\r\n" + 
                    "004000D8 95490000";
            
            // Setup the decoder and files.
            MipsInstructionDecode decoder = new MipsInstructionDecode();
            File inputFile = new File("./src/trace_custom.txt");
            File outputFile = new File("./src/statistics.txt");
            //System.out.println(in.getCanonicalPath());
            
            // Recreate the input file.
            PrintWriter pw = new PrintWriter(inputFile);
            pw.println(strInput);
            pw.close();
            
            // Test the input.
            decoder.decode(inputFile);
            decoder.saveStatsToFile(outputFile);
            
            String expected = "insts: 45\r\n" + 
                    "r-type: 20\r\n" + 
                    "i-type: 23\r\n" + 
                    "j-type: 2\r\n" + 
                    "fwd-taken: 3\r\n" + 
                    "bkw-taken: 2\r\n" + 
                    "not-taken: 2\r\n" + 
                    "loads: 7\r\n" + 
                    "stores: 6\r\n" + 
                    "reg-0: 0 0\r\n" + 
                    "reg-1: 0 0\r\n" + 
                    "reg-2: 0 0\r\n" + 
                    "reg-3: 0 0\r\n" + 
                    "reg-4: 0 0\r\n" + 
                    "reg-5: 0 0\r\n" + 
                    "reg-6: 0 0\r\n" + 
                    "reg-7: 0 0\r\n" + 
                    "reg-8: 0 0\r\n" + 
                    "reg-9: 13 30\r\n" + 
                    "reg-10: 39 0\r\n" + 
                    "reg-11: 9 0\r\n" + 
                    "reg-12: 0 0\r\n" + 
                    "reg-13: 0 0\r\n" + 
                    "reg-14: 0 0\r\n" + 
                    "reg-15: 0 0\r\n" + 
                    "reg-16: 0 0\r\n" + 
                    "reg-17: 0 0\r\n" + 
                    "reg-18: 0 0\r\n" + 
                    "reg-19: 0 0\r\n" + 
                    "reg-20: 0 0\r\n" + 
                    "reg-21: 0 0\r\n" + 
                    "reg-22: 0 0\r\n" + 
                    "reg-23: 0 0\r\n" + 
                    "reg-24: 0 0\r\n" + 
                    "reg-25: 0 0\r\n" + 
                    "reg-26: 0 0\r\n" + 
                    "reg-27: 0 0\r\n" + 
                    "reg-28: 0 0\r\n" + 
                    "reg-29: 0 0\r\n" + 
                    "reg-30: 0 0\r\n" + 
                    "reg-31: 0 0";
            
            System.out.println("EXPECTED");
            System.out.println(expected);
            System.out.println("ACTUAL");
            System.out.println(decoder.getStats());
            assertEquals("The stats are wrong! ", expected, decoder.getStats());
            
        } catch (IOException e) {
            System.err.println("EXCEPTION: " + e.getMessage());
            fail("An exception should not occur: " + e);
        } catch (Exception e) {
            e.printStackTrace();
            fail("An exception should not occur: " + e);
            System.exit(-1);
        }
    }
}
