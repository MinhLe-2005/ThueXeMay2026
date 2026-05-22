<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.smartride.dao.MotorcycleDAO" %>
<%@ page import="com.smartride.dao.PriceListDAO" %>
<%@ page import="com.smartride.dto.Motorcycle" %>
<%@ page import="com.smartride.dto.PriceList" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
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
        <title>Motorcycle Slider</title>
        <!-- Swiper CSS -->
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <!-- Modern Google Font & Icons -->
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
        
        <style>
            body {
                background: transparent !important;
                margin: 0;
                padding: 0;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                overflow: hidden;
            }
            
            .swiper-container-wrapper {
                padding: 20px 0 60px 0;
            }
            
            .swiper-slide {
                border-radius: 16px !important;
                background: #f8f9fa !important;
                border: 1px solid rgba(0, 0, 0, 0.04) !important;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03) !important;
                transition: all 0.3s ease !important;
                overflow: hidden;
                box-sizing: border-box;
                padding: 30px 20px;
                display: flex;
                flex-direction: column;
                position: relative;
            }

            .swiper-slide:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 30px rgba(0, 0, 0, 0.08) !important;
                border-color: #b59349 !important;
            }

            /* The Featured "Best Choice" Card */
            .swiper-slide.best-choice {
                background: #b59349 !important;
                border-color: #b59349 !important;
                box-shadow: 0 15px 35px rgba(181, 147, 73, 0.3) !important;
                transform: scale(1.02);
                z-index: 2;
            }
            .swiper-slide.best-choice:hover {
                transform: scale(1.02) translateY(-5px);
            }

            .best-badge {
                position: absolute;
                top: 15px;
                left: 50%;
                transform: translateX(-50%);
                background: #16a34a;
                color: #fff;
                font-size: 12px;
                font-weight: 600;
                padding: 5px 12px;
                border-radius: 20px;
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .card-title {
                text-align: center;
                font-size: 20px;
                font-weight: 700;
                color: #1a1a1a;
                margin: 20px 0 15px 0;
            }
            
            .card-img-wrapper {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 180px;
                margin-bottom: 20px;
            }
            
            .card-img {
                max-width: 90%;
                max-height: 100%;
                object-fit: contain;
                filter: drop-shadow(0 10px 15px rgba(0,0,0,0.1));
            }
            
            /* Features List */
            .features-list {
                list-style: none;
                padding: 0;
                margin: 0 0 20px 0;
            }
            .features-list li {
                display: flex;
                align-items: center;
                gap: 10px;
                font-size: 13.5px;
                color: #4a4a4a;
                margin-bottom: 10px;
            }
            .features-list li i {
                color: #b59349;
                font-size: 16px;
            }
            /* Colors for best choice */
            .best-choice .features-list li {
                color: #1a1a1a;
                font-weight: 500;
            }
            .best-choice .features-list li i {
                color: #1a1a1a;
            }

            /* Price Section */
            .price-wrap {
                margin-top: auto;
                margin-bottom: 20px;
            }
            .price-val {
                font-size: 26px;
                font-weight: 800;
                color: #1a1a1a;
            }
            .price-unit {
                font-size: 14px;
                font-weight: 500;
                color: #666;
            }
            .best-choice .price-unit {
                color: #333;
            }

            /* Action Buttons */
            .action-row {
                display: flex;
                gap: 10px;
            }
            .btn-book {
                flex: 1;
                background: #b59349;
                color: #ffffff;
                font-weight: 700;
                font-size: 14px;
                text-decoration: none;
                border: none;
                border-radius: 8px;
                padding: 12px 15px;
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 8px;
                cursor: pointer;
                transition: all 0.2s;
            }
            .btn-book:hover {
                background: #9c7c3b;
                color: #ffffff;
            }
            .btn-msg {
                background: #334155;
                color: #fff;
                border: none;
                border-radius: 8px;
                width: 44px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                cursor: pointer;
                transition: all 0.2s;
            }
            .btn-msg:hover {
                background: #1e293b;
            }

            /* Button variations for best-choice */
            .best-choice .btn-book {
                background: #ffffff;
                color: #b59349;
            }
            .best-choice .btn-book:hover {
                background: #f8f9fa;
                color: #9c7c3b;
            }
            
            /* Bottom View All Button */
            .view-all-wrapper {
                text-align: center;
                margin-top: 10px;
            }
            .btn-view-all {
                background: #b59349;
                color: #ffffff;
                font-weight: 700;
                font-size: 15px;
                padding: 12px 30px;
                border-radius: 8px;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                transition: all 0.2s;
            }
            .btn-view-all:hover {
                background: #9c7c3b;
                color: #ffffff;
            }

            .swiper-button-next, .swiper-button-prev {
                color: #333 !important;
                background: rgba(255, 255, 255, 0.6) !important;
                backdrop-filter: blur(4px);
                width: 38px !important;
                height: 38px !important;
                border-radius: 50%;
                box-shadow: 0 2px 10px rgba(0,0,0,0.05);
                transition: all 0.3s ease;
            }
            .swiper-button-next:hover, .swiper-button-prev:hover {
                background: rgba(181, 147, 73, 0.9) !important;
                color: #ffffff !important;
                transform: scale(1.05);
            }
            .swiper-button-next::after, .swiper-button-prev::after {
                font-size: 16px !important;
                font-weight: 700;
            }
        </style>
    </head>
    <body>
        <div class="swiper-container-wrapper">
            <div class="swiper centered-slide-carousel">
                <div class="swiper-wrapper">
                    <c:forEach items="${sessionScope.listM}" var="m" varStatus="status">
                        <!-- Make the 2nd item (index 1) the Best Choice -->
                        <c:set var="isBest" value="${status.index == 1}" />
                        
                        <div class="swiper-slide ${isBest ? 'best-choice' : ''}">
                            <c:if test="${isBest}">
                                <div class="best-badge">
                                    <i class="ri-star-fill"></i> Lựa chọn tốt nhất
                                </div>
                            </c:if>

                            <h3 class="card-title">${m.model}</h3>
                            
                            <a href="motorcycleDetail?id=${m.motorcycleId}" target="_top" class="card-img-wrapper">
                                <img class="card-img"
                                     src="${empty m.image ? 'images/default.jpg' : (m.image.startsWith('http') ? m.image : 'images/'.concat(m.image))}"
                                     alt="${m.model}" />
                            </a>
                            
                            <ul class="features-list">
                                <li><i class="ri-checkbox-circle-line"></i> Mũ bảo hiểm tiêu chuẩn</li>
                                <li><i class="ri-checkbox-circle-line"></i> Giá đỡ điện thoại</li>
                                <li><i class="ri-checkbox-circle-line"></i> Dụng cụ vá xe mini</li>
                                <li><i class="ri-checkbox-circle-line"></i> Áo mưa / Bao bọc giày</li>
                            </ul>

                            <c:forEach items="${sessionScope.listP}" var="p">
                                <c:if test="${m.priceListID == p.priceListId}">
                                    <div class="price-wrap">
                                        <!-- Formatted without decimal fraction if 0 -->
                                        <span class="price-val"><fmt:formatNumber value="${p.dailyPriceForDay * 1000}" pattern="#,###"/></span>
                                        <span class="price-unit">đ/ngày</span>
                                    </div>
                                </c:if>
                            </c:forEach>

                            <div class="action-row">
                                <a href="booking" class="btn-book" onclick="redirectToBooking(event,'${m.motorcycleId}')">
                                    <i class="ri-phone-line"></i> GỌI ĐẶT XE
                                </a>
                                <button class="btn-msg" onclick="window.top.location.href='motorcycleDetail?id=${m.motorcycleId}'">
                                    <i class="ri-message-3-line"></i>
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- Navigation -->
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
            
            <div class="view-all-wrapper">
                <a href="motorcycle" target="_top" class="btn-view-all">
                    Bảng giá chi tiết <i class="ri-arrow-right-s-line"></i>
                </a>
            </div>
        </div>

        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script>
            var swiper = new Swiper('.centered-slide-carousel', {
                slidesPerView: 4,
                spaceBetween: 25,
                centeredSlides: false,
                loop: true,
                autoplay: {
                    delay: 3500,
                    disableOnInteraction: false
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
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
                        slidesPerView: 2.5,
                        spaceBetween: 25
                    },
                    1024: {
                        slidesPerView: 4,
                        spaceBetween: 25
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
