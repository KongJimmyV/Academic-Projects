import java.awt.EventQueue;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.SystemColor;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.JSeparator;
import javax.swing.UIManager;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JComboBox;
import javax.imageio.ImageIO;
import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JTextField;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;
import javax.swing.RowFilter;
import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.Document;
import javax.swing.text.DocumentFilter;
import javax.swing.text.PlainDocument;
import javax.swing.JTextPane;
import javax.swing.JLayeredPane;
import javax.swing.JInternalFrame;
import java.awt.CardLayout;
import java.awt.FlowLayout;
import javax.swing.JTextArea;
import java.time.DayOfWeek;

public class CovidGUI {

	private CovidApp mainApp;
	
	private int currentRegistrationNumber = 0;
	
	private JFrame covidTestFrame;
	private JTextField firstNameTF;
	private JTextField lastNameTF;
	private JTextField emailTF;
	private JTextField phoneTF;
	private JComboBox comboBoxHasCovid;
	private JTextField textField;
	private JTextField regNumberTF;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTextField textField_4;
	private JTextField textField_5;
	private JTextField textField_6;
	private JTextField textField_7;
	private JTextField textField_8;
	private JTextField textField_9;
	private JTextField textField_10;
	private JTextField textField_11;
	private JTextField textField_12;
	private JTextField textField_13;
	private JTextField textField_14;
	private JLabel lblNewLabel_10;
	private JButton btnPosAppointment;
	private JButton btnPosHome;
	
	public static void main (String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					CovidGUI window = new CovidGUI();
					window.covidTestFrame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	public CovidGUI() throws SQLException {
		initialize();
	}
	
	
	
	private void initialize() throws SQLException {
		mainApp = new CovidApp();
		
		//Initialize Main Frame
		covidTestFrame = new JFrame();
		covidTestFrame.getContentPane().setLocation(-112, -125);
		covidTestFrame.getContentPane().setLayout(new CardLayout(0, 0));
		
		JPanel mainScreen = new JPanel();
		mainScreen.setLayout(null);
		covidTestFrame.getContentPane().add(mainScreen, "name_97044216737200");
		
		JPanel register = new JPanel();
		covidTestFrame.getContentPane().add(register, "name_97473554547200");
		register.setLayout(null);
		
		JPanel createAppointment = new JPanel();
		covidTestFrame.getContentPane().add(createAppointment, "name_103886822101400");
		createAppointment.setLayout(null);
		
		JPanel confirmDetails = new JPanel();
		covidTestFrame.getContentPane().add(confirmDetails, "name_106997511069400");
		
		JPanel testResults = new JPanel();
		covidTestFrame.getContentPane().add(testResults, "name_107043205790900");
		
		JPanel registrationNumber = new JPanel();
		covidTestFrame.getContentPane().add(registrationNumber, "name_101351577540100");
		registrationNumber.setLayout(null);
		
		JLabel lblNewLabel_5 = new JLabel("Create Appointment");
		lblNewLabel_5.setBounds(124, 5, 228, 28);
		lblNewLabel_5.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_5.setFont(new Font("Arial", Font.BOLD, 24));
		createAppointment.add(lblNewLabel_5);
		
		JLabel lblNewLabel_6 = new JLabel("Please choose the date and time of your test:");
		lblNewLabel_6.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_6.setBounds(56, 43, 363, 22);
		createAppointment.add(lblNewLabel_6);
		
		JComboBox comboBox_1 = new JComboBox();
		comboBox_1.setModel(new DefaultComboBoxModel(new String[] {"01 - January", "02 - February", "03 - March", "04 - April", "05 - May", "06 - June", "07 - July", "08 - August", "09 - September", "10 - October", "11 - November", "12 - December"}));
		comboBox_1.setFont(new Font("Arial", Font.PLAIN, 18));
		comboBox_1.setBounds(5, 122, 142, 21);
		createAppointment.add(comboBox_1);
		
		JComboBox comboBox_2 = new JComboBox();
		comboBox_2.setFont(new Font("Arial", Font.PLAIN, 18));
		comboBox_2.setModel(new DefaultComboBoxModel(new String[] {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"}));
		comboBox_2.setBounds(152, 122, 55, 21);
		createAppointment.add(comboBox_2);
		
		JComboBox comboBox_3 = new JComboBox();
		comboBox_3.setFont(new Font("Arial", Font.PLAIN, 18));
		comboBox_3.setModel(new DefaultComboBoxModel(new String[] {"2019", "2020", "2021", "2022", "2023", "2024", "2025"}));
		comboBox_3.setBounds(232, 122, 89, 21);
		createAppointment.add(comboBox_3);
		
		JComboBox comboBox_4 = new JComboBox();
		comboBox_4.setModel(new DefaultComboBoxModel(new String[] {"10:00 A.M.", "10:30 A.M.", "11:00 A.M.", "11:30 A.M.", "12:00 P.M.", "12:30 P.M.", "1:00 P.M.", "1:30 P.M.", "2:00 P.M."}));
		comboBox_4.setFont(new Font("Arial", Font.PLAIN, 18));
		comboBox_4.setBounds(346, 122, 122, 21);
		createAppointment.add(comboBox_4);
		
		JLabel lblNewLabel_6_1 = new JLabel("Month:");
		lblNewLabel_6_1.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_6_1.setBounds(25, 99, 61, 22);
		createAppointment.add(lblNewLabel_6_1);
		
		JLabel lblNewLabel_6_1_1 = new JLabel("Day:");
		lblNewLabel_6_1_1.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_6_1_1.setBounds(152, 99, 61, 22);
		createAppointment.add(lblNewLabel_6_1_1);
		
		JLabel lblNewLabel_6_1_2 = new JLabel("Year:");
		lblNewLabel_6_1_2.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_6_1_2.setBounds(232, 99, 61, 22);
		createAppointment.add(lblNewLabel_6_1_2);
		
		JLabel lblNewLabel_6_1_3 = new JLabel("Time:");
		lblNewLabel_6_1_3.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_6_1_3.setBounds(346, 99, 61, 22);
		createAppointment.add(lblNewLabel_6_1_3);
		
		JButton btnConfirmCreate = new JButton("Confirm");
		btnConfirmCreate.setForeground(new Color(255, 255, 255));
		btnConfirmCreate.setBackground(new Color(0, 128, 0));
		btnConfirmCreate.setFont(new Font("Arial", Font.PLAIN, 18));
		btnConfirmCreate.setBounds(282, 243, 102, 21);
		createAppointment.add(btnConfirmCreate);
		btnConfirmCreate.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
                String firstName = firstNameTF.getText();
                String lastName = lastNameTF.getText();
                String uwlEmailAddress = emailTF.getText();
                String phoneNumber = phoneTF.getText();
                String strHasCovidSymptoms = comboBoxHasCovid.getSelectedItem().toString();

                String month = comboBox_1.getSelectedItem().toString();
                month = month.split(" ")[0];
                String day = comboBox_2.getSelectedItem().toString();
                String year = comboBox_3.getSelectedItem().toString();
                
                String time = comboBox_4.getSelectedItem().toString();
                String date = month + "/" + day + "/" + year;
                
                try {

                    mainApp.validateAppointmentTime(date, time);

                } catch (SQLException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                    return;

                } catch (Exception e1) {
                    // TODO Auto-generated catch block
                    // e1.printStackTrace();

                    String msg = e1.getMessage();
                    msg = msg.split(":")[3];

                    // show error message
                    JOptionPane.showMessageDialog(covidTestFrame, msg, "Error", JOptionPane.ERROR_MESSAGE);
                    return;
                }
                
                textField_2.setText(firstName);
                textField_3.setText(lastName);
                textField_4.setText(uwlEmailAddress);
                textField_5.setText(phoneNumber);
                textField_6.setText(strHasCovidSymptoms);
                textField_7.setText(date + " " + time);
                
                textField_8.setText(firstName);
                textField_9.setText(lastName);
                textField_10.setText(uwlEmailAddress);
                textField_11.setText(phoneNumber);
                textField_12.setText(strHasCovidSymptoms);
                textField_13.setText(date + " " + time);
                
                createAppointment.setVisible(false);
                confirmDetails.setVisible(true);
			}
		});
		
		JButton btnCancelCreate = new JButton("Cancel");
		btnCancelCreate.setForeground(Color.WHITE);
		btnCancelCreate.setBackground(Color.RED);
		btnCancelCreate.setFont(new Font("Arial", Font.PLAIN, 18));
		btnCancelCreate.setBounds(90, 245, 102, 21);
		createAppointment.add(btnCancelCreate);
		btnCancelCreate.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				createAppointment.setVisible(false);
				mainScreen.setVisible(true);
			}
		});
			
		JLabel lblNewLabel = new JLabel("UWL Covid Testing");
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("Arial", Font.BOLD, 24));
		lblNewLabel.setBounds(119, 10, 237, 28);
		mainScreen.add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("Press the button below to register for a test:");
		lblNewLabel_1.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_1.setBounds(63, 131, 350, 28);
		mainScreen.add(lblNewLabel_1);
		
		JButton registerBtn = new JButton("Register");
		registerBtn.setForeground(new Color(255, 255, 255));
		registerBtn.setBackground(new Color(128, 128, 128));
		registerBtn.setFont(new Font("Arial", Font.PLAIN, 16));
		registerBtn.setBounds(184, 169, 108, 28);
		mainScreen.add(registerBtn);
		registerBtn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				mainScreen.setVisible(false);
				register.setVisible(true);
				//registrationNumber.setVisible(true);
				
                //-- reset textfields --//
                firstNameTF.setText("");
                lastNameTF.setText("");
                emailTF.setText("");
                phoneTF.setText("");
                comboBoxHasCovid.setSelectedIndex(0);
			}		
		});
		
		JLabel lblNewLabel_2 = new JLabel("Already registered?");
		lblNewLabel_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_2.setBounds(159, 218, 158, 28);
		mainScreen.add(lblNewLabel_2);
		
		JLabel lblNewLabel_3 = new JLabel("Enter your registration number to create an appointment");
		lblNewLabel_3.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_3.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_3.setBounds(5, 244, 466, 28);
		mainScreen.add(lblNewLabel_3);
		
		JButton createApptBtn = new JButton("Create Appointment");
		createApptBtn.setForeground(new Color(255, 255, 255));
		createApptBtn.setBackground(new Color(128, 128, 128));
		createApptBtn.setFont(new Font("Arial", Font.PLAIN, 16));
		createApptBtn.setBounds(246, 288, 185, 28);
		mainScreen.add(createApptBtn);
		createApptBtn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
                try {
                    
                    currentRegistrationNumber = Integer.parseInt(textField.getText());
                    
                    //-- Make sure that it's already registered number.
                    ResultSet rs = mainApp.searchRegistrationNumber(textField.getText());
                    
                    if (!rs.next()) {
                        throw new java.lang.Exception ("That registration number is not registered.");
                    }
                    
                } catch (NumberFormatException e1) { 
                    JOptionPane.showMessageDialog(covidTestFrame, "Invalid Input: Please enter only digits.", "Error", JOptionPane.ERROR_MESSAGE);
                    return;
                    
                } catch (Exception e1) {
                    // TODO Auto-generated catch block
                    //e1.printStackTrace();
                    
                    String msg = e1.getMessage();
                    
                    // show error message
                    JOptionPane.showMessageDialog(covidTestFrame, msg, "Error", JOptionPane.ERROR_MESSAGE);
                    return;
                }
                
                mainScreen.setVisible(false);
                createAppointment.setVisible(true);
			}
		});
		
		textField = new JTextField();
		textField.setBounds(44, 288, 158, 28);
		mainScreen.add(textField);
		textField.setColumns(10);
		
		JLabel registerLabel = new JLabel("Register");
		registerLabel.setBounds(189, 10, 97, 37);
		registerLabel.setFont(new Font("Arial", Font.BOLD, 24));
		register.add(registerLabel);
		
		JPanel form = new JPanel();
		form.setBounds(26, 135, 424, 192);
		register.add(form);
		form.setLayout(null);
		
		JLabel firstNameLabel = new JLabel("First Name:");
		firstNameLabel.setBounds(120, 0, 94, 24);
		form.add(firstNameLabel);
		firstNameLabel.setHorizontalAlignment(SwingConstants.TRAILING);
		firstNameLabel.setFont(new Font("Arial", Font.PLAIN, 18));
		
		JLabel lblLastName = new JLabel("Last Name:");
		lblLastName.setBounds(120, 30, 94, 24);
		form.add(lblLastName);
		lblLastName.setHorizontalAlignment(SwingConstants.TRAILING);
		lblLastName.setFont(new Font("Arial", Font.PLAIN, 18));
		
		firstNameTF = new JTextField();
		firstNameTF.setFont(new Font("Arial", Font.PLAIN, 18));
		firstNameTF.setBounds(224, 0, 200, 24);
		form.add(firstNameTF);
		firstNameTF.setColumns(10);
		
		lastNameTF = new JTextField();
		lastNameTF.setFont(new Font("Arial", Font.PLAIN, 18));
		lastNameTF.setBounds(224, 30, 200, 24);
		form.add(lastNameTF);
		lastNameTF.setColumns(10);
		
		JLabel lblUwlEmail = new JLabel("UWL Email:");
		lblUwlEmail.setBounds(107, 60, 107, 24);
		form.add(lblUwlEmail);
		lblUwlEmail.setHorizontalAlignment(SwingConstants.TRAILING);
		lblUwlEmail.setFont(new Font("Arial", Font.PLAIN, 18));
		
		emailTF = new JTextField();
		emailTF.setFont(new Font("Arial", Font.PLAIN, 18));
		emailTF.setBounds(224, 60, 200, 24);
		form.add(emailTF);
		emailTF.setColumns(10);
		
		JLabel lblPhoneNumber = new JLabel("Phone Number:");
		lblPhoneNumber.setBounds(44, 90, 170, 24);
		form.add(lblPhoneNumber);
		lblPhoneNumber.setHorizontalAlignment(SwingConstants.TRAILING);
		lblPhoneNumber.setFont(new Font("Arial", Font.PLAIN, 18));
		
		phoneTF = new JTextField();
		phoneTF.setBounds(224, 90, 200, 24);
		form.add(phoneTF);
		phoneTF.setFont(new Font("Arial", Font.PLAIN, 18));
		phoneTF.setColumns(10);
		
		comboBoxHasCovid = new JComboBox();
		comboBoxHasCovid.setBounds(359, 120, 65, 24);
		form.add(comboBoxHasCovid);
		comboBoxHasCovid.setModel(new DefaultComboBoxModel(new String[] {"Yes", "No"}));
		comboBoxHasCovid.setFont(new Font("Arial", Font.PLAIN, 18));
		
		JLabel lblExperiencingCovidSymptroms = new JLabel("Experiencing COVID Symptroms?:");
		lblExperiencingCovidSymptroms.setBounds(0, 120, 349, 24);
		form.add(lblExperiencingCovidSymptroms);
		lblExperiencingCovidSymptroms.setHorizontalAlignment(SwingConstants.TRAILING);
		lblExperiencingCovidSymptroms.setFont(new Font("Arial", Font.PLAIN, 18));
		
		JButton btnCompleteRegistration = new JButton("Register");
		btnCompleteRegistration.setBackground(new Color(0, 128, 0));
		btnCompleteRegistration.setForeground(Color.WHITE);
		btnCompleteRegistration.setFont(new Font("Arial", Font.PLAIN, 18));
		btnCompleteRegistration.setBounds(307, 154, 117, 27);
		form.add(btnCompleteRegistration);
		btnCompleteRegistration.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
			    
				String firstName = firstNameTF.getText();
				String lastName = lastNameTF.getText();
				String uwlEmailAddress = emailTF.getText();
				String phoneNumber = phoneTF.getText();
				String strHasCovidSymptoms = comboBoxHasCovid.getSelectedItem().toString();
				boolean hasCovidSymptoms = "Yes".equals(strHasCovidSymptoms) ? true : false;
				
				//System.out.println(String.format("%s %s %s %s %b", firstName, lastName, uwlEmailAddress, phoneNumber, hasCovidSymptoms));
				
				// Register For Covid Testing
				int registrationNum = -1;
				try {
				    
				    registrationNum = mainApp.registerForCovidTesting(firstName, lastName, uwlEmailAddress, phoneNumber, hasCovidSymptoms);
                
				}  catch (SQLException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                    return;
                    
                } catch (Exception e1) {
                    // TODO Auto-generated catch block
                    //e1.printStackTrace();
                    
                    String msg = e1.getMessage();
                    msg = msg.split(":")[3];
                    
                    // show error message
                    JOptionPane.showMessageDialog(covidTestFrame, msg, "Error", JOptionPane.ERROR_MESSAGE);
                    return;
                }
				
				//-- success --//
				//System.out.println(registrationNum);
                registrationNumber.setVisible(true);
                register.setVisible(false);
                //form.setVisible(false);
                
                // show reg num
                regNumberTF.setText(String.valueOf(registrationNum));
                
                // set reg num
                currentRegistrationNumber = registrationNum;
			}
		});
		
		JButton btnCancel = new JButton("Cancel");
		btnCancel.setForeground(Color.WHITE);
		btnCancel.setBackground(Color.RED);
		btnCancel.setFont(new Font("Arial", Font.PLAIN, 18));
		btnCancel.setBounds(10, 154, 117, 27);
		form.add(btnCancel);
		btnCancel.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				mainScreen.setVisible(true);
				register.setVisible(false);
			}
		});

		JLabel titleLabel = new JLabel("Registration Complete");
		titleLabel.setBounds(110, 10, 255, 40);
		titleLabel.setFont(new Font("Arial", Font.BOLD, 24));
		registrationNumber.add(titleLabel);
		
		JLabel lblNewLabel_4 = new JLabel("You have successfully registered for COVID testing.");
		lblNewLabel_4.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_4.setBounds(29, 100, 418, 22);
		registrationNumber.add(lblNewLabel_4);
		
		JLabel lblNewLabel_4_1 = new JLabel("Your registration number is:");
		lblNewLabel_4_1.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_4_1.setBounds(29, 132, 221, 22);
		registrationNumber.add(lblNewLabel_4_1);
		
		regNumberTF = new JTextField();
		regNumberTF.setEditable(false);
		regNumberTF.setBounds(260, 132, 187, 22);
		registrationNumber.add(regNumberTF);
		regNumberTF.setColumns(10);
		
		JTextArea txtRegistrationComplete = new JTextArea();
		txtRegistrationComplete.setEditable(false);
		txtRegistrationComplete.setWrapStyleWord(true);
		txtRegistrationComplete.setLineWrap(true);
		txtRegistrationComplete.setBackground(Color.WHITE);
		txtRegistrationComplete.setFont(new Font("Arial", Font.PLAIN, 18));
		txtRegistrationComplete.setText("Please write down or save this number.\r\nYou will be asked to present this number when checking in for your tests.\r\n\r\nClick the \"Create Appointment\" button below in order to create an appointment for a test, or click the \"Home\" button to return to the home screen");
		txtRegistrationComplete.setBounds(10, 179, 456, 164);
		registrationNumber.add(txtRegistrationComplete);
		
		JButton btnHome = new JButton("Home");
		btnHome.setBackground(new Color(128, 128, 128));
		btnHome.setForeground(new Color(255, 255, 255));
		btnHome.setFont(new Font("Arial", Font.PLAIN, 18));
		btnHome.setBounds(51, 353, 117, 27);
		registrationNumber.add(btnHome);
		btnHome.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				mainScreen.setVisible(true);
				registrationNumber.setVisible(false);
			}
		});
		
		JButton btnCreateAppointment = new JButton("Create Appointment");
		btnCreateAppointment.setForeground(new Color(255, 255, 255));
		btnCreateAppointment.setBackground(new Color(0, 128, 0));
		btnCreateAppointment.setFont(new Font("Arial", Font.PLAIN, 18));
		btnCreateAppointment.setBounds(219, 353, 206, 27);
		registrationNumber.add(btnCreateAppointment);
		btnCreateAppointment.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				createAppointment.setVisible(true);
				registrationNumber.setVisible(false);
			}
		});
		confirmDetails.setLayout(null);
		
		JLabel confirmTitle = new JLabel("Are the details below correct?");
		confirmTitle.setBounds(64, 10, 347, 22);
		confirmTitle.setFont(new Font("Arial", Font.BOLD, 24));
		confirmDetails.add(confirmTitle);
		
		JPanel confirmForm = new JPanel();
		confirmForm.setBounds(92, 97, 292, 124);
		confirmDetails.add(confirmForm);
		confirmForm.setLayout(null);
		
		JLabel lblNewLabel_9 = new JLabel("First Name:");
		lblNewLabel_9.setBounds(0, 2, 94, 15);
		confirmForm.add(lblNewLabel_9);
		lblNewLabel_9.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9.setFont(new Font("Arial", Font.PLAIN, 18));
		
		JLabel lblNewLabel_9_1 = new JLabel("Last Name:");
		lblNewLabel_9_1.setBounds(0, 23, 94, 15);
		confirmForm.add(lblNewLabel_9_1);
		lblNewLabel_9_1.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_1.setFont(new Font("Arial", Font.PLAIN, 18));
		
		JLabel lblNewLabel_9_1_1 = new JLabel("Email: ");
		lblNewLabel_9_1_1.setBounds(0, 44, 94, 15);
		confirmForm.add(lblNewLabel_9_1_1);
		lblNewLabel_9_1_1.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_1_1.setFont(new Font("Arial", Font.PLAIN, 18));
		
		JLabel lblNewLabel_9_1_1_1 = new JLabel("Phone: ");
		lblNewLabel_9_1_1_1.setBounds(0, 65, 94, 15);
		confirmForm.add(lblNewLabel_9_1_1_1);
		lblNewLabel_9_1_1_1.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_1_1_1.setFont(new Font("Arial", Font.PLAIN, 18));
		
		JLabel lblNewLabel_9_1_1_2 = new JLabel("Symptoms:");
		lblNewLabel_9_1_1_2.setBounds(0, 86, 94, 15);
		confirmForm.add(lblNewLabel_9_1_1_2);
		lblNewLabel_9_1_1_2.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_1_1_2.setFont(new Font("Arial", Font.PLAIN, 18));
		
		JLabel lblNewLabel_9_1_1_3 = new JLabel("Date: ");
		lblNewLabel_9_1_1_3.setBounds(0, 107, 94, 15);
		confirmForm.add(lblNewLabel_9_1_1_3);
		lblNewLabel_9_1_1_3.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_1_1_3.setFont(new Font("Arial", Font.PLAIN, 18));
		
		textField_2 = new JTextField();
		textField_2.setEditable(false);
		textField_2.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_2.setBounds(104, 0, 188, 19);
		textField_2.setColumns(10);
		confirmForm.add(textField_2);
		
		textField_3 = new JTextField();
		textField_3.setEditable(false);
		textField_3.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_3.setBounds(104, 21, 188, 19);
        textField_3.setColumns(10);
		confirmForm.add(textField_3);
		
		textField_4 = new JTextField();
		textField_4.setEditable(false);
		textField_4.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_4.setBounds(104, 42, 188, 19);
		textField_4.setColumns(10);
		confirmForm.add(textField_4);
		
		textField_5 = new JTextField();
		textField_5.setEditable(false);
		textField_5.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_5.setBounds(104, 63, 188, 19);
		textField_5.setColumns(10);
		confirmForm.add(textField_5);
		
		textField_6 = new JTextField();
		textField_6.setEditable(false);
		textField_6.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_6.setBounds(104, 84, 188, 19);
	    textField_6.setColumns(10);
		confirmForm.add(textField_6);

		
		textField_7 = new JTextField();
		textField_7.setEditable(false);
		textField_7.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_7.setBounds(104, 105, 188, 19);
		textField_7.setColumns(10);
		confirmForm.add(textField_7);
		
		JButton btnConfirm = new JButton("Check In\r\n");
		btnConfirm.setForeground(new Color(255, 255, 255));
		btnConfirm.setBackground(new Color(0, 128, 0));
		btnConfirm.setFont(new Font("Arial", Font.PLAIN, 18));
		btnConfirm.setBounds(277, 284, 117, 27);
		confirmDetails.add(btnConfirm);
		btnConfirm.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
			    
                //===== Create appointment
                String month = comboBox_1.getSelectedItem().toString();
                month = month.split(" ")[0];
                String day = comboBox_2.getSelectedItem().toString();
                String year = comboBox_3.getSelectedItem().toString();
                
                String time = comboBox_4.getSelectedItem().toString();
                String date = month + "/" + day + "/" + year;
                
                int registrationNum = currentRegistrationNumber;
                
                try {
                    
                    mainApp.createAppointment(registrationNum, date, time);
                    
                } catch (SQLException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                    return;
                    
                } catch (Exception e1) {
                    // TODO Auto-generated catch block
                    //e1.printStackTrace();
                    
                    String msg = e1.getMessage();
                    msg = msg.split(":")[3];
                    
                    // show error message
                    JOptionPane.showMessageDialog(covidTestFrame, msg, "Error", JOptionPane.ERROR_MESSAGE);
                    
                    // go back to previous page
                    createAppointment.setVisible(true);
                    confirmDetails.setVisible(false);
                    return;
                }
                
                //====== Check-In
                boolean testResult = false;
                
                try {
                    
                    testResult = mainApp.checkIn(registrationNum);
                    
                } catch (SQLException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                    return;
                    
                } catch (Exception e1) {
                    // TODO Auto-generated catch block
                    //e1.printStackTrace();
                    
                    String msg = e1.getMessage();
                    msg = msg.split(":")[3];
                    
                    // show error message
                    JOptionPane.showMessageDialog(covidTestFrame, msg, "Error", JOptionPane.ERROR_MESSAGE);
                    return;
                }
                
                // Display Test Results.
                //
                // Had no symptoms and test result is Negative      no need for another appointment
                // Had no symptoms and test result is Positive      should get an appointment a week later
                // Had symptoms and test result is Negative         no need for another appointment
                // Had symptoms and test result is Positive         should get an appointment within a week
                //
                String strHasCovidSymptoms = comboBoxHasCovid.getSelectedItem().toString();
                boolean hasCovidSymptoms = "Yes".equals(strHasCovidSymptoms) ? true : false;
                
                if (hasCovidSymptoms == true) {
                    if (testResult == true) { 
                        // Had symptoms and test result is Positive should get an appointment within a week
                        textField_14.setText("Positive.");
                        lblNewLabel_10.setText("<html>\r\nA new appointment is recommended <br>\r\nwithin the next week. \r\n</html>");
                        
                        btnPosAppointment.setVisible(true);
                        btnPosHome.setVisible(false);
                    } else {
                        // Had symptoms and test result is Negative no need for another appointment
                        textField_14.setText("Negative.");
                        lblNewLabel_10.setText("No new appointment is needed.");
                        
                        btnPosAppointment.setVisible(false);
                        btnPosHome.setVisible(true);
                    }
                } else {
                    if (testResult) { 
                        // Had no symptoms and test result is Positive should get an appointment a week later
                        textField_14.setText("Positive.");
                        lblNewLabel_10.setText("<html>\r\nA new appointment is recommended <br>\r\nlater next week. \r\n</html>");
                        
                        btnPosAppointment.setVisible(true);
                        btnPosHome.setVisible(false);
                    } else {
                        // Had no symptoms and test result is Negative no need for another appointment
                        textField_14.setText("Negative.");
                        lblNewLabel_10.setText("No new appointment is needed.");
                        
                        btnPosAppointment.setVisible(false);
                        btnPosHome.setVisible(true);
                    }
                }
                
                // Change pages
                confirmDetails.setVisible(false);
                testResults.setVisible(true);
			}
		});
		
		JButton confirmCancel = new JButton("Cancel");
		confirmCancel.setBackground(new Color(255, 0, 0));
		confirmCancel.setForeground(Color.WHITE);
		confirmCancel.setFont(new Font("Arial", Font.PLAIN, 18));
		confirmCancel.setBounds(80, 284, 117, 27);
		confirmDetails.add(confirmCancel);
		confirmCancel.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				confirmDetails.setVisible(false);
				mainScreen.setVisible(true);
			}
		});
		testResults.setLayout(null);
				
		JLabel lblNewLabel_8 = new JLabel("Test Results");
		lblNewLabel_8.setBounds(166, 10, 143, 28);
		lblNewLabel_8.setFont(new Font("Arial", Font.BOLD, 24));
		testResults.add(lblNewLabel_8);
		
		JPanel confirmForm_1 = new JPanel();
		confirmForm_1.setLayout(null);
		confirmForm_1.setBounds(92, 95, 292, 124);
		testResults.add(confirmForm_1);
		
		JLabel lblNewLabel_9_2 = new JLabel("First Name:");
		lblNewLabel_9_2.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_2.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_9_2.setBounds(0, 2, 94, 15);
		confirmForm_1.add(lblNewLabel_9_2);
		
		JLabel lblNewLabel_9_1_2 = new JLabel("Last Name:");
		lblNewLabel_9_1_2.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_1_2.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_9_1_2.setBounds(0, 23, 94, 15);
		confirmForm_1.add(lblNewLabel_9_1_2);
		
		JLabel lblNewLabel_9_1_1_4 = new JLabel("Email: ");
		lblNewLabel_9_1_1_4.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_1_1_4.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_9_1_1_4.setBounds(0, 44, 94, 15);
		confirmForm_1.add(lblNewLabel_9_1_1_4);
		
		JLabel lblNewLabel_9_1_1_1_1 = new JLabel("Phone: ");
		lblNewLabel_9_1_1_1_1.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_1_1_1_1.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_9_1_1_1_1.setBounds(0, 65, 94, 15);
		confirmForm_1.add(lblNewLabel_9_1_1_1_1);
		
		JLabel lblNewLabel_9_1_1_2_1 = new JLabel("Symptoms:");
		lblNewLabel_9_1_1_2_1.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_1_1_2_1.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_9_1_1_2_1.setBounds(0, 86, 94, 15);
		confirmForm_1.add(lblNewLabel_9_1_1_2_1);
		
		JLabel lblNewLabel_9_1_1_3_1 = new JLabel("Date: ");
		lblNewLabel_9_1_1_3_1.setHorizontalAlignment(SwingConstants.TRAILING);
		lblNewLabel_9_1_1_3_1.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_9_1_1_3_1.setBounds(0, 107, 94, 15);
		confirmForm_1.add(lblNewLabel_9_1_1_3_1);
		
		textField_8 = new JTextField();
		textField_8.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_8.setEditable(false);
		textField_8.setColumns(10);
		textField_8.setBounds(104, 0, 188, 19);
		confirmForm_1.add(textField_8);
		
		textField_9 = new JTextField();
		textField_9.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_9.setEditable(false);
		textField_9.setColumns(10);
		textField_9.setBounds(104, 21, 188, 19);
		confirmForm_1.add(textField_9);
		
		textField_10 = new JTextField();
		textField_10.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_10.setEditable(false);
		textField_10.setColumns(10);
		textField_10.setBounds(104, 42, 188, 19);
		confirmForm_1.add(textField_10);
		
		textField_11 = new JTextField();
		textField_11.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_11.setEditable(false);
		textField_11.setColumns(10);
		textField_11.setBounds(104, 63, 188, 19);
		confirmForm_1.add(textField_11);
		
		textField_12 = new JTextField();
		textField_12.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_12.setEditable(false);
		textField_12.setColumns(10);
		textField_12.setBounds(104, 84, 188, 19);
		confirmForm_1.add(textField_12);
		
		textField_13 = new JTextField();
		textField_13.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_13.setEditable(false);
		textField_13.setColumns(10);
		textField_13.setBounds(104, 105, 188, 19);
		confirmForm_1.add(textField_13);
		
		JLabel lblNewLabel_7 = new JLabel("Test Results:");
		lblNewLabel_7.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_7.setBounds(90, 240, 110, 19);
		testResults.add(lblNewLabel_7);
		
		textField_14 = new JTextField();
		textField_14.setFont(new Font("Arial", Font.PLAIN, 18));
		textField_14.setBounds(290, 240, 96, 19);
		textField_14.setEditable(false);
		testResults.add(textField_14);
		textField_14.setColumns(10);
		
		lblNewLabel_10 = new JLabel("A new appointment is recommended within the next week");
		lblNewLabel_10.setFont(new Font("Arial", Font.PLAIN, 18));
		lblNewLabel_10.setBounds(40, 284, 456, 35);
		testResults.add(lblNewLabel_10);
		
		btnPosAppointment = new JButton("Create Appointment");
		btnPosAppointment.setForeground(new Color(255, 255, 255));
		btnPosAppointment.setBackground(new Color(0, 128, 0));
		btnPosAppointment.setFont(new Font("Arial", Font.PLAIN, 18));
		btnPosAppointment.setBounds(138, 330, 200, 25);
		testResults.add(btnPosAppointment);
		btnPosAppointment.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				testResults.setVisible(false);
				createAppointment.setVisible(true);
			}
		});
		
        btnPosHome = new JButton("Back to Home Page");
        btnPosHome.setBackground(new Color(128, 128, 128));
        btnPosHome.setForeground(new Color(255, 255, 255));
        btnPosHome.setFont(new Font("Arial", Font.PLAIN, 18));
        btnPosHome.setBounds(138, 330, 200, 25);
        testResults.add(btnPosHome);
        btnPosHome.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // TODO Auto-generated method stub
                mainScreen.setVisible(true);
                testResults.setVisible(false);
            }
        });
		
		covidTestFrame.setTitle("UWL Covid-19 Testing");
		covidTestFrame.setResizable(false);
		covidTestFrame.setBounds(100, 100, 490, 490);
        covidTestFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
	}
}
