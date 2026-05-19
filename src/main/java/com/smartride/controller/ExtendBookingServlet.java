/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.smartride.controller;

import com.smartride.dao.AccessoryDAO;
import com.smartride.dao.AccessoryDetailDAO;
import com.smartride.dao.BookingDAO;
import com.smartride.dao.BookingDetailDAO;
import com.smartride.dao.MotorcycleDAO;
import com.smartride.dao.PaymentDAO;
import com.smartride.dao.PriceListDAO;
import com.smartride.dto.Accessory;
import com.smartride.dto.Booking;
import com.smartride.dto.BookingDetail;
import com.smartride.dto.Motorcycle;
import com.smartride.dto.Payment;
import com.smartride.dto.PriceList;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author LeQuangMinh
 */
@WebServlet(name = "ExtendBookingServlet", urlPatterns = {"/extend"})
public class ExtendBookingServlet extends HttpServlet {

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
        
        String bookingid = request.getParameter("bookingid");
        BookingDAO daoB = BookingDAO.getInstance();
        Booking booking = daoB.getBookingById(bookingid);
        request.setAttribute("booking", booking);
        
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

        try {
            Date dateStart = dateTimeFormat.parse(booking.getStartDate());
            Date dateEnd = dateTimeFormat.parse(booking.getEndDate());
            String dateStartPart = dateFormat.format(dateStart);
            String timeStartPart = timeFormat.format(dateStart);
            String dateEndPart = dateFormat.format(dateEnd);
            String timeEndPart = timeFormat.format(dateEnd);
            
            request.setAttribute("startDate", dateStartPart);
            request.setAttribute("startTime", timeStartPart);
            request.setAttribute("endDate", dateEndPart);
            request.setAttribute("endTime", timeEndPart);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        MotorcycleDAO daoM = MotorcycleDAO.getInstance();
        LinkedHashMap<Motorcycle, Integer> listM = daoM.getListMotorcycleByBookingId(booking.getBookingID());
        request.setAttribute("listM", listM );
        
        
        AccessoryDAO daoA = AccessoryDAO.getInstance();
        LinkedHashMap<Accessory, Integer>  listA = daoA.getListByBookingId(booking.getBookingID());
        request.setAttribute("listA", listA);
        
        PriceListDAO daoP = PriceListDAO.getInstance();
        List<PriceList> listP = daoP.getAllPriceList();
        request.setAttribute("listP", listP);
        
        PaymentDAO daoPM = PaymentDAO.getInstance();
        List<Payment> listPM = daoPM.getListByBookingId(booking.getBookingID());
        request.setAttribute("listPM", listPM);
        
        request.getRequestDispatcher("extendBooking.jsp").forward(request, response);
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
