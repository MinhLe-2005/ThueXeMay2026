package com.smartride;

import com.smartride.dao.PaymentDAO;

public class TestPayment {
    public static void main(String[] args) {
        try {
            System.out.println("Testing PaymentDAO.addPayment...");
            PaymentDAO dao = PaymentDAO.getInstance();
            dao.addPayment("BK88204320", "Test Method", "2026-07-20 12:00:00", 1000, "Thành công");
            System.out.println("Done.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
