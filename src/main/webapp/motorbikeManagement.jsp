<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vertical Tabs with Right Navigation</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
        <style>
            
            
            body, html {
                height: 100%;
                margin: 0;
                font-family: 'Be Vietnam Pro', 'Tahoma', sans-serif;
                background-color: #f5f7fb; /* Light modern gray */
            }

            .tab-container {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                margin-top: 10px;
            }

            .tab-content {
                flex: 1;
                padding: 10px 40px;
            }

            /* --- Premium Pill Tabs --- */
            .nav-tabs {
                display: inline-flex;
                flex-wrap: wrap;
                background: #f1f5f9; /* Khung nền xám nhạt */
                border-radius: 12px;
                padding: 6px !important;
                margin-left: 3%;
                margin-bottom: 30px;
                border-bottom: none !important;
                gap: 5px;
            }

            .nav-tabs li {
                margin: 0;
            }

            .nav-tabs li a {
                color: #64748b;
                background: transparent;
                font-size: 13px;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                padding: 12px 24px;
                margin: 0;
                border: none !important;
                border-radius: 8px !important;
                transition: all 0.3s ease;
                box-shadow: none !important;
            }

            .nav-tabs li a:hover {
                color: #1e293b !important;
                background: #e2e8f0 !important; /* Xám đậm hơn chút khi hover */
            }

            .nav-tabs li.active a,
            .nav-tabs li.active a:focus,
            .nav-tabs li.active a:hover {
                color: #d4af37 !important; /* Chữ vàng Gold */
                background: #1a1816 !important; /* Nền đen nhám */
                box-shadow: 0 4px 15px rgba(26, 24, 22, 0.25) !important;
            }

            .nav-tabs li.active a::after {
                display: none; /* Bỏ cái gạch chân cũ đi */
            }
            .tableview {
                width: 100%;
                margin: 0 auto;
                background: #ffffff;
                border-radius: 12px;
                padding: 24px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06); 
            }

            .table-image {
                width: 100%;
                border-collapse: collapse !important;
                margin-top: 5px !important;
                border: 1px solid #e2e8f0 !important; /* Đóng khung toàn bộ bảng */
                border-radius: 8px;
                overflow: hidden;
            }

            /* --- Header: Đen Nhám Premium --- */
            .table thead th {
                background: #1a1816 !important; 
                color: #d4af37 !important; 
                font-size: 13px !important;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                border: none !important; 
                border-bottom: 3px solid #d4af37 !important; /* Nhấn nhá đường vàng dưới Header */
                padding: 16px 12px;
                text-align: center;
                vertical-align: middle;
                white-space: nowrap; /* Không cho rớt dòng */
            }

            /* Căn trái cho tiêu đề cột Mẫu và Mô tả */
            .table thead th:nth-child(3),
            .table thead th:nth-child(5) {
                text-align: left;
            }

            /* --- Table Body: Phân cách Rõ ràng --- */
            .table-image td {
                background: transparent;
                vertical-align: middle;
                border: none !important; 
                border-bottom: 1px solid #e2e8f0 !important; /* Viền ngang */
                border-right: 1px dashed #e2e8f0 !important; /* Phân cách dọc siêu mờ */
                padding: 16px 12px; 
                color: #334155; 
                font-size: 14px;
                text-align: center;
                transition: background-color 0.2s ease;
            }
            .table-image td:last-child {
                border-right: none !important;
            }

            /* Bật lại sọc dưa để dễ dóng hàng */
            .table-image tbody tr:nth-of-type(odd) td {
                background-color: #ffffff !important;
            }
            .table-image tbody tr:nth-of-type(even) td {
                background-color: #f8f9fa !important;
            }

            /* Cột Mẫu xe và Mô tả căn trái */
            .table-image td:nth-child(3) {
                text-align: left;
                font-weight: 600;
                color: #0f172a; 
            }
            .table-image td:nth-child(5) {
                text-align: left;
                color: #64748b;
            }

            /* Hover effect nổi bật nhẹ nhàng */
            .table-image tbody tr:hover td {
                background-color: #fff3cd !important; 
                color: #1a1816;
            }

            .desc-text {
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 250px; /* Giới hạn độ rộng thay vì dùng % cho cột */
            }

            
            .table-image tbody tr:hover td {
                background: #fafafa !important;
            }

            /* Thu nhỏ kích thước ảnh lại cho tinh tế */
            .table-image img {
                width: 100px;
                height: auto;
                max-height: 70px;
                object-fit: contain; /* Đổi thành contain để không bị xén mất xe */
                border-radius: 4px;
            }

            /* --- Premium Solid Buttons --- */
            .btn {
                border-radius: 6px;
                padding: 8px 16px;
                font-weight: 600;
                font-size: 13px;
                text-transform: none;
                transition: all 0.2s ease;
                border: none;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1) !important;
            }
            .btn:active {
                transform: translateY(1px);
                box-shadow: none !important;
            }

            /* Nút Chi Tiết nổi bật */
            .btn-gold {
                background: #b59349;
                color: #ffffff;
            }
            .btn-gold:hover {
                background: #9a7b3c;
                color: #ffffff;
            }

            /* Nút Edit (Action) */
            .btn-dark-custom {
                background: #2b3445;
                color: #ffffff;
            }
            .btn-dark-custom:hover {
                background: #111827;
                color: #ffffff;
            }

            /* Nút Xóa (Action) */
            .btn-danger-custom {
                background: #ef4444;
                color: #ffffff;
            }
            .btn-danger-custom:hover {
                background: #dc2626;
                color: #ffffff;
            }

            .buttons {
                display: flex;
                gap: 8px;
                align-items: center;
            }

            /* Forms inside Add/Update */
            .addnew, .editmotor {
                background: #fff;
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.03);
            }
            
            .addnew h3, .editmotor h3 {
                color: #1a1816;
                font-weight: 800;
                font-size: 1.5rem;
                margin-bottom: 30px;
                position: relative;
            }
            .addnew h3::after, .editmotor h3::after {
                content: '';
                position: absolute;
                bottom: -10px;
                left: 0;
                width: 50px;
                height: 4px;
                background: #d4af37;
                border-radius: 2px;
            }

            .form-group {
                margin-bottom: 22px; /* Tạo khoảng cách giữa các ô nhập liệu */
            }

            .form-control {
                border-radius: 10px;
                border: 1px solid #e2e8f0;
                padding: 12px 15px;
                background: #f8fafc;
                transition: all 0.3s ease;
                box-shadow: none !important;
                height: auto; /* Fix lỗi đè chữ ở select box */
                font-size: 14px;
            }
            .form-control:focus {
                border-color: #d4af37;
                background: #fff;
                box-shadow: 0 0 0 3px rgba(212, 175, 55, 0.15) !important;
            }

            /* Làm đẹp nút tải ảnh lên */
            input[type="file"].form-control-file {
                padding: 15px;
                background: #f8fafc;
                border: 2px dashed #cbd5e1;
                border-radius: 10px;
                width: 100%;
                cursor: pointer;
                transition: all 0.3s ease;
            }
            input[type="file"].form-control-file:hover {
                border-color: #d4af37;
                background: #fff;
            }

            /* Nút Submit của Form */
            .addnew .btn-dark, .editmotor .btn-dark {
                background: #1a1816;
                color: #d4af37;
                padding: 14px 20px;
                font-weight: 700;
                border-radius: 10px;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 1px;
                width: 100%;
                border: none;
                transition: all 0.3s ease;
            }
            .addnew .btn-dark:hover, .editmotor .btn-dark:hover {
                background: #d4af37;
                color: #1a1816;
                box-shadow: 0 4px 15px rgba(212, 175, 55, 0.3);
            }

            .btn-dark {
                background: #1a1816;
                border: none;
                border-radius: 10px;
                padding: 12px 25px;
                font-weight: 600;
                letter-spacing: 0.5px;
                transition: all 0.3s;
            }
            .btn-dark:hover {
                background: #d4af37;
                color: #1a1816;
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(212, 175, 55, 0.3);
            }

            .container-fluid {
                padding: 0;
                background: transparent;
            }

            /* Page title fixes */
            .pagetitle {
                padding-left: 40px !important;
            }

        </style>
     
    </head>

    <body>
        <!-- ======= Header ======= -->

        <div class="container-fluid tab-container col-md-12">
            <div class="pagetitle" style="padding-left: 3%; margin-bottom: 20px;">
                <h1 style="color: #1a1816; font-weight: 800; font-size: 24px; text-transform: uppercase; margin-top: 0; margin-bottom: 5px; font-family: 'Tahoma', sans-serif;">QUẢN LÝ XE MÁY</h1>
                <nav>
                    <ol class="breadcrumb" style="background: transparent; padding: 0; margin: 0; font-size: 14px;">
                        <li class="breadcrumb-item"><a href="homeStaff" target="_top" style="color: #b59349; text-decoration: none; font-weight: 600;">Trang chủ</a></li>
                        <li class="breadcrumb-item active" style="font-weight: 500; color: #6c757d;">Quản lý xe máy</li>
                    </ol>
                </nav>
            </div>
            <!-- Danh sách tab ngang -->
            <ul class="m-auto nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#Section1"
                                                          aria-controls="home" role="tab"

                                                          data-toggle="tab">THÔNG TIN XE MÁY</a></li>
                <li role="presentation"><a href="#Section2"
                                           aria-controls="profile" role="tab"
                                           data-toggle="tab">THÊM MẪU XE MỚI</a></li>
                <li role="presentation">
                    <a href="#Section3" aria-controls="addNewMotorbike" role="tab" data-toggle="tab">THÊM XE MÁY MỚI</a>
                </li>
                <li role="presentation">
                    <a href="#Section4" aria-controls="update" role="tab" data-toggle="tab">CẬP NHẬT XE MÁY</a>
                </li>
            </ul>
            <!-- Nội dung tab -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="Section1" style="opacity: 1 !important; display: block;">
                    <!-- Nội dung phần tab Display All Motorbikes -->
                    <div class="container-fluid">
                        <div class="m-auto row tableview">
                            <div class="col-12">
                                <table class="table table-image" id="motorTable">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col" class="text-center">Hình Ảnh</th>
                                            <th scope="col">Mẫu</th>
                                            <th scope="col">Phân Khối</th>
                                            <th scope="col">Thông Tin Mô Tả</th>
                                            <th scope="col" class="text-center">Tuổi</th>
                                            <th scope="col">Hãng</th>
                                            <th scope="col">Loại Xe</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col" class="text-center">Chi Tiết</th>
                                            <th scope="col" class="text-center">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table-body">
                                    <c:forEach items="${listM}" var="m">
                                            <tr>
                                                <th scope="row">${m.motorcycleId}</th>
                                                <td class="text-center">
                                                    <img src="${empty m.image ? 'images/default.jpg' : (m.image.startsWith('http') ? m.image : 'images/'.concat(m.image))}"
                                                         class="img-fluid img-thumbnail" alt="motor">
                                                </td>
                                                <td><div style="font-weight: 600;">${m.model}</div></td>
                                                <td>${m.displacement}</td>
                                                <td><div class="desc-text" title="${m.description}">${m.description}</div></td>
                                                <td class="text-center">${m.minAge}+</td>
                                                <td>
                                                    <c:forEach items="${listB}" var="b">
                                                        <c:if test="${m.brandID == b.brandID}">
                                                            ${b.brandName}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <c:forEach items="${listC}" var="c">
                                                        <c:if test="${m.categoryID == c.categoryID}">
                                                            ${c.categoryName}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <c:forEach items="${listP}" var="p">
                                                        <c:if test="${m.priceListID == p.priceListId}">
                                                            ${p.dailyPriceForDay}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-gold" id="launchModalBtn"
                                                            data-toggle="modal" data-target="#user-form-modal" onclick="OneClick(this)"
                                                            data-motorcycleId="${m.motorcycleId}" 
                                                            data-motorcycleName="${m.model}"
                                                            data-license="<c:forEach items="${m.listMotorcycleDetails}" var="listmd">${listmd.licensePlate},</c:forEach>">                                        
                                                            <span class="bold">Chi Tiết</span>
                                                    </button>
                                                </td>
                                                <td class="action-buttons">
                                                    <div class="buttons">
                                                        <button class="btn btn-dark-custom btn-sm" onclick="editMotorcycle('${m.motorcycleId}', '${m.model}', '${m.image}', '${m.displacement}', '${m.description}', '${m.minAge}', '${m.brandID}', '${m.categoryID}', '${m.priceListID}')">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-danger-custom btn-sm" onclick="confirmDelete('${m.motorcycleId}')">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="Section2" style="opacity: 1 !important;">
                    <!-- Nội dung phần tab Add New Motorbike -->
                    <section>
                        <div class="container-fluid">
                            <div class="row ">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="addnew">
                                                <form class="addnew-motorbike-form" method="post" action="addMotorbike" enctype="multipart/form-data">
                                                    <h3>THÊM MẪU XE MỚI</h3>
                                                    <div class="form-group">
                                                        <label>Ảnh mẫu xe</label>
                                                        <input type="file" class="form-control-file" id="motorbikeImage" name="image">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Mã dòng xe (ID)</label>
                                                        <input type="text" class="form-control" placeholder="Ví dụ: M00022" name="id">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Tên mẫu xe</label>
                                                        <input type="text" class="form-control" placeholder="Ví dụ: Honda Vision 2023" name="model">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Phân khối động cơ</label>
                                                        <input type="text" class="form-control" list="displacementOptions"
                                                               placeholder="Ví dụ: 110cc, 150cc, hoặc 50 kW (xe điện)..." name="displacement">
                                                        <datalist id="displacementOptions">
                                                            <option value="50cc">
                                                            <option value="110cc">
                                                            <option value="125cc">
                                                            <option value="150cc">
                                                            <option value="160cc">
                                                            <option value="300cc">
                                                            <option value="1000W">
                                                            <option value="1200W">
                                                            <option value="3000W">
                                                        </datalist>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Thông tin mô tả</label>
                                                        <textarea class="form-control" rows="3"
                                                                  placeholder="Mô tả các ưu điểm, tính năng của xe..." name="description"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Độ tuổi tối thiểu (Min Age)</label>
                                                        <input type="number" class="form-control" list="ageOptions" placeholder="Ví dụ: 16 hoặc 18" name="minAge">
                                                        <datalist id="ageOptions">
                                                            <option value="16">
                                                            <option value="18">
                                                            <option value="21">
                                                        </datalist>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Hãng xe</label>
                                                        <select class="form-control" id="bid" name="brandID">
                                                            <c:forEach items="${listB}" var="b" varStatus="loop">
                                                                <option value="${b.brandID}">${b.brandName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Loại xe</label>
                                                        <select class="form-control" id="cid" name="categoryID">
                                                            <c:forEach items="${listC}" var="c" varStatus="loop">
                                                                <option value="${c.categoryID}">${c.categoryName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Bảng giá thuê</label>
                                                        <select class="form-control" id="pid" name="priceListID">
                                                            <c:forEach items="${listP}" var="p" varStatus="loop">
                                                                <option value="${p.priceListId}">Ngày: ${p.dailyPriceForDay}k - Tuần: ${p.dailyPriceForWeek}k - Tháng: ${p.dailyPriceForMonth}k</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <button type="submit" class="btn btn-dark" style="background-color: #1a1816; border-color: #d4af37; color: #d4af37; font-weight: bold;">THÊM MẪU XE</button>
                                                    <div class="feedback mt-3">
                                                        <div id="success-message" class="alert alert-success" style="display: none;">
                                                            Motorbike added successfully!
                                                        </div>
                                                        <div id="error-message" class="alert alert-danger" style="display: none;">
                                                            File Format Not Supported
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <!-- Nội dung của Section 3 -->
                <div role="tabpanel" class="tab-pane fade" id="Section3">
                    <!-- Nội dung phần tab Add New Motorbike -->
                    <section>
                        <div class="container-fluid">
                            <div class="row ">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="addnew">
                                                <!-- <form class="addnew-motorbike-form" method="post" action="addMotorDetail">-->
                                                <h3>THÊM XE MÁY MỚI</h3>
                                                <div class="form-group">
                                                    <label>Mẫu xe</label>
                                                    <select class="form-control" id="model" name="model">
                                                        <c:forEach items="${listM}" var="m" varStatus="loop">
                                                            <option value="${m.motorcycleId}">${m.model}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Biển số xe</label>
                                                    <input type="text" class="form-control" placeholder="Ví dụ: 29A1-12345" name="licensePlate" id="licensePlate">
                                                </div>
                                                <div style="color: red;" id="msg"></div> <br>
                                                <button type="submit" class="btn btn-dark" onclick="addMotorbikeDetail()">Thêm xe máy</button>
                                                <div class="feedback mt-3">
                                                    <div id="success-message" class="alert alert-success" style="display: none;">
                                                        Motorbike added successfully!
                                                    </div>
                                                    <div id="error-message" class="alert alert-danger" style="display: none;">
                                                        File Format Not Supported
                                                    </div>

                                                </div>
                                                <!--                                                </form>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <!-- Nội dung của Section 4 -->
                <div role="tabpanel" class="tab-pane fade" id="Section4">
                    <section>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="addnew">
                                                <form class="" id="" action="updateMotorcycle" method="post" enctype="multipart/form-data">
                                                    <h3>CẬP NHẬT THÔNG TIN XE MÁY</h3>
                                                    <div class="form-group">
                                                        <label>Ảnh mẫu xe</label>
                                                        <div id="editMotorbikeImagePreview"></div>
                                                        <input type="file" class="form-control-file" id="motorbikeImage" name="image">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Mã dòng xe (ID)</label>
                                                        <input type="text" class="form-control" id="id" placeholder="Ví dụ: M00022" name="id" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Tên mẫu xe</label>
                                                        <input type="text" class="form-control" id="modelName" placeholder="Ví dụ: Honda Vision 2023" name="modelName">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Phân khối động cơ</label>
                                                        <input type="text" class="form-control" id="displacement" list="displacementOptions" placeholder="Ví dụ: 110cc, 150cc..." name="displacement">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Thông tin mô tả</label>
                                                        <textarea class="form-control" rows="3" id="description" placeholder="Mô tả ưu điểm..." name="description"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Độ tuổi tối thiểu</label>
                                                        <input type="number" class="form-control" id="minAge" list="ageOptions" placeholder="Ví dụ: 18" name="minAge">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Hãng xe</label>
                                                        <select class="form-control" id="bid" name="brandID">
                                                            <c:forEach items="${listB}" var="b" varStatus="loop">
                                                                <option value="${b.brandID}">${b.brandName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Loại xe</label>
                                                        <select class="form-control" id="cid" name="categoryID">
                                                            <c:forEach items="${listC}" var="c" varStatus="loop">
                                                                <option value="${c.categoryID}">${c.categoryName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Bảng giá thuê</label>
                                                        <select class="form-control" id="pid" name="priceListID">
                                                            <c:forEach items="${listP}" var="p" varStatus="loop">
                                                                <option value="${p.priceListId}">Ngày: ${p.dailyPriceForDay}k - Tuần: ${p.dailyPriceForWeek}k - Tháng: ${p.dailyPriceForMonth}k</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <button type="submit" class="btn btn-dark">Cập nhật xe máy</button>

                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                    <div class="modal-dialog modal-lg" role="document">
                        <div style="margin: 11rem;" class="modal-content" >
                            <div style="padding: 10px 16px;" class="modal-header">
                                <h5 class="modal-title">Thông tin chi tiết</h5>
                                <button style="border: 1px solid #000" onclick="closeDetail()" type="button" class="btn close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div style="padding-top: 0px" class="info modal-body">
                                <div class="container-fluid">
                                    <div class="row">                                       
                                        <div class="col-md-8">
                                            <div class="row" style="padding-left: 20px;">
                                                <div class="col-md-12 mb-4">
                                                    <label>ID: </label>
                                                    <p style="display: inline;" id="modal-motorcycleID"></p>
                                                </div>
                                                <div class="col-md-12 mb-4">
                                                    <label>Mẫu: </label>
                                                    <p style="display: inline;" id="modal-motorcycleName"></p>
                                                </div>
                                                <div class="col-md-12 mb-4" style="display: flex;">
                                                    <label>Biển số xe: </label>
                                                    <div style="display: inline;" id="modal-license"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <script type="text/javascript">
            // Sử dụng fetch để tải sidebar2.jsp
//            fetch('includes/sidebar.jsp')
//            .then(response => response.text())
//            .then(data => {
//                const sidebar = document.createElement('div');
//                const shadow = sidebar.attachShadow({ mode: 'open' });
//                shadow.innerHTML = data;
//                document.getElementById('sidebar').appendChild(sidebar);
//            })
//            .catch(error => console.error('Error loading sidebar:', error));
            function editMotorcycle(id, model, image, displacement, description, minAge, bid, cid, pid) {
                document.getElementById('id').value = id;
                document.getElementById('modelName').value = model;
                document.getElementById('displacement').value = displacement;
                document.getElementById('description').value = description;
                document.getElementById('minAge').value = minAge;
                document.getElementById('bid').value = bid;
                document.getElementById('cid').value = cid;
                document.getElementById('pid').value = pid;

                var imgContainer = document.getElementById('editMotorbikeImagePreview');
                imgContainer.innerHTML = ''; // Xóa hình ảnh cũ (nếu có)
                console.log("thinh");
                // Hiển thị hình ảnh đối tượng
                if (image) {
                    console.log("hihihi");
                    var img = document.createElement('img');
                    img.src = image;
                    img.alt = 'Motorbike Image';
                    img.className = 'img-fluid img-thumbnail';
                    imgContainer.appendChild(img);
                } else {
                    imgContainer.innerHTML = 'No image available';
                }

                // Chuyển sang tab Section 4 (nếu cần thiết)
                $('a[href="#Section4"]').tab('show');

            }
            function confirmDelete(motorcycleId) {
                Swal.fire({
                    title: 'Bạn có chắc chắn?',
                    text: "Bạn sẽ không thể khôi phục hành động này!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#1089FF',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Vâng, xóa nó!',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'motorManage?motorcycleId=' + motorcycleId;
                    }
                });
            }

            function addMotorbikeDetail() {
                const motorcycleId = document.getElementById('model').value;
                const licensePlate = document.getElementById('licensePlate').value;
                var data = {
                    motorcycleId: motorcycleId,
                    licensePlate: licensePlate
                };
                $.ajax({
                    type: "POST",
                    url: "addMotorDetail", // Thay đổi URL tới servlet của bạn
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    success: function (response) {
                        // Nếu thành công, hiển thị thông báo thành công
                        document.getElementById('msg').style.color = 'green';
                        document.getElementById('msg').textContent = "Đã nhập dữ liệu thành công!";
                        window.location.href = 'motorManage';
                    },
                    error: function (xhr, status, error) {
                        document.getElementById('msg').style.color = 'red';
                        document.getElementById('msg').textContent = xhr.responseText || "Biển số xe đã có! Vui lòng nhập lại!";
                    }
                });
            }
            function OneClick(button) {
                var modal = $('#user-form-modal');
                modal.find('#modal-motorcycleID').text(button.getAttribute('data-motorcycleId'));
                modal.find('#modal-motorcycleName').text(button.getAttribute('data-motorcycleName'));
                modal.find('#modal-license').text(button.getAttribute('data-license'));


                const licenseData = button.getAttribute('data-license');

                // Đảm bảo licenseData là một chuỗi, nếu null thì gán giá trị mặc định là ''
                //licenseData = licenseData.trim() || '';
                var newData = licenseData.toString().trim();
                //alert(newData);
                // Chuyển đổi ký tự đặc biệt '|' thành ký tự xuống dòng hoặc thẻ <br> nếu cần thiết
                const licenseArray = newData.split(',');
                // Gán lại dữ liệu đã định dạng vào thuộc tính của nút (nếu cần thiết)
                //button.setAttribute('data-license', licenseArray.join(','));

                // Hiển thị dữ liệu đã định dạng (ví dụ, trong console hoặc một phần tử HTML khác)
                console.log(licenseArray); // Hiển thị mảng trong console

                // Nếu bạn muốn hiển thị từng phần tử trong một phần tử HTML khác:
                const licenseDisplayElement = document.getElementById('modal-license');
                if (licenseDisplayElement) {
                    // Xóa nội dung cũ của phần tử
                    licenseDisplayElement.innerHTML = '';

                    // Duyệt qua mảng và hiển thị từng phần tử
                    for (let i = 0; i < licenseArray.length; i++) {
                        const item = licenseArray[i].trim();
                        const p = document.createElement('p'); // Tạo một phần tử <p>
                        p.innerHTML = item; // Gán nội dung của phần tử
                        p.style.marginLeft = '5px';
                        p.style.textAlign = 'left';
                        licenseDisplayElement.appendChild(p); // Thêm phần tử vào phần tử hiển thị
                    }
                }
            }
             function editMotorcycle(id, model, image, displacement, description, minAge, bid, cid, pid) {
                                        document.getElementById('id').value = id;
                                        document.getElementById('model').value = model;
                                        document.getElementById('displacement').value = displacement;
                                        document.getElementById('description').value = description;
                                        document.getElementById('minAge').value = minAge;
                                        document.getElementById('bid').value = bid;
                                        document.getElementById('cid').value = cid;
                                        document.getElementById('pid').value = pid;

                                        var imgContainer = document.getElementById('editMotorbikeImagePreview');
                                        imgContainer.innerHTML = ''; // Xóa hình ảnh cũ (nếu có)
                                        console.log("thinh");
                                        // Hiển thị hình ảnh đối tượng
                                        if (image) {
                                            console.log("hihihi");
                                            var img = document.createElement('img');
                                            img.src = image;
                                            img.alt = 'Motorbike Image';
                                            img.className = 'img-fluid img-thumbnail';
                                            imgContainer.appendChild(img);
                                        } else {
                                            imgContainer.innerHTML = 'No image available';
                                        }

                                        // Chuyển sang tab Section 4 (nếu cần thiết)
                                        $('a[href="#Section4"]').tab('show');
                                        
                                     }
        </script>
        <!-- Tải thư viện JS theo đúng thứ tự (jQuery -> Bootstrap -> DataTables -> Plugin khác) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/showMoreItems.min.js"></script>
        <script src="js/main.js"></script>

        <script>
            $(document).ready(function() {
                // Ép buộc các tab hoạt động (khắc phục lỗi xung đột Bootstrap 3 vs 4)
                $('.nav-tabs a').on('click', function (e) {
                    e.preventDefault();
                    $(this).tab('show');
                    // Buộc hiển thị thẻ div tương ứng để chống lỗi tàng hình
                    $('.tab-pane').hide();
                    $($(this).attr('href')).show();
                });

                // Khởi tạo DataTables
                $('#motorTable').DataTable({
                    "pageLength": 10,
                    "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "Tất cả"]],
                    "language": {
                        "lengthMenu": "Hiển thị _MENU_ xe mỗi trang",
                        "zeroRecords": "Không tìm thấy xe nào",
                        "info": "Trang _PAGE_ / _PAGES_",
                        "infoEmpty": "Không có dữ liệu",
                        "infoFiltered": "(lọc từ _MAX_ xe)",
                        "search": "Tìm kiếm:",
                        "paginate": {
                            "first": "Đầu",
                            "last": "Cuối",
                            "next": "Sau",
                            "previous": "Trước"
                        }
                    }
                });
            });
        </script>
    </body>
</html>

