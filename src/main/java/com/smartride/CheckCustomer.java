package com.smartride;

import com.smartride.util.DBUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CheckCustomer {
    public static void main(String[] args) {
        try {
            Connection conn = DBUtil.makeConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT \"CustomerName\", \"IdentityCardImage\" FROM \"Customer\"");
            while (rs.next()) {
                System.out.println(rs.getString(1) + " : " + rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
