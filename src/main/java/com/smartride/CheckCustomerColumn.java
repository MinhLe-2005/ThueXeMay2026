package com.smartride;

import com.smartride.util.DBUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CheckCustomerColumn {
    public static void main(String[] args) {
        try {
            Connection conn = DBUtil.makeConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT character_maximum_length FROM information_schema.columns WHERE table_name = 'Customer' AND column_name = 'IdentityCardImage'");
            if (rs.next()) {
                System.out.println("Max length: " + rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
