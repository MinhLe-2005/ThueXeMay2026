<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.smartride.dao.EventDAO" %>
<%@ page import="com.smartride.dto.Event" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Event activeEvent = EventDAO.getInstance().getActiveEvent();
    request.setAttribute("activeEvent", activeEvent);
%>
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
                background: #ffffff;
                margin: 40px auto;
                max-width: 1200px;
                box-sizing: border-box;
                box-shadow: 0 15px 50px rgba(0, 0, 0, 0.08);
                border: 1px solid rgba(0, 0, 0, 0.04);
                border-radius: 20px;
                padding: 24px 32px;
                width: 95%;
                position: relative;
                z-index: 99999;
                overflow: visible !important;
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
                align-items: center;
                justify-content: space-between;
                gap: 20px;
            }

            .filter-group {
                position: relative;
                z-index: 9999;
                overflow: visible !important;
            }

            .filter-button {
                padding: 12px 24px;
                border: 1px solid rgba(181, 147, 73, 0.2);
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-weight: 600;
                background: #fcfbf9;
                color: #1a1816;
                cursor: pointer;
                border-radius: 30px;
                transition: all 0.3s ease;
                display: inline-flex;
                align-items: center;
                gap: 8px;
            }

            .filter-button:hover, .filter-button.has-active-filter {
                color: #fff !important;
                background: #b59349;
                border-color: #b59349;
            }

            .filter-options {
                color: #1a1816;
                top: calc(100% + 15px);
                left: 50%;
                transform: translateX(-50%);
                position: absolute;
                z-index: 9999;
                background-color: #fff;
                border: 1px solid rgba(181, 147, 73, 0.15);
                border-radius: 16px;
                box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
                opacity: 0;
                padding: 12px;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                min-width: 220px;
                max-width: 280px;
                display: none;
            }

            .filter-options button {
                width: 100%;
                padding: 10px 16px;
                border: none;
                background: transparent;
                cursor: pointer;
                border-radius: 8px;
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-weight: 500;
                font-size: 0.95rem;
                transition: all 0.2s ease;
                color: #1a1816;
                text-align: left;
            }

            .filter-options:before {
                border-bottom: 10px solid rgba(181, 147, 73, 0.15);
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                content: "";
                left: 50%;
                transform: translateX(-50%);
                position: absolute;
                top: -10px;
            }

            .filter-options:after {
                border-bottom: 10px solid #fff;
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                content: "";
                left: 50%;
                transform: translateX(-50%);
                position: absolute;
                top: -9px;
            }

            .filter-options button:hover {
                background-color: rgba(181, 147, 73, 0.08);
                color: #b59349;
            }

            .filter-options button.selected {
                background: rgba(181, 147, 73, 0.1) !important;
                color: #b59349 !important;
                font-weight: 600;
            }

            .show-options {
                display: flex !important;
                flex-direction: column;
                gap: 2px;
                opacity: 1 !important;
            }

            .filter-group .filter-button:after {
                content: ' ▼';
                font-size: 0.8em;
                opacity: 0.7;
            }
            .filter-group .filter-button.open:after {
                content: ' ▲';
                font-size: 0.8em;
                opacity: 0.7;
            }
            .filter-group .filter-button.xemketqua:after {
                content: none;
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

            .selected-filters:empty {
                display: none !important;
                padding: 0 !important;
                margin: 0 !important;
                border: none !important;
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
                /* Removed width constraint so it uses flex layout from .show-options */
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
                font-family: 'Playfair Display', serif !important;
                color: #1a1816 !important;
                font-weight: 600 !important;
                font-size: 3rem !important;
                margin: 15px 0 30px 0;
            }
            .list-subtitle {
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-size: 0.9rem;
                letter-spacing: 3px;
                text-transform: uppercase;
                color: #b59349;
                font-weight: 600;
                display: block;
                text-align: center;
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
        <div class="container" style="margin-top: 130px; margin-bottom: 40px; position: relative; z-index: 99; overflow: visible !important;">
            <!-- thanh search -->
            <section style="overflow: visible !important;">
                <div class="filter-module" style="background: white; border-radius: 20px; padding: 25px 35px; box-shadow: 0 15px 40px rgba(0,0,0,0.06); border: 1px solid rgba(181,147,73,0.1);">
                    <!-- HÀNG 1: Ô Tìm Kiếm Từ Khóa -->
                    <div class="filter-search-row" style="margin-bottom: 20px;">
                        <form action="searchMotorcycle" method="get" style="display: flex; gap: 15px; align-items: center; width: 100%;">
                            <div style="flex: 1; position: relative;">
                                <input id="textSearch" style="width: 100%; padding: 16px 24px; padding-left: 50px; border-radius: 50px; border: 1px solid rgba(181,147,73,0.3); font-size: 1rem; box-shadow: inset 0 2px 4px rgba(0,0,0,0.02);" value="${key}" name="textSearch" class="form-control" type="search" placeholder="Nhập tên xe, dòng xe bạn muốn tìm..." aria-label="Search">
                                <i class="fa fa-search" style="position: absolute; left: 20px; top: 50%; transform: translateY(-50%); color: #b59349; font-size: 1.2rem;"></i>
                            </div>
                            <button class="btn xemketqua" style="border-radius: 50px; padding: 16px 36px; white-space: nowrap; font-weight: bold; color: white; font-size: 1rem; box-shadow: 0 4px 15px rgba(181,147,73,0.3);" type="submit">Tìm kiếm</button>
                        </form>
                    </div>

                    <!-- HÀNG 2: Các Dropdown Lọc Kết Quả -->
                    <div class="filter-dropdowns-row" style="display: flex; flex-wrap: wrap; gap: 15px; align-items: center; justify-content: center; padding-top: 20px; border-top: 1px solid rgba(0,0,0,0.05);">
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
                                </div>
                            </div>

                            <div class="filter-group">
                                <button class="filter-button" onclick="toggleOptions('needOptions')">Nhu cầu</button>
                                <div class="filter-options" id="needOptions">
                                    <c:forEach items="${listDemand}" var="o">
                                        <input hidden name="demands" value="${o.demandId}" id="searchDemand">
                                        <button class="button-item-option" data-id="${o.demandId}" onclick="toggleSelection(this)">${o.demand}</button>
                                    </c:forEach>
                                </div>
                            </div>

                        <div class="filter-group">
                            <button class="filter-button xemketqua" style="color: white; border-radius: 30px; padding: 12px 24px;" onclick="showResults()">Lọc kết quả</button>
                        </div>
                    </div>

                    </div>

                    <div class="selected-filters" id="selectedFilters">
                        <!-- Selected filters will be displayed here -->
                    </div>
                </div>

                <!-- SMART ASSISTANT BANNER -->
                <div class="container" style="margin-top: 40px; margin-bottom: 20px;">
                    <div style="background: linear-gradient(135deg, #1a1816 0%, #362f27 100%); border-radius: 24px; padding: 40px; color: white; box-shadow: 0 20px 40px rgba(0,0,0,0.15); position: relative; overflow: hidden;">
                        <!-- Decorative circle -->
                        <div style="position: absolute; top: -50px; right: -50px; width: 200px; height: 200px; background: radial-gradient(circle, rgba(181,147,73,0.3) 0%, rgba(255,255,255,0) 70%); border-radius: 50%;"></div>
                        
                        <div class="row align-items-center position-relative" style="z-index: 1;">
                            <div class="col-lg-6 mb-4 mb-lg-0">
                                <h3 style="font-family: 'Plus Jakarta Sans', sans-serif; font-weight: 800; font-size: 2rem; margin-bottom: 15px; color: #b59349;">
                                    <i class="bi bi-stars"></i> Trợ Lý SmartRide
                                </h3>
                                <p style="font-size: 1.1rem; color: #e0e0e0; margin-bottom: 0;">Bạn dự định khám phá những địa điểm tuyệt đẹp nào tại Đà Nẵng? Hệ thống sẽ gợi ý cho bạn chiếc xe hoàn hảo nhất!</p>
                            </div>
                            <div class="col-lg-6">
                                <form action="searchCriteria" method="get" onsubmit="return handleSmartSearch(event, this)">
                                    <div class="d-flex gap-2">
                                        <div class="flex-grow-1 position-relative">
                                            <i class="bi bi-geo-alt position-absolute" style="left: 15px; top: 50%; transform: translateY(-50%); color: #b59349; font-size: 1.2rem; pointer-events: none;"></i>
                                            <select name="locations" class="form-select form-select-lg" style="border-radius: 12px; border: none; background: #ffffff; color: #1a1816; font-weight: 500; font-family: 'Plus Jakarta Sans', sans-serif; box-shadow: 0 5px 15px rgba(0,0,0,0.1); cursor: pointer; padding-left: 45px; height: 56px;" required>
                                                <option value="" selected disabled>-- Chọn địa điểm du lịch --</option>
                                                <c:forEach items="${listLocations}" var="loc">
                                                    <option value="${loc.locationId}">${loc.locationName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn" style="background: #b59349; color: white; border-radius: 12px; font-weight: 700; padding: 0 30px; height: 56px; white-space: nowrap; font-family: 'Plus Jakarta Sans', sans-serif; box-shadow: 0 5px 15px rgba(181,147,73,0.4); transition: all 0.3s ease;" onmouseover="this.style.transform='translateY(-2px)';" onmouseout="this.style.transform='translateY(0)';">
                                            Gợi ý ngay <i class="bi bi-magic ms-1"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                function handleSmartSearch(e, form) {
                    e.preventDefault();
                    
                    const btn = form.querySelector('button');
                    btn.disabled = true;
                    btn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Đang xử lý...';
                    
                    setTimeout(() => {
                        form.submit();
                    }, 1000);
                }
                </script>

                <div class="list">
                    <div style="text-align: center; margin-top: 40px;">
                        <span class="list-subtitle animate__animated animate__fadeIn">Bộ Sưu Tập Xe</span>
                        <c:choose>
                            <c:when test="${not empty param.locations and param.locations != 'all'}">
                                <c:set var="locName" value="" />
                                <c:forEach items="${listLocations}" var="loc">
                                    <c:if test="${loc.locationId == param.locations}">
                                        <c:set var="locName" value="${loc.locationName}" />
                                    </c:if>
                                </c:forEach>
                                <c:if test="${not empty locName}">
                                    <h1 class="animate__animated animate__backInDown">Gợi ý xe cho <span style="color: #b59349;">${locName}</span></h1>
                                </c:if>
                                <c:if test="${empty locName}">
                                    <h1 class="animate__animated animate__backInDown">Danh Sách Xe Máy</h1>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <h1 class="animate__animated animate__backInDown">Danh Sách Xe Máy</h1>
                            </c:otherwise>
                        </c:choose>
                    </div>
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
                                        <c:choose>
                                            <c:when test="${not empty activeEvent and activeEvent.discount > 0}">
                                                <div style="display: flex; gap: 8px; justify-content: center; align-items: baseline; margin-top: 5px;">
                                                    <span style="font-size: 14px; color: #999; text-decoration: line-through;">
                                                        <fmt:formatNumber value="${priceMap[motorbike.priceListID] * 1000}" type="number" maxFractionDigits="0"/>₫
                                                    </span>
                                                    <span style="color: #dc2626; font-size: 12px; font-weight: bold; background: #fee2e2; padding: 2px 6px; border-radius: 4px;">
                                                        -<fmt:formatNumber value="${activeEvent.discount * 100}" maxFractionDigits="0"/>%
                                                    </span>
                                                </div>
                                                <span style="font-size: 18px; color: #b59349;"><fmt:formatNumber value="${priceMap[motorbike.priceListID] * (1 - activeEvent.discount) * 1000}" type="number" maxFractionDigits="0"/>₫/ngày</span>
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${priceMap[motorbike.priceListID] * 1000}" type="number" maxFractionDigits="0"/>₫/ngày
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                    <div class="button-wrapper" style="display: flex; gap: 10px; justify-content: center; width: 100%; margin-top: 18px;">
                                        <a href="motorcycleDetail?id=${motorbike.motorcycleId}" class="btn outline-huhu" style="flex: 1; text-align: center; display: inline-flex; align-items: center; justify-content: center;">CHI TIẾT</a>
                                        <c:choose>
                                            <c:when test="${not empty listMA[motorbike.motorcycleId]}">
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
    <script src="js/main.js"></script>
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
                                                var currentOpenOptions = null;
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
                                                    
                                                    // Auto-close dropdown when an option is selected
                                                    if (currentOpenOptions) {
                                                        currentOpenOptions.classList.remove('show-options');
                                                        currentOpenOptions.previousElementSibling.classList.remove('open');
                                                        currentOpenOptions = null;
                                                    }
                                                }

                                                // Auto-close dropdown when clicking outside
                                                document.addEventListener('click', function(event) {
                                                    if (typeof currentOpenOptions !== 'undefined' && currentOpenOptions !== null) {
                                                        var isClickInsideFilter = event.target.closest('.filter-group');
                                                        // if clicked outside any filter group
                                                        if (!isClickInsideFilter) {
                                                            currentOpenOptions.classList.remove('show-options');
                                                            currentOpenOptions.previousElementSibling.classList.remove('open');
                                                            currentOpenOptions = null;
                                                        }
                                                    }
                                                });

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
