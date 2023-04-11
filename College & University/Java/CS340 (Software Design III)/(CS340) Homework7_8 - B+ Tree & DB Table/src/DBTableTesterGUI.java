
import java.awt.EventQueue;
import java.awt.FlowLayout;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javax.swing.JTextPane;
import javax.swing.JFileChooser;
import javax.swing.JTextField;
import javax.swing.JScrollPane;
import javax.swing.JButton;
import javax.swing.event.CaretListener;

import javax.swing.event.CaretEvent;
import java.awt.Font;
import javax.swing.JSeparator;
import javax.swing.JTextArea;

import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.ScrollPaneConstants;
import javax.swing.JPanel;
import java.awt.SystemColor;
import java.awt.Color;
import javax.swing.SwingConstants;

/**
 * The purpose of {@code this} is to be able to test the DBTable class.
 * 
 * @author Kong Jimmy Vang
 * @version 1.0
 */
public class DBTableTesterGUI {
    
    private DBTable dbTable;
    
    private JFrame frmMain;
    
    //private JFileChooser[] jFileChooser;
    
    private JTextPane txtpnInputConsole;
    private JTextPane txtpnOutputConsole;
    private JTextPane txtpnOutputConsole2;
    private JTextPane txtpnStatus;
    
    private String helpTitle    = "Simple Helper";
    private String helpMsg      = "DBTable. Click \"Create New DBTable\" to start.";
    private JTextField txtFileName;
    private JTextArea txtKeys;
    private JTextField txtBlockSize;
    private JTextArea txtCharFields;
    private JTextField txtLow;
    private JTextField txtHigh;
    private JTextField txtFieldLengths;
    
    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    DBTableTesterGUI window = new DBTableTesterGUI();
                    window.frmMain.setVisible(true);
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
    public DBTableTesterGUI() throws IOException {
        initialize();
    }

    /**
     * Initialize the contents of the frame.
     * @throws IOException 
     */
    private void initialize() throws IOException {
        
        frmMain = new JFrame();
        frmMain.setResizable(false);
        frmMain.setTitle("DBTable Tester");
        frmMain.setBounds(100, 100, 800, 480);
        frmMain.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
        frmMain.getContentPane().setLayout(null);
        frmMain.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                // Ask for confirmation before terminating the program.
                int option = JOptionPane.showConfirmDialog(
                        frmMain, 
                        "Are you sure you want to close the application?",
                        "Close Confirmation", 
                        JOptionPane.YES_NO_OPTION, 
                        JOptionPane.QUESTION_MESSAGE);
                if (option == JOptionPane.YES_OPTION) {
                    if (dbTable != null) {
                        try {
                            dbTable.close();
                        } catch (Exception e1) { 
                            e1.printStackTrace();
                        }
                    }
                    
                    System.exit(0);
                }
            }
        });
        
        JLabel lblInputConsole = new JLabel("Search Results");
        lblInputConsole.setBounds(376, 10, 112, 14);
        frmMain.getContentPane().add(lblInputConsole);
        
        JScrollPane scrollPaneInputConsole = new JScrollPane();
        scrollPaneInputConsole.setBounds(376, 35, 112, 381);
        frmMain.getContentPane().add(scrollPaneInputConsole);
        
        txtpnInputConsole = new JTextPane();
        txtpnInputConsole.setEditable(false);
        scrollPaneInputConsole.setViewportView(txtpnInputConsole);
        
        JLabel lblOutputConsole = new JLabel("Output");
        lblOutputConsole.setBounds(498, 10, 284, 14);
        frmMain.getContentPane().add(lblOutputConsole);
        
        JScrollPane scrollPaneOutputConsole = new JScrollPane();
        scrollPaneOutputConsole.setBounds(498, 36, 284, 193);
        frmMain.getContentPane().add(scrollPaneOutputConsole);
        
        JPanel panelOutputConsole = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelOutputConsole.setBackground(Color.WHITE);
        scrollPaneOutputConsole.setViewportView(panelOutputConsole);
        
        txtpnOutputConsole = new JTextPane();
        txtpnOutputConsole.setBackground(Color.WHITE);
        panelOutputConsole.add(txtpnOutputConsole);
        txtpnOutputConsole.setEditable(false);
        
        JLabel lblOutputConsole2 = new JLabel("Previous Output");
        lblOutputConsole2.setBounds(498, 241, 282, 14);
        frmMain.getContentPane().add(lblOutputConsole2);
        
        JScrollPane scrollPaneOutputConsole2 = new JScrollPane();
        scrollPaneOutputConsole2.setBounds(498, 267, 284, 149);
        frmMain.getContentPane().add(scrollPaneOutputConsole2);
        
        JPanel panelOutputConsole2 = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelOutputConsole2.setBackground(Color.WHITE);
        scrollPaneOutputConsole2.setViewportView(panelOutputConsole2);
        
        txtpnOutputConsole2 = new JTextPane();
        txtpnOutputConsole2.setBackground(Color.WHITE);
        panelOutputConsole2.add(txtpnOutputConsole2);
        txtpnOutputConsole2.setEditable(false);
        
        JLabel lblStatus = new JLabel("Status");
        lblStatus.setBounds(10, 340, 46, 14);
        frmMain.getContentPane().add(lblStatus);
        
        JScrollPane scrollPaneStatus = new JScrollPane();
        scrollPaneStatus.setBounds(10, 359, 354, 57);
        frmMain.getContentPane().add(scrollPaneStatus);
        
        txtpnStatus = new JTextPane();
        txtpnStatus.setText("Welcome.  To start, create a new DBTable or reuse an existing DBTable.");
        scrollPaneStatus.setViewportView(txtpnStatus);
        txtpnStatus.setEditable(false);
        
        JLabel lblFileName = new JLabel("File Name");
        lblFileName.setBounds(10, 10, 132, 14);
        frmMain.getContentPane().add(lblFileName);
        
        txtFileName = new JTextField();
        txtFileName.setText("DBTable");
        txtFileName.setBounds(10, 35, 132, 20);
        frmMain.getContentPane().add(txtFileName);
        txtFileName.setColumns(10);
        
        JButton btnCreateDBTable = new JButton("Create New DBTable");
        btnCreateDBTable.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent arg0) {
                createNewDBTable();
            }
        });
        
        txtFieldLengths = new JTextField();
        txtFieldLengths.setText("10, 15");
        txtFieldLengths.setColumns(10);
        txtFieldLengths.setBounds(154, 35, 106, 20);
        frmMain.getContentPane().add(txtFieldLengths);
        
        JLabel lblBlockSize = new JLabel("Block Size");
        lblBlockSize.setBounds(272, 10, 92, 14);
        frmMain.getContentPane().add(lblBlockSize);
        
        txtBlockSize = new JTextField();
        txtBlockSize.setText("60");
        txtBlockSize.setBounds(272, 35, 92, 20);
        frmMain.getContentPane().add(txtBlockSize);
        txtBlockSize.setColumns(10);
        btnCreateDBTable.setBounds(10, 66, 169, 23);
        frmMain.getContentPane().add(btnCreateDBTable);
        
        JButton btnReuseDBTable = new JButton("Reuse DBTable");
        btnReuseDBTable.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                reuseDBTable();
            }
        });
        btnReuseDBTable.setBounds(195, 66, 169, 23);
        frmMain.getContentPane().add(btnReuseDBTable);
        
        JLabel lblInput = new JLabel("<html>\r\nInput (Use commas \",\" to perform an action on multiple keys/charFields.)<br>\r\n\r\nCharFields[][]: Spaces separate each field. (Each field must be lower than the specified Field Length (fL[])  ).\r\n</html>");
        lblInput.setBounds(10, 95, 354, 71);
        frmMain.getContentPane().add(lblInput);
        
        JLabel lblKeys = new JLabel("Key(s):");
        lblKeys.setBounds(10, 178, 175, 14);
        frmMain.getContentPane().add(lblKeys);
        
        JLabel lblCharFields = new JLabel("CharFields[][]");
        lblCharFields.setBounds(189, 178, 175, 14);
        frmMain.getContentPane().add(lblCharFields);
        
        JButton btnInsert = new JButton("Insert(k, addr)");
        btnInsert.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent arg0) {
                insert();
            }
        });
        btnInsert.setBounds(10, 267, 132, 23);
        frmMain.getContentPane().add(btnInsert);
        
        JButton btnRemove = new JButton("Remove(k)");
        btnRemove.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                remove();
            }
        });
        btnRemove.setBounds(154, 267, 99, 23);
        frmMain.getContentPane().add(btnRemove);
        
        JButton btnSearch = new JButton("Search(k)");
        btnSearch.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                search();
            }
        });
        btnSearch.setBounds(265, 267, 99, 23);
        frmMain.getContentPane().add(btnSearch);
        
        JScrollPane scrollPaneTxtKeys = new JScrollPane();
        scrollPaneTxtKeys.setBounds(10, 204, 175, 51);
        frmMain.getContentPane().add(scrollPaneTxtKeys);
        
        txtKeys = new JTextArea();
        txtKeys.setToolTipText("");
        scrollPaneTxtKeys.setViewportView(txtKeys);
        txtKeys.setWrapStyleWord(true);
        txtKeys.setLineWrap(true);
        txtKeys.setText("25, 26");
        txtKeys.setColumns(10);
        
        JScrollPane scrollPaneTxtCharFields = new JScrollPane();
        scrollPaneTxtCharFields.setBounds(189, 204, 175, 51);
        frmMain.getContentPane().add(scrollPaneTxtCharFields);
        
        txtCharFields = new JTextArea();
        scrollPaneTxtCharFields.setViewportView(txtCharFields);
        txtCharFields.setText("James Lee, Jake Koslov");
        txtCharFields.setLineWrap(true);
        txtCharFields.setWrapStyleWord(true);
        txtCharFields.setColumns(10);
        
        JLabel lblHigh = new JLabel("High:");
        lblHigh.setBounds(189, 327, 55, 16);
        frmMain.getContentPane().add(lblHigh);
        
        txtHigh = new JTextField();
        txtHigh.setText("60");
        txtHigh.setBounds(228, 325, 114, 20);
        frmMain.getContentPane().add(txtHigh);
        txtHigh.setColumns(10);
        
        JLabel lblLow = new JLabel("Low:");
        lblLow.setBounds(189, 302, 55, 16);
        frmMain.getContentPane().add(lblLow);
        
        txtLow = new JTextField();
        txtLow.setText("-20");
        txtLow.setBounds(228, 300, 114, 20);
        frmMain.getContentPane().add(txtLow);
        txtLow.setColumns(10);
        
        JButton btnPerformRangeSearch = new JButton("Perform Range Search");
        btnPerformRangeSearch.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent arg0) {
                rangeSearch();
            }
        });
        btnPerformRangeSearch.setBounds(10, 302, 169, 26);
        frmMain.getContentPane().add(btnPerformRangeSearch);
        
        JLabel lblFieldLengthsFL = new JLabel("Field Lengths (fL[])");
        lblFieldLengthsFL.setBounds(154, 9, 106, 16);
        frmMain.getContentPane().add(lblFieldLengthsFL);
        
        JMenuBar menuBar = new JMenuBar();
        frmMain.setJMenuBar(menuBar);
        
        JMenu mnFile = new JMenu("File");
        menuBar.add(mnFile);
        
        JMenuItem mntmQuit = new JMenuItem("Quit");
        mntmQuit.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent arg0) {
                frmMain.dispatchEvent(new WindowEvent(frmMain, WindowEvent.WINDOW_CLOSING));
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
        JOptionPane.showMessageDialog(frmMain, this.helpMsg, this.helpTitle, JOptionPane.INFORMATION_MESSAGE);
    }
    
    private void createNewDBTable(){
        txtpnStatus.setText("Creating a new DBTable...");
        
        try {
            File file = new File(txtFileName.getText());
            if (file.exists()) {
                int choice = JOptionPane.showConfirmDialog(frmMain, 
                        "Are you sure you want to delete this file and create a new DBTable?", 
                        "This file already exists.", 
                        JOptionPane.WARNING_MESSAGE, 
                        JOptionPane.YES_NO_OPTION);
                if (choice == JOptionPane.YES_OPTION) {
                    
                } else {
                    txtpnStatus.setText(txtpnStatus.getText() + "\nCANCELED");
                    return;
                }
            }
            
            String[] fieldLengths = txtFieldLengths.getText().split(",");
            int[] fieldLengthsInt = new int[fieldLengths.length];
            int i = 0;
            while (i < fieldLengths.length) {
                fieldLengthsInt[i] = Integer.parseInt(fieldLengths[i].trim());
                i++;
            }
            
            if (dbTable != null) dbTable.close();
            dbTable = new DBTable(txtFileName.getText(), fieldLengthsInt, Integer.parseInt(txtBlockSize.getText()));
            refreshList();
            
        } catch (IOException e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR");
            e.printStackTrace();
        }
        
        txtpnStatus.setText(txtpnStatus.getText() + "\nDone");
    }
    
    private void reuseDBTable() {
        txtpnStatus.setText("Reusing DBTable...");
        
        try {
            if (dbTable != null) dbTable.close();
            dbTable = new DBTable(txtFileName.getText());
            refreshList();
            
        } catch (IOException e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR");
            e.printStackTrace();
        }
        
        txtpnStatus.setText(txtpnStatus.getText() + "\nDone");
    }

    private void insert() {
        txtpnStatus.setText("Inserting keys with addresses...");
        
        if (dbTable == null) {
            warnAboutDBTable();
            return;
        }
        
        try {
            
            String[] keys = txtKeys.getText().split(",");
            String[] strCharFields = txtCharFields.getText().split(",");
            
            String[] fieldLengths = txtFieldLengths.getText().split(",");
            int[] fieldLengthsInt = new int[fieldLengths.length];
            int k = 0;
            while (k < fieldLengths.length) {
                fieldLengthsInt[k] = Integer.parseInt(fieldLengths[k].trim());
                k++;
            }
            
            // Insert user input.
            int i = 0;
            while (i < keys.length && i < strCharFields.length && !"".equals(strCharFields[0].trim())) {
                int key = Integer.parseInt(keys[i].trim());
                
                char[][] charFields = new char[fieldLengths.length][];
                String[] temp = strCharFields[i].trim().split(" ");
                
                int j = 0;
                while (j < charFields.length) {
                    
                    charFields[j] = Arrays.copyOf(temp[j].toCharArray(), fieldLengthsInt[j]);
                    j++;
                }
                
                //System.out.println("TESTING " + charFields.length + " " + charFields[1].length + " " + charFields[2].length);
                // Insertion.
                boolean wasInserted = dbTable.insert(key, charFields);
                if (!wasInserted) {
                    txtpnStatus.setText(txtpnStatus.getText() + "\ninsert(" + key + ", " + charFields + ") returned false.");
                }
                
                i++;
            }
            
            // Randomly insert character fields.
            while (i < keys.length) {
                int key = Integer.parseInt(keys[i].trim());
                Random r = new Random();
                
                char[][] charFields = new char[fieldLengths.length][];
                int j = 0;
                while (j < charFields.length) {
                    char[] array = new char[fieldLengthsInt[j]];
                    for(int i2 = 0; i2 < array.length; i2++){
                        array[i2] = (char)(r.nextInt(26) + 97);
                    }
                    charFields[j] = Arrays.copyOf(array, fieldLengthsInt[j]);
                    j++;
                }
                
                // Insertion.
                boolean wasInserted = dbTable.insert(key, charFields);
                if (!wasInserted) {
                    txtpnStatus.setText(txtpnStatus.getText() + "\ninsert(" + key + ", " + charFields + ") returned false.");
                }
                i++;
            }
            
            refreshList();
            
        } catch (NumberFormatException e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR: " + e.getMessage());
            JOptionPane.showMessageDialog(frmMain, 
                    "The keys and/or addresses box has invalid inputs.", 
                    "Error", 
                    JOptionPane.ERROR_MESSAGE);
        } catch (Exception e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR: " + e.getMessage());
            e.printStackTrace();
        }
        
        txtpnStatus.setText(txtpnStatus.getText() + "\nDone");
    }
    
    private void remove() {
        txtpnStatus.setText("Removing keys...");
        
        if (dbTable == null) {
            warnAboutDBTable();
            return;
        }
        
        try {
            String[] keys = txtKeys.getText().split(",");
            
            int i = 0;
            while (i < keys.length) {
                int key = Integer.parseInt(keys[i].trim());
                
                boolean removedAddress = dbTable.remove(key);
                if (removedAddress) {
                    txtpnStatus.setText(txtpnStatus.getText() + "\nremove(" + key + ") returned false.");
                }
                i++;
            }
            
            refreshList();
            
        } catch (NumberFormatException e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR: " + e.getMessage());
            JOptionPane.showMessageDialog(frmMain, 
                    "The keys box has invalid inputs.", 
                    "Error", 
                    JOptionPane.ERROR_MESSAGE);
        } catch (Exception e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR: " + e.getMessage());
            e.printStackTrace();
        }
        
        txtpnStatus.setText(txtpnStatus.getText() + "\nDone");
    }
    
    private void search() {
        txtpnStatus.setText("Searching for keys...");
        
        if (dbTable == null) {
            warnAboutDBTable();
            return;
        }
        
        try {
            String[] keys = txtKeys.getText().split(",");
            String addresses = "*** Search Results ***\n\n";
            int i = 0;
            while (i < keys.length) {
                int key = Integer.parseInt(keys[i].trim());
                
                addresses += "search(" + key + "), The list contains... " + dbTable.search(key) + "\n\n";
                
                i++;
            }
            
            //refreshList();
            txtpnInputConsole.setText(addresses);
            
        } catch (NumberFormatException e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR: " + e.getMessage());
            JOptionPane.showMessageDialog(frmMain, 
                    "The keys box has invalid inputs.", 
                    "Error", 
                    JOptionPane.ERROR_MESSAGE);
        } catch (Exception e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR: " + e.getMessage());
            e.printStackTrace();
        }
        
        txtpnStatus.setText(txtpnStatus.getText() + "\nDone");
    }
    
    private void rangeSearch() {
        txtpnStatus.setText("Performing a range search for keys between "
                + "\"" + txtLow.getText() + "\" and \"" + txtHigh.getText() + "\".");
        
        if (dbTable == null) {
            warnAboutDBTable();
            return;
        }
        
        try {
            int low = Integer.parseInt(txtLow.getText());
            int high = Integer.parseInt(txtHigh.getText());
            
            String addresses = "** Range Search Results **\n"
                    + "LOW: " + txtLow.getText() + "\n"
                    + "HIGH: " + txtHigh.getText() + "\n\n";
            
            if (low > high) {
                addresses += "WARNING: \"low\" is set greater than \"high\". This may affect \"rangeSearch()\"'s precondition.\n\n";
            }
            
            // Create list.
            LinkedList<LinkedList<String>> list = dbTable.rangeSearch(low, high);
            
            //TODO: FIX THIS.
            int i = 0;
            while (i < list.size()) {
                addresses += "list.get(" + i + ") = " + list.get(i) + "\n";
                i++;
            }
            
            if (list.size() == 0) {
                addresses += "\nThe returned LinkedList is empty.\n";
            }
            
            //refreshList();
            txtpnInputConsole.setText(addresses);
            
        
        } catch (NumberFormatException e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR: " + e.getMessage());
            JOptionPane.showMessageDialog(frmMain, 
                    "The keys box has invalid inputs.", 
                    "Error", 
                    JOptionPane.ERROR_MESSAGE);
        } catch (Exception e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR: " + e.getMessage());
            e.printStackTrace();
        }
        
        txtpnStatus.setText(txtpnStatus.getText() + "\nDone");
    }
    
    private void warnAboutDBTable() {
        txtpnStatus.setText(txtpnStatus.getText() + "\nERROR: Please create a new DBTable or reuse an existing DBTable.");
        JOptionPane.showMessageDialog(frmMain, 
                "Please create a new DBTable or reuse an existing DBTable.", 
                "Error", 
                JOptionPane.ERROR_MESSAGE);
    }
    
    private void refreshList() {
        String s = "";
        try {
            /*
            s += "\n*** List ***\n";
            s += dbTable.getList() + "";
            
            s += "\n*** Free List ***\n";
            s += dbTable.getFreeList() + "";
            */
            
            ///*
            s += "\n*** dbTable.print() ***\n";
            s += "To print here, set the dbTable.print() to return\n a String and "
                    + "uncomment \"//s += dbTable.print();\" \nin the \"refreshList\" method. "
                    + "\n\nOtherwise, check the IDE console \nor cmd line for the dbTable.print() string.";
            
            //s += bTree.print();
            dbTable.print();
            System.out.println("***************************");
            //*/
            
        } catch (Exception e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR");
            e.printStackTrace();
        }
        
        txtpnOutputConsole2.setText(txtpnOutputConsole.getText());
        txtpnOutputConsole.setText(s);
    }
}
