
public class SalesReport {

	private SalesAssociate[] team;
	private int indexOfMaxSales = 0;
	
	public static void main(String[] args) {
		SalesReport report = new SalesReport();
		report.createSalesPeople();
		
		report.calcStats();
		
		report.displayResults();
	}

	private void createSalesPeople() {
		team = new SalesAssociate[5];
		int i = 0;
		
		SalesAssociate john = new SalesAssociate();
		john.set("John", 1.00);
		team[i] = john; i++;
		
		SalesAssociate james = new SalesAssociate();
		james.set("James", 400);
		team[i] = james; i++;
		
		SalesAssociate anne = new SalesAssociate();
		anne.set("Anne", 1000);
		team[i] = anne; i++;
		
		SalesAssociate max = new SalesAssociate();
		max.set("Max", 300);
		team[i] = max; i++;
		
		SalesAssociate adam = new SalesAssociate();
		adam.set("Adam", 10);
		team[i] = adam; i++;
		
	}
	
	private void calcStats() {
		for (int i = 0; i < team.length; i++) {
			if (team[i].getSales() > team[indexOfMaxSales].getSales()) {
				indexOfMaxSales = i;
			}
		}
	}
	
	private void displayResults() {
		for (int i = 0; i < team.length; i++) {
			team[i].writeOutput();
			
			if(i == indexOfMaxSales) {
				System.out.println("Congratulations, you had the most sales. (indexOfMaxSales: " + indexOfMaxSales + ")");
			}
			
			System.out.println();
		}

	}
}
