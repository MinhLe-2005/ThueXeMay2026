<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.smartride.dao.AccountDAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.smartride.util.DBContext" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head><title>Test Update</title></head>
<body>
<%
    out.println("<h2>Testing Update</h2>");
    try {
        Connection conn = DBContext.getConnection();
        String sql = "UPDATE \"Account\" SET \"FirstName\" = ?, \"LastName\" = ?, \"Gender\" = ?, \"DayOfBirth\" = ?, \"Address\" = ?, \"PhoneNumber\" = ?, \"Email\" = ?, \"Username\" = ? WHERE \"AccountID\" = ?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, "Lê Quang");
        st.setString(2, "Minh");
        st.setString(3, "Nam");
        st.setDate(4, java.sql.Date.valueOf("2005-09-01"));
        st.setString(5, "18/91 hai bà trưng, phường Quảng Trị");
        st.setString(6, "0943515000");
        st.setString(7, "lequangminhqwer@gmail.com");
        st.setString(8, "lequangminhqwer@gmail.com");
        
        // Find the account ID first
        int accountid = 0;
        PreparedStatement stFind = conn.prepareStatement("SELECT \"AccountID\" FROM \"Account\" WHERE \"Email\" = 'lequangminhqwer@gmail.com'");
        ResultSet rs = stFind.executeQuery();
        if (rs.next()) {
            accountid = rs.getInt(1);
        } else {
            out.println("<p>Account not found!</p>");
            return;
        }
        
        st.setInt(9, accountid);
        out.println("<p>Executing update for account ID: " + accountid + "</p>");
        int rowAffect = st.executeUpdate();
        out.println("<p>Row affect: " + rowAffect + "</p>");
    } catch (Exception e) {
        out.println("<h3>Exception:</h3>");
        out.println("<pre>");
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        out.println(sw.toString());
        out.println("</pre>");
    }
%>
</body>
</html>
