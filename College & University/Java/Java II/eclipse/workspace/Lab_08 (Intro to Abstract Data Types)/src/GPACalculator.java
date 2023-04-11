//import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JSeparator;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.text.DecimalFormat;
import java.util.TreeMap;
import java.util.Map.Entry;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JTextField;
import java.awt.Choice;
import java.awt.Color;

import javax.swing.JTextArea;
import javax.swing.JPanel;
import javax.swing.border.EtchedBorder;
import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JList;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import javax.swing.ListSelectionModel;
import java.awt.Toolkit;

/**
 * This is the GUI for "GPACalculator.java".
 * This GUI depends/requires the "MainMenu.java" class file to run.
 * 
 * The purpose of this GUI is to calculate the Cumulative GPA based on user input.
 * 
 * File Name: 	GPACalculator.java
 * Date: 		3/24/2017
 * 
 * @author Jimmy Vang
 *
 */
public class GPACalculator {

	// Frame
	private JFrame frmGpaCalculator;

	// Frame Components
	private JTextField txtCourseId;
	private JTextField txtCredits;
	private Choice choiceGradeEarned;
	private JTextField txtCumulativeGpa;
	private JList<String> listGradesEntered;
	
	// Data / Other Variables
	private TreeMap<String, Object> map = new TreeMap<String, Object>();
	private String[] stringArrayClassGrade;
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
//					GPACalculator window = new GPACalculator();
//					window.getFrmGpaCalculator().setVisible(true);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		});
//	}

	/**
	 * Create the application.
	 */
	public GPACalculator() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		setFrmGpaCalculator(new JFrame());
		getFrmGpaCalculator().setTitle("GPA Calculator");
		getFrmGpaCalculator().setBounds(100, 100, 500, 446);
		getFrmGpaCalculator().setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		
		JMenuBar menuBar = new JMenuBar();
		getFrmGpaCalculator().setJMenuBar(menuBar);
		
		JMenu mnFile = new JMenu("File");
		menuBar.add(mnFile);
		
		JMenuItem mntmGoBack = new JMenuItem("Go Back");
		mntmGoBack.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				goToMainMenu();
			}
		});
		mnFile.add(mntmGoBack);
		
		JSeparator separator = new JSeparator();
		mnFile.add(separator);
		
		JMenuItem mntmExit = new JMenuItem("Exit");
		mntmExit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				exit();
			}
		});
		mnFile.add(mntmExit);
		frmGpaCalculator.getContentPane().setLayout(null);
		
		JLabel lblCourseId = new JLabel("Course Id:");
		lblCourseId.setBounds(12, 12, 98, 16);
		frmGpaCalculator.getContentPane().add(lblCourseId);
		
		txtCourseId = new JTextField();
		txtCourseId.addFocusListener(new FocusAdapter() {
			@Override
			public void focusGained(FocusEvent arg0) {
				txtCourseId.setBackground(WHITE);
			}
		});
		txtCourseId.setBounds(128, 10, 150, 20);
		frmGpaCalculator.getContentPane().add(txtCourseId);
		txtCourseId.setColumns(10);
		
		JLabel lblCredits = new JLabel("Credits:");
		lblCredits.setBounds(12, 39, 98, 16);
		frmGpaCalculator.getContentPane().add(lblCredits);
		
		txtCredits = new JTextField();
		txtCredits.addFocusListener(new FocusAdapter() {
			@Override
			public void focusGained(FocusEvent e) {
				txtCredits.setBackground(WHITE);
			}
		});
		txtCredits.setBounds(128, 37, 150, 20);
		frmGpaCalculator.getContentPane().add(txtCredits);
		txtCredits.setColumns(10);
		
		JLabel lblGradeEarned = new JLabel("Grade Earned:");
		lblGradeEarned.setBounds(12, 67, 98, 16);
		frmGpaCalculator.getContentPane().add(lblGradeEarned);
		
		choiceGradeEarned = new Choice();
		choiceGradeEarned.setBounds(128, 64, 150, 22);
		choiceGradeEarned.add("A");
		choiceGradeEarned.add("A/B");
		choiceGradeEarned.add("B");
		choiceGradeEarned.add("B/C");
		choiceGradeEarned.add("C");
		choiceGradeEarned.add("D");
		choiceGradeEarned.add("F");
		frmGpaCalculator.getContentPane().add(choiceGradeEarned);
		
		JButton btnAddGrade = new JButton("Add Grade");
		btnAddGrade.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				addGrade();
			}
		});
		btnAddGrade.setBounds(12, 106, 98, 26);
		frmGpaCalculator.getContentPane().add(btnAddGrade);
		
		JButton btnClear = new JButton("Clear");
		btnClear.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				clear();
			}
		});
		btnClear.setBounds(180, 106, 98, 26);
		frmGpaCalculator.getContentPane().add(btnClear);
		
		JButton btnRemoveSelected = new JButton("Remove Selected");
		btnRemoveSelected.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				removeSelected();
			}
		});
		btnRemoveSelected.setBounds(12, 144, 133, 26);
		frmGpaCalculator.getContentPane().add(btnRemoveSelected);
		
		JLabel lblCumulativeGpa = new JLabel("Cumulative GPA:");
		lblCumulativeGpa.setBounds(12, 205, 98, 16);
		frmGpaCalculator.getContentPane().add(lblCumulativeGpa);
		
		txtCumulativeGpa = new JTextField();
		txtCumulativeGpa.setEditable(false);
		txtCumulativeGpa.setBounds(128, 203, 114, 20);
		frmGpaCalculator.getContentPane().add(txtCumulativeGpa);
		txtCumulativeGpa.setColumns(10);
		
		JLabel lblGradeScale = new JLabel("Grade Scale:");
		lblGradeScale.setBounds(348, 12, 72, 16);
		frmGpaCalculator.getContentPane().add(lblGradeScale);
		
		JPanel panel = new JPanel();
		panel.setBounds(348, 39, 124, 138);
		panel.setBorder(new EtchedBorder(EtchedBorder.LOWERED, null, null));
		frmGpaCalculator.getContentPane().add(panel);
		panel.setLayout(null);
		
		JTextArea txtrGradeScale = new JTextArea();
		txtrGradeScale.setEditable(false);
		txtrGradeScale.setBounds(1, 1, 121, 135);
		panel.add(txtrGradeScale);
		txtrGradeScale.setText("4.00  A\r\n3.50  A/B\r\n3.00  B\r\n2.50  B/C\r\n2.00  C\r\n1.00  D\r\n0.00  F");
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(12, 235, 460, 137);
		frmGpaCalculator.getContentPane().add(scrollPane);
		
		listGradesEntered = new JList<String>();
		listGradesEntered.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		scrollPane.setViewportView(listGradesEntered);
		
		refreshAllGrades();
	}
	
	/**
	 * Add a ClassGrade object to the TreeMap.
	 * Refresh Grades.
	 */
	private void addGrade() {

		// Create "courseId" and "credits".
		String courseId = "";
		int credits = 0;
		double gradeEarned = 0;
		
		///////////////////////
		// Check user input. //
		///////////////////////
		try {
			// Reset input colors.
			txtCredits.setBackground(WHITE);
			
			/////////////////////////////////
			// Get text from "txtCourseId".
			courseId = txtCourseId.getText();
			
			///////////////////////////////////
			// Attempt to parse "txtCredits".
			txtCredits.setBackground(ERROR_COLOR);
			credits = Integer.parseInt(txtCredits.getText());
			txtCredits.setBackground(WHITE);
			
			// For "txtCredits", prevent inputs less than 0, then informs user.
			if (credits < 0) {
				txtCredits.setBackground(ERROR_COLOR);
				JOptionPane.showMessageDialog(getFrmGpaCalculator(), "Please enter an positive integer value greater than or equal to 0", "ERROR", JOptionPane.WARNING_MESSAGE);
				return;
			}
			
			//////////////////////////////////////////////////////////////////////////////
			// Attempt to calculate grade earned from the "choiceGradeEarned" combo box.
			String strGradeEarned = choiceGradeEarned.getSelectedItem();
			
			switch (strGradeEarned) {
			case "A":
				gradeEarned = 4.00;
				break;
			case "A/B":
				gradeEarned = 3.50;
				break;
			case "B":
				gradeEarned = 3.00;
				break;
			case "B/C":
				gradeEarned = 2.50;
				break;
			case "C":
				gradeEarned = 2.00;
				break;
			case "D":
				gradeEarned = 1.00;
				break;
			case "F":
				gradeEarned = 0.00;
				break;
			default:
				System.out.println("ERROR: An unexpected letter grade was selected in the \"Grade Earned:\" choice combo box.");
				System.exit(0);
				//break;
			}
			
		} catch (NumberFormatException e) {
			// Inform user to enter an integer value.
			JOptionPane.showMessageDialog(getFrmGpaCalculator(), "Please enter an integer value.", "ERROR", JOptionPane.WARNING_MESSAGE);
			return;
		}
		
		//--------------------------------------------------------------------------------
		
		//////////////////////////////////////////////////////////////////////////////////
		// Create a "newGrade" object using earned and available points from user input.
		ClassGrade newClassGrade = new ClassGrade(courseId, credits, gradeEarned);
		ClassGrade oldClassGrade = (ClassGrade)(map.get(newClassGrade.getClassId()));
		/////////////////////////////////////////////////
		// Attempt to add "newGrade" object to TreeMap //
		
		// Does the TreeMap contain the KEY or ClassID of the "ClassGrade" Object?
		if(map.containsKey(newClassGrade.getClassId())) {
			// If the TreeMap already contains the ClassID key, prompt the user to replace it.
			int choice = JOptionPane.showConfirmDialog(getFrmGpaCalculator(), 
					"The Course ID  \"" + newClassGrade.getClassId() + "\"  already exists.  Would you like to replace it?"
							+ "\n"
							+ "\n----- Replace Old with New? -----"
							+ "\nOld:     >>>  \"" + oldClassGrade.toString() + "\""
							+ "\nNew:   >>>  \"" + newClassGrade.toString() + "\"", 
					"Course ID", 
					JOptionPane.YES_NO_OPTION, 
					JOptionPane.INFORMATION_MESSAGE);
			if(choice == JOptionPane.YES_OPTION) {
				map.put(newClassGrade.getClassId(), newClassGrade);
			}
			if(choice == JOptionPane.NO_OPTION) {
				return;
			}
			if(choice == JOptionPane.CLOSED_OPTION) {
				return;
			}
		} 
		else {
			// Else, attempt to add the "newClassGrade" object to TreeMap.
			//
			// TreeMap:	<String, 	Object>
			// Type:	<String, 	Object>
			// Name:	<ClassID, 	ClassGrade>
			map.put(newClassGrade.getClassId(), newClassGrade);
		}
		
		// Refresh grades entered.
		refreshAllGrades();
		
		//////////////////////////////////////////////////////////////////////////////////
	}
	
	/**
	 * Clear all ClassGrade objects from the TreeMap.
	 * Refresh grades.
	 */
	private void clear() {
		// Clear all Keys and Values from the TreeMap.
		map.clear();
		
		// Refresh grades entered.
		refreshAllGrades();
	}
	
	/**
	 * Remove the selected value from the TreeMap and jList, "listGradesEntered".
	 */
	private void removeSelected() {
		
		try {
			//////////////////////////////////////////////////////////////////////////////////////////
			// Get the selected value String from the list. 										//
			// 																						//
			// Example: 																			//
			// ("Class: Java II   ||   Credits: 4   ||   Grade: 4.00   ||   Grade Points: 16.00")	//
			//////////////////////////////////////////////////////////////////////////////////////////
			String selectedValue = "";
			String cutoff = "Credits:";
			
			selectedValue = (String)listGradesEntered.getSelectedValue();
			
			////////////////////////////////////////////////////////////////////////////////
			// Erase "Class: "
			// ("Java II   ||   Credits: 4   ||   Grade: 4.00   ||   Grade Points: 16.00")
			selectedValue = selectedValue.substring(7);
			
			//////////////////////////////////////////////////////////////////
			// Split selectedValue into an array
			// ("Java", "II", " ", " ", " ", "||", " ", " ", " ", "Credits")
			String[] selectedValueArr = selectedValue.split(" ");
			
			/////////////////////////////////////////////////////////////////
			// Setup "indexToRemove", by searching the array for "Credits:"
			// ("Java", "II", " ", " ", " ", "||", " ", " ", " ")
			int indexToRemove = 0;
			while(!selectedValueArr[indexToRemove].equals(cutoff)) {
				indexToRemove++;
			}
			
			/////////////////////////////////////////////////////////////////
			// Subtract 6 from i.  (removes "  ||  " from the string array.
			// ("Java", "II")
			indexToRemove = indexToRemove - 6;
			
			//////////////////////////////////////////////////////////////
			// Rebuild the selectedValue by iterating through the array.
			// ("Java", "II")	<-- Untouched Array
			// ("Java II")		<-- While-loop to combine Array.
			selectedValue = "";
			int j = 0;
			while(j <= indexToRemove) {
				
				// Does the same as the on below, but has no white-space.
				if(j == indexToRemove) {
					selectedValue += selectedValueArr[j];
					break;
				}
				// Add each split array String to the selected Value.
				selectedValue += selectedValueArr[j] + " ";
				j++;
			}
			
			// ("Java II")		<-- Current Array
			
			//////////////////////////////////////////
			// We got our key! 	("Java II")			//
			// Now, search for this key in TreeMap.	//
			//////////////////////////////////////////
			for (Entry<String, Object> entry : map.entrySet()) {
				// Get current ClassGrade from the searched TreeMap.
				ClassGrade tempClassGrade = (ClassGrade)(entry.getValue());
				
				// If the TreeMap key is found, remove selected key/classID from TreeMap and break from search.
				if(selectedValue.equals(tempClassGrade.getClassId())) {
					map.remove(tempClassGrade.getClassId());
					break;
				}
			}
			
		} catch (NullPointerException e) {
			return;
		} catch (Exception e) {
			return;
		}
		
		// Refresh all the grades.
		refreshAllGrades();
	}
	
	/**
	 * Refresh all grade related objects and methods.
	 */
	private void refreshAllGrades() {
		// Refresh cumulative GPA in "txtCumulativeGpa".
		refreshCumulativeGPA();
		
		// Refresh Grades Entered in "listGradesEntered".
		refreshGradesEntered();
	}
	
	/**
	 * Refresh the Cumulative GPA.
	 */
	private void refreshCumulativeGPA() {
		////////////////////////////////////
		// Create Cumulative GPA variable.
		double cumulativeGpa = 0;
		double sumOfGpa = 0;
		
		// Create the DecimalFormat object for grades, which is rounded to 2 decimal places.
		DecimalFormat df = new DecimalFormat("##0.00");
		
		// Search each TreeMap key/value.
		int i = 0;
		for (Entry<String, Object> entry : map.entrySet()) {
			// Get current ClassGrade from the TreeMap.
			ClassGrade tempClassGrade = (ClassGrade)(entry.getValue());
			
			//////////////////////////////
			// Get sum of current grade.
			sumOfGpa += tempClassGrade.getGrade();
			i++;
		}
		
		////////////////////////////
		// Calculate Cumlative GPA
		cumulativeGpa = sumOfGpa/i;

		// Treat NaN value as 0.
		if(Double.isNaN(cumulativeGpa)) {
			cumulativeGpa = 0;
		}
		
		////////////////////////////////////////////////////////////////////////////////////////////////
		// Create String data for jTextField box and convert the "cumulativeGpa" double into a String.
		String strGpa = df.format(cumulativeGpa);
		
		////////////////////////////////
		// Display the Cumulative GPA.
		txtCumulativeGpa.setText(strGpa);
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
		
		// Create a new string array to store grades from TreeMap.
		stringArrayClassGrade = new String[map.size()];
		
		// Convert TreeMap to StringArray.
		int i = 0;
		for (Entry<String, Object> entry : map.entrySet()) {
			// Get current ClassGrade from the TreeMap.
			ClassGrade tempClassGrade = (ClassGrade)(entry.getValue());
			
			// Store data from tempGrade into the String Array.
			stringArrayClassGrade[i] = "Class: " + tempClassGrade.getClassId() + 
			"   ||   Credits: " + tempClassGrade.getCredits() + 
			"   ||   Grade: " + df.format(tempClassGrade.getGrade()) + 
			"   ||   Grade Points: " + df.format(tempClassGrade.getGradePoints());
			i++;
		}
		
		//### Set the jList data to the StringArray data. ###//
		listGradesEntered.setListData(stringArrayClassGrade);

	}
	
	/**
	 * Attempt to open the Main Menu frame.
	 */
	private void goToMainMenu() {
		try {
			MainMenu.gpaCalculatorWindow.getFrmGpaCalculator().setVisible(false);
			
			int x = MainMenu.gpaCalculatorWindow.getFrmGpaCalculator().getX();
			int y = MainMenu.gpaCalculatorWindow.getFrmGpaCalculator().getY();
			MainMenu.mainMenuWindow.getFrmMainMenu().setLocation(x, y);
			
			MainMenu.mainMenuWindow.getFrmMainMenu().setVisible(true);
		} catch (NullPointerException e) {
			JOptionPane.showMessageDialog(this.getFrmGpaCalculator(), "The \"Main Menu\" GUI was never created!", "ERROR", JOptionPane.WARNING_MESSAGE);
			//e.printStackTrace();
		}
	}
	
	/**
	 * Is called by exit().
	 * Prompts user to confirm exit/quit.
	 */
	private void confirmExit() {
		int choice = JOptionPane.showConfirmDialog(getFrmGpaCalculator(), "Are you sure you want to quit?", "Quit Program?", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
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
	 * @return frmGpaCalculator - The frame of this class.
	 */
	public JFrame getFrmGpaCalculator() {
		return frmGpaCalculator;
	}
	
	/**
	 * Set the jFrame of this class.
	 * @param frmGpaCalculator - The JFrame to attach to this class.
	 */
	private void setFrmGpaCalculator(JFrame frmGpaCalculator) {
		this.frmGpaCalculator = frmGpaCalculator;
		frmGpaCalculator.setIconImage(Toolkit.getDefaultToolkit().getImage(GPACalculator.class.getResource("/com/sun/javafx/scene/web/skin/FontColor_16x16_JFX.png")));
		
		frmGpaCalculator.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				exit();
			}
		});
	}
}
