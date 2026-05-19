<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" type="image/png" href="images/logo.png"> <!-- Fixed the typo in rel attribute -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <title>FAQs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"> <!-- Thư viện animate.css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css"/>
        <!-- Thêm thư viện AOS (Animate on Scroll) để tăng hiệu ứng animation khi cuộn -->
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <style type="text/css">
            body {
                background-color: #fbfaf8 !important;
                color: #2b2824 !important;
                font-family: 'Plus Jakarta Sans', sans-serif;
            }
            .faq_area {
                padding-top: 120px;
                padding-bottom: 100px;
                position: relative;
                z-index: 1;
                background: #fbfaf8 !important;
            }

            .section-title h2 {
                color: #1a1816 !important;
                font-family: 'Playfair Display', Georgia, serif !important;
                font-weight: 800;
                letter-spacing: 2px;
                text-transform: uppercase;
                margin-top: 10px;
            }
            .section-title span {
                color: rgba(181, 147, 73, 0.08) !important;
                font-family: 'Playfair Display', Georgia, serif !important;
                font-weight: 800;
                font-size: 52px;
                text-transform: uppercase;
                letter-spacing: 4px;
                display: block;
            }
            .section-title p {
                color: #666666 !important;
            }

            .faq-accordian .card {
                background: #ffffff !important;
                border: 1px solid #eae6df !important;
                border-radius: 12px !important;
                margin-bottom: 15px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.03);
                transition: all 0.3s ease;
                overflow: hidden;
            }
            .faq-accordian .card:hover {
                border-color: #b59349 !important;
                box-shadow: 0 10px 40px rgba(181, 147, 73, 0.08);
            }

            .faq-accordian .card-header {
                background: transparent !important;
                padding: 0;
                border-bottom: none !important;
            }

            .faq-accordian .card-header h6 {
                cursor: pointer;
                padding: 1.75rem 2rem;
                color: #1a1816 !important;
                display: flex;
                align-items: center;
                font-size: 16px;
                font-weight: 600;
                margin: 0;
            }

            .faq-accordian .card-header h6.collapsed {
                color: #4a4744 !important;
            }
            .faq-accordian .card-header h6:hover {
                color: #b59349 !important;
            }

            .faq-accordian .card-header h6.collapsed .fa-caret-down {
                transform: rotate(0deg);
                transition: transform 0.3s ease;
            }
            
            .faq-accordian .card-header h6 .fa-question-circle {
                color: #b59349 !important;
            }

            .faq-accordian .card .collapse {
                background-color: transparent !important;
            }

            .faq-accordian .card .card-body p,
            .faq-accordian .card .collapse p {
                padding: 1.5rem 2rem !important;
                color: #4a4744 !important;
                line-height: 1.6;
                margin: 0;
            }

            .support-button p {
                color: #2b2824 !important;
            }
            .support-button a {
                color: #b59349 !important;
                border: 1px solid #b59349 !important;
                border-radius: 5px;
                padding: 8px 16px;
                font-weight: 600;
                text-decoration: none;
                transition: all 0.3s ease;
                background-color: transparent;
            }
            .support-button a:hover {
                background-color: #b59349 !important;
                color: #ffffff !important;
                box-shadow: 0 4px 15px rgba(181, 147, 73, 0.2) !important;
            }

            @media only screen and (max-width: 575px) {
                .support-button p {
                    font-size: 14px;
                }

                .support-button a {
                    font-size: 13px;
                }
            }
            .noidung {
                margin-top: 5%;
            }
            .scrollup1 {
                position: fixed;
                bottom: 20px;
                right: 20px;
                width: 40px;
                height: 40px;
                background: #b59349;
                border-radius: 50%;
                text-align: center;
                line-height: 40px;
                color: #ffffff;
                font-size: 24px;
                text-decoration: none;
                transition: all 0.3s ease;
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            }

            .scrollup1:hover {
                background-color: #a38241;
                color: #ffffff;
                transform: translateY(-3px);
            }

            .scrollup1 .ri-arrow-up-fill {
                vertical-align: middle;
            }
        </style>
        <jsp:include page="/includes/customer/header.jsp" />
    </head>
    <body>

        <jsp:include page="/includes/customer/navbar.jsp" />

        <div class="faq_area section_padding_130" id="faq">
            <div class="container noidung" data-aos="fade-up">
                <div class="row justify-content-center topDetail" data-aos="fade-up">
                    <div class="col-12 col-sm-8 col-lg-6">
                        <!--                        <div class="section_heading text-center">
                                                    <h3>Các câu hỏi thường gặp</h3>
                                                    <p style="margin-top: 3%; font-size: 20px; color:#001973;">ColorBike sẽ mang đến trải nghiệm xứng đáng với những gì bạn kì vọng.</p>
                                                    <div class="line"></div>
                                                </div>-->
                        <div class="container section-title" data-aos="fade-up">
                            <span>FAQs Questions</span>
                            <h2>Các Câu Hỏi Thường Gặp</h2>
                            <p>Điều gì khiến SmartRide là lựa chọn tốt nhất cho
                                "hành trình mới, xe cũng mới"?</p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-10 col-lg-8" data-aos="fade-up">
                        <div class="accordion faq-accordian" id="faqAccordion">
                            <c:forEach var="faq" items="${sessionScope.FAQ}" varStatus="status">
                                <div class="card border-0" data-aos="fade-in" data-aos-delay="${status.index * 100}">
                                    <div class="card-header" id="heading${status.index}">
                                        <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapse${status.index}" aria-expanded="false" aria-controls="collapse${status.index}">
                                            <i class="fas fa-question-circle" style="font-size:40px; margin-right: 1%;"></i>
                                            ${faq.question}
                                            <i class="fas fa-caret-down ml-auto rotate-icon"></i>
                                        </h6>
                                    </div>
                                    <div class="collapse" id="collapse${status.index}" aria-labelledby="heading${status.index}" data-parent="#faqAccordion">
                                        <div class="animate__animated animate__backInDown" style="margin-top: 10px; margin-bottom: 10px;">
                                            <p>${faq.answer}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-10 col-lg-8">
                        <div class="support-button text-center d-flex align-items-center justify-content-center mt-4" data-aos="zoom-in" data-aos-delay="500">
                            <i class="lni-emoji-sad"></i>
                            <p class="mb-0 px-2">Bạn không tìm thấy câu trả lời</p>
                            <a style="box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3); border-radius: 8px; padding: 1%; color: #0482C8;" href="contact.jsp">Hãy liên hệ với chúng tôi!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/includes/customer/footer.jsp" />

        <!-- Các tệp JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>-->
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
            AOS.init({
                duration: 500, // Duration of the animations in milliseconds
                once: true, // Whether animation should happen only once - while scrolling down
            });

            $(document).ready(function () {
                $('.accordion .card-header h6').click(function () {
                    $(this).find('.fa-caret-down').toggleClass('fa-caret-up');
                });
            });
        </script>

    </body>
</html>
