package investor;

import java.lang.Object;
import java.util.Date;
import java.util.Calendar;
import java.util.ArrayList;

/**
 * The CD class is utilized to compute several investment metrics related to CD returns. 
 * This class is a simplified representation of a CD investment. 
 * We assume all interest is compounded and reinvested into the CD. 
 * 
 * We allow three compounding intervals for our CDs -- Annual, Monthly, and Daily. 
 * 
 * CDs can be withdrawn before their maturity date, but they will be penalized by the terms of the CD. 
 * We will define the penalty as the number of months of lost interest if the CD is cashed in prior to its 
 * maturity date. 
 * The penalty months will be the most recent months of earned interest. 
 * 
 * A CD can belong to a single portfolio. 
 * 
 * The amount invested will be a represented as a long. double should not be used when working with currency, 
 * since doubles are only approximations.
 * 
 * @author Jimmy Vang
 * 
 */
public class CD {
	
	// Variables
	String cdName;
	long amountInCents;
	Date purchaseDate = new Date();
	int months;
	double annualRate;
	int compoundingType;
	int monthsPenalty;
	Portfolio portfolio;
	
	// Constants
	static final int CD_COMPOUND_ANNAULLY = 1;
	static final int CD_COMPOUND_MONTHLY = 12;
	static final int CD_COMPOUND_DAILY = 365;
	
	// Constructors
	/**
	 * Constructor with the items a CD must have...
	 * 
	 * @param p - The portfolio object associated with this CD
	 * @param cdName - The name of the CD
	 * @param amountInCents - The amount invested in the CD in cents
	 * @param purchaseDate - The purchase date of this CD
	 * @param months - The term of the CD in months
	 * @param annualRate - The rate of interest the CD earns annually
	 * @param compoundingType - The compounding type of the CD {CD_COMPOUND_ANNUALLY, CD_COMPOUND_MONTHLY, CD_COMPOUND_DAILY}
	 * @param monthsPenalty - The number of months of interest lost if the CD is sold prematurely.
	 */
	public CD(Portfolio p, 
			java.lang.String cdName, 
			long amountInCents, 
			java.util.Date purchaseDate, 
			int months, 
			double annualRate, 
			int compoundingType, 
			int monthsPenalty)  {
		this.setPortfolio(p);
		this.setCdName(cdName);
		this.setAmountInCents(amountInCents);
		this.setPurchaseDate(purchaseDate);
		this.setMonths(months);
		this.setAnnualRate(annualRate);
		this.setCompoundingType(compoundingType);
		this.setMonthsPenalty(monthsPenalty);
	}
	
	// Methods
	
	/**
	 * Convert Date object to Calendar.
	 * @param date - Date object to convert.
	 * @return Returns a Calendar object from the Date object.
	 */
	private Calendar toCalendar(Date date) {

		// Create an Calendar and convert to Date.
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		// Return the Calendar
		return calendar;

	}
	
	/**
	 * Convert Calendar object to Date.
	 * @param calendar - Calendar object to convert.
	 * @return Returns a Date object from the Calendar object.
	 */
	private Date toDate(Calendar calendar) {
		// Return a Date object from the Calendar's getTime() method.
		return calendar.getTime();
	}
	
	/**
	 * Calculates the date the CD matures.
	 * 
	 * 	Precondition: 
	 * 	• None
	 * 
	 * 	Postcondition: 
	 * 	• None
	 * 
	 * @return Return the date this CD matures
	 */
	public java.util.Date calcMaturityDate() {
		
		// Set purchase date in the Calendar object "c".
		Calendar c = Calendar.getInstance();	// creates a Calendar object
		c.setTime(this.getPurchaseDate());		// sets the Calendar object equal to the purchase date value.
		
		// Add the number of months the money invested to Calendar c.
		//
		// Example: 2005/01/01 + 12 months = 2006/01/01
		c.add(Calendar.MONTH, this.getMonths());
		
		// Return the Date the CD matures.
		//
		// Example: The Date, 2006/01/01 is returned.
		return c.getTime();
	}
	
	/**
	 * Computes the cumulative interest earned to the given date for the CD. 
	 * Interest is compounded based on the terms of the CD. 
	 * Prepayment penalty is not taken into consideration. 
	 * Returned amount should be rounded to the nearest cent. 
	 *	
	 *	Precondition: 
	 *	• Given date should be greater than purchase date
	 *	• If the given date is prior to the CDs purchase date, no interest is earned.
	 *	• If the given date exceeds the CDs term, assume no additional interest is earned.
	 *
	 *	Postcondition: 
	 *	• Return the value of cumulative interest earned to date in cents
	 *	• Returned value does not include the initial deposit amount
	 *	
	 * @param withdrawalDate - The withdrawal date used to calculate the value of the CD
	 * @return Return the value of cumulative interest earned to date in cents
	 */
	public long calcInterestEarned(java.util.Date withdrawalDate) {
		// Given Date must be larger than the purchase date.
		// If the given date is prior to the CDs purchase date, no interest is earned.
		if(withdrawalDate.getTime() < this.getPurchaseDate().getTime()) {
			System.out.println("UNEXPECTED ERROR at method 'calcInterestEarned()': Given date must be larger than the purchase date.");
			return 0;
		}
		//TODO:
		// define variables for compounding interest.
		double presentValue = this.getAmountInCents()/100.0;
		double r = this.getAnnualRate();	// in decimal form
		int n = this.getCompoundingType();
		double t = months/12.0;					// in years
		
		// Calculate:  FV = [PV (1+r/n)]^nt
		// using for loop
		double futureValue = 0;
		for(int i = 0; i <= n*t; i++) {
				futureValue = presentValue * Math.pow((1.0 + r)/n, n*t);
		}
		
		// Calculate interest earned.
		long interestEarned = (long)Math.round(((double)futureValue - (double)presentValue));
		
		return interestEarned;
	}
//	
//	/**
//	 * Computes the value of the CD given a date, disregarding prepayment penalties. 
//	 * The current value is the sum of the initial amount deposited, plus the cumulative interest earned to date. 
//	 * Interest is compounded based on the terms of the CD. 
//	 * Prepayment penalty is not taken into consideration. 
//	 * Returned amount should be rounded to the nearest cent. 
//	 * 	
//	 * 	Precondition: 
//	 * 	• Given date should be greater than purchase date
//	 * 	• If the given date is prior to the CDs purchase date, no interest is earned.
//	 * 	• If the given date exceeds the CDs term, assume no additional interest is earned.
//	 * 	
//	 * 	Postcondition: 
//	 * 	• The total value of the CD is returned: initial deposit amount + cumulative earned interest to date
//	 * 	
//	 * @param withdrawalDate - The withdrawal date used to calculate the value of the CD
//	 * @return The total value of the CD is returned in cents: initial deposit amount + cumulative earned interest to date
//	 */
//	public long calcValue(java.util.Date withdrawalDate) {
//		
//	}
//	
//	/**
//	 * Computes the value of the CD at maturity. 
//	 * The final value of the CD is the initial amount invested, plus the cumulative interest accrued. 
//	 * Interest is compounded based on the terms of the CD. 
//	 * Returned amount should be rounded to the nearest cent. 
//	 * 
//	 * 	Precondition: 
//	 * 	• None
//	 * 
//	 * 	Postcondition: 
//	 * 	• The total value of the CD at maturity is returned in cents: initial deposit amount + cumulative earned interest
//	 * 
//	 * @return The total value of the CD is returned at maturity in cents: initial deposit amount + cumulative earned interest to date
//	 */
//	public long calcValueAtMaturity() {
//		
//	}
//
//	/**
//	 * 
//	 * @param withdrawalDate
//	 * @return
//	 */
//	public double calcYearsHeld(java.util.Date withdrawalDate) {
//		
//	}
//	
//	/**
//	 * Computes the the dollar amount of prepayment penalties this CD would incure if cashed in at the given date. Prepayment penalty is the number of months of interest lost if the CD is cashed in early. The interest lost would be the most recently earned months of interest earned. Calculate the interest lost on a monthly basis, even if this CD accrues interest using another term. Returned amount should be rounded to the nearest cent. Also, the holder should always get back the initial amount invested, at a minimum. If the calculated penalty exceeds the interest earned to date, the penalty should equal the interest earned to date. 
//	 * 
//	 * 	Precondition: 
//	 * 	• Given date should be greater than purchase date
//	 * 	• If the given date is prior to the CDs purchase date, no interest is earned and no penalties accessed.
//	 * 	• If the given date exceeds the CDs term, assume no additional interest is earned.
//	 * 	• Investors can never loose more than the total cumulative interest earned
//	 * 	
//	 * 	Postcondition: 
//	 * 	• Return the amount of the penalty in cents -- the amount of interest lost
//	 * 
//	 * @param withdrawalDate - The withdrawal date used to calculate the value of the CD
//	 * @return Return the amount of the penalty in cents -- the amount of interest lost
//	 */
//	public long calcPrepaymentPenalty(java.util.Date withdrawalDate) {
//		
//	}
//	
//	/**
//	 * Computes the value of the CD given a date, less the prepayment penalty. 
//	 * The current value is the sum of the initial amount deposited and 
//	 * 		the cumulative interest earned to date, less any prepayment penalty. 
//	 * Interest is compounded based on the terms of the CD. 
//	 * Prepayment penalty is taken into consideration. 
//	 * Returned amount should be rounded to the nearest cent. 
//	 * 
//	 * 	Precondition: 
//	 * 	• Given date should be greater than purchase date
//	 * 	• If the given date is prior to the CDs purchase date, no interest is earned and no penalties accessed.
//	 * 	• If the given date exceeds the CDs term, assume no additional interest is earned.
//	 * 	• If the given date is < the maturity date, the penalty is the loss of the most recent earned interest according the the terms of the CD
//	 * 	• Investors can never loose more than the total cumulative interest earned
//	 * 
//	 * 	Postcondition: 
//	 * 	• The total value of the CD is returned in cents: initial deposit amount + cumulative earned interest to date - penalty
//	 * 
//	 * @param withdrawalDate - The withdrawal date used to calculate the value of the CD
//	 * @return The total value of the CD is returned in cents: initial deposit amount + cumulative earned interest to date - penalty
//	 */
//	public long calcValueWithPenalty(java.util.Date withdrawalDate) {
//		
//	}
//	
//	/**
//	 * Computes the actual annual rate of return after penalties have been applied. 
//	 * Also, computes the actual annual rate when an investor holds the CD past maturity. 
//	 * Returned rate should be rounded to 4 decimal places 
//	 * 
//	 * 	Precondition: 
//	 * 	• Given date should be greater than purchase date
//	 * 	• If the given date is prior to the CDs purchase date, no interest is earned and no penalties accessed.
//	 * 	• If the given date exceeds the CDs term, assume no additional interest is earned.
//	 * 	• If the given date is < the maturity date, the penalty is the loss of the most recent earned interest according the the terms of the CD
//	 * 	• Investors can never loose more than the total cumulative interest earned
//	 * 
//	 * 	Postcondition: 
//	 * 	• The actual annual rate of return the investor received after penalties have been applied
//	 * 	• Also, the actual annual rate of return the investor received if they held the CD past maturity
//	 * 	• Returned rate should be rounded to 4 decimal places
//	 * 
//	 * @param withdrawalDate - The withdrawal date used to calculate the value of the CD
//	 * @return The actual annual rate of return the investor received
//	 */
//	public double calcEffRateAfterPenalties(java.util.Date withdrawalDate) {
//		
//	}
//	
//	/**
//	 * Returns a basic summary of this CD. See the lab documentation to match the output. 
//	 * 
//	 * 	Precondition: 
//	 * 	• None
//	 * 
//	 * 	Postcondition: 
//	 * 	• None
//	 * 
//	 * @return Returns a basic summary of this CD.
//	 */
//	public java.lang.String toString() {
//		
//	}
//	
//	/**
//	 * Returns output for an indepth analysis of this CD which considers the given withdrawal date. 
//	 * The first part of this output is from toString(). 
//	 * See the lab documentation to match the output. 
//	 * 
//	 * 	Precondition: 
//	 * 	• Given date must be >= the purchase date
//	 * 	• If the given date, exceeds the CDs term, assume no additional interest is earned.
//	 * 	• If the given date is >= the maturity date, there is no penalty
//	 * 	• If the given date is < the maturity date, the penalty is the loss of the most recent earned interest according the the terms of the CD
//	 * 	• Investors can never loose more than the total cumulative interest earned
//	 * 
//	 * 	Postcondition: 
//	 * 	• An indepth analysis of the CD is returned as a String
//	 * 
//	 * @param withdrawalDate - The withdrawal date used to calculate the value of the CD
//	 * @return An indepth analysis of the CD is returned as a String
//	 */
//	public java.lang.String generateCDSummary(java.util.Date withdrawalDate) {
//		
//	}

	// Accessors and Setters
	public String getCdName() {
		return cdName;
	}

	private void setCdName(String cdName) {
		this.cdName = cdName;
	}

	public long getAmountInCents() {
		return amountInCents;
	}

	private void setAmountInCents(long amountInCents) {
		this.amountInCents = amountInCents;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	private void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public int getMonths() {
		return months;
	}

	private void setMonths(int months) {
		this.months = months;
	}

	public double getAnnualRate() {
		return annualRate;
	}

	private void setAnnualRate(double annualRate) {
		this.annualRate = annualRate;
	}

	public int getCompoundingType() {
		return compoundingType;
	}

	private void setCompoundingType(int compoundingType) {
		this.compoundingType = compoundingType;
	}

	public int getMonthsPenalty() {
		return monthsPenalty;
	}

	private void setMonthsPenalty(int monthsPenalty) {
		this.monthsPenalty = monthsPenalty;
	}

	public Portfolio getPortfolio() {
		return portfolio;
	}

	private void setPortfolio(Portfolio portfolio) {
		this.portfolio = portfolio;
	}
	
}
