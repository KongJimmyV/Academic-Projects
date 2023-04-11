
public class InterestTable {

	public static void main(String[] args) {

		double principle = 1000;
		double baseRate = 0.05;
		double deltaRate = .005;
		
		double[][] table = new double[10][6];
		
		for (int i = 0; i < table.length; i++) {
			for (int j = 0; j < table[i].length; j++) {
				double lastFutureValue;
				if (i == 0) {
					lastFutureValue = principle;
				} else {
					lastFutureValue = table[i-1][j];
					
				}
				
				double interest = (baseRate + (j*deltaRate)) * lastFutureValue;
				table[i][j] = interest + lastFutureValue;
			}
		}
		
		//print table
		for (int j = 0; j < table[0].length; j++) {
			System.out.print("\t" + (j+1) + "");
		}
		System.out.println();
		
		for (int i = 0; i < table.length; i++) {
			System.out.print("" + (i+1) + " \t");
			for (int j = 0; j < table[i].length; j++) {
				System.out.printf("%1.2f\t", table[i][j]);
			}
			System.out.println();
		}
	}

}
