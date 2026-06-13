<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.smartride.dao.CategoryDAO"%>
<%@page import="com.smartride.dto.Category"%>
<%@page import="java.util.List"%>
<%
    List<Category> list = CategoryDAO.getInstance().getAllCategory();
    for(Category c : list) {
        out.println(c.getCategoryID() + " - " + c.getCategoryName() + "<br>");
    }
%>
