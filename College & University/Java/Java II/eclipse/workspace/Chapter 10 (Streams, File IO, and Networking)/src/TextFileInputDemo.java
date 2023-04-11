import java.io.*;
import java.util.*;

public class TextFileInputDemo {

	public static void main(String[] args) {
		
		//String fileName = "c:\\Users\\greg\\tmp\\out.txt";
		String fileName = "./src/data/data.txt";
		
		Scanner s = null;
		try {
			// Open file
			s = new Scanner(new File(fileName));
			
			while(s.hasNextLine()) System.out.println(s.nextLine());
			s.close();
		}
		catch (FileNotFoundException e) {
			System.out.println("Exception Found: " + e);
		}
		catch (Exception e) {
			System.out.println("Exception Found: " + e);
			System.exit(0);
		}
		
		
	}

}
