<%-- 
    Document   : about
    Created on : May 25, 2024, 4:57:50 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us - SmartRide</title>
        <link rel="stylesheet"
              href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet"
              href="https://unpkg.com/bs-brain@2.0.4/components/abouts/about-4/assets/css/about-4.css">


        <style>
            
            body, .body {
                background-color: #fbfaf8 !important;
                color: #2b2824 !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
            }
            .noidung{
                margin-top: 8%;
            }

            img:hover {
                transform: scale(1.05);
                box-shadow: 0 8px 24px rgba(181, 147, 73, 0.15);
            }
            /* Header Section */
            .about-header {
                text-align: center;
                margin-bottom: 3rem;
            }

            .about-header h2 {
                margin-bottom: 1.5rem;
                color: #1a1816 !important;
                font-family: 'Playfair Display', serif !important;
            }

            .btn-primary {
                background: #b59349 !important;
                border: none;
                color: #ffffff !important;
                font-weight: 600;
                padding: 12px 30px;
                text-transform: uppercase;
                transition: background-color 0.3s ease, transform 0.3s ease;
                border-radius: 50px;
            }

            .btn-primary:hover {
                background: #a38241 !important;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(181, 147, 73, 0.2);
            }

            /* Card Styles */
            .card {
                background-color: #ffffff !important;
                border: 1px solid #eae6df !important;
                border-radius: 10px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.03);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                height: 100%;
            }

            .card:hover {
                transform: translateY(-10px);
                box-shadow: 0 10px 40px rgba(181, 147, 73, 0.08);
                border-color: #b59349 !important;
            }

            .card img {
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
                object-fit: cover;
                height: 100%;
            }

            .card-body {
                padding: 1.5rem;
            }

            .card-title {
                font-size: 1.75rem;
                margin-bottom: 1rem;
                color: #b59349 !important;
                font-family: 'Playfair Display', serif !important;
                font-weight: 600;
            }

            .card-text {
                font-size: 1rem;
                color: #4a4744 !important;
            }

            /* Feature Styles */
            .feature-icon {
                flex-shrink: 0;
                font-size: 2.5rem;
                color: #b59349 !important;
                margin-right: 1rem;
            }

            .feature-text h2 {
                font-size: 1.5rem;
                color: #b59349 !important;
                font-family: 'Playfair Display', serif !important;
            }

            .feature-text p {
                color: #4a4744 !important;
            }

            /* Responsive Styles */
            @media (max-width: 768px) {
                .about-header {
                    padding: 0 1rem;
                }

                .row {
                    margin: 0;
                }

                .col-12,
                .col-md-6,
                .col-lg-6,
                .col-xl-5,
                .col-xl-7 {
                    padding: 0;
                }

                .mb-5 {
                    margin-bottom: 2rem;
                }
            }

            @media (min-width: 768px) {
                .order-md-1 {
                    order: 1;
                }

                .order-md-2 {
                    order: 2;
                }
            }
            
            .card{
                height: 250px !important;
                
            }
            
           
        </style>

        <jsp:include page="/includes/customer/header.jsp" />
    </head>
    <body>
        <jsp:include page="/includes/customer/navbar.jsp" />
        <div class="noidung">
            <section class="py-3 py-md-5 py-xl-8">
                <div class="container about-header" data-aos="fade-up">
                    <h3>Chào Mừng Đến Với SmartRide!</h3>
                    <h2 style="font-size: small;">SmartRide không chỉ là một dịch vụ cho thuê xe máy, mà còn là người bạn đồng hành đáng tin cậy của bạn trong mỗi chuyến phiêu lưu khám phá thành phố Đà Nẵng xinh đẹp. 
                        Chúng tôi tự hào là đơn vị cho thuê xe máy chính chủ với dịch vụ chất lượng cao, giúp bạn dễ dàng và thuận tiện trong việc di chuyển, 
                        khám phá mọi ngóc ngách của thành phố mà không phải lo lắng về vấn đề giao thông.</h2>
                    <a href="home" class="btn btn-lg btn-primary mt-4" data-aos="zoom-in">Tham Gia Ngay</a>
                </div>

                <div class="container mt-5">
                    <div class="row gy-4">
                        <div class="col-12 col-lg-6" data-aos="fade-right">
                            <div class="card bg-light p-3">
                                <div class="row g-0 align-items-center">
                                    <div class="col-md-5">
                                        <img src="images/logo.png?v=<%=System.currentTimeMillis()%>" class="img-fluid"
                                             alt="Why Choose Us?">
                                    </div>
                                    <div class="col-md-7">
                                        <div class="card-body">
                                            <h2 class="card-title">Tại sao chọn chúng tôi?</h2>
                                            <p class="card-text">SmartRide được thành lập từ niềm đam mê với xe máy và du lịch của đội ngũ sáng lập. 
                                                Chúng tôi hiểu rằng, để có một chuyến du lịch trọn vẹn, việc di chuyển không chỉ cần thuận tiện mà còn phải an toàn và đáng tin cậy.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-lg-6" data-aos="fade-left">
                            <div class="card bg-light p-3">
                                <div class="row g-0 align-items-center">
                                    <div class="col-md-5">
                                        <img src="assets/img/about.jpg" class="img-fluid"
                                             alt="Visionary Team">
                                    </div>
                                    <div class="col-md-7">
                                        <div class="card-body">
                                            <h2 class="card-title">Đội ngũ của chúng tôi</h2>
                                            <p class="card-text">Đội ngũ của chúng tôi là những người trẻ tuổi, nhiệt huyết và đầy kinh nghiệm. 
                                                Chúng tôi luôn sẵn sàng hỗ trợ bạn 24/7, từ việc tư vấn lựa chọn xe phù hợp cho đến hỗ trợ kỹ thuật trong suốt quá trình thuê xe.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container mt-5">
                    <div class="row gy-4 align-items-flex-start">
                        <div class="col-12 col-lg-6 col-xl-5" data-aos="zoom-in">
                            <img class="img-fluid rounded" loading="lazy"
                                 src="images/image_1.jpg" alt="About 1">
                        </div>
                        <div class="col-12 col-lg-6 col-xl-7" data-aos="fade-up">
                            <div>
                                <h2 class="mb-3">Tại Sao Chọn SmartRide?</h2>
                                <p class="lead fs-5 text-secondary mb-3">Chúng tôi không chỉ cho thuê xe máy, mà còn cung cấp cho bạn những lời khuyên và hướng dẫn du lịch tốt nhất để bạn có thể tận hưởng trọn vẹn chuyến đi của mình.</p>
                                <p class="mb-5">Hãy đến với SmartRide để khám phá Đà Nẵng theo cách hoàn toàn mới! Chúng tôi mong được đồng hành cùng bạn trong mỗi chuyến phiêu lưu.</p>
                                <div class="row gy-4">
                                    <div class="col-12 col-md-6">
                                        <div class="d-flex" data-aos="flip-left">
                                            <div class="feature-icon me-3">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="32"
                                                     height="32" fill="currentColor" class="bi bi-gear-fill"
                                                     viewBox="0 0 16 16">
                                                <path
                                                    d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z" />
                                                </svg>
                                            </div>
                                            <div class="feature-text">
                                                <h2 class="h4 mb-3">Chất lượng xe máy</h2>
                                                <p class="mb-0">Tất cả xe máy của chúng tôi đều được bảo dưỡng định kỳ để đảm bảo an toàn.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <div class="d-flex" data-aos="flip-right">
                                            <div class="feature-icon me-3">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="32"
                                                     height="32" fill="currentColor" class="bi bi-fire"
                                                     viewBox="0 0 16 16">
                                                <path
                                                    d="M8 16c3.314 0 6-2 6-5.5 0-1.5-.5-4-2.5-6 .25 1.5-1.25 2-1.25 2C11 4 9 .5 6 0c.357 2 .5 4-2 6-1.25 1-2 2.729-2 4.5C2 14 4.686 16 8 16Zm0-1c-1.657 0-3-1-3-2.75 0-.75.25-2 1.25-3C6.125 10 7 10.5 7 10.5c-.375-1.25.5-3.25 2-3.5-.179 1-.25 2 1 3 .625.5 1 1.364 1 2.25C11 14 9.657 15 8 15Z" />
                                                </svg>
                                            </div>
                                            <div class="feature-text">
                                                <h2 class="h4 mb-3">Đội ngũ nhiệt huyết</h2>
                                                <p class="mb-0">Đội ngũ hỗ trợ khách hàng của chúng tôi luôn sẵn lòng giúp đỡ bạn bất cứ lúc nào.</p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container" style="margin-top: 5%;">
                    <div class="row gx-4 align-items-flex-start justify-content-between">
                        <div class="col-md-5 order-2 order-md-1" data-aos="fade-right">
                            <div class="mt-5 mt-md-0">
                                <h2 class="display4 fw-bold">Sứ Mệnh Của Chúng Tôi</h2>
                                <p class="lead">Mục tiêu của SmartRide là không chỉ cung cấp xe máy chất lượng cho khách hàng, mà còn tạo ra những trải nghiệm du lịch đáng nhớ và thoải mái nhất cho mỗi khách hàng.</p>
                                <p class="lead">Chúng tôi luôn lắng nghe và phản hồi mọi yêu cầu, đảm bảo rằng mỗi chuyến đi của bạn sẽ là những kỷ niệm đáng nhớ nhất.</p>
                            </div>
                        </div>
                        <div class="col-md-6 offset-md-1 order-1 order-md-2">
                            <div class="row gx-2 gx-lg-3">
                                <div class="col-6" data-aos="zoom-in">
                                    <div class="mb-2"><img class="img-fluid rounded-3"
                                                           src="images/imageM11.jpg" alt="Image 3"></div>
                                </div>
                                <div class="col-6" data-aos="zoom-in">
                                    <div class="mb-2"><img class="img-fluid rounded-3"
                                                           src="images/imageM9.jpg" alt="Image 1"></div>
                                </div>
                                <div class="col-6" data-aos="zoom-in">
                                    <div class="mb-2"><img class="img-fluid rounded-3"
                                                           src="images/imageM7.jpg" alt="Image 2"></div>
                                </div>
                                <div class="col-6" data-aos="zoom-in">
                                    <div class="mb-2"><img class="img-fluid rounded-3"
                                                           src="images/imageM5.jpg" alt="Image 1"></div>
                                </div>
                            </div>
                        </div>
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

        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>

        <!-- Khởi tạo AOS -->
        <script>
            AOS.init({
                duration: 600, // Thời gian diễn ra animation (1000ms = 1s)
                easing: 'ease-in-out', // Hiệu ứng easing (có nhiều tùy chọn như 'linear', 'ease-in', 'ease-out', 'ease-in-out')
                once: true, // Animation sẽ chỉ chạy một lần khi cuộn đến phần tử
            });
        </script>
    </body>

</html>


