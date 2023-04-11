import java.io.File;
import java.util.Random;

/**
 * This demo will test CipherIO, SecretAgent, and CaesarCipher to see if they will encrypt correctly.
 * 
 * File Name: 	CorrespondenceDemo.java
 * Date: 		3/27/2017
 * 
 * @author Gregory Steel (Edited by: Jimmy Vang)
 *
 */
public class CorrespondenceDemo {
	
	// Create our instance variables for the class.
	private SecretAgent john;
	private SecretAgent vlad;
	private int initialOffset;
	
	private File fileFromJohn;
	private File fileFromVlad;
	private File file2FromJohn;
	
	/** CREATE AND RUN DEMO HERE. */
	public static void main(String[] args) {
		try {
			// Create the demo.
			CorrespondenceDemo c = new CorrespondenceDemo(8);
			
			// Run the demo's scenario.
			c.runScenario();
		}
		catch (Exception e) {
			System.err.println("An unexpected exception has occured." + e);
			e.printStackTrace();
			System.exit(0);
		}
	}
	
	/**	When this Constructor is called, a scenario will run.
	 * This scenario will test the encryption and decryption of 3 messages using Caesar Cipher.
	 * 
	 * @param initialOffset - The initial offset used for encryption.
	 */
	public CorrespondenceDemo(int initialOffset){
		// Set the initial offset.
		this.initialOffset = initialOffset;
		
		//
		john = new SecretAgent("Doe", "John", "12345");
		vlad = new SecretAgent("Mendelev", "Vladimir", "54321");
		
		fileFromJohn = new File("./src/msgFromJohn.enc");
		fileFromVlad = new File("./src/msgFromVlad.enc");
		file2FromJohn = new File("./src/msg2FromJohn.enc");		
		
	}
	
	/**	Running this method will test the encryption and decryption of 3 messages using Caesar Cipher.
	 * 
	 * @throws InterruptedException 
	 */
	public void runScenario() {
		System.out.println("-----------------------------------------------------------");
		System.out.println("-----------------------------------------------------------");
		System.out.println("--- Starting Correspondence ---");
		System.out.println("===========================================================");
		System.out.println();
		
		//Message 1
		System.out.println("-----------------------------------------------------------");
		System.out.println("------------------------ MESSAGE 1 ------------------------");
		System.out.println("===========================================================");
		String msg = "Hi Vladamir, don't put missles in Cuba!";
		writeMsg(john, vlad, msg, fileFromJohn, this.initialOffset);
		int nextOffset = readMsg(fileFromJohn, this.initialOffset);
		
		//Message 2
		System.out.println("-----------------------------------------------------------");
		System.out.println("------------------------ MESSAGE 2 ------------------------");
		System.out.println("===========================================================");
		msg = "Thanks comrade! I will send a set of nesting dolls to show my appreciation";
		writeMsg(vlad, john, msg, fileFromVlad, nextOffset);
		nextOffset = readMsg(fileFromVlad, nextOffset);
		
		//Message 3
		System.out.println("-----------------------------------------------------------");
		System.out.println("------------------------ MESSAGE 3 ------------------------");
		System.out.println("===========================================================");
		msg = "Thanks for the nesting dolls.";
		writeMsg(john, vlad, msg, file2FromJohn, nextOffset);
		nextOffset = readMsg(file2FromJohn, nextOffset);
		
		System.out.println("-----------------------------------------------------------");
		System.out.println("-----------------------------------------------------------");
		System.out.println("--- Ending Correspondence ---");
		System.out.println("===========================================================");
	}
	
	/**	Writes the following parameters to an encrypted binary file with a message.
	 * 
	 * @param sender - The person sending the encrypted message.
	 * @param receiver - The person receiving the encrypted message.
	 * @param msg - The message to be sent.
	 * @param msgFile - The file to be sent.
	 * @param offset - The offset used to encrypt the message.
	 */
	private void writeMsg(SecretAgent sender, SecretAgent receiver, String msg, File msgFile, int offset){
		System.out.println();
		System.out.println("-----------------------------------------------------------");
		System.out.printf("--- Writing message from %s to %s ---%n", sender.getFirstName(), receiver.getFirstName());
		
		System.out.println();
		System.out.print("Message:");
		System.out.println("\n\t" + msg);
		
		System.out.print("Offset:");
		System.out.println("\n\t" +  offset);		
		
		CaesarCipher cipher = new CaesarCipher(sender, receiver, msgFile, offset, msg);
		
		// Attempt to write to binary file.
		try{
			cipher.writeToBinaryFile();
		}
		catch(Exception e){
			System.err.println("Failed to write message(msg) to binary file. ");
			System.err.println();
			
			e.printStackTrace();
			System.exit(0);
		}		
		
		System.out.println("-----------------------------------------------------------");
		System.out.println("--- Done writing message ---\n\n");
	}
	
	/** Reads the message and returns the new offset.
	 * 
	 * @param msgFile - The file to be read from.
	 * @param offset - The offset used to decrypt the message.
	 * @return
	 */
	private int readMsg(File msgFile, int offset){
		System.out.println("-----------------------------------------------------------");
		System.out.println("--- Reading message ---");		
		System.out.println();
		
		CaesarCipher cipher = new CaesarCipher(msgFile, offset);
		
		// Generate a pseudo-random integer for the next offset.
		Random r = new Random();
		int nextOffset = r.nextInt(20);
		
		// Attempt to read from binary file.
		try{
			cipher.readFromBinaryFile();
			cipher.setNextOffset(nextOffset);
			
			System.out.println(cipher.toString());
		}
		catch(Exception e){
			System.err.println("Failed to read message(msg) from binary file. ");
			System.err.println();
			
			e.printStackTrace();
			System.exit(0);
		}		
		System.out.println("-----------------------------------------------------------");
		System.out.println("--- Done reading message ---\n\n");
		
		// Return the next offset.
		return nextOffset;
	}
}
