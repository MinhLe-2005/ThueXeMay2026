package com.smartride.controller;

import com.google.gson.Gson;
import com.smartride.dao.BookingDAO;
import com.smartride.util.SupabaseStorageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "HandoverAPI", urlPatterns = {"/api/handover-upload"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 100) // 100MB
public class HandoverAPI extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> json = new HashMap<>();

        try {
            String bookingId = request.getParameter("bookingId");
            if (bookingId == null || bookingId.isEmpty()) {
                json.put("status", "error");
                json.put("message", "Missing bookingId");
                out.print(new Gson().toJson(json));
                return;
            }

            List<String> savedImages = new ArrayList<>();

            for (Part part : request.getParts()) {
                if (part.getName().startsWith("photo") && part.getSize() > 0) {
                    String fileName = getFileName(part);
                    String uniqueFileName = bookingId + "_" + System.currentTimeMillis() + "_" + fileName;
                    
                    // Upload to Supabase Storage
                    String publicUrl = SupabaseStorageUtil.uploadFile("motor-images", uniqueFileName, part.getInputStream(), part.getContentType());
                    if (publicUrl != null) {
                        savedImages.add(publicUrl);
                    }
                }
            }

            if (savedImages.isEmpty()) {
                json.put("status", "error");
                json.put("message", "Vui lòng chụp ít nhất 1 bức ảnh tình trạng xe.");
                out.print(new Gson().toJson(json));
                return;
            }

            String jsonImages = new Gson().toJson(savedImages);
            
            // Save image URLs to DB and update status
            BookingDAO.getInstance().updateDeliveryStatusWithImage("Đã giao", bookingId, jsonImages);

            // AUTO PAY REMAINING AMOUNT
            try {
                String checkQuery = "SELECT b.\"BookingID\", " +
                        "COALESCE(SUM(bd.\"TotalPrice\"), 0) + COALESCE(b.\"DeliveryFee\", 0) + COALESCE((SELECT SUM(\"ExtensionFee\") FROM \"BookingExtension\" WHERE \"BookingID\" = b.\"BookingID\"), 0) AS TotalAmount, " +
                        "COALESCE((SELECT SUM(\"PaymentAmount\") FROM \"Payment\" WHERE \"BookingID\" = b.\"BookingID\" AND (\"PaymentStatus\" = 'Thành công' OR \"PaymentStatus\" LIKE '%th%nh c%ng%')), 0) AS PaidAmount " +
                        "FROM \"Booking\" b LEFT JOIN \"BookingDetail\" bd ON b.\"BookingID\" = bd.\"BookingID\" " +
                        "WHERE b.\"BookingID\" = ? GROUP BY b.\"BookingID\", b.\"DeliveryFee\"";
                try (java.sql.Connection conn = com.smartride.util.DBUtil.getConnection();
                     java.sql.PreparedStatement ps = conn.prepareStatement(checkQuery)) {
                    ps.setString(1, bookingId);
                    try (java.sql.ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            double total = rs.getDouble("TotalAmount");
                            double paid = rs.getDouble("PaidAmount");
                            double diff = total - paid;
                            if (diff > 0) {
                                com.smartride.dao.PaymentDAO.getInstance().addLateFeePayment(bookingId, "Tiền mặt (Thu tự động)", java.time.LocalDateTime.now().format(java.time.format.DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")), diff);
                            }
                        }
                    }
                }
            } catch (Exception ex) {
                System.out.println("Loi tu dong thanh toan khi giao xe: " + ex.getMessage());
            }

            json.put("status", "success");
            json.put("message", "Handover completed successfully");

        } catch (Exception ex) {
            json.put("status", "error");
            json.put("message", "Error uploading files: " + ex.getMessage());
        }

        out.print(new Gson().toJson(json));
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "unknown.jpg";
    }
}
