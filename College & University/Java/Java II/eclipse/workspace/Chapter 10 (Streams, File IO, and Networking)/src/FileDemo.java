import java.io.*;
import java.util.*;

public class FileDemo {

	public static void main(String[] args) {
		
		try {
			String path = "./src/data/inventory.csv";
			
			File file = new File(path);
			
			if(!file.exists()) {
				System.out.print("File does not exist!\n");
				System.exit(0);
			}
			else if(!file.canRead()) {
				System.out.print("Cannot read from file!\n");
				System.exit(0);
			}
			else if(!file.canWrite()) {
				System.out.print("Cannot write to file!\n");
				System.exit(0);
			}
			else {
				Scanner s = new Scanner(file);
				
//				System.out.print("Text Found! Displaying Text...\n\n");
//				while(s.hasNextLine()) {
//					System.out.println(s.nextLine());
//				}
				
				System.out.print("Text Found! Displaying Text...\n\n");
				int cnt = 1;
				while(s.hasNextLine()) {
					if(cnt == 1) {
						s.nextLine();
						cnt++;
						continue;
					}
					
					String line = s.nextLine();
					String[] wordArr = line.split(",");
					//System.out.print("SOLD " + wordArr[1] + " of " + wordArr[3] + " (SKU: " + wordArr[0] + ") at $" + wordArr[2] + "\n");
					
					int qty = 0;
					try {
						qty = Integer.parseInt(wordArr[1]);
					}
					catch (NumberFormatException e) {
						System.out.println("Invalid Quantity at line " + cnt);
						e.printStackTrace();
						System.exit(0);
					}
					
					double price = 0;
					try {
						price = Double.parseDouble(wordArr[2]);
					}
					catch (NumberFormatException e) {
						System.out.println("Invalid Price at line " + cnt);
						e.printStackTrace();
						System.exit(0);
					}
					
					String description = wordArr[3];
					
					int sku = 0;
					try {
						sku = Integer.parseInt(wordArr[0]);
					}
					catch (NumberFormatException e) {
						System.out.println("Invalid SKU at line " + cnt);
						e.printStackTrace();
						System.exit(0);
					}
					
					System.out.format("SOLD %d of %s (SKU: %d) at $%.2f\n"
							, qty, description, sku, price);
					cnt++;
				}
				
				
				
				//Repeat until EOF
					//read next line
					//parse or tokenize
					//convert the numeric fields
					//process the fields
				//Output
					//Total Sales of all transactions.
					
					// EXAMPLE:
					// SOLD 50 of SODA (SKU: 4038) at $0.99
					// *
					// Total sales: $3434.50
				
				s.close();
			}
		}
		catch (Exception e) {
			System.out.println("\nException Found: " + e + "\n");
			e.printStackTrace();
			System.exit(0);
		}
		
		
	}

}
