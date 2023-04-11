
public class SalesAssociate {

	private String name;
	private double sales;
	
	public void writeOutput() {
		System.out.println("Name: " + name) ;
		System.out.printf("Sales: $%2.2f\n", sales);
	}
	
	//*************** accessors ***************//
	public void set(String name, double sales) {
		setName(name);
		setSales(sales);
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getSales() {
		return sales;
	}

	public void setSales(double sales) {
		if (sales > 0) {
			this.sales = sales;
		} else {
			System.exit(0);
		}
	}

}
