package com.smartride;

import com.smartride.util.DBUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CheckCustomerImage {
    public static void main(String[] args) {
        try {
            Connection conn = DBUtil.makeConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT \"AccountID\", \"IdentityCardImage\" FROM \"Customer\"");
            while (rs.next()) {
                System.out.println("AccountID: " + rs.getInt(1) + " -> " + rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
