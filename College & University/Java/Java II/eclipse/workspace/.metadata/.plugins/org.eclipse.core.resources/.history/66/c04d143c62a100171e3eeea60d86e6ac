//import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.lang.reflect.InvocationTargetException;
import java.util.Random;
import javax.swing.JSpinner;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.DefaultListCellRenderer;

import javax.swing.JScrollPane;
import javax.swing.JProgressBar;
import javax.swing.SpinnerNumberModel;
import javax.swing.SwingUtilities;
import javax.swing.SwingWorker;
import javax.swing.event.ChangeListener;
import javax.swing.event.ChangeEvent;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import javax.swing.border.BevelBorder;
import java.awt.Toolkit;

/**
 * This is the GUI for "RecursionUI.java".
 * Uses "Recursion.java" for binary-search and merge-sort.
 * 
 * File Name: 	RecursionUI.java
 * Date: 		3/10/2017
 * 
 * @author Jimmy Vang
 *
 */
public class RecursionUI {
	//#####################################################
	//##################### Variables #####################
	private SwingWorker<Integer, Integer> integerGenerationThread;
	
	private JFrame frmRecursionLab;
	
	private Integer[] intArr;
	
	private JTextField textNumberOfInts;
	private JSpinner spinnerIntRangeMin;
	private JSpinner spinnerIntRangeMax;
	private JSpinner spinnerSearch;
	private JList<Integer> listNumberOutput;
	
	private JProgressBar progressBar;
	
	private JLabel lblProgressBar;
	
	private JButton btnGenerateNumbers;
	private JButton btnSearch;
	private JButton btnCancel;
	
	private JTextField textSortTime;
	private JTextField textSearchTime;
	
	//#####################################################
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				try {
					Thread.currentThread().setPriority(Thread.MAX_PRIORITY);
					RecursionUI window = new RecursionUI();
					window.frmRecursionLab.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public RecursionUI() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		//------------------------------------------------------------------------------------------------
		frmRecursionLab = new JFrame();
		frmRecursionLab.setResizable(false);
		frmRecursionLab.setIconImage(Toolkit.getDefaultToolkit().getImage(RecursionUI.class.getResource("/com/sun/java/swing/plaf/windows/icons/Computer.gif")));
		frmRecursionLab.setTitle("Recursion Lab");
		frmRecursionLab.setBounds(100, 100, 345, 408);
		frmRecursionLab.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmRecursionLab.getContentPane().setLayout(null);
		
		//------------------------------------------------------------------------------------------------
		JLabel lblNumberOfInts = new JLabel("# of Ints:");
		lblNumberOfInts.setBounds(10, 11, 60, 14);
		frmRecursionLab.getContentPane().add(lblNumberOfInts);
		
		//------------------------------------------------------------------------------------------------
		textNumberOfInts = new JTextField();
		textNumberOfInts.addFocusListener(new FocusAdapter() {
			@Override
			/**
			 * Call restrictText when focus is lost on the jTextField, "textNumberOfInts".
			 */
			public void focusLost(FocusEvent arg0) {
				restrictNumberOfInts();
			}
			
		});
		textNumberOfInts.setText("5");
		textNumberOfInts.setBounds(80, 8, 110, 20);
		frmRecursionLab.getContentPane().add(textNumberOfInts);
		
		JLabel lblIntRange = new JLabel("Int Range:");
		lblIntRange.setBounds(10, 38, 60, 14);
		frmRecursionLab.getContentPane().add(lblIntRange);
		
		JLabel lblTo = new JLabel("to");
		lblTo.setBounds(200, 38, 19, 14);
		frmRecursionLab.getContentPane().add(lblTo);
		
		//------------------------------------------------------------------------------------------------
		spinnerIntRangeMin = new JSpinner();
		spinnerIntRangeMin.addChangeListener(new ChangeListener() {
			/**
			 * Rules for the Maximum Int Range jSpinner.
			 */
			public void stateChanged(ChangeEvent arg0) {
				//### Create Range Variables ###
				int spinnerIntRangeMaxValue = (Integer)spinnerIntRangeMax.getModel().getValue();
				int spinnerIntRangeMinValue = (Integer)spinnerIntRangeMin.getModel().getValue();
				
				//### If min > max, set max = min ###
				if(spinnerIntRangeMinValue > spinnerIntRangeMaxValue) {
					spinnerIntRangeMax.getModel().setValue(spinnerIntRangeMinValue);
				}
			}
		});
		spinnerIntRangeMin.setModel(new SpinnerNumberModel(new Integer(0), null, null, new Integer(1)));
		spinnerIntRangeMin.setBounds(80, 32, 110, 20);
		frmRecursionLab.getContentPane().add(spinnerIntRangeMin);
		
		//------------------------------------------------------------------------------------------------
		spinnerIntRangeMax = new JSpinner();
		spinnerIntRangeMax.addChangeListener(new ChangeListener() {
			/**
			 * Rules for the Minimum Int Range jSpinner.
			 */
			public void stateChanged(ChangeEvent e) {
				//### Create Int Range Variables ###
				int spinnerIntRangeMaxValue = (Integer)spinnerIntRangeMax.getModel().getValue();
				int spinnerIntRangeMinValue = (Integer)spinnerIntRangeMin.getModel().getValue();
				
				//### If max < min, set min = max ###
				if(spinnerIntRangeMaxValue < spinnerIntRangeMinValue) {
					spinnerIntRangeMin.getModel().setValue(spinnerIntRangeMaxValue);
				}
			}
		});
		spinnerIntRangeMax.setModel(new SpinnerNumberModel(new Integer(10), null, null, new Integer(1)));
		spinnerIntRangeMax.setBounds(220, 32, 110, 20);
		frmRecursionLab.getContentPane().add(spinnerIntRangeMax);
		
		//------------------------------------------------------------------------------------------------
		JLabel lblSearchForInt = new JLabel("Search For Int:");
		lblSearchForInt.setBounds(10, 111, 87, 14);
		frmRecursionLab.getContentPane().add(lblSearchForInt);
		
		spinnerSearch = new JSpinner();
		spinnerSearch.setBounds(100, 108, 110, 20);
		frmRecursionLab.getContentPane().add(spinnerSearch);
		
		JLabel lblNumberOutput = new JLabel("# Output:");
		lblNumberOutput.setBounds(10, 156, 142, 14);
		frmRecursionLab.getContentPane().add(lblNumberOutput);
		
		JScrollPane scrollPaneOutput = new JScrollPane();
		scrollPaneOutput.setBounds(10, 181, 142, 130);
		frmRecursionLab.getContentPane().add(scrollPaneOutput);
		
		listNumberOutput = new JList<Integer>();
		scrollPaneOutput.setViewportView(listNumberOutput);
		
		//------------------------------------------------------------------------------------------------
		//### Generate Numbers Button. ###
		btnGenerateNumbers = new JButton("Generate Numbers");
		btnGenerateNumbers.setBounds(10, 63, 142, 23);
		btnGenerateNumbers.addMouseListener(new MouseAdapter() {
			@Override
			/**
			 * Call generateNumbers() method below.
			 * Generate a number of integers when the button "Generate Numbers" is clicked.
			 */
			public void mouseClicked(MouseEvent arg0) {
				try {
					generateNumbers();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		frmRecursionLab.getContentPane().add(btnGenerateNumbers);
		
		//------------------------------------------------------------------------------------------------
		btnSearch = new JButton("Search");
		btnSearch.addMouseListener(new MouseAdapter() {
			@Override
			/**
			 * Call binarySearch() method below.
			 */
			public void mouseClicked(MouseEvent arg0) {
				search();
			}
		});
		btnSearch.setBounds(220, 107, 110, 23);
		frmRecursionLab.getContentPane().add(btnSearch);
		
		//------------------------------------------------------------------------------------------------
		btnCancel = new JButton("Cancel");
		btnCancel.setEnabled(false);
		btnCancel.addMouseListener(new MouseAdapter() {
			@Override
			/**
			 * Cancels the Integer Generation.
			 */
			public void mouseClicked(MouseEvent e) {
				// Prevent Cancel button from being clicked if it is disabled.
				if(!btnCancel.isEnabled()){
					return;
				}
				
				// Cancel the integer generation Thread.
				integerGenerationThread.cancel(true);
			}
		});
		btnCancel.setBounds(257, 345, 73, 23);
		frmRecursionLab.getContentPane().add(btnCancel);
		
		//------------------------------------------------------------------------------------------------
		lblProgressBar = new JLabel("---");
		lblProgressBar.setBounds(10, 335, 237, 14);
		frmRecursionLab.getContentPane().add(lblProgressBar);
		
		//------------------------------------------------------------------------------------------------
		progressBar = new JProgressBar();
		lblProgressBar.setLabelFor(progressBar);
		progressBar.setBounds(10, 354, 237, 14);
		frmRecursionLab.getContentPane().add(progressBar);
		
		//------------------------------------------------------------------------------------------------
		JLabel lblStats = new JLabel("Stats:");
		lblStats.setBounds(188, 156, 142, 14);
		frmRecursionLab.getContentPane().add(lblStats);
		
		//------------------------------------------------------------------------------------------------
		JPanel panelStats = new JPanel();
		panelStats.setBorder(new BevelBorder(BevelBorder.LOWERED, null, null, null, null));
		panelStats.setBounds(188, 181, 142, 130);
		frmRecursionLab.getContentPane().add(panelStats);
		panelStats.setLayout(null);
		
		//------------------------------------------------------------------------------------------------
		JLabel lblSortTime = new JLabel("Sort Time (ms):");
		lblSortTime.setBounds(10, 11, 122, 14);
		panelStats.add(lblSortTime);
		
		//------------------------------------------------------------------------------------------------
		textSortTime = new JTextField();
		textSortTime.setEditable(false);
		textSortTime.setBounds(10, 27, 122, 20);
		panelStats.add(textSortTime);
		textSortTime.setColumns(10);
		
		//------------------------------------------------------------------------------------------------
		JLabel lblSearchTime = new JLabel("Search Time (ms):");
		lblSearchTime.setBounds(10, 58, 122, 14);
		panelStats.add(lblSearchTime);
		
		//------------------------------------------------------------------------------------------------
		textSearchTime = new JTextField();
		textSearchTime.setEditable(false);
		textSearchTime.setColumns(10);
		textSearchTime.setBounds(10, 74, 122, 20);
		panelStats.add(textSearchTime);
		
	}
	
	/**
	 * Generate a list of numbers (integers).
	 */
	private void generateNumbers() throws Exception {
		
		//Prevents the Generate Numbers button from being clicked if it is disabled.
		if (!btnGenerateNumbers.isEnabled()) {
			return;
		}
		
		// Stop the current SwingWorker Thread if it is running.
		if (integerGenerationThread != null) {
			integerGenerationThread.cancel(true);
			Thread.currentThread().interrupt();
		}
		
		/** 
		 * Create a SwingWorker Thread to run our integer generation. 
		 * This prevents the main GUI from freezing in the for-loops during int generation.
		 */
		integerGenerationThread = new SwingWorker<Integer, Integer>() {
			
			Thread currentThread = Thread.currentThread();
			
			@Override
			/** The background work that will be done to generate numbers (integers). */
			protected Integer doInBackground() throws InvocationTargetException, InterruptedException {
				//---------------------------------------------------------------------------------------
				// Setup Thread.
				//currentThread.setPriority(Thread.MIN_PRIORITY);
				//Thread.yield();
				
				// Disable buttons.
				btnGenerateNumbers.setEnabled(false);
				btnSearch.setEnabled(false);
				
				// Enable buttons.
				btnCancel.setEnabled(true);
				
				//---------------------------------------------------------------------------------------
				//##################################
				//### Check Pre-Conditions Here. ###
				//##################################
				
				// "numOfInts" integer value for, "textNumberOfInts", from user input.
				int numOfInts = 0;
				
				// Check the jTextField, "textNumberOfInts", for an instance of a String.
				if (!(textNumberOfInts.getText() instanceof String)) {
					JOptionPane.showMessageDialog(frmRecursionLab, "\"" + textNumberOfInts.getText() + "\" is not an instance of String.");
					return -1;
				}
				
				// Try to parse the jTextField for an integer value.
				try {
					numOfInts = Integer.parseInt(textNumberOfInts.getText());
				} 
				catch (NumberFormatException e) {
					JOptionPane.showMessageDialog(frmRecursionLab, "Enter an integer value.");
					return -1;
				}
				
				// Check "numOfInts" for a positive integer value.
				if (numOfInts < 0) {
					JOptionPane.showMessageDialog(frmRecursionLab, "Enter a positive integer value.");
					return -1;
				} else if (numOfInts == 0) {
					JOptionPane.showMessageDialog(frmRecursionLab, "A zero was entered. Enter a positive integer value.");
					return -1;
				}
				
				//---------------------------------------------------------------------------------------
				
				// Enable Percentage on the progress bar.
				progressBar.setStringPainted(true);
				
				// Prepare GUI for Integers.
				intArr = new Integer[numOfInts];
				Integer maxRange = (Integer)spinnerIntRangeMax.getModel().getValue();
				Integer minRange = (Integer)spinnerIntRangeMin.getModel().getValue();
				Random r = new Random();
				
				//---------------------------------------------------------------------------------------
				//###########################################
				//######### Generate Integers HERE. #########
				//###########################################
				for (int i = 0; i < intArr.length && !(integerGenerationThread.isCancelled() == true || currentThread.isInterrupted() == true); i++) {
					Thread.yield();
					
					// Random Generation of Integers.
					intArr[i] = r.nextInt((maxRange - minRange) + 1) + minRange;
					
					// Update progress bar.
					updateProgressBar(0, i + 1, intArr.length);
				}
				
				//&&&&&& End Int Generation if the Thread was canceled. &&&&&&
				if(integerGenerationThread.isCancelled() == true || currentThread.isInterrupted() == true) {
					return -1;
				}
				
				//---------------------------------------------------------------------------------------
				//###############################################
				//######### Setup for Sorting Integers. #########
				//###############################################
				
				// Convert/copy the main Integer[] array into a int[] array.
				lblProgressBar.setText("(Convert Integer[] to int[]...)");
				int[] arr = new int[intArr.length];
				for(int i = 0; i < intArr.length && !(integerGenerationThread.isCancelled() == true || currentThread.isInterrupted() == true); i++) {
					Thread.yield();
					arr[i] = intArr[i];
				}
				
				//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
				//<<<<<< End Int Generation if the Thread was canceled. <<<<<<
				if(integerGenerationThread.isCancelled() == true || currentThread.isInterrupted() == true) {
					return -1;
				}
				
				//################################
				//###### Attempt Merge-Sort ######
				//################################
				// Disable Percentage and 
				// Enable Indeterminate mode on the progress bar. ###
				progressBar.setStringPainted(false);
				progressBar.setIndeterminate(true);
				
				long startTime = 0;
				long stopTime = 0;
				long elapsedTime = 0;
				
				lblProgressBar.setText("(Attempting Merge-Sort...)");
				
				// Start sort timer.
				startTime = System.nanoTime();
				
				// Perform Merge Sort
				Thread.yield();
				arr = Recursion.mergeSort(arr);
				
				// Stop sort timer.
				stopTime = System.nanoTime();
			    elapsedTime = (stopTime - startTime)/(long)1000000;
				
			    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
				//<<<<<< End Int Generation if the Thread was canceled. <<<<<<
				if(integerGenerationThread.isCancelled() == true || currentThread.isInterrupted() == true) {
					return -1;
				}
			    
				// Output elapsed time.
				textSortTime.setText(String.valueOf(elapsedTime));
				
				// Disable progress bar Indeterminate mode.
				progressBar.setIndeterminate(false);	// Disable progress bar Intermediate mode.
				
				// Convert/copy the temporary int[] array back into the main Integer[] array.
				lblProgressBar.setText("(Convert int[] to Integer[]...)");
				for(int i = 0; i < intArr.length && !(integerGenerationThread.isCancelled() == true || currentThread.isInterrupted() == true); i++) {
					Thread.yield();
					intArr[i] = arr[i];
				}
				
				//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
				//<<<<<< End Int Generation if the Thread was canceled. <<<<<<
				if(integerGenerationThread.isCancelled() == true || currentThread.isInterrupted() == true) {
					return -1;
				}
				
				//---------------------------------------------------------------------------------------
				// Disable Percentage on the progress bar.
				progressBar.setStringPainted(false);
				
				// Refresh the list of numbers.
				lblProgressBar.setText("(Refreshing List/Output.....)");
				progressBar.setIndeterminate(true);
				refreshNumbers();
				
				// Notify user that the integer generating process is done.
				lblProgressBar.setText("(*** Finshed Generating Ints. ***)");
				progressBar.setIndeterminate(false);
				JOptionPane.showMessageDialog(frmRecursionLab, "Integers successfully generated.");
				
				//### End of background Thread for SwingWorker. ###
				return 1;
				//---------------------------------------------------------------------------------------
			}
			
			@Override
			/** 
			 * Call this method after the background work is done.
			 * 
			 * This method will re-enable all buttons after the SwingWorker Thread is done.
			 */
			protected void done() {
				progressBar.setStringPainted(false);	// Disable progress bar percentage.
				progressBar.setIndeterminate(false);	// Disable progress bar Intermediate mode.
				progressBar.setValue(0);				// Reset bar value.
				
				// Enable Buttons
				btnGenerateNumbers.setEnabled(true);
				btnSearch.setEnabled(true);
				
				// Disable Buttons
				btnCancel.setEnabled(false);
				
				if(integerGenerationThread.isCancelled() == true) {
					lblProgressBar.setText("(*** Int Generation Canceled. ***)");
				}
				if(currentThread.isInterrupted() == true) {
					lblProgressBar.setText("(*** Int Generation Was Interrupted. ***)");
				}
			}
			
		};
		
		//### Execute the SwingWorker Thread. ###
		integerGenerationThread.execute();

	}
	
	/**
	 * Refreshes the output of the jList, "listNumberOutput".
	 * @throws InvocationTargetException
	 * @throws InterruptedException
	 */
	private void refreshNumbers() throws InvocationTargetException, InterruptedException {
		SwingUtilities.invokeAndWait(new Runnable() {
		    public void run() {
		    	Thread.yield();
				listNumberOutput.setListData(intArr);
				DefaultListCellRenderer renderer = (DefaultListCellRenderer)listNumberOutput.getCellRenderer();
				renderer.setHorizontalAlignment(JLabel.CENTER);
		    }
		});
		
		Thread.sleep(1);
	}
	
	/**
	 *  Restrict int range of the jTextField, "textNumberOfInts".
	 */
	public void restrictNumberOfInts() {
		double value = 0;
		final double MAX_RANGE = 150000000;
		final double MIN_RANGE = 0;
		
		//### Parse Value from text box. ###
		try {
			value = Double.parseDouble(textNumberOfInts.getText());
		} 
		// Reset Text Box.
		catch (NumberFormatException e) {
			textNumberOfInts.setText(String.valueOf(""));
			return;
		} 
		// Reset Text Box.
		catch (NullPointerException e) {
			textNumberOfInts.setText(String.valueOf(""));
			return;
		}
		
		//### Restrict the text box's max. ###
		if(value > MAX_RANGE) {
			textNumberOfInts.setText(String.valueOf((int)MAX_RANGE));
		}
		//### Restrict the text box's min. ###
		if(value < MIN_RANGE) {
			textNumberOfInts.setText(String.valueOf((int)MIN_RANGE));
		}
	}
	
	/**
	 * Updates the progress bar for the GUI.
	 * @param initial - Initial start.
	 * @param min - Set the progress bar's minimum value.
	 * @param max - Set the progress bar's maximum value.
	 * @return value - The percentage value that will be returned.
	 * @throws InvocationTargetException
	 * @throws InterruptedException
	 */
	private int updateProgressBar(double initial, double min, double max) throws InvocationTargetException, InterruptedException {
		Thread.yield();
		
		// Set the current percentage value.
		int value = (int)initial + ((int)(100*(min/max)));
		
		// Set the text of the jLabel for the progress bar.
		lblProgressBar.setText("(Generating Ints: " + (int)min + "/" + (int)max + ")");
		
		// Set the jProgressBar's value.
		progressBar.setValue(value);
		
		// Return a percentage value.
		return value;
	}
	
	
	public void sort() {
		
	}
	
	/**
	 * Search for the target number specified in "spinnerSearch" using binary search.
	 */
	public void search() {
		
		// Prevent Search button from being clicked when it is visually disabled.
		if(!btnSearch.isEnabled()) {
			return;
		}
		
		// Prompt User that there is nothing in the jList.
		if(intArr == null) {
			JOptionPane.showMessageDialog(frmRecursionLab, "There are no generated integers in the output list.");
			return;
		}
		
		// Convert the main Integer[] array into a new int[] array.
		int[] arr = new int[intArr.length];
		for(int i = 0; i < intArr.length; i++) {
			arr[i] = intArr[i];
		}
		
		//#############################
		//### Attempt Binary Search ###
		//#############################
		int target = (int)spinnerSearch.getModel().getValue();
		
		// Start search timer.
		long startTime = System.nanoTime();
		
		//##############################
		//### Do Binary Search Here. ###
		int index = Recursion.binarySearch(arr, 0, arr.length-1, target);
		
		// Stop search timer.
		long stopTime = System.nanoTime();
	    double elapsedTime = (stopTime - startTime)/(double)1000000;
	    
	    // Output search time to GUI.
		textSearchTime.setText(String.valueOf(elapsedTime));
		
		// Select the found target in the jList, "listNumberOutput" at the target's index.
		listNumberOutput.setSelectedIndex(index);
		
		// This ensures that the selected index is visible.
		listNumberOutput.ensureIndexIsVisible(listNumberOutput.getSelectedIndex());	
			
		// Prompt user accordingly.
		if(index == -1) {
			JOptionPane.showMessageDialog(frmRecursionLab, "Finshed Searching. Target not found.");
		}
		else {
			JOptionPane.showMessageDialog(frmRecursionLab, "Finshed Searching. Target found.");
		}
	}
}
