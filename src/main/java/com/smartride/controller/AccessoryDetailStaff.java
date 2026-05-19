/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.smartride.controller;

import com.smartride.dao.AccessoryDAO;
import com.smartride.dao.AccessoryDetailDAO;
import com.smartride.dao.BookingDAO;
import com.smartride.dto.Accessory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author LeQuangMinh
 */
@WebServlet(name = "AccessoryDetailStaff", urlPatterns = {"/AccessoryDetailStaff"})
public class AccessoryDetailStaff extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccessoryDAO accessoryDAO = AccessoryDAO.getInstance();
        AccessoryDetailDAO accessoryDetailDAO = AccessoryDetailDAO.getInstance();
        BookingDAO bookingDAO = BookingDAO.getInstance();

        String accessoryID = request.getParameter("id");
//        Accessory accessory = accessoryDAO.getAccessoryByid(accessoryID);
        
    }

}
