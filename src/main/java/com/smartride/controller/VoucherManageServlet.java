package com.smartride.controller;

import com.smartride.dao.VoucherDAO;
import com.smartride.dao.CustomerDAO;
import com.smartride.dto.Voucher;
import com.smartride.dto.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "VoucherManageServlet", urlPatterns = {"/manageVoucher"})
public class VoucherManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VoucherDAO dao = VoucherDAO.getInstance();
        List<Voucher> vouchers = dao.getAllVouchers();
        
        CustomerDAO customerDAO = CustomerDAO.getInstance();
        List<Customer> customers = customerDAO.getAll();
        
        request.setAttribute("vouchers", vouchers);
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("manageVoucher.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        VoucherDAO dao = VoucherDAO.getInstance();
        
        try {
            if ("add".equals(action)) {
                String code = request.getParameter("code").toUpperCase();
                double discount = Double.parseDouble(request.getParameter("discountAmount"));
                String description = request.getParameter("description");
                String status = "Chưa sử dụng"; // Default
                int customerId = 0;
                String custIdParam = request.getParameter("customerID");
                if (custIdParam != null && !custIdParam.trim().isEmpty()) {
                    customerId = Integer.parseInt(custIdParam);
                }
                
                Voucher v = new Voucher();
                v.setCode(code);
                v.setDiscountAmount(discount);
                v.setDescription(description);
                v.setStatus(status);
                v.setCustomerID(customerId);
                
                dao.insertVoucher(v);
            } else if ("edit".equals(action)) {
                int voucherId = Integer.parseInt(request.getParameter("voucherId"));
                String code = request.getParameter("code").toUpperCase();
                double discount = Double.parseDouble(request.getParameter("discountAmount"));
                String description = request.getParameter("description");
                String status = request.getParameter("status");
                int customerId = 0;
                String custIdParam = request.getParameter("customerID");
                if (custIdParam != null && !custIdParam.trim().isEmpty()) {
                    customerId = Integer.parseInt(custIdParam);
                }
                
                Voucher v = new Voucher();
                v.setVoucherId(voucherId);
                v.setCode(code);
                v.setDiscountAmount(discount);
                v.setDescription(description);
                v.setStatus(status);
                v.setCustomerID(customerId);
                
                dao.updateVoucher(v);
            } else if ("delete".equals(action)) {
                int voucherId = Integer.parseInt(request.getParameter("voucherId"));
                dao.deleteVoucher(voucherId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("manageVoucher");
    }
}
