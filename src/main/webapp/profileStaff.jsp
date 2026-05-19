<%-- 
    Document   : profileStaff
    Created on : May 25, 2024, 5:50:03 PM
    Author     : DiepTCNN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Thông tin cá nhân</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                font-family: 'Tahoma', sans-serif;
                margin-top: 20px;
                background: #f8f8f8
            }
            .input-wrapper {
                position: relative;
            }
            .input-wrapper input {
                width: 100%;
                height: 36px;
            }
            .input-wrapper span {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                cursor: pointer;
                font-size: 20px;
            }
            .red {
                color: red;
            }

            .orange {
                color: orange;
            }

            .green {
                color: green;
            }
            .password-strength {
                font-style: italic;
            }
        </style>
    </head>

    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">



        <jsp:include page="/includes/staff/header-staff.jsp" />
        <jsp:include page="/includes/staff/sidebar.jsp" />

        <div style="max-width: 960px; margin-top: 5rem" class="container">
            <div class="row flex-lg-nowrap">
                <div class="col">
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <div class="card">
                                <div style="padding: 20px" class="card-body">
                                    <div class="e-profile">
                                        <div class="row">
                                            <div class="col-12 col-sm-auto mb-3">
                                                <div class="mx-auto" style="width: 140px;">
                                                    <div class="d-flex justify-content-center align-items-center rounded"
                                                         style="height: 140px; background-color: rgb(233, 236, 239);">
                                                        <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">
                                                            <img style="object-fit: cover;" src="${account.image}" width="140px" height="140px" alt="alt"/>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                                <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                    <input hidden name="accountID" value="${account.accountId}">
                                                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${account.firstName} ${account.lastName}</h4>
                                                    <p class="mb-0">${account.email}</p>                                                 
                                                </div>
                                                <div class="text-center text-sm-right">
                                                    <span class="badge badge-secondary">Nhân viên</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- điều hướng -->
                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link active" id="settings-tab" data-bs-toggle="tab" data-bs-target="#settings" 
                                                        type="button" role="tab" aria-controls="settings" aria-selected="true">Thông tin cá nhân</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="change-password-tab" data-bs-toggle="tab" data-bs-target="#change-password" 
                                                        type="button" role="tab" aria-controls="change-password" aria-selected="false">Đổi mật khẩu</button>
                                            </li>
                                        </ul>
                                        <div class="mt-3 tab-content" id="myTabContent">
                                            <div class="tab-pane fade show active" id="settings" role="tabpanel" aria-labelledby="settings-tab">
                                                <form action="updateprofile" method="post" id="form-update" class="row">
                                                    <input hidden name="accountID" value="${account.accountId}">
                                                    <input hidden name="roleID" value="${account.roleID}">

                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div id="account-fullname" class="col">
                                                                    <div class="form-group">
                                                                        <label for="account-fullname">Họ và tên</label>
                                                                        <input style="border: 1px solid #000;" class="form-control" name="fullname" type="text" id="account-fullname" value="${account.firstName} ${account.lastName}" readonly>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col"  id="account-firstname" style="display: none;">
                                                                    <div class="form-group">
                                                                        <label for="account-firstname">Họ, Tên đệm</label>
                                                                        <input style="border: 1px solid #000;" class="form-control" name="firstname" type="text" id="account-firstname" value="${account.firstName}">
                                                                    </div>
                                                                </div>
                                                                <div class="col" id="account-lastname" style="display: none;">
                                                                    <div class="form-group">
                                                                        <label for="account-lastname">Tên</label>
                                                                        <input style="border: 1px solid #000;" class="form-control" name="lastname" type="text" id="account-lastname" value="${account.lastName}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label for="account-address">Địa chỉ</label>
                                                                        <input style="border: 1px solid #000;" class="form-control" name="address" type="text" id="account-address" value="${account.address}" readonly>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label for="account-email">Email</label>
                                                                        <input style="border: 1px solid #000;" class="form-control" name="email" type="email" id="account-email" value="${account.email}" readonly>
                                                                        <span class="password-strength" id="email-text"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label for="account-phone">Số điện thoại</label>
                                                                        <input style="border: 1px solid #000;" class="form-control" name="phonenumber" type="text" id="account-phone" value="${account.phoneNumber}" readonly>
                                                                        <span class="password-strength" id="numphone-text"></span>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label for="account-username">Tên đăng nhập</label>
                                                                        <input style="border: 1px solid #000;" class="form-control" name="username" type="text" id="account-username" value="${account.userName}" readonly>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label for="account-gender">Giới tính</label>
                                                                        <select style="border: 1px solid #000;" class="form-control" name="gender" id="account-gender" disabled>
                                                                            <option value="Nam" ${account.gender == "Nam" ? 'selected' : ''}>Nam</option>
                                                                            <option value="Nữ" ${account.gender == "Nữ" ? 'selected' : ''}>Nữ</option>
                                                                            <option value="Không muốn tiết lộ" ${account.gender == "Không muốn tiết lộ" ? 'selected' : ''}>Không muốn tiết lộ</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label for="account-dob">Ngày sinh</label>
                                                                        <input style="border: 1px solid #000;" class="form-control" name="dob" type="date" id="account-dob" value="${account.dob}" readonly>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col d-flex justify-content-between">
                                                            <button onclick="changeType(this)" id="update" class="btn btn-style-1 btn-primary" 
                                                                    type="button">Cập nhật</button>
                                                            <c:if test="${not empty requestScope.mess}">
                                                                <h6 style="color: green; padding-top: 12px;">${mess}</h6>
                                                            </c:if>
                                                            <c:if test="${not empty requestScope.errorProfile}">
                                                                <h6 style="color: red; padding-top: 12px;">${requestScope.errorProfile}</h6>
                                                            </c:if>                                                       
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="tab-pane fade" id="change-password" role="tabpanel" aria-labelledby="change-password-tab">
                                                <form action="changepassword" method="post" name="signupForm" id="signupForm">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="current-password">Mật khẩu hiện tại</label>
                                                                <input hidden value="${account.passWord}" id="currentpass">
                                                                <div class="input-wrapper">
                                                                    <input type="password" id="password" name="password" required>
                                                                    <span id="password-eye-2" onclick="showPassword('password')">
                                                                        <i class="ri-eye-off-line"></i>
                                                                    </span>
                                                                </div>
                                                                <span class="password-strength" id="password-text"></span>

                                                            </div>
                                                            <div class="form-group">
                                                                <label for="new-password">Mật khẩu mới</label>
                                                                <div class="input-wrapper">
                                                                    <input type="password" id="newPassword" name="newPassword" required>
                                                                    <span id="password-eye-2" onclick="showPassword('newPassword')">
                                                                        <i class="ri-eye-off-line"></i>
                                                                    </span>
                                                                </div>
                                                                <span class="password-strength" id="password-strength"></span>

                                                            </div>
                                                            <div class="form-group">
                                                                <label for="confirm-password">Xác nhận mật khẩu mới</label>
                                                                <div class="input-wrapper">
                                                                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                                                                    <span id="password-eye-2" onclick="showPassword('confirmPassword')">
                                                                        <i class="ri-eye-off-line"></i>
                                                                    </span>
                                                                </div>
                                                                <span class="password-strength" id="password-confirmText"></span>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col d-flex justify-content-between">
                                                            <button class="btn btn-primary" type="submit">Đổi mật khẩu</button>
                                                            <c:if test="${not empty requestScope.errorPass}">
                                                                <h6 style="color: red; padding-top: 12px;">${errorPass}</h6>
                                                            </c:if>
                                                            <c:if test="${not empty requestScope.successChange}">
                                                                <h6 style="color: green; padding-top: 12px;">${successChange}</h6>
                                                            </c:if>         
                                                        </div>
                                                    </div>
                                                </form>
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

        <script>
            function changeType(button) {
                var inputElements = document.querySelectorAll(".form-control");
                if (button.id === "update") {
                    button.id = "save";
                    button.textContent = "Lưu";
                    inputElements.forEach(x => {
                        if (x.name !== "pass" && x.id !== "account-fullname" && x.id !== "account-username") {
                            x.readOnly = false;

                        }
                    });
                    document.getElementById('account-gender').disabled = false;
                    document.getElementById('account-firstname').style.display = 'block';
                    document.getElementById('account-lastname').style.display = 'block';
                    document.getElementById('account-fullname').style.display = 'none';
                } else {
                    document.getElementById("form-update").submit();
                    button.id = "update";
                    button.textContent = "Cập nhật";
                    inputElements.forEach(x => {
                        if (x.name !== "pass") {
                            x.readOnly = true;
                        }
                    });
                    document.getElementById('account-gender').disabled = true;
                    document.getElementById('account-firstname').style.display = 'none';
                    document.getElementById('account-lastname').style.display = 'none';
                    document.getElementById('account-fullname').style.display = 'block';
                }
            }
            function showPassword(inputId) {
                const passInput = document.getElementById(inputId);
                const icon = passInput.nextElementSibling.querySelector('i');
                if (passInput.type === 'password') {
                    passInput.type = 'text';
                    icon.className = 'ri-eye-line';
                } else {
                    passInput.type = 'password';
                    icon.className = 'ri-eye-off-line';
                }
            }
            // thay vì dùng ajax thì tớ dùng localStorage
            document.addEventListener("DOMContentLoaded", function () {
                const myTab = document.getElementById('myTab');
                // lấy giá trị của 'activeTab' từ localStorage
                const activeTab = localStorage.getItem('activeTab'); // có sẵn
                if (activeTab) {
                    const tabTrigger = new bootstrap.Tab(document.querySelector('#' + activeTab));
                    tabTrigger.show();
                }

                myTab.addEventListener('click', function (event) {
                    // kiểm tra event.target có tồn tại và là button không
                    if (event.target && event.target.nodeName === 'BUTTON') {
                        // lưu id của tab hiện tại vào localStorage
                        localStorage.setItem('activeTab', event.target.id);
                    }
                });
            });

            const passwordInput = document.getElementById("newPassword");
            const passwordStrength = document.getElementById("password-strength");
            const passwordText = document.getElementById("password-text");
            const currentPass = document.getElementById("currentpass");
            const valuePass = document.getElementById("password");
            const confirmPass = document.getElementById("confirmPassword");
            const passwordconfirmText = document.getElementById("password-confirmText");
            //check mk hiện tại
            valuePass.addEventListener("input", () => {
                if (valuePass.value !== currentPass.value) {
                    passwordText.textContent = "Mật khẩu hiện tại không đúng";
                    passwordText.className = "password-strength red";
                } else {
                    passwordText.textContent = "";
                }
            });
            //check password
            passwordInput.addEventListener("input", () => {
                const password = passwordInput.value;
                if (password.length >= 12) {
                    passwordStrength.textContent = "Mật khẩu mạnh";
                    passwordStrength.className = "password-strength green";
                } else if (password.length >= 9) {
                    passwordStrength.textContent = "Mật khẩu vừa";
                    passwordStrength.className = "password-strength orange";
                } else if (password.length >= 6) {
                    passwordStrength.textContent = "Mật khẩu yếu";
                    passwordStrength.className = "password-strength red";
                } else if (password.length > 0) {
                    passwordStrength.textContent = "Mật khẩu phải 6 ký tự trở lên";
                    passwordStrength.className = "password-strength red";
                } else {
                    passwordStrength.textContent = "";
                }
                passwordStrength.style.display = password.length > 0 ? "block" : "none";
            });
            //check newpass = confirmpass
            confirmPass.addEventListener("input", () => {
                if (confirmPass.value !== passwordInput.value) {
                    passwordconfirmText.textContent = "Mật khẩu mới và mật khẩu xác nhận không khớp";
                    passwordconfirmText.className = "password-strength red";
                } else {
                    passwordconfirmText.textContent = "";
                }
            });

            const emailInput = document.getElementById("account-email");
            const emailText = document.getElementById("email-text");
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            const phoneInput = document.getElementById("account-phone");
            const phoneText = document.getElementById("numphone-text");
            const phoneRegex = /^0\d{9}$/;

            //check email
            const validEmail = () => {
                if (emailInput.value.trim() !== "") {
                    if (emailRegex.test(emailInput.value)) {
                        emailText.textContent = "";
                        emailText.className = "";
                    } else {
                        emailText.textContent = "Email chưa đúng format.";
                        emailText.className = "password-strength red";
                    }
                } else {
                    if (emailInput.value.trim() === "") {
                        emailText.textContent = "Không được để trống email.";
                        emailText.className = "password-strength red";
                    } else {
                        emailText.textContent = "";
                        emailText.className = "";
                    }
                }
            };

            //check sdt
            const validPhone = () => {
                if (phoneRegex.test(phoneInput.value)) {
                    phoneText.textContent = "";
                    phoneText.className = "";
                } else {
                    phoneText.textContent = "Số điện thoại phải có 10 số, và bắt đầu bằng số 0.";
                    phoneText.className = "password-strength red";
                }
            };
            emailInput.addEventListener("input", validEmail);
            phoneInput.addEventListener("input", validPhone);
        </script>
    </body>
</html>
