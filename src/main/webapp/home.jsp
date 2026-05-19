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

            /* Custom Hero Layout & Glassmorphism */
            #hero {
                min-height: 100vh;
                display: flex;
                align-items: center;
                position: relative;
                background: url('https://images.unsplash.com/photo-1558981806-ec527fa84c39?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') no-repeat center center/cover !important;
                padding: 140px 0 80px 0;
            }
            .hero-overlay {
                position: absolute;
                inset: 0;
                background: linear-gradient(180deg, rgba(20, 18, 16, 0.65) 0%, rgba(20, 18, 16, 0.85) 100%);
                z-index: 2;
            }
            #hero .container {
                position: relative;
                z-index: 3;
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
        </style>
    </head>

    <body class="index-page">

        <jsp:include page="/includes/customer/navbar.jsp" />

        <main class="main">

            <!-- Hero Section -->
            <section id="hero" class="hero section">
                <div class="hero-overlay"></div>
                <div class="container">
                    <div class="row gy-5 justify-content-center text-center">
                        <div class="col-lg-8 d-flex flex-column justify-content-center align-items-center">
                            <div class="hero-text-card" data-aos="fade-up" style="text-align: center; margin-bottom: 0 !important;">
                                <h2 style="text-align: center;">Khám phá cùng <span style="color: #b59349;">SmartRide</span></h2>
                                <p class="hero-desc" style="max-width: 680px; margin: 0 auto 35px auto !important; text-align: center;">Hành trình bạn tìm kiếm, chúng tôi đồng hành để mang đến cho bạn trải nghiệm thuê xe máy đơn giản, an toàn và đầy thú vị.</p>
                                <div class="rentalbutton" style="text-align: center;">
                                    <a href="motorcycle" class="rental">THUÊ XE NGAY</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty requestScope.book && statusBooking != 'Đã hủy'}">
                    <div class="follow-container">
                        <div class="sidebar" id="sidebar">
                            <div class="sidebar-content">
                                <p>Cảm ơn bạn đã sử dụng dịch vụ của <span><strong>COLOR<span class="bike">BIKE</span></strong></span>, hãy bấm vào đây để theo dõi nhanh đơn hàng của mình nhé!</p>
                                <a href="bookingHistoryDetail?bookingId=${requestScope.book.bookingID}">
                                    <button>Theo dõi đơn hàng</button>
                                </a>                   
                            </div>
                        </div>
                        <div onclick="SidebarAction()" class="sidebar-action" id="sidebarAction">
                            <span class="arrow-icon"><i class="bi bi-play-fill"></i></span>
                            <div class="notification-dot"></div>
                        </div>
                    </div>
                </c:if>
            </section><!-- /Hero Section -->
            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <span>Vì sao chọn chúng tôi<br></span>
                <h2>Vì sao chọn chúng tôi</h2>
                <p>Sắc màu hành trình, chọn chúng tôi để khởi đầu</p>
            </div><!-- End Section Title -->
            <!-- Featured Services Section -->
            <section id="featured-services" class="featured-services section">

                <div class="container">

                    <div class="row gy-4">

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="100">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-bars"></i></div>
                            <div>
                                <h4 class="title">Lựa chọn đa dạng</h4>
                                <p class="description">Hàng trăm loại xe đa dạng ở nhiều địa
                                    điểm tại Đà Nẵng, phù hợp với mọi mục đích của bạn.</p>
                            </div>
                        </div>
                        <!-- End Service Item -->

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="200">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-motorcycle"></i></div>
                            <div>
                                <h4 class="title">Thuận lợi</h4>
                                <p class="description">Dễ dàng tìm kiếm, so sánh và đặt xe máy
                                    bạn muốn chỉ với vài cú nhấp chuột.</p>
                            </div>
                        </div><!-- End Service Item -->

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="300">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-money-bill-transfer"></i></div>
                            <div>
                                <h4 class="title">Giá cả cạnh tranh</h4>
                                <p class="description">Giá thuê được niêm yết công khai và rẻ
                                    hơn tới 10% so với giá truyền thống.</p>
                            </div>
                        </div><!-- End Service Item -->

                    </div>
                    <div class="row gy-4">

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="100">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-circle-check"></i></div>
                            <div>
                                <h4 class="title">Đáng tin cậy</h4>
                                <p class="description">Tất cả các xe đều có tuổi thọ dưới 3 năm
                                    và được bảo dưỡng định kỳ.</p>
                            </div>
                        </div>
                        <!-- End Service Item -->

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="200">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-truck"></i></div>
                            <div>
                                <h4 class="title">Dịch vụ hỗ trợ 24/7</h4>
                                <p class="description">Có nhân viên hỗ trợ khách hàng trong suốt
                                    quá trình thuê xe.</p>
                            </div>
                        </div><!-- End Service Item -->

                        <div class="col-lg-4 col-md-6 service-item d-flex"
                             data-aos="fade-up" data-aos-delay="300">
                            <div class="icon flex-shrink-0"><i
                                    class="fa-solid fa-calendar-days"></i></div>
                            <div>
                                <h4 class="title">Thời gian thuê linh hoạt</h4>
                                <p class="description">Bạn có thể đặt xe máy trong bất kỳ khoảng
                                    thời gian nào và gia hạn nếu muốn.</p>
                            </div>
                        </div><!-- End Service Item -->

                    </div>

                </div>

            </section><!-- /Featured Services Section -->


            <div class="container section-title" data-aos="fade-up">
                <span>TOP Sản Phẩm<br></span>
                <h2>TOP Sản Phẩm</h2>
            </div>
            <iframe src="slide.jsp" style="width: 99.1%; height: 540px; padding: 0; margin: 0;"></iframe>


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
            <section id="about" class="about section" style="margin-top: 3%; margin-bottom: 3%;">

                <div class="container">

                    <div class="row gy-4">

                        <div class="col-lg-6 position-relative align-self-start order-lg-last order-first" data-aos="fade-up" data-aos-delay="200">
                            <img src="assets/img/about.jpg" class="img-fluid rounded-4" style="box-shadow: 0 10px 30px rgba(0,0,0,0.06); border: 1px solid #eae6df;" alt="About SmartRide">
                        </div>

                        <div class="col-lg-6 content order-last  order-lg-first"
                             data-aos="fade-up" data-aos-delay="100">
                            <h3>Về Chúng Tôi</h3>
                            <p>
                                Chúng tôi là đối tác lý tưởng của bạn trong mọi chuyến đi bằng
                                xe máy tại Đà Nẵng. Với sứ mệnh mang đến sự thuận tiện và
                                trải nghiệm đáng nhớ, chúng tôi cung cấp dịch vụ cho thuê xe máy
                                với đội ngũ phương tiện đa dạng và chất lượng hàng đầu.
                            </p>
                            <ul>
                                <li>
                                    <i class="bi bi-diagram-3"></i>
                                    <div>
                                        <h5>Đa dạng sản phẩm</h5>
                                        <p>Từ các loại xe máy tiện dụng đến những mẫu xe cao cấp,
                                            chúng tôi luôn có sự lựa chọn phù hợp với nhu cầu của
                                            bạn.</p>
                                    </div>
                                </li>
                                <li>
                                    <i class="bi bi-fullscreen-exit"></i>
                                    <div>
                                        <h5>Dịch vụ chuyên nghiệp</h5>
                                        <p>Đội ngũ nhân viên tận tâm sẵn sàng phục vụ, từ việc tư
                                            vấn cho đến hỗ trợ kỹ thuật, để bạn có một chuyến đi suôn
                                            sẻ và an toàn.</p>
                                    </div>
                                </li>
                                <li>
                                    <i class="bi bi-broadcast"></i>
                                    <div>
                                        <h5>Tiêu chuẩn chất lượng cao</h5>
                                        <p>Tất cả các xe đều được bảo trì thường xuyên và kiểm tra
                                            kỹ lưỡng trước khi cho thuê, đảm bảo sự an toàn và tin
                                            cậy.</p>
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </div>

                    <!-- Sleek Premium Full-width Horizontal Stats Row -->
                    <div class="row mt-5 pt-5 border-top text-center" style="border-color: rgba(181, 147, 73, 0.15) !important;" data-aos="fade-up" data-aos-delay="150">
                        <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                            <div class="d-flex flex-column align-items-center">
                                <div class="d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px; background: rgba(181, 147, 73, 0.08); border-radius: 50%;">
                                    <i class="fa-solid fa-users" style="font-size: 1.5rem; color: #b59349;"></i>
                                </div>
                                <div style="font-size: 2.6rem; font-weight: 800; color: #1a1816; line-height: 1; margin-bottom: 6px;">2,324+</div>
                                <div style="font-size: 0.9rem; font-weight: 700; color: #b59349; text-transform: uppercase; letter-spacing: 1.5px;">Khách Hàng</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                            <div class="d-flex flex-column align-items-center">
                                <div class="d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px; background: rgba(181, 147, 73, 0.08); border-radius: 50%;">
                                    <i class="fa-solid fa-calendar-check" style="font-size: 1.5rem; color: #b59349;"></i>
                                </div>
                                <div style="font-size: 2.6rem; font-weight: 800; color: #1a1816; line-height: 1; margin-bottom: 6px;">20+</div>
                                <div style="font-size: 0.9rem; font-weight: 700; color: #b59349; text-transform: uppercase; letter-spacing: 1.5px;">Năm Hoạt Động</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <div class="d-flex flex-column align-items-center">
                                <div class="d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px; background: rgba(181, 147, 73, 0.08); border-radius: 50%;">
                                    <i class="fa-solid fa-handshake" style="font-size: 1.5rem; color: #b59349;"></i>
                                </div>
                                <div style="font-size: 2.6rem; font-weight: 800; color: #1a1816; line-height: 1; margin-bottom: 6px;">55+</div>
                                <div style="font-size: 0.9rem; font-weight: 700; color: #b59349; text-transform: uppercase; letter-spacing: 1.5px;">Đối Tác</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex flex-column align-items-center">
                                <div class="d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px; background: rgba(181, 147, 73, 0.08); border-radius: 50%;">
                                    <i class="fa-solid fa-user-tie" style="font-size: 1.5rem; color: #b59349;"></i>
                                </div>
                                <div style="font-size: 2.6rem; font-weight: 800; color: #1a1816; line-height: 1; margin-bottom: 6px;">150+</div>
                                <div style="font-size: 0.9rem; font-weight: 700; color: #b59349; text-transform: uppercase; letter-spacing: 1.5px;">Nhân Viên</div>
                            </div>
                        </div>
                    </div>

                    </div>

                </div>

            </section><!-- /About Section -->

            <!-- Services Section -->

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
                    if (notificationDot) {
                        notificationDot.style.display = 'none';
                    }
                }
            }
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
