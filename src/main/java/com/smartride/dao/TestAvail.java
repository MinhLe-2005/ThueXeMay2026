package com.smartride.dao;
import java.sql.*;
import com.smartride.util.DBUtil;

public class TestAvail {
    public static void main(String[] args) {
        try (Connection conn = DBUtil.makeConnection()) {
            if (conn == null) { System.out.println("Connection failed"); return; }
            String sql = "SELECT * FROM \"Motorcycle Status\" ORDER BY \"MotorcycleStatusID\" DESC LIMIT 10";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int count = 0;
            while(rs.next()) {
                System.out.println(rs.getInt("MotorcycleStatusID") + " - " + rs.getString("StatusAction"));
                count++;
            }
            if (count == 0) System.out.println("No rows returned!");
            
            System.out.println("---");
            sql = "WITH LatestStatus AS ("
                    + "    SELECT ms.\"MotorcycleDetailID\", ms.\"StatusAction\", "
                    + "        ROW_NUMBER() OVER (PARTITION BY ms.\"MotorcycleDetailID\" ORDER BY ms.\"MotorcycleStatusID\" DESC) AS \"RowNum\" "
                    + "    FROM \"Motorcycle Status\" ms "
                    + ")"
                    + "SELECT m.\"MotorcycleID\", COUNT(md.\"MotorcycleDetailID\") AS \"AvailableCount\" "
                    + "FROM \"Motorcycle\" m "
                    + "INNER JOIN \"Motorcycle Detail\" md ON m.\"MotorcycleID\" = md.\"MotorcycleID\" "
                    + "INNER JOIN LatestStatus ls ON md.\"MotorcycleDetailID\" = ls.\"MotorcycleDetailID\" AND ls.\"RowNum\" = 1 "
                    + "WHERE ls.\"StatusAction\" like 'Có sẵn' "
                    + "GROUP BY m.\"MotorcycleID\" "
                    + "ORDER BY m.\"MotorcycleID\";";
            rs = stmt.executeQuery(sql);
            while(rs.next()) {
                System.out.println(rs.getString("MotorcycleID") + " - " + rs.getString("AvailableCount"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
