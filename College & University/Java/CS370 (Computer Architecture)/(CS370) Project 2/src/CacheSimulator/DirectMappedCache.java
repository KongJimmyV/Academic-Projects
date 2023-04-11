package CacheSimulator;

public class DirectMappedCache extends Cache {
    
    //*** Constructors ***//
    public DirectMappedCache(int offsetBits, int indexBits, String allocationPolicy,
            String writePolicy) {
        super(offsetBits, indexBits, allocationPolicy, writePolicy);
        
    }
    
    //*** Getters/Setters ***//
    @Override
    protected void setCacheData(int dirty, int valid, String tag, int index) {
        //System.out.print("SET: " + index + ", ");
        this.setDirty(dirty, index);
        this.setValid(valid, index);
        this.setTag(tag, index);
    }
    
    @Override
    protected int getDirty(int index) {
        return this.getCacheSets()[index].getDirty();
    }

    @Override
    protected void setDirty(int dirty, int index) {
        this.getCacheSets()[index].setDirty(dirty);
        
    }

    @Override
    protected int getValid(int index) {
        return this.getCacheSets()[index].getValid();
    }

    @Override
    protected void setValid(int valid, int index) {
        this.getCacheSets()[index].setValid(valid);
    }

    @Override
    protected String getTag(int index) {
        return this.getCacheSets()[index].getTag();
    }

    @Override
    protected void setTag(String tag, int index) {
        this.getCacheSets()[index].setTag(tag);
    }
}
