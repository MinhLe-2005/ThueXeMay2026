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
            .centered-slide-carousel {
                padding: 20px 15px 50px 15px !important;
            }
            
            .swiper-slide {
                border-radius: 20px !important;
                background: #ffffff !important;
                border: 1px solid rgba(181, 147, 73, 0.15) !important;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.04) !important;
                transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1) !important;
                overflow: hidden;
                box-sizing: border-box;
                padding: 25px 20px;
                display: flex;
                flex-direction: column;
                position: relative;
            }

            .swiper-slide:hover {
                transform: translateY(-8px);
                box-shadow: 0 20px 50px rgba(181, 147, 73, 0.1) !important;
                border-color: rgba(181, 147, 73, 0.4) !important;
            }

            .swiper-slide.best-choice {
                background: #fffcf8 !important;
                border: 2px solid #b59349 !important;
                box-shadow: 0 15px 40px rgba(181, 147, 73, 0.15) !important;
                z-index: 2;
            }
            .swiper-slide.best-choice:hover {
                transform: translateY(-8px);
                box-shadow: 0 25px 50px rgba(181, 147, 73, 0.25) !important;
            }

            .best-badge {
                position: absolute;
                top: 0;
                left: 50%;
                transform: translateX(-50%);
                background: linear-gradient(135deg, #c4a14b, #b59349);
                color: #fff;
                font-size: 11px;
                font-weight: 800;
                text-transform: uppercase;
                letter-spacing: 1.5px;
                padding: 6px 20px;
                border-radius: 0 0 12px 12px;
                display: flex;
                align-items: center;
                gap: 6px;
                box-shadow: 0 4px 10px rgba(196, 161, 75, 0.3);
            }

            .card-title {
                text-align: center;
                font-family: 'Times New Roman', serif;
                font-size: 24px;
                font-weight: 700;
                color: #1a1a1a;
                margin: 20px 0 15px 0;
            }
            .best-choice .card-title {
                color: #b59349;
            }
            
            .card-img-wrapper {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 160px;
                margin-bottom: 15px;
                position: relative;
            }
            
            .card-img-wrapper::after {
                content: '';
                position: absolute;
                bottom: -10px;
                left: 50%;
                transform: translateX(-50%);
                width: 70%;
                height: 20px;
                background: radial-gradient(ellipse at center, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0) 70%);
                border-radius: 50%;
                z-index: 1;
            }
            .best-choice .card-img-wrapper::after {
                background: radial-gradient(ellipse at center, rgba(181, 147, 73, 0.25) 0%, rgba(0,0,0,0) 70%);
            }
            
            .card-img {
                max-width: 95%;
                max-height: 100%;
                object-fit: contain;
                position: relative;
                z-index: 2;
                transition: transform 0.5s ease;
            }
            .swiper-slide:hover .card-img {
                transform: scale(1.08) rotate(2deg);
            }
            
            .features-list {
                list-style: none;
                padding: 10px 0;
                margin: 0 0 15px 0;
                border-top: 1px dashed rgba(0,0,0,0.08);
                border-bottom: 1px dashed rgba(0,0,0,0.08);
            }
            .best-choice .features-list {
                border-color: rgba(181, 147, 73, 0.3);
            }
            
            .features-list li {
                display: flex;
                align-items: center;
                gap: 12px;
                font-size: 14px;
                color: #555;
                margin-bottom: 8px;
            }
            .best-choice .features-list li {
                color: #1a1a1a;
                font-weight: 600;
            }
            
            .features-list li i {
                color: #c4a14b;
                font-size: 18px;
            }
            
            .price-wrap {
                margin-top: auto;
                margin-bottom: 15px;
                text-align: center;
            }
            .price-val {
                font-size: 26px;
                font-weight: 800;
                color: #1a1a1a;
            }
            .best-choice .price-val {
                color: #b59349;
            }
            .price-unit {
                font-size: 14px;
                font-weight: 500;
                color: #888;
            }
            .best-choice .price-unit {
                color: #555;
            }

            .action-row {
                display: flex;
                gap: 12px;
            }
            .btn-book {
                flex: 1;
                background: linear-gradient(135deg, #c4a14b, #b59349);
                color: #ffffff;
                font-weight: 700;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                text-decoration: none;
                border: none;
                border-radius: 30px;
                padding: 10px 15px;
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 8px;
                cursor: pointer;
                transition: all 0.3s;
                box-shadow: 0 4px 15px rgba(181, 147, 73, 0.3);
            }
            .btn-book:hover {
                background: linear-gradient(135deg, #b59349, #9c7c3b);
                color: #ffffff;
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(181, 147, 73, 0.4);
            }
            .btn-msg {
                background: #ffffff;
                color: #1a1a1a;
                border: 1px solid rgba(0,0,0,0.1);
                border-radius: 50%;
                width: 42px;
                height: 42px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                cursor: pointer;
                transition: all 0.3s;
            }
            .btn-msg:hover {
                background: #f8f9fa;
                border-color: #b59349;
                color: #b59349;
                transform: rotate(15deg);
            }

            .best-choice .btn-book {
                background: linear-gradient(135deg, #1a1a1a, #2d2d2d);
                color: #ffffff;
                box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            }
            .best-choice .btn-book:hover {
                background: linear-gradient(135deg, #000000, #1a1a1a);
                color: #c4a14b;
            }
            .best-choice .btn-msg {
                background: #ffffff;
                border-color: #1a1a1a;
                color: #1a1a1a;
            }
            .best-choice .btn-msg:hover {
                background: #1a1a1a;
                color: #ffffff;
            }
            
            .view-all-wrapper {
                text-align: center;
                margin-top: 20px;
            }
            .btn-view-all {
                background: transparent;
                color: #c4a14b;
                font-weight: 700;
                font-size: 15px;
                padding: 12px 30px;
                border-radius: 30px;
                border: 2px solid #c4a14b;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                transition: all 0.3s;
            }
            .btn-view-all:hover {
                background: #c4a14b;
                color: #ffffff;
            }

            .swiper-button-next, .swiper-button-prev {
                color: #1a1a1a !important;
                background: #ffffff !important;
                border: 1px solid rgba(0,0,0,0.05);
                width: 44px !important;
                height: 44px !important;
                border-radius: 50%;
                box-shadow: 0 5px 15px rgba(0,0,0,0.08);
                transition: all 0.3s ease;
            }
            .swiper-button-next:hover, .swiper-button-prev:hover {
                background: #c4a14b !important;
                border-color: #c4a14b !important;
                color: #ffffff !important;
                transform: scale(1.05);
            }
            .swiper-button-next::after, .swiper-button-prev::after {
                font-size: 18px !important;
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
                                    <i class="ri-key-2-line"></i> THUÊ XE NGAY
                                </a>
                                <a href="motorcycleDetail?id=${m.motorcycleId}" target="_top" class="btn-msg" title="Xem chi tiết" style="width: auto; padding: 0 15px; border-radius: 30px; text-decoration: none; font-size: 14px; font-weight: 600;">
                                    Chi tiết
                                </a>
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
