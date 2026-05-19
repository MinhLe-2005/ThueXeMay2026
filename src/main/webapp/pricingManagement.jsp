<%-- 
    Document   : pricingManagement
    Created on : Jun 20, 2024, 8:28:02 PM
    Author     : DiepTCNN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vertical Tabs with Right Navigation</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap"
            rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- OWL Car -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <!-- Showmore css -->
        <link rel="stylesheet" href="css/showMoreItems-theme.min.css">
        <!-- Data Table -->
        <link rel="stylesheet"
              href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">

        <link rel="stylesheet"
              href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <style>
            body,
            html {
                height: 100%;
                margin: 0;
                font-family: 'Tahoma', sans-serif;
            }

            .tab-container {
                display: flex;
                flex-direction: column;
                height: 100vh;
                margin-top: 60px;
            }

            /* Nội dung tab */
            .tab-content {
                flex: 1;
                padding: 20px;
                overflow-y: auto;
                margin-left: 35px;
                /*background: rgba(30, 151, 191, 0.1);*/
            }

            .tab-content h3 {
                color: #1e97bf;
                font-size: 20px;
                font-weight: 700;
                text-transform: uppercase;
                margin: 0 0 7px;
            }

            /* Danh sách tab ngang */
            .nav-tabs {
                display: flex;
                margin-top: 0; /* Xóa khoảng trống phía trên */
                padding-left: 50px;
                margin-left: 3%;
                border-bottom: 2px solid #ddd;

            }


            .nav-tabs li {
                margin-right: 10px;
            }

            .nav-tabs li a {
                color: #222;
                background: transparent;
                font-size: 17px;
                font-weight: 800;
                letter-spacing: 1px;
                text-align: center;
                text-transform: uppercase;
                padding: 12px 15px;
                margin: 0;
                border: none;
                border-radius: 4px;
                transition: all 0.3s ease;
            }

            .nav-tabs li a:hover,
            .nav-tabs li.active a {
                color: #1e97bf;
                background: rgba(30, 151, 191, 0.1);
                border-block-end: solid;
                writing-mode: horizontal-tb;
            }

            /* Thiết kế phản hồi cho màn hình nhỏ */
            @media only screen and (max-width: 767px) {
                .nav-tabs {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .nav-tabs li {
                    margin-right: 0;
                    margin-bottom: 10px;
                }

                .tab-content {
                    padding: 10px;
                }
            }

            .container-fluid {
                padding: 2rem 0;
            }

            .tableview {
                width: 80%;
                margin: 0 auto;
            }

            .table-image {
                border-collapse: separate;
                border-spacing: 0 15px;
            }

            .table-image td,
            .table-image th {
                vertical-align: middle;
                background: #fff;
                border: none;
                padding: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .table thead th {
                border: none;
                background-color: #6E9DC5;
                color: #fff;
                text-align: center;
            }

            .table tbody tr:hover {
                background-color: #f1f1f1;
            }

            .action-buttons .btn {
                margin: 0 5px;
                transition: all 0.3s ease;
            }

            .action-buttons .btn:hover {
                transform: scale(1.1);
            }

            .action-buttons .btn:focus {
                outline: none;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            td input.form-control {
                animation: fadeIn 0.5s;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }

                to {
                    opacity: 1;
                }
            }

            .buttons {
                display: flex;
                justify-content: center;
            }

            .container-fluid {
                background: #E1EDF2;
            }

            .addnew,
            .editmotor {
                margin-left: 15%;
            }
            .alert {
                margin-top: 10px; /* Khoảng cách từng thông báo */
                display: none; /* Ẩn thông báo mặc định */
            }

        </style>
    </head>
    <body>
        <div class="col-md-2">

        </div>
        <div class="container-fluid tab-container">
            <!-- Danh sách tab ngang -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#Section1"
                                                          aria-controls="home" role="tab"
                                                          data-toggle="tab">THÔNG TIN BẢNG GIÁ</a></li>
                <li role="presentation"><a href="#Section2"
                                           aria-controls="profile" role="tab"
                                           data-toggle="tab">THÊM GIÁ MỚI</a></li>
                <li role="presentation">
                    <a href="#Section3" aria-controls="update" role="tab" data-toggle="tab">CẬP NHẬT GIÁ THUÊ XE</a>
                </li>
            </ul>
            <!-- Nội dung tab -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                    <!-- Nội dung phần tab Display All Motorbikes -->
                    <div class="container-fluid">
                        <div class="row tableview">
                            <div class="col-12">
                                <table class="table table-image">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Giá Thuê Theo Ngày</th>
                                            <th scope="col">Giá Thuê Theo Tuần</th>
                                            <th scope="col">Giá Thuê Theo Tháng</th>
                                            <th scope="col">Mẫu Xe</th>
                                            <th scope="col">Hành Động</th>
                                        </tr>
                                    </thead>

                                    <c:forEach items="${listP}" var="p">

                                        <tbody id="table-body">
                                            <tr>
                                                <th scope="row">${p.priceListId}</th>     

                                                <td>${p.dailyPriceForDay}</td>
                                                <td>${p.dailyPriceForWeek}</td>
                                                <td>${p.dailyPriceForMonth}</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary" id="launchModalBtn"
                                                            data-toggle="modal" data-target="#user-form-modal" onclick="OneClick(this)"
                                                            data-motorcycleName="<c:forEach items="${listM}" var="m">
                                                                <c:if test="${p.priceListId == m.priceListID}">
                                                                    ${m.model},
                                                                </c:if>
                                                            </c:forEach>">               
                                                        <span class="bold">Chi Tiết</span>
                                                    </button>

                                                </td>
                                                <td class="action-buttons">
                                                    <div class="buttons">
                                                        <button class="btn btn-primary btn-sm" onclick="populateUpdateForm(${p.priceListId}, ${p.dailyPriceForDay}, ${p.dailyPriceForWeek}, ${p.dailyPriceForMonth})">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-danger btn-sm" onclick="">

                                                            <a style="color: white"><i class="fas fa-trash"></i></a>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Section2">
                    <!-- Nội dung phần tab Add New Motorbike -->
                    <section>
                        <div class="container-fluid">
                            <div class="row ">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="addnew">
                                                <form class="addnew-motorbike-form" method="post" action="addpricing">
                                                    <h3>THÊM GIÁ MỚI</h3>
                                                    <br>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="" name="priceForDay" placeholder="Giá Thuê Theo Ngày" value="" step="0.01" min="0" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="" name="priceForWeek" placeholder="Giá Thuê Theo Tuần" value="" step="0.01" min="0" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="" name="priceForMonth" placeholder="Giá Thuê Theo Tháng" value="" step="0.01" min="0" required>
                                                    </div>
                                                    <button type="submit" class="btn btn-dark">Thêm</button>
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
                    <section>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="addnew">
                                                <form class="edit-location-form" id="" action="updatePricing"  method="post">
                                                    <h3>CẬP NHẬT GIÁ THUÊ XE</h3>
                                                    <br>
                                                    <input type="hidden" class="form-control" id="id" name="id" value="" >
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="priceForDay" value="" name="priceForDay" placeholder="Giá Thuê Theo Ngày" step="0.01" min="0" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="priceForWeek" value="" name="priceForWeek" placeholder="Giá Thuê Theo Tuần" step="0.01" min="0" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="priceForMonth" value="" name="priceForMonth" placeholder="Giá Thuê Theo Tháng" step="0.01" min="0" required>
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
                                                    <label>Mẫu Xe: </label>
                                                    <p style="display: inline;" id="modal-motorcycleName"></p>
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

            function populateUpdateForm(id, priceForDay, priceForWeek, priceForMonth) {
                // Chuyển dữ liệu vào form
                document.getElementById('id').value = id;
                document.getElementById('priceForDay').value = priceForDay;
                document.getElementById('priceForWeek').value = priceForWeek;
                document.getElementById('priceForMonth').value = priceForMonth;

                // Chuyển đến tab Update
                $('.nav-tabs a[href="#Section3"]').tab('show');
            }

            function OneClick(button) {
                var modal = $('#user-form-modal');
               
                modal.find('#modal-motorcycleName').text(button.getAttribute('data-motorcycleName'));

                const modelData = button.getAttribute('data-motorcycleName');

                // Đảm bảo licenseData là một chuỗi, nếu null thì gán giá trị mặc định là ''
                //licenseData = licenseData.trim() || '';
                var newData = modelData.toString().trim();
                //alert(newData);
                // Chuyển đổi ký tự đặc biệt '|' thành ký tự xuống dòng hoặc thẻ <br> nếu cần thiết
                const modelArray = newData.split(',');
                // Gán lại dữ liệu đã định dạng vào thuộc tính của nút (nếu cần thiết)
                //button.setAttribute('data-license', licenseArray.join(','));

                // Hiển thị dữ liệu đã định dạng (ví dụ, trong console hoặc một phần tử HTML khác)
                console.log(modelArray); // Hiển thị mảng trong console

                // Nếu bạn muốn hiển thị từng phần tử trong một phần tử HTML khác:
                const licenseDisplayElement = document.getElementById('modal-motorcycleName');
                if (licenseDisplayElement) {
                    // Xóa nội dung cũ của phần tử
                    licenseDisplayElement.innerHTML = '';

                    // Duyệt qua mảng và hiển thị từng phần tử
                    for (let i = 0; i < modelArray.length; i++) {
                        const item = modelArray[i].trim();
                        const p = document.createElement('p'); // Tạo một phần tử <p>
                        p.innerHTML = item; // Gán nội dung của phần tử
                        p.style.marginLeft = '50px';
                        p.style.textAlign = 'left';
                        licenseDisplayElement.appendChild(p); // Thêm phần tử vào phần tử hiển thị
                    }
                }
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </body>

</html>
