package kr.ac.kopo.framework;

import kr.ac.kopo.dao.AccountDAO;

public class AccountNumberGenerator {

	public static String generateAccountNumber() {
		String accountNumberPrefix = "616";
		String accountNumber = accountNumberPrefix + generateRandomDigits(10);

		while (isDuplicateAccountNumber(accountNumber)) {
			accountNumber = accountNumberPrefix + generateRandomDigits(10);
		}

		return accountNumber;
	}

	private static String generateRandomDigits(int length) {
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < length; i++) {
			int digit = (int) (Math.random() * 10);
			sb.append(digit);
		}

		return sb.toString();
	}

	private static boolean isDuplicateAccountNumber(String accountNumber) {
		AccountDAO dao = new AccountDAO();
		return dao.checkDuplicateAccount(accountNumber);
	}
}
