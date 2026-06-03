package com.smartride.controller;

import com.smartride.dao.MotorcycleDAO;
import com.smartride.dao.PriceListDAO;
import com.smartride.dto.Motorcycle;
import com.smartride.dto.PriceList;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name="PriceListServlet", urlPatterns={"/pricing"})
public class PriceListServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        
        PriceListDAO pd = PriceListDAO.getInstance();
        MotorcycleDAO md = MotorcycleDAO.getInstance();
        
        int total = md.getTotalMotorcyclesCount();
        int endPage = total / 9;
        if (total % 9 != 0) {
            endPage++;
        }
        
        List<Motorcycle> listM = md.getPagingMotorcycles(index);
        List<PriceList> listP = pd.getAllPriceList();
        
        request.setAttribute("listP", listP);
        request.setAttribute("listM", listM);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        
        request.getRequestDispatcher("pricing.jsp").forward(request, response);
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
