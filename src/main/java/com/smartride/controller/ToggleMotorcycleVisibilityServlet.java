package com.smartride.controller;

import com.smartride.dao.MotorcycleDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ToggleMotorcycleVisibilityServlet", urlPatterns = {"/toggleMotorVisibility"})
public class ToggleMotorcycleVisibilityServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null) {
            MotorcycleDAO dao = MotorcycleDAO.getInstance();
            boolean success = dao.toggleVisibilityMotorcycle(id);
            if (success) {
                response.sendRedirect("motorManage?msg=toggled");
            } else {
                response.sendRedirect("motorManage?error=toggle_failed");
            }
        } else {
            response.sendRedirect("motorManage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
