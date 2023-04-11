import java.io.*;
import java.util.*;

public class BinaryOutputDemo {

	public static void main(String[] args) {

		String fileName = "./src/data/numbers.bin";
		try {
			ObjectOutputStream out = 
					new ObjectOutputStream(
							new FileOutputStream(fileName));
			
			Scanner in = new Scanner(System.in);
			System.out.println("Enter non-negative:");
			System.out.println("Place a negative number at the end.");
			
			int wholeNum;
			do {
				wholeNum = in.nextInt();
				out.writeInt(wholeNum);
			} while(wholeNum >= 0);
			
			System.out.println("Numbers and sentinel value");
			out.close();
			in.close();
			
		}
		catch (FileNotFoundException e) {
			System.err.println("File not found.");
			System.err.println("\\\\\\ PROGRAM TERMINATED ///");
			System.exit(0);
		}
		catch (Exception e) {
			//TODO: Handle Exception e
		}
	}

}
