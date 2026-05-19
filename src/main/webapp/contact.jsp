<%-- 
    Document   : contact
    Created on : May 25, 2024, 5:11:05 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Liên hệ</title>
        <link rel="website icon" type="png" href="images\logo.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOM1JLOH1TOdYpD5n5YXoV7zw5i8we5iQd6K3l/Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <jsp:include page="/includes/customer/header.jsp" />
        <style>
            body {
                background-color: #fbfaf8 !important;
                color: #2b2824 !important;
                font-family: 'Plus Jakarta Sans', sans-serif;
            }
            
            /* Section Title Styling */
            .section-title h2 {
                color: #1a1816 !important;
                font-family: 'Playfair Display', Georgia, serif !important;
                font-weight: 800;
                letter-spacing: 2px;
                text-transform: uppercase;
                margin-top: 10px;
                text-align: center;
            }
            .section-title span {
                color: rgba(181, 147, 73, 0.08) !important;
                font-family: 'Playfair Display', Georgia, serif !important;
                font-weight: 800;
                font-size: 52px;
                text-transform: uppercase;
                letter-spacing: 4px;
                display: block;
                text-align: center;
            }
            .section-title p {
                color: #666666 !important;
                text-align: center;
            }

            /* contact form styling */
            .contact-form .form-group {
                justify-content: center;
                margin-bottom: 22px; 
            }
            .contact-form {
                background-color: #ffffff !important;
                border: 1px solid #eae6df !important;
                border-radius: 12px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.03);
                padding: 40px !important;
            }
            .contact-form .form-control {
                background-color: #ffffff !important;
                border: 1px solid #eae6df !important;
                color: #2b2824 !important;
                border-radius: 8px;
                padding: 12px 18px;
                height: auto;
                transition: all 0.3s ease;
            }
            .contact-form .form-control::placeholder {
                color: #999999 !important;
            }
            .contact-form .form-control:focus {
                border-color: #b59349 !important;
                box-shadow: 0 0 10px rgba(181, 147, 73, 0.2) !important;
                background-color: #ffffff !important;
            }

            /* contact info cards styling */
            .contact-info .icon {
                font-size: 26px; 
                margin-right: 15px; 
                color: #b59349 !important; 
            }

            .contact-info .border {
                display: flex;
                align-items: center; 
                padding: 20px 25px !important; 
                border-radius: 12px; 
                background-color: #ffffff !important; 
                border: 1px solid #eae6df !important;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.03);
                transition: border-color 0.3s ease;
            }
            .contact-info .border:hover {
                border-color: #b59349 !important;
            }

            .contact-info p {
                margin: 0; 
                color: #666666;
            }
            .contact-info p a {
                color: #b59349 !important;
                text-decoration: none;
                transition: color 0.3s ease;
            }
            .contact-info p a:hover {
                color: #a38241 !important;
            }
            .contact-info p span {
                font-weight: 700;
                color: #1a1816;
                display: block;
                margin-bottom: 3px;
            }

            .contact-info .row > .col-md-12 {
                margin-bottom: 20px; 
            }

            /* Google Maps Frame */
            .container iframe {
                width: 100%; 
                border: 1px solid #eae6df !important; 
                border-radius: 12px; 
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.03);
            }

            /* Submit Button styling */
            .contact-form .btn-primary {
                background: #b59349 !important; 
                border: none !important; 
                color: #ffffff !important;
                font-weight: 700;
                padding: 14px 35px; 
                border-radius: 50px; 
                transition: all 0.3s ease; 
                text-transform: uppercase;
                letter-spacing: 1px;
                font-size: 13px;
                box-shadow: 0 4px 10px rgba(181, 147, 73, 0.15);
            }

            .contact-form .btn-primary:hover {
                background: #a38241 !important; 
                transform: translateY(-2px); 
                box-shadow: 0 5px 15px rgba(181, 147, 73, 0.25) !important;
            }

            @media (max-width: 768px) {
                .contact-info .border {
                    flex-direction: column; 
                    align-items: flex-start; 
                }

                .contact-info .icon {
                    margin-bottom: 10px; 
                }
            }

            .animate__animated {
                visibility: hidden;
            }
            .animate__animated.animate__fadeInUp {
                visibility: visible;
            }
        </style>
    </head>

    <body>

        <jsp:include page="/includes/customer/navbar.jsp" />


        <div style="margin-top: 8%;">

            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <span>Welcome to SmartRide!<br></span>
                <h2>Chào Mừng Đến Với SmartRide!</h2>
                <p>Nếu bạn có câu hỏi gì hãy liên hệ với chúng tôi nhé!</p>
            </div><!-- End Section Title -->
            <section class="ftco-section contact-section animate__animated animate__fadeInUp">
                <div class="container">
                    <div class="row d-flex mb-5 contact-info">
                        <div class="col-md-5">
                            <div class="row mb-5">
                                <div class="col-md-12">
                                    <div class="border w-100 p-4 rounded mb-2 d-flex">
                                        <div class="icon mr-3">
                                            <i class="fas fa-map-marker-alt"></i> <!-- Font Awesome class -->
                                        </div>
                                        <p class="info"><span>Địa Chỉ:</span> 198 West 21th Street, Suite 721 New York NY 10016</p>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="border w-100 p-4 rounded mb-2 d-flex">
                                        <div class="icon mr-3">
                                            <i class="fas fa-mobile-alt"></i> <!-- Font Awesome class -->
                                        </div>
                                        <p class="info"><span>Số Điện Thoại:</span> <a href="tel://0941121748">+84 941 121 748</a></p>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="border w-100 p-4 rounded mb-2 d-flex">
                                        <div class="icon mr-3">
                                            <i class="fas fa-envelope"></i> <!-- Font Awesome class -->
                                        </div>
                                        <p class="info"><span>Email:</span> <a href="mailto:smartride.system@gmail.com">smartride.system@gmail.com</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 block-9 mb-md-5">
                            <form action="contact" method="post" class="p-5 contact-form">
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control" placeholder="Tên">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="phone" class="form-control" placeholder="Số Điện Thoại">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="email" class="form-control" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="title" class="form-control" placeholder="Tiêu Đề">
                                </div>
                                <div class="form-group">
                                    <textarea name="message" id="" cols="30" rows="7" class="form-control" placeholder="Nội Dung"></textarea>
                                </div>
                                <div style="color: green; margin-left:30px; ">${msg}</div><br>
                                <div class="form-group">
                                    <input type="submit" value="Gửi cho chúng tôi" class="btn btn-primary py-3 px-5 animate__animated animate__fadeInUp">
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Iframe Google Maps -->
                    <div class="animate__animated animate__fadeInUp">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8560635690856!2d108.2584456746545!3d15.968891342117118!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421060734d1d45%3A0xee0cabb7ddf0acc7!2zS2h1IMSRw7QgdGjhu4sgRlBUIENpdHksIEhvw6AgSOG6o2ksIE5nxakgSMOgbmggU8ahbiwgxJDDoCBO4bq1bmcsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1715738592214!5m2!1svi!2s"
                            width="1100" height="400" style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade">
                        </iframe>
                    </div>
                    <!-- end map -->

                </div>
            </section>
        </div>

        <jsp:include page="/includes/customer/footer.jsp" />

        <!-- Các tệp JS -->
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
        <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

        <script>
            // Kích hoạt animation khi cuộn
            $(document).ready(function () {
                $('.animate__animated').waypoint(function () {
                    $(this.element).addClass('animate__fadeInUp');
                }, {
                    offset: '75%'
                });
            });
        </script>

    </body>
