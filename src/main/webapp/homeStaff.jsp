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
                <div class="global-filter-group" role="group">
                    <button type="button" class="btn global-filter-btn" data-period="today">Hôm nay</button>
                    <button type="button" class="btn global-filter-btn active" data-period="30days">30 Ngày</button>
                    <button type="button" class="btn global-filter-btn" data-period="90days">90 Ngày</button>
                    <button type="button" class="btn global-filter-btn" data-period="180days">180 Ngày</button>
                    <button type="button" class="btn global-filter-btn" data-period="all">Tất cả</button>
                    <button type="button" class="btn global-filter-btn" data-period="custom" data-bs-toggle="modal" data-bs-target="#customDateModal">
                        <i class="bi bi-calendar3 me-1"></i> Tùy chọn...
                    </button>
                </div>
            </div><!-- End Page Title -->



            <style>
                .dashboard .info-card {
                    height: 100%;
                    min-height: 150px;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    box-shadow: 0px 0px 20px rgba(1, 41, 112, 0.08);
                    border-radius: 10px;
                }
                .dashboard .info-card .card-body {
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                }
            </style>

            <section class="section dashboard">
                <div class="row">

                    <!-- Left side columns -->
                    <div class="col-lg-8">
                        <div class="row">

                            <!-- Sales Card -->
                            <div class="col-xxl-4 col-md-6">
                                <div class="card info-card sales-card">



                                    <div class="card-body">
                                        <h5 class="card-title">Đơn Hàng</h5>

                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-cart"></i>
                                            </div>
                                            <div class="ps-3" id="orders-container">
                                                <h6 id="stat-orders">${dsd.stats.orders != null ? dsd.stats.orders : '0'}</h6>
                                                <span id="trend-orders">
                                                    ${dsd.stats.trends.o != null ? dsd.stats.trends.o : '<span class="text-secondary small pt-1 fw-bold">0%</span> <span class="text-muted small pt-2 ps-1">Bằng</span>'}
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div><!-- End Sales Card -->

                            <!-- Revenue Card -->
                            <div class="col-xxl-4 col-md-6">
                                <div class="card info-card revenue-card">



                                    <div class="card-body">
                                        <h5 class="card-title">Doanh Thu</h5>

                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-currency-dollar"></i>
                                            </div>
                                            <div class="ps-3" id="revenue-container">
                                                <h6 id="stat-revenue">${dsd.stats.revenue != null ? dsd.stats.revenue : '0 VNĐ'}</h6>
                                                <span id="trend-revenue">
                                                    ${dsd.stats.trends.r != null ? dsd.stats.trends.r : '<span class="text-secondary small pt-1 fw-bold">0%</span> <span class="text-muted small pt-2 ps-1">Bằng</span>'}
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div><!-- End Revenue Card -->

                            <!-- Customers Card -->
                            <div class="col-xxl-4 col-xl-12">

                                <div class="card info-card customers-card">



                                    <div class="card-body">
                                        <h5 class="card-title">Khách Hàng</h5>

                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-people"></i>
                                            </div>
                                            <div class="ps-3" id="customers-container">
                                                <h6 id="stat-customers">${dsd.stats.customers != null ? dsd.stats.customers : '0'}</h6>
                                                <span id="trend-customers">
                                                    ${dsd.stats.trends.c != null ? dsd.stats.trends.c : '<span class="text-secondary small pt-1 fw-bold">0%</span> <span class="text-muted small pt-2 ps-1">Bằng</span>'}
                                                </span>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div><!-- End Customers Card -->

                            <!-- Reports -->
                            <div class="col-12">
                                <div class="card">



                                    <div class="card-body">
                                        <h5 class="card-title">Báo Cáo Doanh Thu &amp; Hoạt Động</h5>

                                        <!-- Line Chart -->
                                        <div id="reportsChart"></div>

                                        <!-- End Line Chart -->

                                    </div>

                                </div>
                            </div><!-- End Reports -->



                            <!-- Top Selling -->
                            <div class="col-12">
                                <div class="card overflow-auto shadow-sm border-0" style="border-radius: 12px;">

                                    <div class="card-body pb-0">
                                        <h5 class="card-title fw-bold text-dark mb-4">Top Xe Được Thuê Nhiều Nhất</h5>

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
                    </div><!-- End Left side columns -->

                    <!-- Right side columns -->
                    <div class="col-lg-4">



                        <!-- Budget Report -->
                        <div class="card">


                            <div class="card-body pb-0">
                                <h5 class="card-title">Thống Kê Doanh Thu Theo Hãng </h5>

                                <div id="budgetChart" style="min-height: 400px;" class="echart"></div>

                                <!-- Inline budget script removed for AJAX -->

                            </div>
                        </div><!-- End Budget Report -->

                        <!-- Website Traffic -->
                        <div class="card">


                            <div class="card-body pb-0">
                                <h5 class="card-title">Thống Kê Số Lượng Xe Được Thuê</h5>

                                <div id="trafficChart" style="min-height: 400px;" class="echart"></div>

                                <!-- Inline traffic script removed for AJAX -->

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
                        height: 350, 
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

                window.budgetChart = echarts.init(document.querySelector("#budgetChart"));
                window.trafficChart = echarts.init(document.querySelector("#trafficChart"));

                // Automatically resize ECharts on window resize for responsiveness
                window.addEventListener('resize', () => {
                    window.budgetChart.resize();
                    window.trafficChart.resize();
                });

                function fetchDashboardData() {
                    let url = 'api_dashboard.jsp?period=' + currentPeriod + '&startDate=' + currentStartDate + '&endDate=' + currentEndDate;
                    fetch(url)
                        .then(res => res.json())
                        .then(data => {
                            // Update Stats Cards
                            if(document.getElementById('stat-orders')) document.getElementById('stat-orders').textContent = data.stats.orders;
                            if(document.getElementById('stat-revenue')) document.getElementById('stat-revenue').textContent = data.stats.revenue;
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
                            
                            // Update Brand Chart to Radar Chart (NiceAdmin default)
                            let brandKeys = Object.keys(data.charts.radarChart);
                            let brandRevenues = Object.values(data.charts.radarChart);
                            
                            window.budgetChart.setOption({
                                tooltip: { trigger: 'item' },
                                legend: {
                                    data: ['Doanh Thu'],
                                    bottom: 0
                                },
                                radar: {
                                    indicator: brandKeys.map(k => ({ name: k })),
                                    radius: '65%' // Làm radar chart nhỏ gọn, cân đối hơn
                                },
                                series: [{
                                    name: 'Thống Kê Theo Hãng Xe',
                                    type: 'radar',
                                    data: [{
                                        value: brandRevenues,
                                        name: 'Doanh Thu',
                                        areaStyle: {
                                            color: 'rgba(65, 84, 241, 0.4)'
                                        },
                                        lineStyle: {
                                            color: '#4154f1'
                                        },
                                        itemStyle: {
                                            color: '#4154f1'
                                        }
                                    }]
                                }]
                            }, true);
                            
                            // Update Pie Chart (Category)
                            let pieSeries = Object.keys(data.charts.pieChart).map(k => ({ value: data.charts.pieChart[k], name: k }));
                            window.trafficChart.setOption({
                                tooltip: { trigger: 'item' },
                                legend: { top: '5%', left: 'center' },
                                series: [{
                                    name: 'Số Lượng', type: 'pie', radius: ['40%', '70%'],
                                    avoidLabelOverlap: false, label: { show: false, position: 'center' },
                                    emphasis: { label: { show: true, fontSize: '18', fontWeight: 'bold' } },
                                    labelLine: { show: false }, data: pieSeries
                                }]
                            });
                            
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
                                        <td class="fw-semibold text-success py-3">`+ new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(m.dailyPriceForDay * 1000).replace('₫', 'VNĐ') +`</td>
                                        <td class="fw-semibold text-success py-3">`+ new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(m.dailyPriceForWeek * 1000).replace('₫', 'VNĐ') +`</td>
                                        <td class="fw-semibold text-success py-3">`+ new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(m.dailyPriceForMonth * 1000).replace('₫', 'VNĐ') +`</td>
                                    `;
                                    topTbody.appendChild(tr);
                                });
                            }
                        })
                        .catch(err => console.error("Error fetching dashboard data:", err));
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
