<%-- 
    Document   : about
    Created on : May 25, 2024, 4:57:50 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Về Chúng Tôi - SmartRide</title>
        <link rel="stylesheet"
              href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;1,400&family=Plus+Jakarta+Sans:wght@300;400;500&display=swap" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        
        <style>
            :root {
                --primary: #b59349;
                --text-dark: #1a1816;
                --text-body: #666666;
                --bg-light: #ffffff;
                --white: #ffffff;
            }

            body {
                background-color: var(--bg-light) !important;
                color: var(--text-body) !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                overflow-x: hidden;
            }

            h1, h2, h3, h4, h5, h6 {
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                color: var(--text-dark) !important;
                font-weight: 800;
                letter-spacing: -0.5px;
            }

            .noidung {
                padding-top: 0;
                margin-top: 75px; 
            }

            /* --- HERO SECTION --- */
            .hero-wedding-style {
                position: relative;
                width: 100%;
                height: 80vh;
                min-height: 600px;
                /* Sử dụng ảnh đen tĩnh mịch tạo sự sang trọng */
                background: url('images/gen_gallery_2.png') center/cover no-repeat;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
            }

            .hero-fade-bottom {
                position: absolute;
                bottom: -2px;
                left: 0;
                width: 100%;
                height: 300px;
                background: linear-gradient(to bottom, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
                z-index: 2;
            }

            /* Lớp phủ tối hơn cho ảnh Hero nổi bật chữ trắng */
            .hero-overlay {
                position: absolute;
                top: 0; left: 0; width: 100%; height: 100%;
                background: rgba(0, 0, 0, 0.6);
                z-index: 1;
            }

            .hero-content {
                position: relative;
                z-index: 3;
                max-width: 800px;
                padding: 0 20px;
                color: var(--white);
            }
            
            .hero-subtitle {
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-size: 0.9rem;
                letter-spacing: 4px;
                text-transform: uppercase;
                margin-bottom: 20px;
                display: block;
                color: var(--primary);
                font-weight: 500;
            }

            .hero-content h1 {
                font-size: 4rem;
                font-weight: 800;
                color: var(--white) !important;
                margin-bottom: 15px;
                text-shadow: 2px 2px 10px rgba(0,0,0,0.5);
                text-transform: uppercase;
            }

            .hero-divider {
                width: 40px;
                height: 2px;
                background-color: var(--primary);
                margin: 20px auto 30px auto;
            }

            .hero-content p {
                font-size: 1.1rem;
                font-weight: 300;
                letter-spacing: 1px;
                color: rgba(255,255,255,0.9);
                text-shadow: 1px 1px 5px rgba(0,0,0,0.8);
            }


            /* --- MASONRY & GENERAL --- */
            .section-padding {
                padding: 100px 0;
            }

            .story-subtitle {
                font-size: 0.8rem;
                letter-spacing: 3px;
                text-transform: uppercase;
                color: var(--primary);
                margin-bottom: 15px;
                display: block;
            }

            .story-title {
                font-size: 3rem;
                line-height: 1.2;
                margin-bottom: 30px;
                font-weight: 800;
            }

            .story-text {
                font-size: 1.05rem;
                line-height: 1.8;
                font-weight: 300;
                margin-bottom: 20px;
            }

            /* Fix lỗi cắt ảnh: Dùng object-fit contain cho các ảnh xe trên nền trắng để không bị mất góc */
            .masonry-grid {
                display: grid;
                grid-template-columns: 1.5fr 1fr;
                gap: 20px;
                height: 600px;
            }

            .masonry-main {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 4px;
            }

            .masonry-side {
                display: flex;
                flex-direction: column;
                gap: 20px;
                height: 100%;
            }

            .masonry-side img {
                width: 100%;
                height: calc(50% - 10px);
                /* Contain giúp ảnh xe ko bị cắt đầu/đuôi */
                object-fit: contain; 
                border-radius: 4px;
                background-color: #fbfaf8; /* Tạo nền nhẹ cho ảnh xe */
            }


            /* --- MINIMALIST VALUES (3 Columns) with Hover --- */
            .values-section {
                padding: 80px 0 120px;
                background-color: #faf9f7; 
                text-align: center;
            }

            .values-header {
                margin-bottom: 80px;
            }

            /* Hiệu ứng Đổi màu khi Trỏ chuột (Hover Invert) */
            .value-item {
                padding: 40px 30px;
                text-align: left;
                border-left: 1px solid rgba(0,0,0,0.08);
                height: 100%;
                transition: all 0.4s ease;
                background-color: transparent;
                cursor: default;
            }

            .value-item:hover {
                background-color: #000000;
            }

            .value-number {
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-weight: 800;
                font-size: 3rem;
                color: rgba(181, 147, 73, 0.4);
                margin-bottom: 15px;
                display: block;
                transition: color 0.4s ease;
            }

            .value-title {
                font-size: 1.5rem;
                margin-bottom: 15px;
                font-weight: 700;
                transition: color 0.4s ease;
                letter-spacing: -0.5px;
            }

            .value-desc {
                font-size: 0.95rem;
                line-height: 1.8;
                font-weight: 300;
                transition: color 0.4s ease;
            }

            .value-item:hover .value-number {
                color: var(--primary);
            }
            .value-item:hover .value-title, 
            .value-item:hover .value-desc {
                color: #ffffff !important;
            }

            @media (min-width: 992px) {
                .col-lg-4:first-child .value-item { border-left: none; }
            }


            /* --- FULL WIDTH GALLERY --- */
            .gallery-container {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                width: 100%;
                gap: 15px;
                padding: 0 15px;
                margin-bottom: 60px;
            }

            .gallery-img-wrapper {
                position: relative;
                overflow: hidden;
                padding-top: 130%; 
                border-radius: 16px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.08);
                background-color: #f8f9fa;
            }

            .gallery-img-wrapper img {
                position: absolute;
                top: 0; left: 0;
                width: 100%; height: 100%;
                object-fit: cover !important;
                border-radius: 0 !important; /* Force reset any inline border radius */
                transition: transform 0.6s cubic-bezier(0.165, 0.84, 0.44, 1);
            }

            .gallery-img-wrapper:hover img {
                transform: scale(1.08);
            }

            .btn-book {
                display: inline-block;
                background: #1a1816;
                color: #fff !important;
                padding: 15px 40px;
                letter-spacing: 2px;
                font-size: 0.85rem;
                text-transform: uppercase;
                text-decoration: none;
                margin-top: 30px;
                transition: all 0.3s;
            }

            .btn-book:hover {
                background: var(--primary);
            }

            @media (max-width: 991px) {
                .masonry-grid { grid-template-columns: 1fr; height: auto; }
                .masonry-side { flex-direction: row; height: 300px; }
                .value-item { border-left: none; border-bottom: 1px solid rgba(0,0,0,0.08); padding: 30px; margin-bottom: 0; text-align: center; }
                .gallery-container { grid-template-columns: repeat(2, 1fr); }
            }
        </style>

        <jsp:include page="/includes/customer/header.jsp" />
    </head>
    <body>
        <jsp:include page="/includes/customer/navbar.jsp" />
        
        <div class="noidung">
            
            <!-- 1. HERO SECTION -->
            <section class="hero-wedding-style">
                <div class="hero-overlay"></div>
                <div class="hero-content" data-aos="fade-up" data-aos-duration="1500">
                    <span class="hero-subtitle">Về Chúng Tôi</span>
                    <h1>Trải Nghiệm SmartRide</h1>
                    <div class="hero-divider"></div>
                    <p>Dịch vụ cho thuê xe máy cao cấp tại Đà Nẵng</p>
                </div>
                <div class="hero-fade-bottom"></div>
            </section>

            <!-- 2. STORY SECTION -->
            <section class="section-padding bg-white">
                <div class="container">
                    <div class="row align-items-center gy-5">
                        <div class="col-lg-6 pe-lg-5" data-aos="fade-right">
                            <span class="story-subtitle">Câu chuyện của chúng tôi</span>
                            <h2 class="story-title">Hơn 5 năm đồng hành trên mọi cung đường</h2>
                            <p class="story-text">SmartRide được thành lập với một niềm tin đơn giản: Mỗi chuyến đi đều mang một câu chuyện riêng và xứng đáng được trải nghiệm trọn vẹn nhất. Từ những chiếc xe đầu tiên, chúng tôi đã không ngừng theo đuổi sự hoàn hảo trong từng dịch vụ.</p>
                            <p class="story-text">Với hàng ngàn khách hàng đã tin tưởng, chúng tôi tự hào mang đến những dòng xe đẳng cấp, giúp bạn tự do khám phá Đà Nẵng, Hội An và khắp miền Trung Việt Nam.</p>
                            
                            <a href="home" class="btn-book">Khám Phá Xe Ngay</a>
                        </div>
                        <div class="col-lg-6" data-aos="fade-left">
                            <div class="masonry-grid">
                                <!-- Trả lại các ảnh phong cảnh / xe gốc có sẵn trên web để căn chỉnh lại -->
                                <img src="images/imageTour1.jpg" class="masonry-main shadow-sm" alt="SmartRide Experience" onerror="this.src='images/imageM12.jpg'">
                                <div class="masonry-side">
                                    <!-- Dùng object-fit: contain trong CSS để không bị cắt xén xe -->
                                    <img src="images/imageM12.jpg" class="shadow-sm" alt="SmartRide Suzuki" onerror="this.src='images/imageM5.jpg'">
                                    <img src="images/xe1.jpg" class="shadow-sm" alt="SmartRide Yamaha" onerror="this.src='images/imageM9.jpg'">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- 3. TEAM SECTION (Đội Ngũ - Bổ sung theo yêu cầu) -->
            <section class="section-padding bg-white pt-0">
                <div class="container text-center">
                    <div data-aos="fade-up">
                        <span class="story-subtitle">Đội Ngũ</span>
                        <h2 class="story-title">Những người đứng sau tay lái</h2>
                        <p class="story-text mx-auto" style="max-width: 700px; margin-bottom: 50px;">Đội ngũ SmartRide không chỉ là những kỹ thuật viên hay nhân viên hỗ trợ. Chúng tôi là những người bạn đồng hành, am hiểu từng góc phố, từng cung đèo, luôn sẵn sàng hỗ trợ bạn 24/7 trên mọi hành trình.</p>
                    </div>
                    
                    <div class="row gy-4 justify-content-center">
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                            <img src="images/team_mechanic.png" alt="Team Member - Mechanic" class="img-fluid rounded-2 shadow-sm" style="height: 400px; object-fit: cover; width: 100%;">
                        </div>
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                            <img src="images/team_support.png" alt="Team Member - Support" class="img-fluid rounded-2 shadow-sm" style="height: 400px; object-fit: cover; width: 100%;">
                        </div>
                        <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                            <img src="images/team_guide.png" alt="Team Member - Guide" class="img-fluid rounded-2 shadow-sm" style="height: 400px; object-fit: cover; width: 100%;">
                        </div>
                    </div>
                </div>
            </section>

            <!-- 4. MINIMALIST VALUES (Hover effects) -->
            <section class="values-section">
                <div class="container">
                    <div class="values-header" data-aos="fade-up">
                        <span class="story-subtitle">Triết lý dịch vụ</span>
                        <h2 class="story-title" style="font-size: 3rem;">Chúng tôi tin vào điều gì</h2>
                    </div>
                    
                    <div class="row gy-0 align-items-stretch">
                        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                            <div class="value-item">
                                <span class="value-number">01</span>
                                <h3 class="value-title">Nhanh Chóng & <i>Tiện Lợi</i></h3>
                                <p class="value-desc">Chúng tôi hiểu thời gian của bạn là quý giá. Thủ tục thuê xe được tối giản hóa đến mức tối đa, giúp bạn nhận xe nhanh chóng chỉ trong 5 phút và sẵn sàng cho hành trình.</p>
                            </div>
                        </div>
                        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="value-item">
                                <span class="value-number">02</span>
                                <h3 class="value-title">An Toàn <i>Tuyệt Đối</i></h3>
                                <p class="value-desc">Mỗi chiếc xe trước khi giao đến tay khách hàng đều phải trải qua quy trình kiểm tra bảo dưỡng nghiêm ngặt. Động cơ mượt mà, phanh lốp hoàn hảo — tất cả vì sự an tâm của bạn.</p>
                            </div>
                        </div>
                        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
                            <div class="value-item">
                                <span class="value-number">03</span>
                                <h3 class="value-title">Hỗ Trợ <i>Tận Tâm</i></h3>
                                <p class="value-desc">Đội ngũ của chúng tôi luôn đồng hành cùng bạn 24/7. Dù bạn đang ở bán đảo Sơn Trà hay trên đỉnh đèo Hải Vân, chúng tôi luôn sẵn sàng hỗ trợ mọi vấn đề phát sinh trên đường.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- 5. FULL WIDTH GALLERY -->
            <section>
                <div class="gallery-container">
                    <div class="gallery-img-wrapper" data-aos="fade-in" data-aos-delay="0">
                        <!-- Sử dụng ảnh xe máy / phong cảnh gốc dự án -->
                        <img src="images/imageTour5.jpg" loading="lazy" alt="Gallery 1" onerror="this.src='images/imageM12.jpg'">
                    </div>
                    <div class="gallery-img-wrapper" data-aos="fade-in" data-aos-delay="150">
                        <img src="images/imageTour6.jpg" loading="lazy" alt="Gallery 2" onerror="this.src='images/imageM11.jpg'">
                    </div>
                    <div class="gallery-img-wrapper" data-aos="fade-in" data-aos-delay="300">
                        <img src="images/imageTour7.jpg" loading="lazy" alt="Gallery 3" onerror="this.src='images/imageM5.jpg'">
                    </div>
                    <div class="gallery-img-wrapper" data-aos="fade-in" data-aos-delay="450">
                        <img src="images/imageTour8.jpg" loading="lazy" alt="Gallery 4" onerror="this.src='images/imageM9.jpg'">
                    </div>
                </div>
            </section>

        </div>

        <jsp:include page="/includes/customer/footer.jsp" />
        
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/js/main.js"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                if(typeof AOS !== 'undefined') {
                    AOS.init({
                        duration: 1000,
                        easing: 'ease-out-cubic',
                        once: true,
                        offset: 50
                    });
                }
            });
        </script>
    </body>
</html>
