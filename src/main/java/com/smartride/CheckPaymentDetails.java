package com.smartride;

import com.smartride.dao.PaymentDAO;
import com.smartride.dto.Payment;
import java.util.List;

public class CheckPaymentDetails {
    public static void main(String[] args) {
        List<Payment> payments = PaymentDAO.getInstance().getAllPayments();
        for (Payment p : payments) {
            System.out.println("BookingID: " + p.getBookingId() + " Amount: " + p.getPaymentAmount() + " Status: " + p.getPaymentStatus() + " Method: " + p.getPaymentMethod());
        }
    }
}
