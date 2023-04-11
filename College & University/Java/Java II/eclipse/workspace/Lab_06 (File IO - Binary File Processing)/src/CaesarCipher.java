import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * This object encrypts messages in Caesar Cipher format.
 * It also will store information about a sender, receiver, message, offset, next offset, and message file path.
 * 
 * File Name: 	CaesarCipher.java
 * Date: 		3/27/2017
 * 
 * @author Jimmy Vang
 *
 */
public class CaesarCipher implements CipherIO{
	
	private SecretAgent sender;
	private SecretAgent receiver;
	private String msg;
	private int offset;
	private int nextOffset;
	private File msgFile;
	
	/**
	 * Constructor for writing a message.
	 * 
	 * @param sender - The person sending the encrypted message.
	 * @param receiver - The person receiving the encrypted message.
	 * @param msgFile - The file to be written into.
	 * @param offset - The offset used to encrypt/decrypt the message.
	 * @param msg - The message to be written.
	 */
	public CaesarCipher(SecretAgent sender, SecretAgent receiver, File msgFile, int offset, String msg) {
		setSender(sender);
		setReceiver(receiver);
		setMsgFile(msgFile);
		setOffset(offset);
		setMsg(msg);
	}
	
	/**
	 * Constructor for reading an encrypted message.
	 * 
	 * @param msgFile - The file to be read from.
	 * @param offset - The offset used to encrypt/decrypt the message.
	 */
	public CaesarCipher(File msgFile, int offset) {
		setMsgFile(msgFile);
		setOffset(offset);
	}
	
	/**
	 * Returns an organized string from this object including:
	 * <ul>
	 * <li> Sender 			(sender)
	 * <li> Receiver 		(receiver)
	 * <li> Message File 	(msgFile)
	 * <li> Offset 			(offset)
	 * <li> Next Offset 	(nextOffset)
	 * <li> Message 		(msg)
	 * </ul>
	 */
	public String toString(){
		
		// Eclipse tells me toString() cannot use the keyword "throws IOException" for "msgFile.getCanonicalPath()".
		// Because of this, It forces me to use try-catch inside the toString() method instead.
		try {
			return "Sender: \t"
						+ sender.toString()
					+ "\nReceiver: \t"
						+ receiver.toString()
					+ "\nMessage File: \t"
						+ "\n\t" + msgFile.getCanonicalPath()
					+ "\nMessage: \t"
						+ "\n\t" + msg
					+ "\nOffset: \t"
						+ "\n\t" + offset 
					+ "\nNext Offset: \t"
						+ "\n\t" + nextOffset;
		} catch (IOException e) {
			System.err.println("An IO Exception has occured. \n"
					+ e);
			System.err.println();
			
			e.printStackTrace();
			System.exit(0);
			return "IOEXCEPTION";
		}
	}
	
	@Override
	public void writeToBinaryFile() throws FileNotFoundException, IOException, Exception {
		encrypt(offset, msg);
		
		// Write msg to a binary file.
		ObjectOutputStream oos = 
				new ObjectOutputStream(
						new FileOutputStream(msgFile));
		oos.writeObject(sender);
		oos.writeObject(receiver);
		oos.writeUTF(msg);
//		oos.writeInt(offset);
		oos.writeInt(nextOffset);
//		oos.writeObject(msgFile);
		
		// Close all streams.
		oos.close();
	}

	@Override
	public void readFromBinaryFile() throws FileNotFoundException, IOException, Exception {
		
		// Read msg from a binary file.
		ObjectInputStream ois =
				new ObjectInputStream(
						new FileInputStream(msgFile));
		
		//+++ Check file input in-case an invalid file is submitted! +++//
		Object oSender = ois.readObject();
		Object oReceiver = ois.readObject();
		Object sMsg = ois.readUTF();
		// int iOffset = ois.readInt();
		int iNextOffset = ois.readInt();
		// Object oMsgFile = ois.readObject();
		
		if (oSender == null || !(oSender instanceof SecretAgent)) {
			ois.close();
			throw new Exception("Failed to read from file. The \"sender\" is null or not an instance of Secret Agent.");
		}
		if (oReceiver == null || !(oReceiver instanceof SecretAgent)) {
			ois.close();
			throw new Exception("Failed to read from file. The \"receiver\" is null or not an instance of Secret Agent.");
		}
		if (sMsg == null || !(sMsg instanceof java.lang.String)) {
			ois.close();
			throw new Exception("Failed to read from file. The \"message\" is null or not an instance of String.");
		}
		
		
		//+++ Read in data to this object. +++//
		this.setSender(
				(SecretAgent) oSender);
		this.setReceiver(
				(SecretAgent) oReceiver);
		this.setMsg(
				(java.lang.String) sMsg);
//		this.setOffset(
//				ois.readInt());
		this.setNextOffset(
				iNextOffset);
//		this.setMsgFile(
//				(File) ois.readObject());
		
		////**** Read Encrypted Message. ****////
		System.out.println("Message Found (Encrypted): \t"
								+ "\n\t" + msg);
		System.out.println();
		
		// Decrypt the message.
		decrypt(offset, msg);
		
		// Close all streams.
		ois.close();
	}
	
	/**
	 * Encryption Method for encrypting a message.
	 * 
	 * @param offset - The offset used for encryption.
	 * @param msg - The message that will be encrypted using the offset.
	 */
	public void encrypt(int offset, String msg) {
		char[] msg_CharArr = msg.toCharArray();
		
		for(int i = 0; i < msg_CharArr.length; i++) {
			msg_CharArr[i] = (char) (msg_CharArr[i] + offset);
			msg = String.valueOf(msg_CharArr);
			this.msg = msg;
		}
	}
	
	/**
	 * Decryption Method for decrypting a message.
	 * 
	 * @param offset - The offset used for decryption.
	 * @param msg - The message that will be decrypted using the offset.
	 */
	public void decrypt(int offset, String msg) {
		char[] msg_CharArr = msg.toCharArray();
		
		for(int i = 0; i < msg_CharArr.length; i++) {
			msg_CharArr[i] = (char) (msg_CharArr[i] - offset);
			msg = String.valueOf(msg_CharArr);
			this.msg = msg;
		}
	}
	
	/*** Accessors/Setters ***/
	public SecretAgent getSender() {
		return sender;
	}

	private void setSender(SecretAgent sender) {
		this.sender = sender;
	}

	public SecretAgent getReceiver() {
		return receiver;
	}

	private void setReceiver(SecretAgent receiver) {
		this.receiver = receiver;
	}

	public String getMsg() {
		return msg;
	}

	private void setMsg(String msg) {
		this.msg = msg;
	}

	public int getOffset() {
		return offset;
	}

	private void setOffset(int offset) {
		this.offset = offset;
	}

	public int getNextOffset() {
		return nextOffset;
	}

	void setNextOffset(int nextOffset) {
		this.nextOffset = nextOffset;
	}

	public File getMsgFile() {
		return msgFile;
	}

	private void setMsgFile(File msgFile) {
		this.msgFile = msgFile;
	}
}
