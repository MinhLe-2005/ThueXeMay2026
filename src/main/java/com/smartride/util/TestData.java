package com.smartride.util;

import com.smartride.dao.MotorcycleDAO;
import com.smartride.dto.Motorcycle;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class TestData {
    public static void main(String[] args) {
        try {
            Connection conn = DBUtil.makeConnection();
            if (conn == null) {
                System.out.println("❌ Không thể kết nối database!");
                return;
            }
            
            System.out.println("✅ Kết nối thành công. Đang kiểm tra dữ liệu...");
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM \"Motorcycle\"");
            if (rs.next()) {
                System.out.println("Số lượng xe trong bảng 'Motorcycle': " + rs.getInt(1));
            }
            
            rs = stmt.executeQuery("SELECT COUNT(*) FROM \"Category\"");
            if (rs.next()) {
                System.out.println("Số lượng loại xe trong bảng 'Category': " + rs.getInt(1));
            }

            System.out.println("--- Thử gọi MotorcycleDAO.getMotorcycles() ---");
            List<Motorcycle> list = MotorcycleDAO.getInstance().getMotorcycles();
            System.out.println("Số lượng xe lấy được từ DAO: " + list.size());
            for (Motorcycle m : list) {
                System.out.println(" - " + m.getModel());
            }
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
