<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.smartride.dao.MotorcycleDAO" %>
<%@ page import="com.smartride.dao.PriceListDAO" %>
<%@ page import="com.smartride.dto.Motorcycle" %>
<%@ page import="com.smartride.dto.PriceList" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Legendary J2EE Hot-Swap Hack: 
    // If the session list is empty, stale, or has only 1 bike, query the database dynamically at runtime
    // to populate the Related Vehicles slider with abundant, rich data without restarting the server!
    if (session.getAttribute("listM") == null || ((List)session.getAttribute("listM")).size() <= 1) {
        List<Motorcycle> listM = MotorcycleDAO.getInstance().getMotorcycles();
        session.setAttribute("listM", listM);
    }
    if (session.getAttribute("listP") == null) {
        List<PriceList> listP = PriceListDAO.getInstance().getAllPriceList();
        session.setAttribute("listP", listP);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Centered Swiper Related Vehicles Carousel</title>
        <!-- Swiper CSS -->
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <!-- Modern Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&display=swap" rel="stylesheet">
        
        <style>
            body {
                background: transparent !important;
                margin: 0;
                padding: 0;
                font-family: 'Be Vietnam Pro', sans-serif !important;
                overflow: hidden;
            }
            
            /* Swiper Customizations */
            .swiper-container-wrapper {
                padding: 20px 0 60px 0;
            }
            .swiper-wrapper {
                transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1) !important;
            }
            
            /* Swiper Slide / Card */
            .swiper-slide {
                border-radius: 24px !important;
                background: #ffffff !important;
                border: 1px solid rgba(0, 0, 0, 0.05) !important;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.04) !important;
                transition: all 0.4s cubic-bezier(0.25, 1, 0.5, 1) !important;
                overflow: hidden;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                height: auto;
            }
            .swiper-slide:hover {
                transform: translateY(-10px);
                border-color: rgba(184, 146, 40, 0.3) !important;
                background: #ffffff !important;
                box-shadow: 0 20px 40px rgba(184, 146, 40, 0.08) !important;
            }
            
            /* Card Layout */
            .card-inner-wrapper {
                display: flex;
                flex-direction: column;
                height: 100%;
                width: 100%;
            }
            .card-img-link {
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 30px 20px 10px 20px;
                background: #fcfcfc;
                overflow: hidden;
                height: 220px;
                text-decoration: none;
                border-bottom: 1px solid rgba(0, 0, 0, 0.02);
            }
            .card-img-glow {
                position: absolute;
                width: 150px;
                height: 150px;
                background: radial-gradient(circle, rgba(184, 146, 40, 0.05) 0%, rgba(184, 146, 40, 0) 70%);
                filter: blur(20px);
                pointer-events: none;
            }
            .card-img {
                max-width: 90%;
                max-height: 180px;
                object-fit: contain;
                filter: drop-shadow(0 10px 20px rgba(0,0,0,0.06));
                transition: transform 0.5s cubic-bezier(0.25, 1, 0.5, 1);
            }
            .swiper-slide:hover .card-img {
                transform: scale(1.06) translateY(-5px);
            }
            
            .card-info-pane {
                padding: 20px 24px 24px 24px;
                display: flex;
                flex-direction: column;
                flex-grow: 1;
            }
            .card-info-pane a {
                text-decoration: none;
            }
            .card-model-title {
                font-size: 20px;
                font-weight: 700;
                color: #1a202c !important;
                margin: 0 0 8px 0;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                transition: color 0.3s ease;
            }
            .card-model-title:hover {
                color: #b89228 !important;
            }
            
            /* Rating Row */
            .card-rating-row {
                display: flex;
                align-items: center;
                margin-bottom: 22px;
            }
            .stars-list {
                display: flex;
                gap: 3px;
            }
            .star-icon {
                width: 14px;
                height: 14px;
                color: #d4af37;
                fill: currentColor;
            }
            .rating-badge {
                background: rgba(184, 146, 40, 0.08);
                color: #b89228;
                font-size: 11px;
                font-weight: 700;
                padding: 2px 8px;
                border-radius: 4px;
                margin-left: 8px;
            }
            
            /* Pricing and Button Row */
            .card-pricing-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: auto;
            }
            .card-price-value {
                color: #b89228;
                font-size: 20px;
                font-weight: 800;
            }
            .rentalNow {
                background: linear-gradient(135deg, #d4af37 0%, #b89228 100%) !important;
                color: #ffffff !important;
                padding: 10px 18px !important;
                border-radius: 12px !important;
                font-size: 13px !important;
                font-weight: 700 !important;
                text-decoration: none !important;
                transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1) !important;
                box-shadow: 0 4px 15px rgba(184, 146, 40, 0.25) !important;
                display: inline-block;
                text-align: center;
            }
            .rentalNow:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(184, 146, 40, 0.35) !important;
                background: linear-gradient(135deg, #e5c158 0%, #cfa63a 100%) !important;
            }
            
            /* Pagination Customizations */
            .swiper-pagination {
                bottom: 10px !important;
            }
            .swiper-pagination-bullet {
                background: rgba(0, 0, 0, 0.15) !important;
                opacity: 1 !important;
                width: 8px !important;
                height: 8px !important;
                transition: all 0.3s ease;
                margin: 0 5px !important;
            }
            .swiper-pagination-bullet-active {
                background: #b89228 !important;
                width: 24px !important;
                border-radius: 4px !important;
            }
        </style>
    </head>
    <body>
        <div class="swiper-container-wrapper">
            <div class="swiper centered-slide-carousel">
                <div class="swiper-wrapper">
                    <c:forEach items="${sessionScope.listM}" var="m">
                        <div class="swiper-slide">
                            <div class="card-inner-wrapper">
                                <a href="motorcycleDetail?id=${m.motorcycleId}" target="_top" class="card-img-link">
                                    <div class="card-img-glow"></div>
                                    <img class="card-img"
                                         src="${empty m.image ? 'images/default.jpg' : (m.image.startsWith('http') ? m.image : 'images/'.concat(m.image))}"
                                         alt="${m.model}" />
                                </a>
                                <div class="card-info-pane">
                                    <a href="motorcycleDetail?id=${m.motorcycleId}" target="_top">
                                        <h5 class="card-model-title">${m.model}</h5>
                                    </a>
                                    <div class="card-rating-row">
                                        <div class="stars-list">
                                            <c:forEach begin="1" end="5">
                                                <svg class="star-icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                                </svg>
                                            </c:forEach>
                                        </div>
                                        <span class="rating-badge">5.0</span>
                                    </div>
                                    <c:forEach items="${sessionScope.listP}" var="p">
                                        <c:if test="${m.priceListID == p.priceListId}">
                                            <div class="card-pricing-row">
                                                <span class="card-price-value">
                                                    <fmt:formatNumber value="${p.dailyPriceForDay * 1000}" type="currency" currencySymbol="VNĐ" />
                                                </span>
                                                <a href="booking" class="rentalNow" onclick="redirectToBooking(event,'${m.motorcycleId}')">
                                                    Thuê Xe Ngay
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- Pagination -->
                <div class="swiper-pagination"></div>
            </div>
        </div>

        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script>
            var swiper = new Swiper('.centered-slide-carousel', {
                slidesPerView: 3,
                spaceBetween: 30,
                centeredSlides: false,
                loop: true,
                autoplay: {
                    delay: 3000,
                    disableOnInteraction: false
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true
                },
                breakpoints: {
                    320: {
                        slidesPerView: 1,
                        spaceBetween: 15
                    },
                    640: {
                        slidesPerView: 1.5,
                        spaceBetween: 20
                    },
                    768: {
                        slidesPerView: 2.2,
                        spaceBetween: 25
                    },
                    1024: {
                        slidesPerView: 3,
                        spaceBetween: 30
                    }
                }
            });

            function redirectToBooking(event, motorcycleId) {
                event.preventDefault(); 
                window.top.location.href = 'booking?motorcycleid=' + motorcycleId;
            }
        </script>
    </body>
</html>
