package com.smartride;

import com.smartride.util.SupabaseStorageUtil;
import java.io.ByteArrayInputStream;
import java.io.InputStream;

public class TestSupabase {
    public static void main(String[] args) {
        try {
            String testContent = "Hello Supabase!";
            InputStream is = new ByteArrayInputStream(testContent.getBytes());
            String url = SupabaseStorageUtil.uploadFile("motor-images", "test_file_front", is, "text/plain");
            System.out.println("Uploaded URL: " + url);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
