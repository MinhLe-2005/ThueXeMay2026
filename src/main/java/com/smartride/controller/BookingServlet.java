/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.smartride.controller;

import com.smartride.dao.AccessoryDAO;
import com.smartride.dao.AccountDAO;
import com.smartride.dao.CustomerDAO;
import com.smartride.dao.MotorcycleDAO;
import com.smartride.dao.PriceListDAO;
import com.smartride.dto.Accessory;
import com.smartride.dto.Account;
import com.smartride.dto.Customer;
import com.smartride.dto.Motorcycle;
import com.smartride.dto.PriceList;
import com.smartride.dto.Event;
import com.smartride.dao.EventDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author LeQuangMinh
 */
@WebServlet(name = "BookingServlet", urlPatterns = {"/booking"})
public class BookingServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if(account != null && account.getRoleID() == 1){           
    //        session.setAttribute("account", AccountDAO.getInstance().checkLogin("thinhtvde170182@fpt.edu.vn", "Lb4_aa"));
//            session.setAttribute("account", AccountDAO.getInstance().checkLogin("myphan123", "myphanpass"));
            session.setAttribute("account", AccountDAO.getInstance().checkLogin(account.getUserName(), account.getPassWord()));
            MotorcycleDAO daoM = MotorcycleDAO.getInstance();
        
            //Tu mototcycle vao
            String motorcycleid = request.getParameter("motorcycleid");
            Motorcycle motorcycle = daoM.getMotorcycleByid(motorcycleid);
            request.setAttribute("chosenmotor", motorcycleid);


            List<Motorcycle> listM = daoM.getAll();
            LinkedHashMap<String, String> map = daoM.getAllAvailableMotorCycle();
            request.setAttribute("listM", listM);
            request.setAttribute("listMA", map);

            PriceListDAO daoP = PriceListDAO.getInstance();
            List<PriceList> listP = daoP.getAllPriceList();
            request.setAttribute("listP", listP);

            AccessoryDAO daoA = AccessoryDAO.getInstance();
            List<Accessory> listA = daoA.getAll();
            request.setAttribute("listA", listA);

            CustomerDAO daoC = CustomerDAO.getInstance();
            List<Customer> listC = daoC.getAll();
            request.setAttribute("listC", listC);

            Event activeEvent = EventDAO.getInstance().getActiveEvent();
            request.setAttribute("activeEvent", activeEvent);

            request.getRequestDispatcher("booking.jsp").forward(request, response);  
        } else if(account != null && account.getRoleID() != 1) {
            response.sendRedirect("accessdenied.jsp");
        } else {
            session.setAttribute("redirectAfterLogin", "booking");
            response.sendRedirect("login");
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
