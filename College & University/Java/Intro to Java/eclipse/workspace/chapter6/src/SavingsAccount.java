
public class SavingsAccount {
	public static final double MIN_BALANCE = 0;
	private static double interestRate;
	private static int numberOfAccounts;
	
	//instance varables
	private double balance;
	
	public SavingsAccount() {
		balance = 0;
		numberOfAccounts++;
	}
	
	/***Business Logic***/
	public void deposit(double amount) {
		if (amount <= 0) {
			System.out.println("A positive amount must be entered.");
			System.exit(0);
		}
		
		balance += amount;
	}
	
	public double withdraw(double amount) {
		if (balance - amount >= MIN_BALANCE) {
			balance -= amount;
			return amount;
		}
		else {
			System.out.println("The withdraw amount exceeds the balance.");
			return 0;
		}
	}
	
	public void addInterest() {
		double interest = balance * interestRate;
		balance += interest; 
	}
	
	/***STATIC METHODS***/
	public static double getInterestRate() {
		return interestRate;
	}
	public static void setInterestRate(double interestRate) {
		SavingsAccount.interestRate = interestRate;
	}
	public static int getNumberOfAccounts() {
		return numberOfAccounts;
	}
	public static void setNumberOfAccounts(int numberOfAccounts) {
		SavingsAccount.numberOfAccounts = numberOfAccounts;
	}
	
	/***ACCESSORS***/
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
}
