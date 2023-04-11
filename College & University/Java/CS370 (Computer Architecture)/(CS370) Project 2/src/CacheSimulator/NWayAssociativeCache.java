package CacheSimulator;

import java.io.IOException;
import java.sql.Date;

public class NWayAssociativeCache extends Cache {

    // Settings
    private String replacementPolicy;

    // Size
    private final int N;
    
    // Storage
    private final Way[] ways;
    
    //*** Constructors ***//
    public NWayAssociativeCache(final int offsetBits, 
            final int indexBits, 
            final String allocationPolicy,
            final String writePolicy,
            final String replacementPolicy,
            final int N) throws IOException {
        super(offsetBits, indexBits, allocationPolicy, writePolicy);
        this.setCacheSets(null);
        
        // Check replacement policy
        if (!replacementPolicy.equals("fifo")) {
            throw new IOException("The replacement policy \"" + replacementPolicy + "\" is not supported.");
        }
        
        this.replacementPolicy = replacementPolicy;
        this.N = N;
        
        this.ways = new Way[this.N];
        for(int i = 0; i < this.ways.length; i++) {
            this.ways[i] = new Way(this.getNumOfSets());
        }
    }
    
    // *** Getters/Setters ***//
    @Override
    protected void setCacheData(int dirty, int valid, String tag, int index) {
        int way = 0;
        long minimumTime = Long.MAX_VALUE;
        //System.out.println(minimumTime);
        
        if (this.replacementPolicy.equals("fifo")) {
            for (int i = 0; i < this.ways.length; i++) {
                long cacheTimeAtIndex = this.ways[i].cacheSets[index].getTime();
                
                if (this.getValid(index, i) == 0) {
                    way = i;
                    break;
                }
                
                if (cacheTimeAtIndex < minimumTime) {
                    minimumTime = this.ways[i].cacheSets[index].getTime();
                    way = i;
                }
            }
        }
        
        //System.out.print("SET: " + index + ", ");
        //System.out.print("WAY: " + way + ", ");
        this.ways[way].cacheSets[index].setTime(System.nanoTime());
        this.setDirty(dirty, index, way);
        this.setValid(valid, index, way);
        this.setTag(tag, index, way);
    }
    
    protected void setCacheData(int dirty, int valid, String tag, int index, int way) {
        this.setDirty(dirty, index, way);
        this.setValid(valid, index, way);
        this.setTag(tag, index, way);
    }
    
    @Override
    protected int getDirty(int index) {
        return this.getDirty(index, 0);
    }
    
    protected int getDirty(int index, int way) {
        return this.ways[way].getDirty(index);
    }

    @Override
    protected void setDirty(int dirty, int index) {
        this.setDirty(dirty, index, 0);
    }
    
    protected void setDirty(int dirty, int index, int way) {
        this.ways[way].setDirty(dirty, index);
    }

    @Override
    protected int getValid(int index) {
        return this.getValid(index, 0);
    }

    protected int getValid(int index, int way) {
        return this.ways[way].getValid(index);
    }
    
    @Override
    protected void setValid(int valid, int index) {
        this.setValid(valid, index, 0);
    }

    protected void setValid(int valid, int index, int way) {
        this.ways[way].setValid(valid, index);
    }
    
    @Override
    protected String getTag(int index) {
        return this.getTag(index, 0);
    }

    protected String getTag(int index, int way) {
        return this.ways[way].getTag(index);
    }
    
    @Override
    protected void setTag(String tag, int index) {
        this.setTag(tag, index, 0);
    }
    
    protected void setTag(String tag, int index, int way) {
        this.ways[way].setTag(tag, index);
    }

    //*** Inner Classes ***//
    private class Way {
        
        // Storage
        private CacheSet[] cacheSets;
        
        public Way(int numOfSets) {
            this.cacheSets = new CacheSet[getNumOfSets()];
            for(int i = 0; i < this.cacheSets.length; i++) {
                this.cacheSets[i] = new CacheSet();
            }
        }

        protected int getDirty(int index) {
            return this.cacheSets[index].getDirty();}

        protected void setDirty(int dirty, int index) {
            this.cacheSets[index].setDirty(dirty);}
        
        protected int getValid(int index) {
            return this.cacheSets[index].getValid();}

        protected void setValid(int valid, int index) {
            this.cacheSets[index].setValid(valid);}

        protected String getTag(int index) {
            return this.cacheSets[index].getTag();}

        protected void setTag(String tag, int index) {
            this.cacheSets[index].setTag(tag);}
    }
}
