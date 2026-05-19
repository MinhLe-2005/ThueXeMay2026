/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.smartride.controller;

import com.smartride.constant.SendEmail;
import com.smartride.dao.AccountDAO;
import com.smartride.dao.BookingDAO;
import com.smartride.dao.CustomerDAO;
import com.smartride.dto.Account;
import com.smartride.dto.Booking;
import com.smartride.dto.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LeQuangMinh
 */
@WebServlet(name = "SendEmailsAutomaticallyServlet", urlPatterns = {"/auto"})
public class SendEmailsAutomaticallyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendEmailsAutomaticallyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendEmailsAutomaticallyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static boolean notificationSent = false; // Biến flag để kiểm tra xem thông báo đã được gửi chưa

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        BookingDAO daoB = BookingDAO.getInstance();
        List<Booking> listB = (List<Booking>) session.getAttribute("listBooking");
        String msg = (String) session.getAttribute("messageListNull");
        if (msg == null) {
            if (listB == null) {
                out.println("thinh");
                listB = daoB.getAllBookings();
            }

            for (Booking x : listB) {
                out.println(x);
            }

            // Get current date and time
            LocalDateTime currentDateTime = LocalDateTime.now();
//            String str = "09-08-2024 21:05:00";

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//            LocalDateTime currentDateTime = LocalDateTime.parse(str, formatter);
            //        String formattedDateTime = currentDateTime.format(formatter);

            CustomerDAO daoC = CustomerDAO.getInstance();
            AccountDAO daoA = AccountDAO.getInstance();

            List<Booking> listCheck = new ArrayList<>();

            for (Booking booking : listB) {
                String startDateStr = booking.getStartDate();
                String endDateStr = booking.getEndDate();
                // Chuyển đổi chuỗi thành LocalDateTime
                LocalDateTime startDate = LocalDateTime.parse(startDateStr, formatter);
                LocalDateTime endDate = LocalDateTime.parse(endDateStr, formatter);
                // Tính toán khoảng thời gian giữa thời gian hiện tại và thời gian bắt đầu
                Duration durationStart = Duration.between(currentDateTime, startDate);
                long hoursBetweenStart = durationStart.toHours();
                
                Duration durationEnd = Duration.between(currentDateTime, endDate);
                long hoursBetweenEnd = durationEnd.toHours();
                
                String title = null;
                Account account = new Account();
                // Kiểm tra nếu còn 3 giờ nữa là đến thời gian bắt đầu
                if (hoursBetweenStart <= 3 && currentDateTime.toLocalDate().isEqual(startDate.toLocalDate())) {
                    out.println("start");
                    Customer customer = daoC.getCustomerbyID(booking.getCustomerID());
                    account = daoA.getAccountbyID(customer.getAccountId());
                    title = "Chào bạn, ColorBike xin thông báo thời gian lấy xe của bạn sắp đến !!! ";
                }
                if (hoursBetweenEnd <= 1 && currentDateTime.toLocalDate().isEqual(endDate.toLocalDate())) {
                    out.println("end");
                    Customer customer = daoC.getCustomerbyID(booking.getCustomerID());
                    account = daoA.getAccountbyID(customer.getAccountId());
                    title = "Chào bạn, ColorBike xin thông báo thời gian trả xe của bạn sắp đến !!! ";
                }
                
                if(title != null) {
                    // Send confirmation email
                    StringBuilder emailContent = new StringBuilder();
                    emailContent.append("<!DOCTYPE html>\n");
                    emailContent.append("<html lang=\"vi\">\n");
                    emailContent.append("<head>\n");
                    emailContent.append("    <meta charset=\"UTF-8\">\n");
                    emailContent.append("    <title>Thông tin đặt xe</title>\n");
                    emailContent.append("    <style>\n");
                    emailContent.append("        body {\n");
                    emailContent.append("            font-family: Arial, sans-serif;\n");
                    emailContent.append("        }\n");
                    emailContent.append("        .container {\n");
                    emailContent.append("            max-width: 600px;\n");
                    emailContent.append("            margin: 0 auto;\n");
                    emailContent.append("            padding: 20px;\n");
                    emailContent.append("            border: 1px solid #ddd;\n");
                    emailContent.append("            border-radius: 10px;\n");
                    emailContent.append("        }\n");
                    emailContent.append("        .header {\n");
                    emailContent.append("            font-size: 18px;\n");
                    emailContent.append("            font-weight: bold;\n");
                    emailContent.append("            margin-bottom: 20px;\n");
                    emailContent.append("        }\n");
                    emailContent.append("        .info, .vehicle-info, .note {\n");
                    emailContent.append("            margin-bottom: 20px;\n");
                    emailContent.append("        }\n");
                    emailContent.append("        .info div, .vehicle-info div {\n");
                    emailContent.append("            margin-bottom: 10px;\n");
                    emailContent.append("        }\n");
                    emailContent.append("        .info div span, .vehicle-info div span {\n");
                    emailContent.append("            font-weight: bold;\n");
                    emailContent.append("        }\n");
                    emailContent.append("        .note ul {\n");
                    emailContent.append("            list-style: none;\n");
                    emailContent.append("            padding: 0;\n");
                    emailContent.append("        }\n");
                    emailContent.append("        .note ul li {\n");
                    emailContent.append("            margin-bottom: 10px;\n");
                    emailContent.append("        }\n");
                    emailContent.append("    </style>\n");
                    emailContent.append("</head>\n");
                    emailContent.append("<body>\n");
                    emailContent.append("<div class=\"container\">\n");
                    emailContent.append("    <div class=\"header\">").append(title).append("</div>\n");
                    emailContent.append("    <div class=\"info\">\n");
                    emailContent.append("        <div><span>Họ tên:</span> ").append(account.getFirstName()).append(" ").append(account.getLastName()).append("</div>\n");
                    emailContent.append("        <div><span>Ngày nhận xe:</span> ").append(booking.getStartDate()).append("</div>\n");
                    emailContent.append("        <div><span>Ngày trả xe:</span> ").append(booking.getEndDate()).append("</div>\n");
                    emailContent.append("        <div><span>Địa điểm nhận xe:</span> ").append(booking.getDeliveryLocation()).append("</div>\n");
                    emailContent.append("        <div><span>Địa điểm trả xe:</span> ").append(booking.getReturnedLocation()).append("</div>\n");
                    emailContent.append("    </div>\n");
                   
                    emailContent.append("    <div class=\"note\">\n");
                    emailContent.append("        <div class=\"header\">Lưu ý:</div>\n");
                    emailContent.append("        <ul>\n");
                    emailContent.append("            <li>Vui lòng mang theo giấy tờ tùy thân khi nhận xe.</li>\n");
                    emailContent.append("            <li>Kiểm tra kỹ thông tin xe trước khi nhận.</li>\n");
                    emailContent.append("            <li>Liên hệ với ColorBike nếu có bất kỳ thắc mắc nào.</li>\n");
                    emailContent.append("        </ul>\n");
                    emailContent.append("    </div>\n");
                    emailContent.append("</div>\n");
                    emailContent.append("</body>\n");
                    emailContent.append("</html>\n");
                    
                    SendEmail.sendVerificationEmail(account.getEmail(), emailContent.toString());
                    listCheck.add(booking);
                }
            }
            if (!listCheck.isEmpty()) {
                if (listB.equals(listCheck)) {
                    session.setAttribute("messageListNull", "ListNull");
                }
                else{
                    listB.removeAll(listCheck);
                }
            }
            session.setAttribute("listBooking", listB);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
