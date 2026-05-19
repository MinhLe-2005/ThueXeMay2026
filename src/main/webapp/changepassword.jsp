<%-- 
    Document   : changepassword
    Created on : 2 thg 6, 2024, 12:33:57
    Author     : MINH TUAN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thay đổi mật khẩu</title>
        <link rel="stylesheet" href="./fonts/themify-icons-font/themify-icons/themify-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet" />
        <style type="text/css">
            body {
                margin: 0;
                padding: 0;
                height: 100vh;
                background: url('https://powersports.honda.com/-/media/products/segment/street/sport/category-mp/hero/desktop/2024/sport-segment-hero-01-2400x1350.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Poppins', sans-serif;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #1C1D22;
            }
            .mainDiv {
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: rgba(249, 249, 249, 0.3);
                font-family: 'Open Sans', sans-serif;
                overflow: hidden;
            }
            .cardStyle {
                width: 500px;
                border-color: white;
                background: #fff;
                padding-bottom: 30px;
                border-radius: 4px;
                box-shadow: 0px 0 2px 0 rgba(0,0,0,0.25);
                transform: translateY(-170px);
                transition: transform 0.3s ease-out, opacity 0.8s ease-out;
            }
            .cardStyle.visible {
                opacity: 0.9;
                transform: translateY(0);
            }
            #signupLogo {
                max-height: 200px;
                margin: auto;
                display: flex;
                flex-direction: column;

            }
            .formTitle {
                font-weight: 600;
                margin-top: 20px;
                color: #2F2D3B;
                text-align: center;
            }
            .inputLabel {
                font-size: 13px;
                margin-bottom: 6px;
                margin-top: 24px;
            }
            .inputDiv {
                width: 70%;
                display: flex;
                flex-direction: column;
                margin: auto;
            }
            input {
                height: 40px;
                font-size: 16px;
                border-radius: 4px;
                border: none;
                border: solid 1px #ccc;
                padding: 0 11px;
            }
            input:disabled {
                cursor: not-allowed;
                border: solid 1px #eee;
            }
            .password-eye {
                position: absolute;
                right: 88px;
                top: 54%;
                bottom: 288px;
                transform: translateY(-50%);
                cursor: pointer;
                font-size: 23px;
            }
            .buttonWrapper {
                margin-top: 40px;
            }
            .submitButton:hover{
                background: linear-gradient(243.4deg, rgb(0, 132, 255) 13%, rgb(8, 126, 120) 98%) !important;
            }
            .submitButton {
                width: 70%;
                height: 40px;
                margin-left:  84px ;
                display: block;
                color: #fff;
                background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                border: none;
                text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
                box-shadow: 0 2px 0 rgba(0, 0, 0, 0.035);
                border-radius: 4px;
                font-size: 14px;
                cursor: pointer;
            }
            .submitButton:disabled,
            button[disabled] {
                border: 1px solid #cccccc;
                background-color: #cccccc;
                color: #666666;
            }
            #loader {
                position: absolute;
                z-index: 1;
                margin: -2px 0 0 10px;
                border: 4px solid #f3f3f3;
                border-radius: 50%;
                border-top: 4px solid #666666;
                width: 14px;
                height: 14px;
                -webkit-animation: spin 2s linear infinite;
                animation: spin 2s linear infinite;
            }
            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }
            .input-wrapper {
                position: relative;
                display: inline-block;
            }
            .input-wrapper input {
                width: 100%;
            }
            .input-wrapper span {
                position: absolute;
                top: 50%;
                right: -10px;
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
            .text-error {
                font-style: italic;
                font-size: 13px;
            }
        </style>
    </head>
    <body>
        <div class="mainDiv">
            <div class="cardStyle" id="changePasswordForm">
                <form action="changepassword" method="post" name="signupForm" id="signupForm">
                    <input type="hidden" value="${account.roleID}" name="roleId" id="roleID">
                    <img src="" id="signupLogo"/>
                    <h1 class="formTitle" style="font-weight: bold;">Thay đổi mật khẩu</h1>
                    <c:if test="${not empty requestScope.errorPass}">
                        <div class="inputDiv" style="text-align: justify;">
                            <p style="color: red;font-size: 14px;margin: 0;font-weight: 600;">${errorPass}</p>
                        </div>
                    </c:if>
                    <c:if test="${not empty requestScope.successChange}">
                        <div class="inputDiv" style="text-align: justify;">
                            <p style="color: green;font-size: 14px;margin: 0;">${successChange}</p>
                        </div>
                    </c:if>
                    <div class="inputDiv">
                        <input type="hidden" value="${account.passWord}" id="currentPassword">
                        <label class="inputLabel" for="password">Mật khẩu hiện tại</label>
                        <div class="input-wrapper">
                            <input type="password" id="password" name="password" required>
                            <span id="password-eye-2" onclick="showPassword('password')">
                                <i class="ri-eye-off-line"></i>
                            </span>
                        </div>
                        <span class="text-error" id="password-text"></span>
                    </div>

                    <div class="inputDiv">
                        <label class="inputLabel" for="newPassword">Mật khẩu mới</label>
                        <div class="input-wrapper">
                            <input type="password" id="newPassword" name="newPassword" required>
                            <span id="password-eye-2" onclick="showPassword('newPassword')">
                                <i class="ri-eye-off-line"></i>
                            </span>
                        </div>
                        <span class="text-error" id="newpassword-text"></span>
                    </div>

                    <div class="inputDiv">
                        <label class="inputLabel" for="confirmPassword">Xác nhận mật khẩu mới</label>
                        <div class="input-wrapper">
                            <input type="password" id="confirmPassword" name="confirmPassword" required>
                            <span id="password-eye-2" onclick="showPassword('confirmPassword')">
                                <i class="ri-eye-off-line"></i>
                            </span>
                        </div>
                        <span class="text-error" id="confirmpassword-text"></span>
                    </div>
                    <div class="buttonWrapper" >
                        <button type="submit" id="submitButton" class="submitButton pure-button pure-button-primary">
                            <span>ĐỔI MẬT KHẨU</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div>
            <a href="settingsProfile.jsp" style="position: absolute; top: 20px; left: 20px; text-decoration: none; color: #000">
                <i style="font-size: 60px;" class="ri-arrow-left-line"></i>
            </a>
        </div>


        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var form = document.getElementById('changePasswordForm');
                setTimeout(function () {
                    form.classList.add('visible');
                }, 100);
            });
            document.getElementById('signupLogo').src = "images/anh4.png";

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
            /////////////////////////////////////////
            const password = document.getElementById("password");
            const passwordText = document.getElementById("password-text");
            const currentPassword = document.getElementById("currentPassword");
            const validPass = () => {
                if (password.value !== currentPassword.value) {
                    passwordText.textContent = "Mật khẩu hiện tại không đúng";
                    passwordText.className = "text-error red";
                } else {
                    passwordText.textContent = "";
                }
            };
            /////////////////////////////////////////
            const newPassword = document.getElementById("newPassword");
            const newPassText = document.getElementById("newpassword-text");
            const newpasswordRegex = /^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/;

            const validnewPass = () => {
                if (newpasswordRegex.test(newPassword.value)) {
                    newPassText.textContent = "";
                    newPassText.className = "";
                } else {
                    newPassText.textContent = "Password phải chứa ít nhất 8 ký tự, bao gồm ít nhất 1 ký tự in hoa và 1 chữ số.";
                    newPassText.className = "text-error red";
                }
            };
            /////////////////////////////////////////
            const confirmPass = document.getElementById("confirmPassword");
            const confirmPassText = document.getElementById("confirmpassword-text");

            const validConfirmPass = () => {
                if (confirmPass.value !== newPassword.value) {
                    confirmPassText.textContent = "Mật khẩu mới và mật khẩu xác nhận không khớp";
                    confirmPassText.className = "text-error red";
                } else {
                    confirmPassText.textContent = "";
                    confirmPassText.className = "";
                }
            };

            password.addEventListener("input", validPass);
            newPassword.addEventListener("input", validnewPass);
            confirmPass.addEventListener("input", validConfirmPass);
        </script>
    </body>
</html>
