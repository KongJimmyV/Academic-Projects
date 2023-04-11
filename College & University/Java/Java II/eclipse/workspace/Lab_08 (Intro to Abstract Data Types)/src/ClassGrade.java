import java.text.DecimalFormat;

/**
 * This is the Object class for "ClassGrade.java".
 * 
 * It provides a template to store/calculate the grade obtained from a unique course/class.
 * 
 * File Name: 	ClassGrade.java
 * Date: 		3/24/2017
 * 
 * @author Jimmy Vang
 *
 */
public class ClassGrade {

	private String classId;
	private int credits;
	private double grade;
	
	/**
	 * Create the ClassGrade object.
	 * @param classId - set Unique class id to store.
	 * @param credits - set Credits earned from class.
	 * @param grade - set Grade earned from class.
	 */
	public ClassGrade(String classId, int credits, double grade) {
		this.classId = classId;
		this.credits = credits;
		this.grade = grade;
	}
	
	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public int getCredits() {
		return credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}     
	
	public double getGradePoints() {
		return getCredits()*getGrade();
	}
	
	public String toString() {
		DecimalFormat df = new DecimalFormat("##0.00");
		String msg = "Class: " + getClassId() + 
				"   ||   Credits: " + getCredits() + 
				"   ||   Grade: " + df.format(getGrade()) + 
				"   ||   Grade Points: " + df.format(getGradePoints());
		return msg;
	}
}
