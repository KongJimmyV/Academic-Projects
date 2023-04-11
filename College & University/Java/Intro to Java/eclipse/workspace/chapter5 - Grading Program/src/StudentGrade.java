import java.util.Scanner;

public class StudentGrade {
	
	// Variables
	double quizPoints1 = 0;
	double quizPoints2 = 0;
	double quizTotalPoints = 0;
	double midTermExamPoints = 0;
	double finalExamPoints = 0;
	
	double quizPercentage1 = 0;
	double quizPercentage2 = 0;
	double quizTotalPercentage = 0;
	double midTermPercentage = 0;
	double finalExamPercentage = 0;
	
	double weightPercentageQuizTotal = 0;
	double weightPercentageMidTerm = 0;
	double weightPercentageFinalExam = 0;
	
	double overallScore = 0;
	double overallPercentage = 0;
	String finalGrade = "";
	
	// Grade here by calling this method.
	public void startGrading() {
		
		// Scanner
		Scanner s = new Scanner(System.in);
		
		// Greet the user.
		System.out.println("Hello.");
		System.out.println("This program will grade 2 quizzes, 1 mid-term exam, and 1 final exam.\n");
		System.out.println("Please press Enter to continue.");
		
		// Wait for the user to press enter.
		s.nextLine();
		
		// Get the quiz 1 points.
		System.out.println("Enter the Quiz 1's points. (? out of 10 points)");
		quizPoints1 = Integer.parseInt(s.nextLine());

		// Get the quiz 2 points.
		System.out.println("Enter the Quiz 2's points. (? out of 10 points)");
		quizPoints2 = Integer.parseInt(s.nextLine());

		// Get the mid-term exam points.
		System.out.println("Enter the Mid-Term Exam points. (? out of 100 points)");
		midTermExamPoints = Integer.parseInt(s.nextLine());

		// Get the final exam points.
		System.out.println("Enter the Final Exam points. (? out of 100 points)");
		finalExamPoints = Integer.parseInt(s.nextLine());
		
		// Calculate the overall score.
		calculateOverallGrade();
		
		// Calculate the final grade.
		calculateFinalGrade();
		
		// Print the results.
		System.out.println("These are the student's grades: ");
		System.out.println("     Final Exam: " + finalExamPoints + "/100");
		System.out.println("     Mid-Term Exam: " + midTermExamPoints + "/100");
		System.out.println("     Quiz 1: " + quizPoints1 + "/10");
		System.out.println("     Quiz 2: " + quizPoints2 + "/10");
		System.out.println();
		System.out.printf("     Overall Percentage: %.1f/100", overallPercentage);
		System.out.println("     Overall Points: " + overallScore + "/220");
		System.out.println("     Overall Final Grade: " + finalGrade);
		
		System.out.println();
		System.out.println("The Grading Has Ended.");
	}
	
	public void calculateOverallGrade() {
		// Get total quiz points.
		quizTotalPoints = quizPoints1 + quizPoints2;
		quizTotalPercentage = quizTotalPoints / 20;
		weightPercentageQuizTotal = quizTotalPercentage * 0.25;

		// Get total mid-term exam points.
		midTermPercentage = (midTermExamPoints / 100);
		weightPercentageMidTerm = midTermPercentage * 0.25;

		// Get total final exam points.
		finalExamPercentage = (finalExamPoints / 100);
		weightPercentageFinalExam = finalExamPercentage * 0.50;

		// Get overall points
		overallPercentage = (weightPercentageQuizTotal + weightPercentageMidTerm + weightPercentageFinalExam) * 100;
		overallScore = quizPoints1 + quizPoints2 + midTermExamPoints + finalExamPoints;
	}
	
	public void calculateFinalGrade() {
		// Get final letter grade.
		System.out.println(overallPercentage);
		if (overallPercentage >= 90 && overallPercentage <= 100) {
			finalGrade = "A";
		} 
		else if (overallPercentage >= 80 && overallPercentage < 90) {
			finalGrade = "B";
		} 
		else if (overallPercentage >= 70 && overallPercentage < 80) {
			finalGrade = "C";
		} 
		else if (overallPercentage >= 60 && overallPercentage < 70) {
			finalGrade = "D";
		} 
		else if (overallPercentage >= 0 && overallPercentage < 60) {
			finalGrade = "F";
		} 
		else {
			finalGrade = "N/A";
		}
	}
}
