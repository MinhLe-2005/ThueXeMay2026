package com.smartride.util;

import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

public class FixPayments {
    public static void main(String[] args) {
        String query = "SELECT b.\"BookingID\", " +
                       "COALESCE(SUM(bd.\"TotalPrice\"), 0) + COALESCE(b.\"DeliveryFee\", 0) + COALESCE((SELECT SUM(\"ExtensionFee\") FROM \"BookingExtension\" WHERE \"BookingID\" = b.\"BookingID\"), 0) AS TotalAmount, " +
                       "COALESCE((SELECT SUM(\"PaymentAmount\") FROM \"Payment\" WHERE \"BookingID\" = b.\"BookingID\" AND (\"PaymentStatus\" = 'Thành công' OR \"PaymentStatus\" LIKE '%th%nh c%ng%')), 0) AS PaidAmount " +
                       "FROM \"Booking\" b " +
                       "LEFT JOIN \"BookingDetail\" bd ON b.\"BookingID\" = bd.\"BookingID\" " +
                       "WHERE b.\"StatusBooking\" IN ('Đang thuê', 'Đã hoàn thành') OR b.\"DeliveryStatus\" IN ('Đã giao', 'Đã trả') " +
                       "GROUP BY b.\"BookingID\", b.\"DeliveryFee\"";

        String insertPaymentSql = "INSERT INTO \"Payment\" (\"BookingID\", \"PaymentMethod\", \"PaymentDate\", \"PaymentAmount\", \"PaymentStatus\") VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query);
             PreparedStatement pstmt = conn.prepareStatement(insertPaymentSql)) {

            int count = 0;
            while (rs.next()) {
                String bookingId = rs.getString("BookingID");
                double total = rs.getDouble("TotalAmount");
                double paid = rs.getDouble("PaidAmount");
                double diff = total - paid;

                if (diff > 0) {
                    System.out.println("Fixing Booking " + bookingId + ": Total=" + total + ", Paid=" + paid + ", Missing=" + diff);
                    
                    pstmt.setString(1, bookingId);
                    pstmt.setString(2, "Tiền mặt (Bàn giao)");
                    pstmt.setString(3, LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
                    pstmt.setDouble(4, diff);
                    pstmt.setString(5, "Thành công");
                    pstmt.executeUpdate();
                    count++;
                }
            }
            System.out.println("Fixed " + count + " bookings successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
