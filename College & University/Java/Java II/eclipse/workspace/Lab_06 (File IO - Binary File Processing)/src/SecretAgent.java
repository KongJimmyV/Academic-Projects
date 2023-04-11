import java.io.Serializable;

/**
 * This object will store the first name, last name, and ID of a secret agent.
 * 
 * File Name: 	SecretAgent.java
 * Date: 		3/27/2017
 * 
 * @author Jimmy Vang
 *
 */
public class SecretAgent implements Serializable {

	/** Serial Version UID */
	private static final long serialVersionUID = 1L;
	
	private String firstName;
	private String lastName;
	private String id;
	
	/**
	 * Use this to create a secret agent.
	 * 
	 * @param lastName - The last name of the secret agent.
	 * @param firstName - The first name of the secret agent.
	 * @param id - The ID number of the secret agent
	 */
	public SecretAgent(String lastName, String firstName, String id) {
		setFirstName(firstName);
		setLastName(lastName);
		setId(id);
	}
	
	/**
	 * Returns an organized string from this object including:
	 * <ul>
	 * <li> First Name 		(firstName)
	 * <li> Last Name 		(lastName)
	 * <li> ID 				(id)
	 * </ul>
	 */
	public String toString() {
		return "\n\t+++===--- Secret Agent ---===+++"
				+ "\n\tName: \t" + firstName + " " + lastName 
				+ "\n\tID: \t" + id;
	}

	/*** Accessors/Setters ***/
	public String getFirstName() {
		return firstName;
	}

	private void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	private void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getId() {
		return id;
	}

	private void setId(String id) {
		this.id = id;
	}
}
