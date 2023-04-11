//import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JButton;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JSeparator;
import javax.swing.JTextField;
import javax.swing.JScrollPane;
import javax.swing.JPanel;
import javax.swing.JList;
import java.awt.Color;
import javax.swing.JTextArea;
import javax.swing.border.EtchedBorder;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import javax.swing.ListSelectionModel;
import java.awt.Toolkit;

/**
 * This is the GUI for "GradeAnalyzer.java".
 * This GUI depends/requires the "MainMenu.java" class file to run.
 * 
 * The purpose of this GUI is to analyze grade scores inserted by the user.
 * 
 * File Name: 	GradeAnalyzer.java
 * Date: 		3/24/2017
 * 
 * @author Jimmy Vang
 *
 */
public class GradeAnalyzerUI {

	// Frame
	private JFrame frmGradeAnalyzer;
	
	// Frame Components
	private JTextField txtEnterEarnedPoints;
	private JTextField txtEnterAvailablePoints;
	private JList<String> listGradesEntered;
	private JTextArea txtrGradeSummary;
	
	// Data / Other Variables
	private ArrayList<Object> list = new ArrayList<Object>();
	private String[] stringArrayGrades;
	private static Boolean exitStatus = false;
	
	// Color objects
	final private Color ERROR_COLOR = new Color(255,88,88);	// Light-Red
	//final private Color TEXT_COLOR = new Color(51,51,51);  	// Dark Grey <--> Black
	final private Color WHITE = Color.WHITE;				// White
	
//	/**
//	 * Launch the application.
//	 */
//	public static void main(String[] args) {
//		EventQueue.invokeLater(new Runnable() {
//			public void run() {
//				try {
//					GradeAnalyzerUI window = new GradeAnalyzerUI();
//					window.getFrmGradeAnalyzer().setVisible(true);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		});
//	}

	/**
	 * Create the application.
	 */
	public GradeAnalyzerUI() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		setFrmGradeAnalyzer(new JFrame());
		getFrmGradeAnalyzer().setTitle("Grade Analyzer");
		getFrmGradeAnalyzer().setBounds(100, 100, 420, 300);
		getFrmGradeAnalyzer().setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		getFrmGradeAnalyzer().getContentPane().setLayout(null);
		
		JLabel lblEnterGrade = new JLabel("Enter Grade:");
		lblEnterGrade.setBounds(12, 12, 70, 16);
		getFrmGradeAnalyzer().getContentPane().add(lblEnterGrade);
		
		txtEnterEarnedPoints = new JTextField();
		txtEnterEarnedPoints.setToolTipText("Earned Points");
		txtEnterEarnedPoints.addFocusListener(new FocusAdapter() {
			@Override
			public void focusGained(FocusEvent arg0) {
				txtEnterEarnedPoints.setBackground(WHITE);
			}
		});
		txtEnterEarnedPoints.setBounds(86, 10, 70, 20);
		getFrmGradeAnalyzer().getContentPane().add(txtEnterEarnedPoints);
		txtEnterEarnedPoints.setColumns(10);
		
		JLabel lblOutOf = new JLabel("out of");
		lblOutOf.setBounds(163, 12, 32, 16);
		getFrmGradeAnalyzer().getContentPane().add(lblOutOf);
		
		txtEnterAvailablePoints = new JTextField();
		txtEnterAvailablePoints.setToolTipText("Available Points");
		txtEnterAvailablePoints.addFocusListener(new FocusAdapter() {
			@Override
			public void focusGained(FocusEvent e) {
				txtEnterAvailablePoints.setBackground(WHITE);
			}
		});
		txtEnterAvailablePoints.setColumns(10);
		txtEnterAvailablePoints.setBounds(203, 10, 70, 20);
		getFrmGradeAnalyzer().getContentPane().add(txtEnterAvailablePoints);
		
		JLabel lblPoints = new JLabel("points");
		lblPoints.setBounds(278, 12, 35, 16);
		getFrmGradeAnalyzer().getContentPane().add(lblPoints);
		
		JButton btnAddGrade = new JButton("Add Grade");
		btnAddGrade.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				addGrade();
			}
		});
		btnAddGrade.setBounds(12, 42, 110, 26);
		getFrmGradeAnalyzer().getContentPane().add(btnAddGrade);
		
		JButton btnClearGrades = new JButton("Clear Grades");
		btnClearGrades.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				clearGrades();
			}
		});
		
		JButton btnRemoveSelected = new JButton("Remove Selected");
		btnRemoveSelected.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				removeSelected();
			}
		});
		btnRemoveSelected.setBounds(127, 42, 146, 26);
		frmGradeAnalyzer.getContentPane().add(btnRemoveSelected);
		btnClearGrades.setBounds(278, 42, 110, 26);
		getFrmGradeAnalyzer().getContentPane().add(btnClearGrades);
		
		JLabel lblGradesEntered = new JLabel("Grades Entered:");
		lblGradesEntered.setBounds(12, 80, 91, 16);
		getFrmGradeAnalyzer().getContentPane().add(lblGradesEntered);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(12, 108, 200, 118);
		getFrmGradeAnalyzer().getContentPane().add(scrollPane);
		
		listGradesEntered = new JList<String>();
		listGradesEntered.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		scrollPane.setViewportView(listGradesEntered);
		
		JLabel lblGradeSummary = new JLabel("Grade Summary:");
		lblGradeSummary.setBounds(232, 80, 95, 16);
		getFrmGradeAnalyzer().getContentPane().add(lblGradeSummary);
		
		JPanel panel = new JPanel();
		panel.setBackground(Color.WHITE);
		panel.setBorder(new EtchedBorder(EtchedBorder.LOWERED, null, null));
		panel.setBounds(232, 108, 160, 118);
		getFrmGradeAnalyzer().getContentPane().add(panel);
		panel.setLayout(null);
		
		txtrGradeSummary = new JTextArea();
		txtrGradeSummary.setEditable(false);
		txtrGradeSummary.setBounds(12, 12, 136, 94);
		panel.add(txtrGradeSummary);
		
		JMenuBar menuBar = new JMenuBar();
		getFrmGradeAnalyzer().setJMenuBar(menuBar);
		
		JMenu mnFile = new JMenu("File");
		menuBar.add(mnFile);
		
		JMenuItem mntmGoBack = new JMenuItem("Go Back");
		mntmGoBack.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				goToMainMenu();
			}
		});
		mnFile.add(mntmGoBack);
		
		JSeparator separator = new JSeparator();
		mnFile.add(separator);
		
		JMenuItem mntmExit = new JMenuItem("Exit");
		mntmExit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				exit();
			}
		});
		mnFile.add(mntmExit);
		
		clearGrades();
	}
	
	/**
	 * Add a Grade object to the ArrayList.
	 * Refreshs Grades.
	 */
	private void addGrade() {
		
		// Create earned and available points integers.
		int earnedPoints = 0;
		int availablePoints = 0;
		
		///////////////////////
		// Check user input. //
		///////////////////////
		try {
			txtEnterEarnedPoints.setBackground(WHITE);
			txtEnterAvailablePoints.setBackground(WHITE);
			
			////////////////////////////////////////////
			// Attempt to parse "txtEnterEarnedPoints"
			txtEnterEarnedPoints.setBackground(ERROR_COLOR);
			earnedPoints = Integer.parseInt(txtEnterEarnedPoints.getText());
			txtEnterEarnedPoints.setBackground(WHITE);
			
			////////////////////////////////////////////////
			// Attempt to parse "txtEnterAvailablePoints".
			txtEnterAvailablePoints.setBackground(ERROR_COLOR);
			availablePoints = Integer.parseInt(txtEnterAvailablePoints.getText());
			txtEnterAvailablePoints.setBackground(WHITE);
			
			// Prevent negative numbers from being entered, then informs user.
			if (earnedPoints < 0) {
				txtEnterEarnedPoints.setBackground(ERROR_COLOR);
				JOptionPane.showMessageDialog(getFrmGradeAnalyzer(), "Please enter a positive integer value. (larger than or equal to 0)", "ERROR", JOptionPane.WARNING_MESSAGE);
				return;
			}
			
			// Prevent negative numbers and 0 from being entered, then informs user.
			if (availablePoints < 1) {
				txtEnterAvailablePoints.setBackground(ERROR_COLOR);
				JOptionPane.showMessageDialog(getFrmGradeAnalyzer(), "Please enter a positive integer value. (larger than 0)", "ERROR", JOptionPane.WARNING_MESSAGE);
				return;
			}
			
			// Prevent earned points from being greater than available points, then informs user.
			if (earnedPoints > availablePoints) {
				txtEnterEarnedPoints.setBackground(ERROR_COLOR);
				JOptionPane.showMessageDialog(getFrmGradeAnalyzer(), "The Earned Points must be less than the Available Points.", "ERROR", JOptionPane.WARNING_MESSAGE);
				return;
			}
			
		} catch (NumberFormatException e) {
			// Inform user to enter an integer value.
			JOptionPane.showMessageDialog(getFrmGradeAnalyzer(), "Please enter an integer value.", "ERROR", JOptionPane.WARNING_MESSAGE);
			return;
		}
		
		//////////////////////////////////////////////////////////////////////////////////
		
		///////////////////////////////////////////////////////////////////////////////////
		// Create a "newGrade" object using earned and available points from user input. //
		Grade newGrade = new Grade(earnedPoints, availablePoints);
		
		////////////////////////////////////////
		// Add "newGrade" object to ArrayList //
		////////////////////////////////////////
		list.add(newGrade);
		
		// Refresh grades entered.
		refreshAllGrades();
		
		//////////////////////////////////////////////////////////////////////////////////
	}
	
	/**
	 * Clear all grades from the ArrayList.
	 * Refreshs grades.
	 */
	private void clearGrades() {
		
		// Clear all "Grade" objects from ArrayList.
		list.clear();
		
		// Refresh grades entered.
		refreshAllGrades();
	}
	
	/**
	 * Remove the selected value from jList, "listGradesEntered".
	 */
	private void removeSelected() {
		try {
			//////////////////////////////////////////////////
			// Get the selected value String from the list. //
			// 												//
			// Example: 									//
			// ("#10 || 100/100 || 100%")					//
			//////////////////////////////////////////////////
			String selectedValue = (String)listGradesEntered.getSelectedValue();
			
			//////////////////////////////////////////////
			// Split "selectedValue" into an array. 	//
			// ("#10", "||", "100/100", "||", "100%")	//
			//////////////////////////////////////////////
			String[] selectedValueArr = selectedValue.split(" ");
			
			//////////////////////////////
			// Selected the first index //
			// ("#10")					//
			//////////////////////////////
			selectedValue = selectedValueArr[0];
			
			//////////////////////////////////////////////////
			// Replace "#" symbols and trim white-spaces.	//
			// ("10")										//
			//////////////////////////////////////////////////
			selectedValue = selectedValue.replaceAll("#", "");
			selectedValue = selectedValue.trim();
			
			///////////////////////////////////////////////////////////////////
			// Search ArrayList with the obtained index number and remove it.
			// ("10")
			list.remove(Integer.parseInt(selectedValue));
			
		} catch (NullPointerException | NumberFormatException e) {
			return;
		} catch (Exception e) {
			return;
		}
		
		// Refresh all grades.
		refreshAllGrades();
	}
	
	/**
	 * Refresh all grade related objects and methods.
	 */
	private void refreshAllGrades() {
		// Refresh Grades Entered.
		refreshGradesEntered();
		
		// Refresh Grade Summary.
		refreshGradeSummary();
	}
	
	/**
	 * Refresh the Grades Entered into jList, "listGradesEntered".
	 */
	private void refreshGradesEntered() {
		//////////////////////////////////////////////////////////
		// Refresh Grades Entered. (jList, "listGradesEntered") //
		//////////////////////////////////////////////////////////
		
		// Create the DecimalFormat object for grades, which is rounded to 2 decimal places.
		DecimalFormat df = new DecimalFormat("##0.00");
		
		// Create a new string array to store grades from ArrayList.
		stringArrayGrades = new String[list.size()];
		
		// Convert ArrayList to StringArray.
		for(int i = 0; i < list.size(); i++) {
			Grade tempGrade = (Grade)list.get(i);
			
			// Store data from tempGrade into the String Array.
			stringArrayGrades[i] = "#" + i + 
					" || " + tempGrade.getEarnedPoints() + "/" + tempGrade.getAvailablePoints() + 
					" || " + df.format(tempGrade.getPercentage()) + "%";
		}
		
		//### Set the jList data to the StringArray data. ###//
		listGradesEntered.setListData(stringArrayGrades);
		
	}
	
	/**
	 * Refresh the Grade Summary of jTextField, "txtGradeSummary".
	 */
	private void refreshGradeSummary() {
		////////////////////////////////////////////////////////////
		// Refresh Grade Summary. (jTextField, "txtGradeSummary") //
		////////////////////////////////////////////////////////////
		
		// Create summary variables
		double averageGrade 	= 0;
		double maxGrade 		= Double.MIN_VALUE;
		double minGrade 		= Double.MAX_VALUE;
		double totalGrade 		= 0;
		
		////////////////////////////////////////////////////////////
		// Get Average Grade 	//
		// Get Max/Min Grade 	//
		// Get Total Grade 		//
		////////////////////////////////////////////////////////////
		
		// Create sum for finding average grade.
		double sumOfPercentages = 0;
		
		// Create earned and available points for finding total grade.
		double earnedPoints 	= 0;
		double availablePoints 	= 0;
		
		// Prevent minGrade from showing up Double.MAX_VALUE.
		if(list.isEmpty()) {
			minGrade = 0;
		}
		
		// Create Loop Counter(s)
		int i = 0;
		
		// Search all Grade objects in this for-loop.
		for(i = 0; i < list.size(); i++) {
			Grade tempGrade = (Grade)list.get(i);
			/////////////////////////////
			// Find sum of percentages.
			sumOfPercentages += tempGrade.getPercentage();
			
			/////////////////////////
			// Calculate max grade.
			if(maxGrade < tempGrade.getPercentage()) {
				maxGrade = tempGrade.getPercentage();
			}
			/////////////////////////
			// Calculate min grade.
			if(minGrade > tempGrade.getPercentage()) {
				minGrade = tempGrade.getPercentage();
			}
			/////////////////////////////////////////////
			// Find earned points and available points.
			earnedPoints += tempGrade.getEarnedPoints();
			availablePoints += tempGrade.getAvailablePoints();
			
		}
		/////////////////////////////
		// Calculate average grade.
		averageGrade = sumOfPercentages/i;
		
		// Treat NaN value as 0.
		if(Double.isNaN(averageGrade)) {
			averageGrade = 0;
		}
		///////////////////////////
		// Calculate total grade.
		if(availablePoints <= 0) {
			totalGrade = 0;
		} else {
			totalGrade = 100 * (earnedPoints/availablePoints);
		}
		
		// Treat NaN value as 0.
		if(Double.isNaN(totalGrade)) {
			totalGrade = 0;
		}
		
		/////////////////////////////////
		
		// Create the DecimalFormat object for grades, which is rounded to 2 decimal places.
		DecimalFormat df = new DecimalFormat("##0.00");
		
		/////////////////////////////////////////////////////
		// Combine data and create a grade summary String. //
		/////////////////////////////////////////////////////
		String gradeSummary = 
				"Average Grade: " + df.format(averageGrade) + "%" +
				"\nMax Grade: " + df.format(maxGrade) + "%" +
				"\nMin Grade: " + df.format(minGrade) + "%" +
				"\nTotal Grade: " + df.format(totalGrade) + "%";
		
		//////////////////////////////////////////
		// Display grade summary in the jTextArea, "txtrGradeSummary".
		txtrGradeSummary.setText(gradeSummary);
	}
	
	/**
	 * Attempt to open the Main Menu frame.
	 */
	private void goToMainMenu() {
		try {
			MainMenu.gradeAnalyzerUIWindow.getFrmGradeAnalyzer().setVisible(false);
			
			int x = MainMenu.gradeAnalyzerUIWindow.getFrmGradeAnalyzer().getX();
			int y = MainMenu.gradeAnalyzerUIWindow.getFrmGradeAnalyzer().getY();
			MainMenu.mainMenuWindow.getFrmMainMenu().setLocation(x, y);
			
			MainMenu.mainMenuWindow.getFrmMainMenu().setVisible(true);
		} catch (NullPointerException e) {
			JOptionPane.showMessageDialog(getFrmGradeAnalyzer(), "The \"Main Menu\" GUI was never created!", "ERROR", JOptionPane.WARNING_MESSAGE);
			//e.printStackTrace();
		}
	}
	
	/**
	 * Is called by exit().
	 * Prompts user to confirm exit/quit.
	 */
	private void confirmExit() {
		int choice = JOptionPane.showConfirmDialog(getFrmGradeAnalyzer(), "Are you sure you want to quit?", "Quit Program?", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
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
		
		if(exitStatus == true) {
			System.exit(0);
		}
	}
	
	/**
	 * Returns jFrame of this class.
	 * @return frmGradeAnalyzer - The frame of this class.
	 */
	JFrame getFrmGradeAnalyzer() {
		return frmGradeAnalyzer;
	}

	/**
	 * Set the jFrame of this class.
	 * @param frmGradeAnalyzer - The JFrame to attach to this class.
	 */
	private void setFrmGradeAnalyzer(JFrame frmGradeAnalyzer) {
		this.frmGradeAnalyzer = frmGradeAnalyzer;
		frmGradeAnalyzer.setIconImage(Toolkit.getDefaultToolkit().getImage(GradeAnalyzerUI.class.getResource("/com/sun/javafx/scene/web/skin/FontColor_16x16_JFX.png")));
		
		frmGradeAnalyzer.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				exit();
			}
		});
	}
}
