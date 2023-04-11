import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * This is the interface for "CipherIO.java".
 * It is used by "CaesarCipher.java".
 * 
 * File Name: 	CipherIO.java
 * Date: 		3/27/2017
 * 
 * @author Jimmy Vang
 *
 */
public interface CipherIO {
	/** Write to binary file.
	 * 
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws Exception
	 */
	public void writeToBinaryFile() 
		throws 
			FileNotFoundException,
			IOException,
			Exception;
	/** Read from binary file.
	 * 
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws Exception
	 */
	public void readFromBinaryFile()
		throws 
			FileNotFoundException,
			IOException,
			Exception;
}
