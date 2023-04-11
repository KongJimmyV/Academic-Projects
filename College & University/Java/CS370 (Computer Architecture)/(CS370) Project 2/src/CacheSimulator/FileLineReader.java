package CacheSimulator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class FileLineReader extends File {

    /** Serial Version UID */
    private static final long serialVersionUID = 1L;
    
    final private Scanner scanner;
    
    final private ArrayList<String> lines;
    private int numOfLines;
    
    public FileLineReader(final File file) throws IOException {
        this(file.getCanonicalPath());
    }
    
    /**
     * 
     * @param file
     * @throws IOException
     */
    public FileLineReader(final String file) throws IOException {
        // Try to store file.
        super(file);
        
        if (!super.exists())
            throw new FileNotFoundException("\"" + super.getCanonicalFile().getName() + "\" was not found at this location. "
                    + "(PATH: \"" + super.getCanonicalFile().getCanonicalPath() + "\")");
        if (!super.canRead())
            throw new IOException("\"" + super.getCanonicalFile().getName() + "\" is unable to be read from this location. "
                    + "(PATH: \"" + super.getCanonicalFile().getCanonicalPath() + "\")");
        
        // Get lines.
        this.scanner = new Scanner(this.getCanonicalFile());
        //System.out.println(this.getCanonicalPath());
        
        this.lines = new ArrayList<>();
        while(this.scanner.hasNextLine()) {
            this.lines.add(this.scanner.nextLine());
            //System.out.println(this.lines[i]);
        }
        
        this.scanner.close();
        
        // Setup Field Variables.
        this.numOfLines = this.lines.size();
    }
    
    /**
     * 
     * @return
     */
    public int getNumOfLines() {
        return this.numOfLines;
    }
    
    /**
     * 
     * @return
     */
    public String getAllLines() {
        String str = "";
        
        for(int i = 0; i < lines.size(); i++) {
            str += lines.get(i) + "\n";
        }
        
        return str;
    }
    
    /**
     * 
     * @param index
     * @return
     */
    public String getLine(final int index) {
        return lines.get(index);
    }
    
    /**
     * 
     * @return
     */
    public String[] toStringArray() {
        return (String[]) lines.toArray();
    }
    
    /**
     * 
     * @return
     */
    public Object[] toArray() {
        return lines.toArray();
    }
    
}
