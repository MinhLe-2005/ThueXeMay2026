<%@page import="com.smartride.dao.AccountDAO"%>
<%@page import="com.smartride.dto.Account"%>
<%@page import="com.smartride.dao.CustomerDAO"%>
<%@page import="com.smartride.dto.Customer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/newlogo_transparent.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý thuê xe</title>

        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <!-- Font Awesome 6 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            
            /* Custom styles - chỉ giữ lại những gì cần override */
            .booking-item {
                transition: transform 0.3s;
            }

            .booking-item:hover {
                transform: scale(1.05);
            }

            .info label {
                font-style: italic;
                font-weight: 500;
            }

            .close:hover {
                opacity: 0.8;
                background: lightgray;
            }

            .fa-toggle-on:before {
                color: blue;
            }

            .nav-link {
                cursor: pointer;
            }

            .custom-control-label {
                cursor: pointer;
            }
            
            /* Fix badge alignment */
            .badge {
                font-size: 0.7rem;
                padding: 0.25em 0.6em;
                font-weight: 600;
            }

            /* --- Premium Underline Tabs --- */
            .nav-tabs {
                border-bottom: 2px solid #e2e8f0 !important;
                gap: 0;
                margin-bottom: 25px;
                margin-top: 10px;
                display: flex;
                background: transparent;
                padding: 0;
            }
            .nav-tabs li {
                float: none !important;
                margin-bottom: -2px; 
                margin-right: 30px;
            }
            .nav-tabs li a {
                border: none !important;
                background: transparent !important;
                color: #64748b !important;
                border-radius: 0 !important;
                padding: 12px 5px !important;
                font-weight: 700 !important;
                transition: all 0.3s !important;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                font-size: 14px;
                box-shadow: none !important;
                border-bottom: 3px solid transparent !important;
            }
            .nav-tabs li a:hover {
                color: #0f172a !important;
                background: transparent !important;
                border-bottom: 3px solid #cbd5e1 !important;
            }
            .nav-tabs li a.active,
            .nav-tabs li a.active:focus,
            .nav-tabs li a.active:hover {
                background: transparent !important;
                color: #b59349 !important;
                border-bottom: 3px solid #b59349 !important;
                box-shadow: none !important;
            }

            /* --- Premium Table Styles --- */
            .e-panel.card {
                border-radius: 16px;
                box-shadow: 0 4px 25px rgba(0, 0, 0, 0.04);
                border: none;
                background: #ffffff;
            }
            .table-responsive {
                border-radius: 8px !important;
                border: 1px solid #e2e8f0 !important;
            }
            .table {
                margin-bottom: 0;
            }
            .table thead th {
                background: #f8fafc !important; 
                color: #1e293b !important; 
                font-size: 0.85rem !important;
                font-weight: 800 !important;
                text-transform: uppercase !important;
                letter-spacing: 0.5px !important;
                border: none !important; 
                border-bottom: 2px solid #cbd5e1 !important;
                border-right: 1px solid #e2e8f0 !important;
                padding: 16px 16px !important;
                text-align: center;
                vertical-align: middle;
                white-space: nowrap; 
            }
            .table thead th:last-child {
                border-right: none !important;
            }
            .table tbody td, .table tbody th {
                background: transparent;
                vertical-align: middle;
                border: none !important;
                border-bottom: 1px solid #cbd5e1 !important; 
                border-right: 1px solid #cbd5e1 !important;
                padding: 14px 16px !important; 
                color: #1e293b; 
                font-weight: 500;
                font-size: 14px;
                text-align: center;
                transition: background-color 0.2s ease;
                white-space: nowrap;
            }
            .table tbody td:last-child, .table tbody th:last-child {
                border-right: none !important;
            }
            .table tbody tr:last-child td, .table tbody tr:last-child th {
                border-bottom: none !important;
            }
            .table tbody tr:hover td, .table tbody tr:hover th {
                background: #f8f9fa !important;
            }
            .table-bordered {
                border: none !important;
            }
            .btn {
                border-radius: 8px;
                padding: 6px 12px;
                font-weight: 600;
                font-size: 13px;
                transition: all 0.2s ease;
                display: inline-flex;
                align-items: center;
                justify-content: center;
            }
            .modal {
                font-family: 'Inter', 'Segoe UI', sans-serif;
            }
            .form-select {
                border-radius: 8px;
                border: 1px solid #e2e8f0;
                font-size: 13px;
                font-weight: 500;
                color: #475569;
                padding: 6px 30px 6px 12px;
                box-shadow: none;
            }
            .form-select option {
                background-color: #ffffff !important;
                color: #1e293b !important;
                font-weight: 500;
            }
            .form-select:disabled {
                background-color: #f8fafc;
                border-color: transparent;
                color: #64748b;
                font-weight: 600;
                text-align: center;
                padding: 6px 12px;
                appearance: none;
            }
            .btn-success {
                background: #ecfdf5 !important;
                color: #059669 !important;
                border: 1px solid #10b981 !important;
                box-shadow: none !important;
            }
            .btn-success:hover:not(:disabled) {
                background: #d1fae5 !important;
            }
            .btn-warning {
                background: #fffbeb !important;
                color: #d97706 !important;
                border: 1px solid #fbbf24 !important;
                box-shadow: none !important;
            }
            .btn-warning:hover:not(:disabled) {
                background: #fef3c7 !important;
            }
            .btn-primary {
                background: #eff6ff !important;
                color: #2563eb !important;
                border: 1px solid #3b82f6 !important;
                box-shadow: none !important;
            }
            .btn-primary:hover:not(:disabled) {
                background: #dbeafe !important;
            }
            .btn-info {
                background: #f8fafc !important;
                color: #0f172a !important;
                border: 1px solid #cbd5e1 !important;
                box-shadow: none !important;
            }
            .btn-info:hover:not(:disabled) {
                background: #e2e8f0 !important;
            }

            .status-returned {
                background-color: #ecfdf5 !important; 
                color: #059669 !important;
                border: 1px solid #10b981 !important;
                font-weight: 600;
            }
            .status-delivered {
                background-color: #eff6ff !important; 
                color: #2563eb !important;
                border: 1px solid #3b82f6 !important;
                font-weight: 600;
            }
            .status-pending {
                background-color: #fffbeb !important; 
                color: #d97706 !important;
                border: 1px solid #fbbf24 !important;
                font-weight: 600;
            }
            .status-empty {
                background-color: #f8fafc !important;
                color: #64748b !important;
                border: 1px solid #e2e8f0 !important;
                font-weight: 600;
            }
        </style>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".sidebar-link").forEach(function (sidebarLink) {
                    sidebarLink.addEventListener("click", function () {
                        var targetTab = sidebarLink.getAttribute("data-target-tab");
                        document.querySelector(targetTab).click();
                    });
                });

                // Add event listeners for radio buttons
                document.querySelectorAll(".custom-control-input").forEach(function (radio) {
                    radio.addEventListener("change", function () {
                        var value = radio.value;
                        document.querySelector('[data-target-tab="#tab-' + value + '"]').click();
                    });
                });
            });
        </script>
    </head>

    <body>
        <jsp:include page="/includes/staff/header-staff.jsp" />
        <jsp:include page="/includes/staff/sidebar.jsp" />
        
        <!-- Main Content with proper offset for sidebar -->
        <main id="main" class="main">
            <div class="container-fluid" style="padding: 20px 30px;">
                <div class="pagetitle" style="margin-bottom: 30px;">
                    <h1 style="color: #1a1816; font-weight: 800; font-size: 28px; text-transform: uppercase; margin: 0 0 10px 0; font-family: 'Tahoma', sans-serif;">QUẢN LÝ ĐẶT XE</h1>
                    <nav>
                        <ol class="breadcrumb" style="background: transparent; padding: 0; margin: 0; font-size: 14px;">
                            <li class="breadcrumb-item"><a href="homeStaff" target="_top" style="color: #b59349; text-decoration: none; font-weight: 600;">Trang chủ</a></li>
                            <li class="breadcrumb-item active" style="font-weight: 500; color: #6c757d;">Quản lý đặt xe</li>
                        </ol>
                    </nav>
                </div>
                <div class="row mb-4">
                    <div class="col-md-4">
                        <div class="d-flex align-items-center" style="padding: 20px; background: #ffffff; border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">
                            <div class="d-flex align-items-center justify-content-center" style="width: 54px; height: 54px; background: #e0f2fe; color: #0284c7; border-radius: 14px; font-size: 24px; margin-right: 18px;">
                                <i class="fas fa-clipboard-list"></i>
                            </div>
                            <div>
                                <p style="margin: 0; font-size: 14px; color: #64748b; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Tổng số đơn đặt</p>
                                <h3 style="margin: 5px 0 0 0; font-weight: 800; color: #0f172a; font-size: 26px;">${bookings.size()}</h3>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="d-flex align-items-center" style="padding: 20px; background: #ffffff; border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">
                            <div class="d-flex align-items-center justify-content-center" style="width: 54px; height: 54px; background: #fee2e2; color: #dc2626; border-radius: 14px; font-size: 24px; margin-right: 18px;">
                                <i class="fas fa-times-circle"></i>
                            </div>
                            <div>
                                <p style="margin: 0; font-size: 14px; color: #64748b; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Số đơn bị hủy</p>
                                <h3 style="margin: 5px 0 0 0; font-weight: 800; color: #0f172a; font-size: 26px;">${cancels.size()}</h3>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="d-flex align-items-center" style="padding: 20px; background: #ffffff; border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">
                            <div class="d-flex align-items-center justify-content-center" style="width: 54px; height: 54px; background: #fef3c7; color: #d97706; border-radius: 14px; font-size: 24px; margin-right: 18px;">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div>
                                <p style="margin: 0; font-size: 14px; color: #64748b; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Số đơn gia hạn</p>
                                <h3 style="margin: 5px 0 0 0; font-weight: 800; color: #0f172a; font-size: 26px;">${extend.size()}</h3>
                            </div>
                        </div>
                    </div>
                </div>

            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" id="tab-booking" data-bs-toggle="tab" href="#booking">
                                    <i class="fas fa-clipboard-list me-2"></i>Đặt đơn
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab-cancelling" data-bs-toggle="tab" href="#cancelling">
                                    <i class="fas fa-times-circle me-2"></i>Hủy đơn
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab-extending" data-bs-toggle="tab" href="#extending">
                                    <i class="fas fa-clock me-2"></i>Gia hạn
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content mt-3">
                        <div id="booking" class="tab-pane fade show active">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Ngày đặt</th>
                                                        <th scope="col">Thông tin xe</th>
                                                        <th scope="col">Trạng thái đơn</th>
                                                        <th scope="col">Trạng thái giao</th>
                                                        <th scope="col">Giá</th>
                                                        <th scope="col">Thanh toán</th>
                                                        <th scope="col">Thao tác</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.bookings}" var="listB">
                                                    <%
                                                        com.smartride.dto.Booking b = (com.smartride.dto.Booking) pageContext.getAttribute("listB");
                                                        com.smartride.dto.Account acc = com.smartride.dao.AccountDAO.getInstance().getAccountbyCustomerId(b.getCustomerID());
                                                        pageContext.setAttribute("acc", acc);
                                                        com.smartride.dto.Customer cus = com.smartride.dao.CustomerDAO.getInstance().getCustomerbyID(b.getCustomerID());
                                                        pageContext.setAttribute("cus", cus);
                                                        com.smartride.dto.Payment pay = com.smartride.dao.PaymentDAO.getInstance().getPayMentbyBookingId(b.getBookingID());
                                                        pageContext.setAttribute("pay", pay);
                                                    %>
                                                    <form action="manageBooking" method="post" id="form-update-${listB.bookingID}" class="row">
                                                        <input type="hidden" name="bookingID" value="${listB.bookingID}">
                                                        <tr>
                                                            <th scope="row">${listB.bookingID}</th>
                                                            <td>${listB.bookingDate}</td>
                                                            <td>
                                                                <c:set var="plates" value="${motorcyclePlatesMap[listB.bookingID]}" />
                                                                <c:forEach var="plate" items="${plates}">
                                                                    <div style="font-size: 0.85rem; white-space: normal; text-align: left; line-height: 1.5; font-weight: 500;" class="badge bg-light text-dark border mb-1" title="${plate}">${plate}</div><br>
                                                                </c:forEach>
                                                            </td>
                                                            <td class="text-center align-middle">
                                                                    <c:when test="${listB.statusBooking == 'Đã xác nhận' || listB.statusBooking == 'Đã thanh toán'}">
                                                                        <span class="badge bg-success border"><i class="fas fa-check-circle me-1"></i>${listB.statusBooking}</span>
                                                                    </c:when>
                                                                    <c:when test="${listB.statusBooking == 'Đã hủy'}">
                                                                        <span class="badge bg-danger border"><i class="fas fa-times-circle me-1"></i>${listB.statusBooking}</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="badge bg-warning text-dark border"><i class="fas fa-exclamation-circle me-1"></i>${listB.statusBooking}</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:set var="statusClass" value="${listB.deliveryStatus == 'Đã trả' ? 'status-returned' : (listB.deliveryStatus == 'Đã giao' ? 'status-delivered' : (listB.deliveryStatus == 'Chưa giao' ? 'status-pending' : 'status-empty'))}" />
                                                                <select name="delistatus_${listB.bookingID}" id="status-${listB.bookingID}" class="form-select form-select-sm ${statusClass}" aria-label="Trạng thái" onchange="document.getElementById('form-update-${listB.bookingID}').submit();" style="cursor: pointer;" ${listB.statusBooking == 'Chờ xác nhận' ? 'disabled' : ''}>
                                                                    <c:if test="${listB.statusBooking == 'Chờ xác nhận'}">
                                                                        <option value=""></option>
                                                                    </c:if>
                                                                    <c:if test="${listB.statusBooking != 'Chờ xác nhận'}">
                                                                        <option value="Chưa giao" ${listB.deliveryStatus == 'Chưa giao' ? 'selected' : ''}>Chờ nhận xe</option>
                                                                        <option value="Đã giao" ${listB.deliveryStatus == 'Đã giao' ? 'selected' : ''}>Đang thuê</option>
                                                                        <option value="Đã trả" ${listB.deliveryStatus == 'Đã trả' ? 'selected' : ''}>Đã trả xe</option>
                                                                    </c:if>

                                                                </select>
                                                            </td>                                                       
                                                            <td>
                                                                <c:set var="total" value="0"/>
                                                                <c:forEach items="${listB.listBookingDetails}" var="detail">
                                                                    <c:set var="total" value="${total + detail.totalPrice}"/>
                                                                </c:forEach>
                                                                <fmt:formatNumber value="${total}" type="number" pattern="#,##0" /> VNĐ
                                                            </td>
                                                            <td class="text-center align-middle">
                                                                <c:if test="${empty pay}">
                                                                    <span class="badge bg-warning text-dark border"><i class="fas fa-clock me-1"></i>Chờ TT</span>
                                                                </c:if>
                                                                <c:if test="${not empty pay}">
                                                                    <span class="badge bg-success border"><i class="fas fa-check me-1"></i>Đã TT</span>
                                                                </c:if>
                                                            </td>                                                        
                                                            <td class="text-center align-middle">
                                                                <div class="d-flex align-items-center justify-content-center gap-2">
                                                                    <c:set var="buttonText" value="${listB.statusBooking == 'Chờ xác nhận' ? 'Xác nhận' : 'Xem chi tiết'}" />
                                                                    <c:set var="buttonClass" value="${listB.statusBooking == 'Chờ xác nhận' ? 'btn-primary' : 'btn-info'}" />
                                                                    <c:set var="buttonIcon" value="${listB.statusBooking == 'Chờ xác nhận' ? 'fa-check' : 'fa-info-circle'}" />
                                                                    <button class="btn btn-sm ${buttonClass}" type="button"
                                                                            data-toggle="modal" data-target="#user-form-modal"
                                                                            data-bookingId="${listB.bookingID}"
                                                                            data-bookingDate="${listB.bookingDate}"
                                                                            data-startDate="${listB.startDate}"
                                                                            data-endDate="${listB.endDate}"
                                                                            data-statusBooking="${listB.statusBooking}"
                                                                            data-deliveryLocation="${listB.deliveryLocation}"
                                                                            data-returnedLocation="${listB.returnedLocation}"
                                                                            data-deliveryStatus="${listB.deliveryStatus}"
                                                                            data-countMotorcycle="${fn:length(listB.listBookingDetails)}"
                                                                            data-nameMotorcycle=" 
                                                                            <c:set var="plates" value="${motorcyclePlatesMap[listB.bookingID]}" />
                                                                            <c:forEach var="plate" items="${plates}" varStatus="loop">
                                                                                <span class='badge bg-light text-dark border'>${plate}</span>
                                                                                <c:if test="${not loop.last}"> </c:if>
                                                                            </c:forEach>"
                                                                            data-Price="
                                                                            <c:set var="total" value="0"/>
                                                                            <c:forEach items="${listB.listBookingDetails}" var="detail">
                                                                                <c:set var="total" value="${total + detail.totalPrice}"/>
                                                                            </c:forEach>
                                                                            <fmt:formatNumber value="${total}" type="number" pattern="#,##0" /> VNĐ"
                                                                            data-cusName="${acc.lastName} ${acc.firstName}"
                                                                            data-cusPhone="${acc.phoneNumber}"
                                                                            data-cusEmail="${acc.email}"
                                                                            data-cusIdCard="${cus.identityCardImage}"
                                                                            data-identityCard="${cus.identityCard}"
                                                                            data-issuedOn="${cus.issuedOnDate}"
                                                                            data-expDate="${cus.expDate}"
                                                                            data-typeCard="${cus.typeCard}"
                                                                            data-customerId="searchCustomer?id=${listB.customerID}"
                                                                            data-cusId="${listB.customerID}"
                                                                            data-paymentStatus="${pay != null ? pay.paymentStatus : ''}"
                                                                            data-paymentMethod="${pay != null ? pay.paymentMethod : ''}"
                                                                            data-paymentAmount="${pay != null ? pay.paymentAmount : '0'}"
                                                                            onclick="openUserModal(this)">
                                                                        <i class="fas ${buttonIcon} me-1"></i>${buttonText}
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </form>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="cancelling" class="tab-pane fade">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Mã đơn</th>
                                                        <th scope="col">Ngày hủy đơn</th>
                                                        <th scope="col">Ghi chú (Lý do)</th>
                                                        <th scope="col">Thao tác</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.cancels}" var="listC">
                                                        <tr>
                                                            <c:set var="buttonText" value="${empty listC.staffID ? 'Xác nhận' : 'Đã xác nhận'}" />
                                                            <th scope="row">${listC.cancellationID}</th>
                                                            <td>${listC.bookingID}</td>
                                                            <td>${listC.cancellationDate}</td>
                                                            <td>${listC.note}</td>
                                                            <td>
                                                                <c:if test="${buttonText == 'Đã xác nhận'}">
                                                                    <button disabled class="btn btn-sm btn-success w-100">
                                                                        <i class="fas fa-check-double me-1"></i>${buttonText}
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${buttonText == 'Xác nhận'}">
                                                                    <button type="button" class="btn btn-sm btn-primary w-100" 
                                                                            onclick="showConfirmModal('${listC.bookingID}')">
                                                                        <i class="fas fa-check me-1"></i>${buttonText}
                                                                    </button>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="extending" class="tab-pane fade">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Mã đơn</th>
                                                        <th scope="col">Ngày gia hạn</th>
                                                        <th scope="col">Ngày hạn trước</th>
                                                        <th scope="col">Ngày hạn mới</th>
                                                        <th scope="col">Phí gia hạn</th>
                                                        <th scope="col">Thao tác</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.extend}" var="extend">
                                                        <tr>
                                                            <c:set var="buttonText" value="${empty extend.staffID ? 'Xác nhận' : 'Đã xác nhận'}" />
                                                            <th scope="row">${extend.extensionID}</th>
                                                            <td>${extend.bookingID}</td>
                                                            <td>${extend.extensionDate}</td>
                                                            <td>${extend.previousEndDate}</td>
                                                            <td>${extend.newEndDate}</td>
                                                            <td>
                                                                <fmt:formatNumber value="${extend.extensionFee}" type="number" pattern="#,##0" /> VNĐ
                                                            </td>                        
                                                            <td>
                                                                <c:if test="${buttonText == 'Đã xác nhận'}">
                                                                    <button disabled class="btn btn-sm btn-success w-100">
                                                                        <i class="fas fa-check-double me-1"></i>${buttonText}
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${buttonText == 'Xác nhận'}">
                                                                    <button type="button" class="btn btn-sm btn-primary w-100" 
                                                                            onclick="showConfirmExtendModal('${extend.bookingID}')">
                                                                        <i class="fas fa-check me-1"></i>${buttonText}
                                                                    </button>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


                <!-- modal để hiển thị thông tin chi tiết của đặt đơn-->
                <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content" style="border-radius: 12px; border: none; box-shadow: 0 10px 25px rgba(0,0,0,0.1);">
                            <div style="padding: 20px 24px; border-bottom: 1px solid #e2e8f0; border-top-left-radius: 12px; border-top-right-radius: 12px; background: linear-gradient(135deg, #f8fafc 0%, #ffffff 100%);" class="modal-header d-flex align-items-center justify-content-between">
                                <h5 class="modal-title" id="modal-title" style="font-weight: 800; color: #1e293b; font-size: 18px; margin: 0;">
                                    <i class="fas fa-file-invoice text-primary me-2"></i>Chi tiết Đơn hàng
                                </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeDetail()" style="background: transparent; border: none; font-size: 24px; color: #94a3b8; transition: color 0.2s;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div style="padding: 30px 24px; background: #f8fafc;" class="info modal-body">
                                <div class="container-fluid" id="order-details">
                                    <input type="hidden" id="modal-cusId">
                                    <div class="row" style="background: #ffffff; border-radius: 16px; padding: 24px; border: 1px solid #e2e8f0; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.02); margin-bottom: 24px;">
                                        <div class="col-md-6 border-end">
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-hashtag text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Mã đơn:</span>
                                                <span style="color: #0f172a; font-weight: 700; background: #f1f5f9; padding: 4px 10px; border-radius: 6px; font-family: monospace; letter-spacing: 0.5px;" id="modal-bookingId"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-motorcycle text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Tên các xe:</span>
                                                <span style="color: #0f172a; font-weight: 600;" id="modal-nameMotorcycle"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-clock text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Thời gian đặt xe:</span>
                                                <span style="color: #0f172a; font-weight: 500;" id="modal-bookingDate"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-calendar-check text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Thời gian bắt đầu:</span>
                                                <span style="color: #0f172a; font-weight: 500;" id="modal-startDate"></span>
                                            </div>
                                            <div style="margin-bottom: 0px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-calendar-times text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Thời gian trả xe:</span>
                                                <span style="color: #0f172a; font-weight: 500;" id="modal-endDate"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6 ps-4">
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-cubes text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Số lượng xe:</span>
                                                <span style="color: #0f172a; font-weight: 600; background: #eff6ff; color: #2563eb; padding: 2px 10px; border-radius: 12px;" id="modal-countMotorcycle"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-map-marker-alt text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Địa chỉ giao:</span>
                                                <span style="color: #0f172a; font-weight: 500;" id="modal-deliveryLocation"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-map-pin text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Địa chỉ trả:</span>
                                                <span style="color: #0f172a; font-weight: 500;" id="modal-returnedLocation"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-info-circle text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Trạng thái đơn:</span>
                                                <span id="modal-statusBooking"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-truck text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Trạng thái giao xe:</span>
                                                <span id="modal-deliveryStatus"></span>
                                            </div>
                                            <div style="margin-bottom: 0; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-credit-card me-2" style="color:#94a3b8; width: 16px;"></i>Thanh toán:</span>
                                                <span id="modal-paymentInfo" style="font-weight: 600;"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <div class="p-3 bg-white border" style="border-radius: 16px; cursor: pointer; transition: all 0.2s;" onclick="openCustomerModal()" onmouseover="this.style.borderColor='#3b82f6'; this.style.boxShadow='0 4px 6px -1px rgba(59, 130, 246, 0.1)'" onmouseout="this.style.borderColor='#e2e8f0'; this.style.boxShadow='none'" id="modal-customerId">
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <div class="d-flex align-items-center">
                                                        <div class="rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 48px; height: 48px; background: #eff6ff; color: #3b82f6; font-size: 20px;">
                                                            <i class="fas fa-user"></i>
                                                        </div>
                                                        <div>
                                                            <h6 class="mb-1 fw-bold text-dark" style="font-size: 15px;">Thông tin khách hàng</h6>
                                                            <div style="font-size: 13px; color: #64748b;">Nhấn để xem chi tiết liên hệ</div>
                                                        </div>
                                                    </div>
                                                    <i class="fas fa-chevron-right" style="color: #94a3b8;"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="d-flex align-items-center justify-content-between p-3" style="background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%); border-radius: 16px; border: 1px solid #e2e8f0;">
                                                <div class="d-flex align-items-center">
                                                    <div class="rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 48px; height: 48px; background: #fef3c7; color: #d97706; font-size: 20px;">
                                                        <i class="fas fa-wallet"></i>
                                                    </div>
                                                    <div>
                                                        <div style="font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 2px;">Tổng thanh toán</div>
                                                        <h4 style="color: #b45309; font-weight: 800; margin: 0; font-size: 24px;" id="modal-Price"></h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- check trạng thái => giao diện -->
                                    <div class="row" id="confirmwait" style="display: none;">
                                        <div class="col-md-6 text-center">
                                            <button type="button" class="btn btn-warning w-100 py-3" style="font-weight: 700; border-radius: 8px; color: #b45309; background-color: #fef3c7; border: 1px solid #fcd34d;" onclick="showError();">
                                                <i class="fas fa-exclamation-triangle me-2"></i> Báo lỗi đơn hàng
                                            </button>
                                        </div>
                                        <div class="col-md-6 text-center">
                                            <button type="button" class="btn btn-primary w-100 py-3" style="font-weight: 700; border-radius: 8px; color: #1e40af; background-color: #dbeafe; border: 1px solid #93c5fd;" onclick="showConfirmStep()">
                                                <i class="fas fa-check-circle me-2"></i> Xác nhận đơn hàng
                                            </button>
                                        </div>
                                    </div>

                                    <!-- Xác nhận rồi -->
                                    <div id="confirmyes" style="display: none;">
                                        <div class="row g-2">
                                            <div class="col-12" id="approveInvoiceArea" style="display: none;">
                                                <button type="button" class="btn btn-warning w-100 py-3" style="font-weight: 700; border-radius: 8px; color: #92400e; background-color: #fef3c7; border: 1px solid #fcd34d;" onclick="showApproveInvoiceModal()">
                                                    <i class="fas fa-file-invoice-dollar me-2"></i> Duyệt hóa đơn
                                                </button>
                                            </div>
                                            <div class="col-12" id="paidInvoiceArea" style="display: none;">
                                                <button class="btn btn-success w-100 py-3" disabled style="font-weight: 700; border-radius: 8px; color: #065f46; background-color: #d1fae5; border: 1px solid #6ee7b7; cursor: not-allowed; opacity: 1; box-shadow: 0 4px 6px -1px rgba(16, 185, 129, 0.1);">
                                                    <i class="fas fa-check-circle me-2"></i> <span id="paidInvoiceLabel">Đã thanh toán</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                 
                        </div>
                    </div>
                </div>

                <!-- Modal này là để hiển thị xác nhận nka (đặt đơn)-->
                <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                    <div class="modal-dialog" role="document">
                        <form id="confirmForm" action="manageBooking" method="post">
                            <input type="hidden" name="bookingID" id="formConfirmBookingID">
                            <input type="hidden" name="delistatus_bookingID" id="formConfirmDelistatus">

                            <div class="modal-content">
                                <input hidden id="bookingIdbyAcc">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalLabel">Xác nhận</h5>
                                </div>
                                <div class="modal-body" id="confirmModalMessage">
                                    <!-- Message will be set by JavaScript -->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="returnModalStep()">Quay về</button>
                                    <button type="button" id="confirmModalYesButton" class="btn btn-primary">Có</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Modal này là để hiển thị reject đơn hàng của cus (đặt đơn)-->
                <div class="modal fade" id="RejectModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                    <div class="modal-dialog" role="document">
                        <form id="rejectForm" action="manageBooking" method="post">
                            <input type="hidden" name="bookingID" id="formRejectBookingID">
                            <input type="hidden" name ="cusId" id="formRejectCustomerID">
                            <input type="hidden" name="timeBook" id="formRejectTimeBooking">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalLabel">Báo lỗi</h5>
                                </div>

                                <div class="modal-body" id="confirmModalMessage">
                                    <div class="cancellation" id="cancellation-info">
                                        <div class="text-center cancellation-content">
                                            <h2 class="fw-bold ">Xác nhận <span style="color: red; font-weight: bold">Báo Lỗi </span></h2>
                                            <p class="mb-3">Hãy nhập lý do hủy đơn để khách hàng yên tâm hơn nhé ! <br> &hearts; &hearts; &hearts; </p>
                                            <textarea name="cancelreason" rows="4" cols="50" placeholder="Nhập lý do hủy đơn..."></textarea>
                                            <br>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="returnshowError()">Quay về</button>
                                    <button type="button" id="confirmModalCancelButton" class="btn btn-primary" >Gửi</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Modal này là để xác nhận hủy đơn -->
                <div class="modal fade" id="confirmModalCancel" tabindex="-1" role="dialog" aria-labelledby="confirmModalCancelLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <form id="confirmFormCancel" action="manageBooking" method="post">
                            <input type="hidden" id="cancelBookingID" name="cancelBookId">
                            <input type="hidden" id=cancelStaffID" name="staffId">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalCancelLabel">Xác nhận</h5>
                                </div>
                                <div class="modal-body" id="confirmModalCancelMessage">
                                    <!-- Message will be set by JavaScript -->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="closeDetail()">Quay về</button>
                                    <button type="button" id="confirmModalCancelYesButton" class="btn btn-primary">Có</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <!-- Modal này là để xác nhận gia hạn -->
                <div class="modal fade" id="confirmModalExtend" tabindex="-1" role="dialog" aria-labelledby="confirmModalExtendLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <form id="confirmFormExtend" action="manageBooking" method="post">
                            <input type="hidden" id="extendBookingID" name="extendBookId">
                            <input type="hidden" id=extendStaffID" name="staffIdforEx">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalExtendLabel">Xác nhận</h5>
                                </div>
                                <div class="modal-body" id="confirmModalExtendMessage">
                                    <!-- Message will be set by JavaScript -->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="closeDetail()">Quay về</button>
                                    <button type="button" id="confirmModalExtendYesButton" class="btn btn-primary">Có</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Modal thông tin khách hàng -->
                <div class="modal fade" role="dialog" tabindex="-1" id="customer-info-modal">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content" style="border-radius: 16px; border: none; box-shadow: 0 20px 60px rgba(0,0,0,0.15);">
                            <div style="padding: 20px 24px; border-bottom: 1px solid #e2e8f0; background: linear-gradient(135deg, #f8fafc, #fff); border-radius: 16px 16px 0 0;" class="modal-header d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center gap-3">
                                    <h5 class="modal-title" style="font-weight: 800; color: #1e293b; font-size: 18px; margin: 0;">
                                        <i class="fas fa-id-card me-2" style="color: #3b82f6;"></i>Thông tin Khách hàng
                                    </h5>
                                    <span id="ai-badge-status" style="display:none;"></span>
                                </div>
                                <button type="button" class="close" onclick="$('#customer-info-modal').modal('hide')" style="background: transparent; border: none; font-size: 24px; color: #94a3b8;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div style="padding: 24px;" class="modal-body">
                                <!-- Thông tin cơ bản -->
                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <div style="background: #f8fafc; border-radius: 12px; padding: 16px; border: 1px solid #e2e8f0;">
                                            <div style="font-size: 11px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px;"><i class="fas fa-user me-1"></i>Thông tin liên hệ</div>
                                            <div style="margin-bottom: 10px;"><span style="color:#64748b; font-size:13px;">Họ tên:</span><br><span id="cinfo-name" style="color:#0f172a; font-weight:700; font-size:15px;"></span></div>
                                            <div style="margin-bottom: 10px;"><span style="color:#64748b; font-size:13px;">Điện thoại:</span><br><span id="cinfo-phone" style="color:#0f172a; font-weight:600;"></span></div>
                                            <div><span style="color:#64748b; font-size:13px;">Email:</span><br><span id="cinfo-email" style="color:#0f172a; font-weight:600; word-break:break-all;"></span></div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div style="background: #f8fafc; border-radius: 12px; padding: 16px; border: 1px solid #e2e8f0;">
                                            <div style="font-size: 11px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px;"><i class="fas fa-id-card me-1"></i>Giấy tờ tùy thân</div>
                                            <div style="margin-bottom: 10px;"><span style="color:#64748b; font-size:13px;">Loại giấy tờ:</span><br><span id="cinfo-typeCard" style="color:#0f172a; font-weight:700;"></span></div>
                                            <div style="margin-bottom: 10px;"><span style="color:#64748b; font-size:13px;">Số CCCD/CMND:</span><br><span id="cinfo-idcardno" style="color:#0f172a; font-weight:700; font-size:15px; font-family:monospace; letter-spacing:1px;"></span></div>
                                            <div class="row">
                                                <div class="col-6"><span style="color:#64748b; font-size:13px;">Ngày cấp:</span><br><span id="cinfo-issuedon" style="color:#0f172a; font-weight:600;"></span></div>
                                                <div class="col-6"><span style="color:#64748b; font-size:13px;">Ngày hết hạn:</span><br><span id="cinfo-expdate" style="color:#0f172a; font-weight:600;"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Ảnh CCCD -->
                                <div class="mb-3">
                                    <div style="font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px; display:flex; align-items:center; gap:8px;">
                                        <i class="fas fa-images" style="color:#3b82f6;"></i>Ảnh giấy tờ (click để xem to)
                                    </div>
                                    <div id="cinfo-idcards" style="display: flex; gap: 12px; flex-wrap: wrap;"></div>
                                </div>
                                <!-- Kết quả AI xác thực -->
                                <div id="ai-verify-section">
                                    <div style="border-top: 1px solid #e2e8f0; padding-top: 16px; margin-top: 4px;">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div style="font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 1px; display:flex; align-items:center; gap:6px;">
                                                <i class="fas fa-robot" style="color:#8b5cf6;"></i> Xác thực bằng AI (FPT.AI OCR)
                                            </div>
                                            <button type="button" id="btn-verify-ai" onclick="verifyIdCardAI()" style="background: linear-gradient(135deg, #7c3aed, #4f46e5); color: #fff; border: none; padding: 8px 18px; border-radius: 8px; font-size: 13px; font-weight: 700; cursor: pointer; display:flex; align-items:center; gap:6px; transition: opacity 0.2s;" onmouseover="this.style.opacity='0.85'" onmouseout="this.style.opacity='1'">
                                                <i class="fas fa-magic"></i> Quét CCCD bằng AI
                                            </button>
                                        </div>
                                        <!-- Loading -->
                                        <div id="ai-loading" style="display:none; text-align:center; padding: 20px 0;">
                                            <div style="display:inline-flex; align-items:center; gap:10px; color:#8b5cf6; font-weight:600;">
                                                <svg width="20" height="20" viewBox="0 0 50 50" style="animation: spin 1s linear infinite;"><circle cx="25" cy="25" r="20" fill="none" stroke="#8b5cf6" stroke-width="5" stroke-dasharray="31.4 62.8" stroke-linecap="round"/></svg>
                                                <span>AI đang đọc và phân tích ảnh CCCD...</span>
                                            </div>
                                        </div>
                                        <!-- Result box -->
                                        <div id="ai-result-box" style="display:none; margin-top: 14px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal duyệt hóa đơn thủ công -->
                <div class="modal fade" id="approveInvoiceModal" tabindex="-1" role="dialog" aria-hidden="true" data-bs-backdrop="static">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <form id="approveInvoiceForm" action="manageBooking" method="post">
                            <input type="hidden" name="bookingID" id="approveInvoiceBookingID">
                            <input type="hidden" name="manualPayment" value="true">
                            <div class="modal-content" style="border-radius: 16px; border: none; box-shadow: 0 20px 60px rgba(0,0,0,0.15);">
                                <div class="modal-header" style="background: linear-gradient(135deg, #fef3c7, #fffbeb); border-radius: 16px 16px 0 0; border-bottom: 1px solid #fcd34d; padding: 20px 24px;">
                                    <h5 class="modal-title" style="font-weight: 800; color: #92400e; margin: 0;">
                                        <i class="fas fa-file-invoice-dollar me-2"></i>Duyệt hóa đơn thủ công
                                    </h5>
                                </div>
                                <div class="modal-body" style="padding: 24px;">
                                    <div style="background: #fffbeb; border: 1px solid #fcd34d; border-radius: 12px; padding: 16px; margin-bottom: 16px;">
                                        <div style="font-size: 13px; color: #92400e; margin-bottom: 8px;"><i class="fas fa-exclamation-triangle me-2"></i><strong>Lưu ý:</strong> Chỉ duyệt khi đã <strong>nhận được tiền chuyển khoản</strong> từ khách hàng!</div>
                                        <div style="font-size: 13px; color: #78350f;">Thao tác này sẽ đánh dấu đơn <strong id="approveInvoiceBookingLabel"></strong> là đã thanh toán và không thể hoàn tác.</div>
                                    </div>
                                    <div style="background: #f8fafc; border-radius: 10px; padding: 14px;">
                                        <div style="display:flex; justify-content:space-between; margin-bottom:8px;"><span style="color:#64748b;">Mã đơn hàng:</span><strong id="approveInvoiceBID" style="font-family:monospace;"></strong></div>
                                        <div style="display:flex; justify-content:space-between;"><span style="color:#64748b;">Số tiền:</span><strong id="approveInvoiceAmt" style="color:#b45309;"></strong></div>
                                    </div>
                                </div>
                                <div class="modal-footer" style="border-top: 1px solid #e2e8f0; padding: 16px 24px;">
                                    <button type="button" class="btn btn-secondary" onclick="$('#approveInvoiceModal').modal('hide'); $('#user-form-modal').modal('show');">Quay về</button>
                                    <button type="submit" class="btn btn-warning" style="font-weight: 700; color: #92400e; background: #fbbf24; border: none; padding: 10px 24px; border-radius: 8px;">
                                        <i class="fas fa-check me-2"></i>Xác nhận đã nhận tiền
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </body>
    <script>
        // Toggle sidebar functionality
        document.addEventListener('DOMContentLoaded', function() {
            const toggleBtn = document.querySelector('.toggle-sidebar-btn');
            if (toggleBtn) {
                toggleBtn.addEventListener('click', function() {
                    document.body.classList.toggle('toggle-sidebar');
                });
            }
        });
        
        function openUserModal(button) {
            var modal = $('#user-form-modal');
            modal.find('#modal-bookingId').text(button.getAttribute('data-bookingId'));
            modal.find('#modal-bookingDate').text(button.getAttribute('data-bookingDate'));
            modal.find('#modal-startDate').text(button.getAttribute('data-startDate'));
            modal.find('#modal-endDate').text(button.getAttribute('data-endDate'));
            var sBooking = button.getAttribute('data-statusBooking');
            var dStatus = button.getAttribute('data-deliveryStatus');
            var sBHtml = sBooking === 'Đã xác nhận' ? '<span style="color: #059669; background: #ecfdf5; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #10b981;">' + sBooking + '</span>' : '<span style="color: #d97706; background: #fffbeb; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #fbbf24;">' + sBooking + '</span>';
            var dSHtml = dStatus === 'Đã trả' ? '<span style="color: #059669; background: #ecfdf5; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #10b981;">' + dStatus + '</span>' : (dStatus === 'Đã giao' ? '<span style="color: #2563eb; background: #eff6ff; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #3b82f6;">' + dStatus + '</span>' : '<span style="color: #475569; background: #f1f5f9; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #cbd5e1;">' + dStatus + '</span>');
            
            modal.find('#modal-statusBooking').html(sBHtml);
            modal.find('#modal-deliveryLocation').text(button.getAttribute('data-deliveryLocation'));
            modal.find('#modal-returnedLocation').text(button.getAttribute('data-returnedLocation'));
            modal.find('#modal-deliveryStatus').html(dSHtml);
            modal.find('#modal-countMotorcycle').text(button.getAttribute('data-countMotorcycle'));
            modal.find('#modal-nameMotorcycle').html(button.getAttribute('data-nameMotorcycle'));
            modal.find('#modal-Price').text(button.getAttribute('data-Price'));
            modal.find('#modal-customerId').attr('data-cusName', button.getAttribute('data-cusName'));
            modal.find('#modal-customerId').attr('data-cusPhone', button.getAttribute('data-cusPhone'));
            modal.find('#modal-customerId').attr('data-cusEmail', button.getAttribute('data-cusEmail'));
            modal.find('#modal-customerId').attr('data-cusIdCard', button.getAttribute('data-cusIdCard'));
            modal.find('#modal-customerId').attr('data-identityCard', button.getAttribute('data-identityCard'));
            modal.find('#modal-customerId').attr('data-issuedOn', button.getAttribute('data-issuedOn'));
            modal.find('#modal-customerId').attr('data-expDate', button.getAttribute('data-expDate'));
            modal.find('#modal-customerId').attr('data-typeCard', button.getAttribute('data-typeCard'));
            modal.find('#modal-cusId').text(button.getAttribute('data-cusId'));

            var statusBooking = modal.find('#modal-statusBooking').text().trim();
            var payStatus = button.getAttribute('data-paymentStatus') || '';
            var payMethod = button.getAttribute('data-paymentMethod') || '';
            var payAmt = button.getAttribute('data-paymentAmount') || '0';
            var hasPaid = payStatus !== '' && !payStatus.includes('Chờ');

            // Hiển thị thông tin thanh toán
            if (payStatus === '') {
                $('#modal-paymentInfo').html('<span style="color:#94a3b8; font-style:italic;">Chưa thanh toán</span>');
            } else if (hasPaid) {
                $('#modal-paymentInfo').html('<span style="color:#059669; background:#ecfdf5; padding:2px 10px; border-radius:6px; border:1px solid #10b981;"><i class="fas fa-check-circle me-1"></i>' + payMethod + '</span>');
            } else {
                $('#modal-paymentInfo').html('<span style="color:#d97706; background:#fffbeb; padding:2px 10px; border-radius:6px; border:1px solid #fbbf24;">' + payStatus + '</span>');
            }

            if (statusBooking === 'Chờ xác nhận') {
                $('#confirmwait').show();
                $('#confirmyes').hide();
            } else {
                $('#confirmwait').hide();
                $('#confirmyes').show();
                // Hiển thị nút duyệt hóa đơn nếu chưa thanh toán, ẩn nếu đã thanh toán
                if (hasPaid) {
                    $('#approveInvoiceArea').hide();
                    $('#paidInvoiceArea').show();
                    $('#paidInvoiceLabel').text('Đã thanh toán (' + payMethod + ')');
                } else {
                    $('#approveInvoiceArea').show();
                    $('#paidInvoiceArea').hide();
                }
            }

            modal.modal('show');
        }
        
        function viewImageFull(src) {
            $('#image-viewer-modal-img').attr('src', src);
            $('#image-viewer-modal').modal('show');
        }

        function openCustomerModal() {
            var cusName = $('#modal-customerId').attr('data-cusName');
            var cusPhone = $('#modal-customerId').attr('data-cusPhone');
            var cusEmail = $('#modal-customerId').attr('data-cusEmail');
            var cusIdCard = $('#modal-customerId').attr('data-cusIdCard');
            var identityCard = $('#modal-customerId').attr('data-identityCard') || '';
            var issuedOn = $('#modal-customerId').attr('data-issuedOn') || '';
            var expDate = $('#modal-customerId').attr('data-expDate') || '';
            var typeCard = $('#modal-customerId').attr('data-typeCard') || '';

            $('#cinfo-name').text(cusName);
            $('#cinfo-phone').text(cusPhone);
            $('#cinfo-email').text(cusEmail);
            $('#cinfo-idcardno').text(identityCard || 'Chưa cập nhật');
            $('#cinfo-issuedon').text(issuedOn || 'N/A');
            $('#cinfo-expdate').text(expDate || 'N/A');
            $('#cinfo-typeCard').text(typeCard || 'N/A');

            // Reset AI area khi mở modal mới
            $('#ai-badge-status').hide().html('');
            $('#ai-result-box').hide().html('');
            $('#ai-loading').hide();
            $('#btn-verify-ai').prop('disabled', false).html('<i class="fas fa-magic"></i> Quét CCCD bằng AI');

            // Kiểm tra hạn CCCD
            if (expDate && expDate !== 'N/A') {
                var parts = expDate.split('-');
                if (parts.length === 3) {
                    var expDateObj = new Date(parts[0], parts[1]-1, parts[2]);
                    var today = new Date();
                    if (expDateObj < today) {
                        $('#ai-badge-status').html('<span style="background:#fee2e2; color:#dc2626; border:1px solid #fca5a5; padding:4px 10px; border-radius:20px; font-size:12px; font-weight:700;"><i class="fas fa-exclamation-triangle me-1"></i>CCCD HẾT HẠN</span>').show();
                    }
                }
            }

            // Store cusIdCard globally for AI call
            window._currentCusIdCard = cusIdCard;
            window._currentIdentityCard = identityCard;
            window._currentCusName = cusName;
            
            var idCardHtml = '';
            if (cusIdCard && cusIdCard.trim() !== '') {
                var images = cusIdCard.split(',');
                images.forEach(function(img, i) {
                    if(img.trim() !== '') {
                        var isUrl = img.trim().startsWith('http');
                        var imgSrc = isUrl ? img.trim() : 'upload/' + img.trim();
                        var label = i === 0 ? 'Mặt trước' : 'Mặt sau';
                        idCardHtml += `<div style="flex: 1; min-width: 200px; text-align: center; cursor: pointer; border-radius: 12px; overflow: hidden; border: 2px solid #e2e8f0; background:#f8fafc;" onclick="viewImageFull('${imgSrc}')">
                                           <div style="font-size:11px; font-weight:700; color:#64748b; padding:8px; text-transform:uppercase; letter-spacing:1px;">${label}</div>
                                           <img src="${imgSrc}" style="width: 100%; height: 130px; object-fit: cover; transition: transform 0.2s; display:block;" onmouseover="this.style.transform='scale(1.05)'" onmouseout="this.style.transform='scale(1)'" onerror="this.src=''; this.parentElement.innerHTML='<div style=\'padding:20px; color:#94a3b8; font-size:12px;\'>Không tải được ảnh</div>';">
                                       </div>`;
                    }
                });
            } else {
                idCardHtml = '<div style="width:100%; text-align:center; padding:24px; color: #94a3b8; font-style: italic;"><i class="fas fa-image fa-2x mb-2 d-block"></i>Chưa có ảnh giấy tờ</div>';
            }
            $('#cinfo-idcards').html(idCardHtml);
            
            $('#customer-info-modal').modal('show');
        }

        function verifyIdCardAI() {
            var cusIdCard = window._currentCusIdCard || '';
            var storedId  = window._currentIdentityCard || '';
            var storedName = window._currentCusName || '';

            if (!cusIdCard || cusIdCard.trim() === '') {
                $('#ai-result-box').html('<div style="background:#fff7ed; border:1px solid #fdba74; border-radius:10px; padding:14px; color:#9a3412; font-size:13px;"><i class="fas fa-exclamation-triangle me-2"></i>Không có ảnh CCCD để xác thực.</div>').show();
                return;
            }

            // Lấy ảnh mặt trước
            var firstImg = cusIdCard.split(',')[0].trim();

            // Show loading
            $('#btn-verify-ai').prop('disabled', true).html('<i class="fas fa-spinner fa-spin me-1"></i> Đang xử lý...');
            $('#ai-loading').show();
            $('#ai-result-box').hide().html('');
            $('#ai-badge-status').hide();

            fetch('verifyIdCard', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'imagePath=' + encodeURIComponent(firstImg)
                    + '&storedId=' + encodeURIComponent(storedId)
                    + '&storedName=' + encodeURIComponent(storedName)
            })
            .then(r => r.json())
            .then(data => {
                $('#ai-loading').hide();
                $('#btn-verify-ai').prop('disabled', false).html('<i class="fas fa-magic"></i> Quét CCCD bằng AI');

                if (!data.success) {
                    var needKey = data.needKey;
                    var title = needKey ? 'Chưa cài FPT.AI API Key' : 'Không thể xác thực';
                    var msgHtml = '<div style="background:#fef3c7; border:1px solid #fcd34d; border-radius:10px; padding:16px;">'
                        + '<div style="font-weight:700; color:#92400e; margin-bottom:8px;"><i class="fas ' + (needKey ? 'fa-key' : 'fa-exclamation-triangle') + ' me-2"></i>' + title + '</div>'
                        + '<div style="font-size:13px; color:#78350f;">' + (data.message || 'Lỗi không xác định') + '</div>'
                        + (needKey ? '<div style="margin-top:10px; font-size:12px; color:#92400e;">1. Đăng ký tại <a href="https://console.fpt.ai" target="_blank">console.fpt.ai</a> để lấy API key miễn phí<br>2. Mở file <code>VerifyIdCardServlet.java</code><br>3. Điền key vào biến <code>FPT_API_KEY</code></div>' : '')
                        + '</div>';
                    $('#ai-result-box').html(msgHtml).show();
                    return;
                }

                // Build result UI
                var color = data.statusColor;
                var icon  = data.statusIcon;
                var statusText = data.status;

                // Badge in header — xét cả doeValid
                var allOk = data.idMatch && data.nameMatch && (data.doeValid !== false);
                var anyOk = data.idMatch || data.nameMatch;
                var badgeColor  = allOk ? '#059669' : (anyOk ? '#d97706' : '#dc2626');
                var badgeBg     = allOk ? '#ecfdf5' : (anyOk ? '#fffbeb' : '#fee2e2');
                var badgeBorder = allOk ? '#10b981' : (anyOk ? '#fbbf24' : '#fca5a5');
                var badgeIcon   = allOk ? 'fa-robot' : (data.doeValid === false ? 'fa-calendar-times' : (anyOk ? 'fa-exclamation-circle' : 'fa-times-circle'));
                var badgeText   = allOk ? 'AI: HỢP LỆ' : (data.doeValid === false ? 'AI: CCCD HẾT HẠN' : (anyOk ? 'AI: CẦN KIỂM TRA' : 'AI: KHÔNG KHỚP'));
                $('#ai-badge-status').html('<span style="background:' + badgeBg + '; color:' + badgeColor + '; border:1px solid ' + badgeBorder + '; padding:4px 10px; border-radius:20px; font-size:12px; font-weight:700;"><i class="fas ' + badgeIcon + ' me-1"></i>' + badgeText + '</span>').show();

                // Result box
                var rowStyle = 'display:flex; justify-content:space-between; align-items:center; padding:8px 0; border-bottom:1px solid #f1f5f9;';
                var matchBadge = function(match, dbVal, ocrVal, label) {
                    var icon2 = match ? 'fa-check-circle' : 'fa-times-circle';
                    var c = match ? '#059669' : '#dc2626';
                    var bg = match ? '#f0fdf4' : '#fff5f5';
                    return '<div style="' + rowStyle + ' background:' + bg + '; border-radius:8px; padding:10px; margin-bottom:6px;">'
                        + '<div><span style="color:#64748b; font-size:11px; text-transform:uppercase; letter-spacing:0.5px;">' + label + '</span><br>'
                        + '<span style="color:#0f172a; font-weight:700;">' + (dbVal||'-') + '</span></div>'
                        + '<div style="text-align:right;"><span style="color:#64748b; font-size:11px;">AI đọc được:</span><br>'
                        + '<span style="font-weight:700;">' + (ocrVal||'-') + '</span> <i class="fas ' + icon2 + '" style="color:' + c + '; margin-left:4px;"></i></div>'
                        + '</div>';
                };

                // Hàng kiểm tra hạn CCCD
                var doeOk = data.doeValid !== false;
                var doeBg = doeOk ? '#f0fdf4' : '#fff5f5';
                var doeIcon = doeOk ? 'fa-check-circle' : 'fa-calendar-times';
                var doeColor = doeOk ? '#059669' : '#dc2626';
                var doeLabel = doeOk ? 'Còn hiệu lực' : '⚠ HẾT HẠN';
                var doeRow = '<div style="' + rowStyle + ' background:' + doeBg + '; border-radius:8px; padding:10px; margin-bottom:6px;">'
                    + '<div><span style="color:#64748b; font-size:11px; text-transform:uppercase; letter-spacing:0.5px;">Ngày hết hạn</span><br>'
                    + '<span style="color:#0f172a; font-weight:700;">' + (data.ocrDoe||'N/A') + '</span></div>'
                    + '<div style="text-align:right;"><i class="fas ' + doeIcon + '" style="color:' + doeColor + ';"></i> <span style="color:' + doeColor + '; font-weight:700;">' + doeLabel + '</span></div>'
                    + '</div>';

                // Danh sách lỗi chi tiết
                var fieldErrHtml = '';
                if (data.fieldErrors && data.fieldErrors.length > 0) {
                    fieldErrHtml += '<div style="margin-top:12px;">';
                    fieldErrHtml += '<div style="font-size:11px; font-weight:700; color:#dc2626; text-transform:uppercase; letter-spacing:1px; margin-bottom:8px;"><i class="fas fa-exclamation-triangle me-1"></i>Vấn đề phát hiện</div>';
                    data.fieldErrors.forEach(function(fe) {
                        fieldErrHtml += '<div style="background:#fee2e2; border:1px solid #fca5a5; border-radius:8px; padding:8px 12px; margin-bottom:6px; color:#991b1b; font-size:12px; font-weight:600;">' + fe + '</div>';
                    });
                    fieldErrHtml += '</div>';
                }

                var html = '<div style="border-radius:12px; overflow:hidden; border:2px solid ' + color + '; margin-top:4px;">'
                    + '<div style="background:' + color + '; padding:12px 16px; color:#fff; font-weight:800; font-size:14px; display:flex; align-items:center; gap:8px;">'
                    + '<i class="fas ' + icon + '"></i>' + statusText
                    + '</div>'
                    + '<div style="padding: 14px 16px; background:#fff;">'
                    + '<div style="font-size:11px; font-weight:700; color:#64748b; text-transform:uppercase; letter-spacing:1px; margin-bottom:10px;">So sánh dữ liệu</div>'
                    + matchBadge(data.idMatch, storedId, data.ocrId, 'Số CCCD/CMND')
                    + matchBadge(data.nameMatch, storedName, data.ocrName, 'Họ và tên')
                    + doeRow
                    + fieldErrHtml
                    + '<div style="margin-top:14px; padding:10px; background:#f8fafc; border-radius:8px; font-size:12px;">'
                    + '<div style="font-weight:700; color:#64748b; text-transform:uppercase; letter-spacing:1px; margin-bottom:8px;"><i class="fas fa-robot me-1" style="color:#8b5cf6;"></i>Thông tin AI đọc từ ảnh</div>'
                    + '<div style="display:grid; grid-template-columns:1fr 1fr; gap:6px;">'
                    + '<div><span style="color:#94a3b8;">Ngày sinh:</span><br><strong>' + (data.ocrDob||'N/A') + '</strong></div>'
                    + '<div><span style="color:#94a3b8;">Giới tính:</span><br><strong>' + (data.ocrSex||'N/A') + '</strong></div>'
                    + '<div><span style="color:#94a3b8;">Ngày hết hạn:</span><br><strong>' + (data.ocrDoe||'N/A') + '</strong></div>'
                    + '<div><span style="color:#94a3b8;">Loại CCCD:</span><br><strong>' + (data.type||'N/A') + '</strong></div>'
                    + '</div></div>'
                    + '</div></div>';

                $('#ai-result-box').html(html).show();
            })
            .catch(function(err) {
                $('#ai-loading').hide();
                $('#btn-verify-ai').prop('disabled', false).html('<i class="fas fa-magic"></i> Quét CCCD bằng AI');
                $('#ai-result-box').html('<div style="background:#fee2e2; border:1px solid #fca5a5; border-radius:10px; padding:14px; color:#dc2626; font-size:13px;"><i class="fas fa-times-circle me-2"></i>Lỗi kết nối: ' + err + '</div>').show();
            });
        }

        function showApproveInvoiceModal() {
            var bookingId = $('#modal-bookingId').text().trim();
            var price = $('#modal-Price').text().trim();
            $('#approveInvoiceBookingID').val(bookingId);
            $('#approveInvoiceBookingLabel').text(bookingId);
            $('#approveInvoiceBID').text(bookingId);
            $('#approveInvoiceAmt').text(price);
            $('#user-form-modal').modal('hide');
            $('#approveInvoiceModal').modal('show');
        }

        function closeDetail()
        {
            $('#user-form-modal').modal('hide');
            $('#confirmModalCancel').modal('hide');
            $('#confirmModalExtend').modal('hide');
        }

        function changeType(bookingID, button) {
            var statusSelect = document.getElementById('status-' + bookingID);
            var updateButton = document.getElementById('update-' + bookingID);
            var saveButton = document.getElementById('save-' + bookingID);

            if (button.id === updateButton.id) {
                updateButton.style.display = 'none';
                saveButton.style.display = 'inline';
                statusSelect.disabled = false;
            } else {
                document.getElementById("form-update-" + bookingID).submit();
                saveButton.style.display = 'none';
                updateButton.style.display = 'inline';
                statusSelect.disabled = true;
            }
        }
        function showConfirmStep() {
            var bookingId = $('#modal-bookingId').text().trim();
            var delistatus = 'delistatus_' + bookingId;
            $('#user-form-modal').modal('hide');
            $('#confirmModal').modal('show');
            $('#confirmModalMessage').text("Bạn có chắc chắn xác nhận đơn có mã: " + bookingId + " không?");

            $('#formConfirmBookingID').val(bookingId);
            $('#formConfirmDelistatus').val(delistatus);
        }

        function returnModalStep() {
            $('#user-form-modal').modal('show');
            $('#confirmModal').modal('hide');
        }

        $('#confirmModalYesButton').click(function () {
            alert('Xác nhận thành công');
            $('#confirmForm').submit();
        });

        function showError() {
            var bookingId = $('#modal-bookingId').text().trim();
            var cusID = $('#modal-cusId').text();
            var timeBook = $('#modal-bookingDate').text();

            $('#user-form-modal').modal('hide');
            $('#RejectModal').modal('show');

            $('#formRejectCustomerID').val(cusID);
            $('#formRejectBookingID').val(bookingId);
            $('#formRejectTimeBooking').val(timeBook);
        }

        function returnshowError() {
            $('#user-form-modal').modal('show');
            $('#RejectModal').modal('hide');
        }

        $('#confirmModalCancelButton').click(function () {
            alert('Hủy đơn thành công');
            $('#rejectForm').submit();
        });


        function showConfirmModal(bookingId) {
            $('#confirmModalCancel').modal('show');
            $('#confirmModalCancelMessage').text("Bạn có chắc chắn xác nhận đơn hủy có mã: " + bookingId + " không?");

            $('#cancelBookingID').val(bookingId);
        }
        $('#confirmModalCancelYesButton').click(function () {
            alert('Xác nhận thành công');
            $('#confirmFormCancel').submit();
//            $('#tab-cancelling').tab('show');
        });

        function showConfirmExtendModal(bookingId) {
            $('#confirmModalExtend').modal('show');
            $('#confirmModalExtendMessage').text("Bạn có chắc chắn xác nhận đơn gia hạn có mã: " + bookingId + " không?");

            $('#extendBookingID').val(bookingId);
        }
        $('#confirmModalExtendYesButton').click(function () {
            alert('Xác nhận thành công');
            $('#confirmFormExtend').submit();
        });
    </script>
</html>
