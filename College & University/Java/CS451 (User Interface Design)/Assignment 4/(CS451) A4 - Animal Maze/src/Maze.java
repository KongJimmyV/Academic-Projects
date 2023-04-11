import java.awt.Component;
import java.awt.Point;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.Random;
import java.util.Stack;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.SwingWorker;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

/**
 * Description:
 *      - The Maze.
 *      
 * Project:     Assignment 4 - Temporal System With Animation
 * Class:       CS451
 * Team:        Hunter Sutter, Kong Jimmy Vang
 * 
 * Sources: 
 *  - https://gamedev.stackexchange.com/questions/109607/how-do-i-set-an-objects-speed-to-arrive-in-x-seconds
 *  - https://gamedev.stackexchange.com/questions/103811/java-game-how-to-make-image-follow-line
 *  - https://docs.oracle.com/javase/tutorial/essential/concurrency/syncmeth.html
 *  
 * Tilesets:
 *  - https://opengameart.org/content/grass-tileset-16x16
 *  - https://axelpale.github.io/openmoji-sprites/
 *  - https://rpgtileset.com/
 * 
 * @author Kong Jimmy Vang
 */
public class Maze {
    
    ///////////////////////////////////////
    // FIELD VARIABLES
    final static public int DEFAULT_MAZE_SIZE = 15;
    final static public int UI_GAP = 25;
    final static public int MAZE_ALGORITHM_LOOP_LIMIT = 128;
    final static public String TILESET_FOLDER_LOCATION = "images" + File.separator 
                                                       + "tiles" + File.separator ;
    
    /** (NOT USED) Height offset for the top side of the GUI. */
    //final public static int OFFSET_TOP    = 100;
    
    /** (NOT USED) Width offset for the left side of the GUI. */
    //final public static int OFFSET_LEFT   = 100;
    
    /** Height offset for the bottom side of the GUI.*/
    final public static int OFFSET_BOTTOM = 100;
    
    /** Width offset for the right side of the GUI.*/
    final public static int OFFSET_RIGHT  = 25;
    
    
    private int cols;       // The number of columns for this maze. (Width of Maze)
    private int rows;       // The number of rows for this maze. (Height of Maze)
    
    private int x;          // The x location of this Maze.
    private int y;          // The y location of this Maze.
    private int cellSize;   // The size of each MazeCell.
    private int animalSize; // The size of each Animal.
    
    private int numOfExits;     // The number of exits to be generated.
    
    /**
     * All the cells for the maze. <br>
     *      cells = MazeCell[ rows ][ cols ];
     */
    private MazeCell[][] cells;
    
    /**
     * Outer Cells.
     */
    private MazeCell[][] borderCells;
    
    /**
     * All the animals in the maze.
     */
    private ArrayList<Animal> animals;
    private int uid;
    
    /**
     * Keeps track of escaped animals.
     */
    protected ArrayList<Animal> escapedAnimals;
    private JScrollPane scrollPaneEscaped;  // JScrollPane that will display "tableEscaped" in viewport.
    private JLabel lblEscaped;              // JLabel header for JScrollPane
    private JTable tableEscaped;            // JTable that will display escaped animals.
    
    
    /**
     * Keeps track of stuck animals.
     */
    protected ArrayList<Animal> stuckAnimals;
    private JScrollPane scrollPaneStuck;    // JScrollPane that will display "tableStuck" in viewport.
    private JLabel lblStuck;                // JLabel header for JScrollPane
    private JTable tableStuck;              // JTable that will display stuck animals.
    
    /**
     * Escaped animals exit locations. (to help prevent stacking at the end)
     */
    protected ArrayList<Point> animalExitPoints;
    
    /** 
     * Directions: 0=North, 1=East, 2=South, 3=West.
     * Used for function 'move()'
     */
    private static final int[] DIRECTIONS = { 0, 1, 2, 3 };    
    
    /** 
     * Storage for 'DIRECTIONS' in an ArrayList.
     * Used for shuffling directions in a random order during calls to function 'move()'.
     */
    private ArrayList<Integer> directions;
    
    /**
     * Current Front Cell.
     * Used for Depth First Search algorithm.
     */
    private Stack<MazeCell> frontier;
    
    /** 
     * Cells Explored.
     * Used for Depth First Search algorithm.
     */
    private Stack<MazeCell> explored;
    
    /** Depth First Search Counter. */
    private int dfsCounter;
    
    ///////////////////////////////////////
    // CONSTRUCTORS
    /**
     * Builds a Maze object and generates it.
     * 
     * @param cols          - Columns (Width of this Maze).
     * @param rows          - Rows (Height of this Maze).
     * @param x             - The x location of this Maze.
     * @param y             - The y location of this Maze. 
     * @param cellSize      - The size for each MazeCell. (cellSize = 8, means 8 pixels wide and tall)
     * @param numOfExits    - Number of exits to be generated.
     * @throws Exception 
     */
    public Maze(final int cols, 
                final int rows, 
                final int x,
                final int y,
                final int cellSize,
                final int animalSize,
                final int numOfExits) throws Exception{
        if (cols < 1) {
            String s = "(DEV) Maze::CONSTRUCTOR_0: 'animalSize' cannot be less than 1. "
                     + String.format("(animalSize: %d)", animalSize);
            throw new Exception( s );
        }
        
        this.x = x;
        this.y = y;
        this.animalSize = animalSize;
        this.animals = new ArrayList<Animal>();
        this.uid = 0;
        
        // Setup Lists and Stacks
        this.escapedAnimals = new ArrayList<>();
        this.stuckAnimals = new ArrayList<>();
        this.animalExitPoints = new ArrayList<>();
        
        this.directions = new ArrayList<>();
        for (int i = 0; i < DIRECTIONS.length; i++ ) {
            this.directions.add(DIRECTIONS[i]);
        }
        
        this.frontier = new Stack<>();
        this.explored = new Stack<>();
        
        generateMaze(cols, rows, cellSize, numOfExits);
        
    }
    
    ///////////////////////////////////////
    // METHODS/FUNCTIONS
    /**
     * Generates a new Maze with this Maze's field variables.
     * @throws Exception 
     */
    public void generateMaze() throws Exception {
        generateMaze(this.cols, this.rows, this.cellSize, this.numOfExits);
    }
    
    /**
     * Generate a Maze with the given parameters.
     * 
     * @param cols          - Columns (Width of this Maze).
     * @param rows          - Rows (Height of this Maze).
     * @param cellSize      - The size for each MazeCell. (cellSize = 8, means 8 pixels wide and tall)
     * @param numOfExits    - Number of exits to be generated.
     * @throws Exception 
     */
    private void generateMaze(final int cols, 
                              final int rows, 
                              final int cellSize,
                              final int numOfExits) throws Exception {
        // Error checking
        if (cols < 1) {
            String s = "(DEV) Maze::initMaze: 'cols' cannot be less than 1. "
                     + String.format("(cols: %d)", cols);
            throw new Exception( s );
        }
        if (rows < 1) {
            String s = "(DEV) Maze::initMaze: 'rows' cannot be less than 1. "
                     + String.format("(rows: %d)", rows);
            throw new Exception( s );
        }
        if (cellSize < 1) {
            String s = "(DEV) Maze::initMaze: 'cellSize' cannot be less than 1. "
                    + String.format("(cellSize: %d)", cellSize);
            throw new Exception( s );
        }
        if (numOfExits < 1) {
            String s = "(DEV) Maze::initMaze: 'numOfExits' cannot be less than 1. "
                    + String.format("(numOfExits: %d)", numOfExits);
            throw new Exception( s );
        }
        
        // Set Appropriate Field Variables
        this.cols = cols;
        this.rows = rows;
        this.cellSize = cellSize;
        this.numOfExits = numOfExits;
        
        // Delete old maze.
        if (null != cells) {
            for (int r = 0; r < rows; r++) {
                for (int c = 0; c < cols; c++) {
                    cells[r][c].getParent().remove(cells[r][c]);
                    cells[r][c] = null;
                }
            }
        }
        if (null != borderCells) {
            for (int r = 0; r < borderCells.length; r++) {
                for (int c = 0; c < borderCells[r].length; c++) {
                    if (null != borderCells[r][c]) {
                        borderCells[r][c].getParent().remove(borderCells[r][c]);
                        borderCells[r][c] = null;
                    }
                }
            }
        }
        
        this.escapedAnimals.clear();
        this.stuckAnimals.clear();
        this.animalExitPoints.clear();
        this.frontier.clear();
        this.explored.clear();
        
        //cells = null;
        //outerCells = null;
        
        // Create Maze.
        cells = new MazeCell[rows][cols];
        borderCells = new MazeCell[rows + 2][cols + 2];
        
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                cells[r][c] = new MazeCell(this, x + c * cellSize, y + r * cellSize, cellSize, cellSize, r, c);
                
                String tile = "";
                if (r <= 0 && c <= 0) {
                    tile = "tile048";
                } else if (r <= 0 && c >= getWidth() - 1) {
                    tile = "tile048";
                } else if (r >= getHeight() - 1 && c <= 0) {
                    tile = "tile048";
                } else if (r >= getHeight() - 1 && c >= getWidth() - 1) {
                    tile = "tile048";
                    
                } else if ( r <= 0 ) {
                    tile = "tile048";
                } else if ( r >= getWidth() - 1 ) {
                    tile = "tile048";
                } else if ( c <= 0 ) {
                    tile = "tile048";
                } else if ( c >= getWidth() - 1 ) {
                    tile = "tile048";
                    
                } else {
                    tile = "tile048";
                }
                ImageIcon image = TemporalSysApp.createSizedIcon(TILESET_FOLDER_LOCATION
                                                               + "grass" + File.separator
                                                               + tile + ".png", 
                                                               cells[r][c].getWidth(), cells[r][c].getHeight());
                cells[r][c].setIcon(image);
            }
        }
        
        for (int r = 0; r < borderCells.length; r++) {
            for (int c = 0; c < borderCells[r].length; c++) {
                if ( !((r > 0 && r < borderCells.length - 1 ) && (c > 0 && c < borderCells[r].length - 1)) ) {
                    borderCells[r][c] = new MazeCell(this, (x-cellSize) + c * cellSize, (y-cellSize) + r * cellSize, cellSize, cellSize, r, c);
                    borderCells[r][c].setNorth(true);
                    borderCells[r][c].setEast(true);
                    borderCells[r][c].setSouth(true);
                    borderCells[r][c].setWest(true);
                    borderCells[r][c].setBorder(null);
                } else {
                    borderCells[r][c] = null;
                    continue;
                }
                
                String tile = "";
                if (r <= 0 && c <= 0) {
                    tile = "tile052";
                } else if (r <= 0 && c >= borderCells[r].length - 1 ) {
                    tile = "tile053";
                } else if (r >= borderCells.length - 1 && c <= 0) {
                    tile = "tile068";
                } else if (r >= borderCells.length - 1 && c >= borderCells[r].length - 1 ) {
                    tile = "tile069";
                    
                } else if ( r <= 0 ) {
                    tile = "tile082";
                } else if ( r >= borderCells.length - 1 ) {
                    tile = "tile050";
                } else if ( c <= 0 ) {
                    tile = "tile067";
                } else if ( c >= borderCells[r].length - 1 ) {
                    tile = "tile065";
                    
                } else {
                    tile = "tile048";
                }
                ImageIcon image = TemporalSysApp.createSizedIcon( TILESET_FOLDER_LOCATION
                                                               + "grass" + File.separator
                                                               + tile + ".png", 
                                                               borderCells[r][c].getWidth(), borderCells[r][c].getHeight());
                borderCells[r][c].setIcon(image);
            }
        }
        
        // Re-add existing animals to the new MazeCell object.
        for (int i = 0; i < animals.size(); i++) {
            Animal a = animals.get(i);
            MazeCell cell = this.getCell(a.getCol(), a.getRow());
            if (null != cell)
                a.setCurrentCell(cell);
        }
        
        // Create Exits (Custom Random Algorithm).
        Random rand = new Random();
        
        for (int i = 0; i < numOfExits; i++) {
            // Choose random cell.
            int c = rand.nextInt(cols);
            int r = rand.nextInt(rows);
            
            MazeCell currentCell = cells[r][c];
            while( currentCell.isVisitedExit() ) {
                c = rand.nextInt(cols);
                r = rand.nextInt(rows);
                
                currentCell = cells[r][c];
            }
            
            boolean isValid = true;
            
            do {
                
                // Choose a direction.
                int direction = rand.nextInt(4);
                
                // This prevents clearing walls in a direction with an already established exit.
                while (currentCell.getExit() == direction) {
                    direction = rand.nextInt(4);
                }
                
                // This prevents walking back to a visited cell.
                int tempR = r, tempC = c;
                switch (direction) {
                    case 0:
                        tempR = r - 1;
                        break;
                    case 1:
                        tempC = c + 1;
                        break;
                    case 2:
                        tempR = r + 1;
                        break;
                    case 3:
                        tempC = c - 1;
                }
                
                int counter = 0;
                while ((tempR >= 0 && tempR < this.getRows() && tempC >= 0 && tempC < this.getColumns()) 
                        && cells[tempR][tempC].isVisitedExit()) {
                    switch (direction) {
                        case 0:
                            tempR = r - 1;
                            break;
                        case 1:
                            tempC = c + 1;
                            break;
                        case 2:
                            tempR = r + 1;
                            break;
                        case 3:
                            tempC = c - 1;
                    }
                    
                    if (counter > MAZE_ALGORITHM_LOOP_LIMIT ||
                            tempR < 0 || tempR >= this.getRows() || tempC < 0 || tempC >= this.getColumns()) {
                        break;
                    }
                    
                    direction = rand.nextInt(4);
                    counter++;
                }
                
                currentCell.setVisitedExit(true);
                
                /* Clear wall in that direction. 
                 * (If that wall leads outside of maze, create an exit instead)
                 */
                switch (direction) {
                    case 0:
                        // break NORTH wall
                        currentCell.setNorth(true);
                        r--;
                        
                        // create exit if wall leads outside maze.
                        if (r < 0) {
                            currentCell.setExit(0);
                            isValid = false;
                            break;
                        }
                        
                        // tell current cell that west wall is broken.
                        currentCell = cells[r][c];
                        currentCell.setSouth(true);
                        break;
                    case 1:
                        // break EAST wall
                        currentCell.setEast(true);
                        c++;
                        
                        // create exit if wall leads outside maze.
                        if (c >= cols) {
                            currentCell.setExit(1);
                            isValid = false;
                            break;
                        }
                        
                        // tell current cell that west wall is broken.
                        currentCell = cells[r][c];
                        currentCell.setWest(true);
                        break;
                    case 2:
                        // break SOUTH wall
                        currentCell.setSouth(true);
                        r++;
                        
                        // create exit if wall leads outside maze.
                        if (r >= rows) {
                            currentCell.setExit(2);
                            isValid = false;
                            break;
                        }
                        
                        // tell current cell that west wall is broken.
                        currentCell = cells[r][c];
                        currentCell.setNorth(true);
                        break;
                    case 3:
                        // break WEST wall
                        currentCell.setWest(true);
                        c--;
                        
                        // create exit if wall leads outside maze.
                        if (c < 0) {
                            currentCell.setExit(3);
                            isValid = false;
                            break;
                        }
                        
                        // tell current cell that west wall is broken.
                        currentCell = cells[r][c];
                        currentCell.setEast(true);
                }
                
                currentCell.setVisitedExit(true);
                
            } while (isValid);
        }
        
        // Create Dead Ends (Custom Depth First Search)
        generateDeadEnds();
        
        // Update Tables
        updateEscapedTable();
        updateStuckTable();
    }
    
    /**
     * Move 1 cell using the Depth First Search algorithm.
     */
    public void generateDeadEnds() {
        
        for (int r = 0; r < this.getRows(); r++) {
            for (int c = 0; c < this.getColumns(); c++) {
                
                frontier.push( this.getCell(c, r) );
                this.getCell(c, r).setVisitedDeadEnd(true);
                
                while (!frontier.isEmpty()) {
                    MazeCell curr = frontier.peek();
                    
                    if (curr != null) {
                        boolean hasMoved = false;
                        
                        Collections.shuffle(directions);
                        
                        //System.out.println(dfsCounter);
                        if (dfsCounter >= 4) {
                            dfsCounter = 0;
                        }
                        
                        while (true) {
                            
                            Integer direction = directions.get(dfsCounter);
                            
                            MazeCell childCell = null;
                            
                            switch (direction) {
                                case 0:
                                    if (!curr.canMoveNorth()) {
                                        childCell = this.getCell(curr.getCol(), curr.getRow() - 1);
                                    }
                                    break;
                                case 1:
                                    if (!curr.canMoveEast()) {
                                        childCell = this.getCell(curr.getCol() + 1, curr.getRow());
                                    }
                                    break;
                                case 2:
                                    if (!curr.canMoveSouth()) {
                                        childCell = this.getCell(curr.getCol(), curr.getRow() + 1);
                                    }
                                    break;
                                case 3:
                                    if (!curr.canMoveWest()) {
                                        childCell = this.getCell(curr.getCol() - 1, curr.getRow());
                                    }
                            }
                            
                            if ( null != childCell && !explored.contains(childCell) 
                                    && !childCell.isVisitedExit()
                                    && !childCell.isVisitedDeadEnd()) {
                                
                                childCell.setVisitedDeadEnd(true);
                                
                                explored.push(childCell);
                                frontier.push(childCell);
                                
                                switch (direction) {
                                    case 0:
                                        hasMoved = true;
                                        curr.setNorth(hasMoved);
                                        childCell.setSouth(hasMoved);
                                        break;
                                    case 1:
                                        hasMoved = true;
                                        curr.setEast(hasMoved);
                                        childCell.setWest(hasMoved);
                                        break;
                                    case 2:
                                        hasMoved = true;
                                        curr.setSouth(hasMoved);
                                        childCell.setNorth(hasMoved);
                                        break;
                                    case 3:
                                        hasMoved = true;
                                        curr.setWest(hasMoved);
                                        childCell.setEast(hasMoved);
                                }
                            }
                            
                            if (hasMoved) {
                                dfsCounter = 0;
                                break;
                            }
                            
                            //System.out.println(dfsCounter);
                            dfsCounter++;
                            if (dfsCounter >= 4) {
                                
                                frontier.pop();
                                
                                dfsCounter = 0;
                                break;
                            }
                        }
                        
                        /*
                        for (int i = 0; i < frontier.size(); i++) {
                            MazeCell cell = frontier.get(i);
                            System.out.print( String.format("(%d, %d)|", cell.getRow(), cell.getCol()) );
                        }
                        System.out.println();
                        */
                        
                    }
                }
            }
        }
    }
    
    /**
     * Resize all the MazeCells in this Maze to the given parameter.
     * @param cellSize - The size for each MazeCell. (cellSize = 8, means 8 pixels wide and tall)
     */
    public void resizeCells(final int cellSize) {
        for (int c = 0; c < cols; c++) {
            for (int r = 0; r < rows; r++) {
                cells[r][c].setSize(cellSize, cellSize);
            }
        }
        
        updateEscapedTable();
        updateStuckTable();
    }
    
    /**
     * Spawns an animal randomly in the maze.
     * 
     * @param species       - The species name of this animal.
     * @param timeToPoint   - The time in seconds it takes for this animal to reach any point.
     */
    public void spawnAnimal(final String species, final double timeToPoint) {
        Random rand = new Random();
        
        int c = rand.nextInt(cols);
        int r = rand.nextInt(rows);
        
        spawnAnimal(species, timeToPoint, c, r);
    }
    
    /**
     * Spawns an animal at a specified column and row in the maze.
     * 
     * @param species       - The species name of this animal.
     * @param timeToPoint   - The time in seconds it takes for this animal to reach any point.
     * @param col           - The column.
     * @param row           - The row.
     */
    public void spawnAnimal(final String species, 
                            final double timeToPoint, 
                            final int col, 
                            final int row) {
        
        MazeCell cell = this.getCell(col, row);
        Point p = cell.getCenter();
        
        Animal animal = new Animal(this, 
                                   cell, 
                                   p.x - (animalSize / 2), 
                                   p.y - (animalSize / 2), 
                                   animalSize, 
                                   animalSize, 
                                   timeToPoint, 
                                   species, 
                                   uid++);
        
        cell.animals.add(animal);
        animals.add(animal);
        
        updateEscapedTable();
        updateStuckTable();
    }
    
    public synchronized void moveAllAnimals() {
        
        ArrayList<SwingWorker<Void, Void>> workers = new ArrayList<>();
        
        for (int i = 0; i < animals.size(); i++) {
            Animal animal = animals.get(i);
            
            SwingWorker<Void, Void> worker = new SwingWorker<Void, Void>() {
                @Override
                protected Void doInBackground() throws Exception {
                    animal.move();
                    return null;
                }
            };
            workers.add(worker);
        }
        
        for (int i = 0; i < workers.size(); i++) {
            workers.get(i).execute();
        }
        
        workers.clear();
        
        updateEscapedTable();
        updateStuckTable();
    }
    
    public void removeAllAnimals() {
        while (animals.size() > 0) {
            Animal animal = animals.get(animals.size() - 1);
            
            animal.destroy();
            animals.remove(animals.size() - 1);
        }
        
        updateEscapedTable();
        updateStuckTable();
    }
    
    public void removeAnimal(int uid) {
        for (int i = 0; i < animals.size(); i++) {
            Animal animal = animals.get(i);
            
            if (animal.getUID() == uid) {
                animal.destroy();
                animals.remove(i);
                break;
            }
        }
        
        updateEscapedTable();
        updateStuckTable();
    }
    
    public void repositionAllAnimals() {
        this.escapedAnimals.clear();
        this.stuckAnimals.clear();
        this.animalExitPoints.clear();
        
        for (int i = 0; i < animals.size(); i++) {
            Animal animal = animals.get(i);
            
            Random rand = new Random();
            
            int c = rand.nextInt(cols);
            int r = rand.nextInt(rows);
            
            MazeCell cell = this.getCell(c, r);
            Point p = cell.getCenter();
            
            animal.setCurrentCell(cell);
            animal.setCenter(p);
            
            //System.out.println("animal: " + animal.getSpecies());
            
        }
        
        updateEscapedTable();
        updateStuckTable();
    }
    
    public void repositionAnimal(int uid) {
        for (int i = 0; i < animals.size(); i++) {
            Animal animal = animals.get(i);
            
            if (animal.getUID() == uid) {
                Random rand = new Random();
                
                int c = rand.nextInt(cols);
                int r = rand.nextInt(rows);
                
                MazeCell cell = this.getCell(c, r);
                Point p = cell.getCenter();
                
                animal.setCurrentCell(cell);
                animal.setCenter(p);
                
                break;
            }
        }
        
        updateEscapedTable();
        updateStuckTable();
    }
    
    public void setAllAnimalsTimeToPoint(double timeToPoint) {
        for (int i = 0; i < animals.size(); i++) {
            Animal animal = animals.get(i);
            animal.setTimeToPoint(timeToPoint);
        }
    }
    
    /**
     * Returns the maze layout as a String.
     * @return Returns the maze layout as a String.
     */
    @Override
    public String toString() {
        String string       = "";
        String exit         = "";
        String directions   = "";
        int numOfAnimals    = 0;
        
        string += String.format("========================================\r\n");
        string += String.format("MAZE KEY/LEGEND:\r\n");
        string += String.format("e: exit\r\n");
        string += String.format("    e0  = NORTH EXIT\r\n");
        string += String.format("    e1  = EAST EXIT\r\n");
        string += String.format("    e2  = SOUTH EXIT\r\n");
        string += String.format("    e3  = WEST EXIT\r\n");
        string += String.format("^: allowed to go north from this cell\r\n");
        string += String.format(">: allowed to go east from this cell\r\n");
        string += String.format("v: allowed to go south from this cell\r\n");
        string += String.format("<: allowed to go west from this cell\r\n");
        string += String.format("a#: The hashtag # represents how many animals are in this cell\r\n");
        string += "\r\n";
        
        string += "MAZE\r\n";
        
        for (int row = 0; row < cells[0].length; row++) {
            string += String.format("    %d         ", row);
        }
        string += "\r\n";
        
        for (int row = 0; row < cells.length; row++) {
            string += String.format("%d  ", row);
            
            for (int col = 0; col < cells[0].length; col++) {
                MazeCell cell = cells[row][col];
                
                exit = "";
                directions = "";
                numOfAnimals = getNumOfAnimalsAt(col, row);
                
                if (cell.isExit()) {
                    exit = String.format("e%-1d", cell.getExit());
                } else {
                    exit = String.format("  ");
                }
                
                if (cell.canMoveWest()) {
                    directions += "<";
                } else {
                    directions += " ";
                }
                if (cell.canMoveNorth()) {
                    directions += "^";
                } else {
                    directions += " ";
                }
                if (cell.canMoveSouth()) {
                    directions += "v";
                } else {
                    directions += " ";
                }
                if (cell.canMoveEast()) {
                    directions += ">";
                } else {
                    directions += " ";
                }
                
                if (numOfAnimals > 0) {
                    string += String.format("[%s %s a%-2d] ", exit, directions, numOfAnimals);
                } else {
                    string += String.format("[%s %s    ] ", exit, directions);
                }
            }
            
            string += "\r\n";
        }
        
        string += String.format("========================================\r\n");
        return string;
    }
    
    ///////////////////////////////////////
    // SETTERS
    public void setColumns(final int cols) throws Exception {
        generateMaze(cols, this.rows, this.cellSize, this.numOfExits);
        this.cols = cols;
    }
    public void setRows(final int rows) throws Exception {
        generateMaze(this.cols, rows, this.cellSize, this.numOfExits);
        this.rows = rows;
    }
    public void setWidth() {
        //TODO: Set Width
    }
    public void setHeight() {
        //TODO: Set Height
    }
    public void setX(final int x) {
        if (null != this.cells) {
            for (int r = 0; r < rows; r++) {
                for (int c = 0; c < cols; c++) {
                    cells[r][c].setLocation(x + c * cellSize, cells[r][c].getY());
                }
            }
        }
        this.x = x;
    }
    public void setY(final int y) {
        if (null != this.cells) {
            for (int r = 0; r < rows; r++) {
                for (int c = 0; c < cols; c++) {
                    cells[r][c].setLocation(cells[r][c].getX(), y + r * cellSize);
                }
            }
        }
        this.y = y;
    }
    public void setNumOfExits(final int numOfExits) throws Exception {
        generateMaze(this.cols, this.rows, this.cellSize, numOfExits);
        this.numOfExits = numOfExits;
    }
    
    ///////////////////////////////////////
    // GETTERS
    public int getWidth() {
        return cols * cellSize;
    }
    public int getWidthWithTables() {
        if (scrollPaneEscaped.getX() + scrollPaneEscaped.getWidth() 
                > scrollPaneStuck.getX() + scrollPaneStuck.getWidth()) {
            return (cols * cellSize) + Maze.UI_GAP + scrollPaneEscaped.getWidth() + getCellSize();
        } else {
            return (cols * cellSize) + Maze.UI_GAP + scrollPaneStuck.getWidth() + getCellSize();
        }
    }
    public int getHeight() {
        return rows * cellSize;
    }
    public int getColumns() {
        return cols;
    }
    public int getRows() {
        return rows;
    }
    public int getX() {
        return x;
    }
    public int getY() {
        return y;
    }
    public int getCellSize() {
        return cellSize;
    }
    public int getAnimalSize() {
        return animalSize;
    }
    public int getNumOfExits() {
        return numOfExits;
    }
    public MazeCell getCell(int col, int row) {
        if (row < 0 || row >= rows || col < 0 || col >= cols) {
            return null;
        }
        return cells[row][col];
    }
    public MazeCell[][] getCells() {
        return cells;
    }
    public MazeCell[][] getBorderCells() {
        return borderCells;
    }
    public int getNumOfAnimalsAt(int col, int row) {
        return cells[row][col].animals.size();
    }
    public ArrayList<Animal> getAnimals() {
        return new ArrayList<>(animals);
    }
    
    /**
     * Create Message Tables
     * @param layeredPane JLayeredPane that the tables will be added to.
     */
    protected void createMessageTables(JLayeredPane layeredPane) {
        
        if (null != scrollPaneEscaped && null != scrollPaneEscaped.getParent())
            scrollPaneEscaped.getParent().remove(scrollPaneEscaped);
        if (null != lblEscaped && null != lblEscaped.getParent())
            lblEscaped.getParent().remove(lblEscaped);
        if (null != scrollPaneStuck && null != scrollPaneStuck.getParent())
            scrollPaneStuck.getParent().remove(scrollPaneStuck);
        if (null != lblStuck && null != lblStuck.getParent())
            lblStuck.getParent().remove(lblStuck);
        
        int x = getX() + getWidth() + Maze.UI_GAP + getCellSize();
        int y1 = getY();
        int y2 = getY() + getHeight()/2 + 14;
        int yOffset1 = 28;
        
        // Escaped stuff
        lblEscaped = new JLabel("Escaped Animals");
        lblEscaped.setBounds(x, y1, 200, 16);
        
        scrollPaneEscaped = new JScrollPane();
        scrollPaneEscaped.setBounds(x, y1 + yOffset1, 225, getHeight()/2 - yOffset1 - yOffset1/2);
        
        tableEscaped = new JTable();
        scrollPaneEscaped.setViewportView(tableEscaped);
        tableEscaped.setModel(new DefaultTableModel(
            new Object[][] {
                {"0", "cat", "00:00:00.0"},
                {"1", "dog", "00:00:00.0"},
            },
            new String[] {
                "UID", "Species", "Escape Time"
            }
        ) {
            Class[] columnTypes = new Class[] {
                String.class, String.class, String.class
            };
            public Class getColumnClass(int columnIndex) {
                return columnTypes[columnIndex];
            }
            boolean[] columnEditables = new boolean[] {
                false, false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableEscaped.getColumnModel().getColumn(0).setResizable(false);
        tableEscaped.getColumnModel().getColumn(0).setPreferredWidth(25);
        tableEscaped.getColumnModel().getColumn(1).setResizable(false);
        tableEscaped.getColumnModel().getColumn(2).setResizable(false);
        tableEscaped.setRowSelectionAllowed(false);
        //tableEscaped.setShowVerticalLines(false);
        
        // Stuck stuff
        lblStuck = new JLabel("Stuck Animals");
        lblStuck.setBounds(x, y2, 200, 16);
        
        scrollPaneStuck = new JScrollPane();
        scrollPaneStuck.setBounds(x, y2 + yOffset1, 225, getHeight()/2 - yOffset1 - yOffset1/2);
        
        tableStuck = new JTable();
        scrollPaneStuck.setViewportView(tableStuck);
        tableStuck.setModel(new DefaultTableModel(
            new Object[][] {
                {"2", "wolf"},
                {"3", "fox"},
            },
            new String[] {
                "UID", "Species"
            }
        ) {
            Class[] columnTypes = new Class[] {
                String.class, String.class
            };
            public Class getColumnClass(int columnIndex) {
                return columnTypes[columnIndex];
            }
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableStuck.getColumnModel().getColumn(0).setResizable(false);
        tableStuck.getColumnModel().getColumn(0).setPreferredWidth(25);
        tableStuck.getColumnModel().getColumn(1).setResizable(false);
        tableStuck.setRowSelectionAllowed(false);
        //tableStuck.setShowVerticalLines(false);
        
        layeredPane.add(scrollPaneEscaped);
        layeredPane.add(lblEscaped);
        layeredPane.add(scrollPaneStuck);
        layeredPane.add(lblStuck);
        
        // update tables
        updateEscapedTable();
        updateStuckTable();
    }
    
    /**
     * Update Escaped Table.
     */
    protected void updateEscapedTable() {
        if (null != tableEscaped) {
            DefaultTableModel model = ((DefaultTableModel) tableEscaped.getModel());
            model.setRowCount(0);
            
            for (Animal a : escapedAnimals) {
                model.addRow(new Object[] { String.valueOf(a.getUID()), a.getSpecies(), a.getEscapeTime() });
            }
            
            tableEscaped.setModel(model);
        }
    }
    
    /**
     * Update Stuck Table.
     */
    protected void updateStuckTable() {
        if (null != tableStuck) {
            DefaultTableModel model = ((DefaultTableModel) tableStuck.getModel());
            model.setRowCount(0);
            
            for (Animal a : stuckAnimals) {
                model.addRow(new Object[] { String.valueOf(a.getUID()), a.getSpecies() });
            }
            tableStuck.setModel(model);
        }
    }

}
