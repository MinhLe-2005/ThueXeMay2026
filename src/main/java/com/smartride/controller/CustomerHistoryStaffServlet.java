package com.smartride.controller;

import com.google.gson.Gson;
import com.smartride.dao.BookingDAO;
import com.smartride.dto.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.SimpleDateFormat;
import com.smartride.dto.BookingDetail;

@WebServlet(name = "CustomerHistoryStaffServlet", urlPatterns = {"/customerHistoryStaff"})
public class CustomerHistoryStaffServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            String customerIdStr = request.getParameter("customerId");
            if (customerIdStr == null || customerIdStr.isEmpty()) {
                out.print("[]");
                return;
            }
            
            int customerId = Integer.parseInt(customerIdStr);
            
            // Get all bookings
            List<Booking> bookings = BookingDAO.getInstance().getAllBookings();
            List<Map<String, Object>> result = new ArrayList<>();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
            
            for (Booking b : bookings) {
                if (b.getCustomerID() == customerId) {
                    Map<String, Object> map = new HashMap<>();
                    map.put("bookingID", b.getBookingID());
                    map.put("startDate", sdf.format(b.getStartDate()));
                    map.put("endDate", sdf.format(b.getEndDate()));
                    map.put("status", b.getStatusBooking());
                    
                    double total = 0;
                    int count = 0;
                    if (b.getListBookingDetails() != null) {
                        count = b.getListBookingDetails().size();
                        for (BookingDetail bd : b.getListBookingDetails()) {
                            total += bd.getTotalPrice();
                        }
                    }
                    map.put("motorName", count + " xe");
                    map.put("totalPrice", total);
                    result.add(map);
                }
            }
            
            result.sort((m1, m2) -> ((String)m2.get("startDate")).compareTo((String)m1.get("startDate")));
            
            Gson gson = new Gson();
            out.print(gson.toJson(result));
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
            response.getWriter().print("[]");
        }
    }
}
