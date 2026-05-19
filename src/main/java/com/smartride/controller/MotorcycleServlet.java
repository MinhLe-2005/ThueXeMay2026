package com.smartride.controller;

import com.smartride.dao.BrandDAO;
import com.smartride.dao.CategoryDAO;
import com.smartride.dao.DemandDAO;
import com.smartride.dao.DemandPriceRangeDAO;
import com.smartride.dao.MotorcycleDAO;
import com.smartride.dao.PriceListDAO;
import com.smartride.dto.Brand;
import com.smartride.dto.Category;
import com.smartride.dto.Demand;
import com.smartride.dto.Motorcycle;
import com.smartride.dto.PriceList;
import com.smartride.dto.SearchCriteria.PriceRange;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LeQuangMinh
 */
@WebServlet(name = "MotorcycleServlet", urlPatterns = {"/motorcycle"})
public class MotorcycleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    MotorcycleDAO motorcycleDAO = MotorcycleDAO.getInstance();
    CategoryDAO categoryDAO = CategoryDAO.getInstance();
    PriceListDAO priceListDAO = PriceListDAO.getInstance();
    BrandDAO brandDAO = BrandDAO.getInstance();
    DemandDAO demandDAO = DemandDAO.getInstance();
    DemandPriceRangeDAO demandPriceRangeDAO = DemandPriceRangeDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        List<Category> categories = categoryDAO.getAllCategory();
        List<PriceList> priceLists = priceListDAO.getAllPriceList();
        List<Brand> brandLists = brandDAO.getAllBrand();
        List<String> listDisplacement = motorcycleDAO.getListDisplacements();
        List<Demand> listDemand = demandDAO.getAllDemand();
        List<PriceRange> listPriceRange = demandPriceRangeDAO.getListDemandPriceRanges();
        
        int total = motorcycleDAO.getTotalMotorcyclesCount();
        int endPage = total / 9;
        if (total % 9 != 0) {
            endPage++;
        }
        
        List<Motorcycle> motorcycles = motorcycleDAO.getPagingMotorcycles(index);

        Map<Integer, String> categoryMap = new HashMap<>();
        for (Category category : categories) {
            categoryMap.put(category.getCategoryID(), category.getCategoryName());
        }

        Map<Integer, Double> priceMap = new HashMap<>();
        for (PriceList p : priceLists) {
            priceMap.put(p.getPriceListId(), p.getDailyPriceForDay());
        }
        
        LinkedHashMap<String, String> listMA = motorcycleDAO.getAllAvailableMotorCycle();
        request.setAttribute("listMA", listMA);

        request.setAttribute("listPriceRange", listPriceRange);
        request.setAttribute("listDisplacement", listDisplacement);
        request.setAttribute("listBrand", brandLists);
        request.setAttribute("listDemand", listDemand);
        request.setAttribute("motorcycles", motorcycles);
        request.setAttribute("categories", categories);
        request.setAttribute("priceLists", priceLists);
        request.setAttribute("categoryMap", categoryMap);
        request.setAttribute("priceMap", priceMap);
        
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("search", "default");
        request.setAttribute("totalMotorcycles", total);

        request.getRequestDispatcher("motorbikes.jsp").forward(request, response);
    }
}
