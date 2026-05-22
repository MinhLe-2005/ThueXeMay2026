package com.smartride.util;

import java.sql.Connection;
import java.sql.Statement;

public class UpdateDates {
    public static void main(String[] args) {
        try (Connection conn = DBUtil.makeConnection()) {
            if (conn == null) {
                System.out.println("❌ Connection failed!");
                return;
            }
            Statement stmt = conn.createStatement();
            
            // Update Booking dates to current date
            String sqlBooking = "UPDATE \"Booking\" SET "
                    + "\"BookingDate\" = NOW(), "
                    + "\"StartDate\" = NOW(), "
                    + "\"EndDate\" = NOW() + interval '5 days' "
                    + "WHERE \"BookingID\" = 'BOOK000001'";
            int bUpdated = stmt.executeUpdate(sqlBooking);
            System.out.println("Updated booking: " + bUpdated);
            
            // Update Payment date
            String sqlPayment = "UPDATE \"Payment\" SET "
                    + "\"PaymentDate\" = NOW() "
                    + "WHERE \"BookingID\" = 'BOOK000001'";
            int pUpdated = stmt.executeUpdate(sqlPayment);
            System.out.println("Updated payment: " + pUpdated);
            
            System.out.println("✅ Successfully updated seed booking data to current dates!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

