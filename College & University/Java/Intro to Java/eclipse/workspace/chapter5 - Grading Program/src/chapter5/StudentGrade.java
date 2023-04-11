package chapter5;

import javax.swing.JOptionPane;

////////////////////////////////////////////////////////////////////
/*
 * This class file demos the StudentGrade.java file.
 * 
 * File Name:	StudentGrade.java
 * Created by: 	Jimmy Vang
 * Date:		Oct 12, 2016
 * 
 * Used with: 	StudentGradeDemo.java
 * 
 */
////////////////////////////////////////////////////////////////////
import javax.xml.bind.SchemaOutputResolver;

public class StudentGrade {
	////////////////////////////////////////////////////////////////////
	// Define this class's variables
	double pointsQuiz1 					= 0;
	double pointsQuiz2 					= 0;
	double pointsQuizTotal	 			= 0;
	double pointsMidTermExam 			= 0;
	double pointsFinalExam 				= 0;
	double pointsOverall 				= 0;
	
	double percentageQuiz1 				= 0;
	double percentageQuiz2 				= 0;
	double percentageQuizTotal 			= 0;
	double percentageMidTerm 			= 0;
	double percentageFinalExam 			= 0;
	double percentageOverall 			= 0;
	
	double weightPercentageQuizTotal 	= 0;
	double weightPercentageMidTerm 		= 0;
	double weightPercentageFinalExam 	= 0;
	
	String gradeQuiz1 					= "";
	String gradeQuiz2 					= "";
	String gradeQuizTotal	 			= "";
	String gradeMidTerm 				= "";
	String gradeFinalExam 				= "";
	String gradeOverall 				= "";
	
	final double QUIZ_WEIGHT 				= 0.25;
	final double MIDTERM_EXAM_WEIGHT 		= 0.25;
	final double FINAL_EXAM_WEIGHT 			= 0.50;
	
	final double TOTAL_POINTS_QUIZ1 			= 10;
	final double TOTAL_POINTS_QUIZ2 			= 10;
	final double TOTAL_POINTS_ALL_QUIZZES 		= TOTAL_POINTS_QUIZ1 + TOTAL_POINTS_QUIZ2;
	final double TOTAL_POINTS_MIDTERM_EXAM 		= 100;
	final double TOTAL_POINTS_FINAL_EXAM 		= 100;
	////////////////////////////////////////////////////////////////////
	// JOptionPane variables
	String title = "Simple Grading Program";
	String message = "n/a";
	
	////////////////////////////////////////////////////////////////////
	// Main Menu Method.
	public void startMainMenu() {
		while (true) {
			////////////////////////////////////////////////////////////////////
			// Welcome user to the main menu.
			message = "Welcome.\n"
					+ "This program is designed to grade 2 quizzes, 1 mid-term, and 1 final exam.\n\n"
					+ "Please click \"Start\" to continue.";
			
			String choices[] = {"Start", "Quit"};
			int button = JOptionPane.showOptionDialog(null, message, title, 
					JOptionPane.YES_NO_OPTION, JOptionPane.PLAIN_MESSAGE, null, choices, choices[0]);
			////////////////////////////////////////////////////////////////////
			// (Clicked "Start") Get input about the quizzes, the mid-term exam, and the final exam.
			if (button == JOptionPane.YES_OPTION) {
				getInput();
				// return to demo.
				return;
			}
			// (Clicked "Quit") Ask user about quitting.
			else if (button == JOptionPane.NO_OPTION)
				exit();
			// (Clicked Red X) Ask user about quitting.
			else
				exit();
		}
	}

	////////////////////////////////////////////////////////////////////
	// Get Input Method for getting user input.
	private void getInput() {
		////////////////////////////////////////////////////////////////////
		// Explain to user the following.
		message = "You will be asked a series of questions regarding the following:\n" 
				+ "     Quiz 1 (10 points)\n"
				+ "     Quiz 2 (10 points)\n" 
				+ "     Mid-Term Exam (100 points)\n" 
				+ "     Final Exam (100 points)\n";
		JOptionPane.showMessageDialog(null, message, title, JOptionPane.INFORMATION_MESSAGE, null);
		while (true) {
			String input = null;
			int button = 0;
			////////////////////////////////////////////////////////////////////
			// Ask for quiz 1's points.
			while (true) {
				try {
					message = "Enter Quiz 1's points. (total of 10 points)";
					input = JOptionPane.showInputDialog(null, message, title, JOptionPane.QUESTION_MESSAGE);
					////////////////////////////////////////////////////////////////////
					// Check Input
					if (input != null) {
						pointsQuiz1 = Double.parseDouble(input);
						if (pointsQuiz1 > 10 || pointsQuiz1 < 0) {
							message = "Please type in a value from 0 to 10.";
							JOptionPane.showMessageDialog(null, message, title, JOptionPane.WARNING_MESSAGE, null);
						}
						else {
							break;
						}
					// Ask user about quitting
					} else {
						exit();
					}
				}
				// Check for input error
				catch (NumberFormatException e) {
					JOptionPane.showMessageDialog(null, "Please retype the value.", "NumberFormatException",
							JOptionPane.ERROR_MESSAGE, null);
					input = null;
				}
			}
			////////////////////////////////////////////////////////////////////
			// Ask for quiz 2's points.
			while (true) {
				try {
					message = "Enter Quiz 2's points. (total of 10 points)";
					input = JOptionPane.showInputDialog(null, message, title, JOptionPane.QUESTION_MESSAGE);
					////////////////////////////////////////////////////////////////////
					// Check Input
					if (input != null) {
						pointsQuiz2 = Double.parseDouble(input);
						if (pointsQuiz2 > 10 || pointsQuiz2 < 0) {
							message = "Please type in a value from 0 to 10.";
							JOptionPane.showMessageDialog(null, message, title, JOptionPane.WARNING_MESSAGE, null);
						}
						else {
							break;
						}
					// Ask user about quitting
					} else {
						exit();
					}
				}
				// Check for input error
				catch (NumberFormatException e) {
					JOptionPane.showMessageDialog(null, "Please retype the value.", "NumberFormatException",
							JOptionPane.ERROR_MESSAGE, null);
					input = null;
				}
			}
			////////////////////////////////////////////////////////////////////
			// Ask for mid-term exam's points.
			while (true) {
				try {
					message = "Enter Mid-Term Exam's points. (total of 100 points)";
					input = JOptionPane.showInputDialog(null, message, title, JOptionPane.QUESTION_MESSAGE);
					////////////////////////////////////////////////////////////////////
					// Check Input
					if (input != null) {
						pointsMidTermExam = Double.parseDouble(input);
						if (pointsMidTermExam > 100 || pointsMidTermExam < 0) {
							message = "Please type in a value from 0 to 100.";
							JOptionPane.showMessageDialog(null, message, title, JOptionPane.WARNING_MESSAGE, null);
						}
						else {
							break;
						}
					// Ask user about quitting
					} else {
						exit();
					}
				}
				// Check for input error
				catch (NumberFormatException e) {
					JOptionPane.showMessageDialog(null, "Please retype the value.", "NumberFormatException",
							JOptionPane.ERROR_MESSAGE, null);
					input = null;
				}
			}
			////////////////////////////////////////////////////////////////////
			// Ask for final exam's points.
			while (true) {
				try {
					message = "Enter Final Exam's points. (total of 100 points)";
					input = JOptionPane.showInputDialog(null, message, title, JOptionPane.QUESTION_MESSAGE);
					////////////////////////////////////////////////////////////////////
					// Check Input
					if (input != null) {
						pointsFinalExam = Double.parseDouble(input);
						if (pointsFinalExam > 100 || pointsFinalExam < 0) {
							message = "Please type in a value from 0 to 100.";
							JOptionPane.showMessageDialog(null, message, title, JOptionPane.WARNING_MESSAGE, null);
						}
						else {
							break;
						}
					// Ask user about quitting
					} else {
						exit();
					}
				}
				// Check for input error
				catch (NumberFormatException e) {
					JOptionPane.showMessageDialog(null, "Please retype the value.", "NumberFormatException",
							JOptionPane.ERROR_MESSAGE, null);
					input = null;
				}
			}
			////////////////////////////////////////////////////////////////////
			// Ask user to check all inputs.
			while (true) {
				message = "Is this correct? (Click \"Yes\" to continue, click \"No\" to retype values.\n"
						+ "     Quiz 1:  -------------------  " + pointsQuiz1 + "\n"
						+ "     Quiz 2:  -------------------  " + pointsQuiz2 + "\n"
						+ "     Mid-Term Exam:  -----  " + pointsMidTermExam + "\n"
						+ "     Final Exam:  ------------  " + pointsFinalExam;
				
				String choices[] = {"Yes", "No"};
				button = JOptionPane.showOptionDialog(null, message, title, 
						JOptionPane.YES_NO_OPTION, JOptionPane.PLAIN_MESSAGE, null, choices, choices[0]);
				////////////////////////////////////////////////////////////////////
				// (Clicked "Yes") Calculate Scores
				if (button == JOptionPane.YES_OPTION) {
					calculateGrade();
					// return to main menu
					return;
				}
				// (Clicked "No") Retype all pointss 
				else if (button == JOptionPane.NO_OPTION)
					break;
				// (Clicked Red X) Ask user about quitting.
				else
					exit();
			}
		}
	}
	
	////////////////////////////////////////////////////////////////////
	// Calculate Grade Method for calculating a letter grade.
	private void calculateGrade() {
		////////////////////////////////////////////////////////////////////
		// Get Quiz Total Score
		pointsQuizTotal = pointsQuiz1 + pointsQuiz2;
		percentageQuizTotal = pointsQuizTotal / TOTAL_POINTS_ALL_QUIZZES;
		weightPercentageQuizTotal = percentageQuizTotal * QUIZ_WEIGHT;
		////////////////////////////////////////////////////////////////////
		// Get Mid-Term Exam Score
		percentageMidTerm = (pointsMidTermExam / TOTAL_POINTS_MIDTERM_EXAM);
		weightPercentageMidTerm = percentageMidTerm * MIDTERM_EXAM_WEIGHT;
		////////////////////////////////////////////////////////////////////
		// Get Final Exam Score
		percentageFinalExam = (pointsFinalExam / TOTAL_POINTS_FINAL_EXAM);
		weightPercentageFinalExam = percentageFinalExam * FINAL_EXAM_WEIGHT;
		////////////////////////////////////////////////////////////////////
		// Get Overall Score
		percentageOverall = (weightPercentageQuizTotal + weightPercentageMidTerm + weightPercentageFinalExam) * 100;
		pointsOverall = pointsQuiz1 + pointsQuiz2 + pointsMidTermExam + pointsFinalExam;
		// Get Overall Grade Letter
		if (percentageOverall >= 90 && percentageOverall <= 100 )
			gradeOverall = "A";
		else if (percentageOverall >= 80 && percentageOverall < 90 )
			gradeOverall = "B";
		else if (percentageOverall >= 70 && percentageOverall < 80 )
			gradeOverall = "C";
		else if (percentageOverall >= 60 && percentageOverall < 70 )
			gradeOverall = "D";
		else if (percentageOverall >= 0 && percentageOverall < 60 )
			gradeOverall = "F";
		else 
			gradeOverall = "?";
		////////////////////////////////////////////////////////////////////
		// Display and output results
		getOutput();
	}
	
	////////////////////////////////////////////////////////////////////
	// Get Output Method for showing grading results.
	private void getOutput() {
		message = "Student's Record:\n"
				+ "     Quiz 1:  -------------------  " + pointsQuiz1 + "/10\n"
				+ "     Quiz 2:  -------------------  " + pointsQuiz2 + "/10\n"
				+ "     Mid-Term Exam:  -----  " + pointsMidTermExam + "/100\n"
				+ "     Final Exam:  ------------  " + pointsFinalExam + "/100\n\n"
				+ "     Overall Points:  --------  " + pointsOverall + "/220\n"
				+ "     Overall Grade:  --------  '" + gradeOverall + "'";
		JOptionPane.showMessageDialog(null, message, title, JOptionPane.PLAIN_MESSAGE, null);
	}
	
	public void restart() {
		while (true) {
			// Ask to restart program.
			String message = "Would you like to restart the program?";
			
			String choices[] = {"Yes", "No"};
			int button = JOptionPane.showOptionDialog(null, message, title, 
					JOptionPane.YES_NO_OPTION, JOptionPane.PLAIN_MESSAGE, null, choices, choices[0]);
			////////////////////////////////////////////////////////////////////
			// (Clicked "Yes") Restart Program.
			if (button == JOptionPane.YES_OPTION) {
				break;
			}
			// (Clicked "No") Ask user about quitting.
			else if (button == JOptionPane.NO_OPTION)
				exit();
			// (Clicked Red X) Ask user about quitting.
			else
				exit();
		}
	}
	////////////////////////////////////////////////////////////////////
	// Confirm quit/exit Method
	public void exit() {
		////////////////////////////////////////////////////////////////////
		// Ask user about quitting.
		title = title + " (Quitting)";
		message = "Are you sure you want to quit?";
		int exit = JOptionPane.showConfirmDialog(null, message, title, 
				JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null);
		////////////////////////////////////////////////////////////////////
		// (Clicked Ok) Quit
		if (exit == JOptionPane.OK_OPTION) {
			System.exit(0);
			}
		// (Clicked Cancel) Return back
		else if (exit == JOptionPane.CANCEL_OPTION) {
			title = "Simple Grading Program";
			return;
			}
		// (Clicked X) Return back
		else if (exit == JOptionPane.CLOSED_OPTION) {
			title = "Simple Grading Program";
			return;
			}
		// (Else) Return back
		else {
			title = "Simple Grading Program";
			return;
		}
	}
	
	
}
