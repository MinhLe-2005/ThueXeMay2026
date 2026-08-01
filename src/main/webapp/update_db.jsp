<%@ page import="java.sql.*, com.smartride.util.DBUtil" %>
<%
    try (Connection c = DBUtil.makeConnection(); Statement s = c.createStatement()) {
        s.execute("ALTER TABLE "Voucher" ADD COLUMN "MinSpend" DECIMAL(10,3) DEFAULT 0");
        s.execute("ALTER TABLE "Voucher" ADD COLUMN "MaxDiscount" DECIMAL(10,3) DEFAULT 0");
        out.println("SUCCESS");
    } catch (Exception e) {
        // If it already exists, it will throw an exception
        out.println(e.getMessage());
    }
%>
