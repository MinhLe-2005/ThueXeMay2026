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
        <title>Manage Staff</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        

        <style type="text/css">
            body {
                margin-top: 20px;
                background: #f8f8f8
            }

            .info label {
                font-style: italic;
                width: 20%;
                font-weight: 500;
            }

            .close:hover {
                opacity: 0.8;
                background: lightgray;
            }

            .fa-toggle-on:before {
                color: blue;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/includes/staff/header-staff.jsp" />
        <jsp:include page="/includes/staff/sidebar.jsp" />
        <div class="container">
            <div class="pagetitle" style="margin-bottom: 20px; margin-top: 20px;">
                <h1 style="color: #1a1816; font-weight: 800; font-size: 24px; text-transform: uppercase; margin-top: 0; margin-bottom: 5px; font-family: 'Tahoma', sans-serif;">QUẢN LÝ NHÂN VIÊN</h1>
                <nav>
                    <ol class="breadcrumb" style="background: transparent; padding: 0; margin: 0; font-size: 14px;">
                        <li class="breadcrumb-item"><a href="homeStaff" target="_top" style="color: #b59349; text-decoration: none; font-weight: 600;">Trang chủ</a></li>
                        <li class="breadcrumb-item active" style="font-weight: 500; color: #6c757d;">Quản lý nhân viên</li>
                    </ol>
                </nav>
            </div>
            <div class="row flex-lg-nowrap">
                <div style="margin-top: 2rem" class="col col-lg">
                    <div>
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" id="customer-tab" data-bs-toggle="tab" href="#customer">Thông tin nhân viên</a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content mt-3">
                        <div id="customer" class="tab-pane fade show active">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Làm TỐT</span><small class="px-1">cuối tháng tăng lương</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Họ và tên</th>
                                                        <th>Tên đăng nhập</th>
                                                        <th>Ngày sinh</th>
                                                        <th>Điện thoại</th>
                                                        <th> </th>
                                                        <th>Trạng thái</th>
                                                        <th>Thao tác</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="customer-table-body">
                                                    <c:if test="${empty sessionScope.accountStaff}">
                                                        <tr>
                                                            <td colspan="8" style="text-align: center; font-style: italic; padding: 18px; font-size: 17px;">
                                                                Không có thông tin nào ở đây
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                    <c:forEach var="account" items="${sessionScope.accountStaff}">
                                                        <tr id="account-${account.accountId}" data-account-id="${account.accountId}"
                                                            class="m-3 <c:out value='${account.roleID == 2 ? "active" : "disabled"}' />">
                                                            <td style="padding: 24px;" name="accountId" class="align-middle">${account.accountId}</td>                                                            <td name="fullname" class="text-nowrap align-middle">${account.firstName} ${account.lastName}</td>
                                                            <td name="username" class="text-nowrap align-middle">${account.userName}</td>
                                                            <td name="dob" class="text-nowrap align-middle">${account.dob}</td>
                                                            <td name="phoneNumber" class="text-nowrap align-middle">${account.phoneNumber}</td>
                                                            <td class="text-center align-middle">
                                                                <i id="toggle-icon-${account.accountId}" class="fa fa-fw text-secondary cursor-pointer 
                                                                   ${account.roleID == 2 ? 'fa-toggle-on' : 'fa-toggle-off'}"></i>
                                                            </td>
                                                            <td class="text-center align-middle" >
                                                                <form id="form-${account.accountId}" action="manageStaff" method="post">
                                                                    <input type="hidden" name="action" value="updateRoleAndGetStatuses">
                                                                    <input type="hidden" name="accountId" value="${account.accountId}">
                                                                    <input type="hidden" name="isActive" value="${account.roleID != 2}">
                                                                    <button style="width: 74px;" type="button" class="btn btn-sm btn-outline-secondary" onclick="showConfirmModal(${account.accountId}, ${account.roleID == 2})">Cập nhật</button>
                                                                </form>
                                                            </td>
                                                            <td class="text-center align-middle">
                                                                <div class="btn-group align-top">
                                                                    <button class="btn btn-sm btn-outline-secondary edit-btn" type="button"
                                                                            data-toggle="modal" data-target="#user-form-modal"
                                                                            data-accountId="${account.accountId}"
                                                                            data-fullName="${account.firstName} ${account.lastName}"
                                                                            data-dob="${account.dob}"
                                                                            data-email="${account.email}"
                                                                            data-address="${account.address}"
                                                                            data-gender="${account.gender}"
                                                                            data-phoneNumber="${account.phoneNumber}"
                                                                            data-image="${account.image}"
                                                                            data-username="${account.userName}"
        
                                                                            data-bookingCount="${bookingCount[account.accountId]}"
                                                                            onclick="openUserModal(this)">
                                                                        Xem
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
                        </div>

                        <div id="overdue" class="tab-pane fade">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Làm TỐT</span><small class="px-1">cuối tháng tăng lương</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Họ và tên</th>
                                                        <th>Tên đăng nhập</th>
                                                        <th>Điện thoại</th>
                                                        <th>Đơn hàng </th>
                                                        <th>Hạn cuối</th>
                                                        <th scope="col">Quá hạn</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="customer-table-body">
                                                    <c:if test="${empty sessionScope.accountStaff}">
                                                        <tr>
                                                            <td colspan="8" style="text-align: center; font-style: italic; padding: 18px; font-size: 17px;">
                                                                Không có thông tin nào ở đây
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                    <c:forEach var="entry" items="${sessionScope.accountBookingMap}">
                                                        <c:set var="accountK" value="${entry.key}" />
                                                        <c:set var="bookingK" value="${entry.value}" />
                                                       
                                                        <tr>
                                                            <td style="padding: 24px;" name="accountId" class="align-middle">${accountK.accountId}</td>
                                                            <td name="fullname" class="text-nowrap align-middle">${accountK.firstName} ${accountK.lastName}</td>
                                                            <td name="username" class="text-nowrap align-middle">${accountK.userName}</td>
                                                            <td name="phoneNumber" class="text-nowrap align-middle">${accountK.phoneNumber}</td>
                                                            <td name="bookingId" class="text-nowrap align-middle">${bookingK.bookingID}</td>
                                                            <td name="endDate" class="text-nowrap align-middle">${bookingK.endDate}</td>
                                                            <td name="overdueDays" class="text-danger fw-bold text-nowrap align-middle">${bookingK.overdueDays} </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- modal để hiển thị thông báo confirm chuyển trạng thái -->
                    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="confirmModalLabel">Xác nhận</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body" id="confirmModalMessage">
                                    <!-- Message will be set by JavaScript -->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                                    <button type="button" id="confirmModalYesButton" class="btn btn-primary">Có</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- modal để hiển thị thông tin chi tiết -->
                    <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div style="padding: 10px 16px;" class="modal-header">
                                    <h5 class="modal-title">Thông tin nhân viên</h5>
                                    <button style="border: 1px solid #000" onclick="closeDetail()" type="button" class="btn close" data-dismiss="modal">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div style="padding-top: 0px" class="info modal-body">.
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="profile-image" style="position: relative; width: 150px; height: 150px;">
                                                    <img id="modal-image" alt="Profile Image" style="width: 120%; height: 120%; border-radius: 50%; object-fit: cover;">
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="col-md-12 mb-4">
                                                        <label>Họ và tên:</label>
                                                        <p style="display: inline;" id="modal-full-name"></p>
                                                    </div>
                                                    <div class="col-md-12 mb-4">
                                                        <label>Ngày sinh: </label>
                                                        <p style="display: inline;" id="modal-dob"></p>
                                                    </div>
                                                    <div class="col-md-12 mb-4">
                                                        <label>Email: </label>
                                                        <p style="display: inline;" id="modal-email"></p>
                                                    </div>
                                                    <div class="col-md-12  mb-4">
                                                        <label>Địa chỉ: </label>
                                                        <p style="display: inline;" id="modal-address"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-4 mt-3">
                                                <div class="col-md-4 text-center">
                                                    <label style="min-width: 100px;">Giới tính</label>
                                                    <p id="modal-gender"></p>
                                                </div>
                                                <div class="col-md-4 text-center">
                                                    <label style="min-width: 100px;">Số điện thoại</label>
                                                    <p id="modal-phone-number"></p>
                                                </div>
                                                <div class="col-md-4 text-center">
                                                    <label style="min-width: 120px;">Tên đăng nhập</label>
                                                    <p id="modal-username"></p>
                                                </div>
                                            </div>
                                        </div>
                                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                       
                </div>
                <div style="width: 18%; margin-top: 137px;" class="col-12 col-lg-3 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <hr class="my-4>
                                <div class="e-navlist e-navlist--active-bold">
                            <ul class="nav" id="navList">
                                <li class="nav-item">
                                    <a class="nav-link" data-status="all">
                                        <span>Tất cả</span>&nbsp;<small>/&nbsp;<span id="allCount">${allCountStaff}</span></small>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-status="active">
                                        <span>Hoạt động</span>&nbsp;<small>/&nbsp;<span id="activeCount">${activeCountStaff}</span></small>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-status="disabled">
                                        <span>Vô hiệu hóa</span>&nbsp;<small>/&nbsp;<span id="disabledCount">${disabledCountStaff}</span></small>
                                    </a>
                                </li>
                            </ul>
                            <hr class="my-4">
                            <div>
                                <label>Trạng thái: </label>
                                <div class="px-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="user-status" id="users-status-any" value="all" checked>
                                        <label class="custom-control-label" for="users-status-any">Tất cả</label>
                                    </div>
                                </div>
                                <div class="px-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="user-status" id="users-status-active" value="active">
                                        <label class="custom-control-label" for="users-status-active">Hoạt động</label>
                                    </div>
                                </div>
                                <div class="px-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="user-status" id="users-status-disabled" value="disabled">
                                        <label class="custom-control-label" for="users-status-disabled">Vô hiệu hóa</label>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <hr class="my-3">
                    <form action="searchCustomer" method="post">
                        <div>
                            <div class="form-group fst-italic">
                                <label>Tìm kiếm qua Tên đăng nhập: </label>
                                <div><input name="username" class="form-control w-100" type="text" placeholder="Username" value>
                                </div>
                            </div>
                            <div class="form-group fst-italic">
                                <label>Tìm kiếm qua Tên:</label>
                                <div><input name="name" class="form-control w-100" type="text" placeholder="Name" value>
                                </div>
                            </div>
                            <div class="mt-2">
                                <button class="btn btn-secondary w-100" type="submit" value="Search">Tìm kiếm</button>
                            </div>
                        </div>
                    </form>
                    <div class="mt-2 d-flex flex-column align-items-center"></div>
                </div>
            </div>         
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
                                        function openUserModal(button) {
                                            var modal = $('#user-form-modal');
                                            var accountId = button.getAttribute('data-accountId');
                                            modal.find('#modal-full-name').text(button.getAttribute('data-fullName'));
                                            modal.find('#modal-dob').text(button.getAttribute('data-dob'));
                                            modal.find('#modal-email').text(button.getAttribute('data-email'));
                                            modal.find('#modal-address').text(button.getAttribute('data-address'));
                                            modal.find('#modal-gender').text(button.getAttribute('data-gender'));
                                            modal.find('#modal-image').attr('src', button.getAttribute('data-image'));
                                            modal.find('#modal-phone-number').text(button.getAttribute('data-phoneNumber'));
                                            modal.find('#modal-username').text(button.getAttribute('data-username'));                                         
                                            modal.find('#modal-id-card-type').text(button.getAttribute('data-idCardType'));
                                            $('#user-form-modal').modal('show'); //boostrap jqs
                                        }

                                        function closeDetail()
                                        {
                                            $('#user-form-modal').modal('hide');
                                        }

                                        document.addEventListener("DOMContentLoaded", function () {
                                            const navLinks = document.querySelectorAll("#navList .nav-link");
                                            navLinks.forEach(link => {
                                                link.addEventListener("click", function (e) {
                                                    e.preventDefault();
                                                    filterTableByStatus(link.getAttribute("data-status"));
                                                });
                                            });

                                            const radioButtons = document.querySelectorAll('input[name="user-status"]');
                                            radioButtons.forEach(button => {
                                                button.addEventListener("change", function () {
                                                    filterTableByStatus(this.value);
                                                });
                                            });
                                        });

                                        function filterTableByStatus(status) {
                                            const rows = document.querySelectorAll("#customer-table-body tr");
                                            rows.forEach(row => {
                                                if (status === "all") {
                                                    row.style.display = "";
                                                } else if (status === "active" && row.classList.contains("active")) {
                                                    row.style.display = "";
                                                } else if (status === "disabled" && row.classList.contains("disabled")) {
                                                    row.style.display = "";
                                                } else {
                                                    row.style.display = "none";
                                                }
                                            });
                                        }
                                        let formToSubmit;

                                        function showConfirmModal(accountId, isActive) {
                                            formToSubmit = document.getElementById('form-' + accountId);
                                            document.getElementById('confirmModalMessage').innerText = isActive ?
                                                    "Bạn có chắc chắn muốn vô hiệu hóa tài khoản này không?" :
                                                    "Bạn có chắc chắn muốn mở tài khoản này không?";
                                            $('#confirmModal').modal('show');
                                        }

                                        document.getElementById('confirmModalYesButton').addEventListener('click', function () {
                                            if (formToSubmit) {
                                                formToSubmit.submit();
                                            } else {
                                                console.error("Form to submit is null"); // Log lỗi nếu formToSubmit không có giá trị
                                            }
                                        });
    </script>
</body>
</html>
