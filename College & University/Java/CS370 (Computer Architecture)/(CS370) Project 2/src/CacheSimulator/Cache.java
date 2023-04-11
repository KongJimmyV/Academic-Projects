package CacheSimulator;

public abstract class Cache {

    // Settings
    private int offsetBits;
    private int indexBits;
    private String allocationPolicy;
    private String writePolicy;
    private int tagBits;
    
    // Size
    private int blockSize;
    private int numOfSets;
    
    // Storage
    private CacheSet[] cacheSets;
    
    // System
    public final int SYSTEM_32_BIT = 32;
    public final int SYSTEM_64_BIT = 64;
    
    //*** Constructors ***//
    public Cache(final int offsetBits, 
            final int indexBits, 
            final String allocationPolicy, 
            final String writePolicy) {
        
        // Parameters
        this.offsetBits             = offsetBits;
        this.indexBits              = indexBits;
        this.allocationPolicy       = allocationPolicy;
        this.writePolicy            = writePolicy;
        
        // Misc
        this.tagBits                = SYSTEM_32_BIT - (offsetBits + indexBits);
        
        // Size
        this.blockSize              = (int) Math.pow(2, offsetBits);
        this.numOfSets              = (int) Math.pow(2, indexBits);
        
        // Storage
        this.cacheSets = new CacheSet[this.numOfSets];
        for (int i = 0; i < this.numOfSets; i++) {
            this.cacheSets[i] = new CacheSet();
        }
    }
   
    //*** Methods/Functions ***//
    protected String hexAddressToTag(String address) {
        return this.addressToTag(Integer.parseInt(address, 16));
    }
    protected String addressToTag(String address) {
        return this.addressToTag(Integer.parseInt(address));
    }
    private String addressToTag(int address) {
        address = address >>> this.getOffsetBits() + this.getIndexBits();
        return Integer.toHexString(address);
    }
    
    protected int hexAddressToOffset(String address) {
        return this.addressToOffset(Integer.parseInt(address, 16));
    }
    protected int addressToOffset(String address) {
        return this.addressToOffset(Integer.parseInt(address));
    }
    private int addressToOffset(int address) {
        address = address << this.getTagBits() + this.getIndexBits();
        address = address >>> this.getTagBits() + this.getIndexBits();
        return address;
    }
    
    protected int hexAddressToIndex(String address) {
        return this.addressToIndex(Integer.parseInt(address, 16));
    }
    protected int addressToIndex(String address) {
        return this.addressToIndex(Integer.parseInt(address));
    }
    private int addressToIndex(int address) {
        address = address << this.getTagBits();
        address = address >>> this.getTagBits();
        address = address >>> this.getOffsetBits();
        return address;
    }
    
    //*** Getters/Setters ***//
    
    protected int getOffsetBits() {
        return offsetBits;
    }

    protected int getIndexBits() {
        return indexBits;
    }

    protected int getTagBits() {
        return tagBits;
    }

    protected String getAllocationPolicy() {
        return allocationPolicy;
    }
    
    protected String getWritePolicy() {
        return writePolicy;
    }
    
    protected int getBlockSize() {
        return blockSize;
    }

    protected int getNumOfSets() {
        return numOfSets;
    }
    
    protected CacheSet[] getCacheSets() {
        return cacheSets;
    }

    protected void setCacheSets(CacheSet[] cacheSets) {
        this.cacheSets = cacheSets;
    }

    protected abstract void setCacheData(int dirty, int valid, String tag, int index);
    
    protected abstract int getDirty(int index);
    
    protected abstract void setDirty(int dirty, int index);
    
    protected abstract int getValid(int index);
    
    protected abstract void setValid(int valid, int index);

    protected abstract String getTag(int index);
    
    protected abstract void setTag(String tag, int index);
    
}
