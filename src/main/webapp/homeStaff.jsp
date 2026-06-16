<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Dashboard - Quản lý</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/newlogo_transparent.png">
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <!--        <link href="staffAssets/img/favicon.png" rel="icon">
                <link href="staffAssets/img/apple-touch-icon.png" rel="apple-touch-icon">-->
        <link rel="website icon" type="png" href="images/logo.png">

        <!-- Google Fonts -->
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        
        /* Gold Accent Segmented Control for Period Filtering */
        .global-filter-group {
            background: rgba(192, 157, 98, 0.06);
            border: 1px solid rgba(192, 157, 98, 0.15);
            padding: 4px;
            border-radius: 30px;
            display: inline-flex;
            align-items: center;
            gap: 2px;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.02);
        }
        .global-filter-btn {
            background: transparent !important;
            border: none !important;
            color: #6b7280 !important;
            font-weight: 600 !important;
            font-size: 13px !important;
            padding: 8px 18px !important;
            border-radius: 30px !important;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1) !important;
            outline: none !important;
            box-shadow: none !important;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .global-filter-btn:hover {
            color: #C09D62 !important;
            background: rgba(192, 157, 98, 0.08) !important;
        }
        .global-filter-btn.active {
            background: #C09D62 !important;
            color: #ffffff !important;
            box-shadow: 0 4px 12px rgba(192, 157, 98, 0.25) !important;
        }

        /* Modal Custom Styling */
        #customDateModal .modal-content {
            border-radius: 12px;
            border: 1px solid rgba(192, 157, 98, 0.2);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        #customDateModal .modal-header {
            border-bottom: 1px solid rgba(192, 157, 98, 0.1);
            background: rgba(192, 157, 98, 0.03);
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }
        #customDateModal .modal-title {
            font-family: 'Be Vietnam Pro', sans-serif;
            font-weight: 700;
            color: #1F2937;
        }
        #customDateModal .modal-footer {
            border-top: 1px solid rgba(192, 157, 98, 0.1);
        }
        #customDateModal .form-control:focus {
            border-color: #C09D62;
            box-shadow: 0 0 0 0.2rem rgba(192, 157, 98, 0.15);
        }
        #customDateModal .btn-primary {
            background-color: #C09D62 !important;
            border-color: #C09D62 !important;
            border-radius: 30px;
            padding: 8px 20px;
            font-weight: 600;
            transition: all 0.2s ease;
        }
        #customDateModal .btn-primary:hover {
            background-color: #A6854F !important;
            border-color: #A6854F !important;
            box-shadow: 0 4px 10px rgba(192, 157, 98, 0.2);
        }
        #customDateModal .btn-secondary {
            border-radius: 30px;
            padding: 8px 20px;
        }
        </style>

        <!-- Vendor CSS Files -->
        <link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="staffAssets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="staffAssets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="staffAssets/vendor/simple-datatables/style.css" rel="stylesheet">
        <!-- Template Main CSS File -->
        <link href="staffAssets/css/style.css" rel="stylesheet">
    </head>
    <body>

        <jsp:include page="/includes/staff/header-staff.jsp" />
        <!--       sidebar-->
        <jsp:include page="/includes/staff/sidebar.jsp" />

        <main id="main" class="main">

            <div class="pagetitle d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1>Thống Kê</h1>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="homeStaff.jsp">Trang Chủ</a></li>
                            <li class="breadcrumb-item active">Thống Kê</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-8 text-end">
                    <ul class="nav custom-tabs justify-content-end" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link global-filter-btn" id="pills-today-tab" data-period="today" type="button" role="tab">Hôm nay</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link global-filter-btn active" id="pills-30d-tab" data-period="30days" type="button" role="tab">30 Ngày</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link global-filter-btn" id="pills-90d-tab" data-period="90days" type="button" role="tab">90 Ngày</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link global-filter-btn" id="pills-180d-tab" data-period="180days" type="button" role="tab">180 Ngày</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link global-filter-btn" id="pills-all-tab" data-period="all" type="button" role="tab">Tất cả</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link global-filter-btn" data-period="custom" type="button" data-bs-toggle="modal" data-bs-target="#customDateModal">
                                <i class="bi bi-calendar3 me-1"></i> Tùy chọn...
                            </button>
                        </li>
                    </ul>
                </div>
            </div><!-- End Page Title -->



            <style>
                body, main#main {
                    background-color: #f4f6f9;
                }
                .dashboard .card {
                    border: none;
                    border-radius: 20px;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
                    transition: transform 0.25s ease, box-shadow 0.25s ease;
                    background: #ffffff;
                    margin-bottom: 25px;
                }
                .dashboard .card:hover {
                    transform: translateY(-4px);
                    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.06);
                }
                .dashboard .card-title {
                    font-weight: 700;
                    color: #1a1816;
                    font-family: 'Be Vietnam Pro', sans-serif;
                    padding: 20px 0 15px 0;
                    font-size: 1.05rem;
                }
                .dashboard .info-card {
                    padding-bottom: 5px;
                }
                .dashboard .info-card h6 {
                    font-size: 26px;
                    color: #112a46;
                    font-weight: 800;
                    margin: 0;
                    padding: 0;
                    font-family: 'Be Vietnam Pro', sans-serif;
                    letter-spacing: -0.5px;
                }
                .dashboard .card-icon {
                    font-size: 28px;
                    line-height: 0;
                    width: 56px;
                    height: 56px;
                    flex-shrink: 0;
                    flex-grow: 0;
                    border-radius: 16px !important;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
                .sales-card .card-icon {
                    color: #4154f1;
                    background: #f0f3ff;
                }
                .revenue-card .card-icon {
                    color: #2eca6a;
                    background: #e6f9ed;
                }
                .customers-card .card-icon {
                    color: #ff771d;
                    background: #fff0e6;
                }
                /* Premium Filter Tabs */
                .custom-tabs {
                    background: #eef2f6;
                    border-radius: 50px;
                    padding: 6px;
                    display: inline-flex;
                }
                .custom-tabs .nav-item {
                    margin: 0;
                }
                .custom-tabs .nav-link {
                    border-radius: 50px;
                    color: #6c757d;
                    font-weight: 600;
                    font-size: 0.9rem;
                    padding: 8px 24px;
                    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                    border: none;
                    background: transparent;
                }
                .custom-tabs .nav-link.active {
                    background: #c09d62;
                    color: #fff !important;
                    box-shadow: 0 4px 15px rgba(192, 157, 98, 0.35);
                }
                .custom-tabs .nav-link:hover:not(.active) {
                    background: rgba(192, 157, 98, 0.1);
                    color: #c09d62;
                }
                #top-motorcycles-body td {
                    vertical-align: middle;
                }
            </style>

            <section class="section dashboard">
                <div class="row">
                    <!-- KPI Cards Row -->
                    <div class="col-md-4 mb-4">
                        <div class="card info-card revenue-card h-100 mb-0" style="border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.03);">
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 0.85rem; color: #8c98a4; padding: 15px 0 10px 0; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px;">Tổng Doanh Thu</h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; background: #e6f9ed; color: #2eca6a;">
                                        <i class="bi bi-currency-dollar" style="font-size: 20px;"></i>
                                    </div>
                                    <div class="ps-3" id="revenue-container" style="transition: opacity 0.2s;">
                                        <h6 id="stat-revenue" style="font-size: 22px; margin-bottom: 0; font-weight: 800; color: #1f2937;">...</h6>
                                        <div id="trend-revenue" class="mt-1" style="font-size: 13px;">
                                            <span class="spinner-border spinner-border-sm text-success" role="status"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-4">
                        <div class="card info-card sales-card h-100 mb-0" style="border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.03);">
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 0.85rem; color: #8c98a4; padding: 15px 0 10px 0; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px;">Tổng Đơn Hàng</h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; background: #f0f3ff; color: #4154f1;">
                                        <i class="bi bi-cart" style="font-size: 20px;"></i>
                                    </div>
                                    <div class="ps-3" id="orders-container" style="transition: opacity 0.2s;">
                                        <h6 id="stat-orders" style="font-size: 22px; margin-bottom: 0; font-weight: 800; color: #1f2937;">...</h6>
                                        <div id="trend-orders" class="mt-1" style="font-size: 13px;">
                                            <span class="spinner-border spinner-border-sm text-primary" role="status"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="card info-card customers-card h-100 mb-0" style="border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.03);">
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 0.85rem; color: #8c98a4; padding: 15px 0 10px 0; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px;">Tổng Khách Hàng</h5>
                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; background: #fff0e6; color: #ff771d;">
                                        <i class="bi bi-people" style="font-size: 20px;"></i>
                                    </div>
                                    <div class="ps-3" id="customers-container" style="transition: opacity 0.2s;">
                                        <h6 id="stat-customers" style="font-size: 22px; margin-bottom: 0; font-weight: 800; color: #1f2937;">...</h6>
                                        <div id="trend-customers" class="mt-1" style="font-size: 13px;">
                                            <span class="spinner-border spinner-border-sm text-warning" role="status"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- Line Chart -->
                    <div class="col-12 mb-4">
                        <div class="card mb-0" style="border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.03);">
                            <div class="card-body">
                                <h5 class="card-title text-dark fw-bold mb-0" style="font-family: 'Be Vietnam Pro', sans-serif;">Biểu Đồ Tổng Quan</h5>
                                <div id="reportsChart" style="min-height: 280px; width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- Right side charts (Moved next to Line Chart) -->
                    <div class="col-lg-6 mb-4">
                        <!-- Budget Report -->
                        <div class="card h-100 mb-0" style="border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.03);">
                            <div class="card-body pb-0">
                                <h5 class="card-title text-dark fw-bold" style="font-family: 'Be Vietnam Pro', sans-serif;">Doanh Thu Theo Hãng</h5>
                                <div id="budgetChart" style="min-height: 250px;" class="echart"></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-6 mb-4">
                        <!-- Website Traffic -->
                        <div class="card h-100 mb-0" style="border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.03);">
                            <div class="card-body pb-0">
                                <h5 class="card-title text-dark fw-bold" style="font-family: 'Be Vietnam Pro', sans-serif;">Thống Kê Lượng Thuê</h5>
                                <div id="trafficChart" style="min-height: 250px;" class="echart"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">                            <!-- Top Selling -->
                            <div class="col-12 mt-4">
                                <div class="card border-0 shadow-sm custom-card">
                                    <div class="card-body p-4 pb-0">
                                        <h5 class="card-title text-dark fw-bold mb-4" style="font-family: 'Be Vietnam Pro', sans-serif;">Danh Sách Xe Được Thuê</h5>

                                        <table class="table table-hover table-borderless align-middle">
                                            <thead class="table-light text-muted" style="font-size: 0.85rem; text-transform: uppercase; letter-spacing: 0.5px;">
                                                <tr>
                                                    <th scope="col" class="ps-3" style="border-top-left-radius: 8px; border-bottom-left-radius: 8px;">Hình Ảnh</th>
                                                    <th scope="col">Mẫu Xe</th>
                                                    <th scope="col">Giá Theo Ngày</th>
                                                    <th scope="col">Giá Theo Tuần</th>
                                                    <th scope="col" style="border-top-right-radius: 8px; border-bottom-right-radius: 8px;">Giá Theo Tháng</th>
                                                </tr>
                                            </thead>
                                            <tbody id="top-motorcycles-body">
                                                <!-- Populated by AJAX -->
                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div><!-- End Top Selling -->

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

        <!-- Custom Date Modal -->
        <div class="modal fade" id="customDateModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Chọn Khoảng Thời Gian</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Từ ngày</label>
                            <input type="date" class="form-control" id="startDate">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Đến ngày</label>
                            <input type="date" class="form-control" id="endDate">
                        </div>
                        <div id="customDateError" class="text-danger small mt-2" style="display: none;"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-primary" id="btnApplyCustomDate">Áp dụng</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", () => {
                let currentPeriod = '30days';
                let currentStartDate = '';
                let currentEndDate = '';
                
                // Initialize charts globally with dual-axes layout
                window.reportsChart = new ApexCharts(document.querySelector("#reportsChart"), {
                    series: [],
                    chart: { 
                        height: '100%', 
                        type: 'area',
                        toolbar: { show: true },
                        fontFamily: 'Be Vietnam Pro'
                    },
                    markers: {
                        size: 4,
                        colors: ["#fff"],
                        strokeColors: ['#4154f1', '#2eca6a', '#ff771d'],
                        strokeWidth: 2,
                        hover: { size: 7 }
                    },
                    colors: ['#4154f1', '#2eca6a', '#ff771d'],
                    fill: {
                        type: "gradient",
                        gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                        }
                    },
                    dataLabels: { enabled: false },
                    stroke: { curve: 'smooth', width: 2 },
                    legend: { position: 'bottom', horizontalAlign: 'center' },
                    xaxis: { 
                        type: 'datetime', 
                        categories: [],
                        tickAmount: 6,
                        labels: { 
                            style: { colors: '#6b7280' },
                            datetimeUTC: false
                        }
                    },
                    yaxis: [
                        {
                            seriesName: 'Đơn Hàng',
                            labels: { style: { colors: '#4154f1' }, formatter: function(val) { return Math.round(val); } },
                            min: 0, forceNiceScale: true, tickAmount: 5
                        },
                        {
                            seriesName: 'Doanh Thu',
                            opposite: true,
                            labels: {
                                style: { colors: '#2eca6a' },
                                formatter: function(val) {
                                    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(val).replace('₫', 'VNĐ');
                                }
                            },
                            min: 0, forceNiceScale: true, tickAmount: 5
                        },
                        {
                            seriesName: 'Đơn Hàng', // Syncs 'Khách Hàng' (3rd series) to the 'Đơn Hàng' scale
                            show: false
                        }
                    ],
                    tooltip: { 
                        shared: true,
                        intersect: false,
                        y: {
                            formatter: function(val, { seriesIndex }) {
                                if (seriesIndex === 1) return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(val).replace('₫', 'VNĐ');
                                return val + (seriesIndex === 0 ? ' Đơn' : ' Khách');
                            }
                        }
                    }
                });
                window.reportsChart.render();

                // Right side charts logic restored
                window.budgetChart = echarts.init(document.querySelector("#budgetChart"));
                window.trafficChart = echarts.init(document.querySelector("#trafficChart"));

                // Automatically resize ECharts on window resize for responsiveness
                window.addEventListener('resize', () => {
                    window.budgetChart.resize();
                    window.trafficChart.resize();
                });

                function fetchDashboardData() {
                    // Show real-time loading UI
                    if(window.reportsChart) {
                        try {
                            window.budgetChart.showLoading({ color: '#C09D62' });
                            window.trafficChart.showLoading({ color: '#C09D62' });
                        } catch(e) {}
                    }
                    
                    document.getElementById('revenue-container').style.opacity = '0.4';
                    document.getElementById('orders-container').style.opacity = '0.4';
                    document.getElementById('customers-container').style.opacity = '0.4';

                    let url = 'api_dashboard.jsp?period=' + currentPeriod + '&startDate=' + currentStartDate + '&endDate=' + currentEndDate;
                    fetch(url)
                        .then(res => res.json())
                        .then(data => {
                            // Update Stats Cards
                            if(document.getElementById('stat-orders')) document.getElementById('stat-orders').textContent = data.stats.orders;
                            
                            if(document.getElementById('stat-revenue')) {
                                let rev = data.stats.revenue;
                                rev = rev.replace(' VNĐ', ' <span style="font-size: 15px; font-weight: 600; color: #8c98a4; margin-left: 4px;">VNĐ</span>');
                                document.getElementById('stat-revenue').innerHTML = rev;
                            }
                            
                            if(document.getElementById('stat-customers')) document.getElementById('stat-customers').textContent = data.stats.customers;
                            
                            if(document.getElementById('trend-orders')) document.getElementById('trend-orders').innerHTML = data.stats.trends.o;
                            if(document.getElementById('trend-revenue')) document.getElementById('trend-revenue').innerHTML = data.stats.trends.r;
                            if(document.getElementById('trend-customers')) document.getElementById('trend-customers').innerHTML = data.stats.trends.c;
                            
                            let rawCats = data.charts.lineChart.categories;
                            let rawOrd = data.charts.lineChart.orders;
                            let rawRev = data.charts.lineChart.revenue;
                            let rawCus = data.charts.lineChart.customers;
                            
                            let newCats = rawCats;
                            let newOrd = rawOrd;
                            let newRev = rawRev;
                            let newCus = rawCus;

                            // Update Line Chart (Reports)
                            window.reportsChart.updateOptions({
                                xaxis: { categories: newCats }
                            });
                            window.reportsChart.updateSeries([
                                { name: 'Đơn Hàng', type: 'area', data: newOrd },
                                { name: 'Doanh Thu', type: 'area', data: newRev },
                                { name: 'Khách Hàng', type: 'area', data: newCus }
                            ]);
                            
                            // Update Brand Chart to Bar Chart
                            let brandKeys = Object.keys(data.charts.radarChart);
                            let brandRevenues = Object.values(data.charts.radarChart);
                            
                            window.budgetChart.setOption({
                                tooltip: { 
                                    trigger: 'axis',
                                    axisPointer: { type: 'shadow' },
                                    formatter: function(params) {
                                        var val = params[0].value;
                                        return '<strong>' + params[0].name + '</strong><br/>Doanh Thu: ' + new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(val).replace('₫', 'VNĐ');
                                    }
                                },
                                grid: { left: '5%', right: '5%', bottom: '5%', containLabel: true },
                                xAxis: {
                                    type: 'category',
                                    data: brandKeys,
                                    axisLabel: {
                                        interval: 0,
                                        rotate: 30
                                    }
                                },
                                yAxis: {
                                    type: 'value',
                                    axisLabel: {
                                        formatter: function(val) {
                                            if(val >= 1000000) return (val/1000000) + ' Tr';
                                            if(val >= 1000) return (val/1000) + ' K';
                                            return val;
                                        }
                                    }
                                },
                                series: [{
                                    name: 'Doanh Thu',
                                    type: 'bar',
                                    barWidth: '45%',
                                    data: brandRevenues,
                                    itemStyle: {
                                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                                            { offset: 0, color: '#C09D62' },
                                            { offset: 0.5, color: '#A6854F' },
                                            { offset: 1, color: '#8A6D3B' }
                                        ]),
                                        borderRadius: [4, 4, 0, 0]
                                    },
                                    emphasis: {
                                        itemStyle: {
                                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                                                { offset: 0, color: '#E4CC9C' },
                                                { offset: 0.7, color: '#C09D62' },
                                                { offset: 1, color: '#A6854F' }
                                            ])
                                        }
                                    }
                                }]
                            }, true);
                            
                            // Update Pie Chart (Category)
                            let pieSeries = Object.keys(data.charts.pieChart)
                                .map(k => ({ value: data.charts.pieChart[k], name: k }))
                                .filter(item => item.value > 0); // Lọc bỏ các xe có số lượng bằng 0
                            
                            window.trafficChart.setOption({
                                tooltip: { 
                                    trigger: 'item',
                                    formatter: '<strong>{b}</strong> <br/>Số lượng: {c} chiếc ({d}%)'
                                },
                                legend: { 
                                    bottom: '0%', 
                                    left: 'center',
                                    icon: 'circle'
                                },
                                color: ['#4154f1', '#2eca6a', '#ff771d', '#C09D62', '#0dcaf0', '#6610f2'],
                                series: [{
                                    name: 'Đã thuê', 
                                    type: 'pie', 
                                    radius: ['25%', '75%'],
                                    center: ['50%', '50%'],
                                    roseType: 'radius',
                                    itemStyle: {
                                        borderRadius: 10,
                                        borderColor: '#fff',
                                        borderWidth: 2,
                                        shadowBlur: 15,
                                        shadowColor: 'rgba(0, 0, 0, 0.1)'
                                    },
                                    label: { 
                                        show: false,
                                        formatter: '{b}\n({c})'
                                    },
                                    emphasis: { 
                                        label: { show: true, fontSize: '15', fontWeight: 'bold' },
                                        itemStyle: {
                                            shadowBlur: 25,
                                            shadowColor: 'rgba(0, 0, 0, 0.2)'
                                        }
                                    },
                                    data: pieSeries.sort(function (a, b) { return a.value - b.value; })
                                }]
                            }, true);
                            
                            // Update Top Motorcycles Table
                            let topTbody = document.getElementById('top-motorcycles-body');
                            if (topTbody && data.topMotorcycles) {
                                topTbody.innerHTML = '';
                                data.topMotorcycles.forEach(m => {
                                    let tr = document.createElement('tr');
                                    let imgSrc = !m.image ? 'images/default.jpg' : (m.image.startsWith('http') ? m.image : 'images/' + m.image);
                                    tr.innerHTML = `
                                        <td class="ps-3 py-3">
                                            <div class="d-flex align-items-center">
                                                <img src="`+imgSrc+`" alt="`+m.model+`" class="rounded shadow-sm" style="width: 70px; height: 50px; object-fit: cover; border: 2px solid #fff;">
                                            </div>
                                        </td>
                                        <td class="py-3">
                                            <div class="fw-bold text-dark fs-6 mb-1">`+m.model+`</div>
                                            <span class="badge bg-primary bg-opacity-10 text-primary rounded-pill px-3 py-2 border border-primary border-opacity-25"><i class="bi bi-graph-up-arrow me-1"></i>Đã thuê: `+m.rentCount+` lần</span>
                                        </td>
                                        <td class="fw-semibold text-success py-3">`+ new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(m.dailyPriceForDay).replace('₫', 'VNĐ') +`</td>
                                        <td class="fw-semibold text-success py-3">`+ new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(m.dailyPriceForWeek).replace('₫', 'VNĐ') +`</td>
                                        <td class="fw-semibold text-success py-3">`+ new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(m.dailyPriceForMonth).replace('₫', 'VNĐ') +`</td>
                                    `;
                                    topTbody.appendChild(tr);
                                });
                            }
                        })
                        .catch(err => console.error("Error fetching dashboard data:", err))
                        .finally(() => {
                            // Hide real-time loading UI
                            try {
                                window.budgetChart.hideLoading();
                                window.trafficChart.hideLoading();
                            } catch(e) {}
                            
                            document.getElementById('revenue-container').style.opacity = '1';
                            document.getElementById('orders-container').style.opacity = '1';
                            document.getElementById('customers-container').style.opacity = '1';
                        });
                }

                // Initial load
                fetchDashboardData();

                // Add event listeners to dropdowns and global buttons
                document.querySelectorAll('.dashboard-filter-menu .dropdown-item, .global-filter-btn').forEach(item => {
                    item.addEventListener('click', (e) => {
                        let targetEl = e.currentTarget;
                        let period = targetEl.getAttribute('data-period');
                        if (period === 'custom') {
                            // Let the modal open, do not fetch yet
                        } else {
                            if(targetEl.tagName !== 'BUTTON') e.preventDefault();
                            
                            // Update active state of global buttons
                            document.querySelectorAll('.global-filter-btn').forEach(btn => btn.classList.remove('active'));
                            let btnMatch = document.querySelector('.global-filter-btn[data-period="' + period + '"]');
                            if(btnMatch) btnMatch.classList.add('active');

                            currentPeriod = period;
                            currentStartDate = '';
                            currentEndDate = '';
                            fetchDashboardData();
                        }
                    });
                });
                
                // Custom Date apply
                document.getElementById('btnApplyCustomDate').addEventListener('click', () => {
                    let errDiv = document.getElementById('customDateError');
                    let startVal = document.getElementById('startDate').value;
                    let endVal = document.getElementById('endDate').value;
                    
                    if(!startVal || !endVal) {
                        errDiv.textContent = "Vui lòng chọn đầy đủ Từ ngày và Đến ngày!";
                        errDiv.style.display = 'block';
                        return;
                    }
                    if(new Date(startVal) > new Date(endVal)) {
                        errDiv.textContent = "Từ ngày không được lớn hơn Đến ngày!";
                        errDiv.style.display = 'block';
                        return;
                    }
                    
                    errDiv.style.display = 'none';
                    currentPeriod = 'custom';
                    currentStartDate = startVal;
                    currentEndDate = endVal;
                    
                    // Update active state of global buttons to Custom
                    document.querySelectorAll('.global-filter-btn').forEach(btn => btn.classList.remove('active'));
                    let customBtn = document.querySelector('.global-filter-btn[data-period="custom"]');
                    if(customBtn) customBtn.classList.add('active');

                    // Hide modal programmatically
                    let modalEl = document.getElementById('customDateModal');
                    let modalInstance = bootstrap.Modal.getInstance(modalEl);
                    if(modalInstance) modalInstance.hide();

                    fetchDashboardData();
                });
            });
        </script>
    </body>
</html>
