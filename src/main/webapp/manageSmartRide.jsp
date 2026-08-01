<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Xe Máy - SmartRide</title>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="${pageContext.request.contextPath}/images/newlogo_transparent.png" rel="icon" type="image/png">
        

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

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
    <body style="overflow: hidden;">
        <jsp:include page="/includes/staff/header-staff.jsp" />
        <jsp:include page="/includes/staff/sidebar.jsp" />
        


        <main id="main" class="main" style="padding: 0; position: relative;">
            <iframe id="contentIframe" onload="if(window.NProgress) window.NProgress.done();" src="${param.iframeSrc}${param.iframeSrc.contains('?') ? '&' : '?'}iframe=true" style="width: 100%; height: calc(100vh - 60px); border: none;" scrolling="yes"></iframe>
        </main>
        
        <!-- Vendor JS Files -->
        <!-- Global Lightbox Modal -->
        <div class="modal fade" id="globalLightboxModal" tabindex="-1" aria-hidden="true" style="z-index: 1060;">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="max-width: 90vw;">
                <div class="modal-content" style="background: transparent; border: none; box-shadow: none;">
                    <div class="modal-header" style="border: none; position: absolute; right: 0; z-index: 1070;">
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" style="background-color: rgba(0,0,0,0.5); border-radius: 50%; padding: 10px; margin: 10px;"></button>
                    </div>
                    <div class="modal-body text-center p-0" style="position: relative;">
                        <img id="globalLightboxImage" src="" alt="Enlarged Image" style="max-width: 100%; max-height: 90vh; object-fit: contain; border-radius: 8px; box-shadow: 0 10px 25px rgba(0,0,0,0.5);">
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            // Global function to open lightbox, callable from iframes via window.parent.openLightbox(src)
            window.openLightbox = function(imageSrc) {
                if (!imageSrc || imageSrc === '#' || imageSrc.includes('no-image')) return;
                const lightboxImage = document.getElementById('globalLightboxImage');
                if (lightboxImage) {
                    lightboxImage.src = imageSrc;
                    const lightboxModal = new bootstrap.Modal(document.getElementById('globalLightboxModal'));
                    lightboxModal.show();
                }
            };
        </script>

        <script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="staffAssets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="staffAssets/vendor/tinymce/tinymce.min.js"></script>
        <!-- Template Main JS File -->
        <script src="staffAssets/js/main.js"></script>

        <!-- Customer Details Modal (Moved to parent for full screen) -->
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

        <script>
            window.showCustomerDetails = function(id, name, email, phone, bookings, spent) {
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
            };
        </script>
    </body>
</html>
