package CacheSimulator;

public class CacheSet {
    
    // Storage
    private int dirty;
    private int valid;
    private String tag;
    private long time;
    
    public CacheSet() {
        this.dirty = 0;
        this.valid = 0;
        this.tag = "";
        this.time = System.nanoTime();
    }
    
    protected long getTime() {
        return time;
    }
    
    protected void setTime(long time) {
        this.time = time;
    }
    
    protected int getDirty() {
        return dirty;
    }

    protected void setDirty(int dirty) {
        this.dirty = dirty;
    }

    protected int getValid() {
        return valid;
    }

    protected void setValid(int valid) {
        this.valid = valid;
    }

    protected String getTag() {
        return tag;
    }

    protected void setTag(String tag) {
        this.tag = tag;
    }
}
