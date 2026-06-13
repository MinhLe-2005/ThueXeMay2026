<%@ page import="java.sql.*, com.smartride.util.*" pageEncoding="UTF-8" %>
<%
    try {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://aws-1-ap-northeast-1.pooler.supabase.com:6543/postgres?sslmode=require";
        String user = "postgres.zfvgigfjmbtgwgirdify";
        String pass = "Bimdiendie1@";
        try (Connection conn = DriverManager.getConnection(url, user, pass)) {
            PreparedStatement ps = conn.prepareStatement("UPDATE \"Voucher\" SET \"Status\" = 'Chưa sử dụng'");
            int row = ps.executeUpdate();
            out.println("SUCCESS: " + row);
        }
    } catch (Exception e) {
        out.println("ERROR: " + e.getMessage());
    }
%>
