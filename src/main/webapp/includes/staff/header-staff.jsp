<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${empty param.iframe}">
<!-- Top Loading Bar -->
<jsp:include page="/includes/loading.jsp" />
</c:if>

<!-- Favicons -->
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/newlogo_transparent.png">
<script>
    (function() {
        var link = document.querySelector("link[rel~='icon']");
        if (!link) {
            link = document.createElement('link');
            link.rel = 'icon';
            link.type = 'image/png';
            link.href = '${pageContext.request.contextPath}/images/newlogo_transparent.png';
            document.head.appendChild(link);
        }
    })();
</script>
<!-- Google Fonts: Inter + Playfair Display -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="staffAssets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="staffAssets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="staffAssets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="staffAssets/vendor/simple-datatables/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- Template Main CSS File -->
<link href="staffAssets/css/style.css?v=<%= System.currentTimeMillis() %>" rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty param.iframe}">
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="homeStaff" class="logo d-flex align-items-center d-xl-none" style="text-decoration: none;">
            <img src="${pageContext.request.contextPath}/images/newlogo_transparent.png" alt="SmartRide Logo" style="max-height: 40px; margin-right: 10px;">
            <span class="d-none d-lg-block fw-bold" style="color: #b59349; font-family: 'Playfair Display', serif; font-size: 24px;">SmartRide</span>
        </a>
        <div class="toggle-sidebar-btn d-flex align-items-center justify-content-center" style="cursor: pointer; margin-left: 20px; width: 44px; height: 44px; border-radius: 50%; background: transparent; transition: background-color 0.2s ease;" onmouseover="this.style.backgroundColor='#f1f5f9';" onmouseout="this.style.backgroundColor='transparent';">
            <i class="bi bi-list" style="font-size: 32px; color: #0f172a; line-height: 0; margin-top: 2px;"></i>
        </div>
    </div>

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">
            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    
                    <c:choose>
                        <c:when test="${account.image != null}">
                            <img src="${account.image}" alt="Profile" class="rounded-circle" style="object-fit: cover; cursor: pointer">                           
                        </c:when>
                        <c:otherwise>
                            <img src="images/avarta.jpg" alt="Profile" class="rounded-circle" style="object-fit: cover; cursor: pointer">                           
                        </c:otherwise>
                    </c:choose>
                        
                    <span class="d-none d-md-block dropdown-toggle ps-2">${account.lastName}</span>
                </a><!-- End Profile Image Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>${account.firstName} ${account.lastName}</h6>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="profileStaff.jsp">
                            <i class="bi bi-person"></i>
                            <span>Thông tin cá nhân</span>
                        </a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li style="padding: 0.5rem 1rem; margin-bottom: 0.5rem;">
                        <a class="dropdown-item d-flex align-items-center justify-content-center gap-2" href="logout" style="background-color: #b59349; color: #ffffff !important; font-weight: 600; font-size: 0.875rem; border-radius: 9999px; padding: 0.5rem 1rem; text-align: center; box-shadow: 0 4px 6px -1px rgba(181, 147, 73, 0.2);">
                            <i class="bi bi-box-arrow-right" style="margin: 0; font-size: 1rem;"></i>
                            <span>Đăng xuất</span>
                        </a>
                    </li>
                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->
        </ul>
    </nav><!-- End Icons Navigation -->

</header><!-- End Header -->
</c:if>
