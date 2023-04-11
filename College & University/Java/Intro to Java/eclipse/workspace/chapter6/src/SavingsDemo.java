
public class SavingsDemo {

	public static void main(String[] args) {
		double min = SavingsAccount.MIN_BALANCE;
		System.out.println("Min balance across all accounts: "
				+ min);
		
		//set the interest rate across all accounts
		SavingsAccount.setInterestRate(0.01);
		System.out.println("The interest rate for all accounts is... "
				+ SavingsAccount.getInterestRate());
		
		SavingsAccount bobAcc = new SavingsAccount();
		bobAcc.deposit(1000);
		System.out.println("Bob's balance is... "
				+ bobAcc.getBalance());
		bobAcc.withdraw(100);
		System.out.println("Bob's balance is... "
				+ bobAcc.getBalance());
		bobAcc.addInterest();
		System.out.println("Bob's balance is... "
				+ bobAcc.getBalance());
		//update interest rate
		SavingsAccount.setInterestRate(0.10);
		bobAcc.addInterest();
		System.out.println("Bob's balance is... "
				+ bobAcc.getBalance());
		
		SavingsAccount johnAcc = new SavingsAccount();
		johnAcc.deposit(2000);
		System.out.println("John's balance is... "
				+ johnAcc.getBalance());
		
		System.out.println("Total number of accounts: "
				+ SavingsAccount.getNumberOfAccounts());
	}

}
