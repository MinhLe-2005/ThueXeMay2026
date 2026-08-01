package com.smartride.util;
import java.sql.*;
public class UpdateDB {
    public static void main(String[] args) {
        try (Connection c = DBUtil.makeConnection(); Statement s = c.createStatement()) {
            s.execute("ALTER TABLE "Voucher" ADD COLUMN "MinSpend" DECIMAL(10,3) DEFAULT 0");
            s.execute("ALTER TABLE "Voucher" ADD COLUMN "MaxDiscount" DECIMAL(10,3) DEFAULT 0");
            System.out.println("SUCCESS DB MIGRATION");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
