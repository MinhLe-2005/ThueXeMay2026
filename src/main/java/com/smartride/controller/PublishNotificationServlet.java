package com.smartride.controller;

import com.smartride.dao.EventDAO;
import com.smartride.dao.NotificationDAO;
import com.smartride.dao.VoucherDAO;
import com.smartride.dto.Account;
import com.smartride.dto.Event;
import com.smartride.dto.Voucher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PublishNotificationServlet", urlPatterns = {"/api/publish-notification"})
public class PublishNotificationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            out.print("{\"status\":\"error\", \"message\":\"Unauthorized\"}");
            out.flush();
            return;
        }
        
        Account account = (Account) session.getAttribute("account");
        if (account.getRoleID() == 1) { // Customer không được phép
            out.print("{\"status\":\"error\", \"message\":\"Forbidden\"}");
            out.flush();
            return;
        }

        String type = request.getParameter("type");
        String idParam = request.getParameter("id");
        
        try {
            int id = Integer.parseInt(idParam);
            NotificationDAO notifDAO = NotificationDAO.getInstance();
            boolean success = false;
            
            if ("voucher".equals(type)) {
                Voucher voucher = VoucherDAO.getInstance().getVoucherById(id);
                if (voucher != null) {
                    String title = "🎁 Tặng bạn Voucher Giảm Giá!";
                    String message = "Khuyến mãi hấp dẫn! Nhập mã " + voucher.getCode() + " để được giảm " + String.format("%,.0f", voucher.getDiscountAmount()) + "VNĐ. Đặt xe ngay để sử dụng!";
                    String link = "motorcycles"; // Dẫn đến trang đặt xe
                    success = notifDAO.insertBroadcastNotification(title, message, link);
                    
                    if (success) {
                        final String emailContent = "<div style='font-family: Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: auto; border: 1px solid #e0e0e0; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.05);'>"
                                + "<div style='text-align: center; margin-bottom: 20px;'>"
                                + "<h2 style='color: #0056b3; margin: 0;'>🎉 TẶNG BẠN VOUCHER GIẢM GIÁ MỚI 🎉</h2>"
                                + "</div>"
                                + "<p style='font-size: 16px;'>Kính gửi Quý Khách,</p>"
                                + "<p style='font-size: 16px;'>SmartRide vừa tung ra mã giảm giá mới cực kỳ hấp dẫn dành cho bạn!</p>"
                                + "<div style='background-color: #f9f9f9; padding: 15px; border-radius: 8px; margin: 20px 0;'>"
                                + "<p style='margin: 5px 0; font-size: 16px;'>🎁 <strong>Mã Voucher:</strong> <span style='color: #e74c3c; font-size: 18px; font-weight: bold;'>" + voucher.getCode() + "</span></p>"
                                + "<p style='margin: 5px 0; font-size: 16px;'>💰 <strong>Mức Giảm Giá:</strong> " + String.format("%,.0f", voucher.getDiscountAmount()) + " VNĐ</p>"
                                + "<p style='margin: 5px 0; font-size: 16px;'>📝 <strong>Chi tiết:</strong> " + voucher.getDescription() + "</p>"
                                + "</div>"
                                + "<p style='font-size: 16px;'>Hãy nhanh tay truy cập hệ thống và đặt xe ngay hôm nay để không bỏ lỡ cơ hội này!</p>"
                                + "<p style='font-size: 16px; margin-top: 30px;'>Trân trọng,<br><strong>Đội ngũ SmartRide</strong></p>"
                                + "</div>";
                        sendEmailToAllCustomersAsync(emailContent);
                    }
                }
            } else if ("event".equals(type)) {
                Event event = EventDAO.getInstance().getEventbyID(id);
                if (event != null) {
                    String title = "🎉 Sự Kiện Mới: " + event.getEventTitle();
                    String message = "Sự kiện diễn ra từ " + event.getStartDate() + " đến " + event.getEndDate() + ". Giảm ngay " + String.format("%,.0f", event.getDiscount()) + "VNĐ. Xem ngay!";
                    String link = "motorcycles";
                    success = notifDAO.insertBroadcastNotification(title, message, link);
                    
                    if (success) {
                        final String emailContent = "<div style='font-family: Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: auto; border: 1px solid #e0e0e0; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.05);'>"
                                + "<div style='text-align: center; margin-bottom: 20px;'>"
                                + "<h2 style='color: #0056b3; margin: 0;'>🎊 SỰ KIỆN KHUYẾN MÃI MỚI 🎊</h2>"
                                + "</div>"
                                + "<p style='font-size: 16px;'>Kính gửi Quý Khách,</p>"
                                + "<p style='font-size: 16px;'>SmartRide vừa ra mắt một sự kiện khuyến mãi vô cùng hấp dẫn!</p>"
                                + "<div style='background-color: #f9f9f9; padding: 15px; border-radius: 8px; margin: 20px 0;'>"
                                + "<p style='margin: 5px 0; font-size: 16px;'>✨ <strong>Sự kiện:</strong> <span style='color: #2c3e50; font-weight: bold;'>" + event.getEventTitle() + "</span></p>"
                                + "<p style='margin: 5px 0; font-size: 16px;'>💰 <strong>Mức Giảm Giá:</strong> <span style='color: #e74c3c; font-weight: bold;'>" + String.format("%,.0f", event.getDiscount()) + " VNĐ</span></p>"
                                + "<p style='margin: 5px 0; font-size: 16px;'>📅 <strong>Thời gian:</strong> Từ " + event.getStartDate() + " đến " + event.getEndDate() + "</p>"
                                + "<p style='margin: 5px 0; font-size: 16px;'>📝 <strong>Chi tiết:</strong> " + event.getDescription() + "</p>"
                                + "</div>"
                                + "<p style='font-size: 16px;'>Vui lòng nhanh tay đặt xe để tận hưởng mức giá ưu đãi trong thời gian sự kiện diễn ra!</p>"
                                + "<p style='font-size: 16px; margin-top: 30px;'>Trân trọng,<br><strong>Đội ngũ SmartRide</strong></p>"
                                + "</div>";
                        sendEmailToAllCustomersAsync(emailContent);
                    }
                }
            }

            if (success) {
                out.print("{\"status\":\"success\"}");
            } else {
                out.print("{\"status\":\"error\", \"message\":\"Failed to publish or item not found\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"status\":\"error\", \"message\":\"" + e.getMessage() + "\"}");
        }
        out.flush();
    }
    
    private void sendEmailToAllCustomersAsync(String htmlContent) {
        new Thread(() -> {
            try {
                java.util.List<Account> customers = com.smartride.dao.AccountDAO.getInstance().getAllAccountsByRole(1);
                for (Account cus : customers) {
                    String email = cus.getEmail();
                    if (email != null && !email.trim().isEmpty()) {
                        com.smartride.constant.SendEmail.sendVerificationEmail(email, htmlContent);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();
    }
}
