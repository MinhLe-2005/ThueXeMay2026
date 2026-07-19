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
        <title>Quáº£n lÃ½ thuÃª xe</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
        <!-- Font Awesome 6 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            
            /* Custom styles - chá»‰ giá»¯ láº¡i nhá»¯ng gÃ¬ cáº§n override */
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
                list-style: none !important;
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
            .status-overdue {
                background-color: #fff1f2 !important;
                color: #e11d48 !important;
                border: 1px solid #fda4af !important;
                font-weight: 700;
            }
            .btn-confirm-return {
                background: linear-gradient(135deg, #ef4444, #dc2626) !important;
                color: white !important;
                border: none !important;
                font-size: 12px !important;
                padding: 6px 12px !important;
                border-radius: 8px !important;
                font-weight: 700 !important;
                white-space: nowrap;
                box-shadow: 0 2px 8px rgba(239,68,68,0.3);
                transition: all 0.2s;
            }
            .btn-confirm-return:hover {
                opacity: 0.9;
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(239,68,68,0.4);
            }
            @keyframes pulse-red {
                0%, 100% { box-shadow: 0 0 0 0 rgba(239,68,68,0.4); }
                50% { box-shadow: 0 0 0 8px rgba(239,68,68,0); }
            }
            .badge-overdue {
                animation: pulse-red 2s infinite;
                display: inline-flex;
                align-items: center;
                gap: 4px;
                background: #fff1f2;
                color: #e11d48;
                border: 1px solid #fda4af;
                padding: 3px 8px;
                border-radius: 20px;
                font-size: 11px;
                font-weight: 700;
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
        
        <!-- Main Content with proper offset for sidebar -->
        <div class="container-fluid mt-4">
            <div class="container-fluid" style="padding: 20px 30px;">
                <div class="pagetitle" style="margin-bottom: 30px;">
                    <h1 style="color: #1a1816; font-weight: 800; font-size: 28px; text-transform: uppercase; margin: 0 0 10px 0; font-family: 'Tahoma', sans-serif;">QUáº¢N LÃ Äáº¶T XE</h1>
                    <nav>
                        <ol class="breadcrumb" style="background: transparent; padding: 0; margin: 0; font-size: 14px;">
                            <li class="breadcrumb-item"><a href="homeStaff" target="_top" style="color: #b59349; text-decoration: none; font-weight: 600;">Trang chá»§</a></li>
                            <li class="breadcrumb-item active" style="font-weight: 500; color: #6c757d;">Quáº£n lÃ½ Ä‘áº·t xe</li>
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
                                <p style="margin: 0; font-size: 14px; color: #64748b; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Tá»•ng sá»‘ Ä‘Æ¡n Ä‘áº·t</p>
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
                                <p style="margin: 0; font-size: 14px; color: #64748b; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Sá»‘ Ä‘Æ¡n bá»‹ há»§y</p>
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
                                <p style="margin: 0; font-size: 14px; color: #64748b; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Sá»‘ Ä‘Æ¡n gia háº¡n</p>
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
                                    <i class="fas fa-clipboard-list me-2"></i>Äáº·t Ä‘Æ¡n
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab-cancelling" data-bs-toggle="tab" href="#cancelling">
                                    <i class="fas fa-times-circle me-2"></i>Há»§y Ä‘Æ¡n
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab-extending" data-bs-toggle="tab" href="#extending">
                                    <i class="fas fa-clock me-2"></i>Gia háº¡n
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
                                                        <th scope="col">NgÃ y Ä‘áº·t</th>
                                                        <th scope="col">ThÃ´ng tin xe</th>
                                                        <th scope="col">Tráº¡ng thÃ¡i Ä‘Æ¡n</th>
                                                        <th scope="col">Tráº¡ng thÃ¡i giao</th>
                                                        <th scope="col">GiÃ¡</th>
                                                        <th scope="col">Thanh toÃ¡n</th>
                                                        <th scope="col">Thao tÃ¡c</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.bookings}" var="listB">
                                                        <c:if test="${listB.statusBooking != 'Chá» thanh toÃ¡n'}">
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
                                                                        <c:choose>
                                                                            <c:when test="${listB.statusBooking == 'ÄÃ£ xÃ¡c nháº­n' || listB.statusBooking == 'ÄÃ£ thanh toÃ¡n'}">
                                                                                <span class="badge bg-success border"><i class="fas fa-check-circle me-1"></i>${listB.statusBooking}</span>
                                                                            </c:when>
                                                                            <c:when test="${listB.statusBooking == 'ÄÃ£ há»§y'}">
                                                                                <span class="badge bg-danger border"><i class="fas fa-times-circle me-1"></i>${listB.statusBooking}</span>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="badge bg-warning text-dark border"><i class="fas fa-exclamation-circle me-1"></i>${listB.statusBooking}</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>                                                       
                                                                    <%-- Cá»™t Delivery Status: náº¿u QuÃ¡ háº¡n hiá»ƒn thá»‹ nÃºt Ä‘áº·c biá»‡t --%>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${listB.deliveryStatus == 'QuÃ¡ háº¡n'}">
                                                                                <div class="d-flex flex-column align-items-center gap-1">
                                                                                    <span class="badge-overdue"><i class="fas fa-exclamation-circle"></i> QuÃ¡ háº¡n</span>
                                                                                    <button type="button" class="btn-confirm-return mt-1"
                                                                                            onclick="showConfirmReturnModal('${listB.bookingID}')">
                                                                                        <i class="fas fa-check-double me-1"></i>XÃ¡c nháº­n tráº£ xe
                                                                                    </button>
                                                                                </div>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <c:choose>
                                                                                    <c:when test="${listB.statusBooking == 'Chá» xÃ¡c nháº­n' || listB.statusBooking == 'ÄÃ£ há»§y'}">
                                                                                        <span class="text-muted font-monospace" style="font-size: 0.9rem;">-</span>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:set var="statusClass" value="${listB.deliveryStatus == 'ÄÃ£ tráº£' ? 'status-returned' : (listB.deliveryStatus == 'ÄÃ£ giao' ? 'status-delivered' : (listB.deliveryStatus == 'ChÆ°a giao' ? 'status-pending' : 'status-empty'))}" />
                                                                                        <select name="delistatus_${listB.bookingID}" id="status-${listB.bookingID}" class="form-select form-select-sm ${statusClass}" aria-label="Tráº¡ng thÃ¡i" onchange="document.getElementById('form-update-${listB.bookingID}').submit();" style="cursor: pointer;">
                                                                                            <option value="ChÆ°a giao" ${listB.deliveryStatus == 'ChÆ°a giao' ? 'selected' : ''}>Chá» nháº­n xe</option>
                                                                                            <option value="ÄÃ£ giao" ${listB.deliveryStatus == 'ÄÃ£ giao' ? 'selected' : ''}>Äang thuÃª</option>
                                                                                            <option value="ÄÃ£ tráº£" ${listB.deliveryStatus == 'ÄÃ£ tráº£' ? 'selected' : ''}>ÄÃ£ tráº£ xe</option>
                                                                                        </select>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>
                                                                        <c:set var="total" value="0"/>
                                                                        <c:forEach items="${listB.listBookingDetails}" var="detail">
                                                                            <c:set var="total" value="${total + detail.totalPrice}"/>
                                                                        </c:forEach>
                                                                        <fmt:formatNumber value="${total}" type="number" pattern="#,##0" /> VNÄ
                                                                    </td>
                                                                    <td class="text-center align-middle">
                                                                        <c:if test="${empty pay}">
                                                                            <span class="badge bg-warning text-dark border"><i class="fas fa-clock me-1"></i>Chá» TT</span>
                                                                        </c:if>
                                                                        <c:if test="${not empty pay}">
                                                                            <span class="badge bg-success border"><i class="fas fa-check me-1"></i>ÄÃ£ TT</span>
                                                                        </c:if>
                                                                    </td>                                                        
                                                                    <td class="text-center align-middle">
                                                                        <div class="d-flex align-items-center justify-content-center gap-2">
                                                                            <c:set var="buttonText" value="Xem chi tiáº¿t" />
                                                                            <c:set var="buttonClass" value="btn-info" />
                                                                            <c:set var="buttonIcon" value="fa-info-circle" />
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
                                                                                    <fmt:formatNumber value="${total}" type="number" pattern="#,##0" /> VNÄ"
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
                                                                            <a href="deleteBooking.jsp?bookingId=${listB.bookingID}" class="btn btn-danger btn-sm rounded-pill text-white shadow-sm font-bold" onclick="return confirm('Cáº£nh bÃ¡o: Báº¡n cÃ³ cháº¯c cháº¯n muá»‘n xÃ³a VÄ¨NH VIá»„N Ä‘Æ¡n ${listB.bookingID} khÃ´ng?');">
                                                                                <i class="fas fa-trash-alt me-1"></i> XÃ³a
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </form>
                                                        </c:if>
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
                                                        <th scope="col">MÃ£ Ä‘Æ¡n</th>
                                                        <th scope="col">NgÃ y há»§y Ä‘Æ¡n</th>
                                                        <th scope="col">Ghi chÃº (LÃ½ do)</th>
                                                        <th scope="col">Thao tÃ¡c</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.cancels}" var="listC">
                                                        <tr>
                                                            <c:set var="buttonText" value="${empty listC.staffID ? 'XÃ¡c nháº­n' : 'ÄÃ£ xÃ¡c nháº­n'}" />
                                                            <th scope="row">${listC.cancellationID}</th>
                                                            <td>${listC.bookingID}</td>
                                                            <td>${listC.cancellationDate}</td>
                                                            <td>${listC.note}</td>
                                                            <td>
                                                                <c:if test="${buttonText == 'ÄÃ£ xÃ¡c nháº­n'}">
                                                                    <button disabled class="btn btn-sm btn-success w-100">
                                                                        <i class="fas fa-check-double me-1"></i>${buttonText}
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${buttonText == 'XÃ¡c nháº­n'}">
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
                                                        <th scope="col">MÃ£ Ä‘Æ¡n</th>
                                                        <th scope="col">NgÃ y gia háº¡n</th>
                                                        <th scope="col">NgÃ y háº¡n trÆ°á»›c</th>
                                                        <th scope="col">NgÃ y háº¡n má»›i</th>
                                                        <th scope="col">PhÃ­ gia háº¡n</th>
                                                        <th scope="col">Thao tÃ¡c</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.extend}" var="extend">
                                                        <tr>
                                                            <c:set var="buttonText" value="${empty extend.staffID ? 'XÃ¡c nháº­n' : 'ÄÃ£ xÃ¡c nháº­n'}" />
                                                            <th scope="row">${extend.extensionID}</th>
                                                            <td>${extend.bookingID}</td>
                                                            <td>${extend.extensionDate}</td>
                                                            <td>${extend.previousEndDate}</td>
                                                            <td>${extend.newEndDate}</td>
                                                            <td>
                                                                <fmt:formatNumber value="${extend.extensionFee}" type="number" pattern="#,##0" /> VNÄ
                                                            </td>                        
                                                            <td>
                                                                <c:if test="${buttonText == 'ÄÃ£ xÃ¡c nháº­n'}">
                                                                    <button disabled class="btn btn-sm btn-success w-100">
                                                                        <i class="fas fa-check-double me-1"></i>${buttonText}
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${buttonText == 'XÃ¡c nháº­n'}">
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


                <!-- modal Ä‘á»ƒ hiá»ƒn thá»‹ thÃ´ng tin chi tiáº¿t cá»§a Ä‘áº·t Ä‘Æ¡n-->
                <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content" style="border-radius: 12px; border: none; box-shadow: 0 10px 25px rgba(0,0,0,0.1);">
                            <div style="padding: 20px 24px; border-bottom: 1px solid #e2e8f0; border-top-left-radius: 12px; border-top-right-radius: 12px; background: linear-gradient(135deg, #f8fafc 0%, #ffffff 100%);" class="modal-header d-flex align-items-center justify-content-between">
                                <h5 class="modal-title" id="modal-title" style="font-weight: 800; color: #1e293b; font-size: 18px; margin: 0;">
                                    <i class="fas fa-file-invoice text-primary me-2"></i>Chi tiáº¿t ÄÆ¡n hÃ ng
                                </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeDetail()" style="background: transparent; border: none; font-size: 24px; color: #94a3b8; transition: color 0.2s;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div style="padding: 20px 24px; background: #f8fafc;" class="info modal-body">
                                <ul class="nav nav-tabs mb-3" id="bookingTab" role="tablist" style="border-bottom: 2px solid #e2e8f0;">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="details-tab" data-bs-toggle="tab" data-bs-target="#order-details-tabpane" type="button" role="tab" style="font-weight: 600; color: #1e293b; border:none; background:transparent;">Chi tiáº¿t</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="chat-tab" data-bs-toggle="tab" data-bs-target="#order-chat-tabpane" type="button" role="tab" style="font-weight: 600; color: #64748b; border:none; background:transparent;" onclick="loadChatMessages()">Pháº£n há»“i & BÃ¡o cÃ¡o <span class="badge bg-danger rounded-pill" id="chat-badge" style="display:none;">!</span></button>
                                    </li>
                                </ul>
                                
                                <script>
                                    document.addEventListener('DOMContentLoaded', function() {
                                        var tabEls = document.querySelectorAll('#bookingTab button[data-bs-toggle="tab"]');
                                        tabEls.forEach(function(tabEl) {
                                            tabEl.addEventListener('shown.bs.tab', function (event) {
                                                event.target.style.color = '#1e293b';
                                                event.target.style.borderBottom = '3px solid #3b82f6';
                                                if(event.relatedTarget) {
                                                    event.relatedTarget.style.color = '#64748b';
                                                    event.relatedTarget.style.borderBottom = 'none';
                                                }
                                            });
                                        });
                                    });
                                </script>

                                <div class="tab-content" id="bookingTabContent">
                                    <div class="tab-pane fade show active" id="order-details-tabpane" role="tabpanel">
                                        <div class="container-fluid" id="order-details">
                                    <input type="hidden" id="modal-cusId">
                                    <div class="row" style="background: #ffffff; border-radius: 16px; padding: 24px; border: 1px solid #e2e8f0; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.02); margin-bottom: 24px;">
                                        <div class="col-md-6 border-end">
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-hashtag text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>MÃ£ Ä‘Æ¡n:</span>
                                                <span style="color: #0f172a; font-weight: 700; background: #f1f5f9; padding: 4px 10px; border-radius: 6px; font-family: monospace; letter-spacing: 0.5px;" id="modal-bookingId"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-motorcycle text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>TÃªn cÃ¡c xe:</span>
                                                <span style="color: #0f172a; font-weight: 600;" id="modal-nameMotorcycle"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-clock text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Thá»i gian Ä‘áº·t xe:</span>
                                                <span style="color: #0f172a; font-weight: 500;" id="modal-bookingDate"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-calendar-check text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Thá»i gian báº¯t Ä‘áº§u:</span>
                                                <span style="color: #0f172a; font-weight: 500;" id="modal-startDate"></span>
                                            </div>
                                            <div style="margin-bottom: 0px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-calendar-times text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Thá»i gian tráº£ xe:</span>
                                                <span style="color: #0f172a; font-weight: 500;" id="modal-endDate"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6 ps-4">
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-cubes text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Sá»‘ lÆ°á»£ng xe:</span>
                                                <span style="color: #0f172a; font-weight: 600; background: #eff6ff; color: #2563eb; padding: 2px 10px; border-radius: 12px;" id="modal-countMotorcycle"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-map-marker-alt text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Äá»‹a chá»‰ giao:</span>
                                                <span style="color: #0f172a; font-weight: 500;" id="modal-deliveryLocation"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-map-pin text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Äá»‹a chá»‰ tráº£:</span>
                                                <span style="color: #0f172a; font-weight: 500;" id="modal-returnedLocation"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-info-circle text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Tráº¡ng thÃ¡i Ä‘Æ¡n:</span>
                                                <span id="modal-statusBooking"></span>
                                            </div>
                                            <div style="margin-bottom: 16px; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-truck text-slate-400 me-2" style="color:#94a3b8; width: 16px;"></i>Tráº¡ng thÃ¡i giao xe:</span>
                                                <span id="modal-deliveryStatus"></span>
                                            </div>
                                            <div style="margin-bottom: 0; display: flex; align-items: baseline;">
                                                <span style="color: #64748b; font-weight: 600; width: 160px; display: inline-block;"><i class="fas fa-credit-card me-2" style="color:#94a3b8; width: 16px;"></i>Thanh toÃ¡n:</span>
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
                                                            <h6 class="mb-1 fw-bold text-dark" style="font-size: 15px;">ThÃ´ng tin khÃ¡ch hÃ ng</h6>
                                                            <div style="font-size: 13px; color: #64748b;">Nháº¥n Ä‘á»ƒ xem chi tiáº¿t liÃªn há»‡</div>
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
                                                        <div style="font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 2px;">Tá»•ng thanh toÃ¡n</div>
                                                        <h4 style="color: #b45309; font-weight: 800; margin: 0; font-size: 24px;" id="modal-Price"></h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- check tráº¡ng thÃ¡i => giao diá»‡n -->
                                    <div class="row" id="confirmwait" style="display: none;">
                                        <div class="col-md-6 text-center">
                                            <button type="button" class="btn btn-warning w-100 py-3" style="font-weight: 700; border-radius: 8px; color: #b45309; background-color: #fef3c7; border: 1px solid #fcd34d;" onclick="showError();">
                                                <i class="fas fa-exclamation-triangle me-2"></i> BÃ¡o lá»—i Ä‘Æ¡n hÃ ng
                                            </button>
                                        </div>
                                        <div class="col-md-6 text-center">
                                            <button type="button" class="btn btn-primary w-100 py-3" style="font-weight: 700; border-radius: 8px; color: #1e40af; background-color: #dbeafe; border: 1px solid #93c5fd;" onclick="showConfirmStep()">
                                                <i class="fas fa-check-circle me-2"></i> XÃ¡c nháº­n Ä‘Æ¡n hÃ ng
                                            </button>
                                        </div>
                                    </div>

                                    <!-- XÃ¡c nháº­n rá»“i -->
                                    <div id="confirmyes" style="display: none;">
                                        <div class="row g-2">
                                            <div class="col-12" id="approveInvoiceArea" style="display: none;">
                                                <button type="button" class="btn btn-warning w-100 py-3" style="font-weight: 700; border-radius: 8px; color: #92400e; background-color: #fef3c7; border: 1px solid #fcd34d; display: flex; flex-direction: column; align-items: center;" onclick="showApproveInvoiceModal()">
                                                    <div><i class="fas fa-file-invoice-dollar me-2"></i> XÃ¡c nháº­n Ä‘Ã£ nháº­n tiá»n (Thá»§ cÃ´ng)</div>
                                                    <div style="font-size: 11px; font-weight: 500; opacity: 0.85; margin-top: 4px;">DÃ¹ng dá»± phÃ²ng khi há»‡ thá»‘ng thanh toÃ¡n bá»‹ lá»—i</div>
                                                </button>
                                            </div>
                                            <div class="col-12" id="paidInvoiceArea" style="display: none;">
                                                <button class="btn btn-success w-100 py-3" disabled style="font-weight: 700; border-radius: 8px; color: #065f46; background-color: #d1fae5; border: 1px solid #6ee7b7; cursor: not-allowed; opacity: 1; box-shadow: 0 4px 6px -1px rgba(16, 185, 129, 0.1);">
                                                    <i class="fas fa-check-circle me-2"></i> <span id="paidInvoiceLabel">ÄÃ£ thanh toÃ¡n</span>
                                                </button>
                                            </div>
                                            <div class="col-12 mt-2" id="handoverArea" style="display: none;">
                                                <button type="button" class="btn btn-primary w-100 py-3" style="font-weight: 700; border-radius: 8px; box-shadow: 0 4px 6px -1px rgba(59, 130, 246, 0.3); display: flex; flex-direction: column; align-items: center;" onclick="showHandoverModal()">
                                                    <div><i class="fas fa-motorcycle me-2"></i> BÃ n Giao Xe & Thu Tiá»n Máº·t</div>
                                                    <div style="font-size: 11px; font-weight: 500; opacity: 0.85; margin-top: 4px;">Thu tiá»n, chá»¥p áº£nh tÃ¬nh tráº¡ng vÃ  giao xe cho khÃ¡ch</div>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    </div> <!-- close order-details -->
                                    </div> <!-- close order-details-tabpane -->
                                    
                                    <!-- CHAT TAB PANE -->
                                    <div class="tab-pane fade" id="order-chat-tabpane" role="tabpanel">
                                        <div class="d-flex align-items-center mb-3">
                                            <div class="rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 40px; height: 40px; background: #e0e7ff; color: #4f46e5; font-size: 18px;">
                                                <i class="fas fa-headset"></i>
                                            </div>
                                            <div>
                                                <h6 class="mb-0 fw-bold text-dark">Trao Ä‘á»•i vá»›i khÃ¡ch hÃ ng</h6>
                                                <small class="text-muted">Há»— trá»£ cÃ¡c váº¥n Ä‘á» vá» Ä‘Æ¡n hÃ ng & bÃ¡o lá»—i</small>
                                            </div>
                                        </div>
                                        <div id="chat-messages-container" style="height: 350px; overflow-y: auto; background: #f8fafc; border-radius: 12px; padding: 20px; border: 1px solid #e2e8f0; margin-bottom: 15px; display: flex; flex-direction: column; gap: 12px; box-shadow: inset 0 2px 4px rgba(0,0,0,0.02);">
                                            <!-- Messages will be injected here -->
                                        </div>
                                        <div class="input-group" style="box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05); border-radius: 12px; overflow: hidden; background: #fff; padding: 4px; border: 1px solid #cbd5e1;">
                                            <input type="text" id="chat-input" class="form-control" placeholder="Nháº­p ná»™i dung pháº£n há»“i..." style="border: none; padding: 12px 16px; font-size: 14px; box-shadow: none;" onkeypress="if(event.key==='Enter') sendChatMessage()">
                                            <button class="btn btn-primary rounded" type="button" style="padding: 0 20px; font-weight: 600; background: #4f46e5; border: none; margin: 2px;" onclick="sendChatMessage()"><i class="fas fa-paper-plane me-1"></i> Gá»­i</button>
                                        </div>
                                    </div>
                                </div>
                            </div>                 
                        </div>
                    </div>
                </div>

                <!-- Modal nÃ y lÃ  Ä‘á»ƒ hiá»ƒn thá»‹ xÃ¡c nháº­n nka (Ä‘áº·t Ä‘Æ¡n)-->
                <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                    <div class="modal-dialog" role="document">
                        <form id="confirmForm" action="manageBooking" method="post">
                            <input type="hidden" name="bookingID" id="formConfirmBookingID">
                            <input type="hidden" name="delistatus_bookingID" id="formConfirmDelistatus">

                            <div class="modal-content">
                                <input hidden id="bookingIdbyAcc">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalLabel">XÃ¡c nháº­n</h5>
                                </div>
                                <div class="modal-body" id="confirmModalMessage">
                                    <!-- Message will be set by JavaScript -->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="returnModalStep()">Quay vá»</button>
                                    <button type="button" id="confirmModalYesButton" class="btn btn-primary">CÃ³</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Modal nÃ y lÃ  Ä‘á»ƒ hiá»ƒn thá»‹ reject Ä‘Æ¡n hÃ ng cá»§a cus (Ä‘áº·t Ä‘Æ¡n)-->
                <div class="modal fade" id="RejectModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                    <div class="modal-dialog" role="document">
                        <form id="rejectForm" action="manageBooking" method="post">
                            <input type="hidden" name="bookingID" id="formRejectBookingID">
                            <input type="hidden" name ="cusId" id="formRejectCustomerID">
                            <input type="hidden" name="timeBook" id="formRejectTimeBooking">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalLabel">BÃ¡o lá»—i</h5>
                                </div>

                                <div class="modal-body" id="confirmModalMessage">
                                    <div class="cancellation" id="cancellation-info">
                                        <div class="text-center cancellation-content">
                                            <h2 class="fw-bold ">XÃ¡c nháº­n <span style="color: red; font-weight: bold">BÃ¡o Lá»—i </span></h2>
                                            <p class="mb-3">HÃ£y nháº­p lÃ½ do há»§y Ä‘Æ¡n Ä‘á»ƒ khÃ¡ch hÃ ng yÃªn tÃ¢m hÆ¡n nhÃ© ! <br> &hearts; &hearts; &hearts; </p>
                                            <textarea name="cancelreason" rows="4" cols="50" placeholder="Nháº­p lÃ½ do há»§y Ä‘Æ¡n..."></textarea>
                                            <br>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="returnshowError()">Quay vá»</button>
                                    <button type="button" id="confirmModalCancelButton" class="btn btn-primary" >Gá»­i</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Modal nÃ y lÃ  Ä‘á»ƒ xÃ¡c nháº­n há»§y Ä‘Æ¡n -->
                <div class="modal fade" id="confirmModalCancel" tabindex="-1" role="dialog" aria-labelledby="confirmModalCancelLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <form id="confirmFormCancel" action="manageBooking" method="post">
                            <input type="hidden" id="cancelBookingID" name="cancelBookId">
                            <input type="hidden" id=cancelStaffID" name="staffId">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalCancelLabel">XÃ¡c nháº­n</h5>
                                </div>
                                <div class="modal-body" id="confirmModalCancelMessage">
                                    <!-- Message will be set by JavaScript -->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="closeDetail()">Quay vá»</button>
                                    <button type="button" id="confirmModalCancelYesButton" class="btn btn-primary">CÃ³</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <!-- Modal nÃ y lÃ  Ä‘á»ƒ xÃ¡c nháº­n gia háº¡n -->
                <div class="modal fade" id="confirmModalExtend" tabindex="-1" role="dialog" aria-labelledby="confirmModalExtendLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <form id="confirmFormExtend" action="manageBooking" method="post">
                            <input type="hidden" id="extendBookingID" name="extendBookId">
                            <input type="hidden" id=extendStaffID" name="staffIdforEx">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalExtendLabel">XÃ¡c nháº­n</h5>
                                </div>
                                <div class="modal-body" id="confirmModalExtendMessage">
                                    <!-- Message will be set by JavaScript -->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="closeDetail()">Quay vá»</button>
                                    <button type="button" id="confirmModalExtendYesButton" class="btn btn-primary">CÃ³</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Modal thÃ´ng tin khÃ¡ch hÃ ng -->
                <div class="modal fade" role="dialog" tabindex="-1" id="customer-info-modal" style="z-index: 1060;">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content" style="border-radius: 16px; border: none; box-shadow: 0 20px 60px rgba(0,0,0,0.15);">
                            <div style="padding: 20px 24px; border-bottom: 1px solid #e2e8f0; background: linear-gradient(135deg, #f8fafc, #fff); border-radius: 16px 16px 0 0;" class="modal-header d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center gap-3">
                                    <h5 class="modal-title" style="font-weight: 800; color: #1e293b; font-size: 18px; margin: 0;">
                                        <i class="fas fa-id-card me-2" style="color: #3b82f6;"></i>ThÃ´ng tin KhÃ¡ch hÃ ng
                                    </h5>
                                    <span id="ai-badge-status" style="display:none;"></span>
                                </div>
                                <button type="button" class="close" onclick="$('#customer-info-modal').modal('hide')" style="background: transparent; border: none; font-size: 24px; color: #94a3b8;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div style="padding: 24px;" class="modal-body">
                                <!-- ThÃ´ng tin cÆ¡ báº£n -->
                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <div style="background: #f8fafc; border-radius: 12px; padding: 16px; border: 1px solid #e2e8f0;">
                                            <div style="font-size: 11px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px;"><i class="fas fa-user me-1"></i>ThÃ´ng tin liÃªn há»‡</div>
                                            <div style="margin-bottom: 10px;"><span style="color:#64748b; font-size:13px;">Há» tÃªn:</span><br><span id="cinfo-name" style="color:#0f172a; font-weight:700; font-size:15px;"></span></div>
                                            <div style="margin-bottom: 10px;"><span style="color:#64748b; font-size:13px;">Äiá»‡n thoáº¡i:</span><br><span id="cinfo-phone" style="color:#0f172a; font-weight:600;"></span></div>
                                            <div><span style="color:#64748b; font-size:13px;">Email:</span><br><span id="cinfo-email" style="color:#0f172a; font-weight:600; word-break:break-all;"></span></div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div style="background: #f8fafc; border-radius: 12px; padding: 16px; border: 1px solid #e2e8f0;">
                                            <div style="font-size: 11px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px;"><i class="fas fa-id-card me-1"></i>Giáº¥y tá» tÃ¹y thÃ¢n</div>
                                            <div style="margin-bottom: 10px;"><span style="color:#64748b; font-size:13px;">Loáº¡i giáº¥y tá»:</span><br><span id="cinfo-typeCard" style="color:#0f172a; font-weight:700;"></span></div>
                                            <div style="margin-bottom: 10px;"><span style="color:#64748b; font-size:13px;">Sá»‘ CCCD/CMND:</span><br><span id="cinfo-idcardno" style="color:#0f172a; font-weight:700; font-size:15px; font-family:monospace; letter-spacing:1px;"></span></div>
                                            <div class="row">
                                                <div class="col-6"><span style="color:#64748b; font-size:13px;">NgÃ y cáº¥p:</span><br><span id="cinfo-issuedon" style="color:#0f172a; font-weight:600;"></span></div>
                                                <div class="col-6"><span style="color:#64748b; font-size:13px;">NgÃ y háº¿t háº¡n:</span><br><span id="cinfo-expdate" style="color:#0f172a; font-weight:600;"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- áº¢nh CCCD -->
                                <div class="mb-3">
                                    <div style="font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px; display:flex; align-items:center; gap:8px;">
                                        <i class="fas fa-images" style="color:#3b82f6;"></i>áº¢nh giáº¥y tá» (click Ä‘á»ƒ xem to)
                                    </div>
                                    <div id="cinfo-idcards" style="display: flex; gap: 12px; flex-wrap: wrap;"></div>
                                </div>
                                <!-- Káº¿t quáº£ AI xÃ¡c thá»±c -->
                                <div id="ai-verify-section">
                                    <div style="border-top: 1px solid #e2e8f0; padding-top: 16px; margin-top: 4px;">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div style="font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 1px; display:flex; align-items:center; gap:6px;">
                                                <i class="fas fa-robot" style="color:#8b5cf6;"></i> XÃ¡c thá»±c báº±ng AI (FPT.AI OCR)
                                            </div>
                                            <button type="button" id="btn-verify-ai" onclick="verifyIdCardAI()" style="background: linear-gradient(135deg, #7c3aed, #4f46e5); color: #fff; border: none; padding: 8px 18px; border-radius: 8px; font-size: 13px; font-weight: 700; cursor: pointer; display:flex; align-items:center; gap:6px; transition: opacity 0.2s;" onmouseover="this.style.opacity='0.85'" onmouseout="this.style.opacity='1'">
                                                <i class="fas fa-magic"></i> QuÃ©t CCCD báº±ng AI
                                            </button>
                                        </div>
                                        <!-- Loading -->
                                        <div id="ai-loading" style="display:none; text-align:center; padding: 20px 0;">
                                            <div style="display:inline-flex; align-items:center; gap:10px; color:#8b5cf6; font-weight:600;">
                                                <svg width="20" height="20" viewBox="0 0 50 50" style="animation: spin 1s linear infinite;"><circle cx="25" cy="25" r="20" fill="none" stroke="#8b5cf6" stroke-width="5" stroke-dasharray="31.4 62.8" stroke-linecap="round"/></svg>
                                                <span>AI Ä‘ang Ä‘á»c vÃ  phÃ¢n tÃ­ch áº£nh CCCD...</span>
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

                <!-- Modal duyá»‡t hÃ³a Ä‘Æ¡n thá»§ cÃ´ng -->
                <div class="modal fade" id="approveInvoiceModal" tabindex="-1" role="dialog" aria-hidden="true" data-bs-backdrop="static">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <form id="approveInvoiceForm" action="manageBooking" method="post">
                            <input type="hidden" name="bookingID" id="approveInvoiceBookingID">
                            <input type="hidden" name="manualPayment" value="true">
                            <div class="modal-content" style="border-radius: 16px; border: none; box-shadow: 0 20px 60px rgba(0,0,0,0.15);">
                                <div class="modal-header" style="background: linear-gradient(135deg, #fef3c7, #fffbeb); border-radius: 16px 16px 0 0; border-bottom: 1px solid #fcd34d; padding: 20px 24px;">
                                    <h5 class="modal-title" style="font-weight: 800; color: #92400e; margin: 0;">
                                        <i class="fas fa-file-invoice-dollar me-2"></i>Duyá»‡t hÃ³a Ä‘Æ¡n thá»§ cÃ´ng
                                    </h5>
                                </div>
                                <div class="modal-body" style="padding: 24px;">
                                    <div style="background: #fffbeb; border: 1px solid #fcd34d; border-radius: 12px; padding: 16px; margin-bottom: 16px;">
                                        <div style="font-size: 13px; color: #92400e; margin-bottom: 8px;"><i class="fas fa-exclamation-triangle me-2"></i><strong>LÆ°u Ã½:</strong> Chá»‰ duyá»‡t khi Ä‘Ã£ <strong>nháº­n Ä‘Æ°á»£c tiá»n chuyá»ƒn khoáº£n</strong> tá»« khÃ¡ch hÃ ng!</div>
                                        <div style="font-size: 13px; color: #78350f;">Thao tÃ¡c nÃ y sáº½ Ä‘Ã¡nh dáº¥u Ä‘Æ¡n <strong id="approveInvoiceBookingLabel"></strong> lÃ  Ä‘Ã£ thanh toÃ¡n vÃ  khÃ´ng thá»ƒ hoÃ n tÃ¡c.</div>
                                    </div>
                                    <div style="background: #f8fafc; border-radius: 10px; padding: 14px;">
                                        <div style="display:flex; justify-content:space-between; margin-bottom:8px;"><span style="color:#64748b;">MÃ£ Ä‘Æ¡n hÃ ng:</span><strong id="approveInvoiceBID" style="font-family:monospace;"></strong></div>
                                        <div style="display:flex; justify-content:space-between;"><span style="color:#64748b;">Sá»‘ tiá»n:</span><strong id="approveInvoiceAmt" style="color:#b45309;"></strong></div>
                                    </div>
                                </div>
                                <div class="modal-footer" style="border-top: 1px solid #e2e8f0; padding: 16px 24px;">
                                    <button type="button" class="btn btn-secondary" onclick="$('#approveInvoiceModal').modal('hide'); $('#user-form-modal').modal('show');">Quay vá»</button>
                                    <button type="submit" class="btn btn-warning" style="font-weight: 700; color: #92400e; background: #fbbf24; border: none; padding: 10px 24px; border-radius: 8px;">
                                        <i class="fas fa-check me-2"></i>XÃ¡c nháº­n Ä‘Ã£ nháº­n tiá»n
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
        function handleDeliveryStatusChange(selectEl, bId, deliveryAddress) {
            var newVal = selectEl.value;
            var oldVal = selectEl.dataset.oldVal || selectEl.options[0].value;
            
            if (!confirm('Cáº­p nháº­t tráº¡ng thÃ¡i giao xe?')) {
                selectEl.value = oldVal;
                return;
            }
            
            document.getElementById('status-' + bId).value = newVal;
            
            if (newVal === 'ÄÃ£ giao' && deliveryAddress && !deliveryAddress.includes('Your own address') === false) {
                // Try OSRM calculation
                var cleanAddr = deliveryAddress.replace('Your own address:', '').replace('PhÃ­ giao xe:', '').split('(')[0].trim();
                var STORE_LAT = 16.0600, STORE_LON = 108.2096;
                
                fetch('https://nominatim.openstreetmap.org/search?format=json&limit=1&q=' + encodeURIComponent(cleanAddr + ', ÄÃ  Náºµng, Viá»‡t Nam'))
                    .then(r => r.json())
                    .then(data => {
                        if (data && data.length > 0) {
                            return fetch('https://router.project-osrm.org/route/v1/driving/' + STORE_LON + ',' + STORE_LAT + ';' + data[0].lon + ',' + data[0].lat);
                        }
                        throw new Error('no geocode');
                    })
                    .then(r => r.json())
                    .then(routeData => {
                        var minutes = Math.ceil(routeData.routes[0].duration / 60);
                        return fetch('${pageContext.request.contextPath}/api/save-delivery-estimate', {
                            method: 'POST',
                            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                            body: 'bookingId=' + encodeURIComponent(bId) + '&minutes=' + minutes
                        });
                    })
                    .catch(() => {})
                    .finally(() => {
                        document.getElementById('form-update-' + bId).submit();
                    });
            } else {
                document.getElementById('form-update-' + bId).submit();
            }
            
            selectEl.dataset.oldVal = newVal;
        }

        function openUserModal(button) {
            try {
            var modal = $('#user-form-modal');
            var bId = button.getAttribute('data-bookingId');
            modal.find('#modal-bookingId').text(bId);
            modal.find('#modal-bookingDate').text(button.getAttribute('data-bookingDate'));
            modal.find('#modal-startDate').text(button.getAttribute('data-startDate'));
            modal.find('#modal-endDate').text(button.getAttribute('data-endDate'));
            
            var sBooking = button.getAttribute('data-statusBooking') || '';
            var dStatus = button.getAttribute('data-deliveryStatus') || '';
            var deliveryLocation = button.getAttribute('data-deliveryLocation') || '';
            
            var sBHtml = sBooking.includes('ÄÃ£ xÃ¡c') ? '<span style="color: #059669; background: #ecfdf5; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #10b981;">' + sBooking + '</span>' : '<span style="color: #d97706; background: #fffbeb; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #fbbf24;">' + sBooking + '</span>';
            
            // Editable Delivery Status Dropdown for Modal
            var dSHtml = '';
            if (dStatus.includes('ÄÃ£ tráº£')) {
                dSHtml = '<span style="color: #059669; background: #ecfdf5; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #10b981;">ÄÃ£ tráº£ xe</span>';
            } else if (dStatus === 'QuÃ¡ háº¡n') {
                dSHtml = '<span style="color: #dc2626; background: #fef2f2; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #fca5a5;">QuÃ¡ háº¡n</span>';
            } else {
                var isPending = dStatus.includes('ChÆ°a giao');
                var isDelivered = dStatus.includes('ÄÃ£ giao');
                var selColor = isDelivered ? '#2563eb' : '#475569';
                var selBg = isDelivered ? '#eff6ff' : '#f1f5f9';
                var selBorder = isDelivered ? '#3b82f6' : '#cbd5e1';
                
                var onChangeScript = "handleDeliveryStatusChange(this, '" + bId + "', '" + deliveryLocation.replace(/'/g, "\\\\'") + "')";
                
                dSHtml = `<select class="form-select form-select-sm" style="width: 140px; cursor: pointer; border-radius:6px; font-weight:600; color: \${selColor}; background: \${selBg}; border: 1px solid \${selBorder};" onchange="\${onChangeScript}">
                            <option value="ChÆ°a giao" \${isPending ? 'selected' : ''}>Chá» nháº­n xe</option>
                            <option value="ÄÃ£ giao" \${isDelivered ? 'selected' : ''}>Äang thuÃª</option>
                            <option value="ÄÃ£ tráº£">ÄÃ£ tráº£ xe</option>
                          </select>`;
            }
            
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
            var hasPaid = payStatus !== '' && !payStatus.includes('Chá»');

            // Hiá»ƒn thá»‹ thÃ´ng tin thanh toÃ¡n
            if (payStatus === '') {
                $('#modal-paymentInfo').html('<span style="color:#94a3b8; font-style:italic;">ChÆ°a thanh toÃ¡n</span>');
            } else if (hasPaid) {
                $('#modal-paymentInfo').html('<span style="color:#059669; background:#ecfdf5; padding:2px 10px; border-radius:6px; border:1px solid #10b981;"><i class="fas fa-check-circle me-1"></i>' + payMethod + '</span>');
            } else {
                $('#modal-paymentInfo').html('<span style="color:#d97706; background:#fffbeb; padding:2px 10px; border-radius:6px; border:1px solid #fbbf24;">' + payStatus + '</span>');
            }

            if (sBooking.includes('Ch')) {
                $('#confirmwait').show();
                $('#confirmyes').hide();
            } else {
                $('#confirmwait').hide();
                $('#confirmyes').show();
                // Hiá»ƒn thá»‹ nÃºt duyá»‡t hÃ³a Ä‘Æ¡n náº¿u chÆ°a thanh toÃ¡n, áº©n náº¿u Ä‘Ã£ thanh toÃ¡n
                if (hasPaid) {
                    $('#approveInvoiceArea').hide();
                    $('#paidInvoiceArea').show();
                    $('#paidInvoiceLabel').text('ÄÃ£ thanh toÃ¡n (' + payMethod + ')');
                } else {
                    $('#approveInvoiceArea').show();
                    $('#paidInvoiceArea').hide();
                }

                var selectElement = button.closest('tr').querySelector('select[name^="delistatus_"]');
                var deliveryStatus = selectElement ? selectElement.value : button.getAttribute('data-deliveryStatus');
                if (deliveryStatus === 'ChÆ°a giao') {
                    $('#handoverArea').show();
                } else {
                    $('#handoverArea').hide();
                }
            }

            var modalEl = document.getElementById('user-form-modal');
            var bsModal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
            bsModal.show();
            } catch (err) {
                console.error("JS Error in openUserModal: ", err);
            }
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
            $('#cinfo-idcardno').text(identityCard || 'ChÆ°a cáº­p nháº­t');
            $('#cinfo-issuedon').text(issuedOn || 'N/A');
            $('#cinfo-expdate').text(expDate || 'N/A');
            $('#cinfo-typeCard').text(typeCard || 'N/A');

            // Reset AI area khi má»Ÿ modal má»›i
            $('#ai-badge-status').hide().html('');
            $('#ai-result-box').hide().html('');
            $('#ai-loading').hide();
            $('#btn-verify-ai').prop('disabled', false).html('<i class="fas fa-magic"></i> QuÃ©t CCCD báº±ng AI');

            // Kiá»ƒm tra háº¡n CCCD
            if (expDate && expDate !== 'N/A') {
                var parts = expDate.split('-');
                if (parts.length === 3) {
                    var expDateObj = new Date(parts[2], parts[1]-1, parts[0]);
                    var today = new Date();
                    if (expDateObj < today) {
                        $('#ai-badge-status').html('<span style="background:#fee2e2; color:#dc2626; border:1px solid #fca5a5; padding:4px 10px; border-radius:20px; font-size:12px; font-weight:700;"><i class="fas fa-exclamation-triangle me-1"></i>CCCD Háº¾T Háº N</span>').show();
                    }
                }
            }

            // Store cusIdCard globally for AI call
            window._currentCusIdCard = cusIdCard;
            window._currentIdentityCard = identityCard;
            window._currentCusName = cusName;
            
            var idCardHtml = '';
            var frontImg = '';
            var backImg = '';
            if (cusIdCard && cusIdCard.trim() !== '') {
                var images = cusIdCard.split(',');
                frontImg = images.length > 0 ? images[0].trim() : '';
                backImg = images.length > 1 ? images[1].trim() : '';
            }

            function generateImgHtml(imgStr, label) {
                if (imgStr === '' || imgStr === 'null') {
                    return `<div style="flex: 1; min-width: 200px; text-align: center; border-radius: 12px; border: 2px dashed #cbd5e1; background:#f8fafc; display:flex; flex-direction:column; justify-content:center; align-items:center; height:170px;">
                                <div style="font-size:11px; font-weight:700; color:#64748b; margin-bottom:8px; text-transform:uppercase; letter-spacing:1px;">${label}</div>
                                <i class="fas fa-image fa-2x" style="color:#e2e8f0; margin-bottom:4px;"></i>
                                <div style="font-size:12px; color:#94a3b8;">ChÆ°a cáº­p nháº­t</div>
                            </div>`;
                }
                var isUrl = imgStr.startsWith('http');
                var imgSrc = isUrl ? imgStr : 'upload/' + imgStr;
                return `<div style="flex: 1; min-width: 200px; text-align: center; cursor: pointer; border-radius: 12px; overflow: hidden; border: 2px solid #e2e8f0; background:#f8fafc;" onclick="viewImageFull('${imgSrc}')">
                            <div style="font-size:11px; font-weight:700; color:#64748b; padding:8px; border-bottom: 1px solid #e2e8f0; text-transform:uppercase; letter-spacing:1px;">${label}</div>
                            <img src="${imgSrc}" style="width: 100%; height: 130px; object-fit: cover; transition: transform 0.2s; display:block;" onmouseover="this.style.transform='scale(1.05)'" onmouseout="this.style.transform='scale(1)'" onerror="this.src=''; this.parentElement.innerHTML='<div style=&quot;padding:20px; color:#94a3b8; font-size:12px; height:130px; display:flex; align-items:center; justify-content:center; flex-direction:column;&quot;><i class=&quot;fas fa-image fa-2x mb-2&quot;></i>ChÆ°a cáº­p nháº­t</div>';">
                        </div>`;
            }

            idCardHtml += generateImgHtml(frontImg, 'Máº·t trÆ°á»›c');
            idCardHtml += generateImgHtml(backImg, 'Máº·t sau');
            $('#cinfo-idcards').html(idCardHtml);
            
            // Handle stacked modals (attach only once or just use CSS)
            $('#customer-info-modal').off('show.bs.modal hidden.bs.modal');
            $('#customer-info-modal').on('show.bs.modal', function () {
                $('#user-form-modal').css('opacity', 0);
            });
            $('#customer-info-modal').on('hidden.bs.modal', function () {
                $('#user-form-modal').css('opacity', 1);
            });
            
            $('#customer-info-modal').modal('show');
        }

        function verifyIdCardAI() {
            var cusIdCard = window._currentCusIdCard || '';
            var storedId  = window._currentIdentityCard || '';
            var storedName = window._currentCusName || '';

            if (!cusIdCard || cusIdCard.trim() === '') {
                $('#ai-result-box').html('<div style="background:#fff7ed; border:1px solid #fdba74; border-radius:10px; padding:14px; color:#9a3412; font-size:13px;"><i class="fas fa-exclamation-triangle me-2"></i>KhÃ´ng cÃ³ áº£nh CCCD Ä‘á»ƒ xÃ¡c thá»±c.</div>').show();
                return;
            }

            // Láº¥y áº£nh máº·t trÆ°á»›c
            var firstImg = cusIdCard.split(',')[0].trim();

            // Show loading
            $('#btn-verify-ai').prop('disabled', true).html('<i class="fas fa-spinner fa-spin me-1"></i> Äang xá»­ lÃ½...');
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
                $('#btn-verify-ai').prop('disabled', false).html('<i class="fas fa-magic"></i> QuÃ©t CCCD báº±ng AI');

                if (!data.success) {
                    var needKey = data.needKey;
                    var title = needKey ? 'ChÆ°a cÃ i FPT.AI API Key' : 'KhÃ´ng thá»ƒ xÃ¡c thá»±c';
                    var msgHtml = '<div style="background:#fef3c7; border:1px solid #fcd34d; border-radius:10px; padding:16px;">'
                        + '<div style="font-weight:700; color:#92400e; margin-bottom:8px;"><i class="fas ' + (needKey ? 'fa-key' : 'fa-exclamation-triangle') + ' me-2"></i>' + title + '</div>'
                        + '<div style="font-size:13px; color:#78350f;">' + (data.message || 'Lá»—i khÃ´ng xÃ¡c Ä‘á»‹nh') + '</div>'
                        + (needKey ? '<div style="margin-top:10px; font-size:12px; color:#92400e;">1. ÄÄƒng kÃ½ táº¡i <a href="https://console.fpt.ai" target="_blank">console.fpt.ai</a> Ä‘á»ƒ láº¥y API key miá»…n phÃ­<br>2. Má»Ÿ file <code>VerifyIdCardServlet.java</code><br>3. Äiá»n key vÃ o biáº¿n <code>FPT_API_KEY</code></div>' : '')
                        + '</div>';
                    $('#ai-result-box').html(msgHtml).show();
                    return;
                }

                // Build result UI
                var color = data.statusColor;
                var icon  = data.statusIcon;
                var statusText = data.status;

                // Badge in header â€” xÃ©t cáº£ doeValid
                var allOk = data.idMatch && data.nameMatch && (data.doeValid !== false);
                var anyOk = data.idMatch || data.nameMatch;
                var badgeColor  = allOk ? '#059669' : (anyOk ? '#d97706' : '#dc2626');
                var badgeBg     = allOk ? '#ecfdf5' : (anyOk ? '#fffbeb' : '#fee2e2');
                var badgeBorder = allOk ? '#10b981' : (anyOk ? '#fbbf24' : '#fca5a5');
                var badgeIcon   = allOk ? 'fa-robot' : (data.doeValid === false ? 'fa-calendar-times' : (anyOk ? 'fa-exclamation-circle' : 'fa-times-circle'));
                var badgeText   = allOk ? 'AI: Há»¢P Lá»†' : (data.doeValid === false ? 'AI: CCCD Háº¾T Háº N' : (anyOk ? 'AI: Cáº¦N KIá»‚M TRA' : 'AI: KHÃ”NG KHá»šP'));
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
                        + '<div style="text-align:right;"><span style="color:#64748b; font-size:11px;">AI Ä‘á»c Ä‘Æ°á»£c:</span><br>'
                        + '<span style="font-weight:700;">' + (ocrVal||'-') + '</span> <i class="fas ' + icon2 + '" style="color:' + c + '; margin-left:4px;"></i></div>'
                        + '</div>';
                };

                // HÃ ng kiá»ƒm tra háº¡n CCCD
                var doeOk = data.doeValid !== false;
                var doeBg = doeOk ? '#f0fdf4' : '#fff5f5';
                var doeIcon = doeOk ? 'fa-check-circle' : 'fa-calendar-times';
                var doeColor = doeOk ? '#059669' : '#dc2626';
                var doeLabel = doeOk ? 'CÃ²n hiá»‡u lá»±c' : 'âš  Háº¾T Háº N';
                var doeRow = '<div style="' + rowStyle + ' background:' + doeBg + '; border-radius:8px; padding:10px; margin-bottom:6px;">'
                    + '<div><span style="color:#64748b; font-size:11px; text-transform:uppercase; letter-spacing:0.5px;">NgÃ y háº¿t háº¡n</span><br>'
                    + '<span style="color:#0f172a; font-weight:700;">' + (data.ocrDoe||'N/A') + '</span></div>'
                    + '<div style="text-align:right;"><i class="fas ' + doeIcon + '" style="color:' + doeColor + ';"></i> <span style="color:' + doeColor + '; font-weight:700;">' + doeLabel + '</span></div>'
                    + '</div>';

                // Danh sÃ¡ch lá»—i chi tiáº¿t
                var fieldErrHtml = '';
                if (data.fieldErrors && data.fieldErrors.length > 0) {
                    fieldErrHtml += '<div style="margin-top:12px;">';
                    fieldErrHtml += '<div style="font-size:11px; font-weight:700; color:#dc2626; text-transform:uppercase; letter-spacing:1px; margin-bottom:8px;"><i class="fas fa-exclamation-triangle me-1"></i>Váº¥n Ä‘á» phÃ¡t hiá»‡n</div>';
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
                    + '<div style="font-size:11px; font-weight:700; color:#64748b; text-transform:uppercase; letter-spacing:1px; margin-bottom:10px;">So sÃ¡nh dá»¯ liá»‡u</div>'
                    + matchBadge(data.idMatch, storedId, data.ocrId, 'Sá»‘ CCCD/CMND')
                    + matchBadge(data.nameMatch, storedName, data.ocrName, 'Há» vÃ  tÃªn')
                    + doeRow
                    + fieldErrHtml
                    + '<div style="margin-top:14px; padding:10px; background:#f8fafc; border-radius:8px; font-size:12px;">'
                    + '<div style="font-weight:700; color:#64748b; text-transform:uppercase; letter-spacing:1px; margin-bottom:8px;"><i class="fas fa-robot me-1" style="color:#8b5cf6;"></i>ThÃ´ng tin AI Ä‘á»c tá»« áº£nh</div>'
                    + '<div style="display:grid; grid-template-columns:1fr 1fr; gap:6px;">'
                    + '<div><span style="color:#94a3b8;">NgÃ y sinh:</span><br><strong>' + (data.ocrDob||'N/A') + '</strong></div>'
                    + '<div><span style="color:#94a3b8;">Giá»›i tÃ­nh:</span><br><strong>' + (data.ocrSex||'N/A') + '</strong></div>'
                    + '<div><span style="color:#94a3b8;">NgÃ y háº¿t háº¡n:</span><br><strong>' + (data.ocrDoe||'N/A') + '</strong></div>'
                    + '<div><span style="color:#94a3b8;">Loáº¡i CCCD:</span><br><strong>' + (data.type||'N/A') + '</strong></div>'
                    + '</div></div>'
                    + '</div></div>';

                $('#ai-result-box').html(html).show();
            })
            .catch(function(err) {
                $('#ai-loading').hide();
                $('#btn-verify-ai').prop('disabled', false).html('<i class="fas fa-magic"></i> QuÃ©t CCCD báº±ng AI');
                $('#ai-result-box').html('<div style="background:#fee2e2; border:1px solid #fca5a5; border-radius:10px; padding:14px; color:#dc2626; font-size:13px;"><i class="fas fa-times-circle me-2"></i>Lá»—i káº¿t ná»‘i: ' + err + '</div>').show();
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
            $('#confirmModalMessage').text("Báº¡n cÃ³ cháº¯c cháº¯n xÃ¡c nháº­n Ä‘Æ¡n cÃ³ mÃ£: " + bookingId + " khÃ´ng?");

            $('#formConfirmBookingID').val(bookingId);
            $('#formConfirmDelistatus').val(delistatus);
        }

        function returnModalStep() {
            $('#user-form-modal').modal('show');
            $('#confirmModal').modal('hide');
        }

        $('#confirmModalYesButton').click(function () {
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
            $('#rejectForm').submit();
        });


        function showConfirmModal(bookingId) {
            $('#confirmModalCancel').modal('show');
            $('#confirmModalCancelMessage').text("Báº¡n cÃ³ cháº¯c cháº¯n xÃ¡c nháº­n Ä‘Æ¡n há»§y cÃ³ mÃ£: " + bookingId + " khÃ´ng?");

            $('#cancelBookingID').val(bookingId);
        }
        $('#confirmModalCancelYesButton').click(function () {
            $('#confirmFormCancel').submit();
//            $('#tab-cancelling').tab('show');
        });

        function showConfirmExtendModal(bookingId) {
            $('#confirmModalExtend').modal('show');
            $('#confirmModalExtendMessage').text("Báº¡n cÃ³ cháº¯c cháº¯n xÃ¡c nháº­n Ä‘Æ¡n gia háº¡n cÃ³ mÃ£: " + bookingId + " khÃ´ng?");

            $('#extendBookingID').val(bookingId);
        }
        $('#confirmModalExtendYesButton').click(function () {
            $('#confirmFormExtend').submit();
        });

        // ===== XÃC NHáº¬N TRáº¢ XE (QUÃ Háº N) =====
        var _pendingReturnBookingId = null;

        function showConfirmReturnModal(bookingId) {
            _pendingReturnBookingId = bookingId;
            $('#returnModal-bookingId').text(bookingId);
            $('#returnModal-loadingSection').show();
            $('#returnModal-resultSection').hide();
            $('#returnModal-confirmBtn').prop('disabled', true);
            $('#confirmReturnModal').modal('show');

            // Gá»i AJAX láº¥y trÆ°á»›c sá»‘ ngÃ y quÃ¡ háº¡n vÃ  phÃ­ pháº¡t (preview)
            $.ajax({
                url: '${pageContext.request.contextPath}/confirmReturn',
                method: 'POST',
                data: { bookingID: bookingId, previewOnly: 'true' },
                dataType: 'json',
                success: function(res) {
                    $('#returnModal-loadingSection').hide();
                    if (res.overdueDays > 0) {
                        $('#returnModal-overdueDays').text(res.overdueDays + ' ngÃ y');
                        $('#returnModal-lateFee').text(Number(res.lateFee).toLocaleString('vi-VN') + ' Ä‘');
                        $('#returnModal-feeSection').show();
                        $('#returnModal-noFeeSection').hide();
                    } else {
                        $('#returnModal-feeSection').hide();
                        $('#returnModal-noFeeSection').show();
                    }
                    $('#returnModal-resultSection').show();
                    $('#returnModal-confirmBtn').prop('disabled', false);
                },
                error: function() {
                    $('#returnModal-loadingSection').hide();
                    $('#returnModal-feeSection').hide();
                    $('#returnModal-noFeeSection').show();
                    $('#returnModal-resultSection').show();
                    $('#returnModal-confirmBtn').prop('disabled', false);
                }
            });
        }

        $('#returnModal-confirmBtn').on('click', function() {
            if (!_pendingReturnBookingId) return;
            var btn = $(this);
            btn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm me-2"></span>Äang xá»­ lÃ½...');

            $.ajax({
                url: '${pageContext.request.contextPath}/confirmReturn',
                method: 'POST',
                data: { bookingID: _pendingReturnBookingId },
                dataType: 'json',
                success: function(res) {
                    $('#confirmReturnModal').modal('hide');
                    if (res.success) {
                        var msg = 'âœ… ÄÃ£ xÃ¡c nháº­n tráº£ xe cho Ä‘Æ¡n #' + _pendingReturnBookingId + '!';
                        if (res.overdueDays > 0) {
                            msg += '\n\nâš ï¸ PhÃ­ trá»… háº¡n (' + res.overdueDays + ' ngÃ y): '
                                 + Number(res.lateFee).toLocaleString('vi-VN') + ' Ä‘ Ä‘Ã£ Ä‘Æ°á»£c ghi nháº­n.';
                        }
                        alert(msg);
                        location.reload();
                    } else {
                        alert('âŒ Lá»—i: ' + (res.message || 'KhÃ´ng thá»ƒ xÃ¡c nháº­n tráº£ xe'));
                        btn.prop('disabled', false).html('<i class="fas fa-check-double me-1"></i>XÃ¡c nháº­n tráº£ xe');
                    }
                },
                error: function() {
                    alert('âŒ Lá»—i káº¿t ná»‘i mÃ¡y chá»§. Vui lÃ²ng thá»­ láº¡i.');
                    btn.prop('disabled', false).html('<i class="fas fa-check-double me-1"></i>XÃ¡c nháº­n tráº£ xe');
                }
            });
        });
    </script>

    <!-- ===== MODAL XÃC NHáº¬N TRáº¢ XE ===== -->
    <div class="modal fade" id="confirmReturnModal" tabindex="-1" aria-labelledby="confirmReturnModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius:16px; overflow:hidden; border:none; box-shadow: 0 20px 60px rgba(0,0,0,0.15);">
                <!-- Header -->
                <div class="modal-header" style="background: linear-gradient(135deg, #dc2626, #ef4444); border:none; padding:20px 24px;">
                    <h5 class="modal-title text-white fw-bold" id="confirmReturnModalLabel">
                        <i class="fas fa-motorcycle me-2"></i>XÃ¡c Nháº­n KhÃ¡ch Tráº£ Xe
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- Body -->
                <div class="modal-body" style="padding:24px;">
                    <p class="text-center text-muted mb-3">ÄÆ¡n thuÃª: <strong id="returnModal-bookingId" class="text-dark"></strong></p>

                    <!-- Loading -->
                    <div id="returnModal-loadingSection" class="text-center py-4">
                        <div class="spinner-border text-danger" role="status"></div>
                        <p class="mt-3 text-muted">Äang tÃ­nh phÃ­ pháº¡t...</p>
                    </div>

                    <!-- Káº¿t quáº£ -->
                    <div id="returnModal-resultSection" style="display:none;">
                        <!-- CÃ³ phÃ­ pháº¡t -->
                        <div id="returnModal-feeSection" style="display:none;">
                            <div class="alert alert-danger border-0" style="background:#fff1f2; border-left:4px solid #ef4444 !important; border-radius:10px;">
                                <div class="d-flex align-items-center mb-2">
                                    <i class="fas fa-exclamation-triangle text-danger me-2 fa-lg"></i>
                                    <strong class="text-danger">PhÃ¡t hiá»‡n phÃ­ trá»… háº¡n!</strong>
                                </div>
                                <div class="row g-2 mt-1">
                                    <div class="col-6 text-center" style="background:white; border-radius:8px; padding:12px;">
                                        <div class="text-muted" style="font-size:12px;">Sá»‘ ngÃ y quÃ¡ háº¡n</div>
                                        <div class="fw-bold text-danger fs-4" id="returnModal-overdueDays">-</div>
                                    </div>
                                    <div class="col-6 text-center" style="background:white; border-radius:8px; padding:12px;">
                                        <div class="text-muted" style="font-size:12px;">PhÃ­ pháº¡t (150%/ngÃ y)</div>
                                        <div class="fw-bold text-danger fs-5" id="returnModal-lateFee">-</div>
                                    </div>
                                </div>
                                <p class="mt-3 mb-0 text-muted" style="font-size:13px;">PhÃ­ pháº¡t sáº½ Ä‘Æ°á»£c <strong>ghi nháº­n vÃ o há»“ sÆ¡</strong> vÃ  thu khi khÃ¡ch thanh toÃ¡n.</p>
                            </div>
                        </div>
                        <!-- KhÃ´ng cÃ³ phÃ­ -->
                        <div id="returnModal-noFeeSection" style="display:none;">
                            <div class="alert alert-success border-0" style="background:#f0fdf4; border-left:4px solid #22c55e !important; border-radius:10px;">
                                <i class="fas fa-check-circle text-success me-2"></i>
                                <strong>Tráº£ xe Ä‘Ãºng háº¡n!</strong> KhÃ´ng phÃ¡t sinh phÃ­ pháº¡t.
                            </div>
                        </div>
                        <p class="text-center text-muted mt-3 mb-0" style="font-size:13px;">
                            Xe sáº½ Ä‘Æ°á»£c Ä‘á»•i tráº¡ng thÃ¡i vá» <strong>"CÃ³ sáºµn"</strong> sau khi xÃ¡c nháº­n.
                        </p>
                    </div>
                </div>
                <!-- Footer -->
                <div class="modal-footer" style="border:none; padding:16px 24px; background:#f8fafc;">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times me-1"></i>Há»§y bá»
                    </button>
                    <button type="button" class="btn btn-danger fw-bold px-4" id="returnModal-confirmBtn" disabled>
                        <i class="fas fa-check-double me-1"></i>XÃ¡c nháº­n tráº£ xe
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- ===== END MODAL ===== -->

<!-- Handover Modal -->
<div class="modal fade" id="handoverModal" tabindex="-1" role="dialog" aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content" style="border-radius: 16px; border: none; box-shadow: 0 20px 60px rgba(0,0,0,0.15);">
            <div class="modal-header" style="background: linear-gradient(135deg, #eff6ff, #dbeafe); border-radius: 16px 16px 0 0; border-bottom: 1px solid #bfdbfe; padding: 20px 24px;">
                <h5 class="modal-title" style="font-weight: 800; color: #1e3a8a; margin: 0;">
                    <i class="fas fa-clipboard-check me-2"></i>BÃ n Giao Xe - <span id="handover-bId"></span>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4">
                
                <!-- Thanh toÃ¡n Section -->
                <div class="mb-4">
                    <h6 class="fw-bold mb-3 text-primary"><i class="fas fa-money-bill-wave me-2"></i>1. XÃ¡c nháº­n Thanh toÃ¡n</h6>
                    <div id="handover-payment-section" class="p-3 border rounded-3 bg-light text-center">
                        <!-- QR Code will be loaded here -->
                        <div id="handover-qr-container">
                            <h4 class="text-danger fw-bold mb-1">Cáº§n thu: <span id="handover-amount"></span> Ä‘</h4>
                            <p class="text-muted small mb-3">MÃ£ Ä‘Æ¡n: <span id="handover-qr-note"></span></p>
                            <img id="handover-qr-img" src="" alt="QR Code" style="width: 250px; border-radius: 12px; border: 1px solid #e2e8f0; display: inline-block;">
                            <div class="mt-3">
                                <div class="spinner-border spinner-border-sm text-primary me-2" role="status"></div>
                                <span class="text-primary fw-bold" id="handover-payment-status">Äang chá» quÃ©t mÃ£...</span>
                            </div>
                            <div class="mt-3 pt-3 border-top d-flex justify-content-center gap-2">
                                <button type="button" class="btn btn-outline-success btn-sm" onclick="markHandoverPaid('Tiá»n máº·t')"><i class="fas fa-money-bill"></i> ÄÃ£ thu tiá»n máº·t</button>
                                <button type="button" class="btn btn-outline-primary btn-sm" onclick="markHandoverPaid('Chuyá»ƒn khoáº£n (XÃ¡c nháº­n tay)')"><i class="fas fa-university"></i> ÄÃ£ nháº­n CK</button>
                            </div>
                        </div>
                        <div id="handover-paid-container" style="display: none;">
                            <div class="py-4">
                                <i class="fas fa-check-circle text-success" style="font-size: 48px;"></i>
                                <h4 class="text-success fw-bold mt-3">ÄÃ£ Thanh ToÃ¡n</h4>
                                <p class="mb-0 text-muted" id="handover-paid-method"></p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Chá»¥p áº¢nh Section -->
                <div>
                    <h6 class="fw-bold mb-3 text-primary"><i class="fas fa-camera me-2"></i>2. Chá»¥p áº£nh tÃ¬nh tráº¡ng xe</h6>
                    <p class="small text-muted mb-2">Báº¯t buá»™c chá»¥p 5 gÃ³c Ä‘á»ƒ Ä‘á»‘i chiáº¿u khi tráº£ xe.</p>
                    <div class="row g-2" id="handover-photos">
                        <div class="col-4 col-md-2">
                            <label class="d-flex flex-column align-items-center justify-content-center border rounded p-2" style="height: 100px; cursor: pointer; background: #f8fafc; position: relative; overflow: hidden;">
                                <i class="fas fa-motorcycle text-muted mb-1"></i><small style="font-size: 11px;">Máº·t trÆ°á»›c</small>
                                <input type="file" name="photo1" accept="image/*" capture="environment" class="d-none" onchange="previewHandoverImg(this, 1)">
                                <img id="h-preview-1" src="" style="display:none; width:100%; height:100%; object-fit:cover; position:absolute; top:0; left:0; border-radius:inherit; z-index: 1;">
                            </label>
                        </div>
                        <div class="col-4 col-md-2">
                            <label class="d-flex flex-column align-items-center justify-content-center border rounded p-2" style="height: 100px; cursor: pointer; background: #f8fafc; position: relative; overflow: hidden;">
                                <i class="fas fa-motorcycle text-muted mb-1" style="transform: scaleX(-1);"></i><small style="font-size: 11px;">SÆ°á»n trÃ¡i</small>
                                <input type="file" name="photo2" accept="image/*" capture="environment" class="d-none" onchange="previewHandoverImg(this, 2)">
                                <img id="h-preview-2" src="" style="display:none; width:100%; height:100%; object-fit:cover; position:absolute; top:0; left:0; border-radius:inherit; z-index: 1;">
                            </label>
                        </div>
                        <div class="col-4 col-md-2">
                            <label class="d-flex flex-column align-items-center justify-content-center border rounded p-2" style="height: 100px; cursor: pointer; background: #f8fafc; position: relative; overflow: hidden;">
                                <i class="fas fa-motorcycle text-muted mb-1"></i><small style="font-size: 11px;">SÆ°á»n pháº£i</small>
                                <input type="file" name="photo3" accept="image/*" capture="environment" class="d-none" onchange="previewHandoverImg(this, 3)">
                                <img id="h-preview-3" src="" style="display:none; width:100%; height:100%; object-fit:cover; position:absolute; top:0; left:0; border-radius:inherit; z-index: 1;">
                            </label>
                        </div>
                        <div class="col-6 col-md-3">
                            <label class="d-flex flex-column align-items-center justify-content-center border rounded p-2" style="height: 100px; cursor: pointer; background: #f8fafc; position: relative; overflow: hidden;">
                                <i class="fas fa-id-card text-muted mb-1"></i><small style="font-size: 11px;">Biá»ƒn sá»‘ xe</small>
                                <input type="file" name="photo4" accept="image/*" capture="environment" class="d-none" onchange="previewHandoverImg(this, 4)">
                                <img id="h-preview-4" src="" style="display:none; width:100%; height:100%; object-fit:cover; position:absolute; top:0; left:0; border-radius:inherit; z-index: 1;">
                            </label>
                        </div>
                        <div class="col-6 col-md-3">
                            <label class="d-flex flex-column align-items-center justify-content-center border rounded p-2" style="height: 100px; cursor: pointer; background: #f8fafc; position: relative; overflow: hidden;">
                                <i class="fas fa-tachometer-alt text-muted mb-1"></i><small style="font-size: 11px;">Máº·t Ä‘á»“ng há»“</small>
                                <input type="file" name="photo5" accept="image/*" capture="environment" class="d-none" onchange="previewHandoverImg(this, 5)">
                                <img id="h-preview-5" src="" style="display:none; width:100%; height:100%; object-fit:cover; position:absolute; top:0; left:0; border-radius:inherit; z-index: 1;">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="border-top: 1px solid #e2e8f0; padding: 16px 24px;">
                <button type="button" class="btn btn-secondary" onclick="$('#handoverModal').modal('hide'); $('#user-form-modal').modal('show');">Quay láº¡i</button>
                <button type="button" class="btn btn-primary" id="btn-submit-handover" disabled onclick="submitHandover()" style="font-weight: 700; border-radius: 8px;">
                    <i class="fas fa-check me-2"></i>XÃ¡c Nháº­n BÃ n Giao
                </button>
            </div>
        </div>
    </div>
</div>

<script>
let handoverPollingInterval;
let isHandoverPaid = false;
let uploadedPhotoCount = 0;

function showHandoverModal() {
    var bId = $('#modal-bookingId').text().trim();
    var priceStr = $('#modal-Price').text().replace(/[^0-9]/g, '');
    var totalAmount = parseInt(priceStr) || 0;
    
    // Check if there's any payment made
    var paidStr = $('#modal-paymentInfo').text();
    var hasPaid = !paidStr.includes('ChÆ°a thanh toÃ¡n');
    
    $('#handover-bId').text(bId);
    
    // Reset modal state
    isHandoverPaid = hasPaid;
    uploadedPhotoCount = 0;
    for(let i=1; i<=5; i++) {
        $('#h-preview-' + i).hide().attr('src', '');
        $('input[name="photo'+i+'"]').val('');
    }
    checkHandoverReady();
    
    if (hasPaid) {
        $('#handover-qr-container').hide();
        $('#handover-paid-container').show();
        $('#handover-paid-method').text('PhÆ°Æ¡ng thá»©c: ' + $('#modal-paymentInfo').text());
    } else {
        // Assume deposit might be paid elsewhere, but here we assume total amount needs to be paid if status is Chua thanh toan
        $('#handover-qr-container').show();
        $('#handover-paid-container').hide();
        $('#handover-amount').text(totalAmount.toLocaleString('vi-VN'));
        var note = 'SMARTRIDE ' + bId;
        $('#handover-qr-note').text(note);
        
        // VCB 0943515000 as configured in sepay_pay.jsp
        var qrUrl = 'https://qr.sepay.vn/img?bank=MBB&acc=0943515000&template=compact&amount=' + totalAmount + '&des=' + encodeURIComponent(note);
        $('#handover-qr-img').attr('src', qrUrl);
        
        // Start polling
        if(handoverPollingInterval) clearInterval(handoverPollingInterval);
        handoverPollingInterval = setInterval(function() {
            fetch('${pageContext.request.contextPath}/api/check-payment?bookingId=' + bId)
            .then(r => r.json())
            .then(data => {
                if(data.status === 'success' && data.paid) {
                    markHandoverPaid('SePay Chuyá»ƒn khoáº£n');
                }
            });
        }, 3000);
    }
    
    $('#user-form-modal').modal('hide');
    $('#handoverModal').modal('show');
}

function markHandoverPaid(method) {
    if(handoverPollingInterval) clearInterval(handoverPollingInterval);
    isHandoverPaid = true;
    $('#handover-qr-container').hide();
    $('#handover-paid-container').show();
    $('#handover-paid-method').text('PhÆ°Æ¡ng thá»©c: ' + method);
    
    // Auto submit to approve manual invoice if needed
    if(method !== 'SePay Chuyá»ƒn khoáº£n') {
        var bId = $('#modal-bookingId').text().trim();
        fetch('${pageContext.request.contextPath}/manageBooking', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'manualPayment=true&bookingID=' + encodeURIComponent(bId)
        });
    }
    checkHandoverReady();
}

function compressImage(file, maxWidth, maxHeight, quality) {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(event) {
            const img = new Image();
            img.src = event.target.result;
            img.onload = function() {
                let width = img.width;
                let height = img.height;

                if (width > height) {
                    if (width > maxWidth) {
                        height = Math.round(height *= maxWidth / width);
                        width = maxWidth;
                    }
                } else {
                    if (height > maxHeight) {
                        width = Math.round(width *= maxHeight / height);
                        height = maxHeight;
                    }
                }

                const canvas = document.createElement('canvas');
                canvas.width = width;
                canvas.height = height;
                const ctx = canvas.getContext('2d');
                ctx.drawImage(img, 0, 0, width, height);

                canvas.toBlob((blob) => {
                    resolve(new File([blob], file.name, {
                        type: 'image/jpeg',
                        lastModified: Date.now()
                    }));
                }, 'image/jpeg', quality);
            };
            img.onerror = function(err) { reject(err); };
        };
        reader.onerror = function(err) { reject(err); };
    });
}

async function submitHandover() {
    var bId = $('#modal-bookingId').text().trim();
    var formData = new FormData();
    formData.append('bookingId', bId);
    
    $('#btn-submit-handover').html('<i class="fas fa-spinner fa-spin me-2"></i>Äang nÃ©n áº£nh & xá»­ lÃ½...').prop('disabled', true);
    
    try {
        for(let i=1; i<=5; i++) {
            var fileInput = document.querySelector('input[name="photo'+i+'"]');
            if(fileInput.files[0]) {
                // Compress image before upload (max 1200px, 80% quality)
                let compressedFile = await compressImage(fileInput.files[0], 1200, 1200, 0.8);
                formData.append('photo'+i, compressedFile);
            }
        }
        
        let response = await fetch('${pageContext.request.contextPath}/api/handover-upload', {
            method: 'POST',
            body: formData
        });
        let data = await response.json();
        
        if(data.status === 'success') {
            alert('BÃ n giao thÃ nh cÃ´ng! Tráº¡ng thÃ¡i Ä‘Ã£ chuyá»ƒn sang Äang thuÃª.');
            location.reload();
        } else {
            alert('Lá»—i: ' + data.message);
            $('#btn-submit-handover').html('<i class="fas fa-check me-2"></i>XÃ¡c Nháº­n BÃ n Giao').prop('disabled', false);
        }
    } catch (e) {
        alert('Lá»—i há»‡ thá»‘ng: ' + e);
        $('#btn-submit-handover').html('<i class="fas fa-check me-2"></i>XÃ¡c Nháº­n BÃ n Giao').prop('disabled', false);
    }
}

function previewHandoverImg(input, index) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = $('#h-preview-' + index);
            if(img.attr('src') === '') uploadedPhotoCount++;
            img.attr('src', e.target.result).show();
            checkHandoverReady();
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function checkHandoverReady() {
    if (isHandoverPaid && uploadedPhotoCount === 5) {
        $('#btn-submit-handover').prop('disabled', false);
    } else {
        $('#btn-submit-handover').prop('disabled', true);
    }
}

// ========================== CHAT LOGIC ==========================
let chatInterval = null;

function loadChatMessages() {
    var bId = $('#modal-bookingId').text().trim();
    if(!bId) return;
    
    fetch('${pageContext.request.contextPath}/api/chat?bookingId=' + bId)
    .then(r => r.json())
    .then(data => {
        let html = '';
        data.forEach(msg => {
            let isStaff = msg.senderRole === 'STAFF';
            let align = isStaff ? 'flex-end' : 'flex-start';
            let bgColor = isStaff ? '#3b82f6' : '#f1f5f9';
            let textColor = isStaff ? 'white' : '#1e293b';
            let borderRadius = isStaff ? '16px 16px 4px 16px' : '16px 16px 16px 4px';
            
            html += `
            <div style="display: flex; flex-direction: column; align-items: \${align}; margin-bottom: 8px;">
                <div style="font-size: 11px; color: #94a3b8; margin-bottom: 4px;">\${msg.senderName} â€¢ \${msg.sentAt}</div>
                <div style="background: \${bgColor}; color: \${textColor}; padding: 10px 16px; border-radius: \${borderRadius}; max-width: 80%; word-wrap: break-word;">
                    \${msg.message}
                </div>
            </div>`;
        });
        
        let container = $('#chat-messages-container');
        let shouldScroll = container[0].scrollHeight - container.scrollTop() <= container.outerHeight() + 50;
        
        container.html(html);
        
        if (shouldScroll || data.length === 0) {
            container.scrollTop(container[0].scrollHeight);
        }
    })
    .catch(console.error);
}

function sendChatMessage() {
    var bId = $('#modal-bookingId').text().trim();
    var msgInput = $('#chat-input');
    var text = msgInput.val().trim();
    
    if(!text || !bId) return;
    
    msgInput.val(''); // clear early
    
    fetch('${pageContext.request.contextPath}/api/chat', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({ bookingId: bId, message: text })
    })
    .then(r => r.json())
    .then(data => {
        if(data.status === 'success') {
            loadChatMessages(); // reload immediately
        }
    })
    .catch(console.error);
}

// Auto load chat and Auto open chat tab
$(document).ready(function() {
    // If URL has openChat=true and bookingId
    var urlParams = new URLSearchParams(window.location.search);
    if(urlParams.get('openChat') === 'true' && urlParams.get('bookingId')) {
        var bId = urlParams.get('bookingId');
        // Find the button with this bookingId and click it to open modal
        var btn = $('button[data-bookingid="'+bId+'"]');
        if(btn.length > 0) {
            btn[0].click();
            // Switch to chat tab
            setTimeout(function() {
                var triggerEl = document.querySelector('#chat-tab');
                bootstrap.Tab.getInstance(triggerEl)?.show() || new bootstrap.Tab(triggerEl).show();
            }, 500);
        }
    }
    
    // Setup polling when modal is open
    var modalEl = document.getElementById('user-form-modal');
    modalEl.addEventListener('show.bs.modal', function () {
        // Switch back to details tab by default
        var triggerEl = document.querySelector('#details-tab');
        bootstrap.Tab.getInstance(triggerEl)?.show() || new bootstrap.Tab(triggerEl).show();
        
        if (chatInterval) clearInterval(chatInterval);
        chatInterval = setInterval(loadChatMessages, 3000);
    });
    
    modalEl.addEventListener('hidden.bs.modal', function () {
        if (chatInterval) clearInterval(chatInterval);
    });
});

</script>

</html>
