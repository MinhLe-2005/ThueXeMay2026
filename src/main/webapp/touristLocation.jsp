<%-- 
    Document   : touristLocation
    Created on : May 25, 2024, 9:43:36 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/includes/customer/header.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Các địa điểm du lịch</title>
        <link rel="website icon" type="png" href="images\logo.png">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    </head>
    <body>
        <jsp:include page="/includes/customer/navbar.jsp" /> 
        <div class="noidung">
            <section
                class="feature-grid2-5331c43e-593a-4933-bcf2-96beb7ea5e25 sw-background-color-f4f2f1 sw-padding-top-l sw-padding-bottom-2xl sw-border-top-style-none sw-border-top-width-xs sw-border-top-color-000000 sw-border-bottom-style-none sw-border-bottom-width-xs sw-border-bottom-color-000000 sw-background-repeat-no-repeat sw-background-size-cover sw-background-position-center sw-background-attachment-scroll MuiBox-root css-0 mb-3"
                data-block-version="3.1.0"
                data-block-id="5331c43e-593a-4933-bcf2-96beb7ea5e25"
                data-block-updated
                style="position: relative;">
                <div class="container MuiBox-root css-0">

                                    <div class="event-container animate__animated animate__bounceIn">
                                        <h2>"Khám phá không giới hạn, trải nghiệm từng khoảnh khắc!"</h2>
                                        <p>Bạn có thể tham khảo những địa điểm du lịch này cùng chúng tôi nhé!!!</p>
                                    </div>
                    <div
                        class="MuiGrid-root MuiGrid-container MuiGrid-spacing-xs-2 features-container css-1ajnodb row animate__animated animate__zoomIn">
                        <c:forEach var="touristLocations" items="${touristLocation}">
                            <div class="MuiGrid-root MuiGrid-item MuiGrid-grid-md-4 css-1ay72je event">
                                <div class="MuiGrid-root MuiGrid-container MuiGrid-direction-xs-column css-1o5yux1 image-container">
                                    <img style="width: 90%;" class="sw-width-xs sw-height-xs sw-margin-bottom-2xs MuiBox-root css-0" src="${empty touristLocations.locationImage ? 'images/default.jpg' : (touristLocations.locationImage.startsWith('http') ? touristLocations.locationImage : 'images/'.concat(touristLocations.locationImage))}" alt="Shedule">
                                    <h3 class="colorWord sw-font-size-xl sw-text-color-default sw-font-family-arvo sw-font-weight-medium sw-letter-spacing-normal sw-margin-top-6xs sw-margin-bottom-6xs mt-3">
                                        ${touristLocations.locationName}
                                    </h3>
                                    <p class="sw-font-size-m sw-text-color-default sw-font-family-default sw-font-weight-default sw-line-height-normal sw-letter-spacing-normal">
                                        ${touristLocations.description}
                                    </p>
                                    <a href="${touristLocations.urlArticle}" target="_blank" class="sw-font-size-m sw-text-color-f2501b sw-font-family-default sw-font-weight-normal sw-margin-top-6xs sw-margin-bottom-none sw-letter-spacing-normal sw-text-decoration-no-underline hover:sw-text-decoration-no-underline sw-display-inline-block event-link no-border">

                                        <span>Go to article</span>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 256 256">
                                        <rect width="256" height="256" fill="none"></rect>
                                        <line x1="40" y1="128" x2="216" y2="128" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"></line>
                                        <polyline points="144 56 216 128 144 200" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"></polyline>
                                        </svg>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="pagination-container">
                        <ul class="pagination">
                            <c:if test="${tag > 1}">
                                <li><a href="touristLocation?index=${tag - 1}">&laquo;</a></li>
                            </c:if>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li class="${tag == i ? 'active' : ''}"><a href="touristLocation?index=${i}">${i}</a></li>
                            </c:forEach>
                            <c:if test="${tag < endP}">
                                <li><a href="touristLocation?index=${tag + 1}">&raquo;</a></li>
                            </c:if>
                        </ul>
                    </div>
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
    </body>

    <style>
        .body{
            font-family: "Tahoma", sans-serif;
        }

        .noidung{
            margin-top: 5%;
        }
        @keyframes fadeInEffect {
            from {
                opacity: 0; /* Bắt đầu với độ trong suốt 0 */
                transform: translateY(20px); /* Dịch chuyển lên trên 20px */
            }
            to {
                opacity: 1; /* Kết thúc với độ trong suốt 100% */
                transform: translateY(0); /* Trở về vị trí ban đầu */
            }
        }

        .event-container {
            margin-bottom: 15px;
            padding: 20px;
            text-align: center;
        }
        .event-container h2 {
            /*font-size: 2.5rem;*/
            font-weight: bold;
            color: #001973;
            margin-bottom: 20px;
        }
        .event-container p {
            font-size: 1.25rem;
            color: #666;
        }

        .event {
            padding: 15px;
            text-align: justify;
            position: relative;
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 30%;
            margin: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center; /* Căn giữa các phần tử trong .event */
        }


        .image-container {
            width: 100%;
            text-align: center; /* Căn chỉnh hình ảnh trong container */
        }

        .image-container img {
            max-width: 100%; /* Đảm bảo hình ảnh không vượt quá kích thước container */
            border-radius: 8px;
        }

        .event:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .event p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 15px;
            height: 1.0em; /* Giới hạn chiều cao ban đầu */
            overflow: hidden; /* Ẩn phần nội dung tràn */
            text-overflow: ellipsis; /* Thêm dấu chấm lửng */
            white-space: nowrap; /* Ngăn không cho ngắt dòng */
            transition: height 0.5s ease-in-out, opacity 0.5s ease-in-out; /* Thêm hiệu ứng chuyển đổi */
            cursor: pointer; /* Thêm con trỏ chỉ tay */
            position: relative; /* Giữ vị trí tương đối */
            opacity: 1; /* Mặc định hiện đầy đủ */
        }

        .event p:hover {
            height: auto; /* Thay đổi chiều cao để hiển thị toàn bộ nội dung */
            max-height: none; /* Loại bỏ giới hạn chiều cao */
            white-space: normal; /* Cho phép nội dung ngắt dòng */
            overflow: visible; /* Hiển thị phần nội dung bị ẩn */
            opacity: 1; /* Đảm bảo đoạn văn bản luôn trong suốt 100% khi hover */
            background-color: rgba(255, 255, 255, 0.9); /* Tùy chọn: Thêm nền để dễ đọc hơn */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Tùy chọn: Thêm đổ bóng để nổi bật */
            position: relative; /* Giữ vị trí tương đối để đảm bảo hiệu ứng đúng */
            z-index: 1; /* Đảm bảo rằng đoạn văn được hiển thị trên các phần tử khác */
            transition: height 0.5s ease-in-out, opacity 0.5s ease-in-out; /* Đảm bảo hiệu ứng chuyển đổi cũng áp dụng cho hover */
        }

        .event p::before {
            content: ""; /* Thêm một phần tử giả */
            display: block; /* Hiển thị như một khối */
            height: 0; /* Đảm bảo chiều cao ban đầu là 0 */
            transition: height 0.5s ease-in-out; /* Hiệu ứng chuyển đổi mượt mà cho chiều cao */
        }

        .event p:hover::before {
            height: auto; /* Thay đổi chiều cao khi hover để hiển thị toàn bộ nội dung */
        }

        @keyframes fadeIn {
            from {
                opacity: 0; /* Bắt đầu với độ trong suốt 0 */
                transform: translateY(-10px); /* Dịch chuyển lên trên 10px */
            }
            to {
                opacity: 1; /* Kết thúc với độ trong suốt 100% */
                transform: translateY(0); /* Trở về vị trí ban đầu */
            }
        }

        .event p:hover {
            animation: fadeIn 0.5s ease-in-out; /* Thêm animation fade-in khi hover */
        }


        .event a {
            font-size: 1rem;
            color: #007bff;
            text-decoration: none;
            margin-top: auto; /* Đẩy liên kết xuống đáy */
            position: relative;
            bottom: 0;
            transition: color 0.3s ease;
            white-space: nowrap; /* Ngăn ngắt dòng */
            margin-top: 10px; /* Tạo khoảng cách phía trên liên kết */
            display: inline-block; /* Đảm bảo liên kết nằm trên một dòng */
        }


        .event a:hover {
            color: red;
        }

        .row {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        
        .pagination {
            display: flex;
            list-style: none;
            padding: 0;
        }
        
        .pagination li {
            margin: 0 5px;
        }
        
        .pagination li a {
            display: block;
            padding: 8px 16px;
            text-decoration: none;
            color: #001973;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        
        .pagination li.active a {
            background-color: #001973;
            color: white;
            border-color: #001973;
        }
        
        .pagination li a:hover:not(.active) {
            background-color: #ddd;
        }
    </style>
    <script>
        document.querySelectorAll('.event').forEach(item => {
            item.addEventListener('click', event => {
                const link = event.currentTarget.querySelector('.event-link');
                window.open(link.getAttribute('href'), '_blank');
            });
        });
    </script>
<!--    <script>
            document.addEventListener('DOMContentLoaded', function() {
                var noidung = document.querySelector('.noidung');
                noidung.classList.add('animate__animated', 'animate__fadeIn');
            });
        </script>-->
</html>

