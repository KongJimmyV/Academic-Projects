import java.io.*;

public class TextFileOutputDemo {

	public static void main(String[] args) {
		//String fileName = "c:\\Users\\greg\\tmp\\out.txt";
		String path = "./src/data/data.txt";
		File file = new File(path);
		
		// Get object ready
		PrintWriter outputStream = null;
		
		try {
			outputStream = new PrintWriter(file);
			
			outputStream.println(""
					+ "This is line 1.\n"
					+ "This is line 2.\n"
					+ "This is line 3.\n");
			
			outputStream.checkError();
			outputStream.close();
			
		}
		catch (FileNotFoundException e) {
			System.out.println("Exception Discovered: A File Not Found Exception has occured.\n " + e);
		}
		catch (Exception e) {
			System.out.println("Exception Discovered: " + e);
		}
	}

}
