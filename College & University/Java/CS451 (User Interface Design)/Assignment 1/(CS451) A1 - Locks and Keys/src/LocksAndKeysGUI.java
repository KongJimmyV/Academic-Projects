import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import java.awt.Font;
import javax.swing.JSeparator;
import java.awt.Color;

import javax.swing.UIManager;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JTextField;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;
import javax.swing.JScrollPane;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.awt.event.ActionEvent;
import javax.swing.ListSelectionModel;
import javax.swing.RowFilter;
import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.Document;
import javax.swing.text.DocumentFilter;
import javax.swing.text.PlainDocument;
import java.awt.SystemColor;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;

/**
 * Class        - CS451             <br>
 * Year         - Fall 2021         <br>
 * Project      - Assignment 1      <br><br>
 * 
 * Description  - This is the User Interface for Assignment 1. <br>
 * 
 * @author      Hunter Sutter
 * @author      Kong Jimmy Vang
 */
public class LocksAndKeysGUI {

    private Main mainApp;
    
    private JFrame frmKeysAndLocks;
    private JTextField textFieldRoomNumberPage1;
    
    private TableRowSorter<TableModel> rowSorterLocksPage3;
    private JTable tableLocksPage6;
    private JTable tableLocksPage5;
    private JTable tableLocksPage4;
    private JTable tableLocksPage3;
    private JTable tableLocksPage2;
    private JTable tableKeysPage6;
    private JTable tableKeysPage5;
    private JTable tableKeysPage4;
    private JTable tableKeysPage3;
    private JTable tableKeysPage2;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    LocksAndKeysGUI window = new LocksAndKeysGUI();
                    window.frmKeysAndLocks.setVisible(true);
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the application.
     */
    public LocksAndKeysGUI() {
        initialize();
    }

    /**
     * Initialize the contents of the frame.
     */
    private void initialize() {
        
        // Initialize Application
        mainApp = new Main();
        
        
        // Initialize Main Frame
        frmKeysAndLocks = new JFrame();
        frmKeysAndLocks.setTitle("Keys and Locks Manager");
        frmKeysAndLocks.setResizable(false);
        frmKeysAndLocks.setBounds(100, 100, 490, 490);
        frmKeysAndLocks.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frmKeysAndLocks.getContentPane().setLayout(null);
        
        
        // Initialize Menu Bar
        JMenuBar menuBar = new JMenuBar();
        menuBar.setBounds(0, 0, 474, 22);
        frmKeysAndLocks.getContentPane().add(menuBar);
        
        JMenu mnNewMenu = new JMenu("File");
        menuBar.add(mnNewMenu);
        
        JMenuItem mntmNewMenuItem = new JMenuItem("Exit");
        mntmNewMenuItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                frmKeysAndLocks.dispose();
            }
        });
        mnNewMenu.add(mntmNewMenuItem);
        
        
        // Initialize GUI Title and Separator
        JLabel lblTitle = new JLabel("Keys and Locks Manager");
        lblTitle.setHorizontalAlignment(SwingConstants.CENTER);
        lblTitle.setFont(new Font("Tahoma", Font.BOLD, 24));
        lblTitle.setBounds(10, 27, 454, 37);
        frmKeysAndLocks.getContentPane().add(lblTitle);
        
        JSeparator separatorTitle = new JSeparator();
        separatorTitle.setBounds(0, 70, 474, 2);
        frmKeysAndLocks.getContentPane().add(separatorTitle);
        
        
        // Initialize Pages
        JPanel panelPage1 = new JPanel();
        panelPage1.setBounds(0, 22, 474, 429);
        frmKeysAndLocks.getContentPane().add(panelPage1);
        panelPage1.setLayout(null);
        
        JPanel panelPage2 = new JPanel();
        panelPage2.setBounds(0, 22, 474, 429);
        frmKeysAndLocks.getContentPane().add(panelPage2);
        panelPage2.setLayout(null);
        
        JPanel panelPage3 = new JPanel();
        panelPage3.setBounds(0, 22, 474, 429);
        frmKeysAndLocks.getContentPane().add(panelPage3);
        panelPage3.setLayout(null);
        
        JPanel panelPage4 = new JPanel();
        panelPage4.setBounds(0, 22, 474, 429);
        frmKeysAndLocks.getContentPane().add(panelPage4);
        panelPage4.setLayout(null);
        
        JPanel panelPage5 = new JPanel();
        panelPage5.setBounds(0, 22, 474, 429);
        frmKeysAndLocks.getContentPane().add(panelPage5);
        panelPage5.setLayout(null);
        
        JPanel panelPage6 = new JPanel();
        panelPage6.setBounds(0, 22, 474, 429);
        frmKeysAndLocks.getContentPane().add(panelPage6);
        panelPage6.setLayout(null);
        
        ///*
        //=== Page 1 ===
        JLabel lblNamePage1 = new JLabel("");
        lblNamePage1.setHorizontalAlignment(SwingConstants.CENTER);
        lblNamePage1.setFont(new Font("Tahoma", Font.PLAIN, 14));
        lblNamePage1.setBounds(10, 57, 454, 29);
        panelPage1.add(lblNamePage1);
        
        JSeparator separatorAPage1 = new JSeparator();
        separatorAPage1.setBounds(138, 186, 200, 2);
        panelPage1.add(separatorAPage1);
        
        JSeparator separatorBPage1 = new JSeparator();
        separatorBPage1.setBounds(138, 313, 200, 2);
        panelPage1.add(separatorBPage1);
        
        JLabel lblMsgBoxPage1 = new JLabel("");
        lblMsgBoxPage1.setHorizontalAlignment(SwingConstants.CENTER);
        lblMsgBoxPage1.setForeground(new Color(60, 179, 113));
        lblMsgBoxPage1.setFont(new Font("Tahoma", Font.PLAIN, 11));
        lblMsgBoxPage1.setBounds(10, 103, 454, 14);
        panelPage1.add(lblMsgBoxPage1);
        
        //JLabel lblKeyTypePage1 = new JLabel("Key Type:");
        //lblKeyTypePage1.setHorizontalAlignment(SwingConstants.TRAILING);
        //lblKeyTypePage1.setBounds(138, 107, 110, 14);
        //panelPage1.add(lblKeyTypePage1);
        
        //JComboBox<String> comboBoxKeyTypePage1 = new JComboBox<String>();
        //comboBoxKeyTypePage1.setFont(new Font("Tahoma", Font.PLAIN, 11));
        //comboBoxKeyTypePage1.setModel(new DefaultComboBoxModel<String>(new String[] {"Physical", "Card"}));
        //comboBoxKeyTypePage1.setBounds(258, 103, 80, 22);
        //panelPage1.add(comboBoxKeyTypePage1);

        JLabel lblRoomNumberPage1 = new JLabel("Room Number:");
        lblRoomNumberPage1.setHorizontalAlignment(SwingConstants.TRAILING);
        lblRoomNumberPage1.setBounds(138, 131, 110, 14);
        panelPage1.add(lblRoomNumberPage1);
        
        textFieldRoomNumberPage1 = new JTextField();
        textFieldRoomNumberPage1.getDocument().addDocumentListener(new DocumentListener() {
            public void changedUpdate(DocumentEvent e) {
                resetMsgBox();
            }

            public void removeUpdate(DocumentEvent e) {
                resetMsgBox();
            }

            public void insertUpdate(DocumentEvent e) {
                resetMsgBox();
            }

            public void resetMsgBox() {
                if (lblMsgBoxPage1.getForeground().equals(new Color(60, 179, 113))) {
                    lblMsgBoxPage1.setText("");
                }
            }
        });
        textFieldRoomNumberPage1.addFocusListener(new FocusAdapter() {
            @Override
            public void focusLost(FocusEvent e) {
                if ("".equals(textFieldRoomNumberPage1.getText())) {
                    PlainDocument doc = (PlainDocument) textFieldRoomNumberPage1.getDocument();
                    doc.setDocumentFilter(new DocumentFilter());
                    
                    textFieldRoomNumberPage1.setText("101-300");
                    textFieldRoomNumberPage1.setForeground(SystemColor.controlShadow);
                }
            }
        });
        textFieldRoomNumberPage1.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                if ("101-300".equals(textFieldRoomNumberPage1.getText())) {
                    textFieldRoomNumberPage1.setText("");
                    textFieldRoomNumberPage1.setForeground(SystemColor.controlText);
                    
                    PlainDocument doc = (PlainDocument) textFieldRoomNumberPage1.getDocument();
                    doc.setDocumentFilter(new IntDocumentFilter());
                }
                
            }
        });
        textFieldRoomNumberPage1.setForeground(SystemColor.controlShadow);
        textFieldRoomNumberPage1.setText("101-300");
        textFieldRoomNumberPage1.setFont(new Font("Tahoma", Font.PLAIN, 11));
        textFieldRoomNumberPage1.setBounds(258, 128, 80, 20);
        panelPage1.add(textFieldRoomNumberPage1);
        textFieldRoomNumberPage1.setColumns(10);
        //PlainDocument doc = (PlainDocument) textFieldRoomNumberPage1.getDocument();
        //doc.setDocumentFilter(new IntDocumentFilter());
        
        JButton buttonCreateNewKeyLockPage1 = new JButton("Create New Key and Lock");
        buttonCreateNewKeyLockPage1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Create New Key and Lock");
                
                // Parse room number from matching TextField.
                String roomNumStr = textFieldRoomNumberPage1.getText();
                int roomNum = 0;
                
                if (!"".equals(roomNumStr)) {
                    try {
                        roomNum = Integer.parseInt(textFieldRoomNumberPage1.getText());
                    } catch (Exception e1) {
                        //e1.printStackTrace();
                    }
                }
                
                // Add new lock and key combo.
                try {
                    mainApp.addNewLock(roomNum);
                    lblMsgBoxPage1.setText(String.format("Added a Key and Lock to room #%s.   (Key ID: %s, Lock ID: %s)", roomNum, mainApp.keyCounter - 1, mainApp.lockCounter - 1));
                    lblMsgBoxPage1.setForeground(new Color(60, 179, 113));
                } catch (Exception e1) {
                    lblMsgBoxPage1.setText("Please set a room number between 101 and 300.");
                    lblMsgBoxPage1.setForeground(new Color(255, 0, 0));
                    //e1.printStackTrace();
                }
            }
        });
        buttonCreateNewKeyLockPage1.setFont(new Font("Tahoma", Font.PLAIN, 11));
        buttonCreateNewKeyLockPage1.setBackground(new Color(0, 196, 98));
        buttonCreateNewKeyLockPage1.setBounds(138, 151, 200, 29);
        panelPage1.add(buttonCreateNewKeyLockPage1);
        
        JButton buttonMapNewKeyPage1 = new JButton("Map New Key to Existing Lock");
        buttonMapNewKeyPage1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Map New Key to Existing Lock");
                setTableModelLocks(tableLocksPage2);
                
                
                int selectedRow = tableLocksPage2.getSelectedRow();
                
                if (selectedRow > -1) {
                    String val = tableLocksPage2.getValueAt(tableLocksPage2.getSelectedRow(), 0).toString();
                    int iVal = Integer.parseInt(val);
                    
                    setTableModelGivenLockShowKeys(tableKeysPage2, iVal);
                } else {
                    DefaultTableModel model = ((DefaultTableModel) tableKeysPage2.getModel());
                    model.setRowCount(0);
                }
                
                panelPage1.setVisible(false);
                panelPage2.setVisible(true);
            
            }
        });
        buttonMapNewKeyPage1.setFont(new Font("Tahoma", Font.PLAIN, 11));
        buttonMapNewKeyPage1.setBackground(new Color(0, 196, 98));
        buttonMapNewKeyPage1.setBounds(138, 211, 200, 28);
        panelPage1.add(buttonMapNewKeyPage1);
        
        JButton buttonMapExistingKeyPage1 = new JButton("Map Existing Key to Existing Lock");
        buttonMapExistingKeyPage1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Map Existing Key to Existing Lock");
                setTableModelKeys(tableKeysPage3);
                setTableModelLocks(tableLocksPage3);
                
                int selectedKey = tableKeysPage3.getSelectedRow();
                
                if (0 <= selectedKey && selectedKey <= tableKeysPage3.getRowCount() - 1) {
                    int keyID = Integer.parseInt(tableKeysPage3.getValueAt(selectedKey, 0).toString());
                    filterLocksPage3(keyID);
                } else {
                    rowSorterLocksPage3.setRowFilter(RowFilter.regexFilter("[^\\d+]", 0));
                }
                
                panelPage1.setVisible(false);
                panelPage3.setVisible(true);
            }
        });
        buttonMapExistingKeyPage1.setFont(new Font("Tahoma", Font.PLAIN, 11));
        buttonMapExistingKeyPage1.setBackground(new Color(0, 196, 98));
        buttonMapExistingKeyPage1.setBounds(138, 245, 200, 27);
        panelPage1.add(buttonMapExistingKeyPage1);
        
        JButton buttonDeleteKeyPage1 = new JButton("Delete Key/Lock Pairings");
        buttonDeleteKeyPage1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Delete a Key");
                setTableModelKeys(tableKeysPage4);
                
                int selected = tableKeysPage4.getSelectedRow();
                
                if (0 <= selected && selected <= tableLocksPage3.getRowCount() - 1) {
                    String val = tableKeysPage4.getValueAt(selected, 0).toString();
                    int iVal = Integer.parseInt(val);
                    
                    setTableModelGivenKeyShowLocks(tableLocksPage4, iVal);
                }
                
                panelPage1.setVisible(false);
                panelPage4.setVisible(true);
            }
        });
        buttonDeleteKeyPage1.setFont(new Font("Tahoma", Font.PLAIN, 11));
        buttonDeleteKeyPage1.setBackground(new Color(200, 20, 20));
        buttonDeleteKeyPage1.setBounds(138, 278, 200, 29);
        panelPage1.add(buttonDeleteKeyPage1);
        
        JButton buttonShowExistingKeysPage1 = new JButton("Show Existing Keys");
        buttonShowExistingKeysPage1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Show Existing Keys");
                setTableModelKeys(tableKeysPage5);
                
                panelPage1.setVisible(false);
                panelPage5.setVisible(true);
            }
        });
        buttonShowExistingKeysPage1.setFont(new Font("Tahoma", Font.PLAIN, 11));
        buttonShowExistingKeysPage1.setBackground(new Color(176, 196, 222));
        buttonShowExistingKeysPage1.setBounds(138, 338, 200, 28);
        panelPage1.add(buttonShowExistingKeysPage1);
        
        JButton buttonShowExistingLocksPage1 = new JButton("Show Existing Locks");
        buttonShowExistingLocksPage1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Show Existing Locks");
                setTableModelLocks(tableLocksPage6);
                
                panelPage1.setVisible(false);
                panelPage6.setVisible(true);
            }
        });
        buttonShowExistingLocksPage1.setFont(new Font("Tahoma", Font.PLAIN, 11));
        buttonShowExistingLocksPage1.setBackground(new Color(176, 196, 222));
        buttonShowExistingLocksPage1.setBounds(138, 372, 200, 29);
        panelPage1.add(buttonShowExistingLocksPage1); //*/
        
        ///*
        //=== Page 2 ===
        JLabel lblMsgBoxPage2 = new JLabel("");
        lblMsgBoxPage2.setHorizontalAlignment(SwingConstants.TRAILING);
        lblMsgBoxPage2.setForeground(new Color(60, 179, 113));
        lblMsgBoxPage2.setFont(new Font("Tahoma", Font.PLAIN, 11));
        lblMsgBoxPage2.setBounds(220, 341, 244, 14);
        panelPage2.add(lblMsgBoxPage2);
        
        JScrollPane scrollPaneLocksPage2 = new JScrollPane();
        scrollPaneLocksPage2.setBounds(10, 144, 200, 275);
        panelPage2.add(scrollPaneLocksPage2);
        
        tableLocksPage2 = new JTable();
        tableLocksPage2.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                //System.out.println(tableLocksPage2.getValueAt(tableLocksPage2.getSelectedRow(), 0).toString());
                String val = tableLocksPage2.getValueAt(tableLocksPage2.getSelectedRow(), 0).toString();
                int iVal = Integer.parseInt(val);
                
                setTableModelGivenLockShowKeys(tableKeysPage2, iVal);
                
            }
        });
        tableLocksPage2.setFont(new Font("Tahoma", Font.PLAIN, 11));
        tableLocksPage2.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        scrollPaneLocksPage2.setViewportView(tableLocksPage2);
        tableLocksPage2.setModel(new DefaultTableModel(
            new Object[][] {
                {null, null},
                {null, null},
            },
            new String[] {
                "Lock ID", "Room Number"
            }
        ) {
            private static final long serialVersionUID = 1L;
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableLocksPage2.getColumnModel().getColumn(0).setResizable(false);
        tableLocksPage2.getColumnModel().getColumn(1).setResizable(false);
        tableLocksPage2.getTableHeader().setReorderingAllowed(false);
        
        JLabel lblTableKeysDescPage2 = new JLabel("<html>\r\n<u>All Keys mapped to <br>\r\nSelected Lock ID#</u> \r\n</html>");
        lblTableKeysDescPage2.setFont(new Font("Tahoma", Font.BOLD, 11));
        lblTableKeysDescPage2.setBounds(264, 119, 200, 29);
        panelPage2.add(lblTableKeysDescPage2);
        
        JLabel lblTableLocksDescPage2 = new JLabel("<html>\r\n<u>Lock ID:</u> Left-click a Key ID below.\r\n</html>");
        lblTableLocksDescPage2.setFont(new Font("Tahoma", Font.BOLD, 11));
        lblTableLocksDescPage2.setBounds(10, 119, 200, 14);
        panelPage2.add(lblTableLocksDescPage2);
        
        JScrollPane scrollPaneKeysPage2 = new JScrollPane();
        scrollPaneKeysPage2.setBounds(264, 159, 200, 166);
        panelPage2.add(scrollPaneKeysPage2);
        
        tableKeysPage2 = new JTable();
        tableKeysPage2.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tableKeysPage2.setFont(new Font("Tahoma", Font.PLAIN, 11));
        scrollPaneKeysPage2.setViewportView(tableKeysPage2);
        tableKeysPage2.setModel(new DefaultTableModel(
            new Object[][] {
            },
            new String[] {
                "Key ID", "Key Type"
            }
        ) {
            private static final long serialVersionUID = 1L;
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableKeysPage2.getColumnModel().getColumn(0).setResizable(false);
        tableKeysPage2.getColumnModel().getColumn(1).setResizable(false);
        tableKeysPage2.getTableHeader().setReorderingAllowed(false);
        
        JLabel lblKeyTypePage2 = new JLabel("Key Type:");
        lblKeyTypePage2.setFont(new Font("Tahoma", Font.PLAIN, 11));
        lblKeyTypePage2.setHorizontalAlignment(SwingConstants.TRAILING);
        lblKeyTypePage2.setBounds(264, 366, 110, 14);
        panelPage2.add(lblKeyTypePage2);
        
        JComboBox<String> comboBoxKeyTypePage2 = new JComboBox<String>();
        comboBoxKeyTypePage2.setFont(new Font("Tahoma", Font.PLAIN, 11));
        comboBoxKeyTypePage2.setModel(new DefaultComboBoxModel<String>(new String[] {"Physical", "Card"}));
        comboBoxKeyTypePage2.setBounds(384, 362, 80, 22);
        panelPage2.add(comboBoxKeyTypePage2);
        
        JButton btnMapNewKeyPage2 = new JButton("Map New Key to Existing Lock");
        btnMapNewKeyPage2.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Map New Key to Existing Lock");
                
                // Parse keyType
                String keyType = comboBoxKeyTypePage2.getSelectedItem().toString();
                boolean keyTypeBool = false;
                if ("Physical".equals(keyType))
                    keyTypeBool = true;
                
                // Parse lockID
                int selected = tableLocksPage2.getSelectedRow();
                
                if (0 > selected || selected > tableLocksPage2.getRowCount() - 1) {
                    lblMsgBoxPage2.setText("Please select a Lock ID.");
                    lblMsgBoxPage2.setForeground(new Color(255, 0, 0));
                } else {
                
                    String lockIdStr = tableLocksPage2.getValueAt(tableLocksPage2.getSelectedRow(), 0).toString();
                    int lockID = Integer.parseInt(lockIdStr);
                    
                    // Map new key to existing lock
                    try {
                        mainApp.addNewKey(lockID, keyTypeBool);
                        lblMsgBoxPage2.setText(String.format("Mapped New Key #%s to Lock #%s.", mainApp.keyCounter - 1, lockID));
                        lblMsgBoxPage2.setForeground(new Color(60, 179, 113));
                    } catch (Exception e1) {
                        lblMsgBoxPage2.setText("That Lock ID does not exist.");
                        lblMsgBoxPage2.setForeground(new Color(255, 0, 0));
                        //e1.printStackTrace();
                    }
                    
                    String val = tableLocksPage2.getValueAt(tableLocksPage2.getSelectedRow(), 0).toString();
                    int iVal = Integer.parseInt(val);
                    
                    setTableModelGivenLockShowKeys(tableKeysPage2, iVal);
                    
                }
            }
        });
        btnMapNewKeyPage2.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnMapNewKeyPage2.setBackground(new Color(0, 196, 98));
        btnMapNewKeyPage2.setBounds(264, 391, 200, 29);
        panelPage2.add(btnMapNewKeyPage2);
        
        JLabel lblNamePage2 = new JLabel("Map New Key to Existing Lock");
        lblNamePage2.setHorizontalAlignment(SwingConstants.CENTER);
        lblNamePage2.setFont(new Font("Tahoma", Font.BOLD, 14));
        lblNamePage2.setBounds(10, 57, 454, 29);
        panelPage2.add(lblNamePage2);
        
        JSeparator separatorNamePage2 = new JSeparator();
        separatorNamePage2.setBounds(125, 84, 227, 2);
        panelPage2.add(separatorNamePage2);
        
        JButton btnGoBackPage2 = new JButton("Go Back");
        btnGoBackPage2.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Go Back");
                panelPage1.setVisible(true);
                panelPage2.setVisible(false);
            }
        });
        btnGoBackPage2.setBackground(UIManager.getColor("Button.background"));
        btnGoBackPage2.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnGoBackPage2.setBounds(10, 59, 100, 29);
        btnGoBackPage2.setIcon(new ImageIcon("images" + File.separator + "back-arrow-icon-23x23.png"));
        panelPage2.add(btnGoBackPage2); //*/
        
        setTableModelLocks(tableLocksPage2);
        
        ///*
        //=== Page 3 ===
        JLabel lblMsgBoxPage3 = new JLabel("");
        lblMsgBoxPage3.setHorizontalAlignment(SwingConstants.TRAILING);
        lblMsgBoxPage3.setForeground(new Color(60, 179, 113));
        lblMsgBoxPage3.setFont(new Font("Tahoma", Font.PLAIN, 11));
        lblMsgBoxPage3.setBounds(220, 361, 244, 29);
        panelPage3.add(lblMsgBoxPage3);
        
        JButton btnMapExistingKeyPage3 = new JButton("Map Existing Key to Existing Lock");
        btnMapExistingKeyPage3.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Map Existing Key to Existing Lock");
                
                // Parse keyID
                int selected = tableKeysPage3.getSelectedRow();
                int keyID = -1;
                
                if (0 > selected || selected > tableKeysPage3.getRowCount() - 1) {
                    lblMsgBoxPage3.setText("Please select a Key ID.");
                    lblMsgBoxPage3.setForeground(new Color(255, 0, 0));
                    return;
                } else {
                
                    String keyIdStr = tableKeysPage3.getValueAt(tableKeysPage3.getSelectedRow(), 0).toString();
                    keyID = Integer.parseInt(keyIdStr);
                }
                // Parse lockID
                selected = tableLocksPage3.getSelectedRow();
                int lockID = -1;
                
                if (0 > selected || selected > tableLocksPage3.getRowCount() - 1) {
                    lblMsgBoxPage3.setText("Please select a Lock ID.");
                    lblMsgBoxPage3.setForeground(new Color(255, 0, 0));
                    return;
                } else {
                
                    String lockIdStr = tableLocksPage3.getValueAt(tableLocksPage3.getSelectedRow(), 0).toString();
                    lockID = Integer.parseInt(lockIdStr);
                }
                
                // Map new key to existing lock
                try {
                    mainApp.addKey (keyID, lockID);
                    lblMsgBoxPage3.setText(String.format("Mapped Existing Key #%s to Lock #%s.", keyID, lockID));
                    lblMsgBoxPage3.setForeground(new Color(60, 179, 113));
                } catch (Exception e1) {
                    String msg = e1.getMessage();
                    msg = msg.split(":")[3];
                    lblMsgBoxPage3.setText(String.format("<html><div style=\"align=text-right;\">%s</div></html>",  msg));
                    lblMsgBoxPage3.setForeground(new Color(255, 0, 0));
                    //e1.printStackTrace();
                }
                
                setTableModelKeys(tableKeysPage3);
                setTableModelLocks(tableLocksPage3);
                
                selected = tableLocksPage3.getSelectedRow();
                
                // Filter Locks
                filterLocksPage3(keyID);
                
                // Restore selected row.
                if (0 <= selected && selected <= tableLocksPage3.getRowCount() - 1) {
                    tableLocksPage3.setRowSelectionInterval(selected, selected);
                } else if (tableLocksPage3.getRowCount() > 0 && selected > tableLocksPage3.getRowCount() - 1) {
                    tableLocksPage3.setRowSelectionInterval(tableLocksPage3.getRowCount() - 1, tableLocksPage3.getRowCount() - 1);
                }
            }
        });
        btnMapExistingKeyPage3.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnMapExistingKeyPage3.setBackground(new Color(0, 196, 98));
        btnMapExistingKeyPage3.setBounds(264, 391, 200, 29);
        panelPage3.add(btnMapExistingKeyPage3);
        
        JLabel lblNamePage3 = new JLabel("Map Existing Key to Existing Lock");
        lblNamePage3.setHorizontalAlignment(SwingConstants.CENTER);
        lblNamePage3.setFont(new Font("Tahoma", Font.BOLD, 14));
        lblNamePage3.setBounds(10, 57, 454, 29);
        panelPage3.add(lblNamePage3);
        
        JSeparator separatorNamePage3 = new JSeparator();
        separatorNamePage3.setBounds(125, 84, 227, 2);
        panelPage3.add(separatorNamePage3);
        
        JButton btnGoBackPage3 = new JButton("Go Back");
        btnGoBackPage3.setBackground(UIManager.getColor("Button.background"));
        btnGoBackPage3.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnGoBackPage3.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Go Back");
                panelPage1.setVisible(true);
                panelPage3.setVisible(false);
            }
        });
        btnGoBackPage3.setBounds(10, 59, 100, 29);
        btnGoBackPage3.setIcon(new ImageIcon("images" + File.separator + "back-arrow-icon-23x23.png"));
        panelPage3.add(btnGoBackPage3);
        
        JLabel lblTableLocksDescPage3 = new JLabel("<html>\r\n<u>Lock ID:</u> Left-click a Lock ID below.\r\n</html>");
        lblTableLocksDescPage3.setFont(new Font("Tahoma", Font.BOLD, 11));
        lblTableLocksDescPage3.setBounds(264, 119, 200, 14);
        panelPage3.add(lblTableLocksDescPage3);
        
        JScrollPane scrollPaneLocksPage3 = new JScrollPane();
        scrollPaneLocksPage3.setBounds(264, 144, 200, 211);
        panelPage3.add(scrollPaneLocksPage3);
        
        tableLocksPage3 = new JTable();
        tableLocksPage3.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tableLocksPage3.setFont(new Font("Tahoma", Font.PLAIN, 11));
        scrollPaneLocksPage3.setViewportView(tableLocksPage3);
        tableLocksPage3.setModel(new DefaultTableModel(
            new Object[][] {
            },
            new String[] {
                "Lock ID", "Room Number"
            }
        ) {
            private static final long serialVersionUID = 1L;
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableLocksPage3.getColumnModel().getColumn(0).setResizable(false);
        tableLocksPage3.getColumnModel().getColumn(1).setResizable(false);
        tableLocksPage3.getTableHeader().setReorderingAllowed(false);
        rowSorterLocksPage3 = new TableRowSorter<>(tableLocksPage3.getModel());
        tableLocksPage3.setRowSorter(rowSorterLocksPage3);
        
        JLabel lblTableKeysDescPage3 = new JLabel("<html>\r\n<u>Key ID:</u> Left-click a Key ID below.\r\n</html>");
        lblTableKeysDescPage3.setFont(new Font("Tahoma", Font.BOLD, 11));
        lblTableKeysDescPage3.setBounds(10, 119, 200, 14);
        panelPage3.add(lblTableKeysDescPage3);
        
        JScrollPane scrollPaneKeysPage3 = new JScrollPane();
        scrollPaneKeysPage3.setBounds(10, 144, 200, 276);
        panelPage3.add(scrollPaneKeysPage3);
        
        tableKeysPage3 = new JTable();
        tableKeysPage3.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                int selectedRow = tableKeysPage3.getSelectedRow();
                int keyID = Integer.parseInt(tableKeysPage3.getValueAt(selectedRow, 0).toString());
                
                // Filter Locks
                filterLocksPage3(keyID);
            }
        });
        tableKeysPage3.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tableKeysPage3.setFont(new Font("Tahoma", Font.PLAIN, 11));
        scrollPaneKeysPage3.setViewportView(tableKeysPage3);
        tableKeysPage3.setModel(new DefaultTableModel(
            new Object[][] {
                {null, null},
                {null, null},
            },
            new String[] {
                "Key ID", "Key Type"
            }
        ) {
            private static final long serialVersionUID = 1L;
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableKeysPage3.getColumnModel().getColumn(0).setResizable(false);
        tableKeysPage3.getColumnModel().getColumn(1).setResizable(false);
        tableKeysPage3.getTableHeader().setReorderingAllowed(false);
        
        ///*
        //=== Page 4 ===
        JLabel lblMsgBoxPage4 = new JLabel("");
        lblMsgBoxPage4.setForeground(new Color(60, 179, 113));
        lblMsgBoxPage4.setFont(new Font("Tahoma", Font.PLAIN, 11));
        lblMsgBoxPage4.setBounds(10, 361, 244, 29);
        panelPage4.add(lblMsgBoxPage4);
        
        JButton btnDeleteKeyPage4 = new JButton("Delete Selected Key/Lock Pair");
        btnDeleteKeyPage4.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Delete Selected Key");
                
                // Parse keyID
                int selected = tableKeysPage4.getSelectedRow();
                int keyID = -1;
                
                if (0 > selected || selected > tableKeysPage4.getRowCount() - 1) {
                    lblMsgBoxPage4.setText("Please select a Key ID.");
                    lblMsgBoxPage4.setForeground(new Color(255, 0, 0));
                    return;
                } else {
                
                    String keyIdStr = tableKeysPage4.getValueAt(tableKeysPage4.getSelectedRow(), 0).toString();
                    keyID = Integer.parseInt(keyIdStr);
                }
                // Parse lockID
                selected = tableLocksPage4.getSelectedRow();
                int lockID = -1;
                
                if (0 > selected || selected > tableLocksPage4.getRowCount() - 1) {
                    lblMsgBoxPage4.setText("Please select a Lock ID.");
                    lblMsgBoxPage4.setForeground(new Color(255, 0, 0));
                    return;
                } else {
                
                    String lockIdStr = tableLocksPage4.getValueAt(tableLocksPage4.getSelectedRow(), 0).toString();
                    lockID = Integer.parseInt(lockIdStr);
                }
                
                // Map new key to existing lock
                try {
                    mainApp.deleteKey (keyID, lockID);
                    lblMsgBoxPage4.setText(String.format("Deleted Key #%s and Lock #%s Pairing.", keyID, lockID));
                    lblMsgBoxPage4.setForeground(new Color(60, 179, 113));
                } catch (Exception e1) {
                    String msg = e1.getMessage();
                    msg = msg.split(":")[3];
                    lblMsgBoxPage4.setText(String.format("<html><div style=\"align=text-left;\">%s</div></html>",  msg));
                    lblMsgBoxPage4.setForeground(new Color(255, 0, 0));
                    //e1.printStackTrace();
                    return;
                }
                
                setTableModelKeys(tableKeysPage4);
                
                String val = tableKeysPage4.getValueAt(tableKeysPage4.getSelectedRow(), 0).toString();
                int iVal = Integer.parseInt(val);
                
                setTableModelGivenKeyShowLocks(tableLocksPage4, iVal);
                
            }
        });
        btnDeleteKeyPage4.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnDeleteKeyPage4.setBackground(new Color(200, 20, 20));
        btnDeleteKeyPage4.setBounds(10, 389, 200, 29);
        panelPage4.add(btnDeleteKeyPage4);
        
        JLabel lblNamePage4 = new JLabel("Delete a Key");
        lblNamePage4.setHorizontalAlignment(SwingConstants.CENTER);
        lblNamePage4.setFont(new Font("Tahoma", Font.BOLD, 14));
        lblNamePage4.setBounds(10, 57, 454, 29);
        panelPage4.add(lblNamePage4);
        
        JSeparator separatorNamePage4 = new JSeparator();
        separatorNamePage4.setBounds(125, 84, 227, 2);
        panelPage4.add(separatorNamePage4);
        
        JButton btnGoBackPage4 = new JButton("Go Back");
        btnGoBackPage4.setBackground(UIManager.getColor("Button.background"));
        btnGoBackPage4.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnGoBackPage4.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Go Back");
                panelPage1.setVisible(true);
                panelPage4.setVisible(false);
            }
        });
        btnGoBackPage4.setBounds(10, 59, 100, 29);
        btnGoBackPage4.setIcon(new ImageIcon("images" + File.separator + "back-arrow-icon-23x23.png"));
        panelPage4.add(btnGoBackPage4);
        
        JLabel lblTableLocksDescPage4 = new JLabel("<html>\r\n<u>All Locks mapped to <br>\r\nSelected Key ID#</u> <br>\r\nLeft-click a Lock ID below.\r\n</html>");
        lblTableLocksDescPage4.setFont(new Font("Tahoma", Font.BOLD, 11));
        lblTableLocksDescPage4.setBounds(264, 119, 200, 43);
        panelPage4.add(lblTableLocksDescPage4);
        
        JScrollPane scrollPaneLocksPage4 = new JScrollPane();
        scrollPaneLocksPage4.setBounds(264, 170, 200, 250);
        panelPage4.add(scrollPaneLocksPage4);
        
        tableLocksPage4 = new JTable();
        tableLocksPage4.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tableLocksPage4.setFont(new Font("Tahoma", Font.PLAIN, 11));
        scrollPaneLocksPage4.setViewportView(tableLocksPage4);
        tableLocksPage4.setModel(new DefaultTableModel(
            new Object[][] {
            },
            new String[] {
                "Lock ID", "Room Number"
            }
        ) {
            private static final long serialVersionUID = 1L;
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableLocksPage4.getColumnModel().getColumn(0).setResizable(false);
        tableLocksPage4.getColumnModel().getColumn(1).setResizable(false);
        tableLocksPage4.getTableHeader().setReorderingAllowed(false);
        
        JLabel lblTableKeysDescPage4 = new JLabel("<html>\r\n<u>Key ID:</u> Left-click a Key ID below.\r\n</html>");
        lblTableKeysDescPage4.setFont(new Font("Tahoma", Font.BOLD, 11));
        lblTableKeysDescPage4.setBounds(10, 119, 200, 14);
        panelPage4.add(lblTableKeysDescPage4);
        
        JScrollPane scrollPaneKeysPage4 = new JScrollPane();
        scrollPaneKeysPage4.setBounds(10, 144, 200, 211);
        panelPage4.add(scrollPaneKeysPage4);
        
        tableKeysPage4 = new JTable();
        tableKeysPage4.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                String val = tableKeysPage4.getValueAt(tableKeysPage4.getSelectedRow(), 0).toString();
                int iVal = Integer.parseInt(val);
                
                setTableModelGivenKeyShowLocks(tableLocksPage4, iVal);
            }
        });
        tableKeysPage4.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tableKeysPage4.setFont(new Font("Tahoma", Font.PLAIN, 11));
        scrollPaneKeysPage4.setViewportView(tableKeysPage4);
        tableKeysPage4.setModel(new DefaultTableModel(
            new Object[][] {
                {null, null},
                {null, null},
            },
            new String[] {
                "Key ID", "Key Type"
            }
        ) {
            private static final long serialVersionUID = 1L;
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableKeysPage4.getColumnModel().getColumn(0).setResizable(false);
        tableKeysPage4.getColumnModel().getColumn(1).setResizable(false);
        tableKeysPage4.getTableHeader().setReorderingAllowed(false);//*/
        
        ///*
        //=== Page 5 ===
        JLabel lblPageNamePage5 = new JLabel("Keys Information");
        lblPageNamePage5.setHorizontalAlignment(SwingConstants.CENTER);
        lblPageNamePage5.setFont(new Font("Tahoma", Font.BOLD, 14));
        lblPageNamePage5.setBounds(10, 57, 454, 29);
        panelPage5.add(lblPageNamePage5);
        
        JSeparator separatorNamePage5 = new JSeparator();
        separatorNamePage5.setBounds(125, 84, 227, 2);
        panelPage5.add(separatorNamePage5);
        
        JButton btnGoBackPage5 = new JButton("Go Back");
        btnGoBackPage5.setBackground(UIManager.getColor("Button.background"));
        btnGoBackPage5.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnGoBackPage5.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Go Back");
                panelPage1.setVisible(true);
                panelPage5.setVisible(false);
            }
        });
        btnGoBackPage5.setBounds(10, 59, 100, 29);
        btnGoBackPage5.setIcon(new ImageIcon("images" + File.separator + "back-arrow-icon-23x23.png"));
        panelPage5.add(btnGoBackPage5);
        
        JLabel lblTableLocksDescPage5 = new JLabel("<html>\r\n<u>All Locks mapped to <br>\r\nSelected Key ID#</u> \r\n</html>");
        lblTableLocksDescPage5.setFont(new Font("Tahoma", Font.BOLD, 11));
        lblTableLocksDescPage5.setBounds(264, 119, 200, 29);
        panelPage5.add(lblTableLocksDescPage5);
        
        JScrollPane scrollPaneLocksPage5 = new JScrollPane();
        scrollPaneLocksPage5.setBounds(264, 159, 200, 259);
        panelPage5.add(scrollPaneLocksPage5);
        
        tableLocksPage5 = new JTable();
        tableLocksPage5.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tableLocksPage5.setFont(new Font("Tahoma", Font.PLAIN, 11));
        scrollPaneLocksPage5.setViewportView(tableLocksPage5);
        tableLocksPage5.setModel(new DefaultTableModel(
            new Object[][] {
            },
            new String[] {
                "Lock ID", "Room Number"
            }
        ) {
            private static final long serialVersionUID = 1L;
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableLocksPage5.getColumnModel().getColumn(0).setResizable(false);
        tableLocksPage5.getColumnModel().getColumn(1).setResizable(false);
        tableLocksPage5.getTableHeader().setReorderingAllowed(false);
        
        JLabel lblTableKeysDescPage5 = new JLabel("<html>\r\n<u>Key ID:</u> Left-click a Key ID below.\r\n</html>");
        lblTableKeysDescPage5.setFont(new Font("Tahoma", Font.BOLD, 11));
        lblTableKeysDescPage5.setBounds(10, 119, 200, 14);
        panelPage5.add(lblTableKeysDescPage5);
        
        JScrollPane scrollPaneKeysPage5 = new JScrollPane();
        scrollPaneKeysPage5.setBounds(10, 144, 200, 274);
        panelPage5.add(scrollPaneKeysPage5);
        
        tableKeysPage5 = new JTable();
        tableKeysPage5.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                String val = tableKeysPage5.getValueAt(tableKeysPage5.getSelectedRow(), 0).toString();
                int iVal = Integer.parseInt(val);
                
                setTableModelGivenKeyShowLocks(tableLocksPage5, iVal);
            }
        });
        tableKeysPage5.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tableKeysPage5.setFont(new Font("Tahoma", Font.PLAIN, 11));
        scrollPaneKeysPage5.setViewportView(tableKeysPage5);
        tableKeysPage5.setModel(new DefaultTableModel(
            new Object[][] {
                {null, null},
                {null, null},
            },
            new String[] {
                "Key ID", "Key Type"
            }
        ) {
            private static final long serialVersionUID = 1L;
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableKeysPage5.getColumnModel().getColumn(0).setResizable(false);
        tableKeysPage5.getColumnModel().getColumn(1).setResizable(false);
        tableKeysPage5.getTableHeader().setReorderingAllowed(false);//*/
        
        ///*
        //=== Page 6 ===
        JLabel lblNamePage6 = new JLabel("Locks Information");
        lblNamePage6.setHorizontalAlignment(SwingConstants.CENTER);
        lblNamePage6.setFont(new Font("Tahoma", Font.BOLD, 14));
        lblNamePage6.setBounds(10, 57, 454, 29);
        panelPage6.add(lblNamePage6);
        
        JSeparator separatorNamePage6 = new JSeparator();
        separatorNamePage6.setBounds(125, 84, 227, 2);
        panelPage6.add(separatorNamePage6);
        
        JButton btnGoBackPage6 = new JButton("Go Back");
        btnGoBackPage6.setBackground(UIManager.getColor("Button.background"));
        btnGoBackPage6.setFont(new Font("Tahoma", Font.PLAIN, 11));
        btnGoBackPage6.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //System.out.println("Go Back");
                panelPage1.setVisible(true);
                panelPage6.setVisible(false);
            }
        });
        btnGoBackPage6.setBounds(10, 59, 100, 29);
        btnGoBackPage6.setIcon(new ImageIcon("images" + File.separator + "back-arrow-icon-23x23.png"));
        panelPage6.add(btnGoBackPage6);
        
        JLabel lblTableLocksDescPage6 = new JLabel("<html>\r\n<u>All Keys mapped to <br>\r\nSelected Lock ID#</u> \r\n</html>");
        lblTableLocksDescPage6.setFont(new Font("Tahoma", Font.BOLD, 11));
        lblTableLocksDescPage6.setBounds(264, 119, 200, 29);
        panelPage6.add(lblTableLocksDescPage6);
        
        JScrollPane scrollPaneLocksPage6 = new JScrollPane();
        scrollPaneLocksPage6.setBounds(10, 144, 200, 274);
        panelPage6.add(scrollPaneLocksPage6);
        
        tableLocksPage6 = new JTable();
        tableLocksPage6.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseReleased(MouseEvent e) {
                String val = tableLocksPage6.getValueAt(tableLocksPage6.getSelectedRow(), 0).toString();
                int iVal = Integer.parseInt(val);
                
                setTableModelGivenLockShowKeys(tableKeysPage6, iVal);
            }
        });
        tableLocksPage6.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tableLocksPage6.setFont(new Font("Tahoma", Font.PLAIN, 11));
        scrollPaneLocksPage6.setViewportView(tableLocksPage6);
        tableLocksPage6.setModel(new DefaultTableModel(
            new Object[][] {
                {null, null},
                {null, null},
            },
            new String[] {
                "Lock ID", "Room Number"
            }
        ) {
            private static final long serialVersionUID = 1L;
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableLocksPage6.getColumnModel().getColumn(0).setResizable(false);
        tableLocksPage6.getColumnModel().getColumn(1).setResizable(false);
        tableLocksPage6.getTableHeader().setReorderingAllowed(false);
        
        JLabel lblTableKeysDescPage6 = new JLabel("<html>\r\n<u>Lock ID:</u> Left-click a Key ID below.\r\n</html>");
        lblTableKeysDescPage6.setFont(new Font("Tahoma", Font.BOLD, 11));
        lblTableKeysDescPage6.setBounds(10, 119, 200, 14);
        panelPage6.add(lblTableKeysDescPage6);
        
        JScrollPane scrollPaneKeysPage6 = new JScrollPane();
        scrollPaneKeysPage6.setBounds(264, 159, 200, 259);
        panelPage6.add(scrollPaneKeysPage6);
        
        tableKeysPage6 = new JTable();
        tableKeysPage6.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        tableKeysPage6.setFont(new Font("Tahoma", Font.PLAIN, 11));
        scrollPaneKeysPage6.setViewportView(tableKeysPage6);
        tableKeysPage6.setModel(new DefaultTableModel(
            new Object[][] {
            },
            new String[] {
                "Key ID", "Key Type"
            }
        ) {
            private static final long serialVersionUID = 1L;
            boolean[] columnEditables = new boolean[] {
                false, false
            };
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
        tableKeysPage6.getColumnModel().getColumn(0).setResizable(false);
        tableKeysPage6.getColumnModel().getColumn(1).setResizable(false);
        tableKeysPage6.getTableHeader().setReorderingAllowed(false);//*/
        
        // Set Tables
        setTableModelKeys(tableKeysPage3);
        setTableModelKeys(tableKeysPage4);
        setTableModelKeys(tableKeysPage5);
        setTableModelLocks(tableLocksPage6);
        
        // Set these pages to not be visible.
        panelPage2.setVisible(false);
        panelPage3.setVisible(false);
        panelPage4.setVisible(false);
        panelPage5.setVisible(false);
        panelPage6.setVisible(false);
    }
    
    //======================
    //=== HELPER METHODS ===
    private void setTableModelKeys(JTable table) {
        // Get Keys
        HashSet<Key1> keys = mainApp.getAllKeys();
        
        Key1[] arrKeys = new Key1[keys.size()];
        keys.toArray(arrKeys);
        
        Arrays.sort(arrKeys);
        
        // Clear Table Model and store previous selection
        int selectedRow = table.getSelectedRow();
        
        DefaultTableModel model = ((DefaultTableModel) table.getModel());
        model.setRowCount(0);
        
        // Insert Keys into Table Model
        for (int i = 0; i < arrKeys.length; i++) {
            Key1 tKey = arrKeys[i];
            int tID = tKey.getID();
            boolean tType = tKey.getType();
            
            String tTypeStr;
            if (true == tType) {
                HashSet<Lock1> tLocks;
                try {
                    tLocks = mainApp.searchLocksOpenedByGivenKey(tID);
                } catch (Exception e) {
                    tLocks = null;
                    e.printStackTrace();
                }
                
                if (null != tLocks && tLocks.size() > 1)
                    tTypeStr = "Physical (Master)";
                else
                    tTypeStr = "Physical";
                
            } else {
                tTypeStr = "Card";
            }
            
            // Insert
            model = ((DefaultTableModel) table.getModel());
            model.addRow(new Object[] {String.valueOf(tID), tTypeStr});
        }
        
        // Restore selected row.
        if (0 <= selectedRow && selectedRow <= table.getRowCount() - 1) {
            table.setRowSelectionInterval(selectedRow, selectedRow);
        } else if (table.getRowCount() > 0 && selectedRow > table.getRowCount() - 1) {
            table.setRowSelectionInterval(table.getRowCount() - 1, table.getRowCount() - 1);
        }
    }
    
    private void setTableModelLocks(JTable table) {
        // Get Locks
        HashSet<Lock1> locks = mainApp.getAllLocks();
        
        Lock1[] arrLocks = new Lock1[locks.size()];
        locks.toArray(arrLocks);
        
        Arrays.sort(arrLocks);
        
        // Clear Table Model and store previous selection
        int selectedRow = table.getSelectedRow();
        
        DefaultTableModel model = ((DefaultTableModel) table.getModel());
        model.setRowCount(0);
        
        // Insert Locks into Table Model
        for (int i = 0; i < arrLocks.length; i++) {
            Lock1 lock = arrLocks[i];
            int tID = lock.getID();
            int tRoomNumber = lock.getRoomNumber();
            
            // Insert
            model = ((DefaultTableModel) table.getModel());
            model.addRow(new Object[] {String.valueOf(tID), String.valueOf(tRoomNumber)});
        }
        
        // Restore selected row.
        if (0 <= selectedRow && selectedRow <= table.getRowCount() - 1) {
            table.setRowSelectionInterval(selectedRow, selectedRow);
        } else if (table.getRowCount() > 0 && selectedRow > table.getRowCount() - 1) {
            table.setRowSelectionInterval(table.getRowCount() - 1, table.getRowCount() - 1);
        }
    }
    
    private void setTableModelGivenKeyShowLocks(JTable table, int keyID) {
        // Get Combos
        HashSet<KeyLock> combos = mainApp.getAllCombos();
        
        KeyLock[] arrCombos = new KeyLock[combos.size()];
        combos.toArray(arrCombos);
        
        Arrays.sort(arrCombos);
        
        // Get Locks
        HashSet<Lock1> locks = mainApp.getAllLocks();
        
        Lock1[] arrLocks = new Lock1[locks.size()];
        locks.toArray(arrLocks);
        
        Arrays.sort(arrLocks);
        
        // Add locks ID connected to keyID.
        ArrayList<Integer> lockIDs = new ArrayList<Integer>();
        
        for (int i = 0; i < arrCombos.length; i++) {
            int tKeyID = arrCombos[i].getKeyID();
            int tLockID = arrCombos[i].getLockID();
            
            if (tKeyID == keyID) {
                lockIDs.add(tLockID);
            }
        }
        
        // Clear Table Model and store previous selection
        int selectedRow = table.getSelectedRow();
        
        DefaultTableModel model = ((DefaultTableModel) table.getModel());
        model.setRowCount(0);
        
        // Insert Locks into Table Model
        for (int i = 0; i < arrLocks.length; i++) {
            Lock1 tLock = arrLocks[i];
            int tID = tLock.getID();
            int tRoomNumber = tLock.getRoomNumber();
            
            if (lockIDs.contains(tLock.getID())) {
                // Insert
                model = ((DefaultTableModel) table.getModel());
                model.addRow(new Object[] {String.valueOf(tID), String.valueOf(tRoomNumber)});
            }
        }
        
        // Restore selected row.
        if (0 <= selectedRow && selectedRow <= table.getRowCount() - 1) {
            table.setRowSelectionInterval(selectedRow, selectedRow);
        } else if (table.getRowCount() > 0 && selectedRow > table.getRowCount() - 1) {
            table.setRowSelectionInterval(table.getRowCount() - 1, table.getRowCount() - 1);
        }
    }
    
    private void setTableModelGivenLockShowKeys(JTable table, int lockID) {
        // Get Combos
        HashSet<KeyLock> combos = mainApp.getAllCombos();
        
        KeyLock[] arrCombos = new KeyLock[combos.size()];
        combos.toArray(arrCombos);
        
        Arrays.sort(arrCombos);
        
        // Get Keys
        HashSet<Key1> keys = mainApp.getAllKeys();
        
        Key1[] arrKeys = new Key1[keys.size()];
        keys.toArray(arrKeys);
        
        Arrays.sort(arrKeys);
        
        // Add locks ID connected to keyID.
        ArrayList<Integer> keyIDs = new ArrayList<Integer>();
        
        for (int i = 0; i < arrCombos.length; i++) {
            int tKeyID = arrCombos[i].getKeyID();
            int tLockID = arrCombos[i].getLockID();
            
            if (tLockID == lockID) {
                keyIDs.add(tKeyID);
            }
        }
        
        // Clear Table Model and store previous selection
        int selectedRow = table.getSelectedRow();
        
        DefaultTableModel model = ((DefaultTableModel) table.getModel());
        model.setRowCount(0);
        
        // Insert Keys into Table Model
        for (int i = 0; i < arrKeys.length; i++) {
            Key1 tKey = arrKeys[i];
            int tID = tKey.getID();
            boolean tType = tKey.getType();
            
            String tTypeStr;
            if (true == tType) {
                HashSet<Lock1> tLocks;
                try {
                    tLocks = mainApp.searchLocksOpenedByGivenKey(tID);
                } catch (Exception e) {
                    tLocks = null;
                    e.printStackTrace();
                }
                
                if (null != tLocks && tLocks.size() > 1)
                    tTypeStr = "Physical (Master)";
                else
                    tTypeStr = "Physical";
                
            } else {
                tTypeStr = "Card";
            }
            
            // Insert
            if (keyIDs.contains(tKey.getID())) {
                // Insert
                model = ((DefaultTableModel) table.getModel());
                model.addRow(new Object[] {String.valueOf(tID), tTypeStr});
            }

        }
        
        // Restore selected row.
        if (0 <= selectedRow && selectedRow <= table.getRowCount() - 1) {
            table.setRowSelectionInterval(selectedRow, selectedRow);
        } else if (table.getRowCount() > 0 && selectedRow > table.getRowCount() - 1) {
            table.setRowSelectionInterval(table.getRowCount() - 1, table.getRowCount() - 1);
        }
    }
    
    private void filterLocksPage3(int keyID) {
        HashSet<Lock1> locks;
        try {
            locks = mainApp.searchLocksOpenedByGivenKey(keyID);
            
        } catch (Exception e1) {
            rowSorterLocksPage3.setRowFilter(RowFilter.regexFilter("[\\d]", 0));
            return;
        }
        
        HashSet<Integer> ints = new HashSet<Integer>();
        
        Iterator<Lock1> it = locks.iterator();
        while(it.hasNext()){
            Lock1 lock = it.next();
            ints.add(lock.getID());
        }
        
        if (ints.iterator().hasNext()) {
            
            String regex = "^(?!.*(";
            Iterator<Integer> it2 = ints.iterator();
            while(it2.hasNext()){
                int next = it2.next();
                if (it2.hasNext())
                    regex += String.valueOf(next) + "|";
                else
                    regex += String.valueOf(next);
            }
            regex += ")).*$";
            
            rowSorterLocksPage3.setRowFilter(RowFilter.regexFilter(regex, 0));
        } else {
            rowSorterLocksPage3.setRowFilter(RowFilter.regexFilter("[\\d]", 0));
        }
    }
    
    //=======================
    //=== PRIVATE CLASSES ===
    /**
     * This class extends a <code>DocumentFilter</code>. <br>
     * <code>IntDocumentFilter</code> filters <code>Integers</code> for 
     *      any object that uses this class.<br><br>
     * 
     * <u>Example Use of this Class:</u><br>
     * <code>
     *      JTextField textField = new JTextField(10);<br><br>
     *      
     *      JPanel panel = new JPanel();<br>
     *      panel.add(textField);<br>
     *      PlainDocument doc = (PlainDocument) textField.getDocument();<br>
     *      doc.setDocumentFilter(new IntDocumentFilter());<br><br>
     *      
     *      JOptionPane.showMessageDialog(null, panel);
     * </code>
     */
    private class IntDocumentFilter extends DocumentFilter {
        @Override
        public void insertString(FilterBypass fb, int offset, String string, AttributeSet attr)
                throws BadLocationException {

            Document doc = fb.getDocument();
            StringBuilder sb = new StringBuilder();
            sb.append(doc.getText(0, doc.getLength()));
            sb.insert(offset, string);

            if (test(sb.toString())) {
                super.insertString(fb, offset, string, attr);
            } else {
                // warn the user and don't allow the insert
            }
        }

        private boolean test(String text) {
            try {
                Integer.parseInt(text);
                return true;
            } catch (NumberFormatException e) {
                if ("".equals(text))
                    return true;
                else
                    return false;
            }
        }

        @Override
        public void replace(FilterBypass fb, int offset, int length, String text, AttributeSet attrs)
                throws BadLocationException {

            Document doc = fb.getDocument();
            StringBuilder sb = new StringBuilder();
            sb.append(doc.getText(0, doc.getLength()));
            sb.replace(offset, offset + length, text);

            if (test(sb.toString())) {
                super.replace(fb, offset, length, text, attrs);
            } else {
                // warn the user and don't allow the insert
            }

        }

        @Override
        public void remove(FilterBypass fb, int offset, int length) throws BadLocationException {
            Document doc = fb.getDocument();
            StringBuilder sb = new StringBuilder();
            sb.append(doc.getText(0, doc.getLength()));
            sb.delete(offset, offset + length);

            if (test(sb.toString())) {
                super.remove(fb, offset, length);
            } else {
                // warn the user and don't allow the insert
            }

        }
    }
    
}
