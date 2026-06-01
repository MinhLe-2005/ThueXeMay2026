<%@ page import="com.smartride.dao.TouristLocationDAO" %>
<%@ page import="com.smartride.dto.TouristLocation" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TouristLocationDAO dao = TouristLocationDAO.getInstance();
    List<TouristLocation> list = dao.getAllTouristLocation();
    boolean found = false;
    for (TouristLocation loc : list) {
        if (loc.getLocationName().contains("Bà Nà") || loc.getLocationName().contains("Ba Na")) {
            loc.setLocationImage("bana_hills.png");
            dao.updateTouristLocation(loc);
            out.println("<h2>Updated successfully: " + loc.getLocationName() + " to use bana_hills.png</h2>");
            found = true;
        }
    }
    if (!found) {
        out.println("<h2>Ba Na Hills not found in the database.</h2>");
    }
%>
