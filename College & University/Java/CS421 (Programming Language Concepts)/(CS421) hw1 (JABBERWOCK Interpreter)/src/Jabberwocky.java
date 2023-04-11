import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * <b>Project Name: </b>    hw1 (JABBERWOCK Interpreter)    <br>
 * <b>Class:        </b>    CS421 (Spring)                  <br>
 * <b>Date Created: </b>    2/6/2022                        <br>
 * <b>Date Modified:</b>    2/12/2022                       <br><br>
 * 
 * <b>Command-line Usage:</b>                       <br> &nbsp;&nbsp;&nbsp;&nbsp;
 * <code>   java Jabberwocky [file-location]        </code><br><br>
 * 
 * The JABBERWOCK language supports a single data type: a JABBERWOCK-string. 
 *      There are no numbers, booleans or objects. 
 *      JABBERWOCK supports only one type of statement: an assignment. 
 *      There are no conditionals, loops, methods or method calls. 
 *      As with all languages, an assignment statement assigns a value to a variable. 
 *      The syntax of the language is described informally and rigorously below. 
 *      In this definition, symbols given in red font are literal while those elements 
 *          given in black font denote abstract language elements.<br><br>
 * 
 * <ol>
 *      <li> A JABBERWOCK-string literal is a sequence of one-or-more 
 *              consecutive -, *, or ? characters.
 *              A JABBERWOCK-string literal is a JABBERWOCK-expression.
 *      <li> The word <code>undefined</code> is a JABBERWOCK-expression.
 *      <li> A sequence of alphabetic characters is a variable name. 
 *              Variable names are case sensitive. A variable name is a 
 *              JABBERWOCK-expression.
 *      <li> If E1 and E2 are JABBERWOCK-expressions then each of the following
 *              is a JABBERWOCK-expression involving a binary operator.
 *          <ul>
 *              <li> E1 & E2
 *              <li> E1 || E2
 *              <li> E1 # E2
 *          </ul>
 *      <li> A variable name followed by a JABBERWOCK-expression is a 
 *              JABBERWORK-assignment-statement.
 *      <li>  JABBERWOCK-program is a sequence of JABBERWOCK-assignment-statements 
 *              having exactly one statement per line.
 * </ol>
 * 
 * Note that there is at least one space (but possible many) between any 
 *      two consecutive language elements. For example, -*?*#* is not a valid 
 *      JABBERWOCK-expression because there is no space between the 
 *      operator [#] and the operands. However, -*?* # * is a valid 
 *      JABBERWOCK-expression.
 * 
 * @author Kong Jimmy Vang
 */
public class Jabberwocky {
    
    /** Max length of a JABBERWOCK-string */
    final static public int JABBERWOCK_STRING_MAX_LEN = 2022;
    
    /** JABBERWOCK-string REGEX */
    final static public String JABBERWOCK_STRING_REGEX = 
            "[\\-\\*\\?]+"
            + "|(undefined)+";
    
    /** JABBERWOCK-string PATTERN */
    final static public Pattern JABBERWOCK_STRING_PATTERN = Pattern.compile(JABBERWOCK_STRING_REGEX);
    
    /** Temporary Storage for variables */
    private String tempStorage = "";
    private String prevVariable = "";
    private String currentVariable = "";
    
    /** 
     * Set true if an variable is being assigned a value or operated on by an operand. 
     *      Otherwise set to false. 
     */
    private boolean isAssigning = false;
    
    /**
     * Map for storing assignments of JABBERWOCK-strings. <br><br>
     *      
     * Example of Assignments in Map:   <br>
     *      KEY = VALUE                 <br>
     *      "a" = "-*?"                 <br>
     *      "b" = "--**??"              <br>
     *      "c" = "-*-?-**-??-"         <br>
     */
    protected Map<String,String> jabberwockStrings;
    
    /**
     * Temporary storage for previous JABBERWOCK-strings. <br>
     * Used for self references when assigning a variable to itself. <br><br>
     * 
     * <b>Example of self reference assignment:</b>          <br><li>
     *      <code>
     *          y -*-*?*-*-*?* # y || -* & y || y
     *      </code>
     */
    private Map<String,String> tempJabberwockStrings;
    
    /**
     * Main function for Jabberwocky Program.           <br><br>
     * 
     * <b>Command-line Usage:</b>                       <br> &nbsp;&nbsp;&nbsp;&nbsp;
     * <code>   java Jabberwocky [file-location]        </code>
     * 
     * @param args - There must be 1 command line argument representing a file location and name.
     */
    public static void main(String[] args) {
        
        // Check for a valid argument length.
        if (args.length != 1) {
            System.err.println("Error: There must be 1 argument representing a file location and name." );
            System.err.println("\t\tExample: java Jabberwocky <file-location>" );
            System.exit(-1);
        }
        
        // Open file from command line argument.
        File f = new File(args[0]);
        
        // Create scanner.
        Scanner s = null;
        try {
            s = new Scanner(f);
        } catch (FileNotFoundException e) {
            //e.printStackTrace();
            System.err.println("FileNotFoundException: " + e.getMessage() );
            System.exit(-1);
        }
        
        // Create JABBERWOCK Interpreter object.
        Jabberwocky jw = new Jabberwocky();
        
        // Evaluate JABBERWOCK Program with the JABBERWOCK Interpreter.
        while (s.hasNext()) {
            jw.evaluate(s, jw.jabberwockStrings, null);
        }
        
        // Print results to STDOUT.
        Iterator<Map.Entry<String, String>> it = jw.jabberwockStrings.entrySet().iterator();
        
        while (it.hasNext()) {
            Map.Entry<String, String> e = it.next();
            String key = (String) e.getKey();
            String value = (String) e.getValue();
            
            if (it.hasNext()) {
                System.out.println(key + " = " + value);
            } else {
                System.out.print(key + " = " + value);
            }
        }
    }
    
    /**
     * Constructor for the JABBERWOCK Interpreter.
     */
    public Jabberwocky() {
        jabberwockStrings = new HashMap<>();
        tempJabberwockStrings = new HashMap<>();
    }
    
    /**
     * Evaluate the current Token. Used recursively for RIGHT-ASSOCIATIVE properties.
     * 
     * @param s         - Scanner for input file.
     * @param m         - Map storing JABBERWOCK-strings.
     * @param prevToken - The previous token. (Used for recursion)
     * 
     * @return Returns null if no operator is active.
     *          Returns the result of the operator performed on two expressions.
     */
    public String evaluate(final Scanner s, 
                           final Map<String,String> m, 
                           String prevToken) {
        
        // Return a flag "empty" if the scanner has no more tokens to scan.
        if (!s.hasNext()) {
            return "empty";
        }
        
        // Get the next Token.
        String token = s.next();
        
        // Parse the Token.
        return parse(s, m, token, prevToken);
    }
    
    /**
     * Parses and evaluates the current Token.
     * 
     * @param s         - Scanner for input file.
     * @param m         - Map storing JABBERWOCK-strings.
     * @param token     - The token that will be parsed.
     * @param prevToken - The previous token. (Used for recursion)
     * 
     * @return Returns null if no operator is active.
     *          Returns the result of the operator performed on two expressions.
     */
    private String parse(final Scanner s, 
                         final Map<String,String> m, 
                         String token,
                         String prevToken) {
        
        // Get the matcher for JABBERWOCK-string.
        Matcher jabberwockStringMatcher = JABBERWOCK_STRING_PATTERN.matcher(token);
        
        ////////////////////////////////
        // Parsed an OPERATOR "&'.
        if ( "&".equals(token) ) {
            
            // Get the token on the right side of the operand.
            String nToken = s.next();
            
            // Recursive right-associative evaluation
            String token2 = evaluate(s, m, nToken);
            isAssigning = true;
            
            if (token2 == null && prevToken != null) {
                return concatenateNoDupSeq(prevToken, nToken);
            } else if ("empty".equals(token2)) {
                token2 = null;
                prevVariable = currentVariable;
                
                if (prevToken == null) {
                    prevToken = tempStorage;
                }
                
                jabberwockStrings.put(prevVariable, concatenateNoDupSeq(prevToken, nToken));
                return concatenateNoDupSeq(prevToken, nToken);
            }
            
            String result = null;
            jabberwockStringMatcher = JABBERWOCK_STRING_PATTERN.matcher(nToken);
            
            // IF token is a JABBERWOCK-string
            if ( jabberwockStringMatcher.matches() ) {
                if (null != token2 && null != prevToken) {
                    result = concatenateNoDupSeq(getVariableValue(prevToken), token2);
                }
                
                if (null == prevToken) {
                    if (result != null) {
                        result = concatenateNoDupSeq(tempStorage, result);
                    } else {
                        if (token2 == null) {
                            token2 = nToken;
                        }
                        result = concatenateNoDupSeq(tempStorage, token2);
                    }
                    
                    jabberwockStrings.put(prevVariable, result);
                }
            
            // ELSE, token is a VARIABLE
            } else {
                String variableValue = jabberwockStrings.get(nToken);
                
                if (null == variableValue) {
                    variableValue = "undefined";
                }
                
                if (null != prevToken) {
                    Matcher jabberwockStringMatcherTemp = JABBERWOCK_STRING_PATTERN.matcher(prevToken);
                    String variableValueTemp = "";
                    if ( !jabberwockStringMatcherTemp.matches() ) {
                        variableValueTemp = jabberwockStrings.get(prevToken);
                        if (null == variableValueTemp) {
                            variableValueTemp = "undefined";
                        }
                    } else {
                        variableValueTemp = prevToken;
                    }
                    
                    result = concatenateNoDupSeq(variableValueTemp, token2);
                }
                
                if (null == prevToken) {
                    result = concatenateNoDupSeq(tempStorage, token2);
                    
                    jabberwockStrings.put(prevVariable, result);
                }
            }
            
            return result;
            
        ////////////////////////////////
        // Parsed an OPERATOR "||'.
        } else if ( "||".equals(token) ) {
            
            // Get the token on the right side of the operand.
            String nToken = s.next();
            
            // Recursive right-associative evaluation
            String token2 = evaluate(s, m, nToken);
            isAssigning = true;
            
            if (token2 == null && prevToken != null) {
                return interleave(prevToken, nToken);
            } else if ("empty".equals(token2)) {
                token2 = null;
                prevVariable = currentVariable;
                
                if (prevToken == null) {
                    prevToken = tempStorage;
                }
                
                jabberwockStrings.put(prevVariable, interleave(prevToken, nToken));
                return interleave(prevToken, nToken);
            }
            
            String result = null;
            jabberwockStringMatcher = JABBERWOCK_STRING_PATTERN.matcher(nToken);
            
            // IF token is a JABBERWOCK-string.
            if ( jabberwockStringMatcher.matches() ) {
                if (null != token2 && null != prevToken) {
                    result = interleave(getVariableValue(prevToken), token2);
                }
                
                if (null == prevToken) {
                    if (result != null) {
                        result = interleave(tempStorage, result);
                    } else {
                        if (token2 == null) {
                            token2 = nToken;
                        } 
                        result = interleave(tempStorage, token2);
                    }
                    
                    jabberwockStrings.put(prevVariable, result);
                }
            
            // ELSE, token is a VARIABLE.
            } else {
                String variableValue = jabberwockStrings.get(nToken);
                if (null == variableValue) {
                    variableValue = "undefined";
                }
                
                if (null != prevToken) {
                    Matcher jabberwockStringMatcherTemp = JABBERWOCK_STRING_PATTERN.matcher(prevToken);
                    String variableValueTemp = "";
                    if ( !jabberwockStringMatcherTemp.matches() ) {
                        variableValueTemp = jabberwockStrings.get(prevToken);
                        if (null == variableValueTemp) {
                            variableValueTemp = "undefined";
                        }
                    } else {
                        variableValueTemp = prevToken;
                    }
                    
                    result = interleave(variableValueTemp, token2);
                }
                
                if (null == prevToken) {
                    result = interleave(tempStorage, token2);
                    jabberwockStrings.put(prevVariable, result);
                }
            }
            
            return result;
        
        ////////////////////////////////
        // PARSED an OPERATOR "#'.
        } else if ( "#".equals(token) ) {
            
            // Get the token on the right side of the operand.
            String nToken = s.next();
            
            // Recursive right-associative evaluation
            String token2 = evaluate(s, m, nToken);
            isAssigning = true;
            
            if (token2 == null && prevToken != null) {
                return splice(prevToken, nToken);
            } else if ("empty".equals(token2)) {
                token2 = null;
                prevVariable = currentVariable;
                
                if (prevToken == null) {
                    prevToken = tempStorage;
                }
                
                jabberwockStrings.put(prevVariable, splice(prevToken, nToken));
                return splice(prevToken, nToken);
            }
            
            String result = null;
            jabberwockStringMatcher = JABBERWOCK_STRING_PATTERN.matcher(nToken);
            
            // IF token is a JABBERWOCK-string
            if ( jabberwockStringMatcher.matches() ) {
                if (null != token2 && null != prevToken) {
                    result = splice(getVariableValue(prevToken), token2);
                }
                
                if (null == prevToken) {
                    if (result != null) {
                        result = splice(tempStorage, result);
                    } else {
                        if (token2 == null) {
                            token2 = nToken;
                        }
                        result = splice(tempStorage, token2);
                    }

                    jabberwockStrings.put(prevVariable, result);
                }
                
            // ELSE, token is a VARIABLE name
            } else {
                String variableValue = jabberwockStrings.get(nToken);
                
                if (null == variableValue) {
                    variableValue = "undefined";
                }
                
                if (null != prevToken) {
                    Matcher jabberwockStringMatcherTemp = JABBERWOCK_STRING_PATTERN.matcher(prevToken);
                    String variableValueTemp = "";
                    if ( !jabberwockStringMatcherTemp.matches() ) {
                        variableValueTemp = jabberwockStrings.get(prevToken);
                        if (null == variableValueTemp) {
                            variableValueTemp = "undefined";
                        }
                    } else {
                        variableValueTemp = prevToken;
                    }
                    
                    result = splice(variableValueTemp, token2);
                }
                
                if (null == prevToken) {
                    result = splice(tempStorage, token2);
                    jabberwockStrings.put(prevVariable, result);
                }
            }
            
            return result;
        
        ////////////////////////////////
        // PARSED a JABBERWOCK-string.
        } else if ( jabberwockStringMatcher.matches() ) {
            jabberwockStrings.put(currentVariable, token);
            tempJabberwockStrings.put(prevVariable, jabberwockStrings.get(prevVariable));
            tempStorage = token;
            isAssigning = false;
        
        ////////////////////////////////
        // PARSED a VARIABLE name.
        } else {
            
            if (isAssigning == false) {
                
                // VARIABLE (Assignment)
                prevVariable = currentVariable;
                currentVariable = token;
                isAssigning = true;
            } else {
                
                // VARIABLE (Expression)
                tempStorage = getVariableValue(token);
                jabberwockStrings.put(currentVariable, getVariableValue(token));
                isAssigning = false;
            }
        }
        
        return null;
    }
    
    /**
     * The character & denotes the JABBERWOCK-string 
     *      concatenation-without-duplicate-sequencing operator. 
     *      This operator will a) peform the concatenation of the 
     *      two operands and b) reduce any sequence of multiple occurrences 
     *      of a letter into a single occurrence. <br><br>
     *      
     *      For example, ** & *?--- yields the JABBERWOCK-string *?-.
     * 
     * @param s1 - 1st JABBERWOCK-string
     * @param s2 - 2nd JABBERWOCK-string
     * @return Returns a concatenated JABBERWOCK-string with no duplicate-sequencing characters.
     *          Return "undefined" if operation would produce a JABBERWOCK-string of length 2023 or greater.
     *          Return "undefined" if s1 OR s2 are "undefined".
     */
    private String concatenateNoDupSeq(String s1, String s2) {
        s1 = getVariableValue(s1);
        s2 = getVariableValue(s2);
        
        // Return undefined if s1 OR s2 are undefined.
        if ( "undefined".equals(s1) || "undefined".equals(s2)) {
            return "undefined";
        }
        
        // Concatenate s1 and s2.
        String concatenatedStr = s1.concat(s2);
        StringBuilder sb = new StringBuilder();
        char lastChar = 0;
        
        for (int i = 0; i < concatenatedStr.length(); i++) {
            if (lastChar != concatenatedStr.charAt(i)) {
                sb.append( concatenatedStr.charAt(i) );
            }
            lastChar = concatenatedStr.charAt(i);
        }
        
        // Return undefined if JABBERWOCK-string is equal to length 2023 or greater.
        String jabberwockString = sb.toString();
        if ( jabberwockString.length() > JABBERWOCK_STRING_MAX_LEN ) {
            return "undefined";
        }
        
        // Otherwise, Return the concatenated JABBERWOCK-string.
        return jabberwockString;
    }
    
    /**
     * The characters || denotes the JABBERWOCK-string interleaving operator. 
     * This operator interleaves the symbols of the two JABBERWOCK-string 
     * operators to produce a JABBERWOCK-string. If the length of the two 
     * operands are unequal, the "unmatched" symbols of the longest 
     * JABBERWOCK-string are merely copied to the result. <br><br>
     * 
     * Consider the following examples for clarity: <br>
     *      1. -- || ** => -*-*                     <br>
     *      2. **-- || ?? => *?*?--                 <br>
     * 
     * @param s1 - 1st JABBERWOCK-string
     * @param s2 - 2nd JABBERWOCK-string
     * @return Returns a interleaved JABBERWOCK-string.
     *          Return "undefined" if operation would produce a JABBERWOCK-string of length 2023 or greater.
     *          Return "undefined" if s1 OR s2 are "undefined".
     */
    private String interleave(String s1, String s2) {
        s1 = getVariableValue(s1);
        s2 = getVariableValue(s2);
        
        final int RETURN_STRING_LEN = s1.length() + s2.length();
        
        /* Return undefined if JABBERWOCK-string is equal to length 2023 or greater.
         * Return undefined if s1 OR s2 are undefined. */
        if ( RETURN_STRING_LEN > JABBERWOCK_STRING_MAX_LEN
                || "undefined".equals(s1) 
                || "undefined".equals(s2)) {
            return "undefined";
        }
        
        // Interleave both strings together.
        StringBuilder sb = new StringBuilder(RETURN_STRING_LEN);
        for (int i = 0; i < RETURN_STRING_LEN; i++) {
            if (i < s1.length()) {
                sb.append( s1.charAt(i) );
            }
            if (i < s2.length()) {
                sb.append( s2.charAt(i) );
            }
        }
        
        // Return the interleaved JABBERWOCK-string.
        return sb.toString();
    }
    
    /**
     * The character # denotes the JABBERWOCK-string splice operator 
     * where the first operand is spliced into the center of the second operand. 
     * The idea is to split the second operand in two equal or nearly-equal 
     * halves and insert the first operand into the center. If the second 
     * operands length is not even, the first segment is the shorter of 
     * the two halves. <br><br>
     * 
     * By way of example, 
     *      ** # ------ yields ---**--- and ** # ----- yields --**---.
     * 
     * @param s1 - 1st Jabberwock-string
     * @param s2 - 2nd Jabberwock-string
     * @return Returns a spliced Jabberwock-string.
     *          Return "undefined" if operation would produce a JABBERWOCK-string of length 2023 or greater.
     *          Return "undefined" if s1 OR s2 are "undefined".
     */
    private String splice(String s1, String s2) {
        s1 = getVariableValue(s1);
        s2 = getVariableValue(s2);
        
        final int RETURN_STRING_LEN = s1.length() + s2.length();
        final int CENTER_INDEX = s2.length() / 2;
        
        /* Return undefined if JABBERWOCK-string is equal to length 2023 or greater.
         * Return undefined if s1 OR s2 are undefined. */
        if ( RETURN_STRING_LEN > JABBERWOCK_STRING_MAX_LEN
                || "undefined".equals(s1) 
                || "undefined".equals(s2)) {
            return "undefined";
        }
        
        StringBuilder sb = new StringBuilder(RETURN_STRING_LEN);
        
        // Place characters of s2 here first.
        for ( int i = 0; i < CENTER_INDEX; i++ ) {
            sb.append( s2.charAt(i) );
        }
        
        // Splice s1 in the center of s2.
        for ( int i = 0; i < s1.length(); i++ ) {
            sb.append( s1.charAt(i) );
        }
        
        // Place remaining characters of s2.
        for ( int i = CENTER_INDEX; i < s2.length(); i++ ) {
            sb.append( s2.charAt(i) );
        }
        
        // Return the spliced JABBERWOCK-string.
        return sb.toString();
    }
    
    /**
     * Get a variable's assigned value.
     * 
     * @param variable - A variable.
     * @return Return a variable's assigned value.
     *          If the variable has no assigned value, Return "undefined".
     */
    private String getVariableValue(String variable) {
        if (null == variable) {
            return "undefined";
        }
        
        Matcher jabberwockStringMatcherTemp = JABBERWOCK_STRING_PATTERN.matcher(variable);
        String variableValueTemp = "";
        
        if ( !jabberwockStringMatcherTemp.matches() ) {
            if (variable.equals(prevVariable)) {
                variableValueTemp = tempJabberwockStrings.get(prevVariable);
            } else {
                variableValueTemp = jabberwockStrings.get(variable);
            }
            
            if (null == variableValueTemp) {
                variableValueTemp = "undefined";
            }
            
        } else {
            variableValueTemp = variable;
        }
        
        return variableValueTemp;
    }
}