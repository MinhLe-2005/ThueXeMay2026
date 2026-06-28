package com.smartride.test;

import com.smartride.dao.AccountDAO;
import com.smartride.dto.Account;

public class TestAccount {
    public static void main(String[] args) {
        AccountDAO dao = AccountDAO.getInstance();
        // Assuming AccountID 1 or 2 is a valid customer
        for (int i = 1; i <= 5; i++) {
            Account acc = dao.getAccountbyID(i);
            if (acc != null) {
                System.out.println("ID " + i + " exists, role: " + acc.getRoleID());
            } else {
                System.out.println("ID " + i + " is null");
            }
        }
    }
}
