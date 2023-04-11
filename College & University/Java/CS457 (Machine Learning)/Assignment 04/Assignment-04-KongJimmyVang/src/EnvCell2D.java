
/**
 * Project Name:    Assignment 4            <br>
 * File Name:       EnvCell2D.java          <br>
 * Description:     This is a state (grid cell) for an Environment. <br><br>
 * 
 * Date Created:    12/5/22                <br>
 * Date Modified:   12/12/22                <br>
 * Class:           CS457 (Fall 2022)       <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class EnvCell2D extends State2D
{
    /** This cell's type */
    private char cellType;
    
    /** This cell's enum type */
    private EnvCell2D.CellType cellTypeEnum;
    
    /** An set of cell types. */
    public enum CellType 
    {
        START('S'), 
        GOAL('G'), 
        EMPTY('_'), 
        BLOCK('B'), 
        MINE('M'), 
        CLIFF('C');

        private final char c;
        
        CellType(char c) {
            this.c = c;
        }
        
        public char toChar() {
            return this.c;
        }
    };
    
    /**
     * Construct a cell and assign it the given cell type at the given coordinates.
     * @param x - x coordinate
     * @param y - y coordinate
     * @param cellType - the type of cell
     */
    public EnvCell2D(final int x, final int y, final char cellType) 
    {
        // Set the coordinates of this cell.
        super(x, y);
        setCellType(cellType);
    }
    
    /**
     * Set the cell type.
     * @param cellType - cell type
     */
    public void setCellType(final char cellType) 
    {
        // If there is an invalid input, the cell type will default to an EMPTY char.
        this.cellType = CellType.EMPTY.toChar();
        this.cellTypeEnum = CellType.EMPTY;
        
        // Check if Cell type is valid.
        CellType[] types = CellType.values();
        for (CellType type : types) {
            if (type.toChar() == cellType) {
                this.cellType = cellType;
                this.cellTypeEnum = type;
                break;
            }
        }
    }
    
    /**
     * Get the cell type.
     * @return Returns the cell type.
     */
    public char getCellType() {
        return this.cellType;
    }
    
    /**
     * Get the cell type's enum value.
     * @return Returns the cell type as the enum value.
     */
    public EnvCell2D.CellType getCellTypeEnum() {
        return this.cellTypeEnum;
    }
    
    @Override
    public String toString() {
        // Returning the cell type of this state as a string representation.
        return String.valueOf(this.getCellType());
    }
}
