
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
 * The purpose of {@code this} is to be able to test the B+Tree class.
 * 
 * @author Kong Jimmy Vang
 * @version 1.0
 */
public class BTreeTesterGUI {

    private RandomAccessFile f;
    
    private BTree bTree;
    
    private JFrame frmMain;
    
    private JFileChooser[] jFileChooser;
    
    private JTextPane txtpnInputConsole;
    private JTextPane txtpnOutputConsole;
    private JTextPane txtpnOutputConsole2;
    private JTextPane txtpnStatus;
    
    private String helpTitle    = "Simple Helper";
    private String helpMsg      = "B+Tree. Click \"Create New BTree\" to start.";
    private JTextField txtFileName;
    private JTextArea txtKeys;
    private JTextField txtBlockSize;
    private JTextArea txtAddresses;
    private JTextField txtLow;
    private JTextField txtHigh;
    
    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    BTreeTesterGUI window = new BTreeTesterGUI();
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
    public BTreeTesterGUI() throws IOException {
        initialize();
    }

    /**
     * Initialize the contents of the frame.
     * @throws IOException 
     */
    private void initialize() throws IOException {
        
        frmMain = new JFrame();
        frmMain.setResizable(false);
        frmMain.setTitle("B+Tree Tester");
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
                    if (bTree != null) {
                        try {
                            bTree.close();
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
        txtpnStatus.setText("Welcome.  To start, create a new B+Tree or reuse an existing B+Tree.");
        scrollPaneStatus.setViewportView(txtpnStatus);
        txtpnStatus.setEditable(false);
        
        JLabel lblFileName = new JLabel("File Name");
        lblFileName.setBounds(10, 10, 252, 14);
        frmMain.getContentPane().add(lblFileName);
        
        txtFileName = new JTextField();
        txtFileName.setText("bTree");
        txtFileName.setBounds(10, 35, 252, 20);
        frmMain.getContentPane().add(txtFileName);
        txtFileName.setColumns(10);
        
        JButton btnCreateBTree = new JButton("Create New BTree");
        btnCreateBTree.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent arg0) {
                createNewBTree();
            }
        });
        
        JLabel lblBlockSize = new JLabel("Block Size");
        lblBlockSize.setBounds(272, 10, 92, 14);
        frmMain.getContentPane().add(lblBlockSize);
        
        txtBlockSize = new JTextField();
        txtBlockSize.setText("60");
        txtBlockSize.setBounds(272, 35, 92, 20);
        frmMain.getContentPane().add(txtBlockSize);
        txtBlockSize.setColumns(10);
        btnCreateBTree.setBounds(10, 66, 169, 23);
        frmMain.getContentPane().add(btnCreateBTree);
        
        JButton btnReuseBTree = new JButton("Reuse BTree");
        btnReuseBTree.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                reuseBTree();
            }
        });
        btnReuseBTree.setBounds(195, 66, 169, 23);
        frmMain.getContentPane().add(btnReuseBTree);
        
        JLabel lblInput = new JLabel("<html>\r\nInput (Use commas \",\" to perform an action on multiple keys/addresses.)<br>\r\n\r\nAddresses are randomized for each key if and only if no input is present.\r\n</html>");
        lblInput.setBounds(10, 95, 354, 71);
        frmMain.getContentPane().add(lblInput);
        
        JLabel lblKeys = new JLabel("Key(s):");
        lblKeys.setBounds(10, 178, 175, 14);
        frmMain.getContentPane().add(lblKeys);
        
        JLabel lblAddresses = new JLabel("Address(es):");
        lblAddresses.setBounds(189, 178, 175, 14);
        frmMain.getContentPane().add(lblAddresses);
        
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
        scrollPaneTxtKeys.setViewportView(txtKeys);
        txtKeys.setWrapStyleWord(true);
        txtKeys.setLineWrap(true);
        txtKeys.setText("50,45,40,35,30,25,20,15,10,5,0,-5,-10,-15,-20,-25,-30,-35,-40,-45,-50");
        txtKeys.setColumns(10);
        
        JScrollPane scrollPaneTxtAddresses = new JScrollPane();
        scrollPaneTxtAddresses.setBounds(189, 204, 175, 51);
        frmMain.getContentPane().add(scrollPaneTxtAddresses);
        
        txtAddresses = new JTextArea();
        scrollPaneTxtAddresses.setViewportView(txtAddresses);
        txtAddresses.setText("10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400");
        txtAddresses.setLineWrap(true);
        txtAddresses.setWrapStyleWord(true);
        txtAddresses.setColumns(10);
        
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
    
    private void createNewBTree(){
        txtpnStatus.setText("Creating a new B+Tree...");
        
        try {
            File file = new File(txtFileName.getText());
            if (file.exists()) {
                int choice = JOptionPane.showConfirmDialog(frmMain, 
                        "Are you sure you want to delete this file and create a new BTree?", 
                        "This file already exists.", 
                        JOptionPane.WARNING_MESSAGE, 
                        JOptionPane.YES_NO_OPTION);
                if (choice == JOptionPane.YES_OPTION) {
                    
                } else {
                    txtpnStatus.setText(txtpnStatus.getText() + "\nCANCELED");
                    return;
                }
            }
            if (bTree != null) bTree.close();
            bTree = new BTree(txtFileName.getText(), Integer.parseInt(txtBlockSize.getText()));
            refreshList();
            
        } catch (IOException e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR");
            e.printStackTrace();
        }
        
        txtpnStatus.setText(txtpnStatus.getText() + "\nDone");
    }
    
    private void reuseBTree() {
        txtpnStatus.setText("Reusing B+Tree...");
        
        try {
            if (bTree != null) bTree.close();
            bTree = new BTree(txtFileName.getText());
            refreshList();
            
        } catch (IOException e) {
            txtpnStatus.setText(txtpnStatus.getText() + "\nERROR");
            e.printStackTrace();
        }
        
        txtpnStatus.setText(txtpnStatus.getText() + "\nDone");
    }

    private void insert() {
        txtpnStatus.setText("Inserting keys with addresses...");
        
        if (bTree == null) {
            warnAboutBTree();
            return;
        }
        
        try {
            String[] keys = txtKeys.getText().split(",");
            String[] addresses = txtAddresses.getText().split(",");
            
            int i = 0;
            while (i < keys.length && i < addresses.length && !"".equals(addresses[0].trim())) {
                int key = Integer.parseInt(keys[i].trim());
                long address = Long.parseLong(addresses[i].trim());
                
                boolean wasInserted = bTree.insert(key, address);
                if (!wasInserted) {
                    txtpnStatus.setText(txtpnStatus.getText() + "\ninsert(" + key + ", " + address + ") returned false");
                }
                
                i++;
            }
            while (i < keys.length) {
                int key = Integer.parseInt(keys[i].trim());
                Random r = new Random();
                long address = r.nextInt(100000) + 1000;
                
                bTree.insert(key, address);
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
        
        if (bTree == null) {
            warnAboutBTree();
            return;
        }
        
        try {
            String[] keys = txtKeys.getText().split(",");
            
            int i = 0;
            while (i < keys.length) {
                int key = Integer.parseInt(keys[i].trim());
                
                long removedAddress = bTree.remove(key);
                if (removedAddress == 0) {
                    txtpnStatus.setText(txtpnStatus.getText() + "\nremove(" + key + ") returned 0");
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
        
        if (bTree == null) {
            warnAboutBTree();
            return;
        }
        
        try {
            String[] keys = txtKeys.getText().split(",");
            String addresses = "*** Search Results ***\n";
            int i = 0;
            while (i < keys.length) {
                int key = Integer.parseInt(keys[i].trim());
                
                addresses += "[ key(" + key + "), addr(" + bTree.search(key) + ") ], \n";
                
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
        
        if (bTree == null) {
            warnAboutBTree();
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
            LinkedList<Long> list = bTree.rangeSearch(low, high);
            
            
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
    
    private void warnAboutBTree() {
        txtpnStatus.setText(txtpnStatus.getText() + "\nERROR: Please create a new B+Tree or reuse an existing B+Tree.");
        JOptionPane.showMessageDialog(frmMain, 
                "Please create a new B+Tree or reuse an existing B+Tree.", 
                "Error", 
                JOptionPane.ERROR_MESSAGE);
    }
    
    private void refreshList() {
        String s = "";
        try {
            /*
            s += "\n*** List ***\n";
            s += bTree.getList() + "";
            
            s += "\n*** Free List ***\n";
            s += bTree.getFreeList() + "";
            */
            
            ///*
            s += "\n*** bTree.print() ***\n";
            s += "To print here, set the BTree.print() to return\n a String and "
                    + "uncomment \"//s += bTree.print();\" \nin the \"refreshList\" method. "
                    + "\n\nOtherwise, check the IDE console \nor cmd line for the bTree.print() string.";
            
            //s += bTree.print();
            bTree.print();
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
