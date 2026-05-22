package com.smartride.test;

import com.smartride.dao.AccountDAO;
import java.sql.Connection;
import com.smartride.util.DBUtil;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TestUpdate {
    public static void main(String[] args) {
        String firstName = "Lê Quang";
        String lastName = "Minh";
        String gender = "Nam";
        String dob = "01/09/2005"; // The browser might be sending this!
        String address = "18/91 hai bà trưng, phường Quảng Trị";
        String phoneNumber = "0943515000";
        String email = "lequangminhqwer@gmail.com";
        String username = "lequangminhqwer@gmail.com";
        int accountid = 1; // Assuming 1 for testing

        try {
            // Replicate exactly what AccountDAO does but catch and print
            Connection conn = DBUtil.makeConnection();
            String sql = "UPDATE \"Account\" SET \"FirstName\" = ?, \"LastName\" = ?, \"Gender\" = ?, \"DayOfBirth\" = ?, \"Address\" = ?,"
                    + "\"PhoneNumber\" = ?, \"Email\" = ?, \"Username\" = ? WHERE \"AccountID\" = ?";
            
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, firstName);
            st.setString(2, lastName);
            st.setString(3, gender);
            
            if (dob == null || dob.trim().isEmpty()) {
                st.setNull(4, java.sql.Types.DATE);
            } else {
                try {
                    java.sql.Date sqlDate = java.sql.Date.valueOf(dob);
                    st.setDate(4, sqlDate);
                    System.out.println("Parsed date successfully: " + sqlDate);
                } catch (IllegalArgumentException e) {
                    System.out.println("IllegalArgumentException parsing date: " + dob);
                    st.setNull(4, java.sql.Types.DATE);
                }
            }
            
            st.setString(5, address);
            st.setString(6, phoneNumber);
            st.setString(7, email);
            st.setString(8, username);
            st.setInt(9, accountid);

            int rowAffect = st.executeUpdate();
            System.out.println("Row affected: " + rowAffect);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
