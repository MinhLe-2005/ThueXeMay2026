<%-- 
    Document   : sidebar2
    Created on : Jun 29, 2024, 2:00:00 PM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Favicons -->
<!--<link href="staffAssets/img/favicon.png" rel="icon">-->
<!--<link href="staffAssets/img/apple-touch-icon.png" rel="apple-touch-icon">-->
<link rel="website icon" type="png" href="images/logo.png">
<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"><!--
-->        <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"><!--
-->        <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="staffAssets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="staffAssets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="staffAssets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="staffAssets/vendor/simple-datatables/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Template Main CSS File -->
<link href="staffAssets/css/style.css" rel="stylesheet">
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between flex-row-reverse">
        <a href="homeStaff" class="logo d-flex align-items-center" style="text-decoration: none;">
            <div class="brand-logo-container" style="display: flex; align-items: center; gap: 8px;">
                <div class="brand-logo-icon" style="width: 32px; height: 32px; border-radius: 8px; background: linear-gradient(135deg, #1a1816, #2d2a26); display: flex; align-items: center; justify-content: center; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.08); border: 1px solid rgba(181, 147, 73, 0.2);">
                    <span style="font-family: 'Poppins', sans-serif; font-size: 16px; font-weight: 800; color: #b59349; transform: translateY(-0.5px);">S</span>
                </div>
                <div class="brand-logo-text" style="display: flex; flex-direction: column; align-items: flex-start; line-height: 1;">
                    <span class="brand-title" style="font-family: 'Poppins', sans-serif; font-size: 19px; font-weight: 800; letter-spacing: 1.5px; color: #1a1816; text-transform: uppercase; margin: 0; padding: 0;">Smart<span style="color: #b59349;">Ride</span></span>
                    <span class="brand-subtitle" style="font-family: 'Poppins', sans-serif; font-size: 8px; font-weight: 700; letter-spacing: 1px; color: #8e8a83; text-transform: uppercase; margin-top: 1px; padding: 0;">Staff Panel</span>
                </div>
            </div>
        </a>
        <i class="bi bi-list toggle-sidebar-btn" style="margin-left: 10px;"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">
            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    
                    <c:choose>
                        <c:when test="${account.image != null}">
                            <img src="${account.image}" alt="Profile" class="rounded-circle" style="object-fit: cover; cursor: pointer">                           
                        </c:when>
                        <c:otherwise>
                            <img src="images\avarta.jpg" alt="Profile" class="rounded-circle" style="object-fit: cover; cursor: pointer">                           
                        </c:otherwise>
                    </c:choose>
                        
                    <span class="d-none d-md-block dropdown-toggle ps-2">${account.lastName}</span>
                </a><!-- End Profile Image Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>${account.firstName} ${account.lastName}</h6>
                        <span>${account.userName}</span>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="profileStaff.jsp">
                            <i class="bi bi-person"></i>
                            <span>Thông tin cá nhân</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="logout">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Đăng xuất</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header><!-- End Header -->


<script src="staffAssets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="staffAssets/vendor/chart.js/chart.umd.js"></script>
<script src="staffAssets/vendor/echarts/echarts.min.js"></script>
<script src="staffAssets/vendor/quill/quill.js"></script>
<script src="staffAssets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="staffAssets/vendor/tinymce/tinymce.min.js"></script>
<script src="staffAssets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="staffAssets/js/main.js"></script>
