package com.smartride.controller;

import com.smartride.dao.ContactDAO;
import com.smartride.dto.Account;
import jakarta.mail.Session;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="ContactServlet", urlPatterns={"/contact"})
public class ContactServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ContactServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String title = request.getParameter("title");
        String message = request.getParameter("message");
        
        HttpSession session = request.getSession();
        
        ContactDAO cd = ContactDAO.getInstance();
        Account acc = (Account) session.getAttribute("account");
        
        if(acc != null){
            cd.insertContact(name, phone, email, title, message, acc.getAccountId());
        } else {
            cd.insertContact(name, phone, email, title, message, null);
        }
        
        // Gửi email thông báo về mail hệ thống
        String to = "smartride.system@gmail.com";
        String content = "<h3>Bạn vừa nhận được một liên hệ mới từ khách hàng trên hệ thống SmartRide.</h3>"
                + "<p><strong>Thông tin khách hàng:</strong></p>"
                + "<ul>"
                + "<li><strong>Tên:</strong> " + name + "</li>"
                + "<li><strong>Số điện thoại:</strong> " + phone + "</li>"
                + "<li><strong>Email:</strong> " + email + "</li>"
                + "<li><strong>Tiêu đề:</strong> " + title + "</li>"
                + "</ul>"
                + "<p><strong>Nội dung:</strong><br/>" + message.replace("\n", "<br>") + "</p>";
        
        try {
            com.smartride.constant.SendEmail.sendVerificationEmail(to, content);
            request.setAttribute("msg", "Gửi yêu cầu thành công! Cảm ơn bạn đã liên hệ, đội ngũ SmartRide sẽ phản hồi bạn trong vòng 24h làm việc.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Đã lưu thông tin liên hệ nhưng có lỗi khi gửi email thông báo: " + e.getMessage());
        }
        
        request.getRequestDispatcher("contact.jsp").forward(request, response);
       
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
