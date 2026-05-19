<%-- 
    Document   : profileCus
    Created on : 30 thg 5, 2024, 21:04:50
    Author     : MINH TUAN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Thông tin cá nhân</title>
        <!-- Tailwind CSS -->
        <link href="https://www.loopple.com/css/vendor/tailwind.min.css" rel="stylesheet">
        <link href="https://www.loopple.com/css/tailwind/app.css?v=1.0.0" rel="stylesheet">
        <link href="" id="google-font-url" rel="stylesheet">
        <!-- CSS Links -->
        <link href="css/sidebarProfile.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link href="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/css/nucleo-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/css/soft-ui-dashboard-tailwind.css">
        
<!--         <style>
         #cropImageModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        #cropImageModal .modal-content {
            width: 500px;
            height: 500px;
            background: white;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #crop-image {
            max-width: 100%;
            max-height: 100%;
        }
    </style>-->
    </head>
    <style>
        .red { color: red; }
        .orange { color: orange; }
        .green { color: green; }
        .text-error { font-style: italic; }
        
        /* Simplified Sidebar */
        .sidebar-item {
            padding: 0.75rem 1rem !important;
            margin: 0.2rem 1rem !important;
            display: flex !important;
            align-items: center !important;
            border-radius: 0.5rem !important;
            transition: all 0.2s ease !important;
            color: #1e293b !important; /* Dark Slate-800 for absolute contrast */
            font-weight: 700 !important; /* Bold, highly readable */
            font-size: 0.95rem !important; /* Slightly larger */
            text-decoration: none !important;
        }
        .sidebar-item:hover {
            background-color: #f1f5f9 !important;
            color: #0f172a !important; /* Slate-900 */
        }
        .sidebar-item.active {
            background-color: #fdf8eb !important; /* very light gold */
            color: #854d0e !important; /* Deep Golden Amber for maximum readability */
            font-weight: 800 !important;
        }
        .icon-box {
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            margin-right: 1rem !important;
            width: 32px !important;
            height: 32px !important;
            border-radius: 0.5rem !important;
            background-color: #e2e8f0 !important; /* Deeper gray for contrast */
            color: #334155 !important; /* Slate-700 */
            transition: all 0.2s ease !important;
        }
        .sidebar-item.active .icon-box {
            background-color: #b59349 !important;
            color: #ffffff !important;
        }
        .nav-text {
            font-size: 0.95rem !important;
        }
        .sidebar-heading {
            padding-left: 1.5rem !important;
            font-weight: 800 !important;
            text-transform: uppercase !important;
            font-size: 0.8rem !important; /* Slightly larger */
            color: #475569 !important; /* Slate-600 */
            margin-top: 1.5rem !important;
            margin-bottom: 0.5rem !important;
            letter-spacing: 0.05em !important;
        }
    </style>
    <jsp:include page="/includes/customer/navbar.jsp" />
    <body class="  font-body " data-framework="tailwind">
        <div class="builder-container builder-container-preview font-body">
            <aside class="max-w-62.5 ease-nav-brand z-990 absolute inset-y-0 my-4 ml-4 block w-full -translate-x-full flex-wrap items-center justify-between overflow-y-auto rounded-2xl border-0 p-0 antialiased shadow-none transition-transform duration-200 xl:left-0 xl:translate-x-0 xl:bg-transparent text-slate-500"
                   id="sidenav-main">
                <hr class="h-px mt-0 bg-transparent bg-gradient-horizontal-dark">

                <div style="margin-top: 6rem" class="items-center block w-auto max-h-screen overflow-auto grow basis-full">
                    <ul class="flex flex-col pl-0 mb-0">
                        <li class="w-full">
                            <div class="sidebar-heading">Quản lý thuê xe</div>
                        </li>
                        <li class="w-full"> 
                            <a class="sidebar-item" href="transaction">
                                <div class="icon-box">
                                    <i class="fas fa-credit-card text-xs"></i>
                                </div> 
                                <span class="nav-text">Giao dịch gần đây</span>
                            </a> 
                        </li>
                        <li class="w-full"> 
                            <a class="sidebar-item" href="bookingHistory?status=all">
                                <div class="icon-box">
                                    <i class="fas fa-history text-xs"></i>
                                </div> 
                                <span class="nav-text">Lịch sử thuê xe</span>
                            </a> 
                        </li>
                        <li class="w-full">
                            <div class="sidebar-heading">Quản lý tài khoản</div>
                        </li>
                        <li class="w-full"> 
                            <a class="sidebar-item active" href="profileCustomer.jsp">
                                <div class="icon-box">
                                    <i class="fas fa-user-circle text-xs"></i>
                                </div> 
                                <span class="nav-text">Thông tin cá nhân</span>
                            </a> 
                        </li>
                        <li class="w-full"> 
                            <a class="sidebar-item" href="settingsProfile.jsp">
                                <div class="icon-box">
                                    <i class="fas fa-shield-alt text-xs"></i>
                                </div> 
                                <span class="nav-text">Mật khẩu và bảo mật</span>
                            </a> 
                        </li>
                    </ul>
                </div>
            </aside>
            <div class="ease-soft-in-out xl:ml-68.5 relative h-full max-h-screen rounded-xl transition-all duration-200"
                 id="panel">
                <div class="w-full px-6 py-6 mx-auto drop-zone loopple-min-height-78vh text-slate-500">
                    <div style="padding-top: 8%; width: 96%;" class="pt-8 mx-auto removable">
                        <div class="flex flex-wrap -mx-3 drop-zone">
                            <div class="w-full max-w-full px-3 mb-4 draggable" draggable="true">
                                <div class="relative flex flex-col h-full min-w-0 break-words bg-white border-0 shadow-soft-xl rounded-2xl bg-clip-border overflow-hidden">
                                    
                                    <!-- Main Content container -->
                                    <div class="p-8">
                                        <div class="flex flex-col items-center justify-center mb-8 pb-8 border-b border-slate-100">
                                            
                                            <!-- Profile avatar circle with upload overlay -->
                                            <div class="relative w-32 h-32 rounded-full overflow-hidden border-4 border-slate-50 shadow-md cursor-pointer group flex items-center justify-center bg-slate-100 mb-4" onclick="document.getElementById('image-upload').click()">
                                                <img id="profile-image" class="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105" src="${account.image}?${now.time}" onerror="this.onerror=null; this.src='https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'" alt="Profile Image">
                                                <div class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none">
                                                    <span class="text-white text-xs font-semibold"><i class="fas fa-camera mr-1"></i> Đổi ảnh</span>
                                                </div>
                                            </div>
                                            <input type="file" id="image-upload" class="hidden" accept="image/png, image/jpeg">
                                            
                                            <div class="text-center">
                                                <h3 class="text-2xl font-bold text-slate-800">${account.firstName} ${account.lastName}</h3>
                                                <p class="text-slate-500 font-medium mt-1">@${account.userName} <span class="mx-2">|</span> Khách hàng</p>
                                                <c:if test="${not empty requestScope.mess}">
                                                    <p class="text-emerald-500 text-sm mt-2"><i class="fas fa-check-circle mr-1"></i> ${mess}</p>
                                                </c:if>
                                                <c:if test="${not empty requestScope.errorProfile}">
                                                    <p class="text-rose-500 text-sm mt-2"><i class="fas fa-exclamation-circle mr-1"></i> ${requestScope.errorProfile}</p>
                                                </c:if>
                                            </div>

                                            <!-- Edit Profile Button -->
                                            <button id="editProfileBtn" class="mt-4 px-6 py-2.5 bg-white border border-slate-300 hover:bg-slate-50 text-slate-700 rounded-xl font-bold text-sm transition-all duration-300 shadow-sm flex items-center space-x-2">
                                                <i class="fas fa-user-edit text-slate-500 text-base"></i>
                                                <span>Chỉnh sửa thông tin</span>
                                            </button>
                                        </div>

                                        <!-- Profile details grid -->
                                        <div class="max-w-3xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-y-6 gap-x-12">
                                            
                                            <!-- Box 1 -->
                                            <div class="flex items-start space-x-4">
                                                <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-slate-50 text-slate-400">
                                                    <i class="fas fa-venus-mars text-sm"></i>
                                                </div>
                                                <div>
                                                    <p class="text-xs text-slate-400 font-bold uppercase tracking-wider mb-1">Giới tính</p>
                                                    <p class="text-base text-slate-800 font-semibold">${account.gender != null ? account.gender : 'Chưa cập nhật'}</p>
                                                </div>
                                            </div>

                                            <!-- Box 2 -->
                                            <div class="flex items-start space-x-4">
                                                <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-slate-50 text-slate-400">
                                                    <i class="fas fa-phone-alt text-sm"></i>
                                                </div>
                                                <div>
                                                    <p class="text-xs text-slate-400 font-bold uppercase tracking-wider mb-1">Số điện thoại</p>
                                                    <p class="text-base text-slate-800 font-semibold">${account.phoneNumber != null ? account.phoneNumber : 'Chưa cập nhật'}</p>
                                                </div>
                                            </div>

                                            <!-- Box 3 -->
                                            <div class="flex items-start space-x-4">
                                                <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-slate-50 text-slate-400">
                                                    <i class="fas fa-envelope text-sm"></i>
                                                </div>
                                                <div>
                                                    <p class="text-xs text-slate-400 font-bold uppercase tracking-wider mb-1">Email</p>
                                                    <p class="text-base text-slate-800 font-semibold">${account.email != null ? account.email : 'Chưa cập nhật'}</p>
                                                </div>
                                            </div>

                                            <!-- Box 4 -->
                                            <div class="flex items-start space-x-4">
                                                <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-slate-50 text-slate-400">
                                                    <i class="fas fa-calendar-alt text-sm"></i>
                                                </div>
                                                <div>
                                                    <p class="text-xs text-slate-400 font-bold uppercase tracking-wider mb-1">Ngày sinh</p>
                                                    <p class="text-base text-slate-800 font-semibold">${account.dob != null ? account.dob : 'Chưa cập nhật'}</p>
                                                </div>
                                            </div>

                                            <!-- Box 5 -->
                                            <div class="flex items-start space-x-4 md:col-span-2">
                                                <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-slate-50 text-slate-400">
                                                    <i class="fas fa-map-marker-alt text-sm"></i>
                                                </div>
                                                <div>
                                                    <p class="text-xs text-slate-400 font-bold uppercase tracking-wider mb-1">Địa chỉ</p>
                                                    <p class="text-base text-slate-800 font-semibold">${account.address != null && !account.address.trim().isEmpty() ? account.address : 'Chưa cập nhật'}</p>
                                                </div>
                                            </div>

                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- Footer -->

        <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/chartjs.min.js"></script>
        <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/perfect-scrollbar.min.js"
        async=""></script>
        <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
        <script
            src="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/js/soft-ui-dashboard-tailwind.js"
        async=""></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!-- Modal -->
        <div id="editProfileModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden z-30">
            <div style="width: 56%; margin-top: 5rem" class="bg-white p-8 rounded-lg shadow-lg">
                <h2 class="text-2xl mb-4">Chỉnh sửa thông tin</h2>
                <form action="updateprofile" method="post" id="form-update" class="space-y-4">
                    <input hidden id="accountID" name="accountID" value="${account.accountId}">
                    <input hidden name="roleID" value="${account.roleID}">

                    <div class="flex flex-wrap mb-3">
                        <div class="w-full md:w-1/2 pr-2 mb-3 md:mb-0">
                            <label for="account-firstname" class="font-semibold text-slate-700">Họ <span class="text-red-500">*</span></label>
                            <input required value="${account.firstName}" type="text" id="account-firstname" name="firstname" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                        </div>
                        <div class="w-full md:w-1/2 pl-2">
                            <label for="account-lastname" class="font-semibold text-slate-700">Tên <span class="text-red-500">*</span></label>
                            <input required value="${account.lastName}" type="text" id="account-lastname" name="lastname" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                        </div>
                    </div>
                    <div class="flex flex-wrap mb-3">
                        <div class="w-full md:w-1/2 pr-2 mb-3 md:mb-0">
                            <label for="account-email" class="font-semibold text-slate-700">Email <span class="text-red-500">*</span></label>
                            <input required value="${account.email}" type="email" id="account-email" name="email" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                            <span class="text-error" id="email-text"></span>
                        </div>
                        <div class="w-full md:w-1/2 pl-2">
                            <label for="account-address" class="font-semibold text-slate-700">Địa chỉ</label>
                            <input value="${account.address}" type="text" id="account-address" name="address" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                        </div>
                    </div>

                    <div class="flex flex-wrap mb-3">
                        <div class="w-full md:w-1/2 pr-2 mb-3 md:mb-0">
                            <label for="account-gender" class="font-semibold text-slate-700">Giới tính</label>
                            <select style="border: 1px solid #d1d5db;" class="form-control w-full mt-1 p-2 border border-gray-300 rounded-md outline-none focus:border-blue-500" name="gender" id="account-gender">
                                <option value='Nam' ${account.gender == "Nam" ? 'selected' : ''}>Nam</option>
                                <option value='Nữ' ${account.gender == "Nữ" ? 'selected' : ''}>Nữ</option>
                                <option value='Không muốn tiết lộ' ${account.gender == "Không muốn tiết lộ" ? 'selected' : ''}>Không muốn tiết lộ</option>
                            </select>
                        </div>
                        <div class="w-full md:w-1/2 pl-2">
                            <label for="account-phone" class="font-semibold text-slate-700">Số điện thoại <span class="text-red-500">*</span></label>
                            <input required value="${account.phoneNumber}" type="text" id="account-phone" name="phonenumber" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                            <span class="text-error" id="phone-text"></span>
                        </div>
                    </div>
                    <div class="flex flex-wrap mb-3">
                        <div class="w-full md:w-1/2 pr-2 mb-3 md:mb-0">
                            <label for="account-dob" class="font-semibold text-slate-700">Ngày sinh</label>
                            <input value="${account.dob}" type="date" id="account-dob" name="dob" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                        </div>
                        <div class="w-full md:w-1/2 pl-2">
                            <label for="account-username" class="font-semibold text-slate-700">Tên đăng nhập <span class="text-red-500">*</span></label>
                            <input style="background-color: #f1f5f9; color: #64748b; cursor: not-allowed;" readonly value="${account.userName}" type="text" id="account-username" name="username" class="form-control mt-1 p-2 border border-gray-300 rounded-md w-full">
                        </div>
                    </div>
                    <div style="display: flex; justify-content: flex-end; gap: 0.75rem; margin-top: 1.5rem; border-top: 1px solid #e2e8f0; padding-top: 1.25rem;">
                        <button type="button" id="closeModalBtn" style="background-color: #f1f5f9; color: #475569; border: 1px solid #cbd5e1; font-weight: 600; padding: 0.6rem 1.5rem; border-radius: 0.5rem; cursor: pointer; transition: all 0.2s; outline: none;">Quay về</button>
                        <button type="submit" style="background-color: #2563eb; color: white; font-weight: 600; padding: 0.6rem 1.5rem; border-radius: 0.5rem; border: none; cursor: pointer; transition: all 0.2s; outline: none;">Lưu thay đổi</button>
                    </div>
                </form>
            </div>
        </div>
        <!--End Modal-->

        <!-- Modal Xác Nhận Ảnh Đại Diện -->
        <div id="cropImageModal" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-75 hidden z-[9999] p-4">
            <div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md z-[10000] max-h-screen flex flex-col">
                <h3 class="text-xl font-bold mb-4 text-slate-700 text-center">Xác nhận ảnh đại diện</h3>
                <form action="${pageContext.request.contextPath}/uploadimage" method="post" enctype="multipart/form-data" id="form-upload" class="flex flex-col flex-grow min-h-0">
                    
                    <!-- Perfect Circular Preview Container -->
                    <div style="display: flex; justify-content: center; align-items: center; padding: 2rem 0; background-color: #f8fafc; border-radius: 0.75rem;">
                        <div style="width: 220px; height: 220px; border-radius: 50%; border: 4px solid #3b82f6; box-shadow: 0 10px 15px -3px rgba(59, 130, 246, 0.2); overflow: hidden; display: flex; align-items: center; justify-content: center; background-color: #e2e8f0;">
                            <img id="crop-image" src="" alt="Avatar Preview" style="width: 100%; height: 100%; object-fit: cover;">
                        </div>
                    </div>
                    
                    <p class="text-sm text-slate-500 mt-4 text-center">Ảnh của bạn sẽ hiển thị dưới dạng hình tròn trên trang cá nhân.</p>

                    <!-- Footer Buttons -->
                    <div style="display: flex; justify-content: flex-end; margin-top: 1.5rem; pt: 1rem; border-top: 1px solid #f1f5f9; gap: 0.75rem;">
                        <button type="button" id="crop-cancel" style="background-color: #f1f5f9; color: #64748b; padding: 0.6rem 1.5rem; border-radius: 0.5rem; font-weight: 600; cursor: pointer; transition: all 0.2s; border: 1px solid #e2e8f0; outline: none;">Hủy</button>
                        <button type="button" id="crop-save" style="background-color: #3b82f6; color: white; padding: 0.6rem 1.5rem; border-radius: 0.5rem; font-weight: 600; cursor: pointer; transition: all 0.2s; border: none; outline: none; display: flex; align-items: center; gap: 8px;">
                            <span id="save-btn-text">Lưu ảnh</span>
                            <span id="save-btn-spinner" class="hidden">
                                <svg class="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" style="width: 1.25rem; height: 1.25rem;">
                                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                </svg>
                            </span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Modal Chỉnh Sửa Ảnh -->
        <!-- End Modal Chỉnh Sửa Ảnh -->
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const editProfileBtn = document.getElementById('editProfileBtn');
            const editProfileModal = document.getElementById('editProfileModal');
            const closeModalBtn = document.getElementById('closeModalBtn');
            const toast = document.getElementById('toast');

            const dobInput = document.getElementById('account-dob');
            if (dobInput) {
                const today = new Date().toISOString().split('T')[0];
                dobInput.setAttribute('max', today);
            }

            editProfileBtn.addEventListener('click', () => {
                editProfileModal.classList.remove('hidden');
            });

            closeModalBtn.addEventListener('click', () => {
                editProfileModal.classList.add('hidden');
            });

            window.addEventListener('click', (event) => {
                if (event.target == editProfileModal) {
                    editProfileModal.classList.add('hidden');
                }
            });

        });

        const emailInput = document.getElementById("account-email");
        const emailText = document.getElementById("email-text");
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        const phoneInput = document.getElementById("account-phone");
        const phoneText = document.getElementById("phone-text");
        const phoneRegex = /^0\d{9}$/;

        //check email, ussername
        const validEmail = () => {
            if (emailInput.value.trim() !== "") {
                if (emailRegex.test(emailInput.value)) {
                    emailText.textContent = "";
                    emailText.className = "";
                } else {
                    emailText.textContent = "Email chưa đúng format.";
                    emailText.className = "text-error text-red-500 text-sm mt-1 block";
                }
            } else {
                if (emailInput.value.trim() === "") {
                    emailText.textContent = "Không được để trống email.";
                    emailText.className = "text-error text-red-500 text-sm mt-1 block";
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
                phoneText.className = "text-error text-red-500 text-sm mt-1 block";
            }
        };
        emailInput.addEventListener("input", validEmail);
        phoneInput.addEventListener("input", validPhone);

        // Validate on submit
        const formUpdate = document.getElementById("form-update");
        formUpdate.addEventListener("submit", function(event) {
            validEmail();
            validPhone();
            
            // Required fields check
            const firstName = document.getElementById("account-firstname").value.trim();
            const lastName = document.getElementById("account-lastname").value.trim();
            const dobVal = document.getElementById("account-dob").value;
            
            if (dobVal) {
                const selectedDate = new Date(dobVal);
                const today = new Date();
                today.setHours(0, 0, 0, 0);
                if (selectedDate > today) {
                    event.preventDefault();
                    alert("Cập nhật thất bại! Ngày sinh không được lớn hơn ngày hiện tại.");
                    document.getElementById("account-dob").focus();
                    return;
                }
            }
            
            if (emailText.textContent !== "" || phoneText.textContent !== "" || !firstName || !lastName) {
                event.preventDefault(); // Stop submission
                if(!firstName) document.getElementById("account-firstname").focus();
                else if(!lastName) document.getElementById("account-lastname").focus();
                else if(emailText.textContent !== "") emailInput.focus();
                else if(phoneText.textContent !== "") phoneInput.focus();
            }
        });
    </script>
    <!-- Include Cropper.js library -->
    <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/chartjs.min.js"></script>
    <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/perfect-scrollbar.min.js" async=""></script>
    <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/js/soft-ui-dashboard-tailwind.js" async=""></script>
    <style>
        #cropImageModal {
            z-index: 9999 !important;
        }

        #editProfileModal {
            z-index: 9998 !important;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const modal = document.getElementById('cropImageModal');
            const cropImage = document.getElementById('crop-image');
            let selectedFile = null;

            document.getElementById('image-upload').addEventListener('change', function (event) {
                const files = event.target.files;
                if (!files || files.length === 0) return;
                
                selectedFile = files[files.length - 1];
                if (selectedFile) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        cropImage.src = e.target.result;
                        modal.classList.remove('hidden');
                    };
                    reader.readAsDataURL(selectedFile);
                }
            });

            document.getElementById('crop-save').addEventListener('click', function () {
                if (!selectedFile) return;
                
                const saveBtn = document.getElementById('crop-save');
                const cancelBtn = document.getElementById('crop-cancel');
                const btnText = document.getElementById('save-btn-text');
                const btnSpinner = document.getElementById('save-btn-spinner');
                
                // Show spinner
                saveBtn.disabled = true;
                cancelBtn.disabled = true;
                if (btnText) btnText.classList.add('hidden');
                if (btnSpinner) btnSpinner.classList.remove('hidden');

                const id = document.getElementById("accountID").value;                       
                const formData = new FormData();
                formData.append('file', selectedFile);
                formData.append('id', id);
                
                // Gửi dữ liệu tới servlet bằng AJAX
                $.ajax({
                    type: "POST",
                    url: "uploadimage",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        alert("Cập nhật ảnh đại diện thành công!");
                        modal.classList.add('hidden');
                        location.reload(); // Reload the page to show the new avatar instantly
                    },
                    error: function(xhr, status, error) {
                        alert("Có lỗi xảy ra khi cập nhật ảnh.");
                        console.error("Error sending data:", error);
                        
                        // Reset spinner
                        saveBtn.disabled = false;
                        cancelBtn.disabled = false;
                        if (btnText) btnText.classList.remove('hidden');
                        if (btnSpinner) btnSpinner.classList.add('hidden');
                    }
                });
            });

            document.getElementById('crop-cancel').addEventListener('click', function () {
                modal.classList.add('hidden');
                cropImage.src = '';
                selectedFile = null;
                document.getElementById('image-upload').value = '';
            });
        });
            </div> <!-- #panel -->
        </div> <!-- .builder-container -->
    </body>
</html>
