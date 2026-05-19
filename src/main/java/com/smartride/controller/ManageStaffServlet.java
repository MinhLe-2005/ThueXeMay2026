/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.smartride.controller;

import com.smartride.dao.AccountDAO;
import com.smartride.dao.CustomerDAO;
import com.smartride.dto.Account;
import com.smartride.dto.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LeQuangMinh
 */
@WebServlet(name = "ManageStaffServlet", urlPatterns = {"/manageStaff"})
public class ManageStaffServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageStaffServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageStaffServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();

        List<Account> accounts = AccountDAO.getInstance().getListAccountByRoleAndDisable(2, 5);
        int activeCount = 0;
        int disabledCount = 0;
        for (Account account : accounts) {
            if (account.getRoleID() == 2) {
                activeCount++;
            } else if (account.getRoleID() == 5) {
                disabledCount++;
            }
        }

        session.setAttribute("activeCountStaff", activeCount);
        session.setAttribute("disabledCountStaff", disabledCount);
        session.setAttribute("allCountStaff", accounts.size());
        session.setAttribute("accountStaff", accounts);
        request.getRequestDispatcher("manageStaff.jsp").forward(request, response);
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
        HttpSession session = request.getSession();

        String action = request.getParameter("action");

        if ("updateRoleAndGetStatuses".equals(action)) {
            int accountId = Integer.parseInt(request.getParameter("accountId"));
            boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));

            Map<Integer, Integer> updatedStatuses = AccountDAO.getInstance().updateRoleAndGetStatuses(accountId, isActive,2, 5);
            List<Account> accounts = AccountDAO.getInstance().getListAccountByRoleAndDisable(2, 5);

            int activeCount = 0;
            int disabledCount = 0;

            for (Account account : accounts) {
                if (account.getRoleID() == 2) {
                    activeCount++;
                } else if (account.getRoleID() == 5) {
                    disabledCount++;
                }
            }
            session.setAttribute("isActiveStaff", isActive);
            session.setAttribute("updatedStatusesStaff", updatedStatuses);
            session.setAttribute("activeCountStaff", activeCount);
            session.setAttribute("disabledCountStaff", disabledCount);
            session.setAttribute("allCountStaff", accounts.size());
            session.setAttribute("accountStaff", accounts);
            request.getRequestDispatcher("manageStaff.jsp").forward(request, response);

        }
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
