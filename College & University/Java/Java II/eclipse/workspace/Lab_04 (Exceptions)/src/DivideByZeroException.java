
/**
 * 
 * Title: 			DivideByZeroException
 * Description: 	This is a custom exception class.
 * Date: 			2/13/2017
 * 
 * @author Jimmy Vang
 *
 */
public class DivideByZeroException extends Exception {

	/**
	 * Uses the default message "Dividing by Zero!" for the exception class.
	 */
	public DivideByZeroException() {
		super("Dividing by Zero!");
	}
	
	/**
	 * Set a custom message for the exception class.
	 * 
	 * @param message - custom message to be set.
	 */
	public DivideByZeroException(String message) {
		super(message);
	}
}
