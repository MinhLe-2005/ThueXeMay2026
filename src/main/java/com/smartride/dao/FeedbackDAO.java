package com.smartride.dao;

import com.smartride.dto.Feedback;
import com.smartride.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LeQuangMinh
 */
public class FeedbackDAO implements Serializable {

    private static FeedbackDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private FeedbackDAO() {
    }

    public static FeedbackDAO getInstance() {
        if (instance == null) {
            instance = new FeedbackDAO();
        }
        try {
            if (instance.conn == null || instance.conn.isClosed()) {
                instance.conn = DBUtil.makeConnection();
            }
        } catch (SQLException e) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return instance;
    }

    public int getQuantityFeedback() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM \"Feedback\"";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public List<Feedback> getAllFeedbacks() {
        List<Feedback> list = new ArrayList<>();
        try {
            String sql = "SELECT f.*, a.\"FirstName\" || ' ' || a.\"LastName\", a.\"Image\"\n"
                    + "FROM \"Feedback\" f\n"
                    + "JOIN \"Customer\" c ON f.\"CustomerID\" = c.\"CustomerID\"\n"
                    + "JOIN \"Account\" a ON c.\"AccountID\" = a.\"AccountID\"";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getInt(3),
                    rs.getInt(4),
                    rs.getInt(5),
                    rs.getString(6),
                    rs.getString(9),
                    rs.getString(10),
                    rs.getInt(7),
                    rs.getString(8)
                ));
            }
        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean insertFeedback(String content, int productRate, int serviceRate, int deliveryRate, int customerId, String bookingID) {
        String sql = "INSERT INTO \"Feedback\" (\"Content\", \"ProductRate\", \"ServiceRate\", \"DeliveryRate\", \"FeedbackTime\", \"CustomerID\", \"BookingID\") VALUES (?, ?, ?, ?, CURRENT_DATE, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, content);
            ps.setInt(2, productRate);
            ps.setInt(3, serviceRate);
            ps.setInt(4, deliveryRate);
            ps.setInt(5, customerId);
            ps.setString(6, bookingID);
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public Feedback getFeedbackByBookingId(String bookingId) {
        String sql = "SELECT * FROM \"Feedback\" WHERE \"BookingID\" = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Feedback(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public boolean updateFeedback(String content, int productRate, int serviceRate, int deliveryRate, int customerId, String bookingID) {
        String sql = "UPDATE \"Feedback\" SET \"Content\" = ?, \"ProductRate\" = ?, \"ServiceRate\" = ?, \"DeliveryRate\" = ?, \"CustomerID\" = ? "
                + "WHERE \"BookingID\" = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, content);
            ps.setInt(2, productRate);
            ps.setInt(3, serviceRate);
            ps.setInt(4, deliveryRate);
            ps.setInt(5, customerId);
            ps.setString(6, bookingID);
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
}
