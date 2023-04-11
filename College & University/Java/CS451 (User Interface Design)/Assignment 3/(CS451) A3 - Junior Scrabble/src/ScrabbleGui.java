import java.awt.EventQueue;
import java.awt.Font;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.SystemColor;
import java.awt.Toolkit;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.SwingWorker;
import javax.swing.JSeparator;
import javax.swing.UIManager;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JComboBox;
import javax.imageio.ImageIO;
import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JTextField;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;
import javax.swing.RowFilter;
import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.Document;
import javax.swing.text.DocumentFilter;
import javax.swing.text.PlainDocument;
import javax.swing.JTextPane;
import javax.swing.JLayeredPane;
import javax.swing.JInternalFrame;
import java.awt.CardLayout;
import java.awt.FlowLayout;
import javax.swing.JTextArea;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Map.Entry;

import javax.swing.event.AncestorListener;
import javax.swing.event.AncestorEvent;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.GridLayout;
import java.awt.BorderLayout;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;

/**
 * ScrabbleGui
 * 
 * Description:
 *      - The Scrabble GUI.
 *      
 * Project:     Assignment 3 - Scrabble
 * Class:       CS451
 * Team:        Hunter Sutter, Kong Jimmy Vang
 * 
 * Sources: 
 *  - How to Create Easing Animation in Java Swing
 *      > https://www.youtube.com/watch?v=9wKm55uhw68
 *  - Scrabble Letters and Tiles (Free Printable SVG Patterns)
 *      > https://suncatcherstudio.com/lettering-fonts/scrabble-letters-tiles/
 * 
 * @author Kong Jimmy Vang
 */
public class ScrabbleGui {

	private Scrabble mainApp;
	
	private int difficulty = 0;      // 0 = beginner, 1 = challenger
	private int numOfPlayers = -1;   // auto-set in "setNumOfPlayers" function
	private int maxPlayers = 4;
	private int maxDraw = 7;
	
	/** Current player's turn (Handle in "endTurn()" function)
     *      1 = player 1
     *      2 = player 2
     *      3 = player 3
     *      4 = player 4
     */
	private int currentTurn = 1;            
	
	private int boardSizeX = -1;           // auto-set in create board functions "createBeginnerBoard()" "createChallengerBoard()"
	private int boardSizeY = -1;           // auto-set in create board functions "createBeginnerBoard()" "createChallengerBoard()"
	private int boardOffsetX = 120;        // auto-set in create board functions "createBeginnerBoard()" "createChallengerBoard()"
	private int boardOffsetY = 120 + 31;   // auto-set in create board functions "createBeginnerBoard()" "createChallengerBoard()"
	private int tileSize = 44;
	private int borderSize = 2;
	
	/**
	 * This 2d array represents the board tiles.
	 * Build this array in "createBeginnerBoard()" and "createChallengerBoard()".
	 */
	private JLetterTile lblBoardTiles[][];
	
	/** 
	 * This 2d array stores the letter tiles for the board.
	 * Build this array in "setupGame()".
     */
	private JLetterTile lblLetterTiles[][];
	
	/** 
     * This 2d array stores the letter tiles for each player.
     * Build this array in "setupGame()".
     * 
     *      Player 1: lblPlayerLetterTiles[0][7]
     *      Player 2: lblPlayerLetterTiles[1][7]
     *      Player 3: lblPlayerLetterTiles[2][7]
     *      Player 4: lblPlayerLetterTiles[3][7]
     */
	private JLetterTile lblPlayerLetterTiles[][]; 
	
	/**
	 * Used for moving letter tiles with mouse.
	 */
	private int screenX, screenY, myX, myY, oldX, oldY;
    
    /**
     * Double click feature for Buttons. Shows global feature.
     */
    private boolean isAlreadyOneClick;
	
    /**
     * HowToPlay window
     */
    HowToPlay windowHowToPlay;
    
	/**
	 * Scrabble Frame
	 */
	private JFrame frmScrabble;
	
	private JTextField txtName1;
	private JTextField txtName2;
	private JTextField txtName3;
	private JTextField txtName4;
	private JLabel lblName1;
	private JLabel lblName2;
	private JLabel lblName3;
	private JLabel lblName4;
	
	private JPanel panelHome;
	private JPanel panelSelect;
	private JPanel panelEnterInfo;
	private JPanel panelBoard;
	
	private JComboBox comboBoxNumOfPlayers;
	private JLabel lblPlayer1;
	private JLabel lblPlayer2;
	private JLabel lblPlayer3;
	private JLabel lblPlayer4;
	private JLabel lblScore1;
	private JLabel lblScore2;
	private JLabel lblScore3;
	private JLabel lblScore4;
	private JButton btnEndTurn;
	private JButton btnHowToPlay;
	private JButton btnBoardEndGame;
	private JButton btnResetActions;
	private JButton btnPass;
	private JLabel lblMsg;
	private JLabel lblMsg2;
	private JLabel lblMsg3;
	
	public static void main (String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ScrabbleGui window = new ScrabbleGui();
					window.frmScrabble.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	public ScrabbleGui() throws Exception {
		initialize();
	}
	
	
	
	private void initialize() throws Exception {
		mainApp = new Scrabble();
		
		//Initialize Main Frame
		frmScrabble = new JFrame();
		frmScrabble.getContentPane().setLocation(-112, -125);
		frmScrabble.getContentPane().setLayout(new CardLayout(0, 0));
        frmScrabble.setTitle("Scrabble");
        frmScrabble.setResizable(false);
        frmScrabble.setBounds(100, 20, 1000, 1000);
        frmScrabble.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
		panelHome = new JPanel();
		panelHome.setLayout(null);
		frmScrabble.getContentPane().add(panelHome, "name_97044216737200");
        
		JButton btnNewGame = new JButton("New Game");
		btnNewGame.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		        panelHome.setVisible(false);
		        panelSelect.setVisible(true);
		    }
		});
		btnNewGame.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnNewGame.setBounds(435, 460, 120, 31);
		panelHome.add(btnNewGame);
		
		JButton btnExit = new JButton("Exit");
		btnExit.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		        System.exit(0);
		    }
		});
		btnExit.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnExit.setBounds(435, 494, 120, 31);
		panelHome.add(btnExit);
		
		panelSelect = new JPanel();
		panelSelect.setLayout(null);
		frmScrabble.getContentPane().add(panelSelect, "name_188916622099200");
		
		JButton btnSelectGoBack = new JButton("Go Back");
		btnSelectGoBack.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
                panelSelect.setVisible(false);
                panelHome.setVisible(true);
		    }
		});
		btnSelectGoBack.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnSelectGoBack.setBounds(435, 460, 120, 31);
		panelSelect.add(btnSelectGoBack);
		
		JButton btnSelectBeginner = new JButton("Beginner");
		btnSelectBeginner.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		        difficulty = 0;
		        
		        comboBoxNumOfPlayers.setModel(new DefaultComboBoxModel(new String[] {"2"}));
		        comboBoxNumOfPlayers.setSelectedIndex(0);
		        setNumOfPlayers(2);
		        
		        panelSelect.setVisible(false);
                panelEnterInfo.setVisible(true);
                
		    }
		});
		btnSelectBeginner.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnSelectBeginner.setBounds(435, 494, 120, 31);
		panelSelect.add(btnSelectBeginner);
		
		JButton btnSelectChallenger = new JButton("Challenger");
		btnSelectChallenger.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		        difficulty = 1;
		        
		        comboBoxNumOfPlayers.setModel(new DefaultComboBoxModel(new String[] {"2", "3", "4"}));
		        comboBoxNumOfPlayers.setSelectedIndex(0);
		        setNumOfPlayers(2);
		        
                panelSelect.setVisible(false);
                panelEnterInfo.setVisible(true);
                
		    }
		});
		btnSelectChallenger.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnSelectChallenger.setBounds(435, 528, 120, 31);
		panelSelect.add(btnSelectChallenger);
		
		panelEnterInfo = new JPanel();
		panelEnterInfo.setLayout(null);
		frmScrabble.getContentPane().add(panelEnterInfo, "name_190364075660900");

        
		lblMsg3 = new JLabel("Setting up and generating board...");
        lblMsg3.setHorizontalAlignment(SwingConstants.CENTER);
        lblMsg3.setForeground(Color.RED);
        lblMsg3.setBounds(360, 641, 265, 31);
        lblMsg3.setVisible(false);
        lblMsg3.setOpaque(true);
        panelEnterInfo.add(lblMsg3);
        
        JLabel lblTitle1 = new JLabel("");
        lblTitle1.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle1.setBounds(60, 130, 100, 100);
        lblTitle1.setIcon(createSizedIcon("images\\S.png", 100, 100));
        panelHome.add(lblTitle1);
        lblTitle1 = new JLabel("");
        lblTitle1.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle1.setBounds(60, 130, 100, 100);
        lblTitle1.setIcon(createSizedIcon("images\\S.png", 100, 100));
        panelSelect.add(lblTitle1);
        lblTitle1 = new JLabel("");
        lblTitle1.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle1.setBounds(60, 130, 100, 100);
        lblTitle1.setIcon(createSizedIcon("images\\S.png", 100, 100));
        panelEnterInfo.add(lblTitle1);

        JLabel lblTitle2 = new JLabel("");
        lblTitle2.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle2.setBounds(170, 130, 100, 100);
        lblTitle2.setIcon(createSizedIcon("images\\C.png", 100, 100));
        panelHome.add(lblTitle2);
        lblTitle2 = new JLabel("");
        lblTitle2.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle2.setBounds(170, 130, 100, 100);
        lblTitle2.setIcon(createSizedIcon("images\\C.png", 100, 100));
        panelSelect.add(lblTitle2);
        lblTitle2 = new JLabel("");
        lblTitle2.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle2.setBounds(170, 130, 100, 100);
        lblTitle2.setIcon(createSizedIcon("images\\C.png", 100, 100));
        panelEnterInfo.add(lblTitle2);

        JLabel lblTitle3 = new JLabel("");
        lblTitle3.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle3.setBounds(280, 130, 100, 100);
        lblTitle3.setIcon(createSizedIcon("images\\R.png", 100, 100));
        panelHome.add(lblTitle3);
        lblTitle3 = new JLabel("");
        lblTitle3.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle3.setBounds(280, 130, 100, 100);
        lblTitle3.setIcon(createSizedIcon("images\\R.png", 100, 100));
        panelSelect.add(lblTitle3);
        lblTitle3 = new JLabel("");
        lblTitle3.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle3.setBounds(280, 130, 100, 100);
        lblTitle3.setIcon(createSizedIcon("images\\R.png", 100, 100));
        panelEnterInfo.add(lblTitle3);

        JLabel lblTitle4 = new JLabel("");
        lblTitle4.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle4.setBounds(392, 130, 100, 100);
        lblTitle4.setIcon(createSizedIcon("images\\A.png", 100, 100));
        panelHome.add(lblTitle4);
        lblTitle4 = new JLabel("");
        lblTitle4.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle4.setBounds(392, 130, 100, 100);
        lblTitle4.setIcon(createSizedIcon("images\\A.png", 100, 100));
        panelSelect.add(lblTitle4);
        lblTitle4 = new JLabel("");
        lblTitle4.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle4.setBounds(392, 130, 100, 100);
        lblTitle4.setIcon(createSizedIcon("images\\A.png", 100, 100));
        panelEnterInfo.add(lblTitle4);

        JLabel lblTitle5 = new JLabel("");
        lblTitle5.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle5.setBounds(502, 130, 100, 100);
        lblTitle5.setIcon(createSizedIcon("images\\B.png", 100, 100));
        panelHome.add(lblTitle5);
        lblTitle5 = new JLabel("");
        lblTitle5.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle5.setBounds(502, 130, 100, 100);
        lblTitle5.setIcon(createSizedIcon("images\\B.png", 100, 100));
        panelSelect.add(lblTitle5);
        lblTitle5 = new JLabel("");
        lblTitle5.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle5.setBounds(502, 130, 100, 100);
        lblTitle5.setIcon(createSizedIcon("images\\B.png", 100, 100));
        panelEnterInfo.add(lblTitle5);

        JLabel lblTitle6 = new JLabel("");
        lblTitle6.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle6.setBounds(612, 130, 100, 100);
        lblTitle6.setIcon(createSizedIcon("images\\B.png", 100, 100));
        panelHome.add(lblTitle6);
        lblTitle6 = new JLabel("");
        lblTitle6.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle6.setBounds(612, 130, 100, 100);
        lblTitle6.setIcon(createSizedIcon("images\\B.png", 100, 100));
        panelSelect.add(lblTitle6);
        lblTitle6 = new JLabel("");
        lblTitle6.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle6.setBounds(612, 130, 100, 100);
        lblTitle6.setIcon(createSizedIcon("images\\B.png", 100, 100));
        panelEnterInfo.add(lblTitle6);

        JLabel lblTitle7 = new JLabel("");
        lblTitle7.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle7.setBounds(722, 130, 100, 100);
        lblTitle7.setIcon(createSizedIcon("images\\L.png", 100, 100));
        panelHome.add(lblTitle7);
        lblTitle7 = new JLabel("");
        lblTitle7.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle7.setBounds(722, 130, 100, 100);
        lblTitle7.setIcon(createSizedIcon("images\\L.png", 100, 100));
        panelSelect.add(lblTitle7);
        lblTitle7 = new JLabel("");
        lblTitle7.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle7.setBounds(722, 130, 100, 100);
        lblTitle7.setIcon(createSizedIcon("images\\L.png", 100, 100));
        panelEnterInfo.add(lblTitle7);

        JLabel lblTitle8 = new JLabel("");
        lblTitle8.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle8.setBounds(832, 130, 100, 100);
        lblTitle8.setIcon(createSizedIcon("images\\E.png", 100, 100));
        panelHome.add(lblTitle8);
        lblTitle8 = new JLabel("");
        lblTitle8.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle8.setBounds(832, 130, 100, 100);
        lblTitle8.setIcon(createSizedIcon("images\\E.png", 100, 100));
        panelSelect.add(lblTitle8);
        lblTitle8 = new JLabel("");
        lblTitle8.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle8.setBounds(832, 130, 100, 100);
        lblTitle8.setIcon(createSizedIcon("images\\E.png", 100, 100));
        panelEnterInfo.add(lblTitle8);
		
		JButton btnSelectGoBack_1 = new JButton("Go Back");
		btnSelectGoBack_1.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		        panelEnterInfo.setVisible(false);
		        panelSelect.setVisible(true);
		    }
		});
		btnSelectGoBack_1.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnSelectGoBack_1.setBounds(360, 598, 120, 31);
		panelEnterInfo.add(btnSelectGoBack_1);
		
		comboBoxNumOfPlayers = new JComboBox<String>();
		comboBoxNumOfPlayers.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		        int numOfPlayers = Integer.parseInt(comboBoxNumOfPlayers.getSelectedItem().toString());
		        setNumOfPlayers(numOfPlayers);
		    }
		});
		comboBoxNumOfPlayers.setModel(new DefaultComboBoxModel(new String[] {"2", "3", "4"}));
		comboBoxNumOfPlayers.setFont(new Font("Tahoma", Font.PLAIN, 18));
		comboBoxNumOfPlayers.setBounds(521, 440, 104, 26);
		panelEnterInfo.add(comboBoxNumOfPlayers);
		
		JLabel lblNumOfPlayers = new JLabel("Number of Players:");
		lblNumOfPlayers.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNumOfPlayers.setFont(new Font("Tahoma", Font.PLAIN, 18));
		lblNumOfPlayers.setBounds(320, 440, 191, 26);
		panelEnterInfo.add(lblNumOfPlayers);
		
		txtName1 = new JTextField();
		txtName1.setFont(new Font("Tahoma", Font.PLAIN, 18));
		txtName1.setBounds(503, 472, 122, 26);
		panelEnterInfo.add(txtName1);
		txtName1.setColumns(10);
		
		lblName1 = new JLabel("Player Name #1:");
		lblName1.setHorizontalAlignment(SwingConstants.TRAILING);
		lblName1.setFont(new Font("Tahoma", Font.PLAIN, 18));
		lblName1.setBounds(320, 472, 173, 26);
		panelEnterInfo.add(lblName1);
		
		txtName2 = new JTextField();
		txtName2.setFont(new Font("Tahoma", Font.PLAIN, 18));
		txtName2.setColumns(10);
		txtName2.setBounds(503, 503, 122, 26);
		panelEnterInfo.add(txtName2);
		
		lblName2 = new JLabel("Player Name #2:");
		lblName2.setHorizontalAlignment(SwingConstants.TRAILING);
		lblName2.setFont(new Font("Tahoma", Font.PLAIN, 18));
		lblName2.setBounds(320, 503, 173, 26);
		panelEnterInfo.add(lblName2);
		
		txtName3 = new JTextField();
		txtName3.setFont(new Font("Tahoma", Font.PLAIN, 18));
		txtName3.setColumns(10);
		txtName3.setBounds(503, 536, 122, 26);
		panelEnterInfo.add(txtName3);
		
		lblName3 = new JLabel("Player Name #3:");
		lblName3.setHorizontalAlignment(SwingConstants.TRAILING);
		lblName3.setFont(new Font("Tahoma", Font.PLAIN, 18));
		lblName3.setBounds(320, 536, 173, 26);
		panelEnterInfo.add(lblName3);
		
		txtName4 = new JTextField();
		txtName4.setFont(new Font("Tahoma", Font.PLAIN, 18));
		txtName4.setColumns(10);
		txtName4.setBounds(503, 567, 122, 26);
		panelEnterInfo.add(txtName4);
		
		lblName4 = new JLabel("Player Name #4:");
		lblName4.setHorizontalAlignment(SwingConstants.TRAILING);
		lblName4.setFont(new Font("Tahoma", Font.PLAIN, 18));
		lblName4.setBounds(320, 567, 173, 26);
		panelEnterInfo.add(lblName4);
		
		JButton btnStartGame = new JButton("Start Game");
		btnStartGame.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		        
                JButton c = (JButton) e.getSource();
                
                if (c.isEnabled()) {
                    
    		        SwingWorker<Void, Void> worker = new SwingWorker<Void, Void>() {
                        @Override
                        protected Void doInBackground() throws Exception {
                            // Create Board
                            if (difficulty == 0) {
                                createBeginnerBoard();
                            } else {
                                createChallengerBoard();
                            }
                            
                            // Setup Game.
                            try {
                                setupGame();
                                
                            } catch (IOException e1) {
                                e1.printStackTrace();
                            } catch (Exception e1) {
                                String msg = e1.getMessage();
                                String[] msgArr = msg.split(":");
                                if (msgArr.length == 4) {
                                    msg = msgArr[3];
                                }

                                lblMsg3.setVisible(false);
                                
                                JOptionPane.showMessageDialog(frmScrabble, msg, "Error", JOptionPane.ERROR_MESSAGE);
                                
                                Component[] comp = c.getParent().getComponents();
                                for (int i = 0; i < comp.length; i++) {
                                    if (comp[i] instanceof JButton) {
                                        JButton ui = (JButton) comp[i];
                                        ui.setEnabled(true);
                                    }
                                    if (comp[i] instanceof JTextField) {
                                        JTextField ui = (JTextField) comp[i];
                                        ui.setEnabled(true);
                                    }
                                    if (comp[i] instanceof JComboBox) {
                                        JComboBox<String> ui = (JComboBox<String>) comp[i];
                                        ui.setEnabled(true);
                                    }
                                }
                                
                                
                                return null;
                            }
                            
                            panelEnterInfo.setVisible(false);
                            panelBoard.setVisible(true);
                            
                            Component[] comp = c.getParent().getComponents();
                            for (int i = 0; i < comp.length; i++) {
                                if (comp[i] instanceof JButton) {
                                    JButton ui = (JButton) comp[i];
                                    ui.setEnabled(true);
                                }
                                if (comp[i] instanceof JTextField) {
                                    JTextField ui = (JTextField) comp[i];
                                    ui.setEnabled(true);
                                }
                                if (comp[i] instanceof JComboBox) {
                                    JComboBox<String> ui = (JComboBox<String>) comp[i];
                                    ui.setEnabled(true);
                                }
                            }
                            
                            lblMsg3.setVisible(false);
                            
                            return null;
                        }
                    };
    
                    Component[] comp = c.getParent().getComponents();
                    for (int i = 0; i < comp.length; i++) {
                        if (comp[i] instanceof JButton) {
                            JButton ui = (JButton) comp[i];
                            ui.setEnabled(false);
                        }
                        if (comp[i] instanceof JTextField) {
                            JTextField ui = (JTextField) comp[i];
                            ui.setEnabled(false);
                        }
                        if (comp[i] instanceof JComboBox) {
                            JComboBox<String> ui = (JComboBox<String>) comp[i];
                            ui.setEnabled(false);
                        }
                    }
                    
                    worker.execute();
                }
                
		    }
		});
		btnStartGame.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnStartGame.setBounds(490, 598, 135, 31);
		panelEnterInfo.add(btnStartGame);
		
		panelBoard = new JPanel();
		panelBoard.setLayout(null);
		frmScrabble.getContentPane().add(panelBoard, "name_190414693314700");
		
		UIManager.put("Label.disabledForeground",new Color(51, 51, 51));
		
		btnEndTurn = new JButton("End Turn");
		btnEndTurn.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {

                JButton c = (JButton) e.getSource();
                
                if (c.isEnabled()) {
                    
                    SwingWorker<Void, Void> worker = new SwingWorker<Void, Void>() {
                        @Override
                        protected Void doInBackground() throws Exception {

                            try {
                                lblMsg2.setVisible(true);
                                
                                endTurn(false);
                            } catch (IOException e1) {
                                e1.printStackTrace();
                            }
                            
                            lblMsg2.setVisible(false);
                            

                            Component[] comp = c.getParent().getComponents();
                            for (int i = 0; i < comp.length; i++) {
                                if (comp[i] instanceof JButton) {
                                    JButton button = (JButton) comp[i];
                                    button.setEnabled(true);
                                }
                            }
                            
                            return null;
                        }
                    };
                    
                    Component[] comp = c.getParent().getComponents();
                    for (int i = 0; i < comp.length; i++) {
                        if (comp[i] instanceof JButton) {
                            JButton button = (JButton) comp[i];
                            button.setEnabled(false);
                        }
                    }
                    
                    worker.execute();
                }
		    }
		});
		btnEndTurn.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnEndTurn.setBounds(666, 11, 120, 31);
		panelBoard.add(btnEndTurn);
		
	      
        btnPass = new JButton("Pass");
        btnPass.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {

                JButton c = (JButton) e.getSource();
                
                if (c.isEnabled()) {
                    try {
                        endTurn(true);
                    } catch (IOException e1) {
                        e1.printStackTrace();
                    }
                }
            }
        });
        btnPass.setFont(new Font("Tahoma", Font.PLAIN, 18));
        btnPass.setBounds(585, 11, 69, 31);
        panelBoard.add(btnPass);
        
		
		btnHowToPlay = new JButton("How To Play");
		btnHowToPlay.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		        
		        if (null != windowHowToPlay) {
		            JFrame frame = windowHowToPlay.frame;
		            frame.setVisible(true);
	                frame.toFront();
	                frame.requestFocus();
	                frame.setExtendedState(Frame.NORMAL);
		        } else {
		            
		            
		            //TODO: Replace "HowToPlay()" with the a custom java class object built from WindowBuilder.
    		        windowHowToPlay = new HowToPlay();
    		        
    		        
    		        JFrame frame = windowHowToPlay.frame;
    		        
    		        //if ( (frame.getExtendedState() & JFrame.ICONIFIED) != 0 ) {
    		        //    frame.setExtendedState(Frame.NORMAL);
    		        //}
    		        
    	            frame.setLocation(frmScrabble.getWidth() + frmScrabble.getX(), frmScrabble.getY());
    	            
                    frame.setVisible(true);
                    frame.toFront();
                    frame.requestFocus();
                    frame.setExtendedState(Frame.NORMAL);
		        }
		        
		        JFrame frame = windowHowToPlay.frame;
		        
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
		});
		btnHowToPlay.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnHowToPlay.setBounds(10, 54, 150, 31);
		panelBoard.add(btnHowToPlay);
		
		btnBoardEndGame = new JButton("End Game");
		btnBoardEndGame.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		        
		        JButton c = (JButton) e.getSource();
                
                if (c.isEnabled()) {
    		        String msg = "Are you sure you want to end this game?\r\n"
    		                + "This will end the current session.";
    		        int option = JOptionPane.showConfirmDialog(frmScrabble, msg, "End Game?", JOptionPane.YES_NO_OPTION);
    		        if (option == JOptionPane.YES_OPTION) {
    		            
    		            setGameOver(true, "Game over, the game was ended early.");
    		            
    		            panelBoard.setVisible(false);
    		            panelHome.setVisible(true);
    		        }
                }
                
		    }
		});
		btnBoardEndGame.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnBoardEndGame.setBounds(10, 11, 150, 31);
		panelBoard.add(btnBoardEndGame);
		
		btnResetActions = new JButton("Reset Actions");
		btnResetActions.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {

                JButton c = (JButton) e.getSource();
                
                if (c.isEnabled()) {
                    
    		        // Reset all actions performed.
    		        setLetterTilesPositions(currentTurn);
    		        
                }
		    }
		});
		btnResetActions.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnResetActions.setBounds(172, 11, 150, 31);
		panelBoard.add(btnResetActions);
		
		JButton btnReplaceTiles = new JButton("Replace Tiles + Pass Turn");
		btnReplaceTiles.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		        
                JButton c = (JButton) e.getSource();
                
                if (c.isEnabled()) {
    		        
    		        lblMsg.setVisible(true);
    		        
                    SwingWorker<Void, Void> worker = new SwingWorker<Void, Void>() {
                        @Override
                        protected Void doInBackground() throws Exception {
                            try {
                                setLetterTilesPositions(currentTurn);
                                
                                for (int i = 0; i < maxDraw; i++) {
                                    if (null != lblPlayerLetterTiles[currentTurn - 1][i]) {
                                        
                                        // Put back tiles into bag.
                                        String letter = lblPlayerLetterTiles[currentTurn - 1][i].getLetter();
                                        if ("BLANK".equals(letter)) {
                                            letter = " ";
                                        }
                                        
                                        mainApp.putTile( letter.charAt(0) );
                                        
                                        //lblPlayerLetterTiles[currentTurn - 1][i] = null;
                                        destroyLetterTile(currentTurn - 1, i);
                                    }
                                }
                                
                                endTurn(true);
                                
                            } catch (IOException e1) {
                                e1.printStackTrace();
                            } catch (Exception e1) {
                                e1.printStackTrace();
                            }
                            
                            lblMsg.setVisible(false);
                            
                            Component[] comp = c.getParent().getComponents();
                            for (int i = 0; i < comp.length; i++) {
                                if (comp[i] instanceof JButton) {
                                    JButton button = (JButton) comp[i];
                                    button.setEnabled(true);
                                }
                            }
                            
                            return null;
                        }
                    };
                    
                    Component[] comp = c.getParent().getComponents();
                    for (int i = 0; i < comp.length; i++) {
                        if (comp[i] instanceof JButton) {
                            JButton button = (JButton) comp[i];
                            button.setEnabled(false);
                        }
                    }
                    
                    worker.execute();
                }
		    }
		});
		btnReplaceTiles.setFont(new Font("Tahoma", Font.PLAIN, 18));
		btnReplaceTiles.setBounds(334, 11, 239, 31);
		panelBoard.add(btnReplaceTiles);
		
		lblMsg = new JLabel("Replacing your letter tiles...");
		lblMsg.setHorizontalAlignment(SwingConstants.CENTER);
		lblMsg.setForeground(Color.RED);
		lblMsg.setBounds(334, 42, 239, 43);
		lblMsg.setVisible(false);
		lblMsg.setOpaque(true);
		panelBoard.add(lblMsg);
		
		lblMsg2 = new JLabel("Ending Turn...");
		lblMsg2.setHorizontalAlignment(SwingConstants.CENTER);
		lblMsg2.setForeground(Color.RED);
		lblMsg2.setBounds(666, 42, 120, 43);
		lblMsg2.setVisible(false);
		lblMsg2.setOpaque(true);
		panelBoard.add(lblMsg2);
		
		lblScore1 = new JLabel("<html>\r\nScore: -1<br>\r\n</html>");
		lblScore1.setOpaque(true);
		lblScore1.setHorizontalAlignment(SwingConstants.CENTER);
		lblScore1.setForeground(Color.WHITE);
		lblScore1.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblScore1.setBackground(Color.GRAY);
		lblScore1.setBounds(167, 92, 107, 31);
		panelBoard.add(lblScore1);
		
		lblPlayer2 = new JLabel("<html>\r\nPlayer 2<br>\r\n\r\n</html>");
		lblPlayer2.setBackground(Color.GRAY);
		lblPlayer2.setHorizontalAlignment(SwingConstants.CENTER);
		lblPlayer2.setForeground(Color.WHITE);
		lblPlayer2.setFont(new Font("Tahoma", Font.PLAIN, 11));
		lblPlayer2.setBounds(48, 135, 107, 31);
		lblPlayer2.setOpaque(true);
		panelBoard.add(lblPlayer2);
		
		lblPlayer3 = new JLabel("<html>\r\nPlayer 3<br>\r\n\r\n</html>");
		lblPlayer3.setBackground(Color.GRAY);
		lblPlayer3.setHorizontalAlignment(SwingConstants.CENTER);
		lblPlayer3.setForeground(Color.WHITE);
		lblPlayer3.setFont(new Font("Tahoma", Font.PLAIN, 11));
		lblPlayer3.setBounds(48, 178, 107, 31);
		lblPlayer3.setOpaque(true);
		panelBoard.add(lblPlayer3);
		
		lblPlayer4 = new JLabel("<html>\r\nPlayer 4<br>\r\n\r\n</html>");
		lblPlayer4.setBackground(Color.GRAY);
		lblPlayer4.setHorizontalAlignment(SwingConstants.CENTER);
		lblPlayer4.setForeground(Color.WHITE);
		lblPlayer4.setFont(new Font("Tahoma", Font.PLAIN, 11));
		lblPlayer4.setBounds(48, 221, 107, 31);
		lblPlayer4.setOpaque(true);
		panelBoard.add(lblPlayer4);
		
		lblScore2 = new JLabel("<html>\r\nScore: -1<br>\r\n</html>");
		lblScore2.setOpaque(true);
		lblScore2.setHorizontalAlignment(SwingConstants.CENTER);
		lblScore2.setForeground(Color.WHITE);
		lblScore2.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblScore2.setBackground(Color.GRAY);
		lblScore2.setBounds(167, 135, 107, 31);
		panelBoard.add(lblScore2);
		
		lblPlayer1 = new JLabel("<html>\r\nPlayer 1<br>\r\n(Current Player)\r\n</html>");
		lblPlayer1.setBackground(Color.GRAY);
		lblPlayer1.setHorizontalAlignment(SwingConstants.CENTER);
		lblPlayer1.setForeground(Color.WHITE);
		lblPlayer1.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblPlayer1.setBounds(48, 92, 107, 31);
		lblPlayer1.setOpaque(true);
		panelBoard.add(lblPlayer1);
		
		lblScore3 = new JLabel("<html>\r\nScore: -1<br>\r\n</html>");
		lblScore3.setOpaque(true);
		lblScore3.setHorizontalAlignment(SwingConstants.CENTER);
		lblScore3.setForeground(Color.WHITE);
		lblScore3.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblScore3.setBackground(Color.GRAY);
		lblScore3.setBounds(167, 178, 107, 31);
		panelBoard.add(lblScore3);
		
		lblScore4 = new JLabel("<html>\r\nScore: -1<br>\r\n</html>");
		lblScore4.setOpaque(true);
		lblScore4.setHorizontalAlignment(SwingConstants.CENTER);
		lblScore4.setForeground(Color.WHITE);
		lblScore4.setFont(new Font("Tahoma", Font.BOLD, 11));
		lblScore4.setBackground(Color.GRAY);
		lblScore4.setBounds(167, 221, 107, 31);
		panelBoard.add(lblScore4);
	}
	
	/**
	 * Setup the game board and tiles.
	 * @throws IOException 
	 * @throws Exception       Thrown when player names are not valid.
	 */
	private void setupGame() throws IOException, Exception {
	    
	    int x, y;
	    
	    // Initialize Application
	    if (difficulty == 0) {
	        mainApp.difficulty = "beginner";
	        mainApp.numPlayers = numOfPlayers;
	    } else {
	        mainApp.difficulty = "challenger";
	        mainApp.numPlayers = numOfPlayers;
	    }
	    mainApp.initialize();
	    
	    
	    // Reset Turn to player 1.
	    currentTurn = 1;
	    mainApp.currentTurn = currentTurn;
	    
	    // Create 2d array board for letter tiles.
	    lblLetterTiles = new JLetterTile[boardSizeY][boardSizeX];
	    
	    // Set up player labels and validate player names.
	    String playerName1 = txtName1.getText();
	    String playerName2 = txtName2.getText();
	    String playerName3 = txtName3.getText();
	    String playerName4 = txtName4.getText();
	    
	    mainApp.playerNames[0] = playerName1;
	    mainApp.playerNames[1] = playerName2;
	    mainApp.playerNames[2] = playerName3;
	    mainApp.playerNames[3] = playerName4;
	    
	    if (!playerName1.matches("[a-zA-Z]+")) {
	        throw new Exception(" ScrabbleGui::setupGame: Player #1's name must contain only a-z or A-Z. ");
	    }
        if (numOfPlayers >= 2 && !playerName2.matches("[a-zA-Z]+")) {
            throw new Exception(" ScrabbleGui::setupGame: Player #2's name must contain only a-z or A-Z. ");
        }
        if (numOfPlayers >= 3 && !playerName3.matches("[a-zA-Z]+")) {
            throw new Exception(" ScrabbleGui::setupGame: Player #3's name must contain only a-z or A-Z. ");
        }
        if (numOfPlayers >= 4 && !playerName4.matches("[a-zA-Z]+")) {
            throw new Exception(" ScrabbleGui::setupGame: Player #4's name must contain only a-z or A-Z. ");
        }
        
        if ( (playerName1.equals(playerName2) 
                || playerName1.equals(playerName3)
                || playerName1.equals(playerName4)) ) {
            throw new Exception( String.format(" ScrabbleGui::setupGame: Two or more players cannot have the same name. ") );
        }
        if ( numOfPlayers >= 2 && (playerName2.equals(playerName1) 
                                    || playerName2.equals(playerName3)
                                    || playerName2.equals(playerName4)) ) {
            throw new Exception( String.format(" ScrabbleGui::setupGame: Two or more players cannot have the same name. ") );
        }
        if ( numOfPlayers >= 3 && (playerName3.equals(playerName1) 
                                    || playerName3.equals(playerName2)
                                    || playerName3.equals(playerName4)) ) {
            throw new Exception( String.format(" ScrabbleGui::setupGame: Two or more players cannot have the same name. ") );
        }
        if ( numOfPlayers >= 4 && (playerName4.equals(playerName1) 
                                    || playerName4.equals(playerName2)
                                    || playerName4.equals(playerName3)) ) {
            throw new Exception( String.format(" ScrabbleGui::setupGame: Two or more players cannot have the same name. ") );
        }
        
        lblMsg3.setVisible(true);
        
        // Set locations of JLabels for each player.
        //top (player 1)
        final int SPACING_CONSTANT = 4;
        String html = String.format(
                "<html>\r\n"
              + "%s<br>\r\n"
              + "\r\n"
              + "</html>", playerName1);
        
        x = boardOffsetX + ( (boardSizeX * (tileSize + borderSize) / 2) - lblPlayer1.getWidth() - SPACING_CONSTANT/2 );
        y = boardOffsetY - tileSize - borderSize - 54;
        lblPlayer1.setLocation(x, y);
        lblPlayer1.setText( html );
        
        html = String.format(
                "<html>\r\n"
              + "Score: %s<br>\r\n"
              + "</html>", mainApp.playerScores[0]);
        x = boardOffsetX + ( (boardSizeX * (tileSize + borderSize) / 2) - lblScore1.getWidth() + SPACING_CONSTANT/2 + lblPlayer1.getWidth() );
        y = boardOffsetY - tileSize - borderSize - 54;
        lblScore1.setLocation(x, y);
        lblScore1.setText( html );
        
        //right (player 2)
        html = String.format(
                "<html>\r\n"
              + "%s<br>\r\n"
              + "\r\n"
              + "</html>", playerName2);
        
        x = boardOffsetX + (boardSizeX * (tileSize + borderSize)) + borderSize;
        y = boardOffsetY + ( (boardSizeY * (tileSize + borderSize) / 2) - lblPlayer2.getHeight() / 2 ) - tileSize * 4 - tileSize;
        lblPlayer2.setLocation(x, y);
        lblPlayer2.setText( html );
        
        html = String.format(
                "<html>\r\n"
              + "Score: %s<br>\r\n"
              + "</html>", mainApp.playerScores[1]);
        x = boardOffsetX + (boardSizeX * (tileSize + borderSize)) + borderSize;
        y = boardOffsetY + ( (boardSizeY * (tileSize + borderSize) / 2) - lblScore2.getHeight() / 2 ) - tileSize * 4 - 12 + SPACING_CONSTANT;
        lblScore2.setLocation(x, y);
        lblScore2.setText( html );
        
        //bottom (player 3)
        html = String.format(
                "<html>\r\n"
              + "%s<br>\r\n"
              + "\r\n"
              + "</html>", playerName3);
        
        x = boardOffsetX + ( (boardSizeX * (tileSize + borderSize) / 2) - lblPlayer3.getWidth() - SPACING_CONSTANT/2 );
        y = boardOffsetY + (boardSizeY * (tileSize + borderSize)) + borderSize;
        lblPlayer3.setLocation(x, y);
        lblPlayer3.setText( html );
        
        html = String.format(
                "<html>\r\n"
              + "Score: %s<br>\r\n"
              + "</html>", mainApp.playerScores[2]);
        x = boardOffsetX + ( (boardSizeX * (tileSize + borderSize) / 2) - lblScore3.getWidth() + SPACING_CONSTANT/2 + lblPlayer3.getWidth() );
        y = boardOffsetY + (boardSizeY * (tileSize + borderSize)) + borderSize;
        lblScore3.setLocation(x, y);
        lblScore3.setText( html );
        
        //left (player 4)
        html = String.format(
                "<html>\r\n"
              + "%s<br>\r\n"
              + "\r\n"
              + "</html>", playerName4);
        
        x = boardOffsetX - tileSize - borderSize - 65;
        y = boardOffsetY + ( (boardSizeY * (tileSize + borderSize) / 2) - lblPlayer4.getHeight() / 2 ) - tileSize * 4 - tileSize;
        lblPlayer4.setLocation(x, y);
        lblPlayer4.setText( html );
        
        html = String.format(
                "<html>\r\n"
              + "Score: %s<br>\r\n"
              + "</html>", mainApp.playerScores[3]);
        x = boardOffsetX - tileSize - borderSize - 65;;
        y = boardOffsetY + ( (boardSizeY * (tileSize + borderSize) / 2) - lblScore4.getHeight() / 2 ) - tileSize * 4 - 12 + SPACING_CONSTANT;
        lblScore4.setLocation(x, y);
        lblScore4.setText( html );
        
        
	    if (numOfPlayers == 2) {
	        // Set labels
	        lblPlayer1.setVisible(true);
	        lblPlayer2.setVisible(true);
	        lblPlayer3.setVisible(false);
            lblPlayer4.setVisible(false);
            
            lblScore1.setVisible(true);
            lblScore2.setVisible(true);
            lblScore3.setVisible(false);
            lblScore4.setVisible(false);
            
            // Draw letter tiles from the bag for players
            drawLetterTiles(1);
            drawLetterTiles(2);
            
	    } else if (numOfPlayers == 3) {
	        // Set labels
	        lblPlayer1.setVisible(true);
            lblPlayer2.setVisible(true);
            lblPlayer3.setVisible(true);
            lblPlayer4.setVisible(false);

            lblScore1.setVisible(true);
            lblScore2.setVisible(true);
            lblScore3.setVisible(true);
            lblScore4.setVisible(false);
            
            // Draw letter tiles from the bag for players
            drawLetterTiles(1);
            drawLetterTiles(2);
            drawLetterTiles(3);
            
	    } else if (numOfPlayers == 4) {
	        // Set labels
	        lblPlayer1.setVisible(true);
            lblPlayer2.setVisible(true);
            lblPlayer3.setVisible(true);
            lblPlayer4.setVisible(true);

            lblScore1.setVisible(true);
            lblScore2.setVisible(true);
            lblScore3.setVisible(true);
            lblScore4.setVisible(true);
            
            // Draw letter tiles from the bag for players
            drawLetterTiles(1);
            drawLetterTiles(2);
            drawLetterTiles(3);
            drawLetterTiles(4);
            
	    } else {
	        System.err.println(String.format("ScrabbleGui::setupGame: Invalid amount of players = %d. Must be inclusively between 2 and 4.", numOfPlayers));
	    }
	    
	    // Setup GUI and turns
	    checkTurn();
	}
	
	/**
	 * Create a dragable JLetterTile letter tile.
	 * @param letter - The letter to be given to the JLetterTile letter tile.
	 * @return Returns a JLetterTile element that is draggable.
	 * @throws IOException
	 */
	private JLetterTile createLetterTile(String letter) throws IOException {
	    
	    JLetterTile lblLetterTile = new JLetterTile("");
	    if (" ".equals(letter)) {
	        letter = "BLANK";
	        lblLetterTile.setBlank(true);
	    }
	    
	    lblLetterTile.setLetter(letter);
	    lblLetterTile.setFont(new Font("Dialog", Font.BOLD, 24));
        lblLetterTile.setBounds(0, 0, tileSize, tileSize);
        lblLetterTile.setHorizontalTextPosition(0);
        lblLetterTile.setVerticalTextPosition(0);
        lblLetterTile.setToolTipText(String.format("%s", letter));
        lblLetterTile.setIcon(createSizedIcon(String.format("images\\%s.png", letter), tileSize, tileSize));
        lblLetterTile.setDisabledIcon(createSizedIcon("images\\DISABLED.png", tileSize, tileSize));
        lblLetterTile.setHorizontalAlignment(SwingConstants.CENTER);
        lblLetterTile.setEnabled(false);
        lblLetterTile.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                JLetterTile tile = (JLetterTile) e.getComponent();
                
                if (tile.isEnabled()) {
                    if (isAlreadyOneClick) {
                        //System.out.println("double click");
                        
                        if ( !tile.isBlank() ) {
                            return;
                        }
                        
                        String title = "BLANK tile letter";
                        String text = (String) JOptionPane.showInputDialog(
                                                    frmScrabble, 
                                                    "Type a letter from A to Z for the BLANK tile: ", 
                                                    title, 
                                                    JOptionPane.PLAIN_MESSAGE, null, null, ""
                                                );
                        
                        if (null != text) {
                            while ( null != text && !text.matches("[a-zA-Z]|^$") ) {
                                String msg = String.format(
                                        "Invalid Input: %s\r\n"
                                        + "Type a letter from A to Z for the BLANK tile: ", text);
                                
                                text = (String) JOptionPane.showInputDialog(
                                                    frmScrabble, 
                                                    msg, 
                                                    title, 
                                                    JOptionPane.PLAIN_MESSAGE, null, null, ""
                                                );
                            }
                            
                            if ( text.length() > 0 ) {
                                text = text.toUpperCase();
                                text = String.valueOf( text.charAt(0) );
                                tile.setText(text);
                                tile.setLetter(text);
                            } else {
                                tile.setText("");
                                tile.setLetter("BLANK");
                            }
                        }
                        
                        isAlreadyOneClick = false;
                    } else {
                        isAlreadyOneClick = true;
                        Timer t = new Timer("doubleclickTimer", false);
                        t.schedule(new TimerTask() {
    
                            @Override
                            public void run() {
                                isAlreadyOneClick = false;
                            }
                        }, 500);
                    }
                }
                
            }
            @Override
            public void mousePressed(MouseEvent e) {
                JLetterTile tile = (JLetterTile) e.getComponent();
                
                if (tile.isEnabled()) {
                    screenX = e.getXOnScreen();
                    screenY = e.getYOnScreen();
    
                    oldX = tile.getX();
                    oldY = tile.getY();
                    
                    myX = tile.getX();
                    myY = tile.getY();
                } else {
                    
                }
            }
            @Override
            public void mouseReleased(MouseEvent e) {
                JLetterTile tile = (JLetterTile) e.getComponent();
                
                if (tile.isEnabled()) {
                    int x = tile.getX();
                    int y = tile.getY();
                    
                    // Place down the tile.
                    placeTile(tile, x, y);
                }
            }
        });
        lblLetterTile.addMouseMotionListener(new MouseMotionListener() {

            @Override
            public void mouseDragged(MouseEvent e) {
                JLetterTile tile = (JLetterTile) e.getComponent();
                
                if (tile.isEnabled()) {
                    int deltaX = e.getXOnScreen() - screenX;
                    int deltaY = e.getYOnScreen() - screenY;
                    
                    tile.setLocation(myX + deltaX, myY + deltaY);
                }
            }

            @Override
            public void mouseMoved(MouseEvent e) {
                // Not currently used.
            }

        });
        
        panelBoard.add(lblLetterTile);
        panelBoard.setComponentZOrder(lblLetterTile, 0);
        
        return lblLetterTile;
	}
	
	/**
	 * Sets up the DEFAULT positions of the given player's letter tiles.
	 * @param player - Given player.
	 */
	private void setLetterTilesPositions(int player) {
	    int playerIndex;
        int x, y;
	    playerIndex = player - 1;
	    
	    switch (player) {
    	    case 1:
    	        x = boardOffsetX + ( (boardSizeX * (tileSize + borderSize) / 2) ) - tileSize * 4 + tileSize / 2;
                y = boardOffsetY - tileSize - borderSize - borderSize - 10;
                
                for (int i = 0; i < maxDraw; i++) {
                    if (null != lblPlayerLetterTiles[playerIndex][i]) {
                        lblPlayerLetterTiles[playerIndex][i].setLocation(x + (tileSize * i), y);
                        if (lblPlayerLetterTiles[playerIndex][i].isBlank()) {
                            lblPlayerLetterTiles[playerIndex][i].setText("");
                            lblPlayerLetterTiles[playerIndex][i].setLetter("BLANK");
                        }
                    }
                }
                
    	        break;
    	    case 2:
    	        x = boardOffsetX + (boardSizeX * (tileSize + borderSize)) + borderSize + borderSize + 10;
                y = boardOffsetY + ( (boardSizeY * (tileSize + borderSize) / 2) ) - tileSize * 4 + tileSize / 2;
                
                for (int i = 0; i < maxDraw; i++) {
                    if (null != lblPlayerLetterTiles[playerIndex][i]) {
                        lblPlayerLetterTiles[playerIndex][i].setLocation(x, y + (tileSize * i));
                        if (lblPlayerLetterTiles[playerIndex][i].isBlank()) {
                            lblPlayerLetterTiles[playerIndex][i].setText("");
                            lblPlayerLetterTiles[playerIndex][i].setLetter("BLANK");
                        }
                    }
                }
                
    	        break;
    	    case 3:
    	        x = boardOffsetX + ( (boardSizeX * (tileSize + borderSize) / 2) ) - tileSize * 4 + tileSize / 2;
                y = boardOffsetY + (boardSizeY * (tileSize + borderSize)) + borderSize + borderSize + 14 + lblPlayer3.getHeight();
                
                for (int i = 0; i < maxDraw; i++) {
                    if (null != lblPlayerLetterTiles[playerIndex][i]) {
                        lblPlayerLetterTiles[playerIndex][i].setLocation(x + (tileSize * i), y);
                        if (lblPlayerLetterTiles[playerIndex][i].isBlank()) {
                            lblPlayerLetterTiles[playerIndex][i].setText("");
                            lblPlayerLetterTiles[playerIndex][i].setLetter("BLANK");
                        }
                    }
                }
                
    	        break;
    	    case 4:
    	        x = boardOffsetX - tileSize - borderSize - borderSize - 10;
                y = boardOffsetY + ( (boardSizeY * (tileSize + borderSize) / 2) ) - tileSize * 4 + tileSize / 2;
                
                for (int i = 0; i < maxDraw; i++) {
                    if (null != lblPlayerLetterTiles[playerIndex][i]) {
                        lblPlayerLetterTiles[playerIndex][i].setLocation(x, y + (tileSize * i));
                        if (lblPlayerLetterTiles[playerIndex][i].isBlank()) {
                            lblPlayerLetterTiles[playerIndex][i].setText("");
                            lblPlayerLetterTiles[playerIndex][i].setLetter("BLANK");
                        }
                    }
                }
                
    	        break;
	        default:
	            System.err.println(String.format("ScrabbleGui::setLetterTilesPositions: Invalid player number = %d. Must be inclusively between 1 and 4.", player));
            
	    }
	}
	
    /**
     * TEST FUNCTION
     * Draws a random letter tile.
     * @return Returns a string letter tile.
     */
    private String drawRandomLetterTile() {
        String listOfLetters[] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", 
                                  "J", "K", "L", "M", "N", "O", "P", "Q", "R", 
                                  "S", "T", "U", "V", "W", "X", "Y", "Z", "BLANK"};
        
        Random rand = new Random();
        
        return String.valueOf( listOfLetters[ rand.nextInt( listOfLetters.length ) ] );
    }
    
	/**
	 * Draws Letter Tiles for a given player.
	 * @param player - Given Player.
	 * @throws IOException     
	 * @throws Exception       Throws an exception when there are no more letter tiles in the bag called by the App.
	 */
	private void drawLetterTiles(int player) throws IOException {
	    
	    if (1 > player && player > 4) {
	        System.err.println(String.format("ScrabbleGui::setupGame: Invalid player number = %d. Must be inclusively between 1 and 4.", player));
	    }
	    
	    if (null == lblPlayerLetterTiles) {
	        lblPlayerLetterTiles = new JLetterTile[maxPlayers][maxDraw];
	    }
	    
	    int playerIndex;
	    //int x, y;
	    
	    switch (player) {
    	    case 1:
    	        playerIndex = player - 1;
                
                for (int i = 0; i < maxDraw; i++) {
                    if (null == lblPlayerLetterTiles[playerIndex][i]) {
                        
                        // Use the app's drawLetterTile() function instead of drawRandomLetterTile().
                        //String letter = drawRandomLetterTile();
                        String letter = null;
                        try {
                            
                            // Attempt to draw tiles for player 1.
                            letter = mainApp.drawTile();
                            
                        } catch (Exception e) { 
                            //e.printStackTrace();
                        }
                        
                        if (null != letter) {
                            JLetterTile lblLetterTile = createLetterTile(letter);
                            
                            // Set letter tile to this player.
                            lblPlayerLetterTiles[playerIndex][i] = lblLetterTile;
                        }
                    }
                }
                
                // Set location of tiles for this player
                setLetterTilesPositions(player);
                
                break;
    	    case 2:
                playerIndex = player - 1;
                
                for (int i = 0; i < maxDraw; i++) {
                    if (null == lblPlayerLetterTiles[playerIndex][i]) {
                        
                        // Use the app's drawLetterTile() function instead of drawRandomLetterTile().
                        //String letter = drawRandomLetterTile();
                        String letter = null;
                        try {
                            
                            // Attempt to draw tiles for player 2.
                            letter = mainApp.drawTile();
                            
                        } catch (Exception e) { 
                            //e.printStackTrace();
                        }
                        
                        if (null != letter) {
                            JLetterTile lblLetterTile = createLetterTile(letter);
                            
                            // Set letter tile to this player.
                            lblPlayerLetterTiles[playerIndex][i] = lblLetterTile;
                        }
                    }
                }
                
                // Set location of tiles for this player
                setLetterTilesPositions(player);
                
                break;
    	    case 3:
                playerIndex = player - 1;
                
                for (int i = 0; i < maxDraw; i++) {
                    if (null == lblPlayerLetterTiles[playerIndex][i]) {
                        
                        // Use the app's drawLetterTile() function instead of drawRandomLetterTile().
                        //String letter = drawRandomLetterTile();
                        String letter = null;
                        try {
                            
                            // Attempt to draw tiles for player 3.
                            letter = mainApp.drawTile();
                            
                        } catch (Exception e) { 
                            //e.printStackTrace();
                        }
                        
                        if (null != letter) {
                            JLetterTile lblLetterTile = createLetterTile(letter);
                            
                            // Set letter tile to this player.
                            lblPlayerLetterTiles[playerIndex][i] = lblLetterTile;
                        }
                    }
                }
                
                // Set location of tiles for this player
                setLetterTilesPositions(player);
                
                break;
    	    case 4:
                playerIndex = player - 1;
                
                for (int i = 0; i < maxDraw; i++) {
                    if (null == lblPlayerLetterTiles[playerIndex][i]) {
                        
                        // Use the app's drawLetterTile() function instead of drawRandomLetterTile().
                        //String letter = drawRandomLetterTile();
                        String letter = null;
                        try {
                            
                            // Attempt to draw tiles for player 4.
                            letter = mainApp.drawTile();
                            
                        } catch (Exception e) { 
                            //e.printStackTrace();
                        }
                        
                        if (null != letter) {
                            JLetterTile lblLetterTile = createLetterTile(letter);
                            
                            // Set letter tile to this player.
                            lblPlayerLetterTiles[playerIndex][i] = lblLetterTile;
                        }
                    }
                }
                
                // Set location of tiles for this player
                setLetterTilesPositions(player);
                
                break;
    	    default:
    	        System.err.println(String.format("ScrabbleGui::drawLetterTiles: Invalid player number = %d. Must be inclusively between 1 and 4.", player));
	    }
	}
	
	/**
	 * Set a game over.
	 */
	private void setGameOver(boolean gameOver, String gameOverMessage) {
        if (gameOver) {

            // Call gameover and set results.
            HashMap<String, Integer> listOfWinners = mainApp.gameOver();
            
            int scoreWinner = mainApp.winnerScore;
            int score1 = mainApp.playerScores[0];
            int score2 = mainApp.playerScores[1];
            int score3 = mainApp.playerScores[2];
            int score4 = mainApp.playerScores[3];
            
            String playerNameWinner = mainApp.winnerName;
            String playerName1 = txtName1.getText();
            String playerName2 = txtName2.getText();
            String playerName3 = txtName3.getText();
            String playerName4 = txtName4.getText();
            
            String msg = String.format("%s\r\n", gameOverMessage);
            
            if (listOfWinners.size() >= 2) {
                int count = 0;
                for(Entry<String, Integer> entry : listOfWinners.entrySet()) {
                    //System.out.println( entry.getKey() + ": " +  entry.getValue().toString() );
                    if (count < listOfWinners.size() - 1) {
                        msg = msg + String.format("\"%s\", ", entry.getKey(), entry.getValue());
                    } else {
                        msg = msg + String.format("and \"%s\" ", entry.getKey(), entry.getValue());
                    }
                    
                    count++;
                }
                
                msg = msg + String.format("have tied with a score of %d.\r\n", scoreWinner);
                
            } else {
                msg = msg + String.format("\"%s\" has won with a score of %d.\r\n", playerNameWinner, scoreWinner);
            }
            
            
            if (numOfPlayers == 2) {
                msg = msg + String.format(
                        "\r\n"
                        + "%s's score: %d\r\n" 
                        + "%s's score: %d\r\n", 
                        playerName1, score1, 
                        playerName2, score2);
            } else if (numOfPlayers == 3) {
                msg = msg + String.format(
                        "\r\n"
                        + "%s's score: %d\r\n" 
                        + "%s's score: %d\r\n" 
                        + "%s's score: %d\r\n", 
                        playerName1, score1, 
                        playerName2, score2, 
                        playerName3, score3);
            } else if (numOfPlayers == 4) {
                msg = msg + String.format(
                        "\r\n"
                        + "%s's score: %d\r\n" 
                        + "%s's score: %d\r\n" 
                        + "%s's score: %d\r\n" 
                        + "%s's score: %d\r\n", 
                        playerName1, score1, 
                        playerName2, score2, 
                        playerName3, score3, 
                        playerName4, score4);
            } else {
                msg = String.format(
                        "Game over, Error. Num of players is invalid: %d.", 
                        numOfPlayers);
            }
            
            JOptionPane.showMessageDialog(frmScrabble, msg, "Game Over", JOptionPane.INFORMATION_MESSAGE);
            
            // Send players back to the home menu.
            panelBoard.setVisible(false);
            panelHome.setVisible(true);
        }
	}
		
	/**
	 * Attempt to end the current player's turn.
	 * 
	 * End the game if and only if the Application replies that the game is over.
	 * 
	 * @throws IOException 
	 */
	private void endTurn(boolean pass) throws IOException {

	    if (!pass) {
	        
    	    /* Call on the Application to end the turn and check rules. 
    	     * Apply changes if the rules are followed. 
    	     * Otherwise, throw errors and display appropriate error messages to the Player.
    	     */
    	    try {
    	        
    	        // Tell the application to place the tiles down.
        	    if (null != lblPlayerLetterTiles) {  
                    int p = currentTurn - 1;
                    
                    for (int t = 0; t < maxDraw; t++) {
                        if (null != lblPlayerLetterTiles[p][t]) {
                            JLetterTile tTile = lblPlayerLetterTiles[p][t];
                            
                            int row, col;
                            row = getTileRow(tTile);
                            col = getTileCol(tTile);
                            
                            char letter;
                            String text = tTile.getLetter();
                            boolean isBlank = tTile.isBlank();
                            
                            if (isBlank) {
                                text = tTile.getLetter();
                                if ( (null == text || "BLANK".equals(text.trim()) || "".equals(text.trim()))
                                        && (row != -1 && col != -1) ) {
                                    mainApp.redoPlacedLetters();
                                    throw new Exception(" Scrabble::endTurn: One of the BLANK tiles has not been given a letter. Double-click the BLANK tile to set the letter.");
                                }
                            }
                            
                            letter = text.charAt(0);
                            
                            if (row != -1 && col != -1) {
                                //System.out.println(String.format("placing tile at: %d %d", row, col));
                                
                                // Place tile down.
                                mainApp.placeTile(row, col, letter, isBlank);
                            }
                            
                        }
                    }
                }
        	    
        	    // Attempt to End turn and validate the words created by the tile placements.
        	    mainApp.endTurn();
        	    
        	    // get gained score
        	    int gainedScore = 0;
        	    Iterator<String> it;
                
                it = mainApp.lastWordScores.iterator();
                while (it.hasNext()) {
                    String s = it.next();
                    
                    Matcher matcher = Pattern.compile("\\d+").matcher(s);
                    matcher.find();
                    
                    gainedScore += Integer.valueOf(matcher.group());
                }
        	    
        	    // Update Scores.
        	    lblScore1.setText( String.format("Score: %d", mainApp.playerScores[0]) );
        	    lblScore2.setText( String.format("Score: %d", mainApp.playerScores[1]) );
        	    lblScore3.setText( String.format("Score: %d", mainApp.playerScores[2]) );
        	    lblScore4.setText( String.format("Score: %d", mainApp.playerScores[3]) );
        	    
        	    if (gainedScore > 0 && difficulty == 0) {
            	    //=== Display Score message on Beginner difficulty
            	    String msg = "";
            	    
            	    // create msg and concat gained points
            	    if ( Math.abs(gainedScore) == 1 )
                        msg = msg + String.format("\"%s\" gained %d score point.\r\n\r\n", mainApp.playerNames[currentTurn - 1], gainedScore);
                    else
                        msg = msg + String.format("\"%s\" gained %d score points.\r\n\r\n", mainApp.playerNames[currentTurn - 1], gainedScore);
            	    
            	    // concat new score
            	    msg = msg + String.format("Their new total score is: %d\r\n\r\n", mainApp.playerScores[currentTurn - 1]);
            	    
            	    // concat word scores
            	    msg = msg + String.format("Word Scores: \r\n");
            	    
            	    it = mainApp.lastWordScores.iterator();
            	    while (it.hasNext()) {
            	        String s = it.next();
            	        if (it.hasNext()) {
            	            msg = String.format("%s    %s\r\n", msg, s);
            	        } else {
            	            msg = String.format("%s    %s", msg, s);
            	        }
            	    }
            	    
            	    // concat letter scores
            	    msg = msg + String.format("\r\n\r\nLetter Scores: \r\n");
            	    
            	    it = mainApp.lastLetterScores.iterator();
                    while (it.hasNext()) {
                        String s = it.next();
                        if (it.hasNext()) {
                            msg = String.format("%s    %s\r\n", msg, s);
                        } else {
                            msg = String.format("%s    %s", msg, s);
                        }
                    }
                    
            	    // display msg to user.
                    JOptionPane.showMessageDialog(frmScrabble, msg, "Turn Ended", JOptionPane.INFORMATION_MESSAGE);
        	    }
                
    	    } catch (Exception e) {
    	        //e.printStackTrace();
    	        
    	        String msgType = null;
    	        String msgFunc = null;
    	        String msg = e.getMessage();
    	        
                String[] msgArr = msg.split(":");
                
                if (msgArr.length >= 4) {
                    msgType = msgArr[1];
                    msgFunc = msgArr[2];
                    msg = msgArr[3];
                }
                
                if ("WordList".equals(msgType) && "validateTurn".equals(msgFunc)) {
                    
                    Iterator< ArrayList<Tile> > it;
                    
                    msg = String.format(
                            "%s\r\n"
                            + "Valid Words: ", msg);
                    it = mainApp.validWordLists.iterator();
                    while (it.hasNext()) {
                        ArrayList<Tile> wordList = it.next();
                        String word = mainApp.getWordListString(wordList);
                        msg = String.format(
                                "%s\r\n"
                                + "    %s", msg, word);
                    }
                    
                    msg = String.format(
                            "%s\r\n"
                            + "Invalid Words: ", msg);
                    it = mainApp.invalidWordLists.iterator();
                    while (it.hasNext()) {
                        ArrayList<Tile> wordList = it.next();
                        String word = mainApp.getWordListString(wordList);
                        msg = String.format(
                                "%s\r\n"
                                + "    %s", msg, word);
                    }
                }
                
                JOptionPane.showMessageDialog(frmScrabble, msg, "Error", JOptionPane.ERROR_MESSAGE);
                
                return;
    	    }
    	    
    	    // Prevent letter tiles on the board from being moved.
    	    if (null != lblPlayerLetterTiles) {  
    	        int p = currentTurn - 1;
    	        
                for (int t = 0; t < maxDraw; t++) {
                    if (null != lblPlayerLetterTiles[p][t]) {
                        JLetterTile tTile = lblPlayerLetterTiles[p][t];
                        
                        int row, col;
                        row = getTileRow(tTile);
                        col = getTileCol(tTile);
                        
                        // Place tile down permanently
                        if (row != -1 && col != -1) {
                            lblPlayerLetterTiles[p][t] = null;
                            
                            tTile.setDisabledIcon( tTile.getIcon() );
                            tTile.setEnabled(false);
                            
                            lblLetterTiles[row][col] = tTile;
                            
                            //placeTile(tTile, row, col);
                        }
                    }
                }
            }
	    }
	    
	    // Draw new letter tiles for the current player.
	    try {
            drawLetterTiles(currentTurn);
            
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
	    
	    // Set next player's turn. If that player has no tiles, then do not set their turn.
	    int loop = 0;
	    while (loop <= numOfPlayers + 1) {
    	    currentTurn++;
    	    if (currentTurn > numOfPlayers) {
    	        currentTurn = 1;
    	        mainApp.currentTurn = currentTurn;
    	    }
    	    
    	    int p = currentTurn - 1;
            boolean allowTurn = false;
            for (int t = 0; t < maxDraw; t++) {
                if (null != lblPlayerLetterTiles[p][t]) {
                    allowTurn = true;
                }
            }
            
            if (allowTurn) {
                mainApp.currentTurn = currentTurn;
                break;
            }
            
            loop++;
	    }
	    
	    // Could not find any player with a valid turn. Game is over.
	    if (loop > numOfPlayers + 1) {
	        setGameOver(true, "Game over, there no more letters to draw.");
	        return;
	    }
	    
	    // Modify GUI based on player's turn.
	    checkTurn();
	}
	
    /**
     * Set up and modify the GUI based on the current player's turn.
     */
    private void checkTurn() {
        int turn = currentTurn;
        
        // Hide other player letter tiles from the current player.
        if (null != lblPlayerLetterTiles) {  
            
            for (int p = 0; p < numOfPlayers; p++) {
                for (int t = 0; t < maxDraw; t++) {
                    
                    if (null != lblPlayerLetterTiles[p][t]) {
                        if (turn - 1 == p) {
                            lblPlayerLetterTiles[p][t].setEnabled(true);
                            if (lblPlayerLetterTiles[p][t].isBlank()) {
                                lblPlayerLetterTiles[p][t].setText(lblPlayerLetterTiles[p][t].tempLetter);
                                lblPlayerLetterTiles[p][t].tempLetter = "";
                            }
                        } else {
                            lblPlayerLetterTiles[p][t].setEnabled(false);
                            if (lblPlayerLetterTiles[p][t].isBlank() && !"".equals(lblPlayerLetterTiles[p][t].getText())) {
                                lblPlayerLetterTiles[p][t].tempLetter = lblPlayerLetterTiles[p][t].getText();
                                lblPlayerLetterTiles[p][t].setText("");
                            }
                        }
                    }
                }
            }
        }
        
        // Display Current Player.
        String html, playerName;
        Font font;
        String fontName;
        int fontSize;
        
        switch (currentTurn) {
            case 1:
                playerName = txtName1.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "(Current Player)\r\n"
                      + "</html>", playerName);
                lblPlayer1.setText(html);
                font = lblPlayer1.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer1.setFont(new Font(fontName, Font.BOLD, fontSize));
                
                playerName = txtName2.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer2.setText(html);
                font = lblPlayer2.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer2.setFont(new Font(fontName, Font.PLAIN, fontSize));
                
                playerName = txtName3.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer3.setText(html);
                font = lblPlayer3.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer3.setFont(new Font(fontName, Font.PLAIN, fontSize));
                
                playerName = txtName4.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer4.setText(html);
                font = lblPlayer4.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer4.setFont(new Font(fontName, Font.PLAIN, fontSize));
                
                break;
            case 2:
                playerName = txtName1.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer1.setText(html);
                font = lblPlayer1.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer1.setFont(new Font(fontName, Font.PLAIN, fontSize));
                
                playerName = txtName2.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "(Current Player)\r\n"
                      + "</html>", playerName);
                lblPlayer2.setText(html);
                font = lblPlayer2.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer2.setFont(new Font(fontName, Font.BOLD, fontSize));
                
                playerName = txtName3.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer3.setText(html);
                font = lblPlayer3.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer3.setFont(new Font(fontName, Font.PLAIN, fontSize));
                
                playerName = txtName4.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer4.setText(html);
                font = lblPlayer4.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer4.setFont(new Font(fontName, Font.PLAIN, fontSize));
                break;
            case 3:
                playerName = txtName1.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer1.setText(html);
                font = lblPlayer1.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer1.setFont(new Font(fontName, Font.PLAIN, fontSize));
                
                playerName = txtName2.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer2.setText(html);
                font = lblPlayer2.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer2.setFont(new Font(fontName, Font.PLAIN, fontSize));
                
                playerName = txtName3.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "(Current Player)\r\n"
                      + "</html>", playerName);
                lblPlayer3.setText(html);
                font = lblPlayer3.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer3.setFont(new Font(fontName, Font.BOLD, fontSize));
                
                playerName = txtName4.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer4.setText(html);
                font = lblPlayer4.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer4.setFont(new Font(fontName, Font.PLAIN, fontSize));
                break;
            case 4:
                playerName = txtName1.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer1.setText(html);
                font = lblPlayer1.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer1.setFont(new Font(fontName, Font.PLAIN, fontSize));
                
                playerName = txtName2.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer2.setText(html);
                font = lblPlayer2.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer2.setFont(new Font(fontName, Font.PLAIN, fontSize));
                
                playerName = txtName3.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "\r\n"
                      + "</html>", playerName);
                lblPlayer3.setText(html);
                font = lblPlayer3.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer3.setFont(new Font(fontName, Font.PLAIN, fontSize));
                
                playerName = txtName4.getText();
                html = String.format(
                        "<html>\r\n"
                      + "%s<br>\r\n"
                      + "(Current Player)\r\n"
                      + "</html>", playerName);
                lblPlayer4.setText(html);
                font = lblPlayer4.getFont();
                fontName = font.getName();
                fontSize = font.getSize();
                lblPlayer4.setFont(new Font(fontName, Font.BOLD, fontSize));
                break;
            default:
                System.err.println(String.format("ScrabbleGui::checkTurn: Invalid current turn number = %d. Must be inclusively between 1 and 4.", currentTurn));
        }
        
    }
	
	/**
     * Destroy all player JLetterTile letter tiles.
     */
    private void destroyPlayerLetterTiles() {
        if (null != lblPlayerLetterTiles) {  
            for (int p = 0; p < maxPlayers; p++) {
                for (int t = 0; t < maxDraw; t++) {
                    if (null != lblPlayerLetterTiles[p][t]) {
                        lblPlayerLetterTiles[p][t].getParent().remove(lblPlayerLetterTiles[p][t]);
                        lblPlayerLetterTiles[p][t] = null;
                    }
                }
            }
            lblPlayerLetterTiles = null;
        }
    }
    
    /**
     * Destroy JLetterTile letter tiles.
     */
    private void destroyLetterTile(int player, int tile) {
        if (null != lblPlayerLetterTiles[player][tile]) {
            lblPlayerLetterTiles[player][tile].getParent().remove(lblPlayerLetterTiles[player][tile]);
            lblPlayerLetterTiles[player][tile] = null;
        }
    }
	
    /**
     * Destroy all board JLetterTile letter tiles.
     */
    private void destroyBoardLetterTiles() {
        if (null != lblLetterTiles) {  
            for (int r = 0; r < boardSizeY; r++) {
                for (int c = 0; c < boardSizeX; c++) {
                    if (null != lblLetterTiles[r][c]) {
                        lblLetterTiles[r][c].getParent().remove(lblLetterTiles[r][c]);
                        lblLetterTiles[r][c] = null;
                    }
                }
            }
            lblLetterTiles = null;
        }
    }
    
	/**
	 * Destroy the JLetterTile board elements.
	 */
	private void destroyBoard() {
	    if (null != lblBoardTiles) {  
    	    for (int r = 0; r < boardSizeY; r++) {
                for (int c = 0; c < boardSizeX; c++) {
                    if (null != lblBoardTiles[r][c]) {
                        lblBoardTiles[r][c].getParent().remove(lblBoardTiles[r][c]);
                        lblBoardTiles[r][c] = null;
                    }
                }
    	    }
    	    lblBoardTiles = null;
	    }
	}
	
	/**
	 * Create the beginner board.
	 */
	private void createBeginnerBoard() {
	    
	    // Reset board tiles
	    if (null != lblBoardTiles) {
	        destroyBoard();
	    }
	    
        destroyPlayerLetterTiles();
        destroyBoardLetterTiles();
	    
	    boardSizeX = 11;
	    boardSizeY = 11;
	    boardOffsetX = frmScrabble.getWidth()/2 - boardSizeX * (tileSize + borderSize) / 2;
        boardOffsetY = frmScrabble.getHeight()/2 - boardSizeX * (tileSize + borderSize) / 2;
        
	    /**
         * Board BitMap
         * 0 = Blank Tile
         * 1 = Starting Point
         * 2 = Double Letter Score Tile
         * 3 = Double Word Score Tile
         * 4 = Triple Letter Score Tile
         * 5 = Triple Word Score Tile
         */
        int boardBitMap[][] = {   
                {5, 0, 0, 0, 0, 5, 0, 0, 0, 0, 5},
                {0, 3, 0, 4, 0, 0, 0, 4, 0, 3, 0},
                {0, 0, 3, 0, 0, 2, 0, 0, 3, 0, 0},
                {0, 4, 0, 3, 0, 0, 0, 3, 0, 4, 0},
                {0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0},
                {5, 0, 2, 0, 0, 1, 0, 0, 2, 0, 5},
                {0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0},
                {0, 4, 0, 3, 0, 0, 0, 3, 0, 4, 0},
                {0, 0, 3, 0, 0, 2, 0, 0, 3, 0, 0},
                {0, 3, 0, 4, 0, 0, 0, 4, 0, 3, 0},
                {5, 0, 0, 0, 0, 5, 0, 0, 0, 0, 5}
                };
	    
	    lblBoardTiles = new JLetterTile[boardSizeY][boardSizeX];
        
        for (int r = 0; r < boardSizeY; r++) {
            for (int c = 0; c < boardSizeX; c++) {
                String tileName = getTileName(boardBitMap, r, c);
                Color tileColor = getTileColor(boardBitMap, r, c);
                
                lblBoardTiles[r][c] = new JLetterTile(tileName);
                //lblNewLabel.setIcon(new ImageIcon("images\\BLANK.png"));
                lblBoardTiles[r][c].setOpaque(true);
                lblBoardTiles[r][c].setFont(new Font("Tahoma", Font.BOLD, 9));
                lblBoardTiles[r][c].setForeground(new Color(0, 0, 0));
                lblBoardTiles[r][c].setBackground(tileColor);
                lblBoardTiles[r][c].setHorizontalAlignment(SwingConstants.CENTER);
                lblBoardTiles[r][c].setVerticalAlignment(SwingConstants.CENTER);
                lblBoardTiles[r][c].setBounds(boardOffsetX + (r * (tileSize + borderSize)), boardOffsetY + (c * (tileSize + borderSize)), tileSize, tileSize);
                panelBoard.add(lblBoardTiles[r][c]);
            }
        }
	    
	}
	
	/**
     * Create the challenger board.
     */
    private void createChallengerBoard() {
        // Reset board tiles
        if (null != lblBoardTiles) {
            destroyBoard();
        }
        
        destroyPlayerLetterTiles();
        destroyBoardLetterTiles();
        
        boardSizeX = 15;
        boardSizeY = 15;
        boardOffsetX = frmScrabble.getWidth()/2 - boardSizeX * (tileSize + borderSize) / 2;
        boardOffsetY = frmScrabble.getHeight()/2 - boardSizeX * (tileSize + borderSize) / 2;
        
        /**
         * Board BitMap
         * 0 = Blank Tile
         * 1 = Starting Point
         * 2 = Double Letter Score Tile
         * 3 = Double Word Score Tile
         * 4 = Triple Letter Score Tile
         * 5 = Triple Word Score Tile
         */
        int boardBitMap[][] = {   
                {5, 0, 0, 2, 0, 0, 0, 5, 0, 0, 0, 2, 0, 0, 5},
                {0, 3, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 3, 0},
                {0, 0, 3, 0, 0, 0, 2, 0, 2, 0, 0, 0, 3, 0, 0},
                {2, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 2},
                {0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0},
                {0, 4, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 4, 0},
                {0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0},
                {5, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 5},
                {0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0, 0, 2, 0, 0},
                {0, 4, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 4, 0},
                {0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0},
                {2, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 2},
                {0, 0, 3, 0, 0, 0, 2, 0, 2, 0, 0, 0, 3, 0, 0},
                {0, 3, 0, 0, 0, 4, 0, 0, 0, 0, 4, 0, 0, 3, 0},
                {5, 0, 0, 2, 0, 0, 0, 5, 0, 0, 0, 2, 0, 0, 5},
                };
        
        lblBoardTiles = new JLetterTile[boardSizeY][boardSizeX];
        
        for (int r = 0; r < boardSizeY; r++) {
            for (int c = 0; c < boardSizeX; c++) {
                String tileName = getTileName(boardBitMap, r, c);
                Color tileColor = getTileColor(boardBitMap, r, c);
                
                lblBoardTiles[r][c] = new JLetterTile(tileName);
                //lblNewLabel.setIcon(new ImageIcon("images\\BLANK.png"));
                lblBoardTiles[r][c].setOpaque(true);
                lblBoardTiles[r][c].setFont(new Font("Tahoma", Font.BOLD, 9));
                lblBoardTiles[r][c].setForeground(new Color(0, 0, 0));
                lblBoardTiles[r][c].setBackground(tileColor);
                lblBoardTiles[r][c].setHorizontalAlignment(SwingConstants.CENTER);
                lblBoardTiles[r][c].setVerticalAlignment(SwingConstants.CENTER);
                lblBoardTiles[r][c].setBounds(boardOffsetX + (r * (tileSize + borderSize)), boardOffsetY + (c * (tileSize + borderSize)), tileSize, tileSize);
                panelBoard.add(lblBoardTiles[r][c]);
            }
        }
        
    }
    
    /**
     * Get the tile's current row location on the board.
     * @param tile - JLetterTile Letter tile.
     * @return Returns a row if tile is on the board. Otherwise, return -1.
     */
    private int getTileRow(JLetterTile tile) {
        int x, row;
        x = tile.getX();
        
        if (x < boardOffsetX - (tileSize + borderSize) / 2
                || x > boardOffsetX + (boardSizeX) * (tileSize + borderSize) - (tileSize + borderSize) / 2) {
            return -1;
        }
        
        row = (x - boardOffsetX) + (tileSize + borderSize) / 2; 
        row = row / (tileSize + borderSize);
        
        if (row < 0) {
            //row = 0;
            return -1;
        } else if (row >= boardSizeX ) {
            //row = boardSizeX - 1;
            return -1;
        }
        
        return row;
    }
    
    /**
     * Get the tile's current column location on the board.
     * @param tile - JLetterTile Letter tile.
     * @return Returns a column if tile is on the board. Otherwise, return -1.
     */
    private int getTileCol(JLetterTile tile) {
        int y, col;
        y = tile.getY();
        
        if (y < boardOffsetY - (tileSize + borderSize) / 2
                || y > boardOffsetY + (boardSizeY) * (tileSize + borderSize) - (tileSize + borderSize) / 2) {
            return -1;
        }
        
        col = (y - boardOffsetY) + (tileSize + borderSize) / 2; 
        col = col / (tileSize + borderSize);
        
        if (col < 0) {
            //col = 0;
            return -1;
        } else if (col >= boardSizeY ) {
            //col = boardSizeY - 1;
            return -1;
        }
        
        return col;
    }
    
	/**
	 * This function will be called when a tile is dragged and placed down.
	 * 
	 * @param x - x-coordinate of placed tile
	 * @param y - x-coordinate of placed tile
	 * @return Returns 1 if placed on a board tile, otherwise return 0.
	 */
	private int placeTile(JLetterTile tile, int x, int y) {
	    
	    int row = -1;
	    int col = -1;
	    
	    // Place letter tile on the board if valid.
	    if (x >= boardOffsetX - (tileSize + borderSize) / 2
	            && x <= boardOffsetX + (boardSizeX) * (tileSize + borderSize) - (tileSize + borderSize) / 2
	            && y >= boardOffsetY - (tileSize + borderSize) / 2
	            && y <= boardOffsetY + (boardSizeY) * (tileSize + borderSize) - (tileSize + borderSize) / 2) {
            
            row = (x - boardOffsetX) + (tileSize + borderSize) / 2; 
            row = row / (tileSize + borderSize);
            
            col = (y - boardOffsetY) + (tileSize + borderSize) / 2; 
            col = col / (tileSize + borderSize);
            
            if (row < 0) {
                row = 0;
            } else if (row >= boardSizeY) {
                row = boardSizeY - 1;
            }
            
            if (col < 0) {
                col = 0;
            } else if (col >= boardSizeX ) {
                col = boardSizeX - 1;
            }
            
            //System.out.println(String.format("%d %d", row, col));
            
            // Check if the current row and col have a tile already placed there.
            if (null != lblLetterTiles[row][col]) {
                final Runnable runnable =
                        (Runnable) Toolkit.getDefaultToolkit().getDesktopProperty("win.sound.exclamation");
                if (runnable != null) runnable.run();
                
                tile.setLocation(oldX, oldY);
                return 0;
            }
            
            // Check if the current row and col have a player's tile already placed there.
            for (int p = 0; p < lblPlayerLetterTiles.length; p++) {
                for (int t = 0; t < lblPlayerLetterTiles[0].length; t++) {
                    if (null != lblPlayerLetterTiles[p][t] && tile != lblPlayerLetterTiles[p][t]) {
                        int tRow, tCol;
                        tRow = getTileRow(lblPlayerLetterTiles[p][t]);
                        tCol = getTileCol(lblPlayerLetterTiles[p][t]);
                        
                        if (tRow == row && tCol == col) {
                            //System.out.println(String.format("%d %d %d %d", row, col, tRow, tCol));
                            final Runnable runnable =
                                    (Runnable) Toolkit.getDefaultToolkit().getDesktopProperty("win.sound.exclamation");
                            if (runnable != null) runnable.run();
                            
                            tile.setLocation(oldX, oldY);
                            return 0;
                        }
                    }
                }
            }
            
            JLetterTile lblBoardTile = lblBoardTiles[row][col];
            tile.setLocation(lblBoardTile.getX(), lblBoardTile.getY());
            
            // Return successful placement on board.
            return 1;
        }
	    
	    // Prevent letter tile from leaving the root pane window. (Prevent tile from disappearing off the window)
        if (tile.getX() < 0) {
            tile.setLocation(0, tile.getY());
        }
        if (tile.getX() > frmScrabble.getRootPane().getWidth() - tile.getWidth()) {
            tile.setLocation(frmScrabble.getRootPane().getWidth() - tile.getWidth(), tile.getY());
        }
        if (tile.getY() < 0) {
            tile.setLocation(tile.getX(), 0);
        }
        if (tile.getY() > frmScrabble.getRootPane().getHeight()  - tile.getHeight()) {
            tile.setLocation(tile.getX(), frmScrabble.getRootPane().getHeight() - tile.getHeight());
        }
	    
        // Return failure to place on board.
	    return 0;
	}
	
	/**
	 * Set the global "players" value to the "numOfPlayers" value. <br>
	 * This function will also control the GUI elements for "panelEnterInfo" based on the "numOfPlayers" value. <br><br>
	 * 
	 * "numOfPlayer" must be inclusively between 2 and 4 players or nothing will occur.
	 * 
	 * @param num - number of players
	 */
	private void setNumOfPlayers(int num) {
	    numOfPlayers = num;
	    
	    switch (numOfPlayers) {
    	    case 1:
    	        lblName1.setVisible(true);
    	        txtName1.setVisible(true);
    	        lblName2.setVisible(false);
                txtName2.setVisible(false);
                lblName3.setVisible(false);
                txtName3.setVisible(false);
                lblName4.setVisible(false);
                txtName4.setVisible(false);
    	        break;
    	    case 2:
                lblName1.setVisible(true);
                txtName1.setVisible(true);
                lblName2.setVisible(true);
                txtName2.setVisible(true);
                lblName3.setVisible(false);
                txtName3.setVisible(false);
                lblName4.setVisible(false);
                txtName4.setVisible(false);
                break;
    	    case 3:
                lblName1.setVisible(true);
                txtName1.setVisible(true);
                lblName2.setVisible(true);
                txtName2.setVisible(true);
                lblName3.setVisible(true);
                txtName3.setVisible(true);
                lblName4.setVisible(false);
                txtName4.setVisible(false);
                break;
    	    case 4:
                lblName1.setVisible(true);
                txtName1.setVisible(true);
                lblName2.setVisible(true);
                txtName2.setVisible(true);
                lblName3.setVisible(true);
                txtName3.setVisible(true);
                lblName4.setVisible(true);
                txtName4.setVisible(true);
                break;
    	    default:
    	        numOfPlayers = -1;
    	        System.err.println(String.format("ScrabbleGui::setNumOfPlayers: Invalid numOfPlayers = %d. Must be inclusively between 2 and 4 players.", numOfPlayers));
	    }
	}
	
    /**
     * Given a tile bit map, Get the tile name at a certain row and column. <br><br>
     * 
     * 0 = Blank Tile <br>
     * 1 = Starting Point <br>
     * 2 = Double Letter Score Tile <br>
     * 3 = Double Word Score Tile <br>
     * 4 = Triple Letter Score Tile <br>
     * 5 = Triple Word Score Tile <br>
     */
	private String getTileName(int tileBitMap[][], int row, int column) {
	    
	    int bit = tileBitMap[row][column];
	    
	    String str = null;
	    
	    switch (bit) {
	        case 0:
	            str = "";
	            break;
	        case 1:
	            str = "<html>"
	                    + "<div style=\"align=text-center;\">\r\n"
	                    + "START"
	                    + "</div>"
	                    + "</html>";
	            break;
	        case 2:
	            str = "<html>"
	                    + "<div style=\"align=text-center;\">\r\n"
                        + "DOUBLE<br>\r\n"
                        + "LETTER<br>\r\n"
                        + "SCORE"
                        + "</div>"
                        + "</html>";
	            break;
	        case 3:
	            str = "<html>"
	                    + "<div style=\"align=text-center;\">\r\n"
                        + "DOUBLE<br>\r\n"
                        + "WORD<br>\r\n"
                        + "SCORE"
                        + "</div>"
                        + "</html>";
	            break;
	        case 4:
	            str = "<html>"
	                    + "<div style=\"align=text-center;\">\r\n"
                        + "TRIPLE<br>\r\n"
                        + "LETTER<br>\r\n"
                        + "SCORE"
                        + "</div>"
                        + "</html>";
	            break;
	        case 5:
	            str = "<html>"
	                    + "<div style=\"align=text-center;\">\r\n"
                        + "TRIPLE<br>\r\n"
                        + "WORD<br>\r\n"
                        + "SCORE"
                        + "</div>"
                        + "</html>";
	            break;
	        default:
	            str = "";
	    }
	    
        return str;
	}
	
    /**
     * Given a tile bit map, Get the tile color at a certain row and column. <br><br>
     * 
     * 0 = Blank Tile;                  color = Color(209, 201, 172) <br>
     * 1 = Starting Point               color = Color(241, 181, 170) <br>
     * 2 = Double Letter Score Tile     color = Color(195, 218, 215) <br>
     * 3 = Double Word Score Tile       color = Color(253, 185, 170) <br>
     * 4 = Triple Letter Score Tile     color = Color(62, 157, 181) <br>
     * 5 = Triple Word Score Tile       color = Color(253, 102, 79) <br>
     */
    private Color getTileColor(int tileBitMap[][], int row, int column) {
        
        int bit = tileBitMap[row][column];
        
        Color color = null;
        
        switch (bit) {
            case 0:
                color = new Color(209, 201, 172);
                break;
            case 1:
                color = new Color(241, 181, 170);
                break;
            case 2:
                color = new Color(195, 218, 215);
                break;
            case 3:
                color = new Color(253, 185, 170);
                break;
            case 4:
                color = new Color(62, 157, 181);
                break;
            case 5:
                color = new Color(253, 102, 79);
                break;
            default:
                color = new Color(209, 201, 172);
        }
        
        return color;
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
