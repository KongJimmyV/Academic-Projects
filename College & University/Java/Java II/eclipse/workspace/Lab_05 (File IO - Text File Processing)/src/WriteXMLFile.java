import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class WriteXMLFile {
	
	public static void main(String argv[]) {
		
		try {
			
			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
			
			// Root elements
			Document doc = docBuilder.newDocument();
			Element rootElement = doc.createElement("TEXT_ANALYZER");
			doc.appendChild(rootElement);
			
			// Sub elements
			Element subElement = doc.createElement("WORD");
			rootElement.appendChild(subElement);
			
//			// Set Attributes
//			Attr attr = doc.createAttribute("id");
//			attr.setValue("1");
//			subElement.setAttributeNode(attr);
			
			// shorten way
			// subElement.setAttribute("id", "1");
			
			// 1st element (WORD TEXT)
			Element firstname = doc.createElement("WORD_TEXT");
			firstname.appendChild(doc.createTextNode("not"));
			subElement.appendChild(firstname);
			
			// 2nd element (USAGE COUNT)
			Element lastname = doc.createElement("USAGE_CNT");
			lastname.appendChild(doc.createTextNode("84"));
			subElement.appendChild(lastname);
			
			// Write all content into XML
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
			StreamResult result = new StreamResult(new File("./src/file.xml"));
			
			// Output to console for testing
			// StreamResult result = new StreamResult(System.out);
			
			transformer.transform(source, result);
			
			System.out.println("File saved!");
		
		} catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		} catch (TransformerException tfe) {
			tfe.printStackTrace();
		}
	}
}