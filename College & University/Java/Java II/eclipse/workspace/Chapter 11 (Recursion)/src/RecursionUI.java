import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.lang.reflect.InvocationTargetException;
import java.security.SecurityPermission;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.JSpinner;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.BoxLayout;
import javax.swing.DefaultListCellRenderer;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JScrollPane;
import javax.swing.JTree;
import javax.swing.JProgressBar;
import javax.swing.JToggleButton;
import javax.swing.SpinnerNumberModel;
import javax.swing.SwingUtilities;
import javax.swing.SwingWorker;
import javax.swing.AbstractListModel;
import javax.swing.ListSelectionModel;
import javax.swing.JToolBar;
import javax.swing.event.ChangeListener;
import javax.swing.event.ChangeEvent;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeEvent;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.event.CaretListener;
import javax.swing.event.CaretEvent;
import java.awt.event.MouseMotionAdapter;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import javax.swing.border.EtchedBorder;
import javax.swing.border.BevelBorder;
import java.awt.Toolkit;

public class RecursionUI {
	//#####################################################
	//##################### Variables #####################
	SwingWorker<Integer, Integer> sw;
	
	private JFrame frmRecursionLab;
	
	private Integer[] intArr;
	
	private JTextField textNumberOfInts;
	private JSpinner spinnerIntRangeMin;
	private JSpinner spinnerIntRangeMax;
	
	JList<Integer> listNumberOutput;
	
	JProgressBar progressBar;
	
	JLabel lblProgressBar;
	
	JButton btnGenerateNumbers;
	JButton btnSearch;
	
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
		frmRecursionLab = new JFrame();
		frmRecursionLab.setIconImage(Toolkit.getDefaultToolkit().getImage(RecursionUI.class.getResource("/com/sun/java/swing/plaf/windows/icons/Computer.gif")));
		frmRecursionLab.setTitle("Recursion Lab");
		frmRecursionLab.setBounds(100, 100, 360, 400);
		frmRecursionLab.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmRecursionLab.getContentPane().setLayout(null);
		
		JLabel lblNumberOfInts = new JLabel("# of Ints:");
		lblNumberOfInts.setBounds(10, 11, 60, 14);
		frmRecursionLab.getContentPane().add(lblNumberOfInts);
		
		textNumberOfInts = new JTextField();
		textNumberOfInts.addFocusListener(new FocusAdapter() {
			@Override
			/**
			 * Call restrictText when focus is lost on the jTextField, "textNumberOfInts".
			 */
			public void focusLost(FocusEvent arg0) {
				restrictText();
			}
			
			/**
			 *  Restrict int range of the jTextField.
			 */
			public void restrictText() {
				double value = 0;
				final double MAX_RANGE = 100000000;
				final double MIN_RANGE = 0;
				
				//### Parse Value from text box. ###
				try {
					value = Double.parseDouble(textNumberOfInts.getText());
				} 
				//### Reset Text Box. ###
				catch (NumberFormatException e) {
					textNumberOfInts.setText(String.valueOf(""));
					return;
				} 
				//### Reset Text Box. ###
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
		
		JLabel lblSearchForInt = new JLabel("Search For Int:");
		lblSearchForInt.setBounds(10, 111, 87, 14);
		frmRecursionLab.getContentPane().add(lblSearchForInt);
		
		JSpinner spinnerSearch = new JSpinner();
		spinnerSearch.setBounds(100, 108, 110, 20);
		frmRecursionLab.getContentPane().add(spinnerSearch);
		
		JLabel lblNumberOutput = new JLabel("# Output");
		lblNumberOutput.setBounds(10, 195, 142, 14);
		frmRecursionLab.getContentPane().add(lblNumberOutput);
		
		JScrollPane scrollPaneOutput = new JScrollPane();
		scrollPaneOutput.setBounds(10, 220, 142, 130);
		frmRecursionLab.getContentPane().add(scrollPaneOutput);
		
		listNumberOutput = new JList<Integer>();
		scrollPaneOutput.setViewportView(listNumberOutput);
		
		//### Generate Numbers Button. ###
		btnGenerateNumbers = new JButton("Generate Numbers");
		btnGenerateNumbers.setBounds(10, 63, 142, 23);
		btnGenerateNumbers.addMouseListener(new MouseAdapter() {
			@Override
			/**
			 * Generate a number of integers when the button "Generate Numbers" is clicked.
			 */
			public void mouseClicked(MouseEvent arg0) {
				generateNumbers();
			}
		});
		frmRecursionLab.getContentPane().add(btnGenerateNumbers);
		
		btnSearch = new JButton("Search");
		btnSearch.setBounds(220, 107, 110, 23);
		frmRecursionLab.getContentPane().add(btnSearch);
		
		lblProgressBar = new JLabel("");
		lblProgressBar.setBounds(10, 151, 320, 14);
		frmRecursionLab.getContentPane().add(lblProgressBar);
		
		progressBar = new JProgressBar();
		lblProgressBar.setLabelFor(progressBar);
		progressBar.setBounds(10, 170, 320, 14);
		frmRecursionLab.getContentPane().add(progressBar);
		
		JLabel lblStats = new JLabel("Stats:");
		lblStats.setBounds(188, 195, 46, 14);
		frmRecursionLab.getContentPane().add(lblStats);
		
		JPanel panelStats = new JPanel();
		panelStats.setBorder(new BevelBorder(BevelBorder.LOWERED, null, null, null, null));
		panelStats.setBounds(188, 220, 146, 130);
		frmRecursionLab.getContentPane().add(panelStats);
		panelStats.setLayout(null);
		
		JLabel lblSortTime = new JLabel("Sort Time:");
		lblSortTime.setBounds(10, 11, 86, 14);
		panelStats.add(lblSortTime);
		
		textSortTime = new JTextField();
		textSortTime.setEditable(false);
		textSortTime.setBounds(10, 27, 86, 20);
		panelStats.add(textSortTime);
		textSortTime.setColumns(10);
		
		JLabel lblSearchTime = new JLabel("Search Time:");
		lblSearchTime.setBounds(10, 58, 86, 14);
		panelStats.add(lblSearchTime);
		
		textSearchTime = new JTextField();
		textSearchTime.setEditable(false);
		textSearchTime.setColumns(10);
		textSearchTime.setBounds(10, 74, 86, 20);
		panelStats.add(textSearchTime);
		
	}
	
	private void generateNumbers() {
		//### Prevents the disabled button from continuing after being pressed. ###
		if (!btnGenerateNumbers.isEnabled()) {
			return;
		}
		
		//### Stop the current SwingWorker Thread if it is running. ###
		if (sw != null) {
			Thread.currentThread().interrupt();
			sw.cancel(true);
		}
		
		/** 
		 * Create a SwingWorker Thread. 
		 * This prevents the main GUI from freezing. 
		 */
		sw = new SwingWorker<Integer, Integer>() {
			@Override
			/** The background work that will be done to generate numbers (integers). */
			protected Integer doInBackground() throws InvocationTargetException, InterruptedException {
				//### Setup Thread. ###
				Thread.currentThread().setPriority(Thread.MIN_PRIORITY);
				Thread.yield();
				
				//### Disable buttons. ###
				btnGenerateNumbers.setEnabled(false);
				btnSearch.setEnabled(false);
				
				//### Check Pre-Conditions. ###
				int numOfInts = 0;
				if (!(textNumberOfInts.getText() instanceof String)) {
					JOptionPane.showMessageDialog(null, "\"" + textNumberOfInts.getText() + "\" is not an instance of String.");
					return -1;
				}
				
				try {
					numOfInts = Integer.parseInt(textNumberOfInts.getText());
				} 
				catch (NumberFormatException e) {
					JOptionPane.showMessageDialog(null, "Enter an integer value.");
					return -1;
				}
				
				if (numOfInts < 0) {
					JOptionPane.showMessageDialog(null, "Enter a positive integer value.");
					return -1;
				} else if (numOfInts == 0) {
					JOptionPane.showMessageDialog(null, "A zero was entered. Enter a positive integer value.");
					return -1;
				}
				
				//### Enable Percentage on the progress bar. ###
				progressBar.setStringPainted(true);
				
				//### Prepare GUI for Integers.
				intArr = new Integer[numOfInts];
				int maxRange = (Integer)spinnerIntRangeMax.getModel().getValue();
				int minRange = (Integer)spinnerIntRangeMin.getModel().getValue();
				Random r = new Random();
				
				//###########################################
				//######### GENERATE Integers HERE. #########
				//###########################################
				for (int i = 0; i < intArr.length; i++) {
					//### Random Generation of Integers. ###
					intArr[i] = r.nextInt((maxRange - minRange) + 1) + minRange;
					
					//### Update progress bar. ###
					updateProgressBar(0, i + 1, intArr.length);
				}
				//### Disable Percentage on the progress bar. ###
				progressBar.setStringPainted(false);
				
				//### Refresh the list of numbers. ###
				lblProgressBar.setText("(Refreshing List/Output.....)");
				progressBar.setIndeterminate(true);
				refreshNumbers();
				
				//### Notify user that the generating process is done. ###
				lblProgressBar.setText("(*** Finshed Generating Ints. ***)");
				progressBar.setIndeterminate(false);
				JOptionPane.showMessageDialog(null, "Integers successfully generated.");
				
				//### End Thread ###
				return 1;
			}
			
			@Override
			/** 
			 * Call this method after the background work is done.
			 * 
			 * This method will re-enable all buttons after the SwingWorker Thread is done.
			 */
			protected void done() {
				btnGenerateNumbers.setEnabled(true);
				btnSearch.setEnabled(true);
			}
			
		};
		
		// Execute the SwingWorker Thread.
		sw.execute();

	}
	
	/**
	 * Refreshes the output of the jList, "listNumberOutput".
	 * @throws InvocationTargetException
	 * @throws InterruptedException
	 */
	private void refreshNumbers() throws InvocationTargetException, InterruptedException {
		SwingUtilities.invokeAndWait(new Runnable() {
		    public void run() {
				listNumberOutput.setListData(intArr);
				DefaultListCellRenderer renderer = (DefaultListCellRenderer)listNumberOutput.getCellRenderer();
				renderer.setHorizontalAlignment(JLabel.CENTER);
		    }
		});
		
		Thread.sleep(1);
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
		//### Set the current percentage value.
		int value = (int)initial + ((int)(100*(min/max)));
		
		//### Set the text of the jLabel for the progress bar.
		lblProgressBar.setText("(Generating Ints: " + String.valueOf((int)min) + "/" + String.valueOf((int)max + ")"));
		
		//### Set the jProgressBar's value.
		progressBar.setValue(value);
		
		//### Return a percentage value.
		return value;
	}
}
