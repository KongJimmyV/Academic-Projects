import java.io.*;
import java.util.*;

public class MontyBinaryIO {

	public static void main(String[] args) {
		
		try {
			MontyBinaryIO io = new MontyBinaryIO();
			File f = new File("./src/data/monty.dat");
			//io.writeStrings(f);
			io.readStrings(f);
		}
		catch (Exception e) {
			System.err.println("ERROR");
			e.printStackTrace();
			System.exit(0);
		}
	}
	
	public void writeStrings(File f) throws Exception{
		Scanner s = new Scanner(System.in);
		
		String dialog = "Stop! Who approaches the Bridge of Death \n"
				+ "must answer me these questions three!";
		System.out.println(dialog);
		
		//Question 1
		String question1 = "What is your name?";
		System.out.println(question1);
		String resp1 = s.nextLine();
		
		//Question 2
		String question2 = "What is your quest?";
		System.out.println(question2);
		String resp2 = s.nextLine();
		
		//Question 3
		String question3 = "What is your favorite color?";
		System.out.println(question3);
		String resp3 = s.nextLine();
		
		System.out.println("\nYou may cross, and I will save your answers.");
	
		ObjectOutputStream oos = 
				new ObjectOutputStream(
						new FileOutputStream(f));
		
		oos.writeUTF(resp1);
		oos.writeUTF(resp2);
		oos.writeUTF(resp3);
		
		oos.close();
		s.close();
	}

	public void readStrings(File f) throws Exception {
		ObjectInputStream ois =
				new ObjectInputStream(
						new FileInputStream(f));
		String resp1 = ois.readUTF();
		String resp2 = ois.readUTF();
		String resp3 = ois.readUTF();
		
		System.out.println("Response 1: " + resp1 
				+ "\nResponse 2: " + resp2 
				+ "\nResponse 3: " + resp3);
		
		ois.close();
	}
}
