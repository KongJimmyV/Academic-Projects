import java.text.DecimalFormat;

/**
 * This is the Object class for "Grade.java".
 * 
 * It provides a template to store/calculate the scores of homework, quizzes, tests, and etc...
 * 
 * File Name: 	Grade.java
 * Date: 		3/24/2017
 * 
 * @author Jimmy Vang
 *
 */
public class Grade {

	private int earnedPoints;
	private int availablePoints;
	
	/**
	 * Create the Grade object.
	 * @param earnedPoints - set earned points from homework, a quiz, a test, and etc...
	 * @param availablePoints - set the total points available from homework, a quiz, a test, and etc...
	 */
	public Grade(int earnedPoints, int availablePoints) {
		setGrade(earnedPoints, availablePoints);
	}
	
	public void setGrade(int earnedPoints, int availablePoints) {
		this.earnedPoints = earnedPoints;
		this.availablePoints = availablePoints;
	}
	
	public double getPercentage() {
		return 100.0 * ((double)getEarnedPoints()/(double)getAvailablePoints());
	}
	
	public int getEarnedPoints() {
		return this.earnedPoints;
	}
	
	public int getAvailablePoints() {
		return this.availablePoints;
	}
	
	public String toString() {
		DecimalFormat df = new DecimalFormat("##0.00");
		String msg = df.format(getEarnedPoints()) + "/" + df.format(getAvailablePoints()) + 
				" || " + df.format(getPercentage()) + "%";
		return msg;
	}
}
