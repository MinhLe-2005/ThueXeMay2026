/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.smartride.controller;

import com.smartride.dao.TouristLocationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import com.smartride.dto.TouristLocation;
import com.smartride.util.SupabaseStorageUtil;
/**
 *
 * @author LeQuangMinh
 */
@WebServlet(name = "DeleteTourismLocationServletStaff", urlPatterns = {"/DeleteTourismLocationServletStaff"})
public class DeleteTourismLocationServletStaff extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TouristLocationDAO touristLocationDAO = TouristLocationDAO.getInstance();
        try {
            String id = request.getParameter("locationId");
            TouristLocation location = touristLocationDAO.getTouristLocationbyID(Integer.parseInt(id));
            if (location != null && location.getLocationImage() != null) {
                SupabaseStorageUtil.deleteFile(location.getLocationImage());
            }

            touristLocationDAO.deleteTouristLocation(id);
            response.sendRedirect("TourismLocationServletStaff");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    
}
