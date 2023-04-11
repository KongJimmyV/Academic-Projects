package CacheSimulator;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Scanner;

public class CacheSimulator {

    // Files.
    private FileLineReader parametersFileReader;
    private FileLineReader accessesFileReader;
    
    // Statistics
    private int numReadHits;
    private int numWriteHits;
    private int numReadMisses;
    private int numWriteMisses;
    private double hitRate;
    private int numWriteBacks;
    private int numWriteThroughs;
    
    // Configurations/Parameters
    private int cacheType;
    private int numOfOffsetBits;
    private int numOfIndexBits;
    private String allocationPolicy;
    private String writePolicy;
    
    // Best Configurations For High Hit-Rate Cache
    private int bestCacheType;
    private int bestOffsetBits;
    private int bestIndexBits;
    private String bestAllocationPolicy;
    private String bestWritePolicy;
    
    private int bestNumReadHits;
    private int bestNumWriteHits;
    private int bestNumReadMisses;
    private int bestNumWriteMisses;
    private double bestHitRate;
    private int bestNumWriteBacks;
    private int bestNumWriteThroughs;
    
    // Debug.
    private boolean debug = false;
    
    // User Interface
    private static boolean skip = true;
    private static boolean minimumUI = false;
    
    //************
    //*** MAIN ***
    public static void main(String[] args) {

        //*** Setup I/O and Other ***//
        Scanner input = new Scanner(System.in);
        boolean foundBestCache = false;
        int testCapacity = 8192;
        
        try {

            
            //*** Start Simulator ***//
            System.out.println( "____________________________________\n"
                            +   "------ Simple Cache Simulator ------");
            
            System.out.println();
            System.out.println("Welcome.");
            System.out.println();
            System.out.println("The Cache Simulator will complete 2 tasks of the following.");
            System.out.println("    #1. Test a cache, given the input files \"accesses.txt\" and \"parameters\".");
            System.out.println("    #2. Find a cache with the best hit-rate by searching for the best parameters using the ");
            System.out.println("        given file of \"accesses.txt\" and a capacity limit of " + testCapacity + " Bytes.");
            System.out.println();
            
            long startTime = 0;
            long endTime = 0;
            double elapsedTime = 0;
            
            CacheSimulator cSimulator = new CacheSimulator("parameters.txt", "accesses.txt");
            cSimulator.debug = false;
            
            System.out.println("*** Simulating Cache With Current Parameters ***");
//            System.out.println();
//            System.out.println("Parameters File Location:   " + cSimulator.parametersFileReader.getCanonicalFile().getParent());
//            System.out.println("Parameters File Name:       " + cSimulator.parametersFileReader.getCanonicalFile().getName());
//            System.out.println("Accesses File Location:     " + cSimulator.accessesFileReader.getCanonicalFile().getParent());
//            System.out.println("Accesses File Name:         " + cSimulator.accessesFileReader.getCanonicalFile().getName());
//            System.out.println();
            
            System.out.println("    Please Wait...");
            
            // Simulate a Cache with the given Parameters and Accesses.
            startTime = System.nanoTime();
            cSimulator.simulateCache();
            endTime = System.nanoTime();
            elapsedTime = endTime - startTime;
            elapsedTime = elapsedTime * Math.pow(10, -9);
                    
            // Print Results and Statistics.
            DecimalFormat df = new DecimalFormat("#0.000");
            System.out.println();
            System.out.println("=== Cache Statistics ===");
            System.out.println(cSimulator.getStats());
            System.out.println();
            System.out.println("*** Finished Simulating Cache ***");
            cSimulator.outputStats("statistics.txt");
//            System.out.println("The stats were succesfully stored into the file \"" 
//                    + cSimulator.accessesFileReader.getCanonicalFile().getName() + "\".");
//            System.out.println();
            System.out.println("Elapsed Time: " + df.format(elapsedTime) + " seconds");
//            System.out.println();
//            System.out.println("Program #1 is done.");
//            System.out.println();
            
            
            // USER PROMPT
            if (!skip) {
                System.out.println("Press Enter to start Program #2.");
                System.out.println("Or Type \"q\" and press Enter to quit.");
                inputChecker(input.nextLine());
            }
            
            System.out.print("----------------------------------------------------------");
            System.out.println("----------------------------------------------------------");
            System.out.println("        ***Write-Through is disabled for this program.***");
            System.out.println("*** Simulating Cache To Find Highest Hit Rate ***");
//            System.out.println("Capacity Limit:             " + testCapacity + " Bytes");
//            System.out.println("Parameters File Location:   " + cSimulator.parametersFileReader.getCanonicalFile().getParent());
//            System.out.println("Parameters File Name:       " + cSimulator.parametersFileReader.getCanonicalFile().getName());
//            System.out.println("Accesses File Location:     " + cSimulator.accessesFileReader.getCanonicalFile().getParent());
//            System.out.println("Accesses File Name:         " + cSimulator.accessesFileReader.getCanonicalFile().getName());
//            System.out.println();
            System.out.println("    Please Wait...");
            
            // Simulate the Best Cache using the given Accesses.
            startTime = System.nanoTime();
            foundBestCache = cSimulator.simulateBestCache(testCapacity, "accesses.txt");
            endTime = System.nanoTime();
            elapsedTime = endTime - startTime;
            elapsedTime = elapsedTime * Math.pow(10, -9);
            
            if(foundBestCache) {
                System.out.println("=== Best Cache Stats (With Highest Hit-Rate) ===");
                cSimulator.printBestCacheStats();
                System.out.println();
                System.out.println("=== Best Cache Parameters (With Highest Hit-Rate) ===");
                cSimulator.printBestCacheParameters();
                System.out.println();
                System.out.println("*** Finished Simulating Best Cache With Highest Hit Rate ***");
                System.out.println("Elapsed Time: " + df.format(elapsedTime) + " seconds");
            } else {
                System.out.println("=== Best Cache Stats (For Highest Hit-Rate) ===");
                System.out.println("No Cache was found to meet the capacity requirement of: " + testCapacity + " Bytes");
                System.out.println();
                System.out.println("=== Best Cache Parameters (For Highest Hit-Rate) ===");
                System.out.println("No Cache was found to meet the capacity requirement of: " + testCapacity + " Bytes");
                System.out.println();
                System.out.println("*** Finished Simulating Best Cache With Highest Hit Rate ***");
                System.out.println("Elapsed Time: " + df.format(elapsedTime) + " seconds");
            }
            
            System.out.println("__________________________________________________________");
            System.out.println("----------------------------------------------------------");
            System.out.println("The Cache Simulator has fully completed.");
            System.out.println();
            System.out.println("***********");
            System.out.println("*** END ***");
            
            // Close Stream
            input.close();
            
        } catch (IOException e) {
            //System.err.println("An exception has occured. (" + e.getMessage() + ")");
            input.close();
            e.printStackTrace();
            System.exit(-1);
        }
        
        // End of Main.
    }
        
    ////////////////////////////////////////////////////////////////////////////////////////
    
    //********************
    //*** Constructors ***
    public CacheSimulator(final String parameters, final String accesses) throws IOException {
        this.parametersFileReader = new FileLineReader(parameters);
        this.accessesFileReader = new FileLineReader(accesses);
        
        this.resetStats();
        this.resetBestCacheParameters();
        
        this.cacheType = Integer.parseInt(parametersFileReader.getLine(0));
        this.numOfOffsetBits = Integer.parseInt(parametersFileReader.getLine(1));
        this.numOfIndexBits = Integer.parseInt(parametersFileReader.getLine(2));
        this.allocationPolicy = parametersFileReader.getLine(3);
        this.writePolicy = parametersFileReader.getLine(4);
    }
    
    //*************************
    //*** Methods/Functions ***
    public static void inputChecker(final String input) {
        if(input.equalsIgnoreCase("quit") || input.equalsIgnoreCase("q")) 
            quit();
        if(input.equalsIgnoreCase("min") || input.equalsIgnoreCase("m")) 
            minimumUI = true;
        if(input.equalsIgnoreCase("skip") || input.equalsIgnoreCase("s")) 
            skip = true;
    }
    
    public static void quit() {
        System.out.println("***END***");
        System.exit(0);
    }
    
    /** Sort an ArrayList of Strings using selection sort. */
    public void selectionSort(final ArrayList<String> arrayList) {
        
        // Create Variables here.
        int smallestIndex = Integer.MAX_VALUE;
        
        // For all the values in this loop.
        for(int i = 0; i < arrayList.size(); i++) {
            
            // Initiate "smallestIndex" as "i".
            smallestIndex = i;
            
            // Find the smallest index in this nested-loop.
            for(int j = i; j < arrayList.size(); j++) {
                if(arrayList.get(j).split(" ", 1)[0]
                        .compareTo(arrayList.get(smallestIndex).split(" ", 1)[0]) < 0) {
                    smallestIndex = j;
                }
            }
            
            // Swap "i" and "smallestIndex".
            String temp = arrayList.get(i);
            arrayList.set(i, arrayList.get(smallestIndex));
            arrayList.set(smallestIndex, temp);
        }
    }

    public boolean simulateBestCache(final int capacity, final String accesses) throws IOException {
            
            // Reset parameters and stats for the caches.
            this.resetBestCacheParameters();
            this.resetStats();
            
            // Setup accesses.
            this.accessesFileReader = new FileLineReader(accesses);
            
    //        double log2Capacity = Logarithm.log2(capacity);
    //        int log2CapacityRounded = (int) Math.round(log2Capacity);
    //        capacity = (int) Math.pow(2, log2CapacityRounded);
            
            // Add All Possible Parameter Configurations to a list.
            ArrayList<String> listQueue = new ArrayList<String>(2*9*14*2*2);
            ArrayList<String> bestCaches = new ArrayList<String>();
            for (int cType = 1; cType <= 2; cType++) {
                for (int oBits = 2; oBits <= 9; oBits++) {
                    for (int iBits = 1; iBits <= 14; iBits++) {
                        
                        int testCapacity = (int) Math.pow(2, oBits) * (int) Math.pow(2, iBits);
//                        System.out.println("TESTCAP: " + testCapacity + " CAP: " + capacity + " | " + cType + " " + oBits + " " + iBits + " ");
                        if (testCapacity != capacity) {
                            continue;
                        }
                        
                        //System.out.println("QUEUED");
                        String str = "";
                        
                        str = cType + " " + oBits + " " + iBits + " " + "wa" + " wt";
                        listQueue.add(str);
                        str = cType + " " + oBits + " " + iBits + " " + "wna" + " wt";
                        listQueue.add(str);
                        str = cType + " " + oBits + " " + iBits + " " + "wa" + " wb";
                        listQueue.add(str);
                        str = cType + " " + oBits + " " + iBits + " " + "wna" + " wb";
                        listQueue.add(str);
                    }
                }
            }
            
            if(listQueue.isEmpty()) {
                return false;
            } else {
                while(!listQueue.isEmpty()) {
                    
                    String parameters = listQueue.remove(0);
                    //System.out.println("POLL: " + poll);
                    String[] parametersArr = parameters.split(" ");
                    
                    int cacheType = Integer.parseInt(parametersArr[0]);
                    int numOfOffsetBits = Integer.parseInt(parametersArr[1]);
                    int numOfIndexBits = Integer.parseInt(parametersArr[2]);
                    String allocationPolicy = parametersArr[3];
                    String writePolicy = parametersArr[4];
                    
                    setupCacheParameters(cacheType, numOfOffsetBits, numOfIndexBits, allocationPolicy, writePolicy);
                    simulateCache(accesses);
                    
                    //System.out.println("PARAMETERS: " + parameters + "   |   " + "HIT_RATE: " + this.hitRate + "   |   CAPACITY: " + capacity);
                    bestCaches.add(this.hitRate + " " + parameters);
                    
                    //printCacheWithBestHitRate();
                    boolean storeBestCache = false;
                    if (this.hitRate > this.bestHitRate) {
                        storeBestCache = true;
                    } else if (this.hitRate == this.bestHitRate
                            && this.numWriteBacks + this.numWriteThroughs < this.bestNumWriteBacks + this.bestNumWriteThroughs) {
                        storeBestCache = true;
                    }
                    
                    if (storeBestCache) {
                        this.bestNumReadHits = this.numReadHits;
                        this.bestNumWriteHits = this.numWriteHits;
                        this.bestNumReadMisses = this.numReadMisses;
                        this.bestNumWriteMisses = this.numWriteMisses;
                        this.bestHitRate = this.hitRate;
                        this.bestNumWriteBacks = this.numWriteBacks;
                        this.bestNumWriteThroughs = this.numWriteThroughs;
                        this.bestCacheType = cacheType;
                        this.bestOffsetBits = numOfOffsetBits;
                        this.bestIndexBits = numOfIndexBits;
                        this.bestAllocationPolicy = allocationPolicy;
                        this.bestWritePolicy = writePolicy;
                    }
                }
            }
            
            System.out.println();
            
            this.selectionSort(bestCaches);
            /*for(int i = bestCaches.size() - 1; i > bestCaches.size() - 4; i--) {
                System.out.println(bestCaches.get(i));
            }
            for(int i = bestCaches.size() - 1; i >= 0; i--) {
                System.out.println(bestCaches.get(i));
            }*/
            //System.out.println();
            return true;
        }

    public void simulateCache() throws IOException {
        simulateCache(this.accessesFileReader.getCanonicalPath());
    }

    public void simulateCache(final String accesses) throws IOException {
            
            // Reset The Stats.
            this.resetStats();
            
            // Read the files.
            this.accessesFileReader = new FileLineReader(accesses);
            
            // DEBUG: Check the data.
    //            for(int i = 0; i < parameters.getNumOfLines(); i++) {
    //                System.out.println(parameters.getIndexOfLines(i));
    //            }
    //            
    //            for(int i = 0; i < accesses.getNumOfLines(); i++) {
    //                System.out.println(accesses.getIndexOfLines(i));
    //            }
            
            // Setup the parameters.
            int cacheType = this.cacheType;
            int numOfOffsetBits = this.numOfOffsetBits;
            int numOfIndexBits = this.numOfIndexBits;
            String allocationPolicy = this.allocationPolicy;
            String writePolicy = this.writePolicy;
            
            //*** Prepare a new Cache for simulation. ***//
            Cache cache = null;
            
            // Setup a Direct-Mapped Cache.
            if (cacheType == 1) {
                DirectMappedCache directMappedCache = new DirectMappedCache(
                        numOfOffsetBits,
                        numOfIndexBits,
                        allocationPolicy,
                        writePolicy);
                cache = directMappedCache;
            } 
            
            // Setup a 2-Way Associative Cache.
            else if (cacheType >= 2) {
                NWayAssociativeCache nWayCache = new NWayAssociativeCache(
                        numOfOffsetBits,
                        numOfIndexBits,
                        allocationPolicy,
                        writePolicy,
                        "fifo",
                        cacheType);
                cache = nWayCache;
            }
            
            // Setup: Invalid Cache Type Detected.
            else {
                throw new IOException("Invalid cache type detected in the file \"" + parametersFileReader.getCanonicalFile().getName()
                        + "\". (PATH: \"" + parametersFileReader.getCanonicalFile().getCanonicalPath() + "\"");
            }
            //*** Start Cache Simulation ***//
            for(int i = 0; i < accessesFileReader.getNumOfLines(); i++) {
                
                String line = accessesFileReader.getLine(i);
                line = line.trim();
                
                if (line == null || "".equals(line)) {
                    continue;
                }
                
                String accessType = line.substring(0, 1);
                String fullAddress = line.substring(2, line.length());
                
                //*** Get Tag.
                String tag = cache.hexAddressToTag(fullAddress);
                
                //*** Get Index.
                int index = cache.hexAddressToIndex(fullAddress);
    
                //*** Get Offset.
                int offset = cache.hexAddressToOffset(fullAddress);
                
                //*** Check for Hits/Misses + Do Allocation/Write policies.
                // Hit tracker/boolean.
                boolean hit = false;
                
                // Get Cache allocation and write parameters.
                String cacheAllocationPolicy = cache.getAllocationPolicy();
                String cacheWritePolicy = cache.getWritePolicy();
                
                
                //------ Start Cache Handler.
                String cacheCurrentTag = cache.getTag(index);
                int cacheCurrentValidBit = cache.getValid(index);
                int cacheCurrentDirtyBit = cache.getDirty(index);
                
                
                //--- Hit logic.
                if (cacheCurrentTag != null 
                        && tag != null 
                        && cacheCurrentValidBit == 1
                        && cacheCurrentTag.equals(tag)) {
                    // Hit in the cache.
                    hit = true;
                } else {
                    // Miss in the cache.
                    hit = false;
                }
                
                
                //--- Allocation + Write logic.
                //= WRITE =
                boolean isBlockReplaced = false;
                if (accessType.equals("w")) {
                    
                    switch (cacheAllocationPolicy) {
                    case "wa":  // Write-Allocate
                        if (hit == false) {
                            cache.setCacheData(1, 1, tag, index);
                            isBlockReplaced = true;
                        }
                        break;
                    case "wna": // Write No-Allocate
                        break;
                    default:
                        throw new IOException("\"" + cacheAllocationPolicy + "\" is invalid."
                                + "The file \"" + parametersFileReader.getCanonicalFile().getName()
                                + "\" provided an incompatible allocation policy. "
                                + "(PATH: \"" + parametersFileReader.getCanonicalFile().getCanonicalPath() + "\"");
                    }
                    
                    switch (cacheWritePolicy) {
                    case "wt":  // Write-Through
                        if (hit == true && cacheCurrentDirtyBit == 1) {
                            this.numWriteThroughs++;
                        } else if (hit == false) {
                            this.numWriteThroughs++;
                        }
                        break;
                    case "wb":  // Write-Back
                        if (hit == false) {
                            if (cacheAllocationPolicy.equals("wna")) {
                                this.numWriteThroughs++;
                            }
                            if (isBlockReplaced == true) {
                                this.numWriteBacks++;
                            }
                        }
                        break;
                    default:
                        throw new IOException("\"" + cacheWritePolicy + "\" is invalid."
                                + "The file \"" + parametersFileReader.getCanonicalFile().getName()
                                + "\" provided an incompatible write policy. "
                                + "(PATH: \"" + parametersFileReader.getCanonicalFile().getCanonicalPath() + "\"");
                    }
                    
                } 
                //= READ =
                else if (accessType.equals("r")) {
                    if (hit == false) {
                        cache.setCacheData(1, 1, tag, index);
                        isBlockReplaced = true;
                    }
                } else {
                    throw new IOException("Invalid access type '" + accessType + "' in \"" 
                            + parametersFileReader.getCanonicalFile().getName() + " "
                            + "(PATH: \"" + parametersFileReader.getCanonicalFile().getCanonicalPath() + "\"");
                }
                
                //--- Add the number of hits/misses based on access type.
                if (accessType.equals("w")) {
                    if (hit)
                        this.numWriteHits++;
                    else
                        this.numWriteMisses++;
                } else if (accessType.equals("r")) {
                    if (hit)
                        this.numReadHits++;
                    else
                        this.numReadMisses++;
                } else {
                    throw new IOException("Invalid access type '" + accessType + "' in \"" 
                            + parametersFileReader.getCanonicalFile().getName() + " "
                            + "(PATH: \"" + parametersFileReader.getCanonicalFile().getCanonicalPath() + "\"");
                }
                
                //DEBUG:
                if (debug) {
                    System.out.print("TYPE: " + accessType + ", ");
                    System.out.print("ADDR: " + fullAddress + ", ");
                    System.out.print("TAG: " + tag + ", ");
                    System.out.print("INDEX: " + index + ", ");
                    System.out.print("OFFSET: " + offset + ", ");
                    System.out.print("HIT: " + hit + ", ");
                    System.out.print("REPLACED_BLOCK: " + isBlockReplaced + ". ");
                    System.out.println();
                }
                
            }
            // End of loop.
            
            // Calculate Hit Rate.
            this.hitRate = (double) (this.numReadHits + this.numWriteHits) 
                    / (this.numReadHits + this.numWriteHits + this.numReadMisses + this.numWriteMisses);
            
            // Round Hit Rate to 6 decimal places.
            DecimalFormat df = new DecimalFormat("#.000000");
            this.hitRate = Double.parseDouble(df.format(this.hitRate));
        }

    public void resetStats() {
        this.numReadHits = 0;
        this.numWriteHits = 0;
        this.numReadMisses = 0;
        this.numWriteMisses = 0;
        this.hitRate = 0.0;
        this.numWriteBacks = 0;
        this.numWriteThroughs = 0;
    }
    
    public String getStats() {
        String str = "rhits: " + this.numReadHits
                + "\nwhits: " + this.numWriteHits
                + "\nrmisses: " + this.numReadMisses
                + "\nwmisses: " + this.numWriteMisses
                + "\nhrate: " + this.hitRate
                + "\nwb: " + this.numWriteBacks
                + "\nwt: " + this.numWriteThroughs;
        return str;
    }
    
    public void printStats() {
        System.out.println(this.getStats());
    }
    
    public boolean outputStats(final String file) throws IOException {
        return outputStats(new File(file));
    }
    
    public boolean outputStats(final File file) throws IOException {
        if (!file.exists()) {
            file.createNewFile();
        }
        
        PrintWriter pw = new PrintWriter(file);
        pw.println("rhits: " + this.numReadHits);
        pw.println("whits: " + this.numWriteHits);
        pw.println("rmisses: " + this.numReadMisses);
        pw.println("wmisses: " + this.numWriteMisses);
        pw.println("hrate: " + this.hitRate);
        pw.println("wb: " + this.numWriteBacks);
        pw.println("wt: " + this.numWriteThroughs);
        pw.close();
        return !pw.checkError();
    }
    
    public boolean outputBestCacheParametersToFile(final String file) throws IOException {
        return outputBestCacheParametersToFile(new File(file));
    }

    public boolean outputBestCacheParametersToFile(final File file) throws IOException {
        if (!file.exists()) {
            file.createNewFile();
        }
        
        PrintWriter pw = new PrintWriter(file);
        pw.println("" + this.bestCacheType);
        pw.println("" + this.bestOffsetBits);
        pw.println("" + this.bestIndexBits);
        pw.println("" + this.bestAllocationPolicy);
        pw.println("" + this.bestWritePolicy);
        pw.close();
        return !pw.checkError();
    }

    private void setupCacheParameters(final int cacheType,
                            final int numOfOffsetBits,
                            final int numOfIndexBits,
                            final String allocationPolicy,
                            final String writePolicy) {
        
        this.cacheType = cacheType;
        this.numOfOffsetBits = numOfOffsetBits;
        this.numOfIndexBits = numOfIndexBits;
        this.allocationPolicy = allocationPolicy;
        this.writePolicy = writePolicy;
    }

    private void resetBestCacheParameters() {
        this.bestHitRate = 0;
        this.bestCacheType = 0;
        this.bestOffsetBits = 0;
        this.bestIndexBits = 0;
        this.bestAllocationPolicy = "N/A";
        this.bestWritePolicy = "N/A";
    }

    private String getBestCacheParameters() {
        String str = "" + this.bestCacheType + "  (Cache Type)\n"
                + "" + this.bestOffsetBits + "  (Offset Bits)\n"
                + "" + this.bestIndexBits + "  (Index Bits) \n"
                + "" + this.bestAllocationPolicy + "  (Allocation Policy)\n"
                + "" + this.bestWritePolicy + "  (Write Policy)";
        return str;
    }
    
    private void printBestCacheParameters() {
        System.out.println(this.getBestCacheParameters());
    }
    
    private String getBestCacheStats() {
        String str = "rhits: " + this.bestNumReadHits + "\n"
                + "whits: " + this.bestNumWriteHits + "\n"
                + "rmisses: " + this.bestNumReadMisses + "\n"
                + "wmisses: " + this.bestNumWriteMisses + "\n"
                + "hrate: " + this.bestHitRate + "\n"
                + "wb: " + this.bestNumWriteBacks + "\n"
                + "wt: " + this.bestNumWriteThroughs;
        return str;
    }
    
    private void printBestCacheStats() {
        System.out.println(this.getBestCacheStats());
    }
    
    private static class Logarithm {
        public static double logb(final double a, final double b) {
            return Math.log(a) / Math.log(b);
        }

        public static double log2(final double a) {
            return logb(a, 2);
        }
    }
}
