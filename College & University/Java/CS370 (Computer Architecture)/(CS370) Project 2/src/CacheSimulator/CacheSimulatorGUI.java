package CacheSimulator;
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
public class CacheSimulatorGUI {

    private JFrame frmDecoder;
    
    private JFileChooser[] jFileChooser;
    
    private JTextPane txtpnInputConsole;
    private JTextPane txtpnOutputConsole;
    private JTextPane txtpnStatus;
    
    private String helpTitle    = "Simple Helper";
    private String helpMsg      = 
            "1. Click \"Get Input File\" and select the text file with the pc and instructions you want to decode.\n\n"
            + "2. Click \"Decode Input File\". Your input file will be decoded and send to the output file that was given.";
    
    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    CacheSimulatorGUI window = new CacheSimulatorGUI();
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
    public CacheSimulatorGUI() throws IOException {
        initialize();
    }

    /**
     * Initialize the contents of the frame.
     * @throws IOException 
     */
    private void initialize() throws IOException {
        
        frmDecoder = new JFrame();
        frmDecoder.setResizable(false);
        frmDecoder.setTitle("Cache Simulator");
        frmDecoder.setBounds(100, 100, 800, 400);
        frmDecoder.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frmDecoder.getContentPane().setLayout(null);
        
        JLabel lblInputConsole = new JLabel("Input");
        lblInputConsole.setBounds(374, 10, 175, 14);
        frmDecoder.getContentPane().add(lblInputConsole);
        
        JScrollPane scrollPaneInputConsole = new JScrollPane();
        scrollPaneInputConsole.setBounds(374, 35, 200, 294);
        frmDecoder.getContentPane().add(scrollPaneInputConsole);
        
        txtpnInputConsole = new JTextPane();
        txtpnInputConsole.setEditable(false);
        scrollPaneInputConsole.setViewportView(txtpnInputConsole);
        
        JLabel lblOutputConsole = new JLabel("Output");
        lblOutputConsole.setBounds(574, 10, 90, 14);
        frmDecoder.getContentPane().add(lblOutputConsole);
        
        JScrollPane scrollPaneOutputConsole = new JScrollPane();
        scrollPaneOutputConsole.setBounds(574, 35, 200, 294);
        frmDecoder.getContentPane().add(scrollPaneOutputConsole);
        
        txtpnOutputConsole = new JTextPane();
        txtpnOutputConsole.setEditable(false);
        scrollPaneOutputConsole.setViewportView(txtpnOutputConsole);
        
        JLabel lblStatus = new JLabel("Status");
        lblStatus.setBounds(10, 241, 46, 14);
        frmDecoder.getContentPane().add(lblStatus);
        
        JScrollPane scrollPaneStatus = new JScrollPane();
        scrollPaneStatus.setBounds(10, 266, 352, 63);
        frmDecoder.getContentPane().add(scrollPaneStatus);
        
        txtpnStatus = new JTextPane();
        scrollPaneStatus.setViewportView(txtpnStatus);
        txtpnStatus.setEditable(false);
        
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
    
}
