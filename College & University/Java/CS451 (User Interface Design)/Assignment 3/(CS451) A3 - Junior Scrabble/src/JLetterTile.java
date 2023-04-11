import javax.swing.JLabel;

/**
 * JLetterTile
 * 
 * Description:
 *      - A custom JLabel object for the GUI.
 * 
 * Project:     Assignment 3 - Scrabble
 * Class:       CS451
 * Team:        Hunter Sutter, Kong Jimmy Vang
 * 
 * @author Kong Jimmy Vang
 */
public class JLetterTile extends JLabel {

    /**
     * Serial Version UID
     */
    private static final long serialVersionUID = 1L;

    protected String tempLetter;
    private String letter;
    private boolean isBlank;
    
    /**
     * Creates a <code>JLetterTile</code> instance with the specified text.
     * The label is aligned against the leading edge of its display area, and centered vertically.
     * 
     * @see javax.swing.JLabel
     * @param text - The text to be displayed by the label.
     */
    public JLetterTile(String text) {
        super(text);
        this.letter = null;
        this.isBlank = false;
    }

    protected String getLetter() {
        return letter;
    }

    protected void setLetter(String letter) {
        this.letter = letter;
    }

    protected boolean isBlank() {
        return isBlank;
    }

    protected void setBlank(boolean isBlank) {
        this.isBlank = isBlank;
    }

}
