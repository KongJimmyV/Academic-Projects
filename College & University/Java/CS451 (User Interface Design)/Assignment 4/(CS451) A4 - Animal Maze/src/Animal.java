import java.awt.Color;
import java.awt.Image;
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.Stack;
import java.util.Vector;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.SwingWorker;
import javax.swing.Timer;
import javax.swing.border.MatteBorder;

/**
 * Description:
 *      - An Animal.
 *      
 * Project:     Assignment 4 - Temporal System With Animation
 * Class:       CS451
 * Team:        Hunter Sutter, Kong Jimmy Vang
 * 
 * Sources: 
 *  - https://www.geeksforgeeks.org/rat-in-a-maze-backtracking-using-stack/
 *  - https://www.geeksforgeeks.org/rat-in-a-maze-backtracking-2/
 *  - https://www.youtube.com/watch?v=PwxGTHraMNg
 *  - https://www.youtube.com/watch?v=sTRK9mQgYuc
 *  - http://www.migapro.com/depth-first-search/
 *  - https://stackoverflow.com/questions/23302698/java-check-if-two-rectangles-overlap-at-any-point
 * 
 * @author Kong Jimmy Vang
 */
public class Animal extends JLabel {
    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    ///////////////////////////////////////
    // FIELD VARIABLES
    final public static int TIME_CONSTANT = 1000;
    final public static int TIME_DIV = 30;
    final public static String ANIMAL_FOLDER_LOCATION = "images" + File.separator 
                                                      + "animals-nature" + File.separator ;
    public static int ANIMAL_SPACING;
    
    private int uid;                // Unique Identifier.
    
    private Maze maze;              // The current maze this animal is in.
    private MazeCell currentCell;   // The current cell this animal is in.
    protected Timer movementTimer;  // Timer for movement.
    
    //private int x;              // The x location.
    //private int y;              // The y location.
    //private int width;          // The width.
    //private int height;         // The height.
    private double timeToPoint; // Time it takes to reach point.
    
    private JLabel sleepyIcon;  // Sleep Icon.
    private boolean isSleeping; // If true, animal is sleeping.
    private boolean isEscaped;  // If true, animal has escaped.
    private boolean isStuck;    // If true, animal has escaped.
    private String escapeTime;  // Escape time.
    
    private String species;     // The name of the animal species.
    
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
     * Stores the path of this animal. 
     * The top of stack must always be the MazeCell this animal is in, hence frontier.
     * Used for Depth First Search algorithm.
     */
    private Stack<MazeCell> frontier;
    
    /** 
     * Cells explored by this animal.
     * Used for Depth First Search algorithm.
     */
    private Stack<MazeCell> explored;
    
    /** Depth First Search Counter for 'move()'. */
    private int dfsCounter;
    
    // CONSTRUCTORS
    /**
     * Creates an Animal swing component that can move around.
     * 
     * @param maze          - The maze this animal will be in.
     * @param currentCell   - The current cell this animal will be placed in. (If null, place animal in random cell)
     * @param x             - The X position.
     * @param y             - The Y position.
     * @param width         - The width (in pixels)
     * @param height        - The height (in pixels)
     * @param timeToPoint   - The time to move to a point.
     * @param species       - The species name.
     * @param uid           - The assigned Unique Identifier.
     */
    public Animal(final Maze maze, 
                  final MazeCell currentCell, 
                  final int x, 
                  final int y, 
                  final int width, 
                  final int height, 
                  final double timeToPoint,
                  final String species, 
                  final int uid) {
        super();
        
        this.setLocation(x, y);
        this.setSize(width, height);
        this.setHorizontalAlignment(SwingConstants.CENTER);
        //this.setOpaque(true);
        //this.setText(species);
        this.setToolTipText(species + "  |  UID: " + uid);
        //this.setBorder(new MatteBorder(2, 2, 2, 2, Color.black));
        
        ANIMAL_SPACING = maze.getCellSize();
        
        this.maze = maze;
        if (null != currentCell) {
            this.currentCell = currentCell;
        } else {
            Random rand = new Random();
            int r = rand.nextInt(maze.getRows());
            int c = rand.nextInt(maze.getColumns());
            this.currentCell = maze.getCell(c, r);
        }
        this.timeToPoint = timeToPoint;
        this.setSpecies(species);
        this.uid = uid;
        
        this.isSleeping = false;
        this.isEscaped = false;
        this.isStuck = false;
        this.escapeTime = "00:00:00.0";
        
        // Setup Lists and Stacks
        this.directions = new ArrayList<>();
        for (int i = 0; i < DIRECTIONS.length; i++ ) {
            this.directions.add(DIRECTIONS[i]);
        }
        
        this.frontier = new Stack<>();
        if (null != currentCell) 
            frontier.push(currentCell);
        
        this.explored = new Stack<>();
        if (null != currentCell) 
            explored.push(currentCell);
    }
    
    ///////////////////////////////////////
    // METHODS/FUNCTIONS
    /**
     * Clean and destroy this object.
     */
    public void destroy() {
        
        currentCell.animals.remove(this);
        
        maze = null;
        currentCell = null;
        species = null;
        uid = -1;
        setLocation(-getWidth(), -getHeight());
        this.getParent().remove(this);
    }
    
    public boolean isColliding(Animal a2) {
        Rectangle rect2 = new Rectangle(a2.getX(), a2.getY(), a2.getWidth(), a2.getHeight());
        return this.isColliding(rect2);
    }
    
    public boolean isColliding(Rectangle rect2) {
        Rectangle rect1 = new Rectangle(this.getX(), this.getY(), this.getWidth(), this.getHeight());
        boolean b = rect1.intersects(rect2);
        if (b) return b;
        b = rect2.intersects(rect1);
        return b;
    }
    
    /**
     * Move north 1 cell in the maze.
     * @return Returns true if movement was successful.
     */
    public synchronized boolean moveNorth() {
        if (null != currentCell && currentCell.canMoveNorth()) {
            int row = currentCell.getRow();
            int col = currentCell.getCol();
            int rowNew = row - 1;
            int colNew = col;
            
            MazeCell next = maze.getCell(colNew, rowNew);
            
            if (null != next) {
                Point p1 = next.getCenter();
                this.moveToPoint(p1.x - getWidth() / 2, p1.y - getHeight() / 2, false);
                
                currentCell.animals.remove(this);
                currentCell = next;
                
                currentCell.animals.add(this);
            } else {
                Point p1 = currentCell.getCenter();
                int x2 = p1.x;
                int y2 = p1.y - maze.getCellSize() - maze.getCellSize()/2;
                int x3 = x2;
                
                synchronized (this) {
                    int infLoopCounter = 0;
                    int maxInfLoopCounter = 100000;
                    ArrayList<Animal> animals = maze.getAnimals();
                    for (int i = 0; i < animals.size() && infLoopCounter < maxInfLoopCounter; i++) {
                        Animal a = animals.get(i);
                        Point p2 = a.getCenter();
                        if (p2.x == x3 && p2.y == y2) {
                            Random r = new Random();
                            int u = r.nextInt(2);
                            if (u <= 0) {
                                x3 += ANIMAL_SPACING;
                            } else {
                                x3 -= ANIMAL_SPACING;
                            }
                            i=0;
                        }
                        infLoopCounter++;
                    }
                }
                
                this.moveToPoint(x2 - getWidth() / 2, y2 - getHeight() / 2, false);
                
                while (movementTimer.isRunning()) {}
                
                currentCell.animals.remove(this);
                currentCell = null;
                
                this.moveToPoint(x3 - getWidth() / 2, y2 - getHeight() / 2, false);
            }
            
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * Move east 1 cell in the maze.
     * @return Returns true if movement was successful.
     */
    public synchronized boolean moveEast() {
        if (null != currentCell && currentCell.canMoveEast()) {
            int row = currentCell.getRow();
            int col = currentCell.getCol();
            int rowNew = row;
            int colNew = col + 1;
            
            MazeCell next = maze.getCell(colNew, rowNew);
            
            if (null != next) {
                Point p1 = next.getCenter();
                this.moveToPoint(p1.x - getWidth() / 2, p1.y - getHeight() / 2, false);
                
                currentCell.animals.remove(this);
                currentCell = next;
                
                currentCell.animals.add(this);
            } else {
                Point p1 = currentCell.getCenter();
                int x2 = p1.x + maze.getCellSize() + maze.getCellSize()/2;
                int y2 = p1.y;
                int y3 = y2;
                
                synchronized (this) {
                    int infLoopCounter = 0;
                    int maxInfLoopCounter = 100000;
                    ArrayList<Animal> animals = maze.getAnimals();
                    for (int i = 0; i < animals.size() && infLoopCounter < maxInfLoopCounter; i++) {
                        Animal a = animals.get(i);
                        Point p2 = a.getCenter();
                        if (p2.x == x2 && p2.y == y3) {
                            Random r = new Random();
                            int u = r.nextInt(2);
                            if (u <= 0) {
                                y3 += ANIMAL_SPACING;
                            } else {
                                y3 -= ANIMAL_SPACING;
                            }
                            i=0;
                        }
                        infLoopCounter++;
                    }
                }
                
                this.moveToPoint(x2 - getWidth() / 2, y2 - getHeight() / 2, false);
                
                while (movementTimer.isRunning()) {}
                
                currentCell.animals.remove(this);
                currentCell = null;
                
                this.moveToPoint(x2 - getWidth() / 2, y3 - getHeight() / 2, false);
            }
            
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * Move south 1 cell in the maze.
     * @return Returns true if movement was successful.
     */
    public synchronized boolean moveSouth() {
        if (null != currentCell && currentCell.canMoveSouth()) {
            int row = currentCell.getRow();
            int col = currentCell.getCol();
            int rowNew = row + 1;
            int colNew = col;
            
            MazeCell next = maze.getCell(colNew, rowNew);
            
            if (null != next) {
                Point p1 = next.getCenter();
                this.moveToPoint(p1.x - getWidth() / 2, p1.y - getHeight() / 2, false);
                
                currentCell.animals.remove(this);
                currentCell = next;
                
                currentCell.animals.add(this);
            } else {
                Point p1 = currentCell.getCenter();
                int x2 = p1.x;
                int y2 = p1.y + maze.getCellSize() + maze.getCellSize()/2;
                int x3 = x2;
                
                synchronized (this) {
                    int infLoopCounter = 0;
                    int maxInfLoopCounter = 100000;
                    ArrayList<Animal> animals = maze.getAnimals();
                    for (int i = 0; i < animals.size() && infLoopCounter < maxInfLoopCounter; i++) {
                        Animal a = animals.get(i);
                        Point p2 = a.getCenter();
                        if (p2.x == x3 && p2.y == y2) {
                            Random r = new Random();
                            int u = r.nextInt(2);
                            if (u <= 0) {
                                x3 += ANIMAL_SPACING;
                            } else {
                                x3 -= ANIMAL_SPACING;
                            }
                            i=0;
                        }
                        infLoopCounter++;
                    }
                }
                
                this.moveToPoint(x2 - getWidth() / 2, y2 - getHeight() / 2, false);
                
                while (movementTimer.isRunning()) {}
                
                currentCell.animals.remove(this);
                currentCell = null;
                
                this.moveToPoint(x3 - getWidth() / 2, y2 - getHeight() / 2, false);
            }
            
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * Move west 1 cell in the maze.
     * @return Returns true if movement was successful.
     */
    public synchronized boolean moveWest() {
        if (null != currentCell && currentCell.canMoveWest()) {
            int row = currentCell.getRow();
            int col = currentCell.getCol();
            int rowNew = row;
            int colNew = col - 1;
            
            MazeCell next = maze.getCell(colNew, rowNew);
            
            if (null != next) {
                Point p1 = next.getCenter();
                this.moveToPoint(p1.x - getWidth() / 2, p1.y - getHeight() / 2, false);
                
                currentCell.animals.remove(this);
                currentCell = next;
                
                currentCell.animals.add(this);
            } else {
                Point p1 = currentCell.getCenter();
                int x2 = p1.x - maze.getCellSize() - maze.getCellSize()/2;
                int y2 = p1.y;
                int y3 = y2;
                
                synchronized (this) {
                    int infLoopCounter = 0;
                    int maxInfLoopCounter = 100000;
                    ArrayList<Animal> animals = maze.getAnimals();
                    for (int i = 0; i < animals.size() && infLoopCounter < maxInfLoopCounter; i++) {
                        Animal a = animals.get(i);
                        Point p2 = a.getCenter();
                        if (p2.x == x2 && p2.y == y3) {
                            Random r = new Random();
                            int u = r.nextInt(2);
                            if (u <= 0) {
                                y3 += ANIMAL_SPACING;
                            } else {
                                y3 -= ANIMAL_SPACING;
                            }
                            i=0;
                        }
                        infLoopCounter++;
                    }
                }
                
                this.moveToPoint(x2 - getWidth() / 2, y2 - getHeight() / 2, false);
                
                while (movementTimer.isRunning()) {}
                
                currentCell.animals.remove(this);
                currentCell = null;
                
                this.moveToPoint(x2 - getWidth() / 2, y3 - getHeight() / 2, false);
            }
            
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * Move to a point 'x2' and 'y2'.
     * 
     * @param x2 - X coordinate destination 
     * @param y2 - Y coordinate destination 
     */
    public synchronized void moveToPoint(int x2, int y2, boolean lockSpeed) {
        
        int srcX, srcY;
        srcX = this.getX();
        srcY = this.getY();
        
        int destX = x2;
        int destY = y2;
        int xTemp = srcX;
        int yTemp = srcY;
        
        int distanceX = destX - srcX;
        int distanceY = destY - srcY;
        int signumX = Integer.signum(distanceX);
        int signumY = Integer.signum(distanceY);
        
        int distanceX2 = ((srcX + (signumX * maze.getCellSize())) - srcX);
        int distanceY2 = ((srcY + (signumY * maze.getCellSize())) - srcY);
        
        double distance = Math.sqrt(Math.pow(distanceX, 2) + Math.pow(distanceY, 2));
        double distance2 = Math.sqrt(Math.pow(distanceX2, 2) + Math.pow(distanceY2, 2));
        
        //if (null != movementTimer) {
            //movementTimer.stop();
        //}
        
        Animal aTemp = this;
        movementTimer = new Timer((TIME_CONSTANT / TIME_DIV), new ActionListener() {
            
            private Animal a = aTemp;
            private double time = timeToPoint * (1000d / ((double)TIME_CONSTANT / (double)TIME_DIV));
            private long lastTime = System.nanoTime();
            private int disX = lockSpeed ? distanceX2 : distanceX;
            private int disY = lockSpeed ? distanceY2 : distanceY;
            private double speed = lockSpeed ? distance2 / time : distance / time;
            private int x = xTemp;
            private int y = yTemp;
            int counter = 0;
            
            @Override
            public void actionPerformed(ActionEvent e) {
                //System.out.println(String.format("%d, %d, %d, %d, %d, %d", x, x2, y , y2, signumX, signumY));
                
                Timer t = (Timer)e.getSource();
                
                switch (signumX) {
                    case -1:
                        if (x <= x2) {
                            t.stop();
                            a.setLocation(x2, y2);
                        }
                        break;
                    case 0:
                        if (x == x2 && y == y2) {
                            t.stop();
                            a.setLocation(x2, y2);
                        }
                        break;
                    case 1:
                        if (x >= x2) {
                            t.stop();
                            a.setLocation(x2, y2);
                        }
                }
                switch (signumY) {
                    case -1:
                        if (y <= y2) {
                            t.stop();
                            a.setLocation(x2, y2);
                        }
                        break;
                    case 0:
                        if (x == x2 && y == y2) {
                            t.stop();
                            a.setLocation(x2, y2);
                        }
                        break;
                    case 1:
                        if (y >= y2) {
                            t.stop();
                            a.setLocation(x2, y2);
                        }
                }
                if (t.isRunning()) {
                    long sysTime = System.nanoTime();
                    
                    float deltaTime = (sysTime - lastTime) / 1000000000.0f;
                    lastTime = sysTime;
                    
                    int swap = counter % 2;
                    switch (swap) {
                        case 0:
                            x += (int)Math.floor( ((double)disX * speed * (double)deltaTime) );
                            y += (int)Math.floor( ((double)disY * speed * (double)deltaTime) );
                            break;
                        case 1:
                            x += (int)Math.ceil( ((double)disX * speed * (double)deltaTime) );
                            y += (int)Math.ceil( ((double)disY * speed * (double)deltaTime) );
                    }
                    
                    //System.out.println( String.format("x:%d y:%d x2:%d y2:%d disX:%d disY:%d speed:%f deltaTime:%f", x, y, x2, y2, distanceX, distanceY, speed, deltaTime) );
                    
                    switch (signumX) {
                        case -1:
                            if (x < x2) {
                                x = x2;
                            }
                            break;
                        case 1:
                            if (x > x2) {
                                x = x2;
                            }
                        }
                    switch (signumY) {
                        case -1:
                            if (y <= y2) {
                                y = y2;
                            }
                            break;
                        case 1:
                            if (y > y2) {
                                y = y2;
                            }
                    }
                    
                    a.setLocation(x, y);
                } else {
                    //a.setLocation(x2, y2);
                }
                counter++;
                
                if (movementTimer != t) {
                    t.stop();
                    
                    if (null != a.getCurrentCell()) {
                        movementTimer.stop();
                        Point p = a.getCurrentCell().getCenter();
                        a.setLocation(p.x - a.getWidth()/2, p.y - a.getHeight()/2);
                        //a.moveToPoint(p.x - a.getWidth()/2, p.y - a.getHeight()/2, false);
                    } else {
                        movementTimer.stop();
                        a.setLocation(x2, y2);
                    }
                }
            }
        });
        movementTimer.start();
        
    }
    
    /**
     * Move 1 cell using the Depth First Search algorithm.
     */
    public synchronized void move() {
        
        if (isEscaped) {
            return;
        }
        
        if (!frontier.isEmpty()) {
            MazeCell curr = frontier.peek();
            
            if (curr != null) {
                boolean hasMoved = false;
                
                // If exit is reached, return.
                int exit = curr.getExit();
                switch (exit) {
                    case 0:
                        hasMoved = this.moveNorth();
                        break;
                    case 1:
                        hasMoved = this.moveEast();
                        break;
                    case 2:
                        hasMoved = this.moveSouth();
                        break;
                    case 3:
                        hasMoved = this.moveWest();
                }
                if (exit >= 0) {
                    isEscaped = true;
                    return;
                }
                
                Collections.shuffle(directions);
                
                //System.out.println(moveCounter);
                if (dfsCounter >= 4) {
                    dfsCounter = 0;
                }
                
                while (true) {
                    Integer direction = directions.get(dfsCounter);
                    MazeCell childCell = null;
                    
                    switch (direction) {
                        case 0:
                            if (curr.canMoveNorth()) {
                                childCell = maze.getCell(curr.getCol(), curr.getRow() - 1);
                            }
                            break;
                        case 1:
                            if (curr.canMoveEast()) {
                                childCell = maze.getCell(curr.getCol() + 1, curr.getRow());
                            }
                            break;
                        case 2:
                            if (curr.canMoveSouth()) {
                                childCell = maze.getCell(curr.getCol(), curr.getRow() + 1);
                            }
                            break;
                        case 3:
                            if (curr.canMoveWest()) {
                                childCell = maze.getCell(curr.getCol() - 1, curr.getRow());
                            }
                    }
                    
                    if ( null != childCell && !explored.contains(childCell) ) {
                        explored.push(childCell);
                        frontier.push(childCell);
                        
                        switch (direction) {
                            case 0:
                                hasMoved = this.moveNorth();
                                break;
                            case 1:
                                hasMoved = this.moveEast();
                                break;
                            case 2:
                                hasMoved = this.moveSouth();
                                break;
                            case 3:
                                hasMoved = this.moveWest();
                        }
                    }
                    
                    if (hasMoved) {
                        dfsCounter = 0;
                        break;
                    }
                    
                    //System.out.println(moveCounter);
                    dfsCounter++;
                    if (dfsCounter >= 4) {
                        
                        frontier.pop();
                        
                        if (!frontier.isEmpty()) {
                            MazeCell prevCell = frontier.peek();
                            
                            int row = prevCell.getRow() - this.getRow();
                            int col = prevCell.getCol() - this.getCol();
                            
                            switch (row) {
                                case -1:
                                    // north
                                    hasMoved = this.moveNorth();
                                    break;
                                case 1:
                                    // south
                                    hasMoved = this.moveSouth();
                            }
                            switch (col) {
                                case -1:
                                    // west
                                    hasMoved = this.moveWest();
                                    break;
                                case 1:
                                    // east
                                    hasMoved = this.moveEast();
                            }
                            
                        } else {
                            // if frontier is empty, explore again.
                            frontier.push(this.getCurrentCell());
                            explored.clear();
                            move();
                            
                            //System.out.println(String.format("UID:%d isStuck:%b ", uid, isStuck));
                            setIsStuck(true);
                        }
                        
                        dfsCounter = 0;
                        break;
                    }
                }
                
                /*
                for (int i = 0; i < frontier.size(); i++) {
                    MazeCell c = frontier.get(i);
                    System.out.print( String.format("(%d, %d)|", c.getRow(), c.getCol()) );
                }
                System.out.println();
                */
                
            }
        }
    }
    
    ///////////////////////////////////////
    // SETTERS
    /**
     * Sets this Animal's new cell it will be in. 
     * Does not move the Animal's position.
     * @param cell - A MazeCell.
     * @throws NullPointerException throws exception if parameter is null.
     */
    public void setCurrentCell(MazeCell cell) throws NullPointerException {
        if (null != cell) {
            if (null != this.currentCell) 
                this.currentCell.animals.remove(this);
            this.currentCell = cell;
            this.currentCell.animals.add(this);
            
            frontier.clear();
            frontier.push(cell);
            
            explored.clear();
            explored.push(cell);
        } else {
            throw new NullPointerException(" Animal::setCurrentCell: Parameter was null.");
        }
    }
    
    /**
     * Set the center location of this Animal and move them.
     * @param center
     */
    public void setCenter(final Point center) {
        isEscaped = false;
        isStuck = false;
        this.setLocation((center.x - getWidth()) + (getWidth() / 2), 
                         (center.y - getHeight()) + (getHeight() / 2));
    }
    
    @Override
    public void setLocation(int x, int y) {
        //isEscaped = false;
        //isStuck = false;
        super.setLocation(x, y);
    }
    
    /**
     * Sets the time it takes to move to a point (x,y).
     * 'timeToPoint' is in seconds.
     * 
     * @param timeToPoint - Amount of seconds it takes to reach a point (x,y).
     */
    public void setTimeToPoint(final double timeToPoint) {
        this.timeToPoint = timeToPoint;
    }
    
    /**
     * Set the species of this Animal.
     * @param species - Species of this animal.
     */
    public void setSpecies(final String species) {
        ImageIcon image = null;
        
        try {
            image = TemporalSysApp.createSizedIcon(ANIMAL_FOLDER_LOCATION
                                                 + species + ".png", 
                                                 getWidth(), getHeight());
            
            this.setText(null);
            this.setOpaque(false);
            this.setBorder(null);
            
        } catch (IOException e) {
            System.err.println("\n" + e.getMessage() 
                                + "\n    Relative Location: \""
                                + ANIMAL_FOLDER_LOCATION
                                + species + ".png"
                                + "\"");
            //e.printStackTrace();
            
            // set defaults
            this.setText(species);
            this.setOpaque(true);
            this.setBorder(new MatteBorder(2, 2, 2, 2, Color.black));
        }
        
        this.setIcon( image );
        this.species = species;
    }
    
    /**
     * Set the Unique Identifier of this animal.
     * @param uid - Unique Identifier
     */
    protected void setUID(final int uid) {
        this.uid = uid;
    }
    
    /**
     * If set to true, then the animal is marked as escaped from the maze.
     * @param isEscaped - Is escaped?
     */
    protected void setIsEscaped(final boolean isEscaped) {
        this.isEscaped = isEscaped;
    }
    
    /**
     * If set to true, then the animal is marked as stuck in the maze.
     * @param isEscaped - Is escaped?
     */
    protected void setIsStuck(final boolean isStuck) {
        this.isStuck = isStuck;
    }

    /**
     * Set escape time.
     * @param escapeTime
     */
    public void setEscapeTime(final String escapeTime) {
        this.escapeTime = escapeTime;
    }
    
    ///////////////////////////////////////
    // GETTERS
    /**
     * @return Returns the current cell.
     */
    public MazeCell getCurrentCell() {
        return currentCell;
    }
    
    /**
     * @return Returns the Animal's column.
     */
    public int getCol() {
        int col = -1;
        if (null != currentCell) {
            //return currentCell.getCol();
            
            col = Math.round( (float)(currentCell.getX() - maze.getX()) / (float)maze.getCellSize() );
            if (col < 0) {
                col = 0;
            } else if (col > maze.getColumns()) {
                col = maze.getColumns() - 1;
            }
        } else {
            return -1;
        }
        return col;
    }
    
    /**
     * @return Returns the Animal's row.
     */
    public int getRow() {
        int row = -1;
        if (null != currentCell) {
            //return currentCell.getRow();
            
            row = Math.round( (float)(currentCell.getY() - maze.getY()) / (float)maze.getCellSize() );
            if (row < 0) {
                row = 0;
            } else if (row > maze.getRows()) {
                row = maze.getRows() - 1;
            }
        } else {
            return -1;
        }
        return row;
    }
    
    /**
     * Get the center point of this animal.
     * @return Returns the center point.
     */
    public Point getCenter() {
        Point center = new Point((getX() + (getWidth() / 2)), (getY() + (getHeight() / 2)));
        return center;
    }
    
    /**
     * Get the time it takes to move to a point in seconds.
     * @return Returns the time it takes to move to a point in seconds.
     */
    public double getTimeToPoint() {
        return timeToPoint;
    }
    
    /**
     * Get the species name of this animal.
     * @return Returns the species name.
     */
    public String getSpecies() {
        return new String(species);
    }
    
    /**
     * Get the UID of this animal and return it.
     * @return Returns the UID.
     */
    public int getUID() {
        return uid;
    }
    
    /** @return Returns true if this animal is marked escaped from the maze. */
    public boolean isEscaped() {
        return isEscaped;
    }
    
    /** @return Returns true if this animal is marked stuck in the maze. */
    public boolean isStuck() {
        return isStuck;
    }
    
    /** @return Returns the escape time. */
    public String getEscapeTime() {
        return escapeTime;
    }
    
}
