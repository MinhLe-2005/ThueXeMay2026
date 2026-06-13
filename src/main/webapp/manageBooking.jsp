<%@page import="com.smartride.dao.AccountDAO"%>
<%@page import="com.smartride.dto.Account"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
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
            /* === FORCE LAYOUT FIX === */
            #main {
                margin-left: 280px !important;
                margin-top: 56px !important;
                padding: 24px 28px !important;
                min-height: calc(100vh - 56px) !important;
                transition: all 0.3s !important;
            }
            
            @media (max-width: 1199px) {
                #main {
                    margin-left: 0 !important;
                }
            }
            
            body.toggle-sidebar #main {
                margin-left: 0 !important;
            }
            
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
                                                        <th scope="col">Trạng thái giao</th>
                                                        <th scope="col">Giá</th>
                                                        <th scope="col">Thao tác</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.bookings}" var="listB">
                                                    <%
                                                        com.smartride.dto.Booking b = (com.smartride.dto.Booking) pageContext.getAttribute("listB");
                                                        com.smartride.dto.Account acc = com.smartride.dao.AccountDAO.getInstance().getAccountbyCustomerId(b.getCustomerID());
                                                        pageContext.setAttribute("acc", acc);
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
                                                                            data-customerId="searchCustomer?id=${listB.customerID}"
                                                                            data-cusId="${listB.customerID}"
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
                                            <div style="margin-bottom: 0px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-truck text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Trạng thái giao xe:</span>
                                                <span id="modal-deliveryStatus"></span>
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
                                        <div class="text-center">
                                            <button class="btn btn-success w-100 py-3" disabled style="font-weight: 700; border-radius: 8px; color: #065f46; background-color: #d1fae5; border: 1px solid #6ee7b7; cursor: not-allowed; opacity: 1; box-shadow: 0 4px 6px -1px rgba(16, 185, 129, 0.1);">
                                                <i class="fas fa-check-double me-2"></i> Đã xác nhận đơn hàng
                                            </button>
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
                    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
                        <div class="modal-content" style="border-radius: 12px; border: none; box-shadow: 0 10px 25px rgba(0,0,0,0.1);">
                            <div style="padding: 16px 20px; border-bottom: 1px solid #e2e8f0;" class="modal-header d-flex align-items-center justify-content-between bg-white">
                                <h5 class="modal-title" style="font-weight: 800; color: #1e293b; font-size: 16px; margin: 0;">Thông tin Khách hàng</h5>
                                <button type="button" class="close" onclick="$('#customer-info-modal').modal('hide')" style="background: transparent; border: none; font-size: 20px; color: #94a3b8;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div style="padding: 24px;" class="modal-body bg-light">
                                <div style="margin-bottom: 12px;"><strong style="color: #64748b; font-weight: 600;">Họ tên:</strong> <span id="cinfo-name" style="color: #0f172a; font-weight: 600;"></span></div>
                                <div style="margin-bottom: 12px;"><strong style="color: #64748b; font-weight: 600;">Điện thoại:</strong> <span id="cinfo-phone" style="color: #0f172a; font-weight: 600;"></span></div>
                                <div style="margin-bottom: 0px;"><strong style="color: #64748b; font-weight: 600;">Email:</strong> <span id="cinfo-email" style="color: #0f172a; font-weight: 600;"></span></div>
                            </div>
                        </div>
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
            modal.find('#modal-cusId').text(button.getAttribute('data-cusId'));
            var statusBooking = modal.find('#modal-statusBooking').text().trim();
            if (statusBooking === 'Chờ xác nhận') {
                $('#confirmwait').show();
                $('#confirmyes').hide();

            } else {
                $('#confirmwait').hide();
                $('#confirmyes').show();
            }

            modal.modal('show');
        }
        
        function openCustomerModal() {
            var cusName = $('#modal-customerId').attr('data-cusName');
            var cusPhone = $('#modal-customerId').attr('data-cusPhone');
            var cusEmail = $('#modal-customerId').attr('data-cusEmail');
            $('#cinfo-name').text(cusName);
            $('#cinfo-phone').text(cusPhone);
            $('#cinfo-email').text(cusEmail);
            $('#customer-info-modal').modal('show');
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
