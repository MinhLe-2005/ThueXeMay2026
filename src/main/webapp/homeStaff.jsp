 <%-- 
    Document   : staff2
    Created on : Jun 29, 2024, 1:25:34 PM
    Author     : DiepTCNN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Dashboard - SmartRide</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <!--        <link href="staffAssets/img/favicon.png" rel="icon">
                <link href="staffAssets/img/apple-touch-icon.png" rel="apple-touch-icon">-->
        <link rel="website icon" type="png" href="images/logo.png">

        <!-- Google Fonts -->
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        </style>

        <!-- Vendor CSS Files -->
        <link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="staffAssets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="staffAssets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="staffAssets/vendor/simple-datatables/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Template Main CSS File -->
        <link href="staffAssets/css/style.css" rel="stylesheet">
    </head>
    <body>

        <jsp:include page="/includes/staff/header-staff.jsp" />
        <!--       sidebar-->
        <jsp:include page="/includes/staff/sidebar.jsp" />

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>Thống Kê</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="homeStaff.jsp">Trang Chủ</a></li>
                        <li class="breadcrumb-item active">Thống Kê</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section dashboard">
                <div class="row">

                    <!-- Left side columns -->
                    <div class="col-lg-8">
                        <div class="row">

                            <!-- Sales Card -->
                            <div class="col-xxl-4 col-md-6">
                                <div class="card info-card sales-card">

                                    <div class="filter">
                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i
                                                class="bi bi-three-dots"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                            <li class="dropdown-header text-start">
                                                <h6>Thời gian</h6>
                                            </li>

                                            <li><a class="dropdown-item" href="#">Ngày</a></li>
                                            <li><a class="dropdown-item" href="#">Tháng</a></li>
                                            <li><a class="dropdown-item" href="#">Năm</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title">Đơn Hàng</h5>

                                        <div class="d-flex align-items-center">
                                            <div
                                                class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-cart"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6>145</h6>
                                                <span class="text-success small pt-1 fw-bold">12%</span> <span
                                                    class="text-muted small pt-2 ps-1">Tăng</span>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div><!-- End Sales Card -->

                            <!-- Revenue Card -->
                            <div class="col-xxl-4 col-md-6">
                                <div class="card info-card revenue-card">

                                    <div class="filter">
                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i
                                                class="bi bi-three-dots"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                            <li class="dropdown-header text-start">
                                                <h6>Thời Gian</h6>
                                            </li>

                                            <li><a class="dropdown-item" href="#">Ngày</a></li>
                                            <li><a class="dropdown-item" href="#">Tháng</a></li>
                                            <li><a class="dropdown-item" href="#">Năm</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title">Doanh Thu</h5>

                                        <div class="d-flex align-items-center">
                                            <div
                                                class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-currency-dollar"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6>$3,264</h6>
                                                <span class="text-success small pt-1 fw-bold">8%</span> <span
                                                    class="text-muted small pt-2 ps-1">Tăng</span>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div><!-- End Revenue Card -->

                            <!-- Customers Card -->
                            <div class="col-xxl-4 col-xl-12">

                                <div class="card info-card customers-card">

                                    <div class="filter">
                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i
                                                class="bi bi-three-dots"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                            <li class="dropdown-header text-start">
                                                <h6>Thời gian</h6>
                                            </li>

                                            <li><a class="dropdown-item" href="#">Ngày</a></li>
                                            <li><a class="dropdown-item" href="#">Tháng</a></li>
                                            <li><a class="dropdown-item" href="#">Năm</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title">Khách Hàng</h5>

                                        <div class="d-flex align-items-center">
                                            <div
                                                class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-people"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6>1244</h6>
                                                <span class="text-success small pt-1 fw-bold">28%</span> <span
                                                    class="text-muted small pt-2 ps-1">Tăng</span>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div><!-- End Customers Card -->

                            <!-- Reports -->
                            <div class="col-12">
                                <div class="card">

                                    <div class="filter">
                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i
                                                class="bi bi-three-dots"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                            <li class="dropdown-header text-start">
                                                <h6>Bộ lọc</h6>
                                            </li>

                                            <li><a class="dropdown-item" href="#">Hôm nay</a></li>
                                            <li><a class="dropdown-item" href="#">Tháng này</a></li>
                                            <li><a class="dropdown-item" href="#">Năm nay</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title">Báo Cáo <span>/Ngày</span></h5>

                                        <!-- Line Chart -->
                                        <div id="reportsChart"></div>

                                        <script>
                                            document.addEventListener("DOMContentLoaded", () => {
                                                new ApexCharts(document.querySelector("#reportsChart"), {
                                                    series: [{
                                                            name: 'Đơn Hàng',
                                                            data: [31, 40, 28, 51, 42, 82, 56],
                                                        }
                                                        , {
                                                            name: 'Doanh Thu',
                                                            data: [11, 32, 45, 32, 34, 52, 41]
                                                        }
                                                        , {
                                                            name: 'Khách Hàng',
                                                            data: [15, 11, 32, 18, 9, 24, 11]
                                                        }
                                                    ],
                                                    chart: {
                                                        height: 350,
                                                        type: 'area',
                                                        toolbar: {
                                                            show: false
                                                        }
                                                        ,
                                                    }
                                                    ,
                                                    markers: {
                                                        size: 4
                                                    }
                                                    ,
                                                    colors: ['#4154f1', '#2eca6a', '#ff771d'],
                                                    fill: {
                                                        type: "gradient",
                                                        gradient: {
                                                            shadeIntensity: 1,
                                                            opacityFrom: 0.3,
                                                            opacityTo: 0.4,
                                                            stops: [0, 90, 100]
                                                        }
                                                    }
                                                    ,
                                                    dataLabels: {
                                                        enabled: false
                                                    }
                                                    ,
                                                    stroke: {
                                                        curve: 'smooth',
                                                        width: 2
                                                    }
                                                    ,
                                                    xaxis: {
                                                        type: 'datetime',
                                                        categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
                                                    }
                                                    ,
                                                    tooltip: {
                                                        x: {
                                                            format: 'dd/MM/yy HH:mm'
                                                        }
                                                        ,
                                                    }
                                                }
                                                ).render();
                                            }
                                            );
                                        </script>
                                        <!-- End Line Chart -->

                                    </div>

                                </div>
                            </div><!-- End Reports -->



                            <!-- Top Selling -->
                            <div class="col-12">
                                <div class="card top-selling overflow-auto">

                                    <div class="filter">
                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i
                                                class="bi bi-three-dots"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                            <li class="dropdown-header text-start">
                                                <h6>Bộ lọc</h6>
                                            </li>

                                            <li><a class="dropdown-item" href="#">Hôm nay</a></li>
                                            <li><a class="dropdown-item" href="#">Tháng này</a></li>
                                            <li><a class="dropdown-item" href="#">Năm nay</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body pb-0">
                                        <h5 class="card-title">Top Sản Phẩm </h5>

                                        <table class="table table-borderless">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Xe Máy</th>
                                                    <th scope="col">Mẫu</th>
                                                    <th scope="col">Giá Theo Ngày</th>
                                                    <th scope="col">Giá Theo Tuần</th>
                                                    <th scope="col">Giá Theo Tháng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listM}" var="m">
                                                    <tr>
                                                        <th scope="row"><a href="#"><img src="${empty m.image ? 'images/default.jpg' : (m.image.startsWith('http') ? m.image : 'images/'.concat(m.image))}" alt=""></a></th>
                                                        <td>
                                                            <a href="#" class="text-primary fw-bold">${m.model}</a>
                                                        </td>
                                                        <c:forEach items="${sessionScope.listP}" var="p">
                                                            <c:if test="${m.priceListID == p.priceListId}">
                                                                <td><fmt:formatNumber value="${p.dailyPriceForDay * 1000}" type="currency" currencySymbol="VNĐ" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0" /></td>
                                                                <td><fmt:formatNumber value="${p.dailyPriceForWeek * 1000}" type="currency" currencySymbol="VNĐ" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0" /></td>
                                                                <td><fmt:formatNumber value="${p.dailyPriceForMonth * 1000}" type="currency" currencySymbol="VNĐ" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0" /></td>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div><!-- End Top Selling -->

                        </div>
                    </div><!-- End Left side columns -->

                    <!-- Right side columns -->
                    <div class="col-lg-4">



                        <!-- Budget Report -->
                        <div class="card">
                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Bộ lọc</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Hôm nay</a></li>
                                    <li><a class="dropdown-item" href="#">Tháng này</a></li>
                                    <li><a class="dropdown-item" href="#">Năm nay</a></li>
                                </ul>
                            </div>

                            <div class="card-body pb-0">
                                <h5 class="card-title">Thống Kê Doanh Thu Theo Hãng </h5>

                                <div id="budgetChart" style="min-height: 400px;" class="echart"></div>

                                <script>
                                    document.addEventListener("DOMContentLoaded", () => {
                                        
                                        var brandData = '${brandData}'; 

                                        // Parse the JSON string to a JavaScript object
                                        var brandMap = JSON.parse(brandData);
//
//                                        console.log(categoryMap);
//                                        // Use the data in your JavaScript code
//                                        for (let key in categoryMap) {
//                                            console.log("Motorcycle: " +  key +"," + "Quantity: " + categoryMap[key]);
//                                        }
                                        var chartData = [{
                                            value: Object.values(brandMap),
                                            name: 'Theo Tuần'
                                        }];
                                        
                                        console.log(chartData);
                                        
                                        var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                                            legend: {
                                                data: ['Theo Tuần', 'Theo Tháng']
                                            }
                                            ,
                                            radar: {
                                                // shape: 'circle',
                                                indicator: [{
                                                        name: 'Yamaha',
                                                        max: 1500
                                                    }
                                                    ,
                                                    {
                                                        name: 'Honda',
                                                        max: 800
                                                    }
                                                    ,
                                                    {
                                                        name: 'Suzuki',
                                                        max: 1000
                                                    }
                                                    ,
                                                    {
                                                        name: 'Sym',
                                                        max: 1500
                                                    }
                                                    ,
                                                    {
                                                        name: 'Piaggio',
                                                        max: 800
                                                    }
                                                    ,
                                                    {
                                                        name: 'Vinfast',
                                                        max: 3500
                                                    }
                                                ]
                                            }
                                            ,
                                            series: [{
                                                    name: 'Budget vs spending',
                                                    type: 'radar',
                                                    data: chartData
//                                                    [{
//                                                            value: [6500, 3000, 20000, 35000, 50000, 25000],
//                                                            name: 'Theo Tuần'
//                                                        }
//                                                        ,
//                                                        {
//                                                            value: [5000, 14000, 28000, 26000, 42000, 21000],
//                                                            name: 'Theo Tháng'
//                                                        }
//                                                    ]
                                                }
                                            ]
                                        }
                                        );
                                    }
                                    );
                                </script>

                            </div>
                        </div><!-- End Budget Report -->

                        <!-- Website Traffic -->
                        <div class="card">
                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Bộ lọc</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Hôm nay</a></li>
                                    <li><a class="dropdown-item" href="#">Tháng này</a></li>
                                    <li><a class="dropdown-item" href="#">Năm nay</a></li>
                                </ul>
                            </div>

                            <div class="card-body pb-0">
                                <h5 class="card-title">Thống Kê Số Lượng Xe Được Thuê</h5>

                                <div id="trafficChart" style="min-height: 400px;" class="echart"></div>

                                <script>
                                    document.addEventListener("DOMContentLoaded", () => {
                                         // Retrieve the JSON string from the request attribute
                                        var categoryData = '${categoryData}'; 

                                        // Parse the JSON string to a JavaScript object
                                        var categoryMap = JSON.parse(categoryData);
//
//                                        console.log(categoryMap);
//                                        // Use the data in your JavaScript code
//                                        for (let key in categoryMap) {
//                                            console.log("Motorcycle: " +  key +"," + "Quantity: " + categoryMap[key]);
//                                        }
                                        var chartData = Object.keys(categoryMap).map(function(key) {                                           
                                            return {
                                                value: categoryMap[key],
                                                name: key
                                            };
                                        });
                                        echarts.init(document.querySelector("#trafficChart")).setOption({
                                            tooltip: {
                                                trigger: 'item'
                                            }
                                            ,
                                            legend: {
                                                top: '5%',
                                                left: 'center'
                                            }
                                            ,
                                            series: [{
                                                    name: 'Loại Xe Máy',
                                                    type: 'pie',
                                                    radius: ['40%', '70%'],
                                                    avoidLabelOverlap: false,
                                                    label: {
                                                        show: false,
                                                        position: 'center'
                                                    }
                                                    ,
                                                    emphasis: {
                                                        label: {
                                                            show: true,
                                                            fontSize: '18',
                                                            fontWeight: 'bold'
                                                        }
                                                    }
                                                    ,
                                                    labelLine: {
                                                        show: false
                                                    }
                                                    ,
                                                    data: chartData
                                                }
                                            ]
                                        }
                                        );
                                    }
                                    );
                                </script>

                            </div>
                        </div><!-- End Website Traffic -->


                    </div><!-- End Right side columns -->

                </div>
            </section>

        </main><!-- End #main -->



        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="staffAssets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="staffAssets/vendor/chart.js/chart.umd.js"></script>
        <script src="staffAssets/vendor/echarts/echarts.min.js"></script>
        <script src="staffAssets/vendor/quill/quill.js"></script>
        <script src="staffAssets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="staffAssets/vendor/tinymce/tinymce.min.js"></script>
        <script src="staffAssets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="staffAssets/js/main.js"></script>

    </body>

</html>
