<%-- 
    Document   : bookingHistory
    Created on : Jun 7, 2024, 12:15:49 AM
    Author     : huypd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Lịch sử thuê xe</title>
        <link href="css/sidebarProfile.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style type="text/css">
            .widget-author {
                margin-bottom: 58px;
            }

            .author-card {
                position: relative;
                padding-bottom: 48px;
                background-color: #fff;
                box-shadow: 0 12px 20px 1px rgba(64, 64, 64, .09);
            }

            .author-card .author-card-cover {
                position: relative;
                width: 100%;
                height: 100px;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }

            .author-card .author-card-cover::after {
                display: block;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                content: '';
                opacity: 0.5;
            }

            .author-card .author-card-cover>.btn {
                position: absolute;
                top: 12px;
                right: 12px;
                padding: 0 10px;
            }

            .author-card .author-card-profile {
                display: table;
                position: relative;
                margin-top: -22px;
                padding-right: 15px;
                padding-bottom: 16px;
                padding-left: 20px;
                z-index: 5;
            }

            .author-card .author-card-profile .author-card-avatar,
            .author-card .author-card-profile .author-card-details {
                display: table-cell;
                vertical-align: middle;
            }

            .author-card .author-card-profile .author-card-avatar {
                width: 85px;
                border-radius: 50%;
                box-shadow: 0 8px 20px 0 rgba(0, 0, 0, .15);
                overflow: hidden;
            }

            .author-card .author-card-profile .author-card-avatar>img {
                display: block;
                width: 100%;
            }

            .author-card .author-card-profile .author-card-details {
                padding-top: 20px;
                padding-left: 15px;
            }

            .author-card .author-card-profile .author-card-name {
                margin-bottom: 2px;
                font-size: 14px;
                font-weight: bold;
            }

            .author-card .author-card-profile .author-card-position {
                display: block;
                color: #8c8c8c;
                font-size: 12px;
                font-weight: 600;
            }

            .author-card .author-card-info {
                margin-bottom: 0;
                padding: 0 25px;
                font-size: 13px;
            }

            .author-card .author-card-social-bar-wrap {
                position: absolute;
                bottom: -18px;
                left: 0;
                width: 100%;
            }

            .author-card .author-card-social-bar-wrap .author-card-social-bar {
                display: table;
                margin: auto;
                background-color: #fff;
                box-shadow: 0 12px 20px 1px rgba(64, 64, 64, .11);
            }

            .btn-style-1.btn-white {
                background-color: #fff;
            }

            .list-group-item i {
                display: inline-block;
                margin-top: -1px;
                margin-right: 8px;
                font-size: 1.2em;
                vertical-align: middle;
            }

            .mr-1,
            .mx-1 {
                margin-right: .25rem !important;
            }

            .list-group-item.active:not(.disabled) {
                border-color: #e7e7e7;
                background: #fff;
                color: #ac32e4;
                cursor: default;
                pointer-events: none;
            }

            .list-group-flush:last-child .list-group-item:last-child {
                border-bottom: 0;
            }

            .list-group-flush .list-group-item {
                border-right: 0 !important;
                border-left: 0 !important;
            }

            .list-group-flush .list-group-item {
                border-right: 0;
                border-left: 0;
                border-radius: 0;
            }

            .list-group-item.active {
                z-index: 2;
                color: #fff;
                background-color: #007bff;
                border-color: #007bff;
            }
             .list-group-item.active:not(.disabled) {
            border-color: #e7e7e7;
            background: #fff;
            color: #ac32e4;
            pointer-events: none;
        }

            .list-group-item:last-child {
                margin-bottom: 0;
                border-bottom-right-radius: .25rem;
                border-bottom-left-radius: .25rem;
            }

            a.list-group-item,
            .list-group-item-action {
                color: #404040;
                font-weight: 600;
            }

            .list-group-item {
                padding-top: 16px;
                padding-bottom: 16px;
                -webkit-transition: all .3s;
                transition: all .3s;
                border: 1px solid #e7e7e7 !important;
                border-radius: 0 !important;
                color: #404040;
                font-size: 12px;
                font-weight: 600;
                letter-spacing: .08em;
                text-transform: uppercase;
                text-decoration: none;
            }

            .list-group-item {
                position: relative;
                display: block;
                padding: .75rem 1.25rem;
                margin-bottom: -1px;
                background-color: #fff;
                border: 1px solid rgba(0, 0, 0, 0.125);
            }

            .list-group-item.active:not(.disabled)::before {
                background-color: #ac32e4;
            }

            .list-group-item::before {
                display: block;
                position: absolute;
                top: 0;
                left: 0;
                width: 3px;
                height: 100%;
                background-color: transparent;
                content: '';
            }

            .input-with-button {
                position: relative;
                display: flex;
                align-items: center;
            }

            .input-with-button input {
                padding-right: 80px;
            }

            .input-with-button button {
                position: absolute;
                right: 10px;
                padding: 5px 10px;
                font-size: 12px;
                height: calc(100% - 10px);
                top: 5px;
            }
            .tabs-container {
                background-color: #f8f9fa; /* Màu nền của thanh chọn */
                border: 1px solid #ddd; /* Đường viền của thanh chọn */
            }

            .tab {
                padding: 10px 20px;
                cursor: pointer;
                background-color: #ffffff; /* Màu nền của từng tab */
                border-right: 1px solid #ddd; /* Đường viền giữa các tab */
                text-align: center;
                flex: 1; /* Đảm bảo các tab có kích thước đều nhau */
            }

            .tab:last-child {
                border-right: none; /* Loại bỏ đường viền phải của tab cuối cùng */
            }

            .tab:hover {
                background-color: #e9ecef; /* Màu nền khi hover */
            }

            .tab.active {
                background-color: #007bff; /* Màu nền của tab đang hoạt động */
                color: #ffffff; /* Màu chữ của tab đang hoạt động */
            }

            .booking-history h1 {
                margin-bottom: 1rem;
            }

            .filters {
                margin-bottom: 1rem;
            }

            .filters .filter-btn {
                padding: 0.5rem 1rem;
                margin-right: 0.5rem;
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                color: #fff;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }

            .filters .filter-btn:hover {
                background: linear-gradient(243.4deg, rgb(0, 132, 255) 13%, rgb(8, 126, 120) 98%) !important;
            }

            .confirmed-filters {
                display: none;
                margin-bottom: 1rem;
            }

            .confirmed-filters label {
                margin-right: 0.5rem;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            table thead th {
                background-color: #007BFF;
                color: #fff;
                padding: 0.75rem;
                text-align: left;
            }

            table tbody tr {
                background-color: #fff;
                border-bottom: 1px solid #ccc;
            }

            table tbody tr:nth-child(even) {
                background-color: #f4f4f9;
            }

            table tbody td {
                padding: 0.75rem;
            }

            .detail-btn {
                padding: 0.5rem 1rem;
                background-color: #28a745;
                color: #fff;
                border: none;
                cursor: pointer;
            }

            .detail-btn:hover {
                background-color: #218838;
            }
            .col-table {
                background: #fff;
                color: #000;
            }
            .filter-btn.active {
                opacity: 0.7; /* hoặc bất kỳ thuộc tính CSS nào bạn muốn áp dụng */
                border: 5px solid #333; /* ví dụ cho border */
            }

        /* Simplified Sidebar */
        .sidebar-item {
            padding: 0.75rem 1rem;
            margin: 0.2rem 1rem;
            display: flex;
            align-items: center;
            border-radius: 0.5rem;
            transition: all 0.2s ease;
            color: #64748b;
        }
        .sidebar-item:hover {
            background-color: #f1f5f9;
        }
        .sidebar-item.active {
            background-color: #fdf8eb; /* very light gold */
            color: #b59349;
            font-weight: 600;
        }
        .icon-box {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            width: 32px;
            height: 32px;
            border-radius: 0.5rem;
            background-color: #f1f5f9;
            color: #64748b;
        }
        .sidebar-item.active .icon-box {
            background-color: #b59349;
            color: #ffffff;
        }
        .nav-text {
            font-size: 0.9rem;
        }
        .sidebar-heading {
            padding-left: 1.5rem;
            font-weight: 700;
            text-transform: uppercase;
            font-size: 0.75rem;
            color: #94a3b8;
            margin-top: 1.5rem;
            margin-bottom: 0.5rem;
        }

        </style>
    </head>
    <jsp:include page="/includes/customer/navbar.jsp" />
    <body class="  font-body " data-framework="tailwind">
        <link href="https://www.loopple.com/css/vendor/tailwind.min.css" rel="stylesheet">
        <link href="https://www.loopple.com/css/tailwind/app.css?v=1.0.0" rel="stylesheet">
        <link href="" id="google-font-url" rel="stylesheet">
        <!-- CSS Links -->
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/sidebarProfile.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link href="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/css/nucleo-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/css/soft-ui-dashboard-tailwind.css">
        <div class="builder-container builder-container-preview  font-body ">
                    <aside class="max-w-62.5 ease-nav-brand z-990 absolute inset-y-0 my-4 ml-4 block w-full -translate-x-full flex-wrap items-center justify-between overflow-y-auto rounded-2xl border-0 p-0 antialiased shadow-none transition-transform duration-200 xl:left-0 xl:translate-x-0 xl:bg-transparent text-slate-500"
                           id="sidenav-main">
                        <hr class="h-px mt-0 bg-transparent bg-gradient-horizontal-dark">
                        <div style="margin-top: 6rem" class="items-center block w-auto max-h-screen overflow-auto grow basis-full">
                            <ul class="flex flex-col pl-0 mb-0">
                                <li class="w-full">
                                    <div class="sidebar-heading">Quản lý thuê xe</div>
                                </li>
                                <li class="w-full"> 
                                    <a class="sidebar-item" href="transaction">
                                        <div class="icon-box">
                                            <i class="fas fa-credit-card text-xs"></i>
                                        </div> 
                                        <span class="nav-text">Giao dịch gần đây</span>
                                    </a> 
                                </li>
                                <li class="w-full"> 
                                    <a class="sidebar-item active" href="javascript:;">
                                        <div class="icon-box">
                                            <i class="fas fa-history text-xs"></i>
                                        </div> 
                                        <span class="nav-text">Lịch sử thuê xe</span>
                                    </a> 
                                </li>
                                <li class="w-full">
                                    <div class="sidebar-heading">Quản lý tài khoản</div>
                                </li>
                                <li class="w-full"> 
                                    <a class="sidebar-item" href="profileCustomer.jsp">
                                        <div class="icon-box">
                                            <i class="fas fa-user-circle text-xs"></i>
                                        </div> 
                                        <span class="nav-text">Thông tin cá nhân</span>
                                    </a> 
                                </li>
                                <li class="w-full"> 
                                    <a class="sidebar-item" href="settingsProfile.jsp">
                                        <div class="icon-box">
                                            <i class="fas fa-shield-alt text-xs"></i>
                                        </div> 
                                        <span class="nav-text">Mật khẩu và bảo mật</span>
                                    </a> 
                                </li>
                            </ul>
                        </div>
                    </aside>
                    <div style="width: 83.666667%;" class="col-lg-8 pb-5">
                        <div class="filters flex gap-2"> 
                            <button class="filter-btn" data-filter="all" onclick="applyFilter('all')">Tất cả</button>
                            <button class="filter-btn" data-filter="pending" onclick="applyFilter('pending')">Chờ xác nhận</button>
                            <button class="filter-btn" data-filter="confirmed" onclick="applyFilter('confirmed')">Đã xác nhận</button>
                            <button class="filter-btn" data-filter="cancelled" onclick="applyFilter('cancelled')">Đã hủy</button>
                        </div>
                        <div class="confirmed-filters" id="confirmed-filters">
                            <label for="confirmed-status">Đã xác nhận:</label>
                            <select id="confirmed-status" class="ml-2">
                                <option value="all" <c:if test="${empty deliveryStatus || 'all' eq deliveryStatus}">selected</c:if>>Tất cả trạng thái</option>
                                <option value="notDelivered" <c:if test="${'notDelivered' eq deliveryStatus}">selected</c:if>>Chưa giao</option>
                                <option value="delivered" <c:if test="${'delivered' eq deliveryStatus}">selected</c:if>>Đã giao</option>
                                <option value="returned" <c:if test="${'returned' eq deliveryStatus}">selected</c:if>>Đã trả</option>
                                </select>
                            </div>
                            <div class="flex flex-wrap -mx-3 drop-zone">
                                <div style="position: relative;" class="table-responsive">
                                    <table class="caption-top min-w-full table-auto table-hover table-borderless table-striped" id="booking-table">
                                        <caption class="caption-top">Lịch sử thuê xe</caption>
                                        <thead style="border: 1px solid">
                                            <tr>
                                                <th scope="col" class="col-table px-8 py-2">Mã đơn</th>
                                                <th scope="col" class="col-table px-6 py-2">Ngày bắt đầu</th>
                                                <th scope="col" class="col-table px-10 py-2">Ngày trả xe</th>
                                                <th scope="col" class="col-table px-6 py-2">Số lượng xe</th>
                                                <th scope="col" class="col-table px-8 py-2">Trạng thái</th>
                                                <th scope="col" class="col-table px-10 py-2">Giá</th>
                                                <th scope="col" class="col-table px-6 py-2"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${empty listB}">
                                            <tr>
                                                <td colspan="7" class="text-center italic py-4 text-lg">Không có thông tin Booking nào ở đây</td>
                                            </tr>
                                        </c:if>
                                        <c:forEach items="${listB}" var="o">
                                            <tr class="${status}">
                                                <td class="px-8 py-2">${o.bookingID}</td>
                                                <td class="px-6 py-2">
                                                    <c:set var="startDate" value="${o.startDate}" />
                                                    <c:set var="startYear" value="${fn:substring(startDate, 0, 4)}" />
                                                    <c:set var="startMonth" value="${fn:substring(startDate, 5, 7)}" />
                                                    <c:set var="startDay" value="${fn:substring(startDate, 8, 10)}" />
                                                    ${startDay}-${startMonth}-${startYear}
                                                </td>

                                                <td class="px-10 py-2">
                                                    <c:set var="endDate" value="${o.endDate}" />
                                                    <c:set var="endYear" value="${fn:substring(endDate, 0, 4)}" />
                                                    <c:set var="endMonth" value="${fn:substring(endDate, 5, 7)}" />
                                                    <c:set var="endDay" value="${fn:substring(endDate, 8, 10)}" />
                                                    ${endDay}-${endMonth}-${endYear}
                                                </td>
                                                <td class="px-6 py-2">${fn:length(o.listBookingDetails)}</td>
                                                <td class="px-8 py-2">${o.statusBooking}</td>
                                                <td class="px-10 py-2">
                                                    <c:set var="total" value="0"/>
                                                    <c:forEach items="${o.listBookingDetails}" var="detail">
                                                        <c:set var="total" value="${total + detail.totalPrice}"/>
                                                    </c:forEach>
                                                    <fmt:formatNumber value="${total*1000}" type="currency" currencySymbol="VNĐ" />
                                                </td>
                                                <td class="px-6 py-2 text-center">
                                                    <a href="bookingHistoryDetail?bookingId=${o.bookingID}" class="btn btn-info" title="View" data-toggle="tooltip" onclick="showBookingDetail(this)" data-original-title="View">
                                                        <i class="fa fa-eye"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr class="text-right">
                                                <td colspan="7" class="px-4 py-2">
                                                    <input type="hidden" name="bookingId" value="${o.bookingID}" />
                                                    <c:set var="feedback" value="${feedbackMap[o.bookingID]}"/>
                                                    <c:choose>
                                                        <c:when test="${not empty feedback}">
                                                            <c:if test="${(status == 'all' && o.statusBooking == 'Đã xác nhận' && o.deliveryStatus == 'Đã trả') || ((status == 'confirmed') && (o.deliveryStatus == 'Đã trả'))}">
                                                                <a style="color: green" id="view-review-button" class="text-decoration-none italic" href="feedback?bookingId=${o.bookingID}">Xem đánh giá</a>
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${(status == 'all' && o.statusBooking == 'Đã xác nhận' && o.deliveryStatus == 'Đã trả') || ((status == 'confirmed') && (o.deliveryStatus != 'Đã trả'))}">
                                                                <a style="color: red" id="write-review-button" class="text-decoration-none italic" href="feedback?bookingId=${o.bookingID}">Viết đánh giá</a>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
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
        </div>
        <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/chartjs.min.js"></script>
        <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/perfect-scrollbar.min.js"
        async=""></script>
        <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
        <script
            src="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/js/soft-ui-dashboard-tailwind.js"
        async=""></script>
        <script>
                                                        document.addEventListener("DOMContentLoaded", () => {
                                                            initializeFilters();
                                                        });

                                                        // Initialize filters and add event listeners
                                                        function initializeFilters()
                                                        {
                                                            const confirmedFilters = document.getElementById("confirmed-filters");
                                                            const confirmedStatusSelect = document.getElementById("confirmed-status");

                                                            // Add event listeners to filter buttons
                                                            document.querySelectorAll(".filter-btn").forEach(button => {
                                                                button.addEventListener("click", () => {
                                                                    const filter = button.getAttribute("data-filter");
                                                                    applyFilter(filter);
                                                                    confirmedFilters.style.display = "none";
                                                                    window.location.href = "bookingHistory?status=" + filter;


                                                                });
                                                            });
                                                            checkURL();
 

                                                            // Add event listener to confirmed status select
                                                            confirmedStatusSelect.addEventListener("change", () => {
                                                                const filter = confirmedStatusSelect.value;
                                                                applyConfirmedFilter(filter);
                                                                window.location.href = "bookingHistory?status=confirmed&deliveryStatus=" + filter;
                                                            });
                                                        }

                                                        function checkURL() {
                                                            const currentURL = window.location.href;
                                                            if (currentURL.includes('bookingHistory?status=confirmed')) {
                                                                document.getElementById("confirmed-filters").style.display = 'block';
                                                            }
                                                        }

                                                        // Apply filter for confirmed status
                                                        function applyConfirmedFilter(filter) {
                                                            document.querySelectorAll("#booking-table tbody tr.confirmed").forEach(row => {
                                                                if (filter === "all" || row.classList.contains(filter)) {
                                                                    row.style.display = "";
                                                                } else {
                                                                    row.style.display = "none";
                                                                }
                                                            });
                                                        }
                                                        // Apply filter based on the status (all, pending, confirmed, cancelled)
                                                        function applyFilter(filter) {
                                                            document.querySelectorAll("#booking-table tbody tr").forEach(row => {
                                                                if (filter === "all" || row.classList.contains(filter)) {
                                                                    row.style.display = "";
                                                                } else {
                                                                    row.style.display = "none";
                                                                }
                                                            });

                                                        }
        </script>
    </body>
</html>
