<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.smartride.dao.EventDAO" %>
<%@ page import="com.smartride.dto.Event" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Event activeEvent = EventDAO.getInstance().getActiveEvent();
    request.setAttribute("activeEvent", activeEvent);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bảng giá</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            body {
                background-color: #fbfaf8 !important;
                color: #2b2824 !important;
                font-family: "Plus Jakarta Sans", sans-serif !important;
            }
            .ftco-section {
                background-color: #fbfaf8 !important;
                padding: 120px 0 80px 0 !important;
            }
            .section-title {
                text-align: center;
                padding-bottom: 30px;
                position: relative;
            }
            .section-title h2 {
                color: #1a1816 !important;
                font-family: 'Playfair Display', Georgia, serif !important;
                font-weight: 800;
                letter-spacing: 2px;
                text-align: center;
                margin-top: 15px;
                text-transform: uppercase;
                position: relative;
                z-index: 2;
            }
            .section-title span {
                color: rgba(181, 147, 73, 0.06) !important;
                font-family: 'Playfair Display', Georgia, serif !important;
                font-weight: 800;
                font-size: 56px;
                text-transform: uppercase;
                text-align: center;
                letter-spacing: 4px;
                position: absolute;
                top: -10px;
                left: 0;
                right: 0;
                z-index: 1;
            }
            /* Table Styling */
            .table {
                background-color: #ffffff !important;
                border: 1px solid #eae6df !important;
                border-radius: 12px !important;
                overflow: hidden;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.03) !important;
            }
            .table thead th {
                border: none !important;
                color: #ffffff !important;
                font-weight: 700 !important;
                padding: 22px 15px !important;
                font-size: 15px;
                background-color: #2b2824; /* Dark warm charcoal */
            }
            .timeline1 {
                background: #b59349 !important; /* Brand Gold */
                color: #ffffff !important;
                border-bottom: 3px solid #9c7c3b !important;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }
            .timeline2 {
                background: #9c7c3b !important; /* Warm Bronze */
                color: #ffffff !important;
                border-bottom: 3px solid #82662c !important;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }
            .timeline3 {
                background: #82662c !important; /* Deep Bronze */
                color: #ffffff !important;
                border-bottom: 3px solid #6b5321 !important;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }
            .tablePrice {
                background-color: #ffffff !important;
                border-bottom: 1px solid #eae6df !important;
                transition: all 0.3s ease;
            }
            .tablePrice:hover {
                background-color: #fbfaf8 !important;
            }
            .tablePrice td {
                vertical-align: middle !important;
                padding: 25px 15px !important;
                border: none !important;
            }
            .product-name h3 {
                color: #1a1816 !important;
                font-family: 'Playfair Display', Georgia, serif !important;
                font-size: 20px;
                font-weight: 700;
                margin: 0;
            }
            .price-rate h3 {
                color: #b59349 !important;
                font-weight: 700;
                font-size: 22px;
                margin-top: 10px;
                margin-bottom: 5px;
            }
            .price-rate h3 .per {
                color: #666666 !important;
                font-size: 14px;
            }
            .price-rate .subheading {
                color: #999999 !important;
                font-size: 12px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            .rentalNow {
                transition: all 0.3s ease !important;
                background-color: transparent !important;
            }
            .rentalNow:hover {
                background-color: rgba(181, 147, 73, 0.03) !important;
            }
            .rentalButton a {
                background: #b59349 !important;
                color: #ffffff !important;
                font-weight: 700 !important;
                border-radius: 50px !important;
                padding: 10px 24px !important;
                transition: all 0.3s ease !important;
                text-transform: uppercase;
                font-size: 12px;
                letter-spacing: 1px;
                display: inline-block;
                border: none !important;
            }
            .rentalButton a:hover {
                background: #a38241 !important;
                color: #ffffff !important;
                box-shadow: 0 5px 15px rgba(181, 147, 73, 0.25) !important;
                transform: translateY(-2px);
            }
            
            .banner-image img {
                object-fit: contain;
                max-height: 120px;
                filter: drop-shadow(0 5px 15px rgba(0,0,0,0.05));
                transition: transform 0.3s ease;
            }
            .tablePrice:hover .banner-image img {
                transform: scale(1.08);
            }

            .pagination-container {
                display: flex;
                justify-content: center;
                margin-top: 40px;
                margin-bottom: 40px;
            }
            
            .pagination {
                display: flex;
                list-style: none;
                padding: 0;
            }
            
            .pagination li {
                margin: 0 5px;
            }
            
            /* Pagination overrides */
            .pagination li a {
                display: block;
                padding: 10px 18px;
                text-decoration: none;
                background-color: #ffffff !important;
                border: 1px solid #eae6df !important;
                color: #2b2824 !important;
                transition: all 0.3s ease !important;
                border-radius: 5px;
            }
            .pagination li.active a {
                background-color: #b59349 !important;
                color: #ffffff !important;
                border-color: #b59349 !important;
                font-weight: bold;
            }
            .pagination li a:hover:not(.active) {
                background-color: rgba(212, 175, 55, 0.1) !important;
                color: #d4af37 !important;
                border-color: #d4af37 !important;
            }
            /* Disable table row hover green color from default style.css */
            .table tbody tr td.price:hover.price {
                background: transparent !important;
            }
            .tablePrice:hover {
                background-color: #fcfbf9 !important;
            }
            
            /* Always display price-rate and button cleanly in block layout */
            .table tbody tr td.price .price-rate {
                opacity: 1 !important;
                display: block !important;
                margin-bottom: 5px !important;
            }
            .table tbody tr td.price:hover .price-rate {
                opacity: 1 !important;
            }
            .table tbody tr td.price .btn-custom {
                position: static !important;
                transform: none !important;
                opacity: 1 !important;
                display: block !important;
                margin-top: 10px !important;
            }
            .table tbody tr td.price:hover .btn-custom {
                opacity: 1 !important;
            }
            
            /* High-end badge styling for total calculations */
            .subheading-badge {
                display: inline-block !important;
                padding: 5px 14px !important;
                border-radius: 30px !important;
                font-size: 11px !important;
                font-weight: 700 !important;
                letter-spacing: 0.5px !important;
                text-transform: uppercase !important;
                margin-top: 8px !important;
                border: 1px solid transparent !important;
            }
            .badge-day {
                background-color: #f4f3f0 !important;
                color: #666666 !important;
            }
            .badge-week {
                background-color: rgba(181, 147, 73, 0.08) !important;
                color: #b59349 !important;
                border-color: rgba(181, 147, 73, 0.15) !important;
            }
            .badge-month {
                background-color: rgba(130, 102, 44, 0.08) !important;
                color: #82662c !important;
                border-color: rgba(130, 102, 44, 0.15) !important;
            }
            
            /* Premium Button Styling */
            .rentalButton a {
                background: #b59349 !important;
                color: #ffffff !important;
                font-weight: 700 !important;
                border-radius: 50px !important;
                padding: 10px 24px !important;
                transition: all 0.3s ease !important;
                text-transform: uppercase;
                font-size: 11px !important;
                letter-spacing: 0.8px !important;
                display: inline-block !important;
                border: 1px solid #b59349 !important;
                box-shadow: 0 4px 12px rgba(181, 147, 73, 0.15) !important;
                margin-top: 8px !important;
            }
            .rentalButton a:hover {
                background: #2b2824 !important;
                color: #ffffff !important;
                border-color: #2b2824 !important;
                box-shadow: 0 6px 18px rgba(43, 40, 36, 0.25) !important;
                transform: translateY(-2px);
            }

        </style>
    </head>
    <body>

        <jsp:include page="/includes/customer/navbar.jsp" />
        <section class="ftco-section ftco-cart">
            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <span>Bảng giá xe máy<br></span>
                <h2>Bảng giá xe máy</h2>
            </div><!-- End Section Title -->
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="car-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th class="timeline1">Thuê theo ngày</th>
                                        <th class="timeline2">Thuê theo tuần</th>
                                        <th class="timeline3">Thuê theo tháng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listM}" var="m">
                                        <tr class="tablePrice">
                                            <c:forEach items="${listP}" var="p">
                                                <c:if test="${p.priceListId == m.priceListID}">
                                                    <td class="car-image">
                                                        <div class="img banner-image">
                                                            <img src="${empty m.image ? 'images/default.jpg' : (m.image.startsWith('http') ? m.image : 'images/'.concat(m.image))}" width="100%" height="100%" alt="alt"/>
                                                        </div></td>
                                                    <td class="product-name">
                                                        <h3>${m.model}</h3>
                                                    </td>

                                                    <td class="price rentalNow">
                                                        <div class="price-rate">
                                                            <div style="margin-bottom: 8px;">
                                                                <c:choose>
                                                                    <c:when test="${not empty activeEvent and activeEvent.discount > 0}">
                                                                        <div style="font-size: 14px; color: #999; text-decoration: line-through;">
                                                                            <fmt:formatNumber value="${p.dailyPriceForDay * 1000}" type="number" groupingUsed="true" /> VNĐ
                                                                        </div>
                                                                        <div style="color: #dc2626; font-size: 12px; font-weight: bold; background: #fee2e2; padding: 2px 6px; border-radius: 4px; display: inline-block; margin-bottom: 5px;">
                                                                            Giảm <fmt:formatNumber value="${activeEvent.discount * 100}" maxFractionDigits="0"/>%
                                                                        </div><br/>
                                                                        <span style="font-size: 24px; font-weight: 800; color: #b59349 !important; font-family: 'Poppins', sans-serif;"><fmt:formatNumber value="${p.dailyPriceForDay * (1 - activeEvent.discount) * 1000}" type="number" groupingUsed="true" /> VNĐ</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span style="font-size: 24px; font-weight: 800; color: #b59349 !important; font-family: 'Poppins', sans-serif;"><fmt:formatNumber value="${p.dailyPriceForDay * 1000}" type="number" groupingUsed="true" /> VNĐ</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <span style="font-size: 14px; color: #7a756c; font-weight: 500; margin-left: 2px;">/ ngày</span>
                                                            </div>
                                                            <span class="subheading-badge badge-day">Thuê ngày lẻ</span>
                                                        </div>
                                                        <p class="btn-custom rentalButton" style="margin-top: 15px !important;"><a href="booking?motorcycleid=${m.motorcycleId}">Thuê xe máy</a></p>
                                                    </td>

                                                    <td class="price rentalNow">
                                                        <div class="price-rate">
                                                            <div style="margin-bottom: 8px;">
                                                                <c:choose>
                                                                    <c:when test="${not empty activeEvent and activeEvent.discount > 0}">
                                                                        <div style="font-size: 14px; color: #999; text-decoration: line-through;">
                                                                            <fmt:formatNumber value="${p.dailyPriceForWeek * 1000}" type="number" groupingUsed="true" /> VNĐ
                                                                        </div>
                                                                        <div style="color: #dc2626; font-size: 12px; font-weight: bold; background: #fee2e2; padding: 2px 6px; border-radius: 4px; display: inline-block; margin-bottom: 5px;">
                                                                            Giảm <fmt:formatNumber value="${activeEvent.discount * 100}" maxFractionDigits="0"/>%
                                                                        </div><br/>
                                                                        <span style="font-size: 24px; font-weight: 800; color: #b59349 !important; font-family: 'Poppins', sans-serif;"><fmt:formatNumber value="${p.dailyPriceForWeek * (1 - activeEvent.discount) * 1000}" type="number" groupingUsed="true" /> VNĐ</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span style="font-size: 24px; font-weight: 800; color: #b59349 !important; font-family: 'Poppins', sans-serif;"><fmt:formatNumber value="${p.dailyPriceForWeek * 1000}" type="number" groupingUsed="true" /> VNĐ</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <span style="font-size: 14px; color: #7a756c; font-weight: 500; margin-left: 2px;">/ ngày</span>
                                                            </div>
                                                            <span class="subheading-badge badge-week">Tổng: <c:choose><c:when test="${not empty activeEvent and activeEvent.discount > 0}"><fmt:formatNumber value="${p.dailyPriceForWeek * (1 - activeEvent.discount) * 1000 * 7}" type="number" groupingUsed="true" /></c:when><c:otherwise><fmt:formatNumber value="${p.dailyPriceForWeek * 1000 * 7}" type="number" groupingUsed="true" /></c:otherwise></c:choose> VNĐ/tuần</span>
                                                        </div>
                                                        <p class="btn-custom rentalButton" style="margin-top: 15px !important;"><a href="booking?motorcycleid=${m.motorcycleId}">Thuê xe máy</a></p>
                                                    </td>

                                                    <td class="price rentalNow">
                                                        <div class="price-rate">
                                                            <div style="margin-bottom: 8px;">
                                                                <c:choose>
                                                                    <c:when test="${not empty activeEvent and activeEvent.discount > 0}">
                                                                        <div style="font-size: 14px; color: #999; text-decoration: line-through;">
                                                                            <fmt:formatNumber value="${p.dailyPriceForMonth * 1000}" type="number" groupingUsed="true" /> VNĐ
                                                                        </div>
                                                                        <div style="color: #dc2626; font-size: 12px; font-weight: bold; background: #fee2e2; padding: 2px 6px; border-radius: 4px; display: inline-block; margin-bottom: 5px;">
                                                                            Giảm <fmt:formatNumber value="${activeEvent.discount * 100}" maxFractionDigits="0"/>%
                                                                        </div><br/>
                                                                        <span style="font-size: 24px; font-weight: 800; color: #b59349 !important; font-family: 'Poppins', sans-serif;"><fmt:formatNumber value="${p.dailyPriceForMonth * (1 - activeEvent.discount) * 1000}" type="number" groupingUsed="true" /> VNĐ</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span style="font-size: 24px; font-weight: 800; color: #b59349 !important; font-family: 'Poppins', sans-serif;"><fmt:formatNumber value="${p.dailyPriceForMonth * 1000}" type="number" groupingUsed="true" /> VNĐ</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <span style="font-size: 14px; color: #7a756c; font-weight: 500; margin-left: 2px;">/ ngày</span>
                                                            </div>
                                                            <span class="subheading-badge badge-month">Tổng: <c:choose><c:when test="${not empty activeEvent and activeEvent.discount > 0}"><fmt:formatNumber value="${p.dailyPriceForMonth * (1 - activeEvent.discount) * 1000 * 30}" type="number" groupingUsed="true" /></c:when><c:otherwise><fmt:formatNumber value="${p.dailyPriceForMonth * 1000 * 30}" type="number" groupingUsed="true" /></c:otherwise></c:choose> VNĐ/tháng</span>
                                                        </div>
                                                        <p class="btn-custom rentalButton" style="margin-top: 15px !important;"><a href="booking?motorcycleid=${m.motorcycleId}">Thuê xe máy</a></p>
                                                    </td>


                                                </tr><!-- END TR-->
                                            </c:if>
                                        </c:forEach> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="pagination-container">
                    <ul class="pagination">
                        <c:if test="${tag > 1}">
                            <li><a href="pricing?index=${tag - 1}">&laquo;</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${endP}" var="i">
                            <li class="${tag == i ? 'active' : ''}"><a href="pricing?index=${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${tag < endP}">
                            <li><a href="pricing?index=${tag + 1}">&raquo;</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            </div>
        </section>


        <jsp:include page="/includes/customer/footer.jsp" />



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
