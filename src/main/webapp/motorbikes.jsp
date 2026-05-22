<%-- 
    Document   : motorbikes
    Created on : May 25, 2024, 5:01:05 PM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách xe máy</title>
        
        <jsp:include page="/includes/customer/header.jsp" />
        <!-- thanh search -->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap');

            .filter-module {
                background: #fdfcf7;
                padding-bottom: 10px;
                margin: 5% 0 0 5%;
                box-sizing: border-box;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
                border: 1px solid rgba(181, 147, 73, 0.15);
                border-radius: 16px;
                padding-top: 3%;
                padding-left: 5%;
                width: 90%;
            }

            .xemketqua {
                background: #b59349 !important;
                color: white !important;
                border: 1px solid #b59349 !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                transition: all 0.3s ease !important;
            }

            .xemketqua:hover {
                background: #a38241 !important;
                border-color: #a38241 !important;
                color: white !important;
            }

            .filter-container {
                display: flex;
                flex-wrap: wrap;
            }

            .filter-group {
                margin-bottom: 35px;
                position: relative;
                margin-right: 30px;
            }

            .filter-button {
                padding: 10px 20px;
                border: 1px solid rgba(181, 147, 73, 0.3);
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-weight: 700;
                background: #fff;
                color: #1a1816;
                cursor: pointer;
                border-radius: 5px;
                transition: all 0.3s ease;
            }

            .filter-button:hover, .filter-button.has-active-filter {
                color: #fff;
                background: #b59349;
                border-color: #b59349;
            }

            .filter-options {
                color: #1a1816;
                margin-top: 10px;
                position: absolute;
                z-index: 100;
                background-color: #fff;
                border: 1px solid rgba(181, 147, 73, 0.15);
                border-radius: 8px;
                box-shadow: 0 15px 40px rgba(0, 0, 0, 0.08);
                opacity: 0;
                padding: 20px 20px;
                transition: all 0.3s ease;
                width: 380px;
                display: none;
                text-align: center;
            }

            .filter-options button {
                padding: 12px;
                border: 1px solid #eee;
                background: #fafaf8;
                cursor: pointer;
                border-radius: 5px;
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-weight: 500;
                transition: all 0.2s ease;
                color: #1a1816;
            }

            .filter-options:after {
                border-bottom: 10px solid #fff;
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                content: "";
                left: 30px;
                position: absolute;
                top: -10px;
            }

            .filter-options button:hover {
                background-color: #f5f3eb;
                border-color: rgba(181, 147, 73, 0.3);
            }

            .filter-options button.selected {
                background: #b59349 !important;
                color: #fff !important;
                border-color: #b59349 !important;
                box-shadow: 0 4px 10px rgba(181, 147, 73, 0.2) !important;
            }

            .show-options {
                display: block !important;
                opacity: 1 !important;
                z-index: 1000 !important;
            }

            .filter-group .filter-button:after {
                content: ' ▼';
            }
            .filter-group .filter-button.open:after {
                content: ' ▲';
            }

            /* Selected Filters Premium Badges Styling */
            .selected-filters {
                margin-top: 20px !important;
                padding: 16px 20px !important;
                background: #fdfcf7 !important;
                border: 1px solid rgba(181, 147, 73, 0.12) !important;
                border-radius: 12px !important;
                display: flex !important;
                flex-wrap: wrap !important;
                align-items: center !important;
                gap: 12px !important;
                animation: fadeIn 0.4s ease-out !important;
            }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(4px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .selected-filters h2 {
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-size: 14px !important;
                font-weight: 700 !important;
                color: #1a1816 !important;
                margin: 0 !important;
                text-transform: uppercase !important;
                letter-spacing: 0.5px !important;
            }

            .selected-filter {
                background: #ffffff !important;
                border: 1px solid rgba(181, 147, 73, 0.2) !important;
                color: #1a1816 !important;
                padding: 8px 14px !important;
                border-radius: 20px !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-size: 13px !important;
                font-weight: 500 !important;
                display: inline-flex !important;
                align-items: center !important;
                gap: 8px !important;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.02) !important;
                transition: all 0.2s ease !important;
            }

            .selected-filter:hover {
                border-color: #b59349 !important;
                color: #b59349 !important;
                transform: translateY(-1px) !important;
            }

            .remove-filter {
                cursor: pointer;
                color: #b59349;
                font-weight: bold;
                margin-left: 4px;
                transition: color 0.2s ease;
            }

            .remove-filter:hover {
                color: #a38241;
            }

            .clear-all-filter {
                background: rgba(181, 147, 73, 0.08) !important;
                border: 1px dashed #b59349 !important;
                color: #b59349 !important;
                padding: 8px 14px !important;
                border-radius: 20px !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-size: 13px !important;
                font-weight: 600 !important;
                cursor: pointer !important;
                transition: all 0.2s ease !important;
            }

            .clear-all-filter:hover {
                background: #b59349 !important;
                color: #fff !important;
            }

            .filter-search input {
                border: 1px solid rgba(181, 147, 73, 0.3) !important;
            }
            .filter-search input:focus {
                border-color: #b59349 !important;
                box-shadow: 0 0 0 0.2rem rgba(181, 147, 73, 0.25) !important;
            }

            .filter-search button:hover {
                opacity: 0.9;
            }

            .button-item-option {
                margin-bottom: 12px;
                margin-right: 12px;
                width: 45%;
            }

            /* Container & Grid cards */
            .container-haha {
                border-radius: 12px;
                padding: 38px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
            }

            .wrapper {
                width: 100%;
                height: 100%;
                justify-content: center;
            }

            .banner-image {
                background-position: center;
                background-size: cover;
                height: 200px;
                width: 100%;
                border-radius: 12px;
                background-color: white;
            }

            .banner-image img {
                object-fit: contain;
            }

            .list h1 {
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                color: #1a1816 !important;
                font-weight: 800 !important;
                text-transform: uppercase;
                font-size: 2.8rem !important;
                margin: 5% 0 3% 0;
            }

            .box p {
                color: #4a4744 !important;
                font-family: 'Lato', sans-serif;
                font-weight: bold;
                text-align: center;
                font-size: 0.85rem;
                line-height: 150%;
                letter-spacing: 1px;
                text-transform: uppercase;
            }

            .button-wrapper {
                margin-top: 18px;
            }

            .btn {
                border: none;
                padding: 12px 24px;
                border-radius: 24px;
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-size: 0.8rem;
                font-weight: 700;
                letter-spacing: 1px;
                cursor: pointer;
            }

            .btn + .btn {
                margin-left: 10px;
            }

            .outline-huhu {
                background: transparent !important;
                color: #b59349 !important;
                border: 1px solid #b59349 !important;
                transition: all .3s ease !important;
                text-decoration: none !important;
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                font-size: 0.8rem !important;
                letter-spacing: 1px !important;
                border-radius: 24px !important;
                padding: 12px 24px !important;
                box-sizing: border-box !important;
            }

            .outline-huhu:hover {
                transform: scale(1.05) !important;
                background: #b59349 !important;
                color: #ffffff !important;
                text-decoration: none !important;
            }

            .fill {
                background: #b59349 !important;
                color: #fff !important;
                border: 1px solid #b59349 !important;
                transition: all .3s ease !important;
                text-decoration: none !important;
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                font-size: 0.8rem !important;
                letter-spacing: 1px !important;
                border-radius: 24px !important;
                padding: 12px 24px !important;
                box-sizing: border-box !important;
            }

            .fill:hover {
                transform: scale(1.05) !important;
                background: #a38241 !important;
                color: #fff !important;
                border-color: #a38241 !important;
                text-decoration: none !important;
                filter: drop-shadow(0 10px 5px rgba(0,0,0,0.05)) !important;
            }

            .fill.disabled {
                opacity: 0.6 !important;
                pointer-events: none !important;
                cursor: not-allowed !important;
            }

            .box {
                box-shadow: 0 4px 20px rgba(0,0,0,0.04);
                border-radius: 12px;
                border: 1px solid rgba(181, 147, 73, 0.15);
                padding: 24px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                margin: 20px;
                background: #ffffff;
                transition: all 0.3s ease !important;
            }

            .box:hover {
                border-color: #b59349 !important;
                box-shadow: 0 10px 40px rgba(181, 147, 73, 0.08) !important;
                transform: translateY(-5px) !important;
            }

            .xemthem {
                border: 2px solid #b59349 !important;
                background: transparent !important;
                color: #b59349 !important;
                font-family: 'Plus Jakarta Sans', sans-serif !important;
                font-weight: 700 !important;
                transition: all 0.3s ease !important;
            }

            .xemthem:hover {
                background: #b59349 !important;
                color: white !important;
            }

            .page-link-custom {
                display: inline-block;
                width: 42px;
                height: 42px;
                line-height: 40px;
                text-align: center;
                border-radius: 50%;
                border: 1px solid rgba(181, 147, 73, 0.25);
                color: #b59349 !important;
                background: transparent;
                font-weight: 600;
                text-decoration: none;
                transition: all 0.3s ease;
                cursor: pointer;
            }
            .page-link-custom:hover {
                background: rgba(181, 147, 73, 0.1);
                border-color: #b59349;
                color: #b59349 !important;
                transform: translateY(-2px);
            }
            .page-link-custom.active {
                background: #b59349 !important;
                color: #ffffff !important;
                border-color: transparent !important;
                box-shadow: 0 4px 10px rgba(181, 147, 73, 0.3);
            }
        </style>
    </head>

    <body>
        <jsp:include page="/includes/customer/navbar.jsp" />
        <div style="margin-top: 3%;">

            <!-- thanh search -->
            <section>
                <div class="filter-module">
                    <div class="filter-container" style="display: flex; justify-content: space-between">
                        <div style="display: flex">
                            <div class="filter-group">

                                <button class="filter-button price" onclick="toggleOptions('priceOptions')">Giá</button>
                                <div class="filter-options" id="priceOptions">
                                    <c:forEach items="${listPriceRange}" var="o">
                                        <input hidden name="priceRanges" value="${o.minPrice},${o.maxPrice}"/>
                                        <button data-id="${o.minPrice},${o.maxPrice}" class="button-item-option" onclick="toggleSelection(this)">
                                            <c:if test="${o.minPrice == 0}">
                                                Dưới <fmt:formatNumber value="${o.maxPrice}" pattern="#,##0.000"/>VNĐ/day
                                            </c:if>
                                            <c:if test="${o.minPrice != 0 && o.maxPrice != 0}">
                                                <fmt:formatNumber value="${o.minPrice}" pattern="#,##0.000"/> - <fmt:formatNumber value="${o.maxPrice}" pattern="#,##0.000"/>VNĐ/day
                                            </c:if>

                                            <c:if test="${o.maxPrice == 0}">
                                                <fmt:formatNumber value="${o.minPrice}" pattern="#,##0.000"/>VNĐ/day trở lên
                                            </c:if>
                                        </button>
                                    </c:forEach>
                                    <div class="btn-filter-group open">
                                        <button class="xemketqua" onclick="closeOptions('priceOptions')">Đóng</button>
                                        <button class="xemketqua" onclick="showResults()">Xem kết quả</button>
                                    </div>
                                </div>
                            </div>
                            <div class="filter-group">
                                <button class="filter-button" onclick="toggleOptions('brandOptions')">Hãng</button>
                                <div class="filter-options" id="brandOptions">
                                    <c:forEach items="${listBrand}" var="o">
                                        <input hidden name="brands" value="${o.brandID}" id="searchBrand">
                                        <button class="button-item-option" data-id="${o.brandID}" 
                                                onclick="toggleSelection(this)">${o.brandName}</button>
                                    </c:forEach>
                                    <div class="btn-filter-group open">
                                        <button class="xemketqua" onclick="closeOptions('brandOptions')">Đóng</button>
                                        <button class="xemketqua" onclick="showResults()">Xem kết quả</button>
                                    </div>
                                </div>
                            </div>

                            <div class="filter-group">
                                <button class="filter-button" onclick="toggleOptions('categoryOptions')">Loại</button>
                                <div class="filter-options" id="categoryOptions">
                                    <c:forEach items="${categories}" var="o">
                                        <input hidden name="categories" value="${o.categoryID}" id="searchCategory">
                                        <button class="button-item-option"  data-id="${o.categoryID}" 
                                                onclick="toggleSelection(this)">${o.categoryName}</button>
                                    </c:forEach>
                                    <div class="btn-filter-group open">
                                        <button class="xemketqua" onclick="closeOptions('categoryOptions')">Đóng</button>
                                        <button class="xemketqua" onclick="showResults()">Xem kết quả</button>
                                    </div>
                                </div>
                            </div>

                            <div class="filter-group">
                                <button class="filter-button" onclick="toggleOptions('massOptions')">Phân khối</button>
                                <div class="filter-options" id="massOptions">
                                    <c:forEach items="${listDisplacement}" var="o">
                                        <input hidden name="displacements" value="${o}" id="searchDisplacement">
                                        <button class="button-item-option" data-id="${o}" 
                                                onclick="toggleSelection(this)">${o}</button>
                                    </c:forEach>
                                    <div class="btn-filter-group open">
                                        <button class="xemketqua" onclick="closeOptions('massOptions')">Đóng</button>
                                        <button class="xemketqua" onclick="showResults()">Xem kết quả</button>
                                    </div>
                                </div>
                            </div>

                            <div class="filter-group">
                                <button class="filter-button" onclick="toggleOptions('needOptions')">Nhu cầu</button>
                                <div class="filter-options" id="needOptions">
                                    <c:forEach items="${listDemand}" var="o">
                                        <input hidden name="demands" value="${o.demandId}" id="searchDemand">
                                        <button class="button-item-option" data-id="${o.demandId}" onclick="toggleSelection(this)">${o.demand}</button>
                                    </c:forEach>
                                    <div class="btn-filter-group open">
                                        <button class="xemketqua" onclick="closeOptions('needOptions')">Đóng</button>
                                        <button class="xemketqua" onclick="showResults()">Xem kết quả</button>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button class="filter-button xemketqua" onclick="showResults()">Xem kết quả</button>
                            </div>
                        </div>

                        <div class="filter-search filter-group">
                            <form action="searchMotorcycle" method="get" class="d-flex" style="width: 110%; padding-right: 10%;">
                                <input id="textSearch" style="padding: 10px 20px;" value="${key}" name="textSearch" class="form-control me-2" type="search" placeholder="Từ khóa" aria-label="Search">
                                <button class="btn xemketqua" style="color: white; font-weight: bold; width: 52%" type="submit">Tìm kiếm</button>
                            </form>
                        </div>

                    </div>

                    <div class="selected-filters" id="selectedFilters">
                        <!-- Selected filters will be displayed here -->
                    </div>
                </div>
                <div class="list">
                    <h1 class="animate__animated animate__backInDown" style="text-align: center; font-weight: bold; ">Danh Sách Xe Máy</h1>
                    <div class="container-haha animate__animated animate__zoomIn">
                        <div class="wrapper row" id="motorcycleContent">
                            <c:if test="${not empty noResults}">
                                <div class="text-center no-results-message">
                                    Không có mẫu xe nào phù hợp với tìm kiếm của bạn.
                                </div>
                            </c:if>

                            <c:forEach var="motorbike" items="${motorcycles}">
                                <div class="motorcycle box col-md-3">
                                    <div class="banner-image">
                                        <img src="images/${motorbike.image}" width="100%" height="100%" alt="alt"/>
                                    </div>
                                    <h2 style="margin: 16px;" href="motorcycleDetail?id=${motorbike.motorcycleId}"><strong>${motorbike.model}</strong></h2>
                                    <p style="font-weight: bold;">${categoryMap[motorbike.categoryID]}<br/>
                                        <fmt:formatNumber value="${priceMap[motorbike.priceListID] * 1000}" type="number" maxFractionDigits="0"/>₫/ngày
                                    </p>
                                    <div class="button-wrapper" style="display: flex; gap: 10px; justify-content: center; width: 100%; margin-top: 18px;">
                                        <a href="motorcycleDetail?id=${motorbike.motorcycleId}" class="btn outline-huhu" style="flex: 1; text-align: center; display: inline-flex; align-items: center; justify-content: center;">CHI TIẾT</a>
                                        <c:set var="found" value="false" />
                                        <c:forEach var="entry" items="${listMA}">
                                            <c:if test="${entry.key eq motorbike.motorcycleId}">
                                                <c:set var="found" value="true" />                                            
                                            </c:if>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${found eq true}">
                                                <a href="booking?motorcycleid=${motorbike.motorcycleId}" class="btn fill" style="flex: 1; text-align: center; display: inline-flex; align-items: center; justify-content: center;">THUÊ NGAY</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="#" class="btn fill disabled" style="flex: 1; text-align: center; display: inline-flex; align-items: center; justify-content: center;">HẾT XE</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="row mt-5">
                            <div class="col text-center">
                                <div class="block-27">
                                     <c:choose>
                                         <c:when test="${empty motorcycles}">
                                             <!-- size == 0 ==> nothing here -->
                                         </c:when>
                                         <c:otherwise>
                                             <c:if test="${search != 'default'}">
                                                 <div class="reset-filter-container" style="display: flex; justify-content: center; margin-bottom: 25px;">
                                                     <a href="motorcycle" class="btn xemthem" style="padding: 10px 24px; border-radius: 30px; text-decoration: none; display: inline-flex; align-items: center; gap: 8px;">
                                                         <i class="fa fa-arrow-left"></i> Trở về trang xe máy ban đầu
                                                     </a>
                                                 </div>
                                             </c:if>
                                             <div class="pagination-container" style="display: flex; justify-content: center; margin-top: 20px;">
                                                 <ul class="pagination-list" style="display: inline-flex; list-style: none; gap: 8px; justify-content: center; padding: 0;">
                                                     <!-- Nút quay lại (Prev) -->
                                                     <c:if test="${tag > 1}">
                                                         <li>
                                                             <a href="javascript:void(0)" onclick="goToPage(${tag - 1})" class="page-link-custom">&lt;</a>
                                                         </li>
                                                     </c:if>

                                                     <!-- Danh sách trang -->
                                                     <c:forEach begin="1" end="${endP}" var="i">
                                                         <li class="${tag == i ? 'active' : ''}">
                                                             <c:choose>
                                                                 <c:when test="${tag == i}">
                                                                     <span class="page-link-custom active">${i}</span>
                                                                 </c:when>
                                                                 <c:otherwise>
                                                                     <a href="javascript:void(0)" onclick="goToPage(${i})" class="page-link-custom">${i}</a>
                                                                 </c:otherwise>
                                                             </c:choose>
                                                         </li>
                                                     </c:forEach>

                                                     <!-- Nút tiếp theo (Next) -->
                                                     <c:if test="${tag < endP}">
                                                         <li>
                                                             <a href="javascript:void(0)" onclick="goToPage(${tag + 1})" class="page-link-custom">&gt;</a>
                                                         </li>
                                                     </c:if>
                                                 </ul>
                                             </div>
                                         </c:otherwise>
                                     </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section> 

        </div>

    </div>
    <jsp:include page="/includes/customer/footer.jsp" />



    <!-- loader -->



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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="js/google-map.js"></script>
    <script src="js/main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
                                                 var totalMotorcycles = ${not empty totalMotorcycles ? totalMotorcycles : 9999};
                                                var currentAmount = document.getElementsByClassName("motorcycle").length;
                                                 function updateLoadMoreButton() {
                                                     var btn = document.getElementById("loadMoreBtn");
                                                     if (btn && currentAmount >= totalMotorcycles) {
                                                         btn.style.display = "none";
                                                     }
                                                 }
                                                updateLoadMoreButton();


                                                function loadMoreSearchName() {
                                                    var amount = document.getElementsByClassName("motorcycle").length;
                                                    var searchInput = document.getElementById('textSearch').value;
                                                    $.ajax({
                                                        url: "/MotorcyleHiringProject/loadSearchName",
                                                        type: "GET",
                                                        data: {
                                                            textSearch: searchInput,
                                                            total: amount
                                                        },
                                                        //if received a response from the server
                                                        success: function (res) {
                                                            var row = document.getElementById('motorcycleContent');
                                                            row.innerHTML += res;
                                                            currentAmount = document.getElementsByClassName("motorcycle").length;
                                                            updateLoadMoreButton();
                                                        },

                                                        //If there was no response from the server
                                                        error: function () {
                                                            alert("error");
                                                        }
                                                    });
                                                }
                                                function loadMoreSearchCriteria() {
                                                    var amount = document.getElementsByClassName("motorcycle").length;
                                                    $.ajax({
                                                        url: "/MotorcyleHiringProject/loadSearchCriteria",
                                                        type: "GET",
                                                        data: {
                                                            total: amount
                                                        },
                                                        //if received a response from the server
                                                        success: function (res) {
                                                            var row = document.getElementById('motorcycleContent');
                                                            row.innerHTML += res;
                                                            currentAmount = document.getElementsByClassName("motorcycle").length;
                                                            updateLoadMoreButton();
                                                        },

                                                        //If there was no response from the server
                                                        error: function () {
                                                            alert("error");
                                                        }
                                                    });
                                                }
                                                function loadMore() {
                                                    var amount = document.getElementsByClassName("motorcycle").length;
                                                    $.ajax({
                                                        url: "/MotorcyleHiringProject/load",
                                                        type: "GET",
                                                        data: {
                                                            total: amount
                                                        },
                                                        //if received a response from the server
                                                        success: function (res) {
                                                            var row = document.getElementById('motorcycleContent');
                                                            row.innerHTML += res;
                                                            currentAmount = document.getElementsByClassName("motorcycle").length;
                                                            updateLoadMoreButton();
                                                        },

                                                        //If there was no response from the server
                                                        error: function () {
                                                            alert("error");
                                                        }
                                                    });
                                                }
                                                function toggleOptions(id) {
                                                    var options = document.getElementById(id);
                                                    var button = options.previousElementSibling;
                                                    if (currentOpenOptions && currentOpenOptions !== options) {
                                                        currentOpenOptions.classList.remove('show-options');
                                                        currentOpenOptions.previousElementSibling.classList.remove('open');
                                                    }

                                                    options.classList.toggle('show-options');
                                                    button.classList.toggle('open');
                                                    currentOpenOptions = options.classList.contains('show-options') ? options : null;
                                                }

                                                function closeOptions(id) {
                                                    var options = document.getElementById(id);
                                                    options.classList.remove('show-options');
                                                }

                                                function toggleSelection(button) {
                                                    button.classList.toggle('selected');
                                                    updateSelectedFilters();
                                                }

                                                function updateSelectedFilters() {
                                                    var selectedButtons = document.querySelectorAll('.filter-options button.selected');
                                                    var selectedFilters = Array.from(selectedButtons).map(function (button) {
                                                        return {
                                                            text: button.textContent.trim(),
                                                            group: button.closest('.filter-group').querySelector('.filter-button').textContent.trim()
                                                        };
                                                    });
                                                    var selectedFiltersContainer = document.getElementById('selectedFilters');
                                                    selectedFiltersContainer.innerHTML = '';
                                                    if (selectedFilters.length > 0) {
                                                        var header = document.createElement('h2');
                                                        header.textContent = 'Đang lọc theo';
                                                        selectedFiltersContainer.appendChild(header);

                                                        var clearAllButton = document.createElement('div');
                                                        clearAllButton.className = 'selected-filter';
                                                        clearAllButton.innerHTML = '<span>× Bỏ chọn tất cả</span>';
                                                        clearAllButton.onclick = clearAllSelections;
                                                        selectedFiltersContainer.appendChild(clearAllButton)
                                                    }
                                                    selectedFilters.forEach(function (filter) {
                                                        var filterDiv = document.createElement('div');
                                                        filterDiv.className = 'selected-filter';
                                                        filterDiv.innerHTML = '<span>' + filter.group + ': ' + filter.text + '</span><span class="remove-filter" onclick="removeSelectedFilter(this.parentElement, \'' + filter.text + '\')">&#10006;</span>';
                                                        selectedFiltersContainer.appendChild(filterDiv);
                                                    });
                                                }

                                                function removeSelectedFilter(filterDiv, text) {
                                                    var filterOptionButtons = document.querySelectorAll('.filter-options button');
                                                    filterOptionButtons.forEach(function (button) {
                                                        if (button.textContent.trim() === text) {
                                                            button.classList.remove('selected');
                                                        }
                                                    });
                                                    filterDiv.remove();
                                                    updateSelectedFilters();
                                                }

                                                function clearAllSelections() {
                                                    var selectedButtons = document.querySelectorAll('.filter-options button.selected');
                                                    selectedButtons.forEach(function (button) {
                                                        button.classList.remove('selected');
                                                    });
                                                    updateSelectedFilters();
                                                }
                                                var currentOpenOptions = null;


                                                function showResults() {
                                                    var selectedBrands = [];
                                                    var selectedCategories = [];
                                                    var selectedDisplacements = [];
                                                    var selectedDemands = [];
                                                    var selectedPriceRanges = [];

                                                    var selectedPriceButton = document.querySelectorAll('#priceOptions .button-item-option.selected');
                                                    selectedPriceButton.forEach(function (button) {
                                                        var priceRange = button.getAttribute('data-id');
                                                        if (priceRange) {
                                                            selectedPriceRanges.push(priceRange);
                                                        }
                                                    });

                                                    var selectedBrandButtons = document.querySelectorAll('#brandOptions .button-item-option.selected');
                                                    selectedBrandButtons.forEach(function (button) {
                                                        var brandID = button.getAttribute('data-id');
                                                        if (brandID) {
                                                            selectedBrands.push(brandID);
                                                        }
                                                    });

                                                    var selectedCategoryButtons = document.querySelectorAll('#categoryOptions .button-item-option.selected');
                                                    selectedCategoryButtons.forEach(function (button) {
                                                        var categoryID = button.getAttribute('data-id');
                                                        if (categoryID) {
                                                            selectedCategories.push(categoryID);
                                                        }
                                                    });

                                                    var selectedDisplacementButtons = document.querySelectorAll('#massOptions .button-item-option.selected');
                                                    selectedDisplacementButtons.forEach(function (button) {
                                                        var displacement = button.getAttribute('data-id');
                                                        if (displacement) {
                                                            selectedDisplacements.push(displacement);
                                                        }
                                                    });

                                                    var selectedDemandButtons = document.querySelectorAll('#needOptions .button-item-option.selected');
                                                    selectedDemandButtons.forEach(function (button) {
                                                        var demandID = button.getAttribute('data-id');
                                                        if (demandID) {
                                                            selectedDemands.push(demandID);
                                                        }
                                                    });

                                                    var url = 'searchCriteria?';
                                                    if (selectedBrands.length > 0) {
                                                        url += 'brands=' + selectedBrands.join('&brands=') + '&';
                                                    }
                                                    if (selectedCategories.length > 0) {
                                                        url += 'categories=' + selectedCategories.join('&categories=') + '&';
                                                    }
                                                    if (selectedDisplacements.length > 0) {
                                                        url += 'displacements=' + selectedDisplacements.join('&displacements=') + '&';
                                                    }
                                                    if (selectedDemands.length > 0) {
                                                        url += 'demands=' + selectedDemands.join('&demands=') + '&';
                                                    }
                                                    if (selectedPriceRanges.length > 0) {
                                                        url += 'priceRanges=' + selectedPriceRanges.join('&priceRanges=') + '&';
                                                    }

                                                    // Remove the trailing '&'
                                                    url = url.slice(0, -1);

                                                    window.location.href = url;
                                                }

                                                function goToPage(index) {
                                                    const urlParams = new URLSearchParams(window.location.search);
                                                    urlParams.set('index', index);
                                                    window.location.search = urlParams.toString();
                                                }
    </script>
</body>
</html>
