<%-- 
    Document   : viewFeedback
    Created on : Jun 20, 2024, 2:54:16 PM
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
                font-family: 'Montserrat', sans-serif;
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
                                                          data-toggle="tab">Danh Sách Đánh Giá</a></li>

            </ul>
            <!-- Nội dung tab -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                    <!-- Nội dung phần tab Display All Motorbikes -->
                    <div class="container-fluid">
                        <div class="row tableview">
                            <div class="col-12">
                                <div class="buttons" style="display: flex; justify-content: right;">
                                    <select class="form-control" style="width: 200px;" onchange="sortTable(this.value)">
                                        <option value="">Sắp xếp theo sao</option>
                                        <option value="asc">Tăng dần</option>
                                        <option value="desc">Giảm dần</option>
                                    </select>
                                    <select class="form-control" style="width: 200px; margin-left: 10px;" onchange="filterTable(this.value)">
                                        <option value="">Lọc theo sao</option>
                                        <option value="5">5 sao</option>
                                        <option value="4">4 sao</option>
                                        <option value="3">3 sao</option>
                                        <option value="2">2 sao</option>
                                        <option value="1">1 sao</option>
                                    </select>
                                </div>
                                <table class="table table-image" id="feedbackTable">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Nội Dung</th>
                                            <th scope="col" style="padding: 6px 50px;">Đánh Giá</th>
                                            <th scope="col">Tên Khách Hàng</th>

                                        </tr>
                                    </thead>
                                    <c:forEach items="${listF}" var="f">
                                        <tbody id="table-body">
                                            <tr>
                                                <th scope="row">${f.feedbackID}</th>                                                                                           
                                                <td>${f.content}</td>
                                                <td>
                                                    <c:forEach begin="1" end="${f.serviceRate}" var="star">
                                                        <span style="color: #F7D000;" class="fa fa-star"></span>
                                                    </c:forEach>
                                                    <c:forEach begin="${f.serviceRate + 1}" end="5" var="emptyStar">
                                                        <span class="fa fa-star-o"></span>
                                                    </c:forEach>
                                                    <span class="hidden-rate" style="display: none;">${f.serviceRate}</span>
                                                </td>   

                                                <td>${f.customerName}</td>


                                            </tr>

                                        </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                            <div class="" style="display: flex; justify-content: right;">
                                <p class="" id="feedbackCount" >Tổng cộng: ${quantity} feedbacks</p>                               
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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

            function sortTable(order) {
                if (!order)
                    return;
                var table = document.getElementById("feedbackTable");
                var rows = Array.from(table.rows).slice(1); // Get all rows except the header

                rows.sort(function (a, b) {
                    var rateA = parseInt(a.querySelector('.hidden-rate').innerText);
                    var rateB = parseInt(b.querySelector('.hidden-rate').innerText);
                    return order === 'asc' ? rateA - rateB : rateB - rateA;
                });

                rows.forEach(function (row) {
                    table.appendChild(row); // Reattach rows in sorted order
                });
            }

            function filterTable(stars) {
            var table = document.getElementById("feedbackTable");
            var rows = Array.from(table.rows).slice(1);
            var visibleCount = 0;

            rows.forEach(function(row) {
                var rate = parseInt(row.querySelector('.hidden-rate').innerText);
                if (stars === "" || rate == stars) {
                    row.style.display = "";
                    visibleCount++;
                } else {
                    row.style.display = "none";
                }
            });

            document.getElementById("feedbackCount").innerText = "Tổng cộng: " + visibleCount + " feedbacks";
        }
        </script>


        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--         Bootstrap js 
                <script type="text/javascript" src="js/jquery.js"></script>
                <script type="text/javascript" src="js/popper.js"></script>
                 OWL Car 
                <script src="js/owl.carousel.min.js"></script>
                 Show More js 
                <script src="js/showMoreItems.min.js"></script>
                 Data TAble 
                <script
                src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
                 Bootstrap 
                <script type="text/javascript" src="js/bootstrap.min.js"></script>
                 Theme js 
                <script type="text/javascript" src="js/main.js"></script>-->
    </body>

</html>
