<%@ page import="java.sql.*, com.smartride.util.DBUtil" %>
<%
    try (Connection conn = DBUtil.makeConnection()) {
        if (conn != null) {
            String[] queries = {
                "UPDATE \"Accessory\" SET \"Price\" = 20000 WHERE LOWER(\"AccessoryName\") LIKE '%full face%'",
                "UPDATE \"Accessory\" SET \"Price\" = 15000 WHERE LOWER(\"AccessoryName\") LIKE '%3/4%' OR LOWER(\"AccessoryName\") LIKE '%nửa đầu%'",
                "UPDATE \"Accessory\" SET \"Price\" = 10000 WHERE LOWER(\"AccessoryName\") LIKE '%găng tay%'",
                "UPDATE \"Accessory\" SET \"Price\" = 0 WHERE LOWER(\"AccessoryName\") LIKE '%điện thoại%'",
                "UPDATE \"Accessory\" SET \"Price\" = 10000 WHERE LOWER(\"AccessoryName\") LIKE '%áo mưa%'",
                "UPDATE \"Accessory\" SET \"Price\" = 5000 WHERE LOWER(\"AccessoryName\") LIKE '%giày%'",
                "UPDATE \"Accessory\" SET \"Price\" = 0 WHERE LOWER(\"AccessoryName\") LIKE '%vá xe%'"
            };
            for (String q : queries) {
                try (PreparedStatement ps = conn.prepareStatement(q)) {
                    ps.executeUpdate();
                }
            }
            try (PreparedStatement ps = conn.prepareStatement("UPDATE \"Accessory\" SET \"Price\" = 15000 WHERE \"Price\" > 30000")) {
                ps.executeUpdate();
            }
            out.println("Success!");
        } else {
            out.println("DB Connection failed");
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
