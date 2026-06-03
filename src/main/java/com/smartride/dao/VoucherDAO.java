package com.smartride.dao;

import com.smartride.dto.Voucher;
import com.smartride.util.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VoucherDAO implements Serializable {

    private static VoucherDAO instance;
    private Connection conn = DBUtil.makeConnection();

    private VoucherDAO() {}

    public static VoucherDAO getInstance() {
        if (instance == null) {
            instance = new VoucherDAO();
        }
        return instance;
    }

    /**
     * Get a valid (active) voucher by code.
     * If customerID > 0, also checks that the voucher belongs to that customer OR is a general voucher (customerID=0).
     */
    public Voucher getVoucherByCode(String code, int customerId) {
        // Status values from DB: 'Chưa sử dụng' = available, 'Đã sử dụng' = used
        // A voucher is valid if it belongs to this customer AND has not been used
        String sql = "SELECT \"VoucherID\", \"Code\", \"DiscountAmount\", \"Description\", \"CreatedTime\", \"Status\", \"CustomerID\" "
                   + "FROM \"Voucher\" "
                   + "WHERE \"Code\" = ? AND \"Status\" = 'Chưa sử dụng' "
                   + "AND \"CustomerID\" = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            ps.setInt(2, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Voucher v = new Voucher();
                v.setVoucherId(rs.getInt("VoucherID"));
                v.setCode(rs.getString("Code"));
                v.setDiscountAmount(rs.getDouble("DiscountAmount"));
                v.setDescription(rs.getString("Description"));
                v.setCreatedTime(rs.getString("CreatedTime"));
                v.setStatus(rs.getString("Status"));
                v.setCustomerID(rs.getInt("CustomerID"));
                return v;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Mark a voucher as used after booking is confirmed.
     */
    public void markVoucherUsed(int voucherId) {
        String sql = "UPDATE \"Voucher\" SET \"Status\" = 'Đã sử dụng' WHERE \"VoucherID\" = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, voucherId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Get all vouchers for a specific customer (for display).
     */
    public java.util.List<Voucher> getVouchersByCustomerId(int customerId) {
        java.util.List<Voucher> list = new java.util.ArrayList<>();
        String sql = "SELECT \"VoucherID\", \"Code\", \"DiscountAmount\", \"Description\", \"CreatedTime\", \"Status\", \"CustomerID\" "
                   + "FROM \"Voucher\" WHERE \"CustomerID\" = ? ORDER BY \"CreatedTime\" DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Voucher v = new Voucher();
                v.setVoucherId(rs.getInt("VoucherID"));
                v.setCode(rs.getString("Code"));
                v.setDiscountAmount(rs.getDouble("DiscountAmount"));
                v.setDescription(rs.getString("Description"));
                v.setCreatedTime(rs.getString("CreatedTime"));
                v.setStatus(rs.getString("Status"));
                v.setCustomerID(rs.getInt("CustomerID"));
                list.add(v);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Lấy toàn bộ danh sách voucher (dành cho Admin)
     */
    public java.util.List<Voucher> getAllVouchers() {
        java.util.List<Voucher> list = new java.util.ArrayList<>();
        String sql = "SELECT \"VoucherID\", \"Code\", \"DiscountAmount\", \"Description\", \"CreatedTime\", \"Status\", \"CustomerID\" "
                   + "FROM \"Voucher\" ORDER BY \"CreatedTime\" DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Voucher v = new Voucher();
                v.setVoucherId(rs.getInt("VoucherID"));
                v.setCode(rs.getString("Code"));
                v.setDiscountAmount(rs.getDouble("DiscountAmount"));
                v.setDescription(rs.getString("Description"));
                v.setCreatedTime(rs.getString("CreatedTime"));
                v.setStatus(rs.getString("Status"));
                v.setCustomerID(rs.getInt("CustomerID"));
                list.add(v);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Thêm Voucher mới
     */
    public boolean insertVoucher(Voucher v) {
        String sql = "INSERT INTO \"Voucher\" (\"Code\", \"DiscountAmount\", \"Description\", \"Status\", \"CustomerID\") VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, v.getCode());
            ps.setDouble(2, v.getDiscountAmount());
            ps.setString(3, v.getDescription());
            ps.setString(4, v.getStatus());
            if (v.getCustomerID() > 0) {
                ps.setInt(5, v.getCustomerID());
            } else {
                ps.setNull(5, java.sql.Types.INTEGER);
            }
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Cập nhật Voucher
     */
    public boolean updateVoucher(Voucher v) {
        String sql = "UPDATE \"Voucher\" SET \"Code\" = ?, \"DiscountAmount\" = ?, \"Description\" = ?, \"Status\" = ?, \"CustomerID\" = ? WHERE \"VoucherID\" = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, v.getCode());
            ps.setDouble(2, v.getDiscountAmount());
            ps.setString(3, v.getDescription());
            ps.setString(4, v.getStatus());
            if (v.getCustomerID() > 0) {
                ps.setInt(5, v.getCustomerID());
            } else {
                ps.setNull(5, java.sql.Types.INTEGER);
            }
            ps.setInt(6, v.getVoucherId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Xóa Voucher
     */
    public boolean deleteVoucher(int voucherId) {
        String sql = "DELETE FROM \"Voucher\" WHERE \"VoucherID\" = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, voucherId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
