import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JButton;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.Toolkit;

/**
 * This is the GUI for "MainMenu.java".
 * When the GUI is started, the "GradeAnalyzerUI.java" and "GPACalculator.java" class file jFrames are started.
 * The "GradeAnalyzerUI.java" and "GPACalculator.java" depend on this "MainMenu.java" class to run.
 * 
 * The purpose of this GUI is to serve as the Main Menu of other compatible Swing programs.
 * 
 * File Name: 	MainMenu.java
 * Date: 		3/24/2017
 * 
 * @author Jimmy Vang
 *
 */
public class MainMenu {

	// Frame
	private JFrame frmMainMenu;
	
	// Frame Components
	static MainMenu mainMenuWindow;
	static GradeAnalyzerUI gradeAnalyzerUIWindow;
	static GPACalculator gpaCalculatorWindow;
	
	// Data / Other Variables
	private static Boolean exitStatus = false;
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					mainMenuWindow = new MainMenu();
					gradeAnalyzerUIWindow = new GradeAnalyzerUI();
					gpaCalculatorWindow = new GPACalculator();
					
					mainMenuWindow.getFrmMainMenu().setVisible(true);
					gradeAnalyzerUIWindow.getFrmGradeAnalyzer().setVisible(false);
					gpaCalculatorWindow.getFrmGpaCalculator().setVisible(false);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public MainMenu() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		setFrmMainMenu(new JFrame());
		getFrmMainMenu().setTitle("Grade Analyzer");
		getFrmMainMenu().setBounds(100, 100, 286, 108);
		getFrmMainMenu().setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		getFrmMainMenu().getContentPane().setLayout(null);
		
		JButton btnNewButton = new JButton("Grade Analyzer");
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				goToGradeAnalyzerUI();
			}
		});
		btnNewButton.setBounds(10, 11, 120, 23);
		frmMainMenu.getContentPane().add(btnNewButton);
		
		JButton btnNewButton_1 = new JButton("GPA Calculator");
		btnNewButton_1.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				goToGpaCalculator();
			}
		});
		btnNewButton_1.setBounds(140, 11, 120, 23);
		frmMainMenu.getContentPane().add(btnNewButton_1);
		
		JMenuBar menuBar = new JMenuBar();
		frmMainMenu.setJMenuBar(menuBar);
		
		JMenu mnFile = new JMenu("File");
		menuBar.add(mnFile);
		
		JMenuItem mntmExit = new JMenuItem("Exit");
		mntmExit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				exit();
			}
		});
		mnFile.add(mntmExit);
	}
	
	/**
	 * Attempt to open the Grade Analyzer UI frame.
	 */
	private void goToGradeAnalyzerUI() {
		try {
			mainMenuWindow.getFrmMainMenu().setVisible(false);

			int x = mainMenuWindow.getFrmMainMenu().getX();
			int y = mainMenuWindow.getFrmMainMenu().getY();
			gradeAnalyzerUIWindow.getFrmGradeAnalyzer().setLocation(x, y);
			
			gradeAnalyzerUIWindow.getFrmGradeAnalyzer().setVisible(true);
		} catch (NullPointerException e) {
			JOptionPane.showMessageDialog(this.getFrmMainMenu(), "The \"Grade Analyzer\" GUI was never created!", "ERROR", JOptionPane.WARNING_MESSAGE);
			//e.printStackTrace();
		}
	}
	
	/**
	 * Attempt to open the GPA Calculator frame.
	 */
	private void goToGpaCalculator() {
		try {
			mainMenuWindow.getFrmMainMenu().setVisible(false);
			
			int x = mainMenuWindow.getFrmMainMenu().getX();
			int y = mainMenuWindow.getFrmMainMenu().getY();
			gpaCalculatorWindow.getFrmGpaCalculator().setLocation(x, y);
			
			gpaCalculatorWindow.getFrmGpaCalculator().setVisible(true);
		} catch (NullPointerException e) {
			JOptionPane.showMessageDialog(this.getFrmMainMenu(), "The \"GPA Calculator\" GUI was never created!", "ERROR", JOptionPane.WARNING_MESSAGE);
			//e.printStackTrace();
		}
	}
	
	/**
	 * Is called by exit().
	 * Prompts user to confirm exit/quit.
	 */
	private void confirmExit() {
		int choice = JOptionPane.showConfirmDialog(getFrmMainMenu(), "Are you sure you want to quit?", "Quit Program?", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
		if(choice == JOptionPane.YES_OPTION) {
			exitStatus = true;
			return;
		}
		if(choice == JOptionPane.NO_OPTION) {
			exitStatus = false;
			return;
		}
		if(choice == JOptionPane.CLOSED_OPTION) {
			exitStatus = false;
			return;
		}
	}
	
	/**
	 * Exits the program.
	 * Calls confirmExit() to prompt user to exit.
	 */
	private void exit() {
		exitStatus = true;
		
		confirmExit();
		
		if(MainMenu.exitStatus == true) {
			System.exit(0);
		}
	}
	
	/**
	 * Returns jFrame of this class.
	 * @return frmMainMenu - The frame of this class.
	 */
	JFrame getFrmMainMenu() {
		return frmMainMenu;
	}

	/**
	 * Set the jFrame of this class.
	 * @param frmMainMenu - The JFrame to attach to this class.
	 */
	private void setFrmMainMenu(JFrame frmMainMenu) {
		this.frmMainMenu = frmMainMenu;
		frmMainMenu.setIconImage(Toolkit.getDefaultToolkit().getImage(MainMenu.class.getResource("/com/sun/javafx/scene/web/skin/FontColor_16x16_JFX.png")));
		
		frmMainMenu.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				exit();
			}
		});
	}
}
