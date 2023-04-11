import java.io.*;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;

/**
 * 
 * Name: 			TextFileAnalyzerDemo.java
 * Description: 	This file is a demo that tests the TextFileAnalyzer.java class/object file.
 * Date: 			2/20/2017
 * 
 * @author Jimmy Vang
 *
 */
public class TextFileAnalyzerDemo {

	public static void main(String[] args) {
		
		// Welcome User
		System.out.println("***Welcome to the Text File Analyer Demo!");
		System.out.println("This demo will count words from a text file (.txt) and output the results into an xml file (.xml).");
		System.out.println();
		System.out.println("---------------------------------------------------------------------------------------------------------------");
		
		// Prepare files for analyzing.
		File demoInputPath[] = new File[4];
		File demoXMLPath[] = new File[4];
		
		// Add INPUT files here
		demoInputPath[0] = new File("./src/test.txt");
		demoInputPath[1] = new File("./src/green_eggs_and_ham.txt");
		demoInputPath[2] = new File("./src/shakespeare.txt");
		demoInputPath[3] = new File("./src/treasure_island.txt");
		
		// Add OUTPUT xml files here
		demoXMLPath[0] = new File("./src/test.xml");
		demoXMLPath[1] = new File("./src/green_eggs_and_ham.xml");
		demoXMLPath[2] = new File("./src/shakespeare.xml");
		demoXMLPath[3] = new File("./src/treasure_island.xml");
		
		try {
			// Create a new TextFileAnalyzer.
			TextFileAnalyzer tfa = null;
			
			// Loop and Analyze All Files
			for (int i = 0; i < demoInputPath.length; i ++) {
				System.out.println("***Attempting to analyze " + demoInputPath[i].getName() + " ***");
				
				// Create a Text File Analyzer on "tfa".
				tfa = new TextFileAnalyzer(demoInputPath[i], demoXMLPath[i]);
				
				// Process input file.
				System.out.println("Processing Input File...");
				tfa.processInput();
				
				// Generate output XML file.
				System.out.println("Generating Stats File (XML)...");
				tfa.generateStatsFile();
				System.out.println("---------------------------------------------------------------------------------------------------------------");
			}
				
			// End of program
			System.out.println("***Program ended successfully***");
			
			
		} catch (FileNotFoundException fnf) {
			System.err.println("We couldn't find the file. "
					+ "\n"
					+ "\nHere's the actual exception message: " + fnf);
			//fnf.printStackTrace();
			System.err.println("***Program ended***");
			System.exit(0);
			
		} catch (IOException io) {
			System.err.println("IOException has occured! \n" + io);
			//io.printStackTrace();
			System.err.println("***Program ended***");
			System.exit(0);
			
		} catch (ParserConfigurationException pce) {
			System.err.println("ParserConfigurationException has occured! \n" + pce);
			//pce.printStackTrace();
			System.err.println("***Program ended***");
			System.exit(0);
			
		} catch (TransformerException tfe) {
			System.err.println("TransformerException has occured! \n" + tfe);
			//tfe.printStackTrace();
			System.err.println("***Program ended***");
			System.exit(0);
			
		} catch (Exception e) {
			System.err.println("An Unexpected Exception has occured! \n");
			e.printStackTrace();
			System.err.println("***Program ended***");
			System.exit(0);
		}
	}

}
