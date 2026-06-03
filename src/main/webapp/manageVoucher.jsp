<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Quản lý Khuyến mãi - SmartRide</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Vendor CSS Files -->
        <link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <!-- Template Main CSS File -->
        <link href="staffAssets/css/style.css" rel="stylesheet">
        <!-- SweetAlert2 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

        <style type="text/css">
            .custom-card {
                border-radius: 12px;
                border: none;
                box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            }
            .voucher-code {
                font-family: 'Courier New', Courier, monospace;
                font-weight: bold;
                color: #d4af37;
                background: rgba(212, 175, 55, 0.1);
                padding: 4px 8px;
                border-radius: 4px;
                border: 1px dashed #d4af37;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/includes/staff/header-staff.jsp" />
        <jsp:include page="/includes/staff/sidebar.jsp" />
        
        <main id="main" class="main">
            <div class="pagetitle mb-4 d-flex justify-content-between align-items-center">
                <div>
                    <h1>Quản lý Khuyến mãi (Voucher)</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="homeStaff" target="_top">Trang Chủ</a></li>
                            <li class="breadcrumb-item active">Quản lý Khuyến mãi</li>
                        </ol>
                    </nav>
                </div>
                <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#voucherModal" onclick="openAddModal()" style="font-weight: 600;">
                    <i class="bi bi-plus-circle me-1"></i> Tạo Voucher Mới
                </button>
            </div>

            <section class="section">
                <div class="row">
                    <div class="col-12">
                        <div class="card custom-card">
                            <div class="card-body p-4">
                                <h5 class="card-title fw-bold text-dark mb-4">Danh sách Voucher</h5>
                                <div class="table-responsive">
                                    <table class="table table-hover table-borderless align-middle datatable">
                                        <thead class="table-light text-muted" style="font-size: 0.85rem; text-transform: uppercase;">
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã Code</th>
                                                <th>Mô tả</th>
                                                <th>Giảm giá</th>
                                                <th>Ngày tạo</th>
                                                <th>Dành cho Khách</th>
                                                <th>Trạng thái</th>
                                                <th class="text-center">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="v" items="${vouchers}">
                                                <tr>
                                                    <td>#${v.voucherId}</td>
                                                    <td><span class="voucher-code">${v.code}</span></td>
                                                    <td>${v.description}</td>
                                                    <td class="text-success fw-bold">
                                                        <fmt:formatNumber value="${v.discountAmount}" pattern="#,###"/> đ
                                                    </td>
                                                    <td>${v.createdTime != null ? fn:substring(v.createdTime, 0, 16) : 'N/A'}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${v.customerID > 0}">
                                                                <span class="badge bg-info">ID: ${v.customerID}</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-secondary">Tất cả khách</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${v.status == 'Chưa sử dụng'}">
                                                                <span class="badge bg-success">Chưa sử dụng</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-danger">Đã sử dụng</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="text-center">
                                                        <button class="btn btn-sm btn-outline-primary me-1" onclick="openEditModal(${v.voucherId}, '${v.code}', ${v.discountAmount}, '${fn:escapeXml(v.description)}', '${v.status}', ${v.customerID})" title="Chỉnh sửa">
                                                            <i class="bi bi-pencil-square"></i>
                                                        </button>
                                                        <button class="btn btn-sm btn-outline-danger" onclick="confirmDelete(${v.voucherId})" title="Xóa">
                                                            <i class="bi bi-trash"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Modal Create/Edit Voucher -->
        <div class="modal fade" id="voucherModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title fw-bold text-white" id="modalTitle"><i class="bi bi-ticket-perforated"></i> Tạo Voucher</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="manageVoucher" method="POST">
                        <div class="modal-body">
                            <input type="hidden" name="action" id="formAction" value="add">
                            <input type="hidden" name="voucherId" id="voucherId">
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold">Mã Code (Tự động in hoa)</label>
                                <input type="text" class="form-control" name="code" id="code" required placeholder="VD: SUMMER2024" style="text-transform: uppercase;">
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Số tiền giảm (VND)</label>
                                <input type="number" class="form-control" name="discountAmount" id="discountAmount" required min="1000" step="1000" placeholder="VD: 50000">
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Mô tả chương trình</label>
                                <textarea class="form-control" name="description" id="description" rows="3" required placeholder="Nhập lý do hoặc mô tả..."></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Gán cho Khách Hàng (Tùy chọn)</label>
                                <select class="form-select" name="customerID" id="customerID">
                                    <option value="">-- Dành cho tất cả khách --</option>
                                    <c:forEach var="c" items="${customers}">
                                        <option value="${c.customerId}">${c.customerName} (ID: ${c.customerId})</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3" id="statusDiv" style="display: none;">
                                <label class="form-label fw-bold">Trạng thái</label>
                                <select class="form-select" name="status" id="status">
                                    <option value="Chưa sử dụng">Chưa sử dụng</option>
                                    <option value="Đã sử dụng">Đã sử dụng</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-warning fw-bold text-dark">Lưu Voucher</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Delete Form -->
        <form id="deleteForm" action="manageVoucher" method="POST" style="display: none;">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="voucherId" id="deleteVoucherId">
        </form>

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="staffAssets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="staffAssets/vendor/tinymce/tinymce.min.js"></script>
        <!-- Template Main JS File -->
        <script src="staffAssets/js/main.js"></script>
        
        <!-- SweetAlert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
            function openAddModal() {
                document.getElementById('modalTitle').innerHTML = '<i class="bi bi-ticket-perforated"></i> Tạo Voucher Mới';
                document.getElementById('formAction').value = 'add';
                document.getElementById('voucherId').value = '';
                document.getElementById('code').value = '';
                document.getElementById('discountAmount').value = '';
                document.getElementById('description').value = '';
                document.getElementById('customerID').value = '';
                document.getElementById('statusDiv').style.display = 'none';
            }

            function openEditModal(id, code, discount, desc, status, customerId) {
                document.getElementById('modalTitle').innerHTML = '<i class="bi bi-pencil-square"></i> Cập nhật Voucher';
                document.getElementById('formAction').value = 'edit';
                document.getElementById('voucherId').value = id;
                document.getElementById('code').value = code;
                document.getElementById('discountAmount').value = discount;
                document.getElementById('description').value = desc;
                document.getElementById('customerID').value = customerId == 0 ? '' : customerId;
                document.getElementById('status').value = status;
                document.getElementById('statusDiv').style.display = 'block';
                
                var myModal = new bootstrap.Modal(document.getElementById('voucherModal'));
                myModal.show();
            }

            function confirmDelete(id) {
                Swal.fire({
                    title: 'Xóa Voucher này?',
                    text: "Hành động này không thể hoàn tác!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: 'Có, xóa ngay!',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('deleteVoucherId').value = id;
                        document.getElementById('deleteForm').submit();
                    }
                })
            }
        </script>
    </body>
</html>
