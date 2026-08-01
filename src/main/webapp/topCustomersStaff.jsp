<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            background-color: #f4f7fc;
        }
        
        .page-header-banner {
            background: linear-gradient(135deg, #d4a017 0%, #f59e0b 100%);
            border-radius: 16px;
            padding: 28px 32px;
            margin-bottom: 24px;
            color: #ffffff;
            display: flex;
            align-items: center;
            gap: 16px;
            box-shadow: 0 8px 24px rgba(212, 160, 23, 0.25);
        }
        .page-header-banner .banner-icon {
            width: 64px;
            height: 64px;
            background: rgba(255,255,255,0.25);
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: #ffffff;
            flex-shrink: 0;
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255,255,255,0.4);
        }
        .page-header-banner h1 {
            font-size: 1.6rem;
            font-weight: 700;
            margin: 0;
            color: #ffffff;
            text-shadow: 0 1px 2px rgba(0,0,0,0.15);
        }
        .page-header-banner p {
            opacity: 0.95;
            margin: 0;
            font-size: 0.9rem;
            color: #ffffff;
            text-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }
        
        .vip-card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0, 0, 0, 0.06);
            background: #fff;
            overflow: hidden;
        }

        .medal-icon { font-size: 1.8rem; }
        .medal-1 { color: #FFD700; filter: drop-shadow(0 2px 4px rgba(255,215,0,0.5)); }
        .medal-2 { color: #C0C0C0; filter: drop-shadow(0 2px 4px rgba(192,192,192,0.5)); }
        .medal-3 { color: #CD7F32; filter: drop-shadow(0 2px 4px rgba(205,127,50,0.5)); }
        .medal-other { 
            display: inline-flex;
            width: 36px; height: 36px;
            background: #f0f2f5;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            color: #6c757d;
            font-size: 0.85rem;
            font-weight: 700;
        }

        .table-vip thead th {
            background: #212529; /* Dark color matching sidebar theme */
            color: #fff;
            font-weight: 600;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            padding: 14px 16px;
            border: none;
            border-bottom: 2px solid #d4a017;
        }
        .table-vip tbody tr {
            border-bottom: 1px solid #f0f2f5;
            transition: all 0.2s ease;
        }
        .table-vip tbody tr:hover {
            background-color: #f0f4ff;
            transform: scale(1.003);
            box-shadow: 0 2px 10px rgba(65, 84, 241, 0.1);
        }
        .table-vip tbody td {
            padding: 14px 16px;
            vertical-align: middle;
            border: none;
        }

        .customer-avatar {
            width: 42px; height: 42px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4154f1, #012970);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 1rem;
            flex-shrink: 0;
        }
        .customer-name {
            font-weight: 600;
            color: #012970;
            margin-bottom: 1px;
            font-size: 0.95rem;
        }
        .customer-email {
            font-size: 0.8rem;
            color: #9aa5b4;
        }
        .customer-phone {
            color: #444;
            font-size: 0.9rem;
        }
        .total-spent {
            font-weight: 700;
            color: #198754;
            font-size: 1rem;
        }
        .total-bookings {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 5px 14px;
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
            color: #065f46;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
        }
        .click-hint {
            font-size: 0.78rem;
            color: #9aa5b4;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        /* Gold rank accents */
        .rank-gold   { color: #d4a017; font-size: 1.6rem; filter: drop-shadow(0 2px 6px rgba(212,160,23,0.5)); }
        .rank-silver { color: #8e9bae; font-size: 1.6rem; filter: drop-shadow(0 2px 4px rgba(142,155,174,0.4)); }
        .rank-bronze { color: #b5682c; font-size: 1.6rem; filter: drop-shadow(0 2px 4px rgba(181,104,44,0.4)); }
    </style>

    <script>
        // Function defined in <head> so it's available before the includes render
        function showCustomerDetails(id, name, email, phone, bookings, spent) {
            document.getElementById('modalCustomerName').innerText = name;
            document.getElementById('modalCustomerEmail').innerText = email;
            document.getElementById('modalCustomerPhone').innerText = phone;
            document.getElementById('modalCustomerBookings').innerText = bookings;
            document.getElementById('modalCustomerSpent').innerText = parseFloat(spent).toLocaleString('vi-VN') + ' đ';

            const tbody = document.getElementById('modalHistoryTableBody');
            tbody.innerHTML = '<tr><td colspan="6" class="text-center py-4"><div class="spinner-border text-primary" role="status"></div><p class="mt-2 text-muted small">Đang tải dữ liệu...</p></td></tr>';

            const myModal = new bootstrap.Modal(document.getElementById('customerDetailsModal'));
            myModal.show();

            fetch('customerHistoryStaff?customerId=' + id)
                .then(function(res) { return res.json(); })
                .then(function(data) {
                    if (!data || data.length === 0) {
                        tbody.innerHTML = '<tr><td colspan="6" class="text-center py-4 text-muted"><i class="bi bi-inbox fs-2 d-block mb-2"></i>Không có lịch sử thuê xe.</td></tr>';
                        return;
                    }
                    var html = '';
                    data.forEach(function(b) {
                        var badge;
                        if (b.status === 'Đã hoàn thành' || b.status === 'Đã xác nhận') {
                            badge = '<span class="badge rounded-pill px-3" style="background:#d1fae5;color:#065f46;">Hoàn thành</span>';
                        } else if (b.status === 'Đã hủy') {
                            badge = '<span class="badge rounded-pill px-3" style="background:#fee2e2;color:#991b1b;">Đã hủy</span>';
                        } else {
                            badge = '<span class="badge rounded-pill px-3" style="background:#fef9c3;color:#854d0e;">' + b.status + '</span>';
                        }
                        html += '<tr>'
                            + '<td><span class="fw-bold" style="color:#4154f1;">#' + b.bookingID + '</span></td>'
                            + '<td>' + b.motorName + '</td>'
                            + '<td class="text-muted" style="font-size:0.85rem;">' + b.startDate + '</td>'
                            + '<td class="text-muted" style="font-size:0.85rem;">' + b.endDate + '</td>'
                            + '<td class="fw-bold">' + parseFloat(b.totalPrice).toLocaleString('vi-VN') + 'đ</td>'
                            + '<td class="text-center">' + badge + '</td>'
                            + '</tr>';
                    });
                    tbody.innerHTML = html;
                })
                .catch(function() {
                    tbody.innerHTML = '<tr><td colspan="6" class="text-center py-4 text-danger">Có lỗi khi tải dữ liệu.</td></tr>';
                });
        }
    </script>
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

                    <!-- Page Header Banner -->
                    <div class="page-header-banner">
                        <div class="banner-icon">
                            <i class="bi bi-trophy-fill"></i>
                        </div>
                        <div>
                            <h1>Bảng Xếp Hạng Khách Hàng VIP</h1>
                            <p>Top 20 khách hàng có tổng chi tiêu cao nhất &bull; Click vào dòng để xem chi tiết & lịch sử thuê xe</p>
                        </div>
                    </div>

                    <div class="vip-card">
                        <div class="p-3 px-4 border-bottom d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center gap-2">
                                <span class="fw-bold text-dark">Danh sách xếp hạng</span>
                                <span class="badge bg-primary rounded-pill">Top 20</span>
                            </div>
                            <div class="click-hint">
                                <i class="bi bi-cursor-fill"></i>
                                Nhấp vào khách hàng để xem chi tiết
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-vip mb-0">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width: 70px;">Hạng</th>
                                        <th>Khách Hàng</th>
                                        <th>Số Điện Thoại</th>
                                        <th class="text-center">Số Chuyến</th>
                                        <th class="text-end pe-4">Tổng Chi Tiêu</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="customer" items="${topCustomers}" varStatus="status">
                                        <tr style="cursor: pointer; user-select: none;" onclick="showCustomerDetails('${customer.CustomerID}', '${customer.FullName}', '${customer.Email}', '${customer.Phone}', '${customer.TotalBookings}', '${customer.TotalSpent}')" title="Xem chi tiết ${customer.FullName}">
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${status.count == 1}">
                                                        <i class="bi bi-trophy-fill rank-gold"></i>
                                                    </c:when>
                                                    <c:when test="${status.count == 2}">
                                                        <i class="bi bi-trophy-fill rank-silver"></i>
                                                    </c:when>
                                                    <c:when test="${status.count == 3}">
                                                        <i class="bi bi-trophy-fill rank-bronze"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="medal-other">#${status.count}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center gap-3">
                                                    <div class="customer-avatar">
                                                        <i class="bi bi-person-fill"></i>
                                                    </div>
                                                    <div>
                                                        <p class="customer-name">${customer.FullName}</p>
                                                        <span class="customer-email">${customer.Email}</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="customer-phone">
                                                <i class="bi bi-telephone me-1 text-muted"></i>
                                                ${customer.Phone}
                                            </td>
                                            <td class="text-center">
                                                <span class="total-bookings">
                                                    <i class="bi bi-bicycle"></i>
                                                    ${customer.TotalBookings} chuyến
                                                </span>
                                            </td>
                                            <td class="text-end pe-4">
                                                <span class="total-spent">
                                                    <fmt:formatNumber value="${customer.TotalSpent}" pattern="#,##0" /> đ
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty topCustomers}">
                                        <tr>
                                            <td colspan="5" class="text-center py-5 text-muted">
                                                <i class="bi bi-inbox fs-1 d-block mb-3 opacity-50"></i>
                                                <p class="fw-semibold">Chưa có dữ liệu khách hàng.</p>
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </section>

    </main><!-- End #main -->

    <!-- Customer Details Modal -->
    <div class="modal fade" id="customerDetailsModal" tabindex="-1" aria-labelledby="customerDetailsModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content border-0" style="border-radius:16px; overflow:hidden; box-shadow:0 20px 60px rgba(0,0,0,0.15); background:#ffffff;">
          <!-- Header -->
          <div class="modal-header border-0 px-4 py-3" style="background: linear-gradient(135deg, #d4a017 0%, #f59e0b 100%);">
            <div class="d-flex align-items-center gap-3">
              <div style="width:48px;height:48px;background:rgba(255,255,255,0.25);border-radius:12px;display:flex;align-items:center;justify-content:center;border:1px solid rgba(255,255,255,0.4);">
                <i class="bi bi-person-lines-fill" style="font-size:1.4rem;color:#ffffff;"></i>
              </div>
              <div>
                <h5 class="modal-title fw-bold text-white mb-0" id="customerDetailsModalLabel">Chi Tiết Khách Hàng VIP</h5>
                <p class="mb-0" style="opacity:0.95;font-size:0.8rem;color:#ffffff;">Thông tin cá nhân &amp; lịch sử thuê xe</p>
              </div>
            </div>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
          </div>

          <!-- Body -->
          <div class="p-4" style="background:#f8f9fa;">
            <!-- Info Cards Row -->
            <div class="row g-3 mb-4">
              <!-- Contact -->
              <div class="col-md-7">
                <div class="p-3 h-100 rounded-3" style="background:#ffffff;border:1px solid #e9ecef;box-shadow:0 2px 12px rgba(0,0,0,0.03);">
                  <p style="font-size:0.68rem;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:#d4a017;margin-bottom:14px;">
                    <i class="bi bi-person-badge-fill me-1"></i> Thông tin liên hệ
                  </p>
                  <h4 id="modalCustomerName" class="fw-bold mb-3 text-dark" style="font-size:1.3rem;"></h4>
                  <div class="d-flex flex-column gap-2">
                    <div class="d-flex align-items-center gap-2" style="padding:8px 12px;background:#f8f9fa;border-radius:8px;border:1px solid #f1f3f5;">
                      <i class="bi bi-telephone-fill" style="color:#d4a017;"></i>
                      <span id="modalCustomerPhone" style="color:#495057;font-weight:600;"></span>
                    </div>
                    <div class="d-flex align-items-center gap-2" style="padding:8px 12px;background:#f8f9fa;border-radius:8px;border:1px solid #f1f3f5;">
                      <i class="bi bi-envelope-fill" style="color:#d4a017;"></i>
                      <span id="modalCustomerEmail" style="color:#6c757d;font-size:0.9rem;"></span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Stats -->
              <div class="col-md-5">
                <div class="p-3 h-100 rounded-3 text-center d-flex flex-column justify-content-center align-items-center" style="background:#ffffff;border:1px solid #e9ecef;box-shadow:0 2px 12px rgba(0,0,0,0.03);">
                  <p style="font-size:0.68rem;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:#6c757d;margin-bottom:6px;">Tổng chi tiêu</p>
                  <h2 id="modalCustomerSpent" class="fw-bold mb-2" style="color:#d4a017;font-size:1.6rem;"></h2>
                  <div style="background:#fef3c7;border-radius:20px;padding:6px 18px;display:inline-flex;align-items:center;gap:6px;border:1px solid #fde68a;">
                    <i class="bi bi-bicycle" style="color:#b45309;"></i>
                    <span id="modalCustomerBookings" class="fw-bold" style="color:#b45309;"></span>
                    <span style="color:#b45309;">chuyến</span>
                  </div>
                </div>
              </div>
            </div>

            <!-- History Table -->
            <p style="font-size:0.68rem;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:#d4a017;margin-bottom:10px;">
              <i class="bi bi-clock-history me-1"></i> Lịch sử thuê xe
            </p>
            <div class="rounded-3 overflow-hidden" style="border:1px solid #e9ecef;background:#ffffff; max-height: 400px; overflow-y: auto !important;">
              <table class="table table-hover align-middle mb-0">
                <thead>
                  <tr style="background:#212529;border-bottom:2px solid #d4a017;">
                    <th class="border-0" style="padding:12px 16px;font-size:0.75rem;font-weight:700;color:#ffffff;letter-spacing:1px;text-transform:uppercase;">Mã Đơn</th>
                    <th class="border-0" style="padding:12px 16px;font-size:0.75rem;font-weight:700;color:#ffffff;letter-spacing:1px;text-transform:uppercase;">Số Xe</th>
                    <th class="border-0" style="padding:12px 16px;font-size:0.75rem;font-weight:700;color:#ffffff;letter-spacing:1px;text-transform:uppercase;">Ngày nhận</th>
                    <th class="border-0" style="padding:12px 16px;font-size:0.75rem;font-weight:700;color:#ffffff;letter-spacing:1px;text-transform:uppercase;">Ngày trả</th>
                    <th class="border-0" style="padding:12px 16px;font-size:0.75rem;font-weight:700;color:#ffffff;letter-spacing:1px;text-transform:uppercase;">Giá trị</th>
                    <th class="border-0 text-center" style="padding:12px 16px;font-size:0.75rem;font-weight:700;color:#ffffff;letter-spacing:1px;text-transform:uppercase;">Trạng thái</th>
                  </tr>
                </thead>
                <tbody id="modalHistoryTableBody">
                </tbody>
              </table>
            </div>
          </div>

          <div class="modal-footer border-0 px-4 py-3" style="background:#ffffff;border-top:1px solid #e9ecef !important;">
            <button type="button" class="btn px-4 fw-semibold rounded-pill" data-bs-dismiss="modal" style="background:#f1f3f5;color:#495057;border:1px solid #dee2e6;">
              <i class="bi bi-x-lg me-1"></i> Đóng
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- Vendor JS Files -->
    <script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="staffAssets/js/main.js"></script>

    <script>
        function showCustomerDetails(id, name, email, phone, bookings, spent) {
            document.getElementById('modalCustomerName').innerText = name;
            document.getElementById('modalCustomerEmail').innerText = email;
            document.getElementById('modalCustomerPhone').innerText = phone;
            document.getElementById('modalCustomerBookings').innerText = bookings;
            document.getElementById('modalCustomerSpent').innerText = parseFloat(spent).toLocaleString('vi-VN') + ' đ';

            const tbody = document.getElementById('modalHistoryTableBody');
            tbody.innerHTML = '<tr><td colspan="6" class="text-center py-4"><div class="spinner-border text-warning" role="status"></div><p class="mt-2 text-muted" style="font-size:0.85rem;">Đang tải lịch sử...</p></td></tr>';

            const myModal = new bootstrap.Modal(document.getElementById('customerDetailsModal'));
            myModal.show();

            fetch('customerHistoryStaff?customerId=' + id)
                .then(res => res.json())
                .then(data => {
                    if (!data || data.length === 0) {
                        tbody.innerHTML = '<tr><td colspan="6" class="text-center py-5 text-muted"><i class="bi bi-inbox fs-1 d-block mb-3" style="opacity:0.3;color:#d4a017;"></i><span class="text-muted">Không có lịch sử thuê xe.</span></td></tr>';
                        return;
                    }
                    let html = '';
                    data.forEach(b => {
                        let badge;
                        if (b.status === 'Đã hoàn thành' || b.status === 'Đã xác nhận') {
                            badge = '<span class="badge rounded-pill px-3 py-2" style="background:#d1fae5;color:#065f46;">Hoàn thành</span>';
                        } else if (b.status === 'Đã hủy') {
                            badge = '<span class="badge rounded-pill px-3 py-2" style="background:#fee2e2;color:#991b1b;">Đã hủy</span>';
                        } else {
                            badge = '<span class="badge rounded-pill px-3 py-2" style="background:#fef9c3;color:#854d0e;">' + b.status + '</span>';
                        }
                        html += `<tr>
                            <td class="border-0" style="padding:16px;border-bottom:1px solid #f1f3f5 !important;"><span class="fw-bold" style="color:#d4a017;">#${b.bookingID}</span></td>
                            <td class="border-0 text-dark" style="padding:16px;border-bottom:1px solid #f1f3f5 !important;font-weight:500;">${b.motorName}</td>
                            <td class="border-0 text-muted" style="padding:16px;font-size:0.85rem;border-bottom:1px solid #f1f3f5 !important;">${b.startDate}</td>
                            <td class="border-0 text-muted" style="padding:16px;font-size:0.85rem;border-bottom:1px solid #f1f3f5 !important;">${b.endDate}</td>
                            <td class="border-0 text-dark" style="padding:16px;font-weight:700;border-bottom:1px solid #f1f3f5 !important;">${parseFloat(b.totalPrice).toLocaleString('vi-VN')}đ</td>
                            <td class="border-0 text-center" style="padding:16px;border-bottom:1px solid #f1f3f5 !important;">${badge}</td>
                        </tr>`;
                    });
                    tbody.innerHTML = html;
                })
                .catch(() => {
                    tbody.innerHTML = '<tr><td colspan="6" class="text-center py-4 text-danger fw-bold">Có lỗi khi tải dữ liệu.</td></tr>';
                });
        }
    </script>
</body>
</html>

