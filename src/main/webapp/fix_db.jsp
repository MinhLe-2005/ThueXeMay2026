<%@ page import="java.sql.*, java.util.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime, com.smartride.util.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Fix Payments DB</title></head>
<body>
<h2>Fixing Payments for active bookings...</h2>
<%
    String query = "SELECT b.\"BookingID\", " +
                   "COALESCE(SUM(bd.\"TotalPrice\"), 0) + COALESCE(b.\"DeliveryFee\", 0) + COALESCE((SELECT SUM(\"ExtensionFee\") FROM \"BookingExtension\" WHERE \"BookingID\" = b.\"BookingID\"), 0) AS TotalAmount, " +
                   "COALESCE((SELECT SUM(\"PaymentAmount\") FROM \"Payment\" WHERE \"BookingID\" = b.\"BookingID\" AND (\"PaymentStatus\" = 'Thành công' OR \"PaymentStatus\" LIKE '%th%nh c%ng%')), 0) AS PaidAmount " +
                   "FROM \"Booking\" b " +
                   "LEFT JOIN \"BookingDetail\" bd ON b.\"BookingID\" = bd.\"BookingID\" " +
                   "WHERE b.\"StatusBooking\" IN ('Đang thuê', 'Đã hoàn thành') OR b.\"DeliveryStatus\" IN ('Đã giao', 'Đã trả') " +
                   "GROUP BY b.\"BookingID\", b.\"DeliveryFee\"";

    String insertPaymentSql = "INSERT INTO \"Payment\" (\"BookingID\", \"PaymentMethod\", \"PaymentDate\", \"PaymentAmount\", \"PaymentStatus\") VALUES (?, ?, ?, ?, ?)";

    int count = 0;
    try (Connection conn = DBUtil.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(query);
         PreparedStatement pstmt = conn.prepareStatement(insertPaymentSql)) {

        while (rs.next()) {
            String bookingId = rs.getString("BookingID");
            double total = rs.getDouble("TotalAmount");
            double paid = rs.getDouble("PaidAmount");
            double diff = total - paid;

            if (diff > 0) {
                pstmt.setString(1, bookingId);
                pstmt.setString(2, "Tiền mặt (Thu tự động)");
                pstmt.setString(3, LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")));
                pstmt.setDouble(4, diff);
                pstmt.setString(5, "Thành công");
                pstmt.executeUpdate();
                count++;
                out.println("<p>Fixed Booking " + bookingId + ": Total=" + total + ", Paid=" + paid + ", Missing=" + diff + "</p>");
            }
        }
        out.println("<p><b>Done! Fixed " + count + " bookings successfully.</b></p>");
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
</body>
</html>
