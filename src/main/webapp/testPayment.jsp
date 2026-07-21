<%@ page import="com.smartride.dao.PaymentDAO" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    try {
        String bookingId = request.getParameter("bookingId");
        int amount = Integer.parseInt(request.getParameter("amount"));
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String paymentDateText = currentDateTime.format(outputFormatter);
        
        PaymentDAO.getInstance().addPayment(bookingId, "SePay VietQR", paymentDateText, amount, "Thành công");
        out.println("Success! Payment inserted.");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>
