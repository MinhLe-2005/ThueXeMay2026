<%-- 
    Document   : sidebar2
    Created on : Jun 29, 2024, 2:00:00 PM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <!-- Brand Logo Area -->
    <div class="sidebar-brand">
        <a href="homeStaff" style="text-decoration: none; display: flex; flex-direction: column; align-items: center; padding: 32px 10px 24px 10px;">
            <img src="${pageContext.request.contextPath}/images/newlogo_transparent.png" alt="SmartRide" style="height: 36px; width: auto; margin-bottom: 12px; object-fit: contain; opacity: 0.9;" />
            <span style="font-family: 'Playfair Display', serif; font-size: 20px; font-weight: 700; color: #C09D62; letter-spacing: 2px;">SMARTRIDE</span>
            <span style="font-family: 'Inter', sans-serif; font-size: 10px; font-weight: 600; color: rgba(255,255,255,0.3); letter-spacing: 3px; text-transform: uppercase; margin-top: 4px;">Bảng Quản Trị</span>
        </a>
    </div>
    <div style="border-bottom: 1px solid rgba(255,255,255,0.05); margin: 0 20px 20px 20px;"></div>

    <% 
        String currentPage = request.getRequestURI();
        request.setAttribute("currentPage", currentPage);
    %>

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link ${currentPage.contains('/homeStaff.jsp') ? '' : 'collapsed'}" href="homeStaff">
                <i class="bi bi-grid"></i>
                <span>Tổng quan</span>
            </a>
        </li>
        
        <c:if test="${account.roleID  == 3}">
             <li class="nav-item">
                <a class="nav-link ${currentPage.contains('/manageStaff') ? '' : 'collapsed'}" href="manageStaff">
                    <i class="bi bi-people"></i>
                    <span>Quản lý nhân viên</span>
                </a>
            </li>
        </c:if>

        <li class="nav-item">
            <a class="nav-link ${currentPage.contains('/manageCustomer') ? '' : 'collapsed'}" href="manageCustomer">
                <i class="bi bi-person-lines-fill"></i>
                <span>Quản lý khách hàng</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-bicycle"></i><span>Quản lý Xe Máy</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content " data-bs-parent="#sidebar-nav">
                <li>
                    <a style="cursor: pointer" onclick="CallSideBar('motorManage')">
                        <span>Thông tin xe máy</span>
                    </a>
                </li>
                <li>
                    <a href="manageBooking">
                        <span>Quản lí thuê xe</span>
                    </a>
                </li>
                <li>
                    <a style="cursor: pointer" onclick="CallSideBar('pricingManage')">
                        <span>Quản lí bảng giá</span>
                    </a>
                </li>
                 <li>
                    <a style="cursor: pointer" onclick="CallSideBar('accessoriesStaffServlet')" >
                        <span>Quản lí phụ kiện</span>
                    </a>
                </li>
            </ul>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-box"></i><span>Dịch vụ khác</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a style="cursor: pointer" onclick="CallSideBar('feedbackManage')">
                        <span>Quản lí Đánh giá</span>
                    </a>
                </li>
                <li>
                    <a style="cursor: pointer" onclick="CallSideBar('eventStaffServlet')">
                        <span>Quản lí sự kiện</span>
                    </a>
                </li>
                <li>
                    <a style="cursor: pointer" onclick="CallSideBar('TourismLocationServletStaff')" >
                        <span>Quản lí địa điểm du lịch</span>
                    </a>
                </li>
            </ul>
        </li>

        <li class="nav-heading">Trang</li>

        <li class="nav-item">
            <a class="nav-link ${currentPage.contains('/profileStaff.jsp') ? '' : 'collapsed'}" href="profileStaff.jsp">
                <i class="bi bi-person"></i>
                <span>Thông tin cá nhân</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="faqsStaff">
                <i class="bi bi-question-circle"></i>
                <span>F.A.Q</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" onclick="CallSideBar('contactManage')" >
                <i class="bi bi-envelope"></i>
                <span>Liên hệ</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="logout" style="color: #b59349;">
               <i class="bi bi-box-arrow-in-right" style="color: #b59349;"></i>
                <span>Đăng xuất</span>
            </a>
        </li>

    </ul>

</aside><!-- End Sidebar-->

<script>
    function CallSideBar(iframeSrc) {
        var url = "manageSmartRide.jsp?iframeSrc=" + iframeSrc;
        window.location.href = url;
    }
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
