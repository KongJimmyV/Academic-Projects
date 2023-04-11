import java.awt.EventQueue;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.Dimension;

import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.Timer;
import javax.swing.JLayeredPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;
import javax.swing.JScrollPane;
import javax.swing.JTextPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import java.awt.Color;

/**
 * Description:
 *      - Tester GUI for Maze Application.
 *      
 * Project:     Assignment 4 - Temporal System With Animation
 * Class:       CS451
 * Team:        Hunter Sutter, Kong Jimmy Vang
 * 
 * Sources: 
 *  - N/A
 * 
 * @author Kong Jimmy Vang
 */
public class TemporalSysGuiTest {

    final private int numOfColumns = 15;
    final private int numOfRows    = 15;
    final private int offsetX      = 100;
    final private int offsetY      = 160;
    final private int cellSize     = 48;
    final private int animalSize   = 36;
    final private int numOfExits   = 6;
    
    private TemporalSysApp mainApp;
    
    private JFrame frmTestGui;
    private JLayeredPane layeredPaneMaze;
    private JTextField txtTime;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    TemporalSysGuiTest window = new TemporalSysGuiTest();
                    window.frmTestGui.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the application.
     */
    public TemporalSysGuiTest() {
        initialize();
    }

    /**
     * Initialize the contents of the frame.
     */
    private void initialize() {
        frmTestGui = new JFrame();
        frmTestGui.getContentPane().setBackground(new Color(211, 206, 123));
        frmTestGui.setTitle("Test GUI");
        frmTestGui.setBounds(100, 10, 600, 420);
        frmTestGui.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frmTestGui.getContentPane().setLayout(new CardLayout(0, 0));
        
        layeredPaneMaze = new JLayeredPane();
        frmTestGui.getContentPane().add(layeredPaneMaze, "name_735789589732800");
        
        JButton btnGenerateMaze = new JButton("Generate Maze");
        btnGenerateMaze.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    mainApp.generateMaze();
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            }
        });
        btnGenerateMaze.setBounds(60, 10, 140, 23);
        layeredPaneMaze.add(btnGenerateMaze);
        
        JButton btnNewButton = new JButton("Reposition All Animals");
        btnNewButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    mainApp.stopTimer();
                    mainApp.maze.repositionAllAnimals();
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            }
        });
        btnNewButton.setBounds(212, 8, 170, 26);
        layeredPaneMaze.add(btnNewButton);
        
        JButton btnMoveAllAnimals = new JButton("Move All Animals");
        btnMoveAllAnimals.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                mainApp.moveAllAnimals();
            }
        });
        btnMoveAllAnimals.setBounds(60, 42, 140, 26);
        layeredPaneMaze.add(btnMoveAllAnimals);
        
        txtTime = new JTextField();
        txtTime.setHorizontalAlignment(SwingConstants.TRAILING);
        txtTime.setText("00:00:00.0");
        txtTime.setBounds(394, 11, 158, 20);
        layeredPaneMaze.add(txtTime);
        txtTime.setColumns(10);
        
        JButton btnStop = new JButton("Stop Escape");
        btnStop.setHorizontalAlignment(SwingConstants.LEADING);
        btnStop.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                mainApp.stopTimer();
            }
        });
        
        JButton btnEscapeMaze = new JButton("Escape");
        btnEscapeMaze.setHorizontalAlignment(SwingConstants.LEADING);
        btnEscapeMaze.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                mainApp.addTimer(txtTime, 1.0, false);
                mainApp.startTimer();
            }
        });
        btnEscapeMaze.setBounds(212, 42, 170, 26);
        layeredPaneMaze.add(btnEscapeMaze);
        
        JButton btnEscapeAccelerated = new JButton("Escape (accelerated)");
        btnEscapeAccelerated.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                mainApp.addTimer(txtTime, 0.5, false);
                mainApp.startTimer();
            }
        });
        btnEscapeAccelerated.setHorizontalAlignment(SwingConstants.LEADING);
        btnEscapeAccelerated.setBounds(212, 68, 170, 26);
        layeredPaneMaze.add(btnEscapeAccelerated);
        btnStop.setBounds(382, 42, 170, 26);
        layeredPaneMaze.add(btnStop);
        
        JButton btnEscapeSuperAccelerated = new JButton("Escape (super speed)");
        btnEscapeSuperAccelerated.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                mainApp.addTimer(txtTime, 0.1, false);
                mainApp.startTimer();
            }
        });
        btnEscapeSuperAccelerated.setHorizontalAlignment(SwingConstants.LEADING);
        btnEscapeSuperAccelerated.setBounds(382, 68, 170, 26);
        layeredPaneMaze.add(btnEscapeSuperAccelerated);
        
        setupApplication();
        setupGui();
    }
    
    /**
     * Set up the GUI.
     */
    private void setupGui() {
        JFrame frame = frmTestGui;
        
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        
        // If window is off the display screen, bring it back into the screen bounds.
        if ( (frame.getX() + frame.getWidth()) > screenSize.width ) {
            frame.setLocation(screenSize.width - frame.getWidth(), frame.getY());
        }
        if ( frame.getX() < 0 ) {
            frame.setLocation(0, frame.getY());
        }
        if ( (frame.getY() + frame.getHeight()) > screenSize.height ) {
            frame.setLocation(frame.getX(), screenSize.height - frame.getHeight());
        }
        if ( frame.getY() < 0 ) {
            frame.setLocation(frame.getX(), 0);
        }
    }
    
    /**
     * Set up the Application.
     */
    private void setupApplication() {
        
        // Create Application. 
        try {
            mainApp = new TemporalSysApp(numOfColumns, numOfRows, offsetX, offsetY, cellSize, animalSize, numOfExits);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Spawn Animals. 
        final File folder = new File("images" + File.separator + "animals-nature");
        
        //spawnAnimalsFromFolder(folder);
        
        ///*
        mainApp.maze.spawnAnimal("leopard", 1.0);
        mainApp.maze.spawnAnimal("horse", 1.0);
        mainApp.maze.spawnAnimal("dog", 1.0);
        mainApp.maze.spawnAnimal("cat", 1.0);
        mainApp.maze.spawnAnimal("bird", 1.0);
        mainApp.maze.spawnAnimal("rat", 1.0);
        mainApp.maze.spawnAnimal("mouse", 1.0);
        
        //mainApp.maze.spawnAnimal("rat", 1.0, 0, 0);
        //*/
        
        // Add application to a JLayeredPane to show the maze.
        mainApp.addParent(layeredPaneMaze);
        
        //System.out.println(mainApp.maze.getWidthWithTables() + mainApp.maze.getX() + 100);
    }
    
    private void spawnAnimalsFromFolder(final File folder) {
        for (final File fileEntry : folder.listFiles()) {
            if (fileEntry.isDirectory()) {
                spawnAnimalsFromFolder(fileEntry);
            } else {
                mainApp.maze.spawnAnimal(fileEntry.getName().substring(0, fileEntry.getName().lastIndexOf('.')), animalSize);
            }
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
    private ImageIcon createSizedIcon(String fileLocation, 
                                      int width, 
                                      int height) throws IOException {
        BufferedImage img = null;
        img = ImageIO.read(new File(fileLocation));
        
        Image dimg = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        
        ImageIcon imageIcon = new ImageIcon(dimg);
        
        return imageIcon;
    }
}
