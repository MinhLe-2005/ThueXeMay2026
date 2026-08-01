<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Top Khách Hàng - Quản Lý</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/newlogo_transparent.png">
    
    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="staffAssets/css/style.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Be Vietnam Pro', sans-serif;
            background-color: #f8f9fa;
        }
        
        .top-customer-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            background: #fff;
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        
        .top-customer-card:hover {
            transform: translateY(-5px);
        }

        .medal-icon {
            font-size: 2rem;
        }
        
        .medal-1 { color: #FFD700; } /* Gold */
        .medal-2 { color: #C0C0C0; } /* Silver */
        .medal-3 { color: #CD7F32; } /* Bronze */
        .medal-other { color: #6c757d; font-size: 1.5rem; font-weight: bold; }

        .table-custom {
            margin-bottom: 0;
        }
        
        .table-custom thead th {
            background-color: #f1f4f9;
            color: #444;
            border-bottom: none;
            padding: 15px;
            font-weight: 600;
        }
        
        .table-custom tbody td {
            padding: 15px;
            vertical-align: middle;
            border-bottom: 1px solid #f1f4f9;
        }

        .customer-name {
            font-weight: 600;
            color: #012970;
            margin-bottom: 0;
        }
        
        .customer-email {
            font-size: 0.85rem;
            color: #899bbd;
        }
        
        .total-spent {
            font-weight: 700;
            color: #198754;
            font-size: 1.1rem;
        }
        
        .total-bookings {
            display: inline-block;
            padding: 5px 12px;
            background-color: #e0f8e9;
            color: #198754;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .page-title h1 {
            font-size: 24px;
            font-weight: 700;
            color: #012970;
        }
    </style>
</head>

<body>

    <!-- ======= Header ======= -->
    <jsp:include page="/includes/staff/header-staff.jsp" />
    <jsp:include page="/includes/staff/sidebar.jsp" />
    
    <main id="main" class="main">

        <div class="pagetitle mb-4">
            <h1 class="page-title">Top Khách Hàng VIP</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="homeStaff">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Top Khách Hàng</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section dashboard">
            <div class="row">

                <div class="col-12">
                    <div class="top-customer-card p-0">
                        <div class="card-body p-0">
                            <h5 class="card-title px-4 pt-4 pb-2 m-0" style="font-family: 'Be Vietnam Pro', sans-serif;">
                                Bảng Xếp Hạng Chi Tiêu <span class="badge bg-primary ms-2">Top 20</span>
                            </h5>
                            
                            <div class="table-responsive">
                                <table class="table table-custom table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="text-center" style="width: 80px;">Xếp Hạng</th>
                                            <th scope="col">Khách Hàng</th>
                                            <th scope="col">Số Điện Thoại</th>
                                            <th scope="col" class="text-center">Số Chuyến</th>
                                            <th scope="col" class="text-end pe-4">Tổng Chi Tiêu</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="customer" items="${topCustomers}" varStatus="status">
                                            <tr style="cursor: pointer;" onclick="showCustomerDetails('${customer.CustomerID}', '${customer.FullName}', '${customer.Email}', '${customer.Phone}', '${customer.TotalBookings}', '${customer.TotalSpent}')">
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${status.count == 1}">
                                                            <i class="bi bi-trophy-fill medal-icon medal-1"></i>
                                                        </c:when>
                                                        <c:when test="${status.count == 2}">
                                                            <i class="bi bi-trophy-fill medal-icon medal-2"></i>
                                                        </c:when>
                                                        <c:when test="${status.count == 3}">
                                                            <i class="bi bi-trophy-fill medal-icon medal-3"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="medal-other">#${status.count}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <p class="customer-name">${customer.FullName}</p>
                                                    <span class="customer-email">${customer.Email}</span>
                                                </td>
                                                <td>${customer.Phone}</td>
                                                <td class="text-center">
                                                    <span class="total-bookings">${customer.TotalBookings} chuyến</span>
                                                </td>
                                                <td class="text-end pe-4">
                                                    <span class="total-spent">
                                                        <fmt:formatNumber value="${customer.TotalSpent}" pattern="#,##0" /> VNĐ
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty topCustomers}">
                                            <tr>
                                                <td colspan="5" class="text-center py-5 text-muted">
                                                    <i class="bi bi-inbox fs-1 d-block mb-3"></i>
                                                    Chưa có dữ liệu khách hàng.
                                                </td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

    </main><!-- End #main -->

    <!-- Customer Details Modal -->
    <div class="modal fade" id="customerDetailsModal" tabindex="-1" aria-labelledby="customerDetailsModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content border-0 shadow">
          <div class="modal-header bg-primary text-white border-0">
            <h5 class="modal-title fw-bold" id="customerDetailsModalLabel"><i class="bi bi-person-lines-fill me-2"></i>Chi Tiết Khách Hàng VIP</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body p-4 bg-light">
            <div class="row mb-4">
              <div class="col-md-6">
                <div class="card h-100 border-0 shadow-sm">
                  <div class="card-body">
                    <h6 class="text-muted fw-bold mb-3 text-uppercase" style="font-size: 0.8rem; letter-spacing: 1px;">Thông tin liên hệ</h6>
                    <h5 id="modalCustomerName" class="fw-bold text-primary mb-2"></h5>
                    <p class="mb-1"><i class="bi bi-telephone-fill text-muted me-2"></i> <span id="modalCustomerPhone"></span></p>
                    <p class="mb-0"><i class="bi bi-envelope-fill text-muted me-2"></i> <span id="modalCustomerEmail"></span></p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card h-100 border-0 shadow-sm bg-primary text-white">
                  <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                    <h6 class="fw-bold mb-3 text-uppercase text-white-50" style="font-size: 0.8rem; letter-spacing: 1px;">Tổng chi tiêu</h6>
                    <h3 id="modalCustomerSpent" class="fw-bold mb-2"></h3>
                    <div class="badge bg-white text-primary rounded-pill px-3 py-2">
                        <span id="modalCustomerBookings" class="fw-bold"></span> Chuyến
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <h6 class="fw-bold text-dark mb-3"><i class="bi bi-clock-history me-2"></i>Lịch sử thuê xe</h6>
            <div class="table-responsive bg-white rounded-3 shadow-sm">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="border-0">Mã Đơn</th>
                            <th class="border-0">Xe</th>
                            <th class="border-0">Ngày nhận</th>
                            <th class="border-0">Ngày trả</th>
                            <th class="border-0">Giá trị</th>
                            <th class="border-0 text-center">Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody id="modalHistoryTableBody">
                        <!-- AJAX content -->
                    </tbody>
                </table>
            </div>
          </div>
          <div class="modal-footer border-0 bg-light">
            <button type="button" class="btn btn-secondary px-4 fw-bold rounded-pill" data-bs-dismiss="modal">Đóng</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Vendor JS Files -->
    <script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="staffAssets/js/main.js"></script>

    <script>
        function showCustomerDetails(id, name, email, phone, bookings, spent) {
            // Fill Customer Info
            document.getElementById('modalCustomerName').innerText = name;
            document.getElementById('modalCustomerEmail').innerText = email;
            document.getElementById('modalCustomerPhone').innerText = phone;
            document.getElementById('modalCustomerBookings').innerText = bookings;
            document.getElementById('modalCustomerSpent').innerText = parseFloat(spent).toLocaleString('vi-VN') + ' VNĐ';

            // Show Loading
            const tbody = document.getElementById('modalHistoryTableBody');
            tbody.innerHTML = '<tr><td colspan="6" class="text-center py-4"><div class="spinner-border text-primary" role="status"></div><p class="mt-2 text-muted">Đang tải lịch sử...</p></td></tr>';

            // Open Modal
            var modal = new bootstrap.Modal(document.getElementById('customerDetailsModal'));
            modal.show();

            // Fetch History via AJAX
            fetch('customerHistoryStaff?customerId=' + id)
                .then(response => response.json())
                .then(data => {
                    if (data.length === 0) {
                        tbody.innerHTML = '<tr><td colspan="6" class="text-center py-4 text-muted">Không tìm thấy lịch sử thuê xe.</td></tr>';
                        return;
                    }
                    
                    let html = '';
                    data.forEach(booking => {
                        let statusBadge = '';
                        if (booking.status === 'Đã hoàn thành' || booking.status === 'Đã xác nhận') {
                            statusBadge = '<span class="badge bg-success rounded-pill px-3">Hoàn thành</span>';
                        } else if (booking.status === 'Đã hủy') {
                            statusBadge = '<span class="badge bg-danger rounded-pill px-3">Đã hủy</span>';
                        } else {
                            statusBadge = '<span class="badge bg-warning text-dark rounded-pill px-3">' + booking.status + '</span>';
                        }

                        html += `
                            <tr>
                                <td><span class="fw-bold text-primary">#${booking.bookingID}</span></td>
                                <td>${booking.motorName}</td>
                                <td class="text-muted small">${booking.startDate}</td>
                                <td class="text-muted small">${booking.endDate}</td>
                                <td class="fw-bold">${parseFloat(booking.totalPrice).toLocaleString('vi-VN')}đ</td>
                                <td class="text-center">${statusBadge}</td>
                            </tr>
                        `;
                    });
                    tbody.innerHTML = html;
                })
                .catch(error => {
                    console.error('Error fetching history:', error);
                    tbody.innerHTML = '<tr><td colspan="6" class="text-center py-4 text-danger">Có lỗi xảy ra khi tải dữ liệu.</td></tr>';
                });
        }
    </script>
</body>
</html>
