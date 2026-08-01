<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.smartride.util.DBUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String result = "";
    try {
        Connection conn = DBUtil.makeConnection();
        String cccd = request.getParameter("cccd");
        if (cccd != null && !cccd.isEmpty()) {
            String sql = "UPDATE \"Customer\" SET \"IdentityCard\" = \"IdentityCard\" || '_DELETED' WHERE \"IdentityCard\" = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cccd);
            int updated = ps.executeUpdate();
            
            if (updated > 0) {
                result = "Đã gỡ liên kết thành công! Trả lại CCCD " + cccd + " để bạn có thể sử dụng cho tài khoản hiện tại.";
            } else {
                result = "Không tìm thấy CCCD " + cccd + " trong cơ sở dữ liệu.";
            }
        } else {
            result = "Vui lòng truyền tham số ?cccd=...";
        }
    } catch(Exception e) {
        result = "Lỗi: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tool Xóa Dữ Liệu</title>
</head>
<body>
    <h2>Kết quả:</h2>
    <p><%= result %></p>
</body>
</html>
