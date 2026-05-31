<%-- 
    Document   : home
    Created on : Jun 24, 2024, 2:15:07 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <jsp:include page="/includes/customer/header.jsp" />

        <style>
            .rental {
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                width: auto !important;
                min-width: 220px !important;
                padding: 14px 35px !important;
                background-color: #b59349 !important;
                border: 2px solid #b59349 !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-size: 15px !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                letter-spacing: 1.5px !important;
                color: #ffffff !important;
                text-decoration: none !important;
                border-radius: 8px !important;
                box-shadow: 0 4px 15px rgba(181, 147, 73, 0.3) !important;
                transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1) !important;
                position: relative !important;
                overflow: hidden !important;
                cursor: pointer !important;
                animation: pulse 2s infinite !important;
            }
            .rental::after {
                content: '' !important;
                position: absolute !important;
                top: 0 !important;
                left: -100% !important;
                width: 100% !important;
                height: 100% !important;
                background: linear-gradient(
                    90deg,
                    transparent,
                    rgba(255, 255, 255, 0.3),
                    transparent
                ) !important;
                transition: all 0.6s ease !important;
            }
            .rental:hover::after {
                left: 100% !important;
            }
            .rental:hover {
                background-color: #1a1816 !important;
                border-color: #b59349 !important;
                color: #b59349 !important;
                transform: translateY(-4px) scale(1.03) !important;
                box-shadow: 0 10px 25px rgba(181, 147, 73, 0.4) !important;
            }
            .rental:active {
                transform: translateY(-1px) scale(0.97) !important;
                box-shadow: 0 5px 12px rgba(181, 147, 73, 0.2) !important;
                transition: all 0.1s ease !important;
            }

            .sitename {
                color: #b59349 !important;
            }
            .gradient-button {
                background: #b59349;
                color: white !important;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
                display: inline-block;
                transition: all 0.3s ease;
                margin-bottom: 4%;
            }

            .gradient-button:hover {
                background: #a38241;
                color: white !important;
            }
            .call-to-action a:hover{
                color: white;
            }

            /* Custom Hero Layout */
            #hero {
                min-height: 100vh;
                display: flex;
                align-items: center;
                position: relative;
                background: url('https://images.unsplash.com/photo-1558981806-ec527fa84c39?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') no-repeat center center/cover !important;
                padding: 140px 0 60px 0;
            }
            .hero-overlay {
                position: absolute;
                inset: 0;
                background: linear-gradient(135deg, rgba(15,12,10,0.78) 0%, rgba(20,18,16,0.55) 60%, rgba(20,18,16,0.30) 100%);
                z-index: 2;
            }
            #hero .container { position: relative; z-index: 3; }

            /* Booking widget select/input */
            .booking-select, .booking-input {
                width: 100%;
                padding: 10px 12px;
                border: 1.5px solid #eee;
                border-radius: 8px;
                font-size: 14px;
                font-family: 'Plus Jakarta Sans', sans-serif;
                color: #2b2824;
                outline: none;
                cursor: pointer;
                background: #fff;
                transition: border-color 0.2s;
            }
            .booking-select:focus, .booking-input:focus {
                border-color: #b59349;
                box-shadow: 0 0 0 3px rgba(181,147,73,0.12);
            }
            .booking-select { appearance: none; padding-right: 32px; }


            @media (max-width: 992px) {
                #heroBookingForm .booking-grid {
                    grid-template-columns: 1fr 1fr !important;
                }
                #heroBookingForm .booking-btn-col {
                    grid-column: 1 / -1;
                }
                #heroBookingForm .booking-btn-col button {
                    width: 100%;
                }
            }
            @media (max-width: 576px) {
                #hero { padding-top: 120px; }
                #heroBookingForm .booking-grid {
                    grid-template-columns: 1fr !important;
                }
                #hero h1 { font-size: 2.2rem !important; }
            }

            .hero-text-card {
                background: transparent !important;
                border: none !important;
                border-radius: 0 !important;
                padding: 0 !important;
                box-shadow: none !important;
                margin-bottom: 40px !important;
            }
            .hero-text-card h2 {
                color: #ffffff;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 800;
                font-size: 3.4rem;
                line-height: 1.25;
                margin-bottom: 20px;
                margin-top: 0;
                letter-spacing: -0.5px;
            }
            .hero-text-card h2 span {
                color: #b59349;
            }
            .hero-text-card .hero-desc {
                color: #eae6df !important;
                font-size: 1.15rem !important;
                margin-bottom: 30px !important;
                line-height: 1.7 !important;
                max-width: 520px;
            }
            .stats-item {
                background: transparent !important;
                border: none !important;
                border-radius: 0 !important;
                padding: 10px 0 10px 20px !important;
                box-shadow: none !important;
                text-align: left !important;
                border-left: 2px solid #b59349 !important;
                transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
            }
            .stats-item:hover {
                transform: translateX(5px);
                border-left-width: 4px !important;
            }
            .stats-item span {
                color: #1a1816 !important;
                font-size: 2.3rem !important;
                font-weight: 800 !important;
                line-height: 1 !important;
                display: block !important;
                margin-bottom: 6px !important;
            }
            .stats-item p {
                color: #b59349 !important;
                margin: 0 !important;
                font-size: 0.95rem !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                letter-spacing: 0.5px !important;
            }

            .sidebar {
                height: 60%;
                width: 250px;
                background: linear-gradient(135deg, #111111, #222222);
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                transform: translateX(300px);
                transition: transform 0.4s cubic-bezier(0.23, 1, 0.32, 1);
                position: fixed;
                top: 148px;
                bottom: 0px;
                right: 0;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
                z-index: 1000;
                border-left: 2px solid #d4af37;
            }
            .sidebar-content {
                text-align: center;
                padding-left: 20px;
            }

            .sidebar-content p {
                margin-bottom: 20px;
                font-size: 1.1em;
                text-align: left;
            }

            .sidebar-content button {
                background: #d4af37;
                border: none;
                color: black;
                padding: 10px 20px;
                font-size: 1em;
                border-radius: 25px;
                cursor: pointer;
                transition: background 0.3s ease, transform 0.3s ease;
                font-weight: 600;
            }

            .sidebar-content button:hover {
                background: #ffffff;
                transform: scale(1.05);
            }
            .sidebar-action {
                background: #d4af37;
                color: black;
                display: flex;
                align-items: center;
                justify-content: center;
                width: 50px;
                height: 50px;
                border-radius: 50%;
                cursor: pointer;
                position: fixed;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1), background 0.3s ease;
                z-index: 1001;
            }

            .sidebar-action:hover {
                background-color: #ffffff;
            }

            .sidebar-action span {
                font-size: 24px;
                transition: transform 0.3s ease;
            }

            .sidebar-action .notification-dot {
                width: 10px;
                height: 10px;
                background-color: red;
                border-radius: 50%;
                position: absolute;
                top: 5px;
                right: 5px;
                box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
            }
            .sidebar.open {
                transform: translateX(0);
            }

            .sidebar-action.open {
                right: 255px;
            }

            .sidebar-action.open span {
                transform: rotate(180deg);
            }
            
            @keyframes pulse {
                0% {
                    box-shadow: 0 0 0 0 rgba(212, 175, 55, 0.7);
                }
                70% {
                    box-shadow: 0 0 0 15px rgba(212, 175, 55, 0);
                }
                100% {
                    box-shadow: 0 0 0 0 rgba(212, 175, 55, 0);
                }
            }

            /* Enhanced dark overlays for call-to-action and testimonials for 100% text legibility */
            #call-to-action:before {
                background: rgba(0, 0, 0, 0.65) !important;
            }
            #call-to-action h3 {
                color: #ffffff !important;
                font-weight: 700 !important;
                font-family: 'Poppins', sans-serif !important;
            }
            #call-to-action p {
                color: rgba(255, 255, 255, 0.9) !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
            }
            #call-to-action .cta-btn {
                border: 2px solid #b59349 !important;
                color: #ffffff !important;
                background: #b59349 !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 600 !important;
                border-radius: 6px !important;
                transition: all 0.3s ease !important;
                box-shadow: 0 4px 15px rgba(181, 147, 73, 0.3) !important;
            }
            #call-to-action .cta-btn:hover {
                background: #a38241 !important;
                border-color: #a38241 !important;
                color: #ffffff !important;
                transform: translateY(-2px) !important;
            }

            .testimonials:before {
                background: rgba(0, 0, 0, 0.65) !important;
            }
            .testimonial-item h3 {
                color: #ffffff !important;
                font-weight: 700 !important;
                font-family: 'Poppins', sans-serif !important;
            }
            .testimonial-item h4 {
                color: rgba(255, 255, 255, 0.8) !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
            }
            .testimonial-item p {
                color: rgba(255, 255, 255, 0.95) !important;
                font-style: italic !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
            }
            /* ── Home FAQ ── */
            .home-faq-item {
                border-bottom: 1px dashed #ddd;
                padding: 18px 0;
                cursor: pointer;
            }
            .home-faq-q {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 12px;
                font-size: 14.5px;
                font-weight: 500;
                color: #2b2824;
                line-height: 1.5;
                transition: color 0.2s;
            }
            .home-faq-item:hover .home-faq-q,
            .home-faq-item.open .home-faq-q { color: #b59349; }
            .home-faq-q i {
                flex-shrink: 0;
                font-size: 12px;
                color: #aaa;
                transition: transform 0.3s, color 0.2s;
            }
            .home-faq-item.open .home-faq-q i {
                transform: rotate(180deg);
                color: #b59349;
            }
            .home-faq-a {
                max-height: 0;
                overflow: hidden;
                font-size: 13.5px;
                color: #666;
                line-height: 1.7;
                transition: max-height 0.4s cubic-bezier(0.4,0,0.2,1), padding 0.3s;
            }
            .home-faq-item.open .home-faq-a {
                max-height: 200px;
                padding-top: 10px;
            }
            @media (max-width: 768px) {
                #faq-preview .container > div[style*="grid"] {
                    grid-template-columns: 1fr !important;
                }
            }
        </style>
    </head>

    <body class="index-page">

        <jsp:include page="/includes/customer/navbar.jsp" />

        <main class="main">

            <!-- Hero Section -->
            <section id="hero" class="hero section">
                <div class="hero-overlay"></div>
                <div class="container" style="position:relative; z-index:3;">
                    <!-- Left-aligned hero text -->
                    <div class="row">
                        <div class="col-lg-7" data-aos="fade-up">
                            <p style="color:rgba(255,255,255,0.75); font-size:1rem; font-weight:500; margin-bottom:4px; letter-spacing:1px;">Dịch vụ</p>
                            <h1 style="font-family:'Plus Jakarta Sans',sans-serif; font-weight:800; font-size:3.2rem; line-height:1.15; color:#fff; margin-bottom:16px;">
                                Thuê <span style="color:#b59349;">Xe Máy</span><br>Chuyên Nghiệp
                            </h1>
                            <p style="color:rgba(255,255,255,0.7); font-size:1rem; max-width:520px; line-height:1.7; margin-bottom:32px;">
                                Thấu hiểu cảm giác của người đi thuê xe máy – SmartRide cung cấp dịch vụ thuê xe uy tín, tiện lợi, tiên phong trở thành đơn vị số 1 tại Đà Nẵng.
                            </p>
                        </div>
                    </div>

                    <!-- Booking Widget Card -->
                    <div data-aos="fade-up" data-aos-delay="150">
                        <form id="heroBookingForm"
                              style="background:#fff; border-radius:16px; padding:24px 28px 20px; box-shadow:0 20px 60px rgba(0,0,0,0.25); max-width:960px;"
                              onsubmit="return heroFormSubmit(event)">

                            <!-- Datalist: Đà Nẵng addresses -->
                            <datalist id="dnLocations">
                                <option value="Ga Đà Nẵng – 791 Hải Phòng, Tam Thuận, Thanh Khê">
                                <option value="Sân bay Quốc tế Đà Nẵng – 132 Phan Đình Phùng, Chính Gián">
                                <option value="Bến xe Trung tâm – 33 Tôn Đức Thắng, Hải Châu">
                                <option value="Chợ Hàn – 119 Trần Phú, Hải Châu">
                                <option value="Vincom Plaza – 910A Ngô Quyền, Sơn Trà">
                                <option value="Cầu Rồng – Trần Hưng Đạo, Hải Châu">
                                <option value="Ngũ Hành Sơn – Huyền Trân Công Chúa, Ngũ Hành Sơn">
                                <option value="Bán đảo Sơn Trà – Hoàng Sa, Sơn Trà">
                                <option value="Đại học Bách Khoa – 54 Nguyễn Lương Bằng, Liên Chiểu">
                                <option value="Bệnh viện Đà Nẵng – 124 Hải Phòng, Hải Châu">
                                <option value="TTTM Lotte Mart – 6 Nại Nam, Hải Châu">
                                <option value="Phố đi bộ Bạch Đằng – Bạch Đằng, Hải Châu">
                            </datalist>

                            <div class="booking-grid" style="display:grid; grid-template-columns:1fr 1fr 1fr 1fr auto; gap:12px; align-items:end;">
                                <!-- Pickup Location -->
                                <div>
                                    <label style="font-size:11px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:#888; margin-bottom:6px; display:block;">
                                        <i class="fas fa-map-marker-alt" style="color:#b59349;"></i> Địa điểm nhận xe
                                    </label>
                                    <input type="text" name="location" id="heroPickupLoc"
                                           list="dnLocations"
                                           placeholder="Tìm hoặc nhập địa chỉ..."
                                           class="booking-input"
                                           autocomplete="off" />
                                </div>
                                <!-- Pickup Date -->
                                <div>
                                    <label style="font-size:11px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:#888; margin-bottom:6px; display:block;">
                                        <i class="fas fa-calendar-alt" style="color:#b59349;"></i> Ngày nhận xe
                                    </label>
                                    <input type="datetime-local" name="startDate" id="heroStartDate" class="booking-input" />
                                </div>
                                <!-- Return Location -->
                                <div>
                                    <label style="font-size:11px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:#888; margin-bottom:6px; display:block;">
                                        <i class="fas fa-map-marker-alt" style="color:#b59349;"></i> Địa điểm trả xe
                                    </label>
                                    <input type="text" name="returnLocation" id="heroReturnLoc"
                                           list="dnLocations"
                                           placeholder="Tìm hoặc nhập địa chỉ..."
                                           class="booking-input"
                                           autocomplete="off" />
                                </div>
                                <!-- Return Date -->
                                <div>
                                    <label style="font-size:11px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:#888; margin-bottom:6px; display:block;">
                                        <i class="fas fa-calendar-alt" style="color:#b59349;"></i> Ngày trả xe
                                    </label>
                                    <input type="datetime-local" name="endDate" id="heroEndDate" class="booking-input" />
                                </div>
                                <!-- CTA Button -->
                                <div class="booking-btn-col">
                                    <button type="submit"
                                            style="background:#b59349; color:#fff; border:none; padding:11px 28px; border-radius:8px; font-weight:700; font-size:14px; font-family:'Plus Jakarta Sans',sans-serif; letter-spacing:0.5px; cursor:pointer; white-space:nowrap; transition:all 0.3s; box-shadow:0 4px 15px rgba(181,147,73,0.4);"
                                            onmouseover="this.style.background='#a38241'" onmouseout="this.style.background='#b59349'">
                                        Đặt xe ngay
                                    </button>
                                </div>
                            </div>
                            <!-- Same location checkbox & Error Message -->
                            <div style="margin-top:12px; display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:10px;">
                                <label style="display:inline-flex; align-items:center; gap:8px; font-size:13px; color:#666; cursor:pointer;">
                                    <input type="checkbox" id="sameLocationCheck"
                                           style="accent-color:#b59349; width:15px; height:15px; cursor:pointer;"
                                           onchange="toggleReturnLocation(this)" />
                                    Nhận, trả xe cùng địa điểm
                                </label>
                                <div id="heroErrorMsg" style="color: #dc3545; font-size: 13.5px; font-weight: 600; display: none; background: #fff8f8; padding: 4px 12px; border-radius: 4px; border: 1px solid #ffcdcd;">
                                    <i class="fas fa-exclamation-circle" style="margin-right:4px;"></i> <span></span>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>

                <c:if test="${not empty sessionScope.account}">
                    <div class="follow-container">
                        <div class="sidebar" id="sidebar">
                            <div class="sidebar-content">
                                <c:choose>
                                    <c:when test="${not empty requestScope.book && statusBooking != 'Đã hủy'}">
                                        <p>Cảm ơn bạn đã sử dụng dịch vụ của <span><strong>SmartRide</strong></span>, hãy bấm vào đây để theo dõi nhanh đơn hàng của mình nhé!</p>
                                        <a href="bookingHistoryDetail?bookingId=${requestScope.book.bookingID}">
                                            <button>Theo dõi đơn hàng</button>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <p>Chào mừng bạn đến với <span><strong>SmartRide</strong></span>! Khám phá và quản lý lịch sử đặt xe của bạn tại đây.</p>
                                        <a href="bookingHistory?status=all">
                                            <button>Quản lý đơn hàng</button>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div onclick="SidebarAction()" class="sidebar-action" id="sidebarAction">
                            <span class="arrow-icon"><i class="bi bi-play-fill"></i></span>
                            <div class="notification-dot"></div>
                        </div>
                    </div>
                </c:if>
            </section><!-- /Hero Section -->

            <!-- Featured Services Section -->
            <section id="featured-services" class="featured-services section" style="background-color: #fafafa; padding: 90px 0;">
                <div class="container">
                    <div class="text-center" style="margin-bottom: 60px;" data-aos="fade-up">
                        <span style="color: #c4a14b; font-size: 12px; font-weight: 700; letter-spacing: 3px; text-transform: uppercase; font-family: 'Plus Jakarta Sans', sans-serif;">Dịch vụ nổi bật</span>
                        <h2 style="font-family: 'Times New Roman', serif; font-size: 42px; font-weight: 700; color: #1a1a1a; margin: 15px 0;">VÌ SAO CHỌN CHÚNG TÔI</h2>
                        <p style="color: #666; max-width: 750px; margin: 0 auto; font-size: 15.5px; line-height: 1.8;">
                            Sắc màu hành trình, chọn chúng tôi để khởi đầu một trải nghiệm thuê xe máy hoàn hảo và đáng nhớ nhất tại Đà Nẵng.
                        </p>
                    </div>

                    <div class="row gy-4 justify-content-center">
                        <!-- Item 1 -->
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                            <div class="about-card" style="background: #fff; padding: 40px 30px; box-shadow: 0 10px 40px rgba(0,0,0,0.03); border: 1px solid rgba(181, 147, 73, 0.1); border-radius: 16px; height: 100%; transition: all 0.4s ease;">
                                <div style="width: 60px; height: 60px; background: rgba(181, 147, 73, 0.08); border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-bottom: 25px;">
                                    <i class="fa-solid fa-motorcycle" style="color: #c4a14b; font-size: 24px;"></i>
                                </div>
                                <h4 style="font-family: 'Times New Roman', serif; font-size: 22px; font-weight: 700; color: #1a1a1a; margin-bottom: 15px;">Lựa chọn đa dạng</h4>
                                <p style="color: #666; font-size: 14.5px; line-height: 1.7; margin: 0;">Hàng trăm loại xe đa dạng ở nhiều địa điểm tại Đà Nẵng, phù hợp với mọi mục đích của bạn.</p>
                            </div>
                        </div>
                        <!-- Item 2 -->
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                            <div class="about-card" style="background: #fff; padding: 40px 30px; box-shadow: 0 10px 40px rgba(0,0,0,0.03); border: 1px solid rgba(181, 147, 73, 0.1); border-radius: 16px; height: 100%; transition: all 0.4s ease;">
                                <div style="width: 60px; height: 60px; background: rgba(181, 147, 73, 0.08); border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-bottom: 25px;">
                                    <i class="fa-solid fa-location-dot" style="color: #c4a14b; font-size: 24px;"></i>
                                </div>
                                <h4 style="font-family: 'Times New Roman', serif; font-size: 22px; font-weight: 700; color: #1a1a1a; margin-bottom: 15px;">Thuận lợi</h4>
                                <p style="color: #666; font-size: 14.5px; line-height: 1.7; margin: 0;">Dễ dàng tìm kiếm, so sánh và đặt xe máy bạn muốn chỉ với vài cú nhấp chuột.</p>
                            </div>
                        </div>
                        <!-- Item 3 -->
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                            <div class="about-card" style="background: #fff; padding: 40px 30px; box-shadow: 0 10px 40px rgba(0,0,0,0.03); border: 1px solid rgba(181, 147, 73, 0.1); border-radius: 16px; height: 100%; transition: all 0.4s ease;">
                                <div style="width: 60px; height: 60px; background: rgba(181, 147, 73, 0.08); border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-bottom: 25px;">
                                    <i class="fa-solid fa-tags" style="color: #c4a14b; font-size: 24px;"></i>
                                </div>
                                <h4 style="font-family: 'Times New Roman', serif; font-size: 22px; font-weight: 700; color: #1a1a1a; margin-bottom: 15px;">Giá cả cạnh tranh</h4>
                                <p style="color: #666; font-size: 14.5px; line-height: 1.7; margin: 0;">Giá thuê được niêm yết công khai và rẻ hơn tới 10% so với giá truyền thống.</p>
                            </div>
                        </div>
                        <!-- Item 4 -->
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
                            <div class="about-card" style="background: #fff; padding: 40px 30px; box-shadow: 0 10px 40px rgba(0,0,0,0.03); border: 1px solid rgba(181, 147, 73, 0.1); border-radius: 16px; height: 100%; transition: all 0.4s ease;">
                                <div style="width: 60px; height: 60px; background: rgba(181, 147, 73, 0.08); border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-bottom: 25px;">
                                    <i class="fa-solid fa-shield-halved" style="color: #c4a14b; font-size: 24px;"></i>
                                </div>
                                <h4 style="font-family: 'Times New Roman', serif; font-size: 22px; font-weight: 700; color: #1a1a1a; margin-bottom: 15px;">Đáng tin cậy</h4>
                                <p style="color: #666; font-size: 14.5px; line-height: 1.7; margin: 0;">Tất cả các xe đều có tuổi thọ dưới 3 năm và được bảo dưỡng định kỳ.</p>
                            </div>
                        </div>
                        <!-- Item 5 -->
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
                            <div class="about-card" style="background: #fff; padding: 40px 30px; box-shadow: 0 10px 40px rgba(0,0,0,0.03); border: 1px solid rgba(181, 147, 73, 0.1); border-radius: 16px; height: 100%; transition: all 0.4s ease;">
                                <div style="width: 60px; height: 60px; background: rgba(181, 147, 73, 0.08); border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-bottom: 25px;">
                                    <i class="fa-solid fa-headset" style="color: #c4a14b; font-size: 24px;"></i>
                                </div>
                                <h4 style="font-family: 'Times New Roman', serif; font-size: 22px; font-weight: 700; color: #1a1a1a; margin-bottom: 15px;">Dịch vụ hỗ trợ 24/7</h4>
                                <p style="color: #666; font-size: 14.5px; line-height: 1.7; margin: 0;">Có nhân viên hỗ trợ khách hàng trong suốt quá trình thuê xe.</p>
                            </div>
                        </div>
                        <!-- Item 6 -->
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="600">
                            <div class="about-card" style="background: #fff; padding: 40px 30px; box-shadow: 0 10px 40px rgba(0,0,0,0.03); border: 1px solid rgba(181, 147, 73, 0.1); border-radius: 16px; height: 100%; transition: all 0.4s ease;">
                                <div style="width: 60px; height: 60px; background: rgba(181, 147, 73, 0.08); border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-bottom: 25px;">
                                    <i class="fa-regular fa-clock" style="color: #c4a14b; font-size: 24px;"></i>
                                </div>
                                <h4 style="font-family: 'Times New Roman', serif; font-size: 22px; font-weight: 700; color: #1a1a1a; margin-bottom: 15px;">Thời gian linh hoạt</h4>
                                <p style="color: #666; font-size: 14.5px; line-height: 1.7; margin: 0;">Bạn có thể đặt xe máy trong bất kỳ khoảng thời gian nào và gia hạn nếu muốn.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!-- /Featured Services Section -->


            <hr style="border: 0; height: 1px; background: #eaeaea; margin: 0; padding: 0;">
            <div class="container text-center" data-aos="fade-up" style="padding-top: 90px; margin-bottom: 50px;">
                <span style="color: #c4a14b; font-size: 12px; font-weight: 700; letter-spacing: 3px; text-transform: uppercase; font-family: 'Plus Jakarta Sans', sans-serif;">Bộ sưu tập xe</span>
                <h2 style="font-family: 'Times New Roman', serif; font-size: 42px; font-weight: 700; color: #1a1a1a; margin: 15px 0 20px 0; text-transform: uppercase;">DANH MỤC XE MÁY</h2>
                <p style="font-size: 15.5px; color: #666; max-width: 800px; margin: 0 auto; line-height: 1.8; position: relative;">
                    Toàn bộ xe máy tại SmartRide đều là xe mới 100%, được mua mới và đăng ký chính chủ. Sau mỗi hợp đồng thuê, xe sẽ được kiểm tra toàn diện và bảo dưỡng định kỳ, đảm bảo tiêu chuẩn an toàn kỹ thuật cao nhất trước khi bàn giao.
                </p>
            </div>
            <iframe src="slide.jsp" style="width: 100%; height: 680px; padding: 0; margin: 0; border: none; overflow: hidden;" scrolling="no"></iframe>


            <!-- Call To Action Section -->
            <section id="call-to-action" class="call-to-action section">

                <img src="assets/img/cta-bg.jpg" alt>

                <div class="container">
                    <div class="row justify-content-center" data-aos="zoom-in"
                         data-aos-delay="100">
                        <div class="col-xl-10">
                            <div class="text-center">
                                <h3>Khám phá tự do với chuyến đi của bạn.</h3>
                                <p>Khám phá vào một cuộc phiêu lưu mới cùng với
                                    chúng tôi. Đặt xe của bạn ngay hôm nay và tận hưởng sự tự do
                                    không giới hạn trên mọi con đường.</p>
                                <a class="cta-btn" href="motorcycle">THUÊ XE NGAY</a>
                            </div>
                        </div>
                    </div>
                </div>

            </section><!-- /Call To Action Section -->

            <!-- About Section -->
            <hr style="border: 0; height: 1px; background: #eaeaea; margin: 0; padding: 0;">
            <section id="about" class="about section" style="padding: 90px 0; background: #ffffff;">
                <div class="container">
                    
                    <!-- Elegant Header -->
                    <div class="text-center" style="margin-bottom: 60px;" data-aos="fade-up">
                        <span style="color: #c4a14b; font-size: 12px; font-weight: 700; letter-spacing: 3px; text-transform: uppercase; font-family: 'Plus Jakarta Sans', sans-serif;">Cam kết của chúng tôi</span>
                        <h2 style="font-family: 'Times New Roman', serif; font-size: 42px; font-weight: 700; color: #1a1a1a; margin: 15px 0;">Về SmartRide</h2>
                        <p style="color: #666; max-width: 750px; margin: 0 auto; font-size: 15.5px; line-height: 1.8;">
                            Chúng tôi là đối tác lý tưởng của bạn trong mọi chuyến đi bằng xe máy tại Đà Nẵng. Với sứ mệnh mang đến sự thuận tiện và trải nghiệm đáng nhớ, chúng tôi cung cấp dịch vụ cho thuê xe máy với đội ngũ phương tiện đa dạng và chất lượng hàng đầu.
                        </p>
                    </div>

                    <!-- Cards Row (Inspired by Doanlee) -->
                    <div class="row gy-4 justify-content-center mb-5 pb-4" data-aos="fade-up" data-aos-delay="100">
                        <!-- Card 1 -->
                        <div class="col-lg-4 col-md-6">
                            <div class="about-card" style="background: #fff; padding: 40px 30px; box-shadow: 0 5px 25px rgba(0,0,0,0.04); border: 1px solid #eaeaea; border-radius: 4px; height: 100%; transition: all 0.3s ease;">
                                <i class="fa-solid fa-gem" style="color: #c4a14b; font-size: 18px; margin-bottom: 25px; display: block;"></i>
                                <h4 style="font-family: 'Times New Roman', serif; font-size: 22px; font-weight: 700; color: #1a1a1a; margin-bottom: 15px;">Đa dạng sản phẩm</h4>
                                <p style="color: #666; font-size: 14.5px; line-height: 1.7; margin: 0;">Từ các loại xe máy tiện dụng đến những mẫu xe cao cấp, chúng tôi luôn có sự lựa chọn phù hợp với nhu cầu của bạn.</p>
                            </div>
                        </div>
                        <!-- Card 2 -->
                        <div class="col-lg-4 col-md-6">
                            <div class="about-card" style="background: #fff; padding: 40px 30px; box-shadow: 0 5px 25px rgba(0,0,0,0.04); border: 1px solid #eaeaea; border-radius: 4px; height: 100%; transition: all 0.3s ease;">
                                <i class="fa-solid fa-gem" style="color: #c4a14b; font-size: 18px; margin-bottom: 25px; display: block;"></i>
                                <h4 style="font-family: 'Times New Roman', serif; font-size: 22px; font-weight: 700; color: #1a1a1a; margin-bottom: 15px;">Dịch vụ chuyên nghiệp</h4>
                                <p style="color: #666; font-size: 14.5px; line-height: 1.7; margin: 0;">Đội ngũ nhân viên tận tâm sẵn sàng phục vụ, từ việc tư vấn cho đến hỗ trợ kỹ thuật, để bạn có một chuyến đi suôn sẻ và an toàn.</p>
                            </div>
                        </div>
                        <!-- Card 3 -->
                        <div class="col-lg-4 col-md-6">
                            <div class="about-card" style="background: #fff; padding: 40px 30px; box-shadow: 0 5px 25px rgba(0,0,0,0.04); border: 1px solid #eaeaea; border-radius: 4px; height: 100%; transition: all 0.3s ease;">
                                <i class="fa-solid fa-gem" style="color: #c4a14b; font-size: 18px; margin-bottom: 25px; display: block;"></i>
                                <h4 style="font-family: 'Times New Roman', serif; font-size: 22px; font-weight: 700; color: #1a1a1a; margin-bottom: 15px;">Chất lượng cao</h4>
                                <p style="color: #666; font-size: 14.5px; line-height: 1.7; margin: 0;">Tất cả các xe đều được bảo trì thường xuyên và kiểm tra kỹ lưỡng trước khi cho thuê, đảm bảo sự an toàn và tin cậy tuyệt đối.</p>
                            </div>
                        </div>
                    </div>

                    <style>
                        .about-card:hover { transform: translateY(-8px); box-shadow: 0 25px 50px rgba(0,0,0,0.06) !important; border-color: rgba(196, 161, 75, 0.2) !important; }
                        .about-img-wrap { position: relative; overflow: hidden; border-radius: 8px; box-shadow: 0 25px 50px rgba(0,0,0,0.1); }
                        .about-img-wrap img { transition: transform 0.7s ease; }
                        .about-img-wrap:hover img { transform: scale(1.05); }
                    </style>

                    <!-- Tourist Locations (Inspired by User Reference) -->
                    <style>
                        .loc-card-wrap { text-decoration: none; display: block; }
                        .loc-card { position: relative; border-radius: 12px; overflow: hidden; height: 380px; box-shadow: 0 8px 25px rgba(0,0,0,0.06); transition: all 0.4s ease; }
                        .loc-card img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.7s ease; }
                        .loc-card-wrap:hover .loc-card img { transform: scale(1.08); }
                        .loc-card-wrap:hover .loc-card { box-shadow: 0 15px 35px rgba(0,0,0,0.12); transform: translateY(-5px); }
                        .loc-overlay { position: absolute; inset: 0; background: linear-gradient(to top, rgba(0,0,0,0.85) 0%, rgba(0,0,0,0.2) 50%, rgba(0,0,0,0) 100%); display: flex; flex-direction: column; justify-content: flex-end; padding: 25px 20px; color: #fff; }
                        .loc-title { font-family: 'Plus Jakarta Sans', sans-serif; font-size: 20px; font-weight: 800; margin-bottom: 6px; text-shadow: 0 2px 5px rgba(0,0,0,0.5); color: #fff; letter-spacing: 0.5px; }
                        .loc-desc { font-size: 13.5px; color: rgba(255,255,255,0.85); margin: 0; font-weight: 500; }
                    </style>
                    <div class="mb-5 pb-5" data-aos="fade-up" data-aos-delay="200">
                        <div class="d-flex justify-content-between align-items-end mb-4">
                            <h2 style="font-family: 'Plus Jakarta Sans', sans-serif; font-size: 24px; font-weight: 800; color: #1a1a1a; margin: 0; text-transform: uppercase;">ĐỊA ĐIỂM DU LỊCH</h2>
                            <a href="touristLocation" style="color: #c4a14b; font-weight: 700; font-size: 14px; text-decoration: none; text-transform: uppercase; letter-spacing: 1px;">Xem Tất Cả <i class="fa-solid fa-arrow-right ms-1"></i></a>
                        </div>
                        <div class="row row-cols-1 row-cols-md-3 row-cols-lg-5 g-3">
                            <div class="col">
                                <a href="touristLocation" class="loc-card-wrap">
                                    <div class="loc-card">
                                        <img src="https://images.unsplash.com/photo-1559592413-7cec4d0cae2b?auto=format&fit=crop&w=600&q=80" onerror="this.src='assets/img/about.jpg'" alt="Bán Đảo Sơn Trà">
                                        <div class="loc-overlay">
                                            <h4 class="loc-title">Bán Đảo Sơn Trà</h4>
                                            <p class="loc-desc">Cung đường ven biển</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col">
                                <a href="touristLocation" class="loc-card-wrap">
                                    <div class="loc-card">
                                        <img src="https://images.unsplash.com/photo-1532054992984-7eb3e284f67c?auto=format&fit=crop&w=600&q=80" onerror="this.src='assets/img/about.jpg'" alt="Đèo Hải Vân">
                                        <div class="loc-overlay">
                                            <h4 class="loc-title">Đèo Hải Vân</h4>
                                            <p class="loc-desc">Thiên hạ đệ nhất hùng quan</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col">
                                <a href="touristLocation" class="loc-card-wrap">
                                    <div class="loc-card">
                                        <img src="https://images.unsplash.com/photo-1549488344-c71c4c9fae8b?auto=format&fit=crop&w=600&q=80" onerror="this.src='assets/img/about.jpg'" alt="Hội An">
                                        <div class="loc-overlay">
                                            <h4 class="loc-title">Phố Cổ Hội An</h4>
                                            <p class="loc-desc">Di sản văn hóa</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col">
                                <a href="touristLocation" class="loc-card-wrap">
                                    <div class="loc-card">
                                        <img src="https://images.unsplash.com/photo-1583417319070-4a69db38a482?auto=format&fit=crop&w=600&q=80" onerror="this.src='assets/img/about.jpg'" alt="Bà Nà Hills">
                                        <div class="loc-overlay">
                                            <h4 class="loc-title">Bà Nà Hills</h4>
                                            <p class="loc-desc">Đường lên tiên cảnh</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col">
                                <a href="touristLocation" class="loc-card-wrap">
                                    <div class="loc-card">
                                        <img src="https://images.unsplash.com/photo-1555939594-58d7cb561ad1?auto=format&fit=crop&w=600&q=80" onerror="this.src='assets/img/about.jpg'" alt="Ngũ Hành Sơn">
                                        <div class="loc-overlay">
                                            <h4 class="loc-title">Ngũ Hành Sơn</h4>
                                            <p class="loc-desc">Khám phá hang động</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Sleek Premium Full-width Horizontal Stats Row -->
                    <div class="row pt-5 mt-4 border-top text-center" style="border-color: #f0f0f0 !important;" data-aos="fade-up" data-aos-delay="150">
                        <div class="col-lg-3 col-md-6 mb-4 mb-lg-0" style="position: relative;">
                            <div class="d-flex flex-column align-items-center">
                                <i class="fa-solid fa-users" style="font-size: 1.8rem; color: #c4a14b; margin-bottom: 15px;"></i>
                                <div style="font-size: 2.8rem; font-weight: 400; color: #1a1a1a; line-height: 1; margin-bottom: 10px; font-family: 'Times New Roman', serif;">2,324<span style="font-size: 1.5rem; color: #c4a14b; font-weight: 600; vertical-align: super;">+</span></div>
                                <div style="font-size: 0.75rem; font-weight: 700; color: #888; text-transform: uppercase; letter-spacing: 2px; font-family: 'Plus Jakarta Sans', sans-serif;">Khách Hàng</div>
                            </div>
                            <div class="d-none d-lg-block" style="position: absolute; right: 0; top: 10%; height: 80%; width: 1px; background-color: #f5f5f5;"></div>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-4 mb-lg-0" style="position: relative;">
                            <div class="d-flex flex-column align-items-center">
                                <i class="fa-solid fa-calendar-check" style="font-size: 1.8rem; color: #c4a14b; margin-bottom: 15px;"></i>
                                <div style="font-size: 2.8rem; font-weight: 400; color: #1a1a1a; line-height: 1; margin-bottom: 10px; font-family: 'Times New Roman', serif;">20<span style="font-size: 1.5rem; color: #c4a14b; font-weight: 600; vertical-align: super;">+</span></div>
                                <div style="font-size: 0.75rem; font-weight: 700; color: #888; text-transform: uppercase; letter-spacing: 2px; font-family: 'Plus Jakarta Sans', sans-serif;">Năm Hoạt Động</div>
                            </div>
                            <div class="d-none d-lg-block" style="position: absolute; right: 0; top: 10%; height: 80%; width: 1px; background-color: #f5f5f5;"></div>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0" style="position: relative;">
                            <div class="d-flex flex-column align-items-center">
                                <i class="fa-solid fa-handshake" style="font-size: 1.8rem; color: #c4a14b; margin-bottom: 15px;"></i>
                                <div style="font-size: 2.8rem; font-weight: 400; color: #1a1a1a; line-height: 1; margin-bottom: 10px; font-family: 'Times New Roman', serif;">55<span style="font-size: 1.5rem; color: #c4a14b; font-weight: 600; vertical-align: super;">+</span></div>
                                <div style="font-size: 0.75rem; font-weight: 700; color: #888; text-transform: uppercase; letter-spacing: 2px; font-family: 'Plus Jakarta Sans', sans-serif;">Đối Tác</div>
                            </div>
                            <div class="d-none d-lg-block" style="position: absolute; right: 0; top: 10%; height: 80%; width: 1px; background-color: #f5f5f5;"></div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex flex-column align-items-center">
                                <i class="fa-solid fa-user-tie" style="font-size: 1.8rem; color: #c4a14b; margin-bottom: 15px;"></i>
                                <div style="font-size: 2.8rem; font-weight: 400; color: #1a1a1a; line-height: 1; margin-bottom: 10px; font-family: 'Times New Roman', serif;">150<span style="font-size: 1.5rem; color: #c4a14b; font-weight: 600; vertical-align: super;">+</span></div>
                                <div style="font-size: 0.75rem; font-weight: 700; color: #888; text-transform: uppercase; letter-spacing: 2px; font-family: 'Plus Jakarta Sans', sans-serif;">Nhân Viên</div>
                            </div>
                        </div>
                    </div>

                </div>
            </section><!-- /About Section -->

            <!-- Services Section -->

            <!-- ══ FAQ Preview Section ══ -->
            <section id="faq-preview" style="padding: 80px 0; background: #f9f8f6;">
                <div class="container">
                    <!-- Header -->
                    <div style="text-align:center; margin-bottom: 50px;" data-aos="fade-up">
                        <span style="font-family:'Plus Jakarta Sans',sans-serif; font-size:0.78rem; font-weight:700; letter-spacing:4px; text-transform:uppercase; color:#b59349;">Giải đáp thắc mắc</span>
                        <h2 style="font-family:'Plus Jakarta Sans',sans-serif; font-weight:800; font-size:2rem; color:#1a1816; margin:10px 0 0; letter-spacing:-0.5px;">Câu Hỏi Thường Gặp</h2>
                        <p style="color:#888; font-size:14px; margin-top:10px;">Tìm câu trả lời nhanh cho những thắc mắc phổ biến nhất</p>
                    </div>

                    <!-- 2-column FAQ grid -->
                    <div style="display:grid; grid-template-columns:1fr 1fr; gap: 0 50px; max-width:960px; margin:0 auto;" data-aos="fade-up" data-aos-delay="100">
                        <c:forEach items="${listFAQ}" var="faq" begin="0" end="9">
                            <div class="home-faq-item" onclick="this.classList.toggle('open')">
                                <div class="home-faq-q"><span>${faq.question}</span><i class="fas fa-chevron-down"></i></div>
                                <div class="home-faq-a">${faq.answer}</div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- View all link -->
                    <div style="text-align:center; margin-top:44px;" data-aos="fade-up" data-aos-delay="200">
                        <a href="FAQ" style="display:inline-flex;align-items:center;gap:8px;border:2px solid #b59349;color:#b59349;font-weight:700;font-size:14px;padding:13px 32px;border-radius:50px;text-decoration:none;letter-spacing:0.5px;transition:all 0.3s;" onmouseover="this.style.background='#b59349';this.style.color='#fff'" onmouseout="this.style.background='';this.style.color='#b59349'">
                            Xem tất cả câu hỏi <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </section>

            <!-- Testimonials Section -->
            <section id="testimonials" class="testimonials section">

                <img src="assets/img/testimonials-bg.jpg" class="testimonials-bg" alt>

                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="swiper init-swiper">
                        <script type="application/json" class="swiper-config">
                            {
                            "loop": true,
                            "speed": 600,
                            "autoplay": {
                            "delay": 5000
                            },
                            "slidesPerView": "auto",
                            "pagination": {
                            "el": ".swiper-pagination",
                            "type": "bullets",
                            "clickable": true
                            }
                            }
                        </script>
                        <div class="swiper-wrapper">
                            <c:forEach items="${listF}" var="feedback">
                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <img src="${feedback.customerImage}" class="testimonial-img" alt>
                                        <h3>${feedback.customerName}</h3>
                                        <h4>Rental Customer</h4>
                                        <c:forEach begin="1" end="${(feedback.productRate + feedback.serviceRate + feedback.deliveryRate) / 3}" var="star">
                                            <span style="color: #F7D000;" class="ion-ios-star"></span>
                                        </c:forEach>
                                        <c:forEach begin="${(feedback.productRate + feedback.serviceRate + feedback.deliveryRate) / 3 + 1}" end="5" var="emptyStar">
                                            <span class="ion-ios-star-outline"></span>
                                        </c:forEach>
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>
                                            <span>${feedback.content}</span>
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                    </div>
                                </div><!-- End testimonial item -->
                            </c:forEach>


                        </div>
                        <div class="swiper-pagination"></div>
                    </div>

                </div>

            </section><!-- /Testimonials Section -->
            
        </main>

        <jsp:include page="/includes/customer/footer.jsp" />

        <!-- Scroll Top -->
        <a href="#" id="scroll-top"
           class="scroll-top d-flex align-items-center justify-content-center"
           style="background: #b59349;"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Preloader -->
        <div id="preloader"></div>


        <script>
            window.embeddedChatbotConfig = {
                chatbotId: "qUNf-UR7ycIWmYS6ZiWCL",
                domain: "www.chatbase.co"
            }
            function SidebarAction() {
                const sidebar = document.getElementById('sidebar');
                const sidebarToggle = document.getElementById('sidebarAction');
                sidebar.classList.toggle('open');
                sidebarToggle.classList.toggle('open');
                if (sidebarToggle.classList.contains('open')) {
                    const notificationDot = document.querySelector('.notification-dot');
                    if (notificationDot) notificationDot.style.display = 'none';
                }
            }

            function showHeroError(msg) {
                var errDiv = document.getElementById('heroErrorMsg');
                if (errDiv) {
                    errDiv.style.display = 'block';
                    errDiv.querySelector('span').innerText = msg;
                } else {
                    alert(msg);
                }
            }

            // Hero form submit: save params → go to motorbikes (Xe Máy selection)
            function heroFormSubmit(e) {
                e.preventDefault();
                var startDate = document.getElementById('heroStartDate').value;
                var endDate   = document.getElementById('heroEndDate').value;
                var pickup    = document.getElementById('heroPickupLoc').value;
                var returnL   = document.getElementById('heroReturnLoc').value;

                // Hide previous errors
                var errDiv = document.getElementById('heroErrorMsg');
                if (errDiv) errDiv.style.display = 'none';

                if (!pickup.trim() || !returnL.trim() || !startDate || !endDate) {
                    showHeroError("Vui lòng nhập đầy đủ địa điểm và thời gian!");
                    return false;
                }

                var start = new Date(startDate);
                var end = new Date(endDate);
                
                var startHour = start.getHours();
                var startMinute = start.getMinutes();
                var endHour = end.getHours();
                var endMinute = end.getMinutes();

                if (startHour < 7 || startHour > 23 || (startHour === 23 && startMinute > 0) ||
                    endHour < 7 || endHour > 23 || (endHour === 23 && endMinute > 0)) {
                    showHeroError("Chỉ nhận/trả xe trong giờ hoạt động (07:00 - 23:00)!");
                    return false;
                }

                var minTime = new Date();
                minTime.setHours(minTime.getHours() + 1); // Require at least 1 hour advance booking
                minTime.setMinutes(minTime.getMinutes() - 5); // 5 min grace period for filling out the form

                if (start < minTime) {
                    showHeroError("Vui lòng đặt xe trước 1 tiếng");
                    return false;
                }

                if (end <= start) {
                    showHeroError("Thời gian trả xe phải sau thời gian nhận xe!");
                    return false;
                }

                // Store in sessionStorage for booking page to read
                try {
                    sessionStorage.setItem('hs_startDate',  startDate);
                    sessionStorage.setItem('hs_endDate',    endDate);
                    sessionStorage.setItem('hs_pickup',     pickup);
                    sessionStorage.setItem('hs_returnLoc',  returnL);
                } catch(ex) {}
                // Navigate directly to booking page (step 2 = XE MÁY)
                window.location.href = 'booking';
                return false;
            }

            // Booking widget helpers
            function toggleReturnLocation(cb) {
                var returnLoc = document.getElementById('heroReturnLoc');
                var pickupLoc = document.getElementById('heroPickupLoc');
                if (cb.checked) {
                    returnLoc.value = pickupLoc ? pickupLoc.value : '';
                    returnLoc.disabled = true;
                    returnLoc.style.opacity = '0.5';
                    if (pickupLoc) pickupLoc.oninput = function() { returnLoc.value = this.value; };
                } else {
                    returnLoc.disabled = false;
                    returnLoc.style.opacity = '1';
                    if (pickupLoc) pickupLoc.oninput = null;
                }
            }

            // Set default dates: now -> now+2days
            (function() {
                function pad(n) { return String(n).padStart(2,'0'); }
                function fmt(d) {
                    return d.getFullYear() + '-' + pad(d.getMonth()+1) + '-' + pad(d.getDate())
                         + 'T' + pad(d.getHours()) + ':' + pad(d.getMinutes());
                }
                var now = new Date(); now.setMinutes(0,0,0);
                var end = new Date(now); end.setDate(end.getDate()+2);
                var s = document.getElementById('heroStartDate');
                var e = document.getElementById('heroEndDate');
                if(s) s.value = fmt(now);
                if(e) e.value = fmt(end);
            })();

        </script>
        


        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
