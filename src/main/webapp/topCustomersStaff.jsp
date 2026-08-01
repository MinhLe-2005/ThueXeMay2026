<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Top Khách Hàng - Quản Lý</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/newlogo_transparent.png">
    
    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="staffAssets/css/style.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Be Vietnam Pro', sans-serif;
            background-color: #f4f7fc;
        }
        
        .page-header-banner {
            background: linear-gradient(135deg, #012970 0%, #4154f1 100%);
            border-radius: 16px;
            padding: 28px 32px;
            margin-bottom: 24px;
            color: white;
            display: flex;
            align-items: center;
            gap: 16px;
        }
        .page-header-banner .banner-icon {
            width: 64px;
            height: 64px;
            background: rgba(255,255,255,0.15);
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            flex-shrink: 0;
            backdrop-filter: blur(4px);
        }
        .page-header-banner h1 {
            font-size: 1.6rem;
            font-weight: 700;
            margin: 0;
        }
        .page-header-banner p {
            opacity: 0.8;
            margin: 0;
            font-size: 0.9rem;
        }
        
        .vip-card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0, 0, 0, 0.06);
            background: #fff;
            overflow: hidden;
        }

        .medal-icon { font-size: 1.8rem; }
        .medal-1 { color: #FFD700; filter: drop-shadow(0 2px 4px rgba(255,215,0,0.5)); }
        .medal-2 { color: #C0C0C0; filter: drop-shadow(0 2px 4px rgba(192,192,192,0.5)); }
        .medal-3 { color: #CD7F32; filter: drop-shadow(0 2px 4px rgba(205,127,50,0.5)); }
        .medal-other { 
            display: inline-flex;
            width: 36px; height: 36px;
            background: #f0f2f5;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            color: #6c757d;
            font-size: 0.85rem;
            font-weight: 700;
        }

        .table-vip thead th {
            background: linear-gradient(135deg, #012970 0%, #1e3a8a 100%);
            color: rgba(255,255,255,0.85);
            font-weight: 600;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.7px;
            padding: 14px 16px;
            border: none;
        }
        .table-vip tbody tr {
            border-bottom: 1px solid #f0f2f5;
            transition: all 0.2s ease;
        }
        .table-vip tbody tr:hover {
            background-color: #f0f4ff;
            transform: scale(1.003);
            box-shadow: 0 2px 10px rgba(65, 84, 241, 0.1);
        }
        .table-vip tbody td {
            padding: 14px 16px;
            vertical-align: middle;
            border: none;
        }

        .customer-avatar {
            width: 42px; height: 42px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4154f1, #012970);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 1rem;
            flex-shrink: 0;
        }
        .customer-name {
            font-weight: 600;
            color: #012970;
            margin-bottom: 1px;
            font-size: 0.95rem;
        }
        .customer-email {
            font-size: 0.8rem;
            color: #9aa5b4;
        }
        .customer-phone {
            color: #444;
            font-size: 0.9rem;
        }
        .total-spent {
            font-weight: 700;
            color: #198754;
            font-size: 1rem;
        }
        .total-bookings {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 5px 14px;
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
            color: #065f46;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
        }
        .click-hint {
            font-size: 0.78rem;
            color: #9aa5b4;
            display: flex;
            align-items: center;
            gap: 5px;
        }
    </style>
</head>

<body>

    <!-- ======= Header ======= -->
    <jsp:include page="/includes/staff/header-staff.jsp" />
    <jsp:include page="/includes/staff/sidebar.jsp" />
    
    <main id="main" class="main">

        <div class="pagetitle mb-4">
            <h1 class="page-title">Top Khách Hàng VIP</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="homeStaff">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Top Khách Hàng</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section dashboard">
            <div class="row">
                <div class="col-12">

                    <!-- Page Header Banner -->
                    <div class="page-header-banner">
                        <div class="banner-icon">
                            <i class="bi bi-trophy-fill"></i>
                        </div>
                        <div>
                            <h1>Bảng Xếp Hạng Khách Hàng VIP</h1>
                            <p>Top 20 khách hàng có tổng chi tiêu cao nhất &bull; Click vào dòng để xem chi tiết & lịch sử thuê xe</p>
                        </div>
                    </div>

                    <div class="vip-card">
                        <div class="p-3 px-4 border-bottom d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center gap-2">
                                <span class="fw-bold text-dark">Danh sách xếp hạng</span>
                                <span class="badge bg-primary rounded-pill">Top 20</span>
                            </div>
                            <div class="click-hint">
                                <i class="bi bi-cursor-fill"></i>
                                Nhấp vào khách hàng để xem chi tiết
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-vip mb-0">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width: 70px;">Hạng</th>
                                        <th>Khách Hàng</th>
                                        <th>Số Điện Thoại</th>
                                        <th class="text-center">Số Chuyến</th>
                                        <th class="text-end pe-4">Tổng Chi Tiêu</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="customer" items="${topCustomers}" varStatus="status">
                                        <tr style="cursor: pointer;" onclick="window.parent.showCustomerDetails('${customer.CustomerID}', '${customer.FullName}', '${customer.Email}', '${customer.Phone}', '${customer.TotalBookings}', '${customer.TotalSpent}')" title="Xem chi tiết ${customer.FullName}">
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${status.count == 1}">
                                                        <i class="bi bi-trophy-fill medal-icon medal-1"></i>
                                                    </c:when>
                                                    <c:when test="${status.count == 2}">
                                                        <i class="bi bi-trophy-fill medal-icon medal-2"></i>
                                                    </c:when>
                                                    <c:when test="${status.count == 3}">
                                                        <i class="bi bi-trophy-fill medal-icon medal-3"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="medal-other">#${status.count}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center gap-3">
                                                    <div class="customer-avatar">
                                                        <i class="bi bi-person-fill"></i>
                                                    </div>
                                                    <div>
                                                        <p class="customer-name">${customer.FullName}</p>
                                                        <span class="customer-email">${customer.Email}</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="customer-phone">
                                                <i class="bi bi-telephone me-1 text-muted"></i>
                                                ${customer.Phone}
                                            </td>
                                            <td class="text-center">
                                                <span class="total-bookings">
                                                    <i class="bi bi-bicycle"></i>
                                                    ${customer.TotalBookings} chuyến
                                                </span>
                                            </td>
                                            <td class="text-end pe-4">
                                                <span class="total-spent">
                                                    <fmt:formatNumber value="${customer.TotalSpent}" pattern="#,##0" /> đ
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty topCustomers}">
                                        <tr>
                                            <td colspan="5" class="text-center py-5 text-muted">
                                                <i class="bi bi-inbox fs-1 d-block mb-3 opacity-50"></i>
                                                <p class="fw-semibold">Chưa có dữ liệu khách hàng.</p>
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </section>

    </main><!-- End #main -->

    <!-- Vendor JS Files -->
    <script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="staffAssets/js/main.js"></script>

</body>
</html>

