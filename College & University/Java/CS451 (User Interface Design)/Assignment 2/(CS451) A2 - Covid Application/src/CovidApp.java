/**
 * Covid App
 * @author Kong Jimmy Vang
 */

import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.File;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class CovidApp {
    
    //=== Class variables. ===//
    private String dbName = "UserData";
    private Connection myConn = null;
    private String sqliteServer = "jdbc:sqlite:";
    private String dbAbsoluteFilePath = String.format("%s", "database" + File.separator + dbName + ".db");
    private String resetPath = "";
    
    private String email = "";
    private boolean isLoggedIn = false;
    private boolean isAdmin = false;
    
    //=== Constructors. ===//
    public CovidApp() throws SQLException {
        getConnection();
    }
    
    //=== Methods. ===//
    private boolean isValidPassword(String password) {
        int min = 8;
        int max = 24;
        int digit = 0;
        int special = 0;
        int upCount = 0;
        int loCount = 0;

        if (password.length() >= min && password.length() <= max) {
            for (int i = 0; i < password.length(); i++) {
                char c = password.charAt(i);
                if (Character.isUpperCase(c)) {
                    upCount++;
                }
                if (Character.isLowerCase(c)) {
                    loCount++;
                }
                if (Character.isDigit(c)) {
                    digit++;
                }
                if (c >= 33 && c <= 46 || c == 64) {
                    special++;
                }
            }
            if (special >= 1 && loCount >= 1 && upCount >= 1 && digit >= 1) {
                System.out.println(" Password is good.");
            }

        }

        if (password.length() < min) {

            for (int i = 0; i < password.length(); i++) {
                char c = password.charAt(i);
                if (Character.isLowerCase(c)) {
                    loCount++;
                }
            }

            if (loCount > 0) {
                System.out.println(" Password must be at least " + min + " characters.");
                System.out.println(" You need at least one upper case character.");
                System.out.println(" You need at least one digit.");
                System.out.println(" You need at least one special character.");
                return false;
            }
        } else if (password.length() < min && upCount > 1) {
            for (int i = 0; i < password.length(); i++) {
                char c = password.charAt(i);
                if (Character.isLowerCase(c)) {
                    loCount++;
                }
                if (Character.isUpperCase(c)) {
                    upCount++;
                }
            }
            if (loCount > 0 && upCount > 0) {
                System.out.println(" Password must be at least " + min + " characters.");
                System.out.println(" You need at least one digit.");
                System.out.println(" You need at least one special character.");
                return false;
            }
        }
        if (password.length() > max || password.length() >= max && upCount > 1 && loCount > 1 && digit > 1) {
            System.out.println(" Password is too long. Limit is " + max + " characters.");
            System.out.println(" You need at least one special character.");
            return false;
        }
        if (password.length() >= min && password.length() <= max && loCount > 0 && upCount > 0 && digit > 0
                && special == 0) {
            System.out.println(" You need at least a special character.");
            return false;
        }
        if (password.length() >= min && password.length() <= max && loCount > 0 && upCount > 0 && digit == 0
                && special == 0) {
            System.out.println(" You need at least one digit.");
            System.out.println(" You need at least one special character.");
            return false;
        }
        
        return true;
    }
    
    private boolean databaseExists() {
        File dbFile = new File(dbAbsoluteFilePath);
        return dbFile.exists();
    }
    
    private void getConnection() throws SQLException {
        //String getFilePath = new File("").getAbsolutePath();
        
        if (databaseExists()) {
            myConn = DriverManager.getConnection(sqliteServer + dbAbsoluteFilePath);
        } else {
            createNewDatabase(dbName);
        }
    }
    
    private void createNewDatabase(String fileName) throws SQLException {
        resetPath = dbAbsoluteFilePath;
        
        Connection conn;
        conn = DriverManager.getConnection(sqliteServer + dbAbsoluteFilePath);
        if (conn != null) {
            DatabaseMetaData meta = conn.getMetaData();
            Statement statement = conn.createStatement();
            statement.executeQuery(
                    "CREATE TABLE Users ("
                    + "    UserType         TEXT,"
                    + "    UwlEmailAddress  TEXT,"
                    + "    Password         TEXT,"
                    + "    PRIMARY KEY(UwlEmailAddress)"
                    + ");"
                );
            statement.executeQuery(
                    "CREATE TABLE Registrations ("
                    + "    RegistrationID   INT,"
                    + "    IsInvalid        BOOLEAN,"
                    + "    FirstName        TEXT,"
                    + "    LastName         TEXT,"
                    + "    UwlEmailAddress  TEXT,"
                    + "    PhoneNumber      TEXT,"
                    + "    HasCovidSymptoms BOOLEAN"
                    + "    PRIMARY KEY(RegistrationID)"
                    + ");"
                );
            statement.executeQuery(
                    "CREATE TABLE Appointments ("
                    + "    RegistrationID   INT,"
                    + "    Date             TEXT"
                    + "    Time             TEXT"
                    + "    TestResult       BOOLEAN,"
                    + "    PRIMARY KEY(RegistrationID)"
                    + ");"
                );
        }
        
    }
    
    /**
     * Registers a user for testing with the given parameters.<br><br>
     * 
     * Successful scenario:<br>
     *      1. User submits the 5 input parameters above.<br>
     *      2. The UWL email address is validated against the UWL directory to see if the address
     *          exists. Display a warning to the user if this validation fails.<br>
     *      3. The phone number is validated for 10 digits of input. Display a warning to the user if this
     *          validation fails.<br>
     *      4. Try to generate a valid registration number. (Invoke use case # "COVID-R2", method "createRegistrationNumber()").<br>
     *      5. If all validation and generation are successful, display a message that registration has
     *          been completed. Also display the generated registration number.<br>
     *          
     * @param firstName         The user's first name
     * @param lastName          The user's second name
     * @param uwlEmailAddress   The user's UWL email address
     * @param phoneNumber       The user's phone number
     * @param hasCovidSymptoms  If true, then the user has COVID symptoms. Otherwise false.
     * 
     * @return Returns a integer registration number.
     * 
     * @throws java.lang.Exception when input parameters are invalid.
     */
    public int registerForCovidTesting(String firstName, String lastName, String uwlEmailAddress, String phoneNumber, boolean hasCovidSymptoms) throws Exception {
        //--- Verify input. ---//
        if (!firstName.matches("[a-zA-Z]+")) {
            throw new java.lang.Exception (" CovidApp::registerForCovidTesting: The first name must contain only a-z or A-Z.");
        }
        if (!lastName.matches("[a-zA-Z]+")) {
            throw new java.lang.Exception (" CovidApp::registerForCovidTesting: The last name must contain only a-z or A-Z.");
        }
        
        Pattern emailPattern = Pattern.compile("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}");
        Matcher emailMat = emailPattern.matcher(uwlEmailAddress);
        if (!emailMat.matches()) {
            throw new java.lang.Exception (" CovidApp::registerForCovidTesting: Invalid email address format. Please type a valid format. (example.name@uwlax.edu)");
        }
        
        if ( !(phoneNumber.matches("[0-9]+") && phoneNumber.length() > 2) ) {
            throw new java.lang.Exception (" CovidApp::registerForCovidTesting: The phone number must contain only numbers 0-9.");
        }
        if (phoneNumber.length() != 10) {
            throw new java.lang.Exception (" CovidApp::registerForCovidTesting: The phone number must be 10 digits.");
        }
        
        //-- Check if email exists in directory --//
        String sqlQuery = String.format("SELECT UwlEmailAddress FROM Users "
                                        + "WHERE UwlEmailAddress = ?");

        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setString(1, uwlEmailAddress);
        
        ResultSet rs = pstmt.executeQuery();

        if (!rs.next()) {
            throw new java.lang.Exception (" CovidApp::login: That email does not exist in the UWL directory.");
        }
        
        //-- Get registrationId --//
        int registrationId = createRegistrationNumber();
        
        //-- Insert registration into database. --//
        sqlQuery = String.format("INSERT INTO Registrations "
                          + "(RegistrationID, IsInvalid, FirstName, LastName, "
                          + "UwlEmailAddress, PhoneNumber, HasCovidSymptoms) "
                          + "VALUES (?, ?, ?, ?, ?, ?, ?)");
        
        pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setInt(1, registrationId);
        pstmt.setBoolean(2, false);
        pstmt.setString(3, firstName);
        pstmt.setString(4, lastName);
        pstmt.setString(5, uwlEmailAddress);
        pstmt.setString(6, phoneNumber);
        pstmt.setBoolean(7, hasCovidSymptoms);
        
        pstmt.executeUpdate();
        
        return registrationId;
    }
    
    /**
     * Creates and generates a registration number.<br><br>
     * 
     * Successful scenario:<br>
     *      1. On invocation, try to generate a registration number.<br>
     *      2. Check if that registration number is unique and does not exist for another registered user.
     *          If that number exists, attempt to regenerate a new registration number.<br>
     *      3. If the registration number is unique, return a registration number.<br>
     * 
     * @return Returns a integer registration number.
     * 
     * @throws SQLException SQL related exceptions.
     */
    private int createRegistrationNumber() throws SQLException {
        //-- Generate registration number. --//
        Random rand = new Random();
        int num = rand.nextInt(1000000000);
        
        //-- Verify that number is unique only for active registrations. --//
        String sqlQuery = String.format("SELECT RegistrationID "
                                        + "FROM Registrations "
                                        + "WHERE RegistrationID = ?");

        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setInt(1, num);
        
        ResultSet rs = pstmt.executeQuery();
        
        //-- If a registration number already exists in the registrations, then try again.
        if (rs.next()) {
            num = createRegistrationNumber();
        }
        
        //-- Return registration number. --//
        return num;
    }
    
    /**
     * Login a user to the system.<br><br>
     * 
     * Successful scenario:<br>
     *      1. User submits two input parameters.<br>
     *      2. Both parameters are validated in the UWL directory for format and completeness.<br>
     *      3. If both parameters are valid, the user is shown if they are registered for testing. Also
     *          show their test results and display their appointment if they have already registered or
     *          have been tested.<br>
     * 
     * @param uwlEmailAddress   The user's UWL email address
     * @param password          The user's password.
     * 
     * @return Returns a integer registration number.
     * 
     * @throws java.lang.Exception when input parameters are invalid.
     */
    public void login(String uwlEmailAddress, String password) throws Exception {
        //--- Verify input. ---//
        Pattern emailPattern = Pattern.compile("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}");
        Matcher emailMat = emailPattern.matcher(uwlEmailAddress);
        if (!emailMat.matches()) {
            throw new java.lang.Exception (" CovidApp::login: Invalid email address format. Please type a valid format. (example.name@uwlax.edu)");
        }
        
        if (!isValidPassword(password)) {
            throw new java.lang.Exception (" CovidApp::login: Invalid password format.");
        }
        
        //-- Connect to database --//
        getConnection();
        
        //--- Check if email exists in directory. ---//
        String sqlQuery = String.format("SELECT UwlEmailAddress FROM Users "
                                        + "WHERE UwlEmailAddress = ?");

        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setString(1, uwlEmailAddress);
        
        ResultSet rs = pstmt.executeQuery();

        if (!rs.next()) {
            throw new java.lang.Exception (" CovidApp::login: That email does not exist in the UWL directory.");
        }
        
        //--- Check if user is an admin. ---//
        sqlQuery = String.format("SELECT UserType FROM Users "
                                        + "WHERE UwlEmailAddress = ?");

        pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setString(1, uwlEmailAddress);
        
        rs = pstmt.executeQuery();

        if (rs.next()) {
            this.isAdmin = rs.getBoolean(1);
        }
        
        //--- Validate if correct password was typed. ---//
        sqlQuery = String.format("SELECT Password FROM Users " 
                                        + "WHERE UwlEmailAddress = ?");

        pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setString(1, uwlEmailAddress);

        rs = pstmt.executeQuery();

        if (!rs.next()) {
            throw new java.lang.Exception(" CovidApp::login: Password is incorrect.");
        }
        
        // Set login variables for application system.
        this.email = uwlEmailAddress;
        this.isLoggedIn = true;
    }
    
    /**
     * Logout the current logged in user from the system.<br><br>
     * 
     * Successful scenario:<br>
     *      1. User submits a request to logout.<br>
     *      2. Terminate access to application and system.<br>
     *      3. Display home screen.<br>
     * 
     */
    public void logout() {
        this.email = "";
        this.isLoggedIn = false;
        this.isAdmin = false;
    }
    
    /**
     * Get the logged in user's email.
     */
    public String getLoggedInUser() {
        return this.email;
    }
    
    /**
     * Check if a user is logged in.
     */
    public boolean isLoggedIn() {
        return this.isLoggedIn;
    }
    
    /**
     * Check if current user is an admin.
     */
    public boolean isAdmin() {
        return this.isAdmin;
    }
    
    /**
     * Create an appointment for the given registration number.<br><br>
     * 
     * Successful scenario:<br>
     *      1. User submits a registration number.<br>
     *      2. If the user is logged in, use their given registration number if and only if they already
     *          generated a registration number with their UWL email.<br>
     *      3. Using a calendar, ask the user to create an appointment.<br>
     *      4. Verify appointment times and display valid appointments to the user. (Invoke use case #
     *          "COVID-A2")<br>
     *      5. If all is valid, display a message with that an appointment has been made to the user.<br>
     * 
     * @param registrationNumber    A user's registration number.
     * @param date                  A date.
     *  
     * @throws SQLException
     * @throws Exception
     */
    public void createAppointment(int registrationNumber, String date, String time) throws SQLException, Exception {
        //-- Validate date. --//
        verifyAppointment(date, time);
        
        //-- Insert registration into database. --//
        String sqlQuery = String.format("INSERT INTO Appointments "
                          + "(RegistrationID, Date, Time, TestResult) "
                          + "VALUES (?, ?, ?, ?)");
        
        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setInt(1, registrationNumber);
        pstmt.setString(2, date);
        pstmt.setString(3, time);
        pstmt.setBoolean(4, false);
        
        pstmt.executeUpdate();
    }
    
    /**
     * Verify the appointment. (Example Valid date: MM/dd/yyyy 10:00 A.M.)<br><br>
     * 
     * Successful scenario: <br>
     *      1. Verify an appointment with time ranges from 10:00 A.M. to 2:00 P.M. in 30 minute
     *          intervals (10:00, 10:30, 11:00, ... ).<br>
     *      2. Invalidate 30 minute time intervals that have more than four users who have already
     *          created an appointment for that time interval.<br>
     *      3. Display valid appointments for the calendar for use case # "COVID-A1".<br>
     * 
     * @throws java.lang.Exception.
     */
    public void verifyAppointment(String date, String time) throws Exception {
        //-- Verify Date format.
        DateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        sdf.setLenient(false);
        try {
            sdf.parse(date);
        } catch (ParseException e) {
            throw new java.lang.Exception (" CovidApp::verifyAppointment: An invalid date was inputted. (Example Valid date: MM/dd/yyyy)");
        }
        
        //-- Verify an appointment with time ranges from 10:00 A.M. to 2:00 P.M. 
        //--    in 30 minute intervals (10:00, 10:30, 11:00, ... ).
        String[] validTimes = { "10:00 A.M.", "10:30 A.M.", "11:00 A.M.", "11:30 A.M.", "12:00 P.M.", "12:30 P.M.",
                "1:00 P.M.", "1:30 P.M.", "2:00 P.M." };
        boolean isValidTime = false;
        for (int i = 0; i < validTimes.length; i++) {
            if (validTimes[i].equals(time)) {
                isValidTime = true;
                break;
            }
        }

        if (!isValidTime) {
            throw new java.lang.Exception(
                    " CovidApp::verifyAppointment: An invalid time was inputted. The time ranges must be from 10:00 A.M. to 2:00 P.M. in 30 minute intervals (10:00, 10:30, 11:00, ... ).");
        }
        
        
        //-- Invalidate 30 minute time intervals that have more than four users who have already
        //--    created an appointment for that time interval.
        validateAppointmentTime(date, time);
        
        return;
    }
    
    /**
     * Validate time.
     * @throws Exception 
     */
    public void validateAppointmentTime(String date, String time) throws Exception {
        String sqlQuery = String.format("SELECT COUNT(*) AS total FROM Appointments " + "WHERE Date = ? AND Time = ?");

        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setString(1, date);
        pstmt.setString(2, time);

        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            if (rs.getInt("total") >= 4) {
                throw new java.lang.Exception(
                        " CovidApp::verifyAppointment: This time appointment is full. Please pick a different time.");
            }
        }
    }
    
    /**
     * Get a set of past test results for a given email address.<br><br>
     * 
     * Successful scenario:<br>
     *      1. If a user is logged in as a UWL community member, given a past registration number and
     *          past date, display their past COVID test results and other output parameters.<br>
     * 
     * @param uwlEmailAddress    A user's email address.
     * 
     * @return Return a table containing a list of past test results.
     * 
     * @throws SQLException 
     * @throws java.lang.Exception.
     */
    public ResultSet getPastTestResults(String uwlEmailAddress) throws SQLException, Exception {
        
        //--- Check if email exists in directory. ---//
        String sqlQuery = String.format("SELECT UwlEmailAddress FROM Registrations "
                                        + "WHERE IsInvalid = ?");

        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setBoolean(1, true);
        
        ResultSet rs = pstmt.executeQuery();

        if (!rs.next()) {
            throw new java.lang.Exception (" CovidApp::getPastTestResults: That email does not exist in the UWL directory.");
        }
        
        return rs;
    }
    
    /**
     * Get a set of registrations for a given email address.<br><br>
     * 
     * Successful scenario:<br>
     *      1. If a user is logged in as a UWL community member, given a past registration number and
     *          past date, display their past COVID test results and other output parameters.<br>
     * 
     * @param registrationNumber    A user's registration number.
     * 
     * @return Return a table containing a list of past test results.
     * 
     * @throws SQLException 
     * @throws java.lang.Exception.
     */
    public ResultSet getRegistrationData(int registrationNumber) throws SQLException, Exception {
        
        String sqlQuery = String.format("SELECT RegistrationID, FirstName, LastName, "
                                        + "UwlEmailAddress, PhoneNumber, HasCovidSymptoms "
                                        + "FROM Registrations "
                                        + "WHERE RegistrationID = ?");

        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setInt(1, registrationNumber);
        
        ResultSet rs = pstmt.executeQuery();
        return rs;
    }
    
    /**
     * Get a set of appointments for a given registration number.<br><br>
     * 
     * Successful scenario:<br>
     *      1. If a user is logged in as a UWL community member, given a past registration number and
     *          past date, display their past COVID test results and other output parameters.<br>
     * 
     * @param registrationNumber    A user's registration number.
     * 
     * @return Return a table containing a list of past test results.
     * 
     * @throws SQLException 
     * @throws java.lang.Exception.
     */
    public ResultSet getAppointmentData(int registrationNumber) throws SQLException, Exception {
        String sqlQuery = String.format("SELECT RegistrationID, Date, TestResult "
                                        + "FROM Appointments "
                                        + "WHERE RegistrationID = ?");

        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setInt(1, registrationNumber);

        ResultSet rs = pstmt.executeQuery();
        return rs;
    }
    
    /**
     * Check-in a user and give them a COVID test.<br><br>
     * 
     * Successful scenario:<br>
     *      1. If a user is logged in as a UWL COVID testing staff member, given a registration
     *          number, check in the person with that registration number for the appointment time.<br>
     *      2. Test the person for COVID. (Generate a COVID test result)<br>
     *      3. If the person had no symptoms and their test result is Negative, then no other
     *          appointment is needed.<br>
     *      4. If the person had no symptoms and their test result is Positive, then another appointment
     *          should be scheduled a week later.<br>
     *      5. If the person had symptoms and their test result is Negative, then no other appointment is
     *          needed.<br>
     *      6. If the person had symptoms and their test result is Positive, then another appointment
     *          should be scheduled within a week.<br>
     *          
     * @param registrationNumber    A user's registration number.
     * 
     * @return Return a test result.
     * 
     * @throws java.lang.Exception.
     */
    public boolean checkIn(int registrationNumber) throws Exception {
        
        //-- Verify that number is an actual registered number. --//
        String sqlQuery = String.format("SELECT RegistrationID "
                                        + "FROM Registrations");
        
        Statement statement = myConn.createStatement();
        ResultSet rs = statement.executeQuery(sqlQuery);
        
        if (!rs.next()) {
            throw new java.lang.Exception (" CovidApp::checkIn: That registration number is not valid or does not exist.");
        }
        
        //--- Do Test ---//
        Random rand = new Random();
        
        int isPositive = rand.nextInt(2);
        boolean boolIsPositive = false;
        
        switch (isPositive) {
            case 0:
                boolIsPositive = false;
                break;
            case 1:
                boolIsPositive = true;
                break;
            default:
                throw new java.lang.Exception (" CovidApp::checkIn: Something went wrong with Random Number Generator.");
        }
        
        /*// Update database with test result
        sqlQuery = String.format("UPDATE Appointments " 
                                        + "SET TestResult = ? "
                                        + "WHERE RegistrationID = ?");

        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setBoolean(1, boolIsPositive);
        pstmt.setInt(2, registrationNumber);
        
        pstmt.executeUpdate();*/
        
        // Person was checked-in, remove the appointment.
        sqlQuery = String.format("DELETE FROM Appointments "
                                + "WHERE RegistrationID = ?");

        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setInt(1, registrationNumber);

        pstmt.executeUpdate();
        
        // Return test result
        return boolIsPositive;
    }
    
    /**
     * Search for a registration number in the database.<br><br>
     * 
     * Successful scenario:<br>
     *      1. A testing staff member, submits an integer string.<br>
     *      2. Validate string for valid integer.<br>
     *      3. If the input is a valid integer, then return a list of registration numbers that match the
     *          integer string.<br>
     *          
     * @param input    The input used to search the database.
     * 
     * @throws SQLException, NumberFormatException 
     */
    public ResultSet searchRegistrationNumber(String input) throws SQLException, NumberFormatException {
        int registrationNumber = Integer.parseInt(input);

        String sqlQuery = String.format("SELECT RegistrationID, FirstName, LastName, " 
                                        + "UwlEmailAddress, PhoneNumber, HasCovidSymptoms "
                                        + "FROM Registrations " 
                                        + "WHERE RegistrationID = ?");

        PreparedStatement pstmt = myConn.prepareStatement(sqlQuery);
        pstmt.setInt(1, registrationNumber);
        
        ResultSet rs = pstmt.executeQuery();
        return rs;
    }

}
