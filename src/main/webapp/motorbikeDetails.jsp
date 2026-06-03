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
        <title>Motorcycles Detail</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!--logo-->
        


        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">

        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">        <style>             body {
                background: radial-gradient(circle at 50% 50%, #ffffff 0%, #f4f5f8 100%) !important;
                color: #2d3748 !important;
                font-family: 'Be Vietnam Pro', 'Poppins', sans-serif !important;
            }
            .ftco-section {
                background: transparent !important;
                padding: 4em 0 !important;
            }
            
            /* Motorcycle Showcase */
            .motorcycle-showcase {
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 40px;
                background: #ffffff;
                border-radius: 24px;
                border: 1px solid rgba(0, 0, 0, 0.05);
                overflow: hidden;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.05);
                min-height: 400px;
            }
            .spotlight-glow {
                position: absolute;
                width: 320px;
                height: 320px;
                background: radial-gradient(circle, rgba(184, 146, 40, 0.08) 0%, rgba(184, 146, 40, 0) 70%);
                filter: blur(40px);
                pointer-events: none;
                z-index: 1;
            }
            .hero-image {
                max-width: 100%;
                max-height: 350px;
                object-fit: contain;
                filter: drop-shadow(0 20px 30px rgba(0, 0, 0, 0.15));
                transition: transform 0.6s cubic-bezier(0.25, 1, 0.5, 1);
                z-index: 2;
            }
            .motorcycle-showcase:hover .hero-image {
                transform: scale(1.04) translateY(-8px);
            }

            /* Details Sidebar Card */
            .details-sidebar {
                background: #ffffff;
                border: 1px solid rgba(0, 0, 0, 0.05);
                border-radius: 24px;
                padding: 35px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.05);
                position: sticky;
                top: 100px;
            }
            .brand-badge {
                display: inline-block;
                padding: 6px 14px;
                background: rgba(184, 146, 40, 0.08);
                border: 1px solid rgba(184, 146, 40, 0.2);
                color: #b89228;
                font-size: 12px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1.5px;
                border-radius: 50px;
                margin-bottom: 16px;
            }
            .model-title {
                font-size: 36px;
                font-weight: 800;
                color: #1a202c;
                margin-bottom: 24px;
                line-height: 1.2;
                letter-spacing: -0.5px;
            }

            /* Accessory Grid */
            .accessories-section {
                margin-top: 40px;
            }
            .accessories-section h3 {
                color: #1a202c !important;
                font-size: 20px;
                font-weight: 700;
                margin-bottom: 20px;
                letter-spacing: 0.5px;
            }
            .accessories-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(130px, 1fr));
                gap: 16px;
            }
            .accessory-card {
                background: #ffffff;
                border: 1px solid rgba(0, 0, 0, 0.05);
                border-radius: 18px;
                padding: 16px;
                text-align: center;
                transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
                cursor: pointer;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 120px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.02);
            }
            .accessory-card:hover {
                background: rgba(184, 146, 40, 0.03);
                border-color: rgba(184, 146, 40, 0.3);
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(184, 146, 40, 0.08);
            }
            .accessory-icon-wrapper {
                width: 48px;
                height: 48px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 12px;
                transition: transform 0.3s ease;
            }
            .accessory-icon {
                max-width: 100%;
                max-height: 100%;
                object-fit: contain;
            }
            .accessory-card:hover .accessory-icon {
                transform: scale(1.12);
            }
            .accessory-title {
                font-size: 13px;
                font-weight: 600;
                color: #2d3748;
                margin: 0;
                line-height: 1.4;
            }

            /* Custom Pills & Tabs */
            .modern-tabs {
                border-bottom: 1px solid rgba(0, 0, 0, 0.06);
                margin-bottom: 24px;
            }
            .modern-tabs .nav-link {
                background: transparent !important;
                border: none !important;
                color: #718096 !important;
                font-weight: 600;
                font-size: 15px;
                padding: 12px 20px;
                position: relative;
                transition: color 0.3s ease;
                border-radius: 0 !important;
            }
            .modern-tabs .nav-link.active {
                color: #b89228 !important;
            }
            .modern-tabs .nav-link.active::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                height: 2px;
                background: #b89228;
                border-radius: 2px;
            }

            /* Pricing Card Integration */
            .pricing-list {
                padding: 0;
                margin: 0;
                list-style: none;
            }
            .pricing-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 14px 0;
                border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            }
            .pricing-item:last-child {
                border-bottom: none;
            }
            .pricing-label {
                color: #4a5568;
                font-size: 14px;
                font-weight: 500;
            }
            .pricing-value {
                color: #b89228;
                font-weight: 700;
                font-size: 20px;
            }
            
            #pills-manufacturer p {
                color: #4a5568 !important;
                line-height: 1.7;
                font-size: 15px;
                margin: 0;
            }

            /* Premium Rent Button */
            .rent-now-btn {
                width: 100%;
                background: linear-gradient(135deg, #d4af37 0%, #b89228 100%) !important;
                color: #ffffff !important;
                padding: 18px;
                border: none !important;
                border-radius: 16px;
                font-size: 16px;
                font-weight: 700;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
                box-shadow: 0 6px 20px rgba(184, 146, 40, 0.25);
                cursor: pointer;
                margin-top: 15px;
            }
            .rent-now-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 25px rgba(184, 146, 40, 0.35);
                background: linear-gradient(135deg, #e5c158 0%, #cfa63a 100%) !important;
            }
            .rent-now-btn:active {
                transform: translateY(-1px);
            }
            
            /* Modal Styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 10000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.4);
                backdrop-filter: blur(8px);
                -webkit-backdrop-filter: blur(8px);
            }
            .modal-content {
                background: #ffffff !important;
                border: 1px solid rgba(0, 0, 0, 0.08) !important;
                margin: 8% auto;
                padding: 30px;
                width: 90%;
                max-width: 750px;
                border-radius: 24px;
                box-shadow: 0 20px 50px rgba(0,0,0,0.15);
                color: #2d3748 !important;
                transform: scale(0.9);
                opacity: 0;
                transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
            }
            .modal.show-modal .modal-content {
                transform: scale(1);
                opacity: 1;
            }
            .close {
                color: #718096 !important;
                float: right;
                font-size: 28px;
                font-weight: 500;
                transition: color 0.2s;
                line-height: 1;
            }
            .close:hover {
                color: #1a202c !important;
                cursor: pointer;
            }
            #accessoryName {
                font-size: 28px;
                font-weight: 800;
                color: #b89228 !important;
                margin-bottom: 16px;
            }
            #accessoryDescription {
                color: #4a5568 !important;
                font-size: 15px;
                line-height: 1.6;
            }
            #accessoryPrice {
                color: #b89228 !important;
                font-size: 24px;
                font-weight: 700;
                margin-top: 20px;
            }
            .modal-img-container {
                background: #f7fafc;
                border: 1px solid rgba(0, 0, 0, 0.05);
                border-radius: 16px;
                padding: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 250px;
            }
            .modal-img-container img {
                max-width: 100%;
                max-height: 220px;
                object-fit: contain;
                filter: drop-shadow(0 8px 16px rgba(0,0,0,0.08));
            }
            .heading-section h2 {
                color: #1a202c !important;
            }
            .heading-section .subheading {
                color: #b89228 !important;
            } }
        </style>
        </head>
        <body>

            <jsp:include page="/includes/customer/header.jsp" />
            <jsp:include page="/includes/customer/navbar.jsp" />


            <section class="ftco-section ftco-car-details">
                <div class="container">
                    <div class="row">
                        <!-- Left Column: Motorcycle Hero Showcase & Accessories Grid -->
                        <div class="col-lg-7 pr-lg-5 animate__animated animate__fadeInLeft">
                            <div class="motorcycle-showcase">
                                <div class="spotlight-glow"></div>
                                <img src="${empty motorcycleDetail.image ? 'images/default.jpg' : (motorcycleDetail.image.startsWith('http') ? motorcycleDetail.image : 'images/'.concat(motorcycleDetail.image))}" 
                                     class="hero-image" 
                                     alt="${motorcycleDetail.model}"/>
                            </div>
                            
                            <!-- Accessories Section -->
                            <div class="accessories-section">
                                <h3>Một số phụ kiện đi kèm</h3>
                                <div class="accessories-grid">
                                    <c:forEach items="${listAccess}" var="listAccess">
                                        <div class="accessory-card" 
                                             onclick="openModal('${listAccess.accessoryName}', '${listAccess.accessoryDescription}', '${listAccess.price * 1000} VNĐ', '${listAccess.accessoryImage}')">
                                            <div class="accessory-icon-wrapper">
                                                <img src="images/${listAccess.accessoryImageicon}" 
                                                     class="accessory-icon" 
                                                     alt="${listAccess.accessoryName}">
                                            </div>
                                            <p class="accessory-title">${listAccess.accessoryName}</p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Right Column: Premium Sticky Sidebar (Title, Tabs, Price List, CTA Button) -->
                        <div class="col-lg-5 mt-5 mt-lg-0 animate__animated animate__fadeInRight">
                            <div class="details-sidebar">
                                <c:forEach var="brands" items="${brand}">
                                    <c:if test="${brands.brandID == motorcycleDetail.brandID}">
                                        <span class="brand-badge">${brands.brandName}</span>
                                    </c:if>
                                </c:forEach>
                                <h1 class="model-title">${motorcycleDetail.model}</h1>
                                
                                <ul class="nav nav-pills modern-tabs" id="pills-tab" role="tablist">
                                    <li class="nav-item" style="width: 50%; text-align: center;">
                                        <a class="nav-link active" id="pills-pricing-tab" data-bs-toggle="pill" data-bs-target="#pills-pricing" href="#pills-pricing" role="tab" aria-controls="pills-pricing" aria-selected="true">Giá Thuê</a>
                                    </li>
                                    <li class="nav-item" style="width: 50%; text-align: center;">
                                        <a class="nav-link" id="pills-manufacturer-tab" data-bs-toggle="pill" data-bs-target="#pills-manufacturer" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-selected="false">Mô tả</a>
                                    </li>
                                </ul>
                                
                                <div class="tab-content" id="pills-tabContent">
                                    <!-- Pricing Tab -->
                                    <div class="tab-pane fade show active" id="pills-pricing" role="tabpanel" aria-labelledby="pills-pricing-tab">
                                        <div class="pricing-list">
                                            <div class="pricing-item">
                                                <span class="pricing-label">Giá thuê theo ngày:</span>
                                                <span class="pricing-value">
                                                    <c:choose>
                                                        <c:when test="${not empty activeEvent and activeEvent.discount > 0}">
                                                            <div style="font-size: 14px; color: #999; text-decoration: line-through; text-align: right;">
                                                                <fmt:formatNumber value="${priceList.dailyPriceForDay * 1000}" type="currency" currencySymbol="VNĐ" />
                                                            </div>
                                                            <div style="color: #dc2626; font-size: 12px; font-weight: bold; background: #fee2e2; padding: 2px 6px; border-radius: 4px; display: inline-block; margin-bottom: 5px;">
                                                                Giảm <fmt:formatNumber value="${activeEvent.discount * 100}" maxFractionDigits="0"/>%
                                                            </div><br/>
                                                            <fmt:formatNumber value="${priceList.dailyPriceForDay * (1 - activeEvent.discount) * 1000}" type="currency" currencySymbol="VNĐ" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatNumber value="${priceList.dailyPriceForDay * 1000}" type="currency" currencySymbol="VNĐ" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </div>
                                            <div class="pricing-item">
                                                <span class="pricing-label">Giá thuê theo tuần:</span>
                                                <span class="pricing-value">
                                                    <c:choose>
                                                        <c:when test="${not empty activeEvent and activeEvent.discount > 0}">
                                                            <div style="font-size: 14px; color: #999; text-decoration: line-through; text-align: right;">
                                                                <fmt:formatNumber value="${priceList.dailyPriceForWeek * 1000}" type="currency" currencySymbol="VNĐ" />
                                                            </div>
                                                            <div style="color: #dc2626; font-size: 12px; font-weight: bold; background: #fee2e2; padding: 2px 6px; border-radius: 4px; display: inline-block; margin-bottom: 5px;">
                                                                Giảm <fmt:formatNumber value="${activeEvent.discount * 100}" maxFractionDigits="0"/>%
                                                            </div><br/>
                                                            <fmt:formatNumber value="${priceList.dailyPriceForWeek * (1 - activeEvent.discount) * 1000}" type="currency" currencySymbol="VNĐ" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatNumber value="${priceList.dailyPriceForWeek * 1000}" type="currency" currencySymbol="VNĐ" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </div>
                                            <div class="pricing-item">
                                                <span class="pricing-label">Giá thuê theo tháng:</span>
                                                <span class="pricing-value">
                                                    <c:choose>
                                                        <c:when test="${not empty activeEvent and activeEvent.discount > 0}">
                                                            <div style="font-size: 14px; color: #999; text-decoration: line-through; text-align: right;">
                                                                <fmt:formatNumber value="${priceList.dailyPriceForMonth * 1000}" type="currency" currencySymbol="VNĐ" />
                                                            </div>
                                                            <div style="color: #dc2626; font-size: 12px; font-weight: bold; background: #fee2e2; padding: 2px 6px; border-radius: 4px; display: inline-block; margin-bottom: 5px;">
                                                                Giảm <fmt:formatNumber value="${activeEvent.discount * 100}" maxFractionDigits="0"/>%
                                                            </div><br/>
                                                            <fmt:formatNumber value="${priceList.dailyPriceForMonth * (1 - activeEvent.discount) * 1000}" type="currency" currencySymbol="VNĐ" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatNumber value="${priceList.dailyPriceForMonth * 1000}" type="currency" currencySymbol="VNĐ" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Description Tab -->
                                    <div class="tab-pane fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
                                        <c:set var="desc" value="${motorcycleDetail.description}" />
                                        <c:choose>
                                            <c:when test="${empty desc || desc == 'Mô tả' || desc == 'Mô tả '}">
                                                <c:choose>
                                                    <c:when test="${motorcycleDetail.model == 'Yamaha NVX'}">
                                                        <p><strong>Yamaha NVX 155cc</strong> là dòng xe tay ga thể thao mạnh mẽ với thiết kế góc cạnh hầm hố đầy nam tính. Xe được trang bị động cơ Blue Core 155cc VVA tiên tiến, hệ thống phanh ABS chống bó cứng an toàn, khóa thông minh Smartkey tiện lợi và cổng sạc điện thoại tích hợp. NVX mang lại khả năng tăng tốc bứt phá và cảm giác vận hành vô cùng linh hoạt, là sự lựa chọn hoàn hảo cho những bạn trẻ đam mê tốc độ và phong cách năng động.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Yamaha Excite'}">
                                                        <p><strong>Yamaha Exciter 150cc (Yamaha Excite)</strong> được mệnh danh là "Ông vua đường phố" - mẫu xe côn tay huyền thoại được yêu thích nhất tại Việt Nam. Sở hữu khối động cơ 150cc mạnh mẽ, hộp số côn tay 5 cấp linh hoạt, và thiết kế khí động học đậm chất thể thao GP, Exciter mang lại khả năng bứt tốc vượt trội và trải nghiệm ôm cua, côn tay vô cùng phấn khích. Xe cực kỳ thích hợp cho các hành trình phượt xa lẫn di chuyển năng động hàng ngày.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Yamaha Sirius'}">
                                                        <p><strong>Yamaha Sirius 110cc</strong> là dòng xe số quốc dân nổi tiếng với sự bền bỉ, thiết kế gọn gàng tinh tế và khả năng vận hành vô cùng tiết kiệm nhiên liệu. Sở hữu động cơ 110cc 4 thì bền bỉ, khả năng tăng tốc mượt mà và cảm giác lái nhẹ nhàng, Sirius là người bạn đồng hành tin cậy cho mọi phân khúc khách hàng di chuyển hàng ngày trong đô thị hay đi học, đi làm.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Yamaha Sirius RC'}">
                                                        <p><strong>Yamaha Sirius RC 110cc</strong> kết hợp giữa động cơ 110cc bền bỉ siêu tiết kiệm xăng và bộ tem RC thể thao cá tính, vành đúc chắc chắn. Dòng xe này mang lại trải nghiệm lái xe linh hoạt, nhẹ nhàng và an toàn, cực kỳ phù hợp cho học sinh, sinh viên và nhân viên văn phòng đi lại hàng ngày.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Yamaha YZF-R15'}">
                                                        <p><strong>Yamaha YZF-R15 155cc</strong> là mẫu xe sportbike phân khối nhỏ kế thừa DNA đường đua từ dòng R-Series huyền thoại của Yamaha. Thiết kế khí động học hầm hố, tư thế ngồi lái thể thao chồm người phía trước, động cơ 155cc tích hợp van biến thiên VVA và bộ ly hợp chống trượt Slipper Clutch mang đến cảm giác vận hành mạnh mẽ, phấn khích và tốc độ cực đỉnh trên mọi cung đường.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Honda Air Blade'}">
                                                        <p><strong>Honda Air Blade 160cc</strong> là mẫu xe tay ga thể thao sang trọng bán chạy hàng đầu tại Việt Nam. Thiết kế lịch lãm, hiện đại kết hợp với khối động cơ eSP+ 160cc 4 van thế hệ mới mang lại sức mạnh bứt phá vượt trội nhưng vẫn êm ái, tiết kiệm xăng. Xe được trang bị phanh ABS, hộc chứa đồ siêu rộng có đèn soi và cổng sạc USB, đem lại sự tiện nghi và đẳng cấp tối đa cho người lái.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Honda Vario'}">
                                                        <p><strong>Honda Vario 125cc</strong> là dòng xe tay ga nhập khẩu vô cùng cá tính với những đường nét góc cạnh thể thao, năng động. Động cơ eSP 125cc thông minh, tiết kiệm nhiên liệu vượt trội cùng sàn để chân rộng rãi và cốp xe tiện ích giúp Vario trở thành sự lựa chọn hoàn hảo cho việc đi lại linh hoạt, phong cách hàng ngày trong thành phố.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Honda Future'}">
                                                        <p><strong>Honda Future 125cc</strong> là dòng xe số cao cấp hàng đầu của Honda, nổi tiếng với thiết kế lịch lãm giống xe ga và khả năng tiết kiệm xăng vượt trội hàng đầu phân khúc. Động cơ 125cc bền bỉ, êm ái, cốp xe U-box tiện lợi đựng được mũ bảo hiểm nửa đầu đem lại cảm giác lái đầm chắc, thư thái và vô cùng tiết kiệm cho những hành trình dài.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Honda Winner X'}">
                                                        <p><strong>Honda Winner X 150cc</strong> là mẫu xe côn tay thể thao hàng đầu đầy góc cạnh, hiện đại từ Honda. Với thiết kế pô uy lực, phanh ABS bánh trước chống trượt, động cơ DOHC 150cc 6 cấp số mạnh mẽ vượt trội, Winner X đem đến khả năng tăng tốc bứt phá phấn khích, đầm chắc ở tốc độ cao, là chiến hữu đích thực cho mọi chuyến đi phượt và chinh phục các cung đường.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Honda CBR150R'}">
                                                        <p><strong>Honda CBR150R 150cc</strong> là dòng xe sportbike đô thị đẳng cấp mang phong cách thiết kế từ đàn anh CBR250RR đầy góc cạnh. Trang bị phuộc trước hành trình ngược Upside Down cao cấp, ly hợp hỗ trợ và chống trượt hai chiều cùng động cơ DOHC 150cc cực kỳ mạnh mẽ mang lại trải nghiệm ôm cua, bứt tốc thể thao đỉnh cao.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Suzuki RAIDER R150'}">
                                                        <p><strong>Suzuki Raider R150 150cc</strong> là dòng xe côn tay phân khúc Hyper Underbone huyền thoại với biệt danh "vua tốc độ". Thiết kế gọn nhẹ độc đáo tối ưu khí động học kết hợp cùng khối động cơ DOHC cam kép 150cc, làm mát bằng dung dịch cho khả năng bứt tốc từ ga đầu cực kỳ kinh ngạc, mang lại cảm giác phấn khích tột độ cho người mê tốc độ.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Suzuki SATRIA F150'}">
                                                        <p><strong>Suzuki Satria F150 150cc</strong> nhập khẩu nguyên chiếc là mẫu xe Hyper Underbone thể thao đầy cá tính. Sở hữu sức mạnh bứt phá ga đầu ấn tượng từ động cơ 150cc cam kép DOHC mạnh mẽ, khả năng điều khiển linh hoạt luồn lách trên mọi con phố đông đúc giúp Satria trở thành dòng xe côn tay được săn đón hàng đầu.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Suzuki GSX R150'}">
                                                        <p><strong>Suzuki GSX-R150 150cc</strong> là mẫu xe sportbike có tỉ lệ công suất trên trọng lượng tối ưu nhất phân khúc. Thiết kế khí động học lấy cảm hứng từ dòng GSX-R danh tiếng, động cơ DOHC 150cc mạnh mẽ vượt trội đem lại tốc độ bứt phá kinh ngạc, là chiếc xe lý tưởng cho những tín đồ đam mê tốc độ và đường đua chuyên nghiệp.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Sym Galaxy'}">
                                                        <p><strong>Sym Galaxy 50cc</strong> là dòng xe số thể thao cá tính không cần bằng lái, vô cùng được ưa chuộng bởi học sinh và sinh viên. Thiết kế trẻ trung với góc cạnh cá tính, động cơ 50cc êm ái, hoạt động siêu tiết kiệm xăng giúp việc di chuyển đến trường, đi dạo phố trở nên vô cùng an toàn, tiết kiệm và nhẹ nhàng.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Sym Attila'}">
                                                        <p><strong>Sym Attila 50cc</strong> là biểu tượng xe tay ga cổ điển dành riêng cho phái đẹp không cần bằng lái. Thiết kế kiểu dáng Ý thanh lịch, cốp xe siêu rộng đựng nhiều đồ dùng cá nhân, cùng khối động cơ 50cc êm ái, dễ vận hành giúp mọi hành trình dạo phố của bạn trở nên vô cùng nhẹ nhàng, quý phái.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Sym Elegant'}">
                                                        <p><strong>Sym Elegant 50cc</strong> là dòng xe số 50cc bền bỉ, tiết kiệm xăng cực tốt và thân thiện với học sinh, sinh viên chưa có bằng lái. Thiết kế thon gọn lịch lãm, tay lái đầm chắc, phuộc nhún êm ái đem lại trải nghiệm di chuyển cực kỳ ổn định, an toàn trên mọi con đường thành phố.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'VinFast Evo200'}">
                                                        <p><strong>VinFast Evo200</strong> là mẫu xe máy điện thông minh thế hệ mới từ VinFast sở hữu thiết kế Châu Âu thanh lịch. Sử dụng pin LFP tiên tiến cho quãng đường di chuyển lên tới hơn 200km mỗi lần sạc đầy, động cơ điện êm ái chống nước tuyệt đối tiêu chuẩn IP67, đem lại giải pháp di chuyển xanh đột phá và cực kỳ kinh tế.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'VinFast Klara S'}">
                                                        <p><strong>VinFast Klara S</strong> là mẫu xe máy điện cao cấp đầy kiêu hãnh được ví như "viên ngọc" đô thị. Xe tích hợp động cơ Bosch 1200W mạnh mẽ, hệ thống 2 pin Lithium tiên tiến siêu bền bỉ, tính năng kết nối điện thoại thông minh định vị GPS mang lại hành trình di chuyển êm ái, sang trọng và hiện đại.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Piaggio Liberty'}">
                                                        <p><strong>Piaggio Liberty 150cc</strong> là mẫu xe tay ga cao cấp mang đậm phong cách thời trang Ý thanh lịch và thời thượng. Thiết kế bánh xe lớn vững chãi, hệ thống phanh ABS bánh trước an toàn tuyệt đối và động cơ i-Get thế hệ mới tiết kiệm nhiên liệu mang lại trải nghiệm di chuyển vô cùng đẳng cấp và cuốn hút.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Piaggio Medley'}">
                                                        <p><strong>Piaggio Medley 150cc</strong> là mẫu xe tay ga bánh lớn cao cấp tích hợp nhiều công nghệ tối tân từ Piaggio. Động cơ i-Get 150cc phun xăng điện tử làm mát bằng dung dịch mạnh mẽ, cốp xe siêu khủng chứa được 2 mũ bảo hiểm cả đầu và phanh ABS đôi bánh trước sau mang lại sự tiện nghi tối đa.</p>
                                                    </c:when>
                                                    <c:when test="${motorcycleDetail.model == 'Piaggio Fly'}">
                                                        <p><strong>Piaggio Fly 120cc (hoặc Fly 50cc)</strong> là mẫu xe tay ga thời trang châu Âu vô cùng thực dụng, đầm chắc. Sàn để chân rộng rãi, thiết kế cổ điển bền bỉ theo thời gian và động cơ êm ái đem lại cảm giác dạo phố nhẹ nhàng, đầm ấm và vô cùng an toàn cho cả gia đình.</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p><strong>${motorcycleDetail.model}</strong> là dòng xe chất lượng cao mang lại sự bền bỉ, êm ái và siêu tiết kiệm nhiên liệu cho mọi chuyến hành trình của bạn. Xe được bảo dưỡng định kỳ cẩn thận, cam kết trạng thái hoạt động tốt nhất trước khi bàn giao cho khách hàng.</p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <p>${desc}</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                
                                <!-- Modern Rent CTA Button -->
                                <button class="rent-now-btn" onclick="redirectToBooking(event, '${motorcycleDetail.motorcycleId}')">
                                    THUÊ XE NGAY
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- Polish Modal definition -->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal()">&times;</span>
                    <div class="row align-items-center" id="accessoryForm">
                        <div class="col-md-6 pr-md-4">
                            <h2 id="accessoryName"></h2>
                            <p id="accessoryDescription"></p>
                            <h3 id="accessoryPrice"></h3>
                        </div>
                        <div class="col-md-6 mt-4 mt-md-0">
                            <div class="modal-img-container">
                                <img id="accessoryImage" src="" alt="Accessory Image">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="ftco-section ftco-no-pt">
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                            <span class="subheading">Lựa Chọn Khác</span>
                            <h2 class="mb-2">Các Xe Liên Quan</h2>
                        </div>
                    </div>
                    <iframe src="slide.jsp" style="width: 100%;
                            height: 540px;
                            border: none;
                            background: transparent;
                            padding: 0;
                            margin: 0;"
                            allowtransparency="true"></iframe>
                </div>
            </section>


            <jsp:include page="/includes/customer/footer.jsp" />



            <!-- loader -->
            <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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

        </body>
        <script>
            function openModal(name, description, price, imageSrc) {
                document.getElementById('accessoryName').textContent = name;
                document.getElementById('accessoryDescription').textContent = description;
                document.getElementById('accessoryPrice').textContent = price;
                document.getElementById('accessoryImage').src = 'images/' + imageSrc;
                var modal = document.getElementById('myModal');
                modal.style.display = 'block';
                setTimeout(function() {
                    modal.classList.add('show-modal');
                }, 10);
            }
            function closeModal() {
                var modal = document.getElementById('myModal');
                modal.classList.remove('show-modal');
                setTimeout(function() {
                    modal.style.display = 'none';
                }, 300);
            }

            window.onclick = function (event) {
                var modal = document.getElementById("myModal");
                if (event.target === modal) {
                    closeModal();
                }
            }
            window.onkeydown = function (event) {
                var modal = document.getElementById("myModal");
                if (event.key === "Escape" || event.key === "Esc") {
                    closeModal();
                }
            }
        </script>
        <script>
            function redirectToBooking(event, motorcycleId) {
                event.preventDefault(); // Prevent the default anchor behavior
                window.top.location.href = 'booking?motorcycleid=' + motorcycleId;// Redirect to the booking page
            }
        </script>
    </html>
