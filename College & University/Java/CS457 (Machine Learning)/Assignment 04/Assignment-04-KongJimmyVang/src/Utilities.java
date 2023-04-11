import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * Project Name:    Assignment 4        <br>
 * File Name:       Utilities.java      <br>
 * Description:     This stores useful functions and methods that are used by many different classes commonly. <br><br>
 * 
 * Date Created:    12/11/22            <br>
 * Date Modified:   12/14/22            <br>
 * Class:           CS457 (Fall 2022)   <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class Utilities 
{
    /**
     * Returns true if a comment is detected in the line or the string is empty.
     * @param line - string
     * @return Returns true if a comment is detected in the line or the string is empty.
     */
    public static boolean containsCommentOrEmptyLine(final String line) {
        return containsComment(line) || containsEmptyLine(line);
    }
    
    /**
     * Returns true if a comment is detected in the line.
     * @param line - string
     * @return Returns true if a comment is detected in the line.
     */
    public static boolean containsComment(final String line) 
    {
        for (int i = 0; i < line.length(); i++)
        {
            switch (line.charAt(i)) 
            {
                case ' ':
                    continue;
                case '#':
                    return true;
                default:
                    return false;
            }
        }
        return false;
    }
    
    /**
     * Returns true if the string is empty.
     * @param line - string
     * @return Returns true if the string is empty.
     */
    public static boolean containsEmptyLine(final String line) {
        return line.isEmpty();
    }
    
    /**
     * Round a value to a given number of decimal places.
     * @param value - the double value to round.
     * @param places - number of decimal places to round to.
     * @return
     */
    public static double round(final double value, final int places) 
    {
        if (places < 0) throw new IllegalArgumentException();

        BigDecimal bd = BigDecimal.valueOf(value);
        bd = bd.setScale(places, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }
}
