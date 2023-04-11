//package
package chapter7;

//imports
import java.text.DecimalFormat;

////////////////////////////////////////////////////////////////////
/**
 * Description:
 * 		- This class file will calculate the GPA for Western.
 * 		- This file was created using a stubbed out class (Made by: Gregory Steel) which 
 * 		provided the flow and structure of the program.
 * 
 * File Name:	WesternGPACalculator.java
 * Created by: 	Jimmy Vang
 * Date:		Oct 26, 2016
 * 
 * 
 */
////////////////////////////////////////////////////////////////////

//Start of WesternGPACalculator
public class WesternGPACalculator {
   
    public static void main(String[] args) {
        
        //Set an array for the grades earned for 4 classes.
        double[] grade = new double [4];
        grade[0] = 4.00;
        grade[1] = 2.50;
        grade[2] = 2.00;
        grade[3] = 1.00;
        
        //Use a method to print the min and max grades as letter grades.
        printGradeStats(grade);
        
        //Set an array to hold the credits for each of the 4 classes.
        int[] credit = new int[4];
        credit[0] = 3;
        credit[1] = 3;
        credit[2] = 3;
        credit[3] = 3;
        
        //Use a method to calculate and print the GPA as both a number and a letter grade
        printGPA(grade, credit);
    }
    
    /**
     * Precondition:	Accept an array of grades.
     * Postcondition:	Print min and max grade letter and return void.
     */
    private static void printGradeStats(double[] grade){
        
        //Determine the min and max grade.
        double minGrade = Double.MAX_VALUE;
        double maxGrade = 0;
        
        for (int i = 0; i < grade.length; i++) {
        	//Determine min grade.
        	if (grade[i] < minGrade) {
        		minGrade = grade[i];
        	}
        		
        	//Determine max grade.
        	if (grade[i] > maxGrade) {
        		maxGrade = grade[i];
        	}
        }
        
        //Convert the min and max grades to a letter grade.
        String minLetterGrade = convertToLetterGrade(minGrade);
        String maxLetterGrade = convertToLetterGrade(maxGrade);
        
        //Output the max and min grade.    
        System.out.println(
        		"Max grade earned in a class was " + maxLetterGrade + 
				"\n" + 
				"Min grade earned in a class was " + minLetterGrade);
    }
    
    /**
     * Precondition:	Accept a single grade score.
     * Postcondition:	Convert a grade to a letter grade and return it.
     * 		A = 4.0
     * 		4.0 > A/B >= 3.5
     * 		3.5 > B >= 3.0
     * 		3.0 > B/C >= 2.5
     * 		2.5 > C >= 2.0
     * 		2.0 > D >= 1.0
     * 		F < 1.0
     */
    private static String convertToLetterGrade(double grade){
        
    	//Set letter grade as string.
        String letterGrade = "F";
        
        //Convert grade to letter grade.
        if 		(grade == 4.0) 	{
        	letterGrade = "A";
        } 
        else if (grade >= 3.5) 	{
        	letterGrade = "A/B";
        } 
        else if (grade >= 3.0)	{
        	letterGrade = "B";
        } 
        else if	(grade >= 2.5)	{
        	letterGrade = "B/C";
        } 
        else if	(grade >= 2.0)	{
        	letterGrade = "C";
        } 
        else if	(grade >= 1.0)	{
        	letterGrade = "D";
        } 
        else if	(grade < 1.0)	{
        	letterGrade = "F";
        } 
        else {
        // Fail-safe else statement in case of an error.
        	letterGrade = "***An Error Has Occured In The Program.***";
        }
        
        //Return letter grade string.
        return letterGrade;        
    }
    
    /**
     * Precondition:	Accept an array of grades and credits.
     * Postcondition:	Print the cumulative GPA as a letter grade and return void.
     */
    private static void printGPA(double[] grade, int[] credit){
    
        //Get sum of grades points and credits.
    	double totalGradePoints = 0;
    	int totalCredit = 0;
    	
    	for (int i = 0; i < grade.length && i < credit.length; i++) {
    		totalGradePoints += grade[i] * credit[i];
    	}
    	
    	for (int i = 0; i < credit.length; i++) {
    		totalCredit += credit[i];
    	}
    	
        //Calculate Cumulative GPA
    	double cumulativeGPA =  totalGradePoints / totalCredit;
    	String cumulativeLetterGrade = convertToLetterGrade(cumulativeGPA);
    	
        //Output Cumulative GPA as both a number and a grade  
    	DecimalFormat df = new DecimalFormat("#0.000");
    	System.out.println(
    				"Cumulative GPA: " + df.format(cumulativeGPA) + 
    				"\n" + 
    				"Cumulative GPA as letter grade: " + cumulativeLetterGrade);
    }
}
