<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/includes/customer/header.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Các địa điểm du lịch</title>
        
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
                <div class="container">
                    <div class="page-header animate__animated animate__fadeInDown">
                        <h2>Khám phá không giới hạn</h2>
                        <p>Trải nghiệm từng khoảnh khắc tuyệt vời tại các địa danh nổi tiếng cùng SmartRide</p>
                    </div>

                    <div class="row g-4">
                        <c:forEach var="touristLocations" items="${touristLocation}">
                            <div class="col-lg-4 col-md-6 animate__animated animate__zoomIn">
                                <div class="tour-card" onclick="window.open('${touristLocations.urlArticle}', '_blank')">
                                    <div class="tour-img-wrapper">
                                        <img src="${empty touristLocations.locationImage ? 'images/default.jpg' : (touristLocations.locationImage.startsWith('http') ? touristLocations.locationImage : 'images/'.concat(touristLocations.locationImage))}?v=2" alt="${touristLocations.locationName}" loading="lazy" decoding="async">
                                    </div>
                                    <div class="tour-content">
                                        <h3>${touristLocations.locationName}</h3>
                                        <p>${touristLocations.description}</p>
                                        
                                        <!-- Recommendations section -->
                                        <c:if test="${not empty recommendMap[touristLocations.locationId]}">
                                            <div class="recommendations mt-3 mb-3">
                                                <h5 style="font-size: 0.95rem; font-weight: 700; color: #1a1816; margin-bottom: 10px;">
                                                    <i class="bi bi-star-fill text-warning"></i> Gợi ý xe phù hợp
                                                </h5>
                                                <div class="d-flex flex-column gap-2">
                                                    <c:forEach var="rec" items="${recommendMap[touristLocations.locationId]}">
                                                        <div class="recommendation-item d-flex align-items-center bg-light rounded p-2 border">
                                                            <img src="images/${rec.image}" alt="${rec.model}" loading="lazy" decoding="async" style="width: 50px; height: 50px; object-fit: cover; border-radius: 8px; margin-right: 12px;">
                                                            <div>
                                                                <strong style="font-size: 0.85rem; color: #1a1816; display: block;">${rec.model}</strong>
                                                                <span style="font-size: 0.75rem; color: #666; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
                                                                    ${rec.reason}
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:if>

                                        <a href="${touristLocations.urlArticle}" target="_blank" class="btn-read-more" onclick="event.stopPropagation();">
                                            Khám phá thêm <i class="bi bi-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div class="pagination-container animate__animated animate__fadeInUp">
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
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

    <style>
        :root {
            --primary: #b59349;
            --text-dark: #1a1816;
            --text-body: #666666;
            --bg-light: #fbfaf8;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif !important;
            background-color: var(--bg-light);
            color: var(--text-body);
        }

        .noidung {
            padding-top: 120px;
            padding-bottom: 80px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 60px;
        }

        .page-header h2 {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 15px;
            font-family: 'Plus Jakarta Sans', sans-serif;
            letter-spacing: -0.5px;
        }

        .page-header p {
            font-size: 1.1rem;
            color: var(--text-body);
            max-width: 600px;
            margin: 0 auto;
        }

        .tour-card {
            background: #ffffff;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
            height: 100%;
            display: flex;
            flex-direction: column;
            border: 1px solid rgba(0,0,0,0.03);
            cursor: pointer;
        }

        .tour-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(181, 147, 73, 0.15);
        }

        .tour-img-wrapper {
            position: relative;
            width: 100%;
            padding-top: 75%; /* 4:3 Aspect Ratio */
            overflow: hidden;
        }

        .tour-img-wrapper img {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .tour-card:hover .tour-img-wrapper img {
            transform: scale(1.08);
        }

        .tour-content {
            padding: 30px;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .tour-content h3 {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 15px;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        .tour-content p {
            font-size: 0.95rem;
            line-height: 1.6;
            color: var(--text-body);
            margin-bottom: 25px;
            flex-grow: 1;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .btn-read-more {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            font-size: 0.9rem;
            color: var(--primary);
            text-decoration: none;
            transition: all 0.3s ease;
            margin-top: auto;
        }

        .btn-read-more i {
            transition: transform 0.3s ease;
        }

        .tour-card:hover .btn-read-more {
            color: #8c6f32;
        }

        .tour-card:hover .btn-read-more i {
            transform: translateX(5px);
        }

        .pagination-container {
            margin-top: 50px;
            display: flex;
            justify-content: center;
        }

        .pagination {
            display: flex;
            gap: 10px;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .pagination li a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #ffffff;
            color: var(--text-dark);
            font-weight: 600;
            text-decoration: none;
            border: 1px solid rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .pagination li.active a,
        .pagination li a:hover {
            background: var(--primary);
            color: #ffffff;
            border-color: var(--primary);
            box-shadow: 0 5px 15px rgba(181, 147, 73, 0.3);
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

