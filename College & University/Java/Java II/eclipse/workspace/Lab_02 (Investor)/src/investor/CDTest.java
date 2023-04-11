package investor;

import org.junit.Test;

import static org.junit.Assert.*;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CDTest {

	static int testNum = 0;
	static int numPassed = 0;
	static int numFailed = 0;
	
	@Test
	/**
	 * Test calcMaturityDate() method.
	 * @throws ParseException
	 */
	public void calcMaturityDate() throws ParseException {
		
		// TEST 1
		testNum++;
		
		String strStartingDate 	= "2005/01/01 00:00:00";
		String strExpectedDate 	= "2006/01/01 00:00:00";
		int months = 12;
		
		// Create DateFormat that works with Date.
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		// Create Date and put strStartDate into it.
		Date purchaseDate = dateFormat.parse(strStartingDate);
		
		// Create a CD to test with the purchaseDate and months set up.
		CD cd = new CD(null, null, 0, purchaseDate, months, 0, 0, 0);
		
		// Get the actual date from the CD's maturity date as a string.
		String strActualDate = dateFormat.format(cd.calcMaturityDate());
		
		// DEBUG MESSAGES
		System.out.println("***TESTING*** 'calcMaturityDate()'");	// Print Test Title
		System.out.println("Test Number: " + testNum);	// ITERATE testNum
		System.out.println();
		System.out.println("\tNumber of Months the money is invested: " + months);		
		System.out.println();
		System.out.println("\tPurchase Date: " + dateFormat.format(cd.getPurchaseDate()));	// Print the Purchase date.
		System.out.println("\tACTUAL Maturity Date: " + strActualDate);	// Print the Maturity date.
		System.out.println("\tEXPECTED Maturity Date: " + strExpectedDate);
		
		// Check if cd's DATE equals EXPECTED DATE. (using strings like "2006/01/01 00:00:00")
		
		if (strActualDate.equals(strExpectedDate)) {
			System.out.println("***PASSED***\n");
		}
		else {
			System.out.println("***FAILED*** (Actual value is not equal to Expected value.)\n");
			fail();
		}
		
	}
	
	@Test
	/**
	 * Test calcInterestEarned() method.
	 */
	public void calcInterestEarned() throws ParseException {
		
		///////////
		// TEST 1
		testNum++;
		
		String strStartingDate 		= "2005/01/01 00:00:00";
		String strWithdrawalDate 	= "2006/01/01 00:00:00";
		long startingAmount = 100000;	// in cents
		double expectedInterest = 15;	// in dollars
		
		int months = 12;
		double annualRate = 0.015;
		int compoundingType = CD.CD_COMPOUND_ANNAULLY;
		
		// Create DateFormat that works with Date.
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		// Create Dates.
		Date purchaseDate = dateFormat.parse(strStartingDate);
		Date withdrawalDate = dateFormat.parse(strWithdrawalDate);
		
		// Create a CD to test on.
		CD cd = new CD(null, null, startingAmount, purchaseDate, months, annualRate, compoundingType, 0);
		
		// Get the actual interest earned.
		long actualInterest = cd.calcInterestEarned(withdrawalDate);
		
		// DEBUG MESSAGES
		System.out.println("***TESTING*** 'calcInterestEarned()'");	// Print Test Title
		System.out.println("Test Number: " + testNum);
		System.out.println();
		System.out.println("\tNumber of Months the money is invested: " + months);
		System.out.println("\tAnnual Rate: " + annualRate);
		System.out.println("\tCompounding Type: " + compoundingType);
		System.out.println();
		System.out.println("\tACTUAL Interest Earned: " + actualInterest);	// Print the Maturity date.
		System.out.println("\tEXPECTED Interest Earned: " + expectedInterest);
		
		// Check if cd's DATE equals EXPECTED DATE. (using strings like "2006/01/01 00:00:00")
		if (actualInterest == expectedInterest) {
			System.out.println("NEXT TEST\n");
		}
		else {
			System.out.println("***FAILED*** (Actual value is not equal to Expected value.)\n");
			fail();
		}
		
		//TODO:
		///////////
		// TEST 2
		strStartingDate 	= "2015/01/01 00:00:00";
		strWithdrawalDate 	= "2020/01/01 00:00:00";
		startingAmount = 100000;	// in cents
		expectedInterest = 124.70;	// in dollars
		
		months = 60;
		annualRate = 0.0235;
		compoundingType = CD.CD_COMPOUND_MONTHLY;
		
		// Create DateFormat that works with Date.
		dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		// Create Dates.
		purchaseDate = dateFormat.parse(strStartingDate);
		withdrawalDate = dateFormat.parse(strWithdrawalDate);
		
		// Create a CD to test on.
		cd = new CD(null, null, startingAmount, purchaseDate, months, annualRate, compoundingType, 0);
		
		// Get the actual interest earned.
		actualInterest = cd.calcInterestEarned(withdrawalDate);
		
		// DEBUG MESSAGES
		System.out.println("***TESTING*** 'calcInterestEarned()'");	// Print Test Title
		System.out.println("Test Number: " + testNum);
		System.out.println();
		System.out.println("\tNumber of Months the money is invested: " + months);
		System.out.println("\tAnnual Rate: " + annualRate);
		System.out.println("\tCompounding Type: " + compoundingType);
		System.out.println();
		System.out.println("\tACTUAL Interest Earned: " + actualInterest);	// Print the Maturity date.
		System.out.println("\tEXPECTED Interest Earned: " + expectedInterest);
		
		// Check if cd's DATE equals EXPECTED DATE. (using strings like "2006/01/01 00:00:00")
		if (actualInterest == expectedInterest) {
			System.out.println("***PASSED***\n");
		}
		else {
			System.out.println("***FAILED*** (Actual value is not equal to Expected value.)\n");
			fail();
		}
	}

}
