<%-- 
    Document   : sidebar2
    Created on : Jun 29, 2024, 2:00:00 PM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Favicons -->
<link href="staffAssets/img/favicon.png" rel="icon">
<link href="staffAssets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

<!-- Vendor CSS Files -->
<!-- <link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
-->        <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"><!--
        <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="staffAssets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="staffAssets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="staffAssets/vendor/simple-datatables/style.css" rel="stylesheet">-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    .custom-icon:before {
        content: "\f444"; /* Mã Unicode của biểu tượng */
        font-family: "Font Awesome 5 Free";
        font-weight: 900; /* Dùng font-weight 900 cho các biểu tượng Solid */
        display: inline-block;
        font-family: bootstrap-icons !important;
        font-style: normal;
        font-weight: normal !important;
        font-variant: normal;
        text-transform: none;
        line-height: 1;
        vertical-align: -.125em;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale
    }

</style>
<!-- Template Main CSS File -->
<link href="staffAssets/css/style.css" rel="stylesheet">
<!-- ======= Sidebar ======= -->

<aside style="width: 260px" id="sidebar" class="sidebar">
    <% 
        String currentPage = request.getRequestURI();
        request.setAttribute("currentPage", currentPage);
    %>

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">

            <a class="nav-link ${currentPage.contains('/homeStaff.jsp') ? '' : 'collapsed'}" href="homeStaff">
                <i class="bi bi-grid"></i>
                <span>Trang chủ</span>
            </a>
        </li><!-- End Dashboard Nav -->
        
        <c:if test="${account.roleID  == 3}">
             <li class="nav-item">
                <a class="nav-link ${currentPage.contains('/manageStaff') ? '' : 'collapsed'}" href="manageStaff">
                    <i class="bi bi-grid"></i>
                    <span>Quản lý nhân viên</span>
                </a>
            </li><!-- End Dashboard Nav -->          
        </c:if>
        <li class="nav-item">
            <a class="nav-link ${currentPage.contains('/manageCustomer') ? '' : 'collapsed'}" href="manageCustomer">
                <i class="bi bi-grid"></i>
                <span>Quản lý khách hàng</span>
            </a>
        </li><!-- End Dashboard Nav -->



        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-journal-text"></i><span>Xe Máy</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content " data-bs-parent="#sidebar-nav">
                <li>
                    <a style="cursor: pointer" onclick="CallSideBar('motorManage')">
                        <i class="bi bi-circle"></i><span>Thông tin xe máy</span>
                    </a>
                </li>
                <li>
                    <a href="manageBooking">
                        <i class="bi bi-circle"></i><span>Quản lí thuê xe</span>
                    </a>
                </li>
                <li>
                    <a style="cursor: pointer" onclick="CallSideBar('pricingManage')">
                        <i class="bi bi-circle"></i><span>Quản lí bảng giá</span>
                    </a>
                </li>
                 <li>
                    <a style="cursor: pointer" onclick="CallSideBar('accessoriesStaffServlet')" >
                        <i class="bi bi-circle"></i><span>Quản lí phụ kiện</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Forms Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>Dịch vụ</span><i
                    class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a style="cursor: pointer" onclick="CallSideBar('feedbackManage')">
                        <i class="bi bi-circle"></i><span>Quản lí Đánh giá</span>
                    </a>
                </li>
                <li>
                    <a style="cursor: pointer" onclick="CallSideBar('eventStaffServlet')">
                        <i class="bi bi-circle"></i><span>Quản lí sự kiện</span>
                    </a>
                </li>
                <li>

                    <a style="cursor: pointer" onclick="CallSideBar('TourismLocationServletStaff')" >
                        <i class="bi bi-circle"></i><span>Quản lí địa điểm du lịch</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Tables Nav -->

        <li class="nav-heading">Pages</li>

        <li class="nav-item">

            <a class="nav-link ${currentPage.contains('/profileStaff.jsp') ? '' : 'collapsed'}" href="profileStaff.jsp">
                <i class="bi bi-person"></i>
                <span>Thông tin cá nhân</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="faqsStaff">
                <i class="bi bi-question-circle"></i>
                <span>F.A.Q</span>
            </a>
        </li><!-- End F.A.Q Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" onclick="CallSideBar('contactManage')" >
                <i class="bi bi-envelope"></i>
                <span>Liên hệ</span>
            </a>
        </li><!-- End Contact Page Nav -->


        <li class="nav-item">

            <a class="nav-link collapsed" href="logout">
               <i class="bi bi-box-arrow-in-right"></i>
                <span>Đăng xuất</span>
            </a>
        </li><!-- End Login Page Nav -->

    </ul>

</aside><!-- End Sidebar-->
<!-- Vendor JS Files -->
<script src="staffAssets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="staffAssets/vendor/chart.js/chart.umd.js"></script>
<script src="staffAssets/vendor/echarts/echarts.min.js"></script>
<script src="staffAssets/vendor/quill/quill.js"></script>
<script src="staffAssets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="staffAssets/vendor/tinymce/tinymce.min.js"></script>
<script src="staffAssets/vendor/php-email-form/validate.js"></script>

<script>
                        function CallSideBar(iframeSrc) {
                            var url = "manageColorBike.jsp?iframeSrc=" + iframeSrc;

                            // Chuyển hướng đến URL mới
                            window.location.href = url;
                        }
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Template Main JS File -->
<script src="staffAssets/js/main.js"></script>
