package com.smartride.controller;

import com.smartride.dao.BookingDAO;
import com.smartride.dao.CustomerDAO;
import com.smartride.dao.FeedbackDAO;
import com.smartride.dto.Account;
import com.smartride.dto.Booking;
import com.smartride.dto.Customer;
import com.smartride.dto.Feedback;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(name = "FeedbackServlet", urlPatterns = {"/feedback"})
public class FeedbackServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Feedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Feedback at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String bookingId = request.getParameter("bookingId");
            HttpSession session = request.getSession();
            if (bookingId != null) {
                session.setAttribute("bookingId", bookingId);
            } else {
                bookingId = (String) session.getAttribute("bookingId");
            }
            Feedback fb = FeedbackDAO.getInstance().getFeedbackByBookingId(bookingId);

            Booking booking = BookingDAO.getInstance().getBookingById(bookingId);
            List<Map<String, Object>> motorcycleBook = BookingDAO.getInstance().getMotorcyclesByBookingID(bookingId);
            request.setAttribute("booking", booking);
            request.setAttribute("motorcycleBook", motorcycleBook);
            request.setAttribute("fb", fb);

            request.getRequestDispatcher("feedback.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String bookingId = request.getParameter("bookingId");
            String product = request.getParameter("product");
            String service = request.getParameter("service");
            String delivery = request.getParameter("delivery");
            String content = request.getParameter("content");

            Account acc = (Account) session.getAttribute("account");
            Customer cus = CustomerDAO.getInstance().getCustomerbyAccountID(acc.getAccountId());
            Feedback fb = FeedbackDAO.getInstance().getFeedbackByBookingId(bookingId);

            int productRating = product != null && !product.isEmpty() ? Integer.parseInt(product) : 0;
            int serviceRating = service != null && !service.isEmpty() ? Integer.parseInt(service) : 0;
            int deliveryRating = delivery != null && !delivery.isEmpty() ? Integer.parseInt(delivery) : 0;

            if (productRating > 0 && serviceRating > 0 && deliveryRating > 0 && content != null && !content.isEmpty()) {
                if (fb != null) {
                    FeedbackDAO.getInstance().updateFeedback(content, productRating, serviceRating, deliveryRating, cus.getCustomerId(), bookingId);
                    session.setAttribute("feedbackUpdate", "Note: Cập nhật đánh giá thành công!");
                } else {
                    FeedbackDAO.getInstance().insertFeedback(content, productRating, serviceRating, deliveryRating, cus.getCustomerId(), bookingId);
                    session.setAttribute("feedbackResult", "Note: Ghi nhận phản hồi thành công! Vui lòng đợi trong giây lát...");
                }
            } else {
                session.setAttribute("feedbackFail", "Ghi nhận phản hồi thất bại. Vui lòng điền tất cả thông tin...");
            }

            Booking booking = BookingDAO.getInstance().getBookingById(bookingId);
            List<Map<String, Object>> motorcycleBook = BookingDAO.getInstance().getMotorcyclesByBookingID(bookingId);

            session.setAttribute("booking", booking);
            request.setAttribute("motorcycleBook", motorcycleBook);
            request.setAttribute("fb", fb);

            request.getRequestDispatcher("feedback.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}