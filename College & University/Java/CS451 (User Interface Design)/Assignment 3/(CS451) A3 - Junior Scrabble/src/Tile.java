
/**
 * Tile
 * 
 * Description:
 *      - A tile object for the Application.
 * 
 * Project:     Assignment 3 - Scrabble
 * Class:       CS451
 * Team:        Hunter Sutter, Kong Jimmy Vang
 * 
 * Revised and Edited by: Kong Jimmy Vang
 * 
 * @author Hunter Sutter
 */
public class Tile {

    //=== CLASS VARIABLES
    protected boolean open;         // If false, tile is occupied by a letter. Otherwise true.
    protected boolean locked;       // If true, then the letter is locked to the board. Otherwise false.
    protected String special;       // The bonus points available on that tile (either DL,TL,DW or TW)
    protected boolean allowSpecial; // If true, allow special.
    protected char letter;          // If a letter occupies the tile, the letter is held here.
    
    protected char prevLetter;  // Previous letter storage.
    protected boolean isBlank;  // Set true, if the letter occupying the space is a BLANK ' ' letter.
    
    protected int row;          // The row of this tile on the board.
    protected int col;          // The column of this tile on the board.

    //=== CONSTRUCTORS
    /**
     * Create a Tile with default values.
     */
    public Tile() {
        this(true, "NA", ' ', false, -1, -1);
    }
    
    /**
     * Create a Tile.
     * @param row   - The row of this tile on the board.
     * @param col   - The column of this tile on the board.
     */
    public Tile(int row, int col) {
        this(true, "NA", ' ', false);
        this.row = row;
        this.col = col;
    }
    
    /**
     * Create a Tile.
     * @param open      - whether or not the tile is occupied by a letter
     * @param special   - the bonus points available on that tile (either DL,TL,DW or TW)
     * @param letter    - if a letter occupies the tile, the letter is held here
     * @param isBlank   - set true, if the letter occupying the space is a BLANK ' ' letter.
     */
    public Tile(boolean open, String special, char letter, boolean isBlank) {
        this(open, special, letter, isBlank, -1, -1);
    }
    
    /**
     * Create a Tile.
     * @param open      - whether or not the tile is occupied by a letter
     * @param special   - the bonus points available on that tile (either DL,TL,DW or TW)
     * @param letter    - if a letter occupies the tile, the letter is held here
     * @param isBlank   - set true, if the letter occupying the space is a BLANK ' ' letter.
     * @param row       - The row of this tile on the board.
     * @param col       - The column of this tile on the board.
     */
    public Tile(boolean open, String special, char letter, boolean isBlank, int row, int col) {
        super();
        this.open = open;
        this.locked = false;
        this.special = special;
        this.allowSpecial = true;
        this.letter = letter;
        this.isBlank = isBlank;
        this.row = row;
        this.col = col;
    }
    
    //=== METHODS
    

    //=== SETTERS AND GETTERS
    
    
}
