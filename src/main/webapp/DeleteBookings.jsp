<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:postgresql://aws-0-ap-southeast-1.pooler.supabase.com:6543/postgres";
    String user = "postgres.xeqgqawomxikssjttjlu";
    String password = "minh123456A@";
    try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        
        String[] queries = {
            "DELETE FROM \"Payment\" WHERE \"BookingID\" IN ('BK12345678', 'BKT001', 'BKTEST2', 'BK42970739', 'BK24713201', 'BKTEST0001', 'BKTEST0002', 'BKTEST0005', 'BKTEST0006', 'BKTEST0007', 'BKTEST0008', 'BKTEST0009', 'BKTEST0010')",
            "DELETE FROM \"Extension\" WHERE \"BookingID\" IN ('BK12345678', 'BKT001', 'BKTEST2', 'BK42970739', 'BK24713201', 'BKTEST0001', 'BKTEST0002', 'BKTEST0005', 'BKTEST0006', 'BKTEST0007', 'BKTEST0008', 'BKTEST0009', 'BKTEST0010')",
            "DELETE FROM \"Cancellation\" WHERE \"BookingID\" IN ('BK12345678', 'BKT001', 'BKTEST2', 'BK42970739', 'BK24713201', 'BKTEST0001', 'BKTEST0002', 'BKTEST0005', 'BKTEST0006', 'BKTEST0007', 'BKTEST0008', 'BKTEST0009', 'BKTEST0010')",
            "DELETE FROM \"Booking Detail\" WHERE \"BookingID\" IN ('BK12345678', 'BKT001', 'BKTEST2', 'BK42970739', 'BK24713201', 'BKTEST0001', 'BKTEST0002', 'BKTEST0005', 'BKTEST0006', 'BKTEST0007', 'BKTEST0008', 'BKTEST0009', 'BKTEST0010')",
            "DELETE FROM \"Booking\" WHERE \"BookingID\" IN ('BK12345678', 'BKT001', 'BKTEST2', 'BK42970739', 'BK24713201', 'BKTEST0001', 'BKTEST0002', 'BKTEST0005', 'BKTEST0006', 'BKTEST0007', 'BKTEST0008', 'BKTEST0009', 'BKTEST0010')"
        };
        for(String q : queries) {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(q);
        }
        out.println("DELETED SUCCESSFULLY!");
    } catch(Exception e) {
        out.println("ERROR: " + e.getMessage());
    }
%>
