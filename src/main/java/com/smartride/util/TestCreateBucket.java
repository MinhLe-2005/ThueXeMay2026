package com.smartride.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class TestCreateBucket {
    private static final String DB_URL  = "jdbc:postgresql://aws-1-ap-northeast-1.pooler.supabase.com:6543/postgres?sslmode=require";
    private static final String DB_USER = "postgres.zfvgigfjmbtgwgirdify";
    private static final String DB_PASS = "Bimdiendie1@";

    public static void main(String[] args) {
        try {
            Class.forName("org.postgresql.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                // Check if bucket exists
                String sql = "INSERT INTO storage.buckets (id, name, public) VALUES ('images', 'images', true) ON CONFLICT DO NOTHING";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    int rows = stmt.executeUpdate();
                    System.out.println("Bucket inserted. Rows affected: " + rows);
                }
                
                // Add policy to allow public access to images bucket
                String policy1 = "CREATE POLICY \"Public Access\" ON storage.objects FOR SELECT USING (bucket_id = 'images');";
                try (PreparedStatement stmt = conn.prepareStatement(policy1)) {
                    stmt.execute();
                    System.out.println("Policy 1 created.");
                } catch (Exception e) {
                    System.out.println("Policy 1 error (maybe already exists): " + e.getMessage());
                }
                
                // Add policy to allow insert
                String policy2 = "CREATE POLICY \"Public Insert\" ON storage.objects FOR INSERT WITH CHECK (bucket_id = 'images');";
                try (PreparedStatement stmt = conn.prepareStatement(policy2)) {
                    stmt.execute();
                    System.out.println("Policy 2 created.");
                } catch (Exception e) {
                    System.out.println("Policy 2 error: " + e.getMessage());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
