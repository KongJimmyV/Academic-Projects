import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.io.IOException;
import javax.swing.JTextPane;
import javax.swing.JFileChooser;
import javax.swing.JTextField;
import javax.swing.JScrollPane;
import javax.swing.JButton;
import javax.swing.event.CaretListener;
import javax.swing.event.CaretEvent;
import java.awt.Font;
import javax.swing.JSeparator;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;


/**
 * The purpose of {@code MainGUI.java} is to be able to decode MIPS instructions and output statistics
 * about what was executed. This class file requires {@code MipsInstructionDecode.java) to decode.
 * 
 * @author Kong Jimmy Vang
 * @version 1.0
 */
public class MainGUI {

    private JFrame frmDecoder;
    private MipsInstructionDecode mipsDecoder;
    
    private File inputFile;
    private File outputFile;
    private JFileChooser[] jFileChooser;
    
    private JTextPane txtpnInputConsole;
    private JTextPane txtpnOutputConsole;
    private JTextPane txtpnStatus;
    private JTextField txtOutputFileName;
    private JTextField txtInputFileName;
    private JTextField txtInputFileDir;
    private JTextField txtOutputFileDir;
    
    private String helpTitle    = "Simple Helper";
    private String helpMsg      = 
            "1. Click \"Get Input File\" and select the text file with the pc and instructions you want to decode."
            + "\n\n2. Click \"Decode Input File\". Your input file will be decoded and send to the output file that was given.";
    
    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    MainGUI window = new MainGUI();
                    window.frmDecoder.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the application.
     * @throws IOException 
     */
    public MainGUI() throws IOException {
        initialize();
    }

    /**
     * Initialize the contents of the frame.
     * @throws IOException 
     */
    private void initialize() throws IOException {
        
        this.mipsDecoder = new MipsInstructionDecode();
        this.inputFile = new File("./src/trace.txt");
        this.outputFile = new File("./src/statistics.txt");
        
        this.jFileChooser = new JFileChooser[2];
        jFileChooser[0] = new JFileChooser();
        jFileChooser[0].setSelectedFile(this.inputFile);
        jFileChooser[0].setCurrentDirectory(this.inputFile);
        jFileChooser[1] = new JFileChooser();
        jFileChooser[1].setSelectedFile(this.outputFile);
        jFileChooser[1].setCurrentDirectory(this.outputFile);
        
        frmDecoder = new JFrame();
        frmDecoder.setResizable(false);
        frmDecoder.setTitle("MIPS Instruction Decoder Logic");
        frmDecoder.setBounds(100, 100, 800, 400);
        frmDecoder.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frmDecoder.getContentPane().setLayout(null);
        
        JLabel lblInputConsole = new JLabel("Last Input <PC, Instructions>");
        lblInputConsole.setBounds(374, 10, 175, 14);
        frmDecoder.getContentPane().add(lblInputConsole);
        
        JScrollPane scrollPaneInputConsole = new JScrollPane();
        scrollPaneInputConsole.setBounds(374, 35, 200, 294);
        frmDecoder.getContentPane().add(scrollPaneInputConsole);
        
        txtpnInputConsole = new JTextPane();
        txtpnInputConsole.setEditable(false);
        scrollPaneInputConsole.setViewportView(txtpnInputConsole);
        
        JLabel lblOutputConsole = new JLabel("Last Output");
        lblOutputConsole.setBounds(574, 10, 90, 14);
        frmDecoder.getContentPane().add(lblOutputConsole);
        
        JScrollPane scrollPaneOutputConsole = new JScrollPane();
        scrollPaneOutputConsole.setBounds(574, 35, 200, 294);
        frmDecoder.getContentPane().add(scrollPaneOutputConsole);
        
        txtpnOutputConsole = new JTextPane();
        txtpnOutputConsole.setEditable(false);
        scrollPaneOutputConsole.setViewportView(txtpnOutputConsole);
        
        JLabel lblInputFileName = new JLabel("Input File Name:");
        lblInputFileName.setBounds(10, 38, 100, 14);
        frmDecoder.getContentPane().add(lblInputFileName);
        
        JLabel lblInputFileDir = new JLabel("Input File Dir:");
        lblInputFileDir.setBounds(10, 63, 100, 14);
        frmDecoder.getContentPane().add(lblInputFileDir);
        
        JLabel lblOutputFileName = new JLabel("Output File Name:");
        lblOutputFileName.setBounds(10, 123, 100, 14);
        frmDecoder.getContentPane().add(lblOutputFileName);
        
        JLabel lblOutputFileDir = new JLabel("Output File Dir:");
        lblOutputFileDir.setBounds(10, 148, 100, 14);
        frmDecoder.getContentPane().add(lblOutputFileDir);
        
        txtInputFileName = new JTextField();
        txtInputFileName.setEditable(false);
        txtInputFileName.addFocusListener(new FocusAdapter() {
            @Override
            public void focusLost(FocusEvent arg0) {
                updateInputFile();
            }
        });
        txtInputFileName.setText(inputFile.getName());
        txtInputFileName.setToolTipText(txtInputFileName.getText());
        txtInputFileName.setBounds(120, 35, 242, 20);
        frmDecoder.getContentPane().add(txtInputFileName);
        txtInputFileName.setColumns(10);
        txtInputFileName.addCaretListener(new CaretListener() {
            public void caretUpdate(CaretEvent e) {
                //updateInputFile();
            }
        });
        
        txtInputFileDir = new JTextField();
        txtInputFileDir.setEditable(false);
        txtInputFileDir.setText(inputFile.getParentFile().getCanonicalPath());
        txtInputFileDir.setToolTipText(txtInputFileDir.getText());
        txtInputFileDir.setColumns(10);
        txtInputFileDir.setBounds(120, 60, 242, 20);
        frmDecoder.getContentPane().add(txtInputFileDir);
        txtInputFileDir.addCaretListener(new CaretListener() {
            public void caretUpdate(CaretEvent e) {
                updateInputFile();
            }
        });
        
        txtOutputFileName = new JTextField();
        txtOutputFileName.setEditable(false);
        txtOutputFileName.addFocusListener(new FocusAdapter() {
            @Override
            public void focusLost(FocusEvent e) {
                updateOutputFile();
            }
        });
        txtOutputFileName.setText(outputFile.getName());
        txtOutputFileName.setToolTipText(txtOutputFileName.getText());
        txtOutputFileName.setBounds(120, 120, 242, 20);
        frmDecoder.getContentPane().add(txtOutputFileName);
        txtOutputFileName.setColumns(10);
        txtOutputFileName.addCaretListener(new CaretListener() {
            public void caretUpdate(CaretEvent e) {
                //updateOutputFile();
            }
        });
        
        txtOutputFileDir = new JTextField();
        txtOutputFileDir.setEditable(false);
        txtOutputFileDir.setText(outputFile.getParentFile().getCanonicalPath());
        txtOutputFileDir.setToolTipText(txtOutputFileDir.getText());
        txtOutputFileDir.setColumns(10);
        txtOutputFileDir.setBounds(120, 145, 242, 20);
        frmDecoder.getContentPane().add(txtOutputFileDir);
        txtOutputFileDir.addCaretListener(new CaretListener() {
            public void caretUpdate(CaretEvent e) {
                updateOutputFile();
            }
        });
        
        JLabel lblStatus = new JLabel("Status");
        lblStatus.setBounds(10, 241, 46, 14);
        frmDecoder.getContentPane().add(lblStatus);
        
        JButton btnReset = new JButton("Reset Default");
        btnReset.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnReset.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                reset();
            }
        });
        btnReset.setBounds(8, 191, 112, 23);
        frmDecoder.getContentPane().add(btnReset);
        
        JButton btnGetFile = new JButton("Get Input File");
        btnGetFile.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnGetFile.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                selectInputFile();
            }
        });
        btnGetFile.setBounds(130, 191, 112, 23);
        frmDecoder.getContentPane().add(btnGetFile);
        
        JScrollPane scrollPaneStatus = new JScrollPane();
        scrollPaneStatus.setBounds(10, 266, 352, 63);
        frmDecoder.getContentPane().add(scrollPaneStatus);
        
        txtpnStatus = new JTextPane();
        scrollPaneStatus.setViewportView(txtpnStatus);
        txtpnStatus.setEditable(false);
        
        JButton btnDecodeInputFile = new JButton("Decode Input File");
        btnDecodeInputFile.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
            }
        });
        btnDecodeInputFile.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnDecodeInputFile.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent arg0) {
                decode();
            }
        });
        btnDecodeInputFile.setBounds(130, 215, 234, 23);
        frmDecoder.getContentPane().add(btnDecodeInputFile);
        
        JButton btnSetOutputFile = new JButton("Set Output File");
        btnSetOutputFile.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
            }
        });
        btnSetOutputFile.setEnabled(false);
        btnSetOutputFile.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnSetOutputFile.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent arg0) {
                if (btnSetOutputFile.isEnabled()) {
                    selectOutputFile();
                }
            }
        });
        btnSetOutputFile.setBounds(252, 191, 112, 23);
        frmDecoder.getContentPane().add(btnSetOutputFile);
        btnSetOutputFile.setVisible(false);
        
        JMenuBar menuBar = new JMenuBar();
        frmDecoder.setJMenuBar(menuBar);
        
        JMenu mnFile = new JMenu("File");
        menuBar.add(mnFile);
        
        JMenuItem mntmQuit = new JMenuItem("Quit");
        mntmQuit.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent arg0) {
                System.exit(0);
            }
        });
        
        JMenuItem mntmGetInputFile = new JMenuItem("Get Input File");
        mntmGetInputFile.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                selectInputFile();
            }
        });
        mnFile.add(mntmGetInputFile);
        
        JMenuItem mntmSetOutputFile = new JMenuItem("Set Output File");
        mntmSetOutputFile.setEnabled(false);
        mnFile.add(mntmSetOutputFile);
        mntmSetOutputFile.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                if (mntmSetOutputFile.isEnabled()) {
                    selectOutputFile();
                }
            }
        });
        JMenuItem mntmDecodeFile = new JMenuItem("Decode File");
        mnFile.add(mntmDecodeFile);
        mntmDecodeFile.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent arg0) {
                decode();
            }
        });
        mntmSetOutputFile.setVisible(false);
        
        JSeparator separator = new JSeparator();
        mnFile.add(separator);
        mnFile.add(mntmQuit);
        
        JMenu mnAbout = new JMenu("About");
        menuBar.add(mnAbout);
        
        JMenuItem mntmHelp = new JMenuItem("Help");
        mnAbout.add(mntmHelp);
        mntmHelp.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                displayHelp();
            }
        });
    }
    
    /**
     * Displays a help pop-up for the user.
     */
    private void displayHelp() {
        JOptionPane.showMessageDialog(frmDecoder, this.helpMsg, this.helpTitle, JOptionPane.INFORMATION_MESSAGE);
    }
    
    /**
     * Resets every text box JFrame to their default text values.
     */
    private void reset() {
        try {
            
            this.inputFile = new File("./src/trace.txt");
            this.outputFile = new File("./src/statistics.txt");
            String inputFilePath = new File("./src/").getCanonicalPath();
            String outputFilePath = new File("./src/").getCanonicalPath();
            txtInputFileName.setText(this.inputFile.getName());
            txtInputFileDir.setText(inputFilePath);
            txtOutputFileName.setText(this.outputFile.getName());
            txtOutputFileDir.setText(outputFilePath);
            
            txtpnInputConsole.setText("");
            txtpnOutputConsole.setText("");
            
            txtpnStatus.setText("RESET SUCCESSFUL: All text boxes were reset to their default values.");
            
        } catch ( IOException 
                | IndexOutOfBoundsException 
                | NumberFormatException e) {
            txtpnStatus.setText("PROBLEM: " + e.getMessage());
            txtpnInputConsole.setText("*** Reset Unsuccessful ***"
                    + "\n"
                    + "\nPROBLEM: "
                    + "\n" + e.getMessage());
            txtpnOutputConsole.setText("");
            
        } catch (Exception e) {
            txtpnStatus.setText("PROBLEM: " + e.toString());
            txtpnInputConsole.setText("*** Reset Unsuccessful ***"
                    + "\n"
                    + "\nPROBLEM: "
                    + "\n" + e.toString());
            txtpnOutputConsole.setText("");
            
        }
    }
    
    /**
     * Will attempt to decode the current input file.
     */
    private void decode() {
        try {
            File inputFile = this.inputFile;
            File outputFile = this.outputFile;
            
            // Make sure the same files are not being updated.
            if (inputFile.getPath().equals(outputFile.getPath())) {
                JOptionPane.showMessageDialog(
                        frmDecoder, 
                        "The input file \"" + inputFile.getName() + "\" and output file \"" + outputFile.getName() + "\""
                                + " cannot have the same file name and cannot have the same directory paths.", 
                        "Error", 
                        JOptionPane.ERROR_MESSAGE);
            }
            else {
                mipsDecoder.decode(inputFile);
                mipsDecoder.saveStatsToFile(this.outputFile);
                
                String strInput = mipsDecoder.getInputString();
                //String strLastInput = mipsDecoder.getLastInputString();
                
                txtpnInputConsole.setText("*** Printing Dynamic Trace Instructions ***"
                        + "\n\nFile name: " + this.mipsDecoder.getInputFile().getName()
                        + "\n"
                        + "\n" + strInput
                        + "\n\nFile name: " + this.mipsDecoder.getInputFile().getName()
                        + "\n***Finished Printing Input***");
                txtpnOutputConsole.setText("*** Printing File Output ***"
                        + "\n\nFile name: " + this.mipsDecoder.getOutputFile().getName()
                        + "\n"
                        + "\n" + this.mipsDecoder.getStats()
                        + "\n\nFile name: " + this.mipsDecoder.getOutputFile().getName()
                        + "\n***Finished Printing Output***");
                txtpnStatus.setText("DECODE SUCCESSFUL: The input file was successfully decoded! "
                        + "The results were saved into the output file \"" + this.outputFile.getName() + "\".");
            }
            
        } catch ( IOException 
                | IndexOutOfBoundsException 
                | NumberFormatException e) {
            txtpnStatus.setText("PROBLEM: " + e.getMessage());
            txtpnInputConsole.setText("*** Printing Dynamic Trace Instructions ***"
                    + "\n\nFile name: " + this.mipsDecoder.getInputFile().getName()
                    + "\n"
                    + "\nPROBLEM: "
                    + "\n" + e.getMessage());
            txtpnOutputConsole.setText("*** Printing File Output ***"
                    + "\n\nFile name: " + this.mipsDecoder.getOutputFile().getName()
                    + "\n"
                    + "\nPROBLEM: "
                    + "\n" + e.getMessage());
            
        } catch (Exception e) {
            txtpnStatus.setText("PROBLEM: " + e.toString());
            txtpnInputConsole.setText("*** Printing Dynamic Trace Instructions ***"
                    + "\n\nFile name: " + this.mipsDecoder.getInputFile().getName()
                    + "\n"
                    + "\nPROBLEM: "
                    + "\n" + e.toString());
            txtpnOutputConsole.setText("*** Printing File Output ***"
                    + "\n\nFile name: " + this.mipsDecoder.getOutputFile().getName()
                    + "\n"
                    + "\nPROBLEM: "
                    + "\n" + e.toString());
            
        }
    }
    
    /**
     * Will ask the user to select an input file.
     */
    private void selectInputFile() {
        
        jFileChooser[0].setSelectedFile(this.inputFile);
        jFileChooser[0].setCurrentDirectory(this.inputFile);
        
        // Select input file.
        int rVal = jFileChooser[0].showOpenDialog(frmDecoder);
        if (rVal == JFileChooser.APPROVE_OPTION) {
            
            // Allow only text files to be selected.
            String selectedFileName = jFileChooser[0].getSelectedFile().getName();
            if (!selectedFileName.substring(selectedFileName.length() - 4, selectedFileName.length()).contains(".txt")) {
                JOptionPane.showMessageDialog(
                        frmDecoder, 
                        "The input file \"" + selectedFileName + "\" is not a text file. Please select/type in a valid text file.", 
                        "Error", 
                        JOptionPane.ERROR_MESSAGE);
            }
            else {
                // Set up input file.
                txtInputFileName.setText(jFileChooser[0].getSelectedFile().getName());
                txtInputFileDir.setText(jFileChooser[0].getCurrentDirectory().toString());
                
                txtInputFileName.setToolTipText(txtInputFileName.getText());
                txtInputFileDir.setToolTipText(txtInputFileDir.getText());
                
                this.inputFile = jFileChooser[0].getSelectedFile();
                
                jFileChooser[0].setSelectedFile(this.inputFile);
                jFileChooser[0].setCurrentDirectory(this.inputFile);
            }
        }
        if (rVal == JFileChooser.CANCEL_OPTION) {
            // Do nothing.
        }
    }
    
    /**
     * Will ask the user to select an output file.
     */
    private void selectOutputFile() {
        
        jFileChooser[1].setSelectedFile(this.outputFile);
        jFileChooser[1].setCurrentDirectory(this.outputFile);
        
        // Select output file.
        int rVal = jFileChooser[1].showSaveDialog(frmDecoder);
        if (rVal == JFileChooser.APPROVE_OPTION) {
        
            // Allow only text files to be selected.
            String selectedFileName = jFileChooser[1].getSelectedFile().getName();
            if (!selectedFileName.substring(selectedFileName.length() - 4, selectedFileName.length()).contains(".txt")) {
                JOptionPane.showMessageDialog(
                        frmDecoder, 
                        "The output file \"" + selectedFileName + "\" is not a text file. Please select/type in a valid text file.", 
                        "Error", 
                        JOptionPane.ERROR_MESSAGE);
            }
            else {
                // Set up output file.
                txtOutputFileName.setText(jFileChooser[1].getSelectedFile().getName());
                txtOutputFileDir.setText(jFileChooser[1].getCurrentDirectory().toString());
                
                txtOutputFileName.setToolTipText(txtOutputFileName.getText());
                txtOutputFileDir.setToolTipText(txtOutputFileDir.getText());
                
                this.outputFile = jFileChooser[1].getSelectedFile();
                
                jFileChooser[1].setSelectedFile(this.outputFile);
                jFileChooser[1].setCurrentDirectory(this.outputFile);
            }
        }
        if (rVal == JFileChooser.CANCEL_OPTION) {
            // Do nothing.
        }
    }
    
    private void updateInputFile() {
        // Allow only text files to be selected.
        String selectedFileName = this.inputFile.getName();
        if (!selectedFileName.substring(selectedFileName.length() - 4, selectedFileName.length()).contains(".txt")) {
            JOptionPane.showMessageDialog(
                    frmDecoder, 
                    "The input file \"" + selectedFileName + "\" is not a text file. Please select/type in a valid text file.", 
                    "Error", 
                    JOptionPane.ERROR_MESSAGE);
            txtInputFileName.setText(this.inputFile.getName());
        }
        else {
            this.inputFile = new File(txtInputFileDir.getText() + "/" + txtInputFileName.getText());
            txtInputFileName.setToolTipText(txtInputFileName.getText());
            txtInputFileDir.setToolTipText(txtInputFileDir.getText());
        }
    }
    
    private void updateOutputFile() {
        // Allow only text files to be selected.
        String selectedFileName = this.outputFile.getName();
        if (!selectedFileName.substring(selectedFileName.length() - 4, selectedFileName.length()).contains(".txt")) {
            JOptionPane.showMessageDialog(
                    frmDecoder, 
                    "The input file \"" + selectedFileName + "\" is not a text file. Please select/type in a valid text file.", 
                    "Error", 
                    JOptionPane.ERROR_MESSAGE);
            txtOutputFileName.setText(this.inputFile.getName());
        }
        else {
            this.outputFile = new File(txtOutputFileDir.getText() + "/" + txtOutputFileName.getText());
            txtOutputFileName.setToolTipText(txtOutputFileName.getText());
            txtOutputFileDir.setToolTipText(txtOutputFileDir.getText());
        }
    }
}
