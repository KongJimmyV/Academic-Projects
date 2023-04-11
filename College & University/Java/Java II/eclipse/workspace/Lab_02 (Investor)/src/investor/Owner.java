package investor;

import java.lang.Object;
import java.util.Date;
import java.util.ArrayList;

/**
 * The Owner class represents the owner of a portfolio. 
 * 
 * An owner can have a single portfolio.
 * 
 * @author Jimmy Vang
 * 
 */
public class Owner {
	
	// Variables
	String firstName;
	String lastName;
	Portfolio portfolio;
	
	// Constants
	
	// Constructors
	public Owner(java.lang.String firstName, java.lang.String lastName) {
		
	}
	
	// Methods
	public void assignPortfolioToOwner(Portfolio p) {
		
	}
	
	/**
	 * Return a String/Description of Owner.
	 * 
	 * @return Return a String/Description of Owner.
	 */
	public java.lang.String toString() {
		String msg = "";
		return msg;
	}
	
	// Accessors and Setters
	private String getFirstName() {
		return firstName;
	}

	private void setFirstName(java.lang.String firstName) {
		this.firstName = firstName;
	}

	private String getLastName() {
		return lastName;
	}

	private void setLastName(java.lang.String lastName) {
		this.lastName = lastName;
	}

	private Portfolio getPortfolio() {
		return portfolio;
	}

	private void setPortfolio(Portfolio portfolio) {
		this.portfolio = portfolio;
	}

}
