
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

/* MIPS_TraceDecoder.java
 * 
 * The purpose of {@code MIPS_InstructionDecoder} is to be able to decode MIPS instructions and output statistics
 * about what was executed.
 * 
 * Created By: Kong Jimmy Vang
 */

/**
 * The purpose of {@code MipsInstructionDecode.java} is to be able to decode MIPS instructions and output statistics
 * about what was executed.
 * 
 * @author Kong Jimmy Vang
 * @version 1.0
 */
public class MipsInstructionDecode {
    
    /** The input file this class will use. */
    private File inputFile;
    private String strInputFile = "";
    private String strLastInputFile = "";
    
    /** The output file this class will use. */
    private File outputFile;
    
    /** This Scanner object is used to read files. */
    private Scanner scanner;
    
    /** This PrintWriter object is used to write files. */
    private PrintWriter printWriter;
    
    // Statistics variables.
    private String          statistics          = "";
    protected int           numOfInsts          = 0;
    protected int           numOfRType          = 0;
    protected int           numOfIType          = 0;
    protected int           numOfJType          = 0;
    protected int           numOfFwdTaken       = 0;
    protected int           numOfBkwTaken       = 0;
    protected int           numOfNotTaken       = 0;
    protected int           numOfLoads          = 0;
    protected int           numOfStores         = 0;
    final protected int[]   numOfRegisterReads  = new int[32];
    final protected int[]   numOfRegisterWrites = new int[32];
    
    
    /**
     * 
     */
    public MipsInstructionDecode() {
        this.setInputFile(new File("./src/trace.txt"));
        this.setOutputFile(new File("./src/statistics.txt"));
    }
    
    public String toString () {
        return "Input File:"
                + "\nthis.getInput() + "
                + "\n"
                + "\nStatistics:"
                + "\n" + this.getStats();
    }
    
    /**
     * 
     * @throws IOException
     */
    protected void decodeSingleInstruction(int pc, int instruction) throws IOException {
        File inputFile = new File("./src/temp_single_instruction.txt");
        this.printWriter = new PrintWriter(inputFile);
        
        String strPc = Integer.toHexString(pc);
        String strInstruction = Integer.toHexString(instruction);
        this.printWriter.println(strPc + " " + strInstruction);
        this.printWriter.close();
        
        decode(inputFile);
    }
    
    protected void decodeMultipleInstructions(int[] pc, int[] instruction) throws IOException {
        File inputFile = new File("./src/temp_multiple_instructions.txt");
        this.printWriter = new PrintWriter(inputFile);
        
        int i = 0;
        int j = 0;
        while (i < pc.length && j < instruction.length) {
            String strPc = Integer.toHexString(pc[i]);
            String strInstruction = Integer.toHexString(instruction[j]);
            this.printWriter.println(strPc + " " + strInstruction);
            i++;
            j++;
        }
        
        this.printWriter.close();
        
        decode(inputFile);
    }
    
    /**
     * Decodes a set of the Dynamic Instructions from an {@code inputFile}.
     * The {@code inputFile} must be readable and must be a valid file type.
     * 
     * The input consist of a text file with <PC, instruction> pairs.
     * 
     * Example: 
     *      PC      Instruction
     *      00401038 00134880
     *      0040103c 01364820
     *      00401040 8d280000
     * 
     * @param inputFile - The file that will be read.
     * @throws IOException Signals that an I/O exception of some sort has occurred. 
     * This class is the general class of exceptions produced by failed or interrupted 
     * I/O operations.
     */
    public void decode(File inputFile) throws IOException, NumberFormatException {
        
        // Get the file.
        this.inputFile = inputFile;
        
        // Reset all current statistics.
        this.resetStats();
        
        // Check file and properly handle possible problems.
        if (!this.inputFile.exists()) {
            throw new IOException(
                    "The file \"" + this.inputFile.getName() + "\" does not exist at the directory "
                            + "\"" + this.inputFile.getCanonicalPath()
                            .substring(
                                    0, (int) this.inputFile.getCanonicalPath().length() - this.inputFile.getName().length() - 1) 
                            + "\".");
        }
        if (!this.inputFile.isFile()) {
            throw new IOException(
                    "The file \"" + this.inputFile.getName() + "\" is not a file.");
        }
        if (!this.inputFile.canExecute()) {
            throw new IOException(
                    "The file \"" + this.inputFile.getName() + "\" cannot be executed.");
        }
        if (!this.inputFile.canRead()) {
            throw new IOException(
                    "The file \"" + this.inputFile.getName() + "\" cannot be read from.");
        } 
        if (!this.inputFile.canWrite()) {
            throw new IOException(
                    "The file \"" + this.inputFile.getName() + "\" cannot be written to.");
        }
        
        // Check file and properly handle possible problems.
        if (!this.outputFile.exists()) {
            throw new IOException(
                    "The file \"" + this.outputFile.getName() + "\" does not exist at the directory "
                            + "\"" + this.outputFile.getCanonicalPath()
                            .substring(
                                    0, (int) this.outputFile.getCanonicalPath().length() - this.outputFile.getName().length() - 1) 
                            + "\".");
        }
        if (!this.outputFile.isFile()) {
            throw new IOException(
                    "The file \"" + this.outputFile.getName() + "\" is not a file.");
        }
        if (!this.outputFile.canExecute()) {
            throw new IOException(
                    "The file \"" + this.outputFile.getName() + "\" cannot be executed.");
        }
        if (!this.outputFile.canRead()) {
            throw new IOException(
                    "The file \"" + this.outputFile.getName() + "\" cannot be read from.");
        } 
        if (!this.outputFile.canWrite()) {
            throw new IOException(
                    "The file \"" + this.outputFile.getName() + "\" cannot be written to.");
        }
        
        //*** Scan the file for <PC, Instruction> pairs. ***
        scanner = new Scanner(this.inputFile);
        
        // Push the old input string into "strLastInputFile".
        this.strLastInputFile = this.strInputFile;
        
        // Reset and Create variables.
        this.strInputFile = "";
        String strInputFileTemp = "";
        String[] strSplit = null;
        
        // Build the String.
        while (scanner.hasNextLine()) {
            String strCurrent = scanner.nextLine();
            strInputFileTemp += strCurrent + " ";
            this.strInputFile += strCurrent + " \n";
        }
        
        // Split the instructions into decodable parts.
        strSplit = strInputFileTemp.split(" ");
        
        // Attempt to decode the dynamic trace instructions.
        int i = 0;
        try {
            while (i < strSplit.length) {
                
                //*** Setup Addresses and Instructions. ***
                String strCurrentHexAddress = strSplit[i];
                String strCurrentHexInstruction = strSplit[i+1];
                
                int currentAddress      = (int) Long.parseLong(strCurrentHexAddress, 16);
                int currentInstruction  = (int) Long.parseLong(strCurrentHexInstruction, 16);
                
                String strNextAddress   = "XXXXXXXX";
                int nextAddress = 0;
                
                if (i+2 < strSplit.length) {
                    strNextAddress = strSplit[i+2];
                    nextAddress = (int) Long.parseLong(strNextAddress, 16);
                }
                
                //System.out.print(strCurrentHexAddress + ", " + strCurrentHexInstruction + ", " + strNextAddress + ", ");
                
                //*** Decode Opcode. ***
                // 1111 1100 0000 0000 0000 0000 0000 0000
                int opcode = currentInstruction >>> 26;
                //System.out.print(Integer.toHexString(opcode) + ", ");
                
                //*** Decode R type instructions. ***
                if (opcode == 0x0
                        || opcode == 0x10) {
                    
                    // Decode rs.
                    // 0000 0011 1110 0000 0000 0000 0000 0000
                    int rs = (currentInstruction & 0x03E00000) >>> 21;
                    //System.out.print((rs) + ", ");
                    
                    // Decode rt.
                    // 0000 0000 0001 1111 0000 0000 0000 0000
                    int rt = (currentInstruction & 0x001F0000) >>> 16 ;
                    //System.out.print((rt) + ", ");
                    
                    // Decode rd.0040007C 2949000F
                    // 0000 0000 0000 0000 1111 1000 0000 0000
                    int rd = (currentInstruction & 0x0000F800) >>> 11;
                    //System.out.print((rd) + ", ");
                    
                    // Decode shamt.
                    // 0000 0000 0000 0000 0000 0111 1100 0000
                    int shamt = (currentInstruction & 0x000007c0) >>> 6;
                    //System.out.print((shamt) + ", ");
                    
                    // Decode funct.
                    // 0000 0000 0000 0000 0000 0000 0011 1111
                    int funct = (currentInstruction & 0x0000003F);
                    //System.out.print(Integer.toHexString(funct) + ", R-Type ");
                    
                    /////////////////////////////////////////////
                    // Count number of register reads and writes.
                    if ((opcode == 0x0 && funct == 0x20)
                            || (opcode == 0x0 && funct == 0x21)
                            || (opcode == 0x0 && funct == 0x24)
                            || (opcode == 0x0 && funct == 0x27)
                            || (opcode == 0x0 && funct == 0x25)
                            || (opcode == 0x0 && funct == 0x2A)
                            || (opcode == 0x0 && funct == 0x2B)
                            || (opcode == 0x0 && funct == 0x22)
                            || (opcode == 0x0 && funct == 0x23)) {
                        this.numOfRegisterReads[rs]++;
                        this.numOfRegisterReads[rt]++;
                        this.numOfRegisterWrites[rd]++;
                    }
                    else if (opcode == 0x0 && funct == 0x8) {
                        this.numOfRegisterReads[rs]++;
                        
                        //////////////////////////////////
                        // Count stats of jr Jumps.
                        int targetAddress = (nextAddress + 4) << 2;
                        
                        // Check for fwd-taken jumps.
                        if (targetAddress > currentAddress + 4) {
                            this.numOfFwdTaken++;
                        }

                        // Check for bkw-taken jumps.
                        else if (targetAddress < currentAddress + 4) {
                            this.numOfBkwTaken++;
                        }
                        
                    }
                    else if ((opcode == 0x0 && funct == 0x00)
                            || (opcode == 0x0 && funct == 0x02)
                            || (opcode == 0x0 && funct == 0x3)) {
                        this.numOfRegisterReads[rt]++;
                        this.numOfRegisterWrites[rd]++;
                    }
                    else if ((opcode == 0x0 && funct == 0x1A)
                            || (opcode == 0x0 && funct == 0x1B)
                            || (opcode == 0x0 && funct == 0x18)
                            || (opcode == 0x0 && funct == 0x19)) {
                        this.numOfRegisterReads[rs]++;
                        this.numOfRegisterReads[rt]++;
                    }
                    else if ((opcode == 0x0 && funct == 0x10)
                            || (opcode == 0x0 && funct == 0x12)) {
                        this.numOfRegisterWrites[rd]++;
                    }
                    else if ((opcode == 0x10 && funct == 0x0)) {
                        this.numOfRegisterReads[rs]++;
                        this.numOfRegisterWrites[rd]++;
                    }
                    
                    // Increment R-type counter.
                    this.numOfRType++;
                } 
                
                //*** Decode I type instructions. ***
                else if (opcode != 0x0
                        && opcode != 0x2 
                        && opcode != 0x3) {
                    
                    // Decode rs.
                    // 0000 0011 1110 0000 0000 0000 0000 0000
                    int rs = (currentInstruction & 0x03E00000) >>> 21;
                    //System.out.print((rs) + "rs, ");
                    
                    // Decode rt.
                    // 0000 0000 0001 1111 0000 0000 0000 0000
                    int rt = (currentInstruction & 0x001F0000) >>> 16 ;
                    //System.out.print((rt) + "rt, ");
                    
                    // Decode immediate.
                    // 0000 0000 0000 0000 1111 1111 1111 1111
                    int immediate = (currentInstruction & 0x0000FFFF);
                    //System.out.print((immediate) + ", I-Type, ");
                    
                    /////////////////////////////////////////////
                    // Count number of register reads and writes.
                    if (opcode == 0x8
                            || opcode == 0x9
                            || opcode == 0xC
                            || opcode == 0x24
                            || opcode == 0x25
                            || opcode == 0x30
                            || opcode == 0x23
                            || opcode == 0xD
                            || opcode == 0xA
                            || opcode == 0xB
                            || opcode == 0x31
                            || opcode == 0x35
                            || opcode == 0x39
                            || opcode == 0x3D) {
                        this.numOfRegisterReads[rs]++;
                        this.numOfRegisterWrites[rt]++;
                    }
                    else if (opcode == 0x4
                            || opcode == 0x5
                            || opcode == 0x28
                            || opcode == 0x38
                            || opcode == 0x29
                            || opcode == 0x2B) {
                        this.numOfRegisterReads[rs]++;
                        this.numOfRegisterReads[rt]++;
                    }
                    else if (opcode == 0xF) {
                        this.numOfRegisterWrites[rt]++;
                    }
                    
                    ///////////////////////////////////
                    // Check for the number of:
                    //      forward taken branches.
                    //      backward taken branches.
                    //      not-taken branches.
                    
                    // Get branch address
                    // BranchAddress = SignExtImm x 4
                    int branchAddress = immediate * 4;
                    //System.out.print(", branchA: " + Integer.toHexString(branchAddress) + "");
                    
                    // Setup target address.
                    // PC=PC+4+BranchAddress
                    int targetAddress = currentAddress + 4 + branchAddress;
                    //System.out.print(", targetA: " + Integer.toHexString(targetAddress) + "");
                    
                    
                    ///////////////////////////
                    // Count branching stats.
                    
                    // Branch On Equal.
                    if (opcode == 0x4) {
                        
                        // Check for not-taken branches.
                        if (nextAddress == currentAddress + 4) {
                            // Increment not-taken counter.
                            this.numOfNotTaken++;
                        }
                        
                        // Check for fwd-taken branches.
                        else if (targetAddress > currentAddress + 4) {
                            this.numOfFwdTaken++;
                        }
                        
                        // Check for bkw-taken branches.
                        else if (targetAddress < currentAddress + 4) {
                            this.numOfBkwTaken++;
                        }
                    }
                    
                    // Branch On Not Equal.
                    if (opcode == 0x5) {
    
                        // Check for not-taken branches.
                        if (nextAddress == currentAddress + 4) {
                            // Increment not-taken counter.
                            this.numOfNotTaken++;
                        }
                        
                        // Check for fwd-taken branches.
                        else if (targetAddress > currentAddress + 4) {
                            this.numOfFwdTaken++;
                        }
                        
                        // Check for bkw-taken branches.
                        else if (targetAddress < currentAddress + 4) {
                            this.numOfBkwTaken++;
                        }
                    }
                    
                    // Load instructions.
                    if (opcode == 0x24
                            || opcode == 0x25
                            || opcode == 0x30
                            || opcode == 0xF
                            || opcode == 0x23
                            || opcode == 0x31
                            || opcode == 0x35) {
                        this.numOfLoads++;
                    }
                    
                    // Store instructions.
                    if (opcode == 0x28
                            || opcode == 0x38
                            || opcode == 0x29
                            || opcode == 0x2B
                            || opcode == 0x39
                            || opcode == 0x3D) {
                        this.numOfStores++;
                    }
                    
                    // Increment I-type counter.
                    this.numOfIType++;
                }
                
                //*** Decode J type instructions. ***
                else if (opcode == 0x2 
                        || opcode == 0x3) {
                    
                    // Decode address
                    // 0000 0011 1111 1111 1111 1111 1111 1111
                    int address = (currentInstruction & 0x03FFFFFF);
                    //System.out.print(Integer.toHexString(address) + ", J-Type ");
                    
                    ///////////////////////////////////
                    // Check for the number of:
                    //      forward taken jumps.
                    //      backward taken jumps.
                    
                    // Setup jump address.
                    int jumpAddress = (address + 4) << 2;
                    //System.out.print(", jumpA: " + Integer.toHexString(jumpAddress) + "");
                    
                    // Setup target address.
                    int targetAddress = jumpAddress;
                    //System.out.print(", targetA: " + Integer.toHexString(targetAddress) + "");
                    
                    //////////////////////////////////
                    // Count stats of j and jal Jumps.
                    if (opcode == 0x2 || opcode == 0x3) {
                        // Check for fwd-taken jumps.
                        if (targetAddress > currentAddress + 4) {
                            this.numOfFwdTaken++;
                        }
                        
                        // Check for bkw-taken jumps.
                        else if (targetAddress < currentAddress + 4) {
                            this.numOfBkwTaken++;
                        }
                        
                    }
                    
                    // Increment J-type counter.
                    this.numOfJType++;
                }
                
                // Increment instructions counter.
                this.numOfInsts++;
                
                // Increment loop counter by 2.
                i += 2;
                
                //System.out.println();
            }
            
            // Store stats.
            this.setStats();
            
        } catch (IndexOutOfBoundsException e){
            throw new IndexOutOfBoundsException(
                    "The format of the input file is incorrect and cannot be decoded. "
                    + "The correct format on each line should be: <PC, Instruction>.");
        } catch (NumberFormatException e){
            throw new NumberFormatException(
                    "The format of the input file is incorrect and cannot be decoded. "
                    + "The correct format on each line should be: <PC, Instruction>.");
        } catch (Exception e) {
            throw e;
        }
    }
    
    protected void saveStatsToFile(File outputFile) throws IOException {
        
        String outputFileName = outputFile.getName();
        
        if (!outputFileName.substring(outputFileName.length() - 4, outputFileName.length()).contains(".txt")) {
            throw new IOException(
                    "The output file \"" + outputFileName + "\" is not a text file. Please select/type in a valid text file.");
        }
        
        if (!outputFile.exists()) {
            outputFile.createNewFile();
        }
        
        printWriter = new PrintWriter(outputFile);
        
        printWriter.println(this.getStats());
        
        printWriter.close();
        
        this.outputFile = outputFile;
    }
    
    protected String getInputString() {
        return this.strInputFile;
    }
    
    protected String getLastInputString() {
        return this.strLastInputFile;
    }
    
    protected void setStats() {
        this.statistics = 
                "insts: " + this.numOfInsts + "\r\n" + 
                "r-type: " + this.numOfRType + "\r\n" + 
                "i-type: " + this.numOfIType + "\r\n" + 
                "j-type: " + this.numOfJType + "\r\n" + 
                "fwd-taken: " + this.numOfFwdTaken + "\r\n" + 
                "bkw-taken: " + this.numOfBkwTaken + "\r\n" + 
                "not-taken: " + this.numOfNotTaken + "\r\n" + 
                "loads: " + this.numOfLoads + "\r\n" + 
                "stores: " + this.numOfStores + "\r\n";
        
        for (int i = 0; 
                i < this.numOfRegisterReads.length && i < this.numOfRegisterWrites.length;
                i++) {
            
            this.statistics += "reg-" + i + ": " 
                        + this.numOfRegisterReads[i] + " " + this.numOfRegisterWrites[i];
            
            if (i != this.numOfRegisterReads.length - 1 || i != this.numOfRegisterWrites.length - 1) {
                this.statistics += "\r\n";
            }
        }
    }
    
    protected String getStats() {
        return this.statistics;
    }
    
    protected String resetStats() {
        String statistics = getStats();
        
        this.numOfInsts          = 0;
        this.numOfRType          = 0;
        this.numOfIType          = 0;
        this.numOfJType          = 0;
        this.numOfFwdTaken       = 0;
        this.numOfBkwTaken       = 0;
        this.numOfNotTaken       = 0;
        this.numOfLoads          = 0;
        this.numOfStores         = 0;
        for (int i = 0; 
                i < this.numOfRegisterReads.length && i < this.numOfRegisterWrites.length;
                i++) {
            this.numOfRegisterReads[i] = 0;
            this.numOfRegisterWrites[i] = 0;
        }
        
        this.statistics = "";
        
        return statistics;
    }
    
    protected File getInputFile() {
        return inputFile;
    }

    private void setInputFile(File inputFile) {
        this.inputFile = inputFile;
    }

    protected File getOutputFile() {
        return outputFile;
    }

    private void setOutputFile(File outputFile) {
        this.outputFile = outputFile;
    }

    private int convertHexToBinaryInt(String strHex) {
        long binary = Long.parseLong(strHex, 16);
        return (int) binary;
    }
    
    private int convertBinaryToHexInt(String strBinary) {
        long hex = Long.parseLong(strBinary, 2);
        return (int) hex;
    }
   
}
