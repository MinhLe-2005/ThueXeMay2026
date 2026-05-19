<%-- 
    Document   : registerStaff
    Created on : Jun 19, 2024, 7:31:11 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Tài Khoản</title>
    <!-- Include Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Include RemixIcon for icons -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css" rel="stylesheet">
    <!-- Custom Styles -->
    <style>
        .eye {
            position: relative;
            width: 100%;
        }
        .eye span {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="relative sm:max-w-md w-full">
        <div class="card bg-blue-400 shadow-lg w-full h-full rounded-3xl absolute transform -rotate-6"></div>
        <div class="card bg-green-400 shadow-lg w-full h-full rounded-3xl absolute transform rotate-6"></div>
        <div class="relative w-full rounded-3xl px-6 py-4 bg-gray-100 shadow-md">
            <label for="" class="block mt-3 text-sm text-gray-700 text-center font-semibold">
                Đăng Ký Tài Khoản
            </label>
            <form action="register" method="post" class="mt-10">

                <!-- First Name -->
                <div class="mb-4">
                    <input type="text" name="firstname" placeholder="Nhập Tên" required
                           class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                </div>

                <!-- Last Name -->
                <div class="mb-4">
                    <input type="text" name="lastname" placeholder="Nhập Họ" required
                           class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                </div>

                <!-- Gender -->
                <div class="mb-4">
                    <select id="gender" name="gender" required
                            class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                        <option value="male">Nam</option>
                        <option value="female">Nữ</option>
                        <option value="unknown">Không Xác Định</option>
                    </select>
                </div>

                <!-- Phone -->
                <div class="mb-4">
                    <input type="text" name="phone" id="phone" placeholder="Nhập Số Điện Thoại" required
                           class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                    <div id="phone-error" class="text-red-600 mt-2"></div>
                </div>

                <!-- Date of Birth -->
                <div class="mb-4">
                    <input type="date" name="dob" placeholder="Nhập Ngày/Tháng/Năm Sinh" required
                           class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                </div>

                <!-- Address -->
                <div class="mb-4">
                    <input type="text" name="address" placeholder="Nhập Địa Chỉ" required
                           class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                </div>

                <!-- Email -->
                <div class="mb-4">
                    <input type="email" name="email" placeholder="Nhập Email" required
                           class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                </div>

                <!-- Username -->
                <div class="mb-4">
                    <input type="text" name="username" placeholder="Nhập Tên Tài Khoản" required
                           class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                </div>

                <!-- Password -->
                <div class="mb-4 relative eye">
                    <input type="password" name="password" id="password" placeholder="Nhập Mật Khẩu" required
                           class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                    <span id="password-eye-1" class="absolute inset-y-0 right-3 flex items-center">
                        <i class="ri-eye-off-line"></i>
                    </span>
                </div>

                <!-- Confirm Password -->
                <div class="mb-4 relative eye">
                    <input type="password" name="passwordConfirmation" id="passwordConfirmation" placeholder="Nhập Lại Mật Khẩu" required
                           class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
                    <span id="password-eye-2" class="absolute inset-y-0 right-3 flex items-center">
                        <i class="ri-eye-off-line"></i>
                    </span>
                </div>

                <!-- Error Message Placeholder -->
                <div style="color: red; margin-left:30px;">${info}</div><br>

                <!-- Submit Button -->
                <button type="submit" name="register-submit" id="register-submit"
                        class="bg-blue-500 w-full py-3 rounded-xl text-white shadow-xl hover:shadow-inner focus:outline-none transition duration-500 ease-in-out transform hover:-translate-x hover:scale-105">
                    Tạo Tài Khoản
                </button>
            </form>
        </div>
    </div>

    <!-- JavaScript for show/hide password functionality -->
    <script>
        document.getElementById('password-eye-1').addEventListener('click', function () {
            const passwordInput = document.getElementById('password');
            const icon = this.querySelector('i');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.replace('ri-eye-off-line', 'ri-eye-line');
            } else {
                passwordInput.type = 'password';
                icon.classList.replace('ri-eye-line', 'ri-eye-off-line');
            }
        });

        document.getElementById('password-eye-2').addEventListener('click', function () {
            const passwordInput = document.getElementById('passwordConfirmation');
            const icon = this.querySelector('i');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.replace('ri-eye-off-line', 'ri-eye-line');
            } else {
                passwordInput.type = 'password';
                icon.classList.replace('ri-eye-line', 'ri-eye-off-line');
            }
        });

        // Optional: Add client-side validation for the phone number
        document.getElementById('phone').addEventListener('input', function () {
            const phoneInput = this.value;
            const phoneError = document.getElementById('phone-error');
            const phonePattern = /^[0-9]{10,12}$/; // Adjust the pattern as needed
            if (!phonePattern.test(phoneInput)) {
                phoneError.textContent = "Số điện thoại không hợp lệ.";
            } else {
                phoneError.textContent = "";
            }
        });
    </script>
</body>
</html>
