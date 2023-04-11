import java.io.*;

public class BinaryInputDemo {

	public static void main(String[] args) {
		String fileName = "./src/data/numbers.bin";
		try
		{
			ObjectInputStream inputStream = 
					new ObjectInputStream(
							new FileInputStream(fileName));
			System.out.println();
			System.out.println();
			int anInteger = inputStream.readInt();
			
			try {
				while (true) {
					System.out.println(anInteger);
					anInteger = inputStream.readInt();
				}

			} catch (EOFException e) {
				System.out.println();
			}
			
			System.out.println("End of reading from file.");
			inputStream.close();
		}
		catch(FileNotFoundException e) {
			System.out.println("Problem opening the file " + fileName);
		}
		catch(EOFException e) {
			System.out.println("Problem reading the file " + fileName);
			System.out.println("Reached end of the file");
		}
		catch(IOException e) {
			System.out.println("Problem reading the file " + fileName);
		}
		catch(Exception e) {
			System.out.println("Unknown Exception " + e);
			e.printStackTrace();
		}
	}

}
