import java.awt.Component;
import java.awt.Frame;
import java.awt.Image;
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JLayeredPane;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.Timer;

/**
 * Description:
 *      - The Application
 *      
 * Project:     Assignment 4 - Temporal System With Animation
 * Class:       CS451
 * Team:        Hunter Sutter, Kong Jimmy Vang
 * 
 * Sources: 
 *  - https://stackoverflow.com/questions/5097442/java-set-a-component-on-top-of-another
 * 
 * @author Kong Jimmy Vang
 */
public class TemporalSysApp {
    
    /** 
     * The time constant. 
     * DEFAULT: 1000ms 
     */
    final public static int TIME_CONSTANT = 1000;
    
    /** 
     * The time divisor. Used for dividing the time constant. 
     * DEFAULT: 10 
     */
    final public static int TIME_DIV = 10;
    
    /**
     * Tracks amount of times the timer has performed it's actions.
     */
    private int time = 0;
    
    private double timePrev = 0;
    
    /**
     * Max sleep period with addTimer(..., speedTime, ...) at 1.0.
     */
    final public static double TIME_MAX_SLEEP = 4.0;
    
    private int state = 0;
    
    /** The Maze for the application. */
    protected Maze maze;
    
    public static int ANIMAL_SPACING;
    
    /** The swing component parent that this application is a child of. */
    private Component parent;
    
    /** The timer component that keeps track of time. */
    private Timer timer;
    
    /** Time in string format */
    private String timeString;
    
    /**
     * Creates a Temporal System Application for a Maze.
     * 
     * @param numOfColumns  - Number of columns for maze.
     * @param numOfRows     - Number of rows for maze.
     * @param offsetX       - X Offset Distance for GUI.
     * @param offsetY       - Y Offset Distance for GUI.
     * @param cellSize      - Maze Cell size for GUI (48 = 48 pixels).
     * @param animalSize    - Animal size for GUI (16 = 16 pixels).
     * @param numOfExits    - Number of exits to be generated.
     * 
     * @throws Exception    Throws an exception if an error occurs while generating a maze.
     */
    public TemporalSysApp(int numOfColumns,
                          int numOfRows,
                          int offsetX,
                          int offsetY,
                          int cellSize,
                          int animalSize,
                          int numOfExits) throws Exception {
        
        this.maze = new Maze(numOfColumns, numOfRows, 
                             offsetX, offsetY, 
                             cellSize, animalSize, 
                             numOfExits);
        
        ANIMAL_SPACING = cellSize;
        
        this.timer = null;
    }
    
    /**
     * Adds this maze to a JLayeredPane.
     * @param comp - JLayeredPane that will display the maze's MazeCells and Animals.
     */
    public void addParent(JLayeredPane comp) {
        if (comp != null) {
            parent = comp;
            
            ArrayList<Animal> animals = this.maze.getAnimals();
            MazeCell[][] cells = this.maze.getCells();
            MazeCell[][] borderCells = this.maze.getBorderCells();
            
            for (int r = 0; r < cells.length; r++) {
                for (int c = 0; c < cells[r].length; c++) {
                    comp.add(cells[r][c], 1, 0);
                }
            }
            for (int r = 0; r < borderCells.length; r++) {
                for (int c = 0; c < borderCells[r].length; c++) {
                    if (null != borderCells[r][c]) {
                        comp.add(borderCells[r][c], 1, 0);
                    }
                }
            }
            for (int i = 0; i < animals.size(); i++) {
                comp.add(animals.get(i), 2, 0);
            }
            
            this.maze.createMessageTables(comp);
            
            
            //comp.setSize(maze.getX() + maze.getWidth() + OFFSET_RIGHT, maze.getY() + maze.getHeight() + OFFSET_BOTTOM);
            //System.out.println(String.format("%d %d", maze.getWidth(), maze.getWidthWithTables()) );
            
            // Automatically adjust the size of the Window to fit the maze.
            if ( ((Frame) comp.getTopLevelAncestor()).getExtendedState() != Frame.MAXIMIZED_BOTH ) {
                if (comp.getTopLevelAncestor().getWidth() < maze.getX() + maze.getWidthWithTables() + Maze.OFFSET_RIGHT + Maze.UI_GAP) {
                    comp.getTopLevelAncestor().setSize(maze.getX() + maze.getWidthWithTables() + Maze.OFFSET_RIGHT + Maze.UI_GAP, 
                                                       comp.getTopLevelAncestor().getHeight());
                }
                if (comp.getTopLevelAncestor().getHeight() < maze.getY() + maze.getHeight() + Maze.OFFSET_BOTTOM + Maze.UI_GAP) {
                    comp.getTopLevelAncestor().setSize(comp.getTopLevelAncestor().getWidth(), 
                                                       maze.getY() + maze.getHeight() + Maze.OFFSET_BOTTOM + Maze.UI_GAP);
                }
            }
            
        }
    }
    
    /**
     * Sets a timer that moves the animals. 
     * Displays the time in a JTextField.
     * 
     * @param txtField - the JTextField to display the time in.
     * @param speedTime - The time it takes to move from cell to cell.
     */
    public void addTimer(JTextField txtField, double speedTime, boolean clear) {
        removeTimer();
        
        maze.setAllAnimalsTimeToPoint(speedTime);
        
        if (clear) {
            txtField.setText("00:00:00.0");
            time = 0;
        }
        
        timePrev = time;
        
        timer = new Timer(TIME_CONSTANT / TIME_DIV, new ActionListener() {
            
            @Override
            public void actionPerformed(ActionEvent e) {
                if (timer.isRunning()) {
                    double timeDelta = time - timePrev;
                    
                    Random rand = new Random();
                    double restingVariance = (rand.nextDouble() * (TIME_MAX_SLEEP * speedTime)) + (speedTime);
                    //System.out.println(String.format("s:%d te:%f t:%d t:%f", state, timeElapsed, time, timePrev));
                    
                    // Move
                    if (state == 1 && timeDelta >= (speedTime * TIME_DIV)) {
                        moveAllAnimals();
                        
                        timePrev = time;
                        state = 0;
                    }
                    
                    // Rest
                    else if (state == 0 && timeDelta >= (restingVariance * speedTime * TIME_DIV)) {
                        //resting
                        
                        timePrev = time;
                        state = 1;
                    }
                    
                    double seconds = (double)time / (double)TIME_DIV;
                    int hr = (int)seconds / 3600;
                    double rem = (double)seconds % 3600;
                    int mn = (int)rem / 60;
                    double sec = rem % 60.0;
                    String hrStr = (hr < 10 ? "0" : "") + hr;
                    String mnStr = (mn < 10 ? "0" : "") + mn;
                    String secStr = (sec < 10 ? "0" : "") + String.format("%.1f", sec);
                    
                    String temp = String.format("%s:%s:%s", hrStr, mnStr, secStr);
                    txtField.setText(temp);
                    
                    double tempSec = Math.round( Double.parseDouble(secStr) );
                    timeString = String.format( "%s:%s:%s", hrStr, mnStr, (tempSec < 10 ? "0" : "") + String.valueOf(tempSec) );
                    time += 1;
                }
            }
        });
    }

    public void moveAllAnimals() {
        
        maze.moveAllAnimals();
        
        //System.out.println(String.format("%d %d %d", maze.getAnimals().size(), maze.escapedAnimals.size(), maze.stuckAnimals.size()));
        synchronized (this) {
            
            for (Animal a : maze.getAnimals()) {
                
                boolean done = false;
                boolean pushed = false;
                if (a.isEscaped()) {
                    Point p = a.getCenter();
                    int x2 = p.x;
                    int y2 = p.y;
                    int x3 = x2;
                    int y3 = y2;
                    
                    int infLoopCounter = 0;
                    int maxInfLoopCounter = 100000;
                    
                    ArrayList<Animal> animals = maze.getAnimals();
                    for (int i = 0; i < animals.size() && infLoopCounter < maxInfLoopCounter; i++) {
                        Animal a2 = animals.get(i);
                        if (a2 != a && null != a2.movementTimer && !a2.movementTimer.isRunning()
                                && null != a.movementTimer && !a.movementTimer.isRunning()) {
                            //System.out.println("T1");
                            //Point p2 = a2.getCenter();
                            
                            // Push away from maze.
                            if (a2.isEscaped()) {
                                while (!pushed) {
                                    
                                    /*
                                    System.out.println(String.format("x:%d %d %d %d | y:%d %d %d %d", 
                                            x3,
                                            maze.getX() - maze.getCellSize(),
                                            maze.getX() + maze.getWidth() + maze.getCellSize(),
                                            maze.getX() + maze.getWidth()/2,
                                            y3,
                                            maze.getY() - maze.getCellSize(),
                                            maze.getY() + maze.getHeight() + maze.getCellSize(),
                                            maze.getY() + maze.getHeight()/2
                                            ));
                                    //*/
                                    
                                    if (x3 > maze.getX() - maze.getCellSize()
                                            && x3 < maze.getX() + maze.getWidth()/2
                                            && y3 > maze.getY()
                                            && y3 < maze.getY() + maze.getHeight()) {
                                        x3 -= maze.getCellSize()/2;
                                        //System.out.println("x-=" + x3);
                                        continue;
                                    } else if (x3 < maze.getX() + maze.getWidth() + maze.getCellSize()
                                            && x3 >= maze.getX() + maze.getWidth()/2
                                            && y3 > maze.getY()
                                            && y3 < maze.getY() + maze.getHeight()) {
                                        x3 += maze.getCellSize()/2;
                                        //System.out.println("x-=" + x3);
                                        continue;
                                    }
                                    
                                    if (y3 > maze.getY() - maze.getCellSize()
                                            && y3 < maze.getY() + maze.getHeight()/2
                                            && x3 > maze.getX()
                                            && x3 < maze.getX() + maze.getWidth()) {
                                        y3 -= maze.getCellSize()/2;
                                        //System.out.println("y-=" + y3);
                                        continue;
                                    } else if (y3 < maze.getY() + maze.getHeight() + maze.getCellSize()
                                            && y3 >= maze.getY() + maze.getHeight()/2
                                            && x3 > maze.getX()
                                            && x3 < maze.getX() + maze.getWidth()) {
                                        y3 += maze.getCellSize()/2;
                                        //System.out.println("y-=" + y3);
                                        continue;
                                    }
                                    pushed = true;
                                }
                                
                                //System.out.println(String.format("T --> x3:%d y3:%d ", x3, y3));
                                
                                // Push away from animals.
                                Rectangle rect2 = new Rectangle(x3, y3, maze.getAnimalSize(), maze.getAnimalSize());
                                
                                if ( x3 < maze.getX() || x3 > maze.getX() + maze.getWidth() ) {
                                    if (a2.isColliding(rect2)) {
                                        Random r = new Random();
                                        int u = r.nextInt(2);
                                        if (u <= 0) {
                                            y3 += ANIMAL_SPACING;
                                        } else {
                                            y3 -= ANIMAL_SPACING;
                                        }
                                        //System.out.println("T2: " + a2.isColliding(rect2));
                                        i=0;
                                    }
                                    if (y3 < maze.getY() - maze.getCellSize() - maze.getAnimalSize()/2 ) {
                                        y3 += ANIMAL_SPACING;
                                        //System.out.println("T3: " + a2.isColliding(rect2));
                                        //i=0;
                                    }
                                    else if (y3 > maze.getY() + maze.getWidth() + maze.getCellSize() + maze.getAnimalSize()/2 ) {
                                        y3 -= ANIMAL_SPACING;
                                        //System.out.println("T4: " + a2.isColliding(rect2));
                                        //i=0;
                                    }
                                }
                                if ( y3 < maze.getY() || y3 > maze.getY() + maze.getHeight() ) {
                                    if (a2.isColliding(rect2)) {
                                        Random r = new Random();
                                        int u = r.nextInt(2);
                                        if (u <= 0) {
                                            x3 += ANIMAL_SPACING;
                                        } else {
                                            x3 -= ANIMAL_SPACING;
                                        }
                                        //System.out.println("T5: " + a2.isColliding(rect2));
                                        i=0;
                                    }
                                    if (x3 < maze.getX() - maze.getCellSize() - maze.getAnimalSize()/2 ) {
                                        x3 += ANIMAL_SPACING;
                                        //System.out.println("T6: " + a2.isColliding(rect2));
                                        //i=0;
                                    }
                                    if (x3 > maze.getX() + maze.getHeight() + maze.getCellSize() + maze.getAnimalSize()/2 ) {
                                        x3 -= ANIMAL_SPACING;
                                        //System.out.println("T7: " + a2.isColliding(rect2));
                                        //i=0;
                                    }
                                }
                            }
                        }
                        done = true;
                        
                        infLoopCounter++;
                    }
                    a.moveToPoint(x3 - a.getWidth() / 2, y3 - a.getHeight() / 2, false);
                    
                }
                if (a.isEscaped()) {
                    escapeAlert(a);
                }
                if (a.isStuck()) {
                    stuckAlert(a);
                }
                
                if (done && maze.getAnimals().size() == maze.escapedAnimals.size() + maze.stuckAnimals.size()) {
                    stopTimer();
                    int escaped = maze.escapedAnimals.size();
                    int stuck = maze.stuckAnimals.size();
                    JOptionPane.showMessageDialog(parent, 
                                                  String.format(
                                                          "All animals have either escaped or have found no path to an exit.\r\n"
                                                          + "    Escaped Animals: %d\r\n"
                                                          + "    Stuck Animals: %d", escaped, stuck),
                                                  "End",
                                                  JOptionPane.INFORMATION_MESSAGE);
                    break;
                }
                
            }
            
        }
    }
    
    /**
     * Removes the current timer.
     */
    public void removeTimer() {
        this.stopTimer();
        if (null != timer && timer.getActionListeners().length > 0) {
            timer.removeActionListener(timer.getActionListeners()[0]);
        }
        timePrev = time;
        timer = null;
    }
    
    /**
     * Pauses the current timer.
     */
    public void pauseTimer() {
        if (null != timer) {
            timer.stop();
        }
    }
    
    /**
     * Starts the current timer.
     */
    public void startTimer() {
        if (null != timer) {
            timer.start();
        }
    }
    
    /**
     * Stops the current timer.
     */
    public void stopTimer() {
        if (null != timer) {
            timer.stop();
        }
    }
    
    /**
     * Generates the Maze.
     * @throws Exception
     */
    public void generateMaze() throws Exception {
        maze.generateMaze();
        JLayeredPane pane = (JLayeredPane) parent;
        this.addParent(pane);
    }
    
    /**
     * Updates the Maze tables with a new escaped animal.
     * @param a - Animal
     */
    public void escapeAlert(Animal a) {
        if ( !maze.escapedAnimals.contains(a) ) {
            a.setEscapeTime(timeString);
            maze.escapedAnimals.add(a);
            maze.updateEscapedTable();
        }
    }
    
    /**
     * Updates the Maze tables with a new stuck animal.
     * @param a - Animal
     */
    public void stuckAlert(Animal a) {
        if ( !maze.stuckAnimals.contains(a) ) {
            a.setEscapeTime(timeString);
            maze.stuckAnimals.add(a);
            maze.updateStuckTable();
        }
    }
    
    /**
     * Creates a sized ImageIcon. Used to resize images.
     * 
     * @param fileLocation  - location of file
     * @param width         - resized width
     * @param height        - resized height
     * @return
     * @throws IOException
     */
    public static ImageIcon createSizedIcon(String fileLocation, 
                                            int width, 
                                            int height) throws IOException {
        BufferedImage img = null;
        img = ImageIO.read(new File(fileLocation));
        
        Image dimg = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        
        ImageIcon imageIcon = new ImageIcon(dimg);
        
        return imageIcon;
    }
}
