<%-- 
    Document   : event
    Created on : 5 thg 6, 2024, 21:50:13
    Author     : MINH TUAN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <title>Danh sách sự kiện</title>
        <style id="wp-emoji-styles-inline-css" type="text/css">
            img.wp-smiley,
            img.emoji {
                display: inline !important;
                border: none !important;
                box-shadow: none !important;
                height: 1em !important;
                width: 1em !important;
                margin: 0 0.07em !important;
                vertical-align: -0.1em !important;
                background: none !important;
                padding: 0 !important;
            }
        </style>
        <style id="classic-theme-styles-inline-css" type="text/css">
            .wp-block-button__link {
                color: #fff;
                background-color: #32373c;
                border-radius: 9999px;
                box-shadow: none;
                text-decoration: none;
                padding: calc(.667em + 2px) calc(1.333em + 2px);
                font-size: 1.125em
            }

            .wp-block-file__button {
                background: #32373c;
                color: #fff;
                text-decoration: none
            }
        </style>
        <style id="vw-event-planner-basic-style-inline-css" type="text/css">
            body {
                max-width: 100%;
            }
            @media (max-width: 768px) {
                .hero-wrap {
                    background-size: contain;
                }
            }
            .footer h3,
            .footer .wp-block-search .wp-block-search__label {
                text-align: left;
            }

            .footer .widget {
                text-align: left;
            }

            .copyright p {
                width: 100%;
                text-align: center;
                float: none;
            }

            .footer {
                background-attachment: scroll !important;
            }

            .footer {
                background-position: center center !important;
            }


            .woocommerce ul.products li.product .onsale {
                left: auto;
                right: 0;
            }

            .main-header {
                background-position: center top !important;
            }

            .footer h3,
            a.rsswidget.rss-widget-title {
                letter-spacing: 1px;
            }

            .footer h3,
            a.rsswidget.rss-widget-title {
                font-size: 30px;
            }

            .footer h3 {
                text-transform: Capitalize;
            }
            .entry-date a, .entry-author a {
                color: #555a5e;
            }
            @media screen and (max-width:575px) {
                .scrollup i {
                    visibility: visible !important;
                }
            }

            .scrollup1 {
                position: fixed;
                bottom: 20px;
                right: 20px;
                width: 40px;
                height: 40px;
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                border-radius: 50%;
                text-align: center;
                line-height: 40px;
                color: #fff;
                font-size: 24px;
                text-decoration: none;
                transition: background-color 3s ease;
            }

            .scrollup1 :hover {
                color: #000;
            }

            .scrollup1 .ri-arrow-up-fill {
                vertical-align: middle;
            }

            .new-text h2 a {
                color: rgb(1,210,142);
                font-weight: bold;
            }

            .new-text h2 a:hover {
                transform: scale(2);
            }

            .footer h3,
            a.rsswidget.rss-widget-title {
                font-weight: 600;
            }
            .readmore-text {
                position: absolute;
                bottom: 0;
                right: 0;
                background-color: white;
                transition: all 1s ease;
            }
            .discountt {
                font-size: 50px;
                text-align: center;
                padding-top: 20px;
                font-weight: bold;
                background: linear-gradient(to right,
                    var(--gradient-color-0) 0%,
                    var(--gradient-color-25) 25%,
                    var(--gradient-color-50) 50%,
                    var(--gradient-color-75) 75%,
                    var(--gradient-color-100) 100%
                    );
                color: red;
                padding: 8px 16px;
                margin: 0;
            }

            .pagination-container {
                display: flex;
                justify-content: center;
                margin-top: 30px;
                margin-bottom: 30px;
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
                color: #0396C0;
                border: 1px solid #ddd;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
            }
            
            .pagination li.active a {
                background-color: #0396C0;
                color: white;
                border-color: #0396C0;
            }
            
            .pagination li a:hover:not(.active) {
                background-color: #ddd;
            }
        </style>
        <link rel="stylesheet" id="bootstrap-style-css"
              href="https://wp-themes.com/wp-content/themes/vw-event-planner/assets/css/bootstrap.css?ver=6.6-beta1-58341"
              type="text/css" media="all">
        <link rel="stylesheet" id="vw-event-planner-basic-style-css"
              href="https://wp-themes.com/wp-content/themes/vw-event-planner/style.css?ver=6.6-beta1-58341" type="text/css"
              media="all">
        <link rel="stylesheet" id="animate-css-css"
              href="https://wp-themes.com/wp-content/themes/vw-event-planner/assets/css/animate.css?ver=6.6-beta1-58341"
              type="text/css" media="all">
        <link rel="stylesheet" id="dashicons-css"
              href="https://wp-themes.com/wp/wp-includes/css/dashicons.min.css?ver=6.6-beta1-58341" type="text/css"
              media="all">
        <script type="text/javascript" src="https://wp-themes.com/wp/wp-includes/js/jquery/jquery.min.js?ver=3.7.1"
        id="jquery-core-js"></script>
        <script type="text/javascript"
                src="https://wp-themes.com/wp-content/themes/vw-event-planner/assets/js/wow.js?ver=6.6-beta1-58341"
        id="jquery-wow-js"></script>
        <script src="https://wp-themes.com/wp/wp-includes/js/wp-emoji-release.min.js?ver=6.6-beta1-58341" defer=""></script>
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css"/>
        <jsp:include page="/includes/customer/header.jsp" />
    </head>
    <body class="home blog wp-embed-responsive">
        <jsp:include page="/includes/customer/navbar.jsp" />

        <main id="maincontent" role="main" style="margin-top: 5%;">
            <div class="middle-align container">
                <div class="row m-0">
                    <div id="our-services" class="services col-lg-8 col-md-8">
                        <c:forEach items="${listEvent}" var="event">
                            <article id="post-19"
                                     class="inner-service post-19 post type-post status-publish format-standard hentry category-uncategorized tag-boat tag-lake">
                                <div style="box-shadow: #0396C0 0px 0px 10px 0px;visibility: visible;animation-duration: 2s;animation-name: zoomInDown;margin-bottom: 60px;"class="post-main-box wow zoomInDown delay-1000" data-wow-duration="2s"
                                     style="visibility: visible; animation-duration: 2s; animation-name: zoomInDown;">
                                    <div class="row">
                                        <div class="new-text col-lg-12 col-md-12">
                                            <h2><a style="font-family: 'Times New Roman',
                                                   Times, serif; font-weight: bold; font-style: oblique;font-size:32px; color: #0396C0;" href="">${event.eventTitle}</a></h2>
                                            <div>
                                                <i class="ri-calendar-2-line"></i><span class="date">${event.createdDate}</span>   |
                                                <i class="ri-time-line"></i><span class="entry-time">${event.startDate}</span>   |
                                                <i class="ri-rest-time-line"></i><span class="entry-comments">
                                                    ${event.endDate}</span>
                                                <hr>
                                                <div class="entry-content" style="max-height: 110px; overflow: hidden;">
                                                    <p>${event.content}</p>
                                                    <span class="readmore-text" style="position: absolute;bottom: 68px;left: 16px;font-size: 27px;letter-spacing: 6px;">...</span>
                                                </div>
                                                <div class="hidden-image" style="display: none;">
                                                    <img src="${empty event.eventImage ? 'images/default.jpg' : (event.eventImage.startsWith('http') ? event.eventImage : 'images/'.concat(event.eventImage))}" alt="${event.eventTitle}">
                                                </div>
                                                <div class="discount-info" style="display: none;">
                                                    <p class="discountt text-center">SALE ${Math.round(event.discount * 100)}%</p>
                                                </div>
                                                <div class="content-bttn">
                                                    <a style="background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);" class="view-more" href="#" onclick="showFullContent(event, this)">Xem thêm <i class="fas fa-angle-right"></i><span class="screen-reader-text">Xem thêm</span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </article>
                        </c:forEach>

                        <div class="navigation">
                            <div class="pagination-container">
                                <ul class="pagination">
                                    <c:if test="${tag > 1}">
                                        <li><a href="event?index=${tag - 1}">&laquo;</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${endP}" var="i">
                                        <li class="${tag == i ? 'active' : ''}"><a href="event?index=${i}">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${tag < endP}">
                                        <li><a href="event?index=${tag + 1}">&raquo;</a></li>
                                    </c:if>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 sidebar">
                        <div class="sidebar">
                            <aside style="box-shadow: 0px 15px 10px -15px #0396C0;" id="search" class="widget" role="complementary" aria-label="firstsidebar">
                                <h3 style="color: #0396C0;">Search</h3>

                                <form action="searchevent" method="get" class="search-form" >
                                    <label>
                                        <span class="screen-reader-text">Search for:</span>
                                        <input type="search" class="search-field" placeholder="Search" value="${textSearch}" name="textSearch">
                                    </label>
                                    <input style="background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);" type="submit" class="search-submit" value="Search">
                                </form>
                            </aside>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </main>
        <script type="text/javascript"
                src="https://wp-themes.com/wp-content/themes/vw-event-planner/assets/js/bootstrap.js?ver=6.6-beta1-58341"
        id="bootstrap-js-js"></script>
        <script type="text/javascript"
                src="https://wp-themes.com/wp-content/themes/vw-event-planner/assets/js/jquery.superfish.js?ver=6.6-beta1-58341"
        id="jquery-superfish-js"></script>
    </body>
    <script>
                                                        function showFullContent(event, element) {
                                                            event.preventDefault();

                                                            const article = element.closest("article");
                                                            const content = article.querySelector(".entry-content");
                                                            const readmoreText = content.querySelector(".readmore-text");
                                                            const discountInfo = article.querySelector(".discount-info");
                                                            const hiddenImage = article.querySelector(".hidden-image");

                                                            if (content.classList.contains("collapsed")) {
                                                                content.style.maxHeight = "none";
                                                                readmoreText.style.display = "none";
                                                                discountInfo.style.display = "block";
                                                                hiddenImage.style.display = "block";
                                                                element.textContent = "Thu gọn";
                                                                article.scrollIntoView({behavior: "smooth"}); // Thêm dòng này
                                                                content.classList.remove("collapsed");
                                                            } else {
                                                                content.style.maxHeight = "110px";
                                                                readmoreText.style.display = "block";
                                                                discountInfo.style.display = "none";
                                                                hiddenImage.style.display = "none";
                                                                element.textContent = "Xem thêm";
                                                                article.scrollIntoView({behavior: "smooth"}); // Thêm dòng này
                                                                content.classList.add("collapsed");
                                                            }
                                                        }
                                                        document.addEventListener("DOMContentLoaded", function () {
                                                            document.querySelectorAll(".entry-content").forEach(content => {
                                                                content.style.maxHeight = "110px";
                                                                content.classList.add("collapsed");
                                                            });
                                                        });

    </script>
    <jsp:include page="/includes/customer/footer.jsp" />
    <a href="#" class="scrollup1"><i class="ri-arrow-up-fill" style="display: inline;"></i><span class="screen-reader-text">Scroll Up</span></a>
    <!--cái này có thể để vào footer nếu muốn-->
</html>
