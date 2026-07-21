package com.smartride;

import com.smartride.util.DBUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CheckConstraint {
    public static void main(String[] args) {
        try {
            Connection conn = DBUtil.makeConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT constraint_name, constraint_type FROM information_schema.table_constraints WHERE table_name = 'Payment'");
            while (rs.next()) {
                System.out.println(rs.getString(1) + " : " + rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
