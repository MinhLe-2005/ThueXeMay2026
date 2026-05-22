/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.smartride.controller;

import com.smartride.dao.BrandDAO;
import com.smartride.dao.CategoryDAO;
import com.smartride.dao.DashboardDAO;
import com.smartride.dao.MotorcycleDAO;
import com.smartride.dao.PriceListDAO;
import com.smartride.dto.Account;
import com.smartride.dto.Category;
import com.smartride.dto.DashboardStatsData;
import com.smartride.dto.Motorcycle;
import com.smartride.dto.PriceList;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LeQuangMinh
 */
@WebServlet(name = "HomeStaffServlet", urlPatterns = {"/homeStaff"})
public class HomeStaffServlet extends HttpServlet {

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
        
        MotorcycleDAO md = MotorcycleDAO.getInstance();
        CategoryDAO c = CategoryDAO.getInstance();
        PriceListDAO pd = PriceListDAO.getInstance();
        BrandDAO b = BrandDAO.getInstance();
        
        List<Motorcycle> listM = md.getTop5MotorcycleTheMostRental();
        List<PriceList> listP = pd.getAllPriceList();
        
        LinkedHashMap<String, Integer> listCR = c.geNumberRentalCategory();
        
        LinkedHashMap<String, Integer> listB = b.getTotalPriceBrand();
                
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        session.setAttribute("account", account);
        
        request.setAttribute("listM", listM);
        request.setAttribute("listP", listP);
        
        Gson gson = new Gson();
        String jsonCR = gson.toJson(listCR);
        String jsonB = gson.toJson(listB);
        request.setAttribute("categoryData", jsonCR);
        request.setAttribute("brandData", jsonB);
        DashboardDAO dashboardDAO = DashboardDAO.getInstance();
        DashboardStatsData dsd = dashboardDAO.getDashboardData("30days", null, null);
        request.setAttribute("dsd", dsd);
        
        request.getRequestDispatcher("homeStaff.jsp").forward(request, response);
        
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
