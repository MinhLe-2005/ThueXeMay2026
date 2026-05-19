/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.smartride.controller;

import com.smartride.dao.StaffDAO;
import com.smartride.dao.TouristLocationDAO;
import com.smartride.dto.Staff;
import com.smartride.dto.TouristLocation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author LeQuangMinh
 */
@WebServlet(name = "TourismLocationServletStaff", urlPatterns = {"/TourismLocationServletStaff"})
public class TourismLocationServletStaff extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TouristLocationDAO touristLocationDAO = TouristLocationDAO.getInstance();
        StaffDAO staffDAO = StaffDAO.getInstance();
        
        List<TouristLocation> touristLocations = touristLocationDAO.getAllTouristLocation();
        List<Staff> staffList = staffDAO.getAllStaff();
        
        request.setAttribute("staffList", staffList);
        request.setAttribute("touristLocation", touristLocations);
        request.getRequestDispatcher("tourismLocatonStaff.jsp").forward(request, response);
    }
}
