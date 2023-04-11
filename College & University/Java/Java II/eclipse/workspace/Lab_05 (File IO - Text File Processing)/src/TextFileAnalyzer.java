// IO imports
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

// UTIL imports
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Scanner;

// XML imports
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

// Document imports
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 * 
 * Name: 			TextFileAnalyzer.java
 * Description: 	This program will analyze any input file you give it using's own processInput() method then generate the 
 * 						stats of each word via word count.
 * Date: 			2/20/2017
 * 
 * @author Jimmy Vang
 *
 */
public class TextFileAnalyzer {

	// These define the object.
	private File inputFile;			// The input file.
	private File statsXMLFile;		// The XML file.
	private ArrayList<Word> words;	// Hold word objects using ArrayList.
	
	/** Build the object using this constructor.
	 * @param inputFile - The input file to READ from.
	 * @param statsXMLFile - The XML file to WRITE stats to.
	 */
	public TextFileAnalyzer(File inputFile, File statsXMLFile) {
		this.inputFile = inputFile;
		this.statsXMLFile = statsXMLFile;
		this.words = new ArrayList<Word>();
	}
	
	/** Process the input file and store each unique word while counting it, then sort it. (Default file extension usually is: .TXT)
	 * @throws IOException 
	 */
	public void processInput() throws IOException {
		
		// Check if the inputFile exists, can read, and can write.
		if(!inputFile.exists()) {
			System.err.print(inputFile.getName() + " does not exist!\n\n");
			System.err.println("\tAn Input File is required to continue!\n"
					+ "\t" + inputFile.getCanonicalPath());
			System.err.println();
			System.err.println("***Program ended!***");
			System.exit(0);
		}
		else if(!inputFile.canRead()) {
			System.err.print(inputFile.getName() + " cannot be read from!\n");
			System.err.println("***Program ended!***");
			System.exit(0);
		}
		else if(!inputFile.canWrite()) {
			System.err.print(inputFile.getName() + " cannot be written to!\n");
			System.err.println("***Program ended!***");
			System.exit(0);
		}
		
		// Open the input file
		FileInputStream fis = new FileInputStream(inputFile);
		Scanner s = new Scanner(fis);
		
		// Start populating ArrayList
		while(s.hasNext()) {
			
			// Get the "next word"
			String nextWord = s.next();
			
			// Filter/Remove common punctuation/symbols.
			String regex = "[,.\"!?<>();:]";
			nextWord = nextWord.replaceAll(regex, "");
			nextWord = nextWord.trim();			// Trim all whitespaces.
			
			nextWord = nextWord.toLowerCase();	// Set the "next word" to lowercase.
			
			// Create "wordObject" from "nextWord".
			Word nextWordObject = new Word(nextWord);
			
			// Is the "nextWord" is in ArrayList???
			if(words.contains(nextWordObject)) {
				// Yes, increment word usage of that word object.
				int index = words.indexOf(nextWordObject);
				words.get(index).incrementUsage();
			}
			else {
				// No, add the word to ArrayList and increment word usage.
				words.add(nextWordObject);
				int index = words.indexOf(nextWordObject);
				words.get(index).incrementUsage();
			}
		}
		
		// Sort the ArrayList and remove all single-character white-space characters.
		words.sort(null);
		words.remove(" ");
		
		// Close Scanner and FileInputStream
		s.close();
		fis.close();
	}
	
	/** Generate the stats file. (Default file extension is: .XML)
	 * @throws ParserConfigurationException 
	 * @throws TransformerException 
	 * @throws IOException 
	 */
	public void generateStatsFile() throws ParserConfigurationException, TransformerConfigurationException, TransformerException, IOException {
		
		// Attempt to generate a stats file.
		// Uses XML format.
		
		// Setup document builders.
		DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
		
		// Create a new document.
		Document doc = docBuilder.newDocument();
		
		// Root elements <TEXT_ANALYZER>
		Element rootElement = doc.createElement("TEXT_ANALYZER");
		doc.appendChild(rootElement);
		
		for(int index = 0; index < words.size(); index++) {
			// Sub elements <WORD>
			Element subElement = doc.createElement("WORD");
			rootElement.appendChild(subElement);
			
				// 1st element of sub <WORD TEXT>
				Element first = doc.createElement("WORD_TEXT");
				
				String wordText = words.get(index).getWord();	// Get word variable from the Word.java object/class.
				first.appendChild(doc.createTextNode(wordText));
				
				subElement.appendChild(first);	// Attach WORD TEXT to subElement 
				
				// 2nd element of sub <USAGE COUNT>
				Element second = doc.createElement("USAGE_CNT");
				
				int tempInt = words.get(index).getUsageCnt();	// Get usageCount int variable from the Word.java object/class.
				String usageCount = String.valueOf(tempInt);	
				second.appendChild(doc.createTextNode(usageCount));
				
				subElement.appendChild(second);
		}
		
		// Write all content into XML
		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		DOMSource source = new DOMSource(doc);
		
		StreamResult streamResult = new StreamResult(statsXMLFile);
		
		// Output to console for testing
		//StreamResult streamResultSysOut = new StreamResult(System.out);
		//transformer.transform(source, streamResultSysOut);	// System.out Console
		
		// Output content using XML Transformer class.
		transformer.transform(source, streamResult);	// File
		
		// Alert user that file was saved successfully.
		System.out.println("\tThe file \""+ statsXMLFile.getName() +"\" was successfully generated and saved. \n\n"
				+ "\tPath ---> " + statsXMLFile.getCanonicalPath());
		System.out.println();
	}
}
