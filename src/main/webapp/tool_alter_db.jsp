<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.smartride.util.DBUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String result = "";
    try {
        Connection conn = DBUtil.makeConnection();
        Statement stmt = conn.createStatement();
        // Add Status column to Motorcycle
        stmt.executeUpdate("ALTER TABLE \"Motorcycle\" ADD COLUMN \"IsHidden\" BOOLEAN DEFAULT false;");
        result = "Đã thêm cột IsHidden vào bảng Motorcycle thành công!";
    } catch(Exception e) {
        result = "Lỗi (có thể cột đã tồn tại): " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tool Update DB</title>
</head>
<body>
    <h2>Kết quả:</h2>
    <p><%= result %></p>
</body>
</html>
