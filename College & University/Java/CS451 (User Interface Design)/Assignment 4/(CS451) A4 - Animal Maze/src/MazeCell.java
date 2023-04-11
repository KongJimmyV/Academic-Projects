import java.awt.Color;
import java.awt.Graphics;
import java.awt.Point;
import java.util.ArrayList;

import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.border.MatteBorder;

/**
 * Description:
 *      - The Cell for the Maze.
 *      
 * Project:     Assignment 4 - Temporal System With Animation
 * Class:       CS451
 * Team:        Hunter Sutter, Kong Jimmy Vang
 * 
 * Sources: 
 *  - https://www.geeksforgeeks.org/java-swing-matteborder/
 *  - https://www.tutorialspoint.com/swingexamples/add_border_to_panel.htm
 *  - https://docs.oracle.com/javase/tutorial/uiswing/components/border.html
 *  - https://stackoverflow.com/questions/5716390/how-to-set-border-on-jpanel
 *  - https://stackoverflow.com/questions/15961472/how-can-i-paint-in-an-specific-jpanel-when-more-than-one-in-same-frame-java
 * 
 * @author Kong Jimmy Vang
 */
public class MazeCell extends JLabel {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    ///////////////////////////////////////
    // FLAGS
    public int flags;   // Stores flags used.
    
    final public static int GEN_EXIT = (int) Math.pow(2,1);      // FLAG: For cells visited by the maze generator for exits
    final public static int GEN_DEAD_END = (int) Math.pow(2,2);  // FLAG: For cells visited by the maze generator for dead ends.
    
    ///////////////////////////////////////
    // FIELD VARIABLES
    private static final int BORDER_LENGTH = 4;
    private Maze maze;      // The current maze this cell is a part of.
    
    //private int x;          // The x location of this cell.
    //private int y;          // The y location of this cell.
    private int row;          // The row of this cell.
    private int col;          // The column of this cell.
    //private int width;      // The width of this cell.
    //private int height;     // The height of this cell.
    
    private boolean north;  // ^ (up)     If true, open north wall.
    private boolean east;   // > (right)  If true, open east wall.
    private boolean south;  // v (down)   If true, open south wall.
    private boolean west;   // < (left)   If true, open west wall.
    
    public ArrayList<Animal> animals;   // List of Animals in this cell.
    
    /**
     * -1 = NOT an exit
     * 0 = North exit
     * 1 = East exit
     * 2 = South exit
     * 3 = West exit
     */
    private int exit;
    
    ///////////////////////////////////////
    // CONSTRUCTORS
    /**
     * Creates a MazeCell with the given parameters.
     * Sets the north, east, south, west and exit fields to their default values.
     * 
     * @param maze      - Maze that this MazeCell will attach to.
     * @param x         - Y location.
     * @param y         - X location.
     * @param width     - Width
     * @param height    - Height
     * @param row       - Row.
     * @param col       - Column.
     */
    public MazeCell(final Maze maze,
                    final int x, 
                    final int y, 
                    final int width, 
                    final int height,
                    final int row,
                    final int col) {
        this(maze, x, y, width, height, row, col, false, false, false, false, -1);
    }
    
    /**
     * Creates a MazeCell with the given parameters.
     * 
     * @param maze      - Maze that this MazeCell will attach to.
     * @param x         - Y location.
     * @param y         - X location.
     * @param width     - Width
     * @param height    - Height
     * @param row       - Row.
     * @param col       - Column.
     * @param north     - If true, allow movement north.
     * @param east      - If true, allow movement east.
     * @param south     - If true, allow movement south.
     * @param west      - If true, allow movement west.
     * @param exit      -   -1 = NOT an exit.
     *                      0  = North exit.
     *                      1  = East exit.
     *                      2  = South exit.
     *                      3  = West exit.
     */
    public MazeCell(final Maze maze,
                    final int x, 
                    final int y, 
                    final int width, 
                    final int height,
                    final int row,
                    final int col,
                    final boolean north, 
                    final boolean east, 
                    final boolean south, 
                    final boolean west, 
                    final int exit) {
        super();
        
        this.setLocation(x, y);
        this.setSize(width, height);
        this.setHorizontalAlignment(SwingConstants.CENTER);
        //this.setOpaque(true);
        //this.setText("CELL");
        
        this.row = row;
        this.col = col;
        
        this.maze = maze;
        this.north = north;
        this.west = west;
        this.south = south;
        this.east = east;
        this.exit = exit;
        
        this.animals = new ArrayList<Animal>();
        
        setBorder();
    }
    
    ///////////////////////////////////////
    // METHODS/FUNCTIONS
    @Override
    public void paintComponent(Graphics gr) {
        super.paintComponent(gr);
        
        if (null !=this.getBorder()) {
            int width = getWidth();
            int height = getHeight();
            
            int col = getCol();
            int row = getRow();
            int NE = BORDER_LENGTH, NW = BORDER_LENGTH, SE = BORDER_LENGTH, SW = BORDER_LENGTH;
            
            if (col == 0) {
                if (row == 0) {
                    SE /= 2;
                } else if (row == maze.getRows() - 1) {
                    NE /= 2;
                } else {
                    NE /= 2;
                    SE /= 2;
                }
            } else if (col == maze.getColumns() - 1) {
                if (row == 0) {
                    SW /= 2;
                } else if (row == maze.getRows() - 1) {
                    NW /= 2;
                } else {
                    NW /= 2;
                    SW /= 2;
                }
            } else if (row == 0) {
                if (col == 0) {
                    SE /= 2;
                } else if (col == maze.getColumns() - 1) {
                    SW /= 2;
                } else {
                    SE /= 2;
                    SW /= 2;
                }
            } else if (row == maze.getRows() - 1) {
                if (col == 0) {
                    NE /= 2;
                } else if (col == maze.getColumns() - 1) {
                    NW /= 2;
                } else {
                    NE /= 2;
                    NW /= 2;
                }
            } else {
                NE /= 2;
                NW /= 2;
                SE /= 2;
                SW /= 2;
            }
            
            int exit = getExit();
            switch (exit) {
                case 0:
                    NE = 0;
                    NW = 0;
                    break;
                case 1:
                    NE = 0;
                    SE = 0;
                    break;
                case 2:
                    SE = 0;
                    SW = 0;
                    break;
                case 3:
                    NW = 0;
                    SW = 0;
                    break;
            }
            
            // Fill the corners of each MazeCell.
            gr.setColor(Color.BLACK);
            gr.fillRect(0, 0, NW, NW);
            gr.fillRect(width - NE, 0, NE, NE);
            gr.fillRect(0, height - SW, SW, SW);
            gr.fillRect(width - SE, height - SE, SE, SE);
        }
    }
    
    ///////////////////////////////////////
    // SETTERS
    /**
     * Sets up the border for this Swing Component.
     */
    public void setBorder() {
        
        int N = 0, E = 0, S = 0, W = 0;
        if (!north) {
            N = BORDER_LENGTH;
        }
        if (!east) {
            E = BORDER_LENGTH;
        }
        if (!south) {
            S = BORDER_LENGTH;
        }
        if (!west) {
            W = BORDER_LENGTH;
        }
        
        int exit = getExit();
        switch (exit) {
            case 0:
                N = 0;
                break;
            case 1:
                E = 0;
                break;
            case 2:
                S = 0;
                break;
            case 3:
                W = 0;
                break;
        }
        
        int col = getCol();
        int row = getRow();
        if (col == 0) {
            if (row == 0) {
                E /= 2;
                S /= 2;
            } else if (row == maze.getRows() - 1) {
                N /= 2;
                E /= 2;
            } else {
                N /= 2;
                E /= 2;
                S /= 2;
            }
        } else if (col == maze.getColumns() - 1) {
            if (row == 0) {
                S /= 2;
                W /= 2;
            } else if (row == maze.getRows() - 1) {
                N /= 2;
                W /= 2;
            } else {
                N /= 2;
                S /= 2;
                W /= 2;
            }
        } else if (row == 0) {
            if (col == 0) {
                E /= 2;
                S /= 2;
            } else if (col == maze.getColumns() - 1) {
                S /= 2;
                W /= 2;
            } else {
                E /= 2;
                S /= 2;
                W /= 2;
            }
        } else if (row == maze.getRows() - 1) {
            if (col == 0) {
                N /= 2;
                E /= 2;
            } else if (col == maze.getColumns() - 1) {
                N /= 2;
                W /= 2;
            } else {
                N /= 2;
                E /= 2;
                W /= 2;
            }
        } else {
            N /= 2;
            E /= 2;
            S /= 2;
            W /= 2;
        }
        
        this.setBorder(new MatteBorder(N, W, S, E, Color.black));
    }
    
    /**
     * If set to true, allows movement north from this cell.
     * Else if false, disallow movement north from this cell.
     * @param allowMoveNorth
     */
    public void setNorth(final boolean allowMoveNorth) {
        this.north = allowMoveNorth;
        setBorder();
    }
    
    /**
     * If set to true, allows movement east from this cell.
     * Else if false, disallow movement east from this cell.
     * @param allowMoveEast
     */
    public void setEast(final boolean allowMoveEast) {
        this.east = allowMoveEast;
        setBorder();
    }
    
    /**
     * If set to true, allows movement south from this cell.
     * Else if false, disallow movement south from this cell.
     * @param allowMoveSouth
     */
    public void setSouth(final boolean allowMoveSouth) {
        this.south = allowMoveSouth;
        setBorder();
    }
    
    /**
     * If set to true, allows movement west from this cell.
     * Else if false, disallow movement west from this cell.
     * @param allowMoveWest
     */
    public void setWest(final boolean allowMoveWest) {
        this.west = allowMoveWest;
        setBorder();
    }
    
    /**
     * Set this cell as an exit.
     * 
     * -1 = NOT an exit
     * 0 = North exit
     * 1 = East exit
     * 2 = South exit
     * 3 = West exit
     * 
     * @param exit - Any integer ranging from -1 to 3.
     */
    public void setExit(final int exit) {
        if (0 <= exit && exit <= 3) {
            this.exit = exit;
        } else {
            System.err.println(
                    String.format("MazeCell::setExit: "
                            + "Parameter 'exit' is not between 0 and 3. "
                            + "Setting 'this.exit' to -1. ('exit' = %d) ", exit) );
            this.exit = -1;
        }
        setBorder();
    }
    
    /**
     * If set to true, then this MazeCell will be marked 'visited' by the Maze Generator for exits.
     * @param isVisited
     */
    public void setVisitedExit(boolean isVisited) {
        if (isVisited) {
            this.flags |= MazeCell.GEN_EXIT;
        } else {
            this.flags &= ~MazeCell.GEN_EXIT;
        }
    }
    
    /**
     * If set to true, then this MazeCell will be marked 'visited' by the Maze Generator for dead ends.
     * @param isVisited
     */
    public void setVisitedDeadEnd(boolean isVisited) {
        if (isVisited) {
            this.flags |= MazeCell.GEN_DEAD_END;
        } else {
            this.flags &= ~MazeCell.GEN_DEAD_END;
        }
    }
    
    ///////////////////////////////////////
    // GETTERS
    /** @return Returns the column of this Cell. */
    public int getCol() {
        return col;
        
        /*int col = Math.round( (float)(this.getX() - maze.getX()) / (float)maze.getCellSize() );
        if (col < 0) {
            col = 0;
        } else if (col > maze.getColumns()) {
            col = maze.getColumns() - 1;
        }
        return col;*/
    }
    
    /** @return Returns the row of this Cell. */
    public int getRow() {
        return row;
        
        /*int row = Math.round( (float)(this.getY() - maze.getY()) / (float)maze.getCellSize() );
        if (row < 0) {
            row = 0;
        } else if (row > maze.getRows()) {
            row = maze.getRows() - 1;
        }
        return row;*/
    }
    
    public Point getCenter() {
        Point center = new Point((getX() + (getWidth() / 2)), (getY() + (getHeight() / 2)));
        return center;
    }
    
    /** @return Returns true if it is possible to move north. */
    public boolean canMoveNorth() {
        return north;
    }
    /** @return Returns true if it is possible to move east. */
    public boolean canMoveEast() {
        return east;
    }
    /** @return Returns true if it is possible to move south. */
    public boolean canMoveSouth() {
        return south;
    }
    /** @return Returns true if it is possible to move west. */
    public boolean canMoveWest() {
        return west;
    }
    
    /** 
     * @return Returns -1, iff Not an exit. <br>
     *         Returns 0, iff North exit.   <br>
     *         Returns 1, iff East exit.    <br>
     *         Returns 2, iff South exit.   <br>
     *         Returns 3, iff West exit.    <br>
     */
    public int getExit() {
        return exit;
    }
    
    /** 
     * @return Returns true if this MazeCell has an exit.
     */
    public boolean isExit() {
        if (exit < 0) {
            return false;
        } else {
            return true;
        }
    }
    
    /** @return Returns true if this Cell was marked 'visited' by the Maze Generator for exits. */
    public boolean isVisitedExit() {
        return (this.flags & MazeCell.GEN_EXIT) == MazeCell.GEN_EXIT;
    }
    
    /** @return Returns true if this Cell was marked 'visited' by the Maze Generator for dead ends. */
    public boolean isVisitedDeadEnd() {
        return (this.flags & MazeCell.GEN_DEAD_END) == MazeCell.GEN_DEAD_END;
    }
}
