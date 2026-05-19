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
        <title>Quản lý thông tin cá nhân</title>
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
    </head>
    <style>
        .security-item:hover {
            background-color: lightgrey;
        }

        /* Simplified Sidebar */
        .sidebar-item {
            padding: 0.75rem 1rem;
            margin: 0.2rem 1rem;
            display: flex;
            align-items: center;
            border-radius: 0.5rem;
            transition: all 0.2s ease;
            color: #334155; /* Slate-700 for clear readability */
            font-weight: 600; /* Sharp, bold medium text */
            text-decoration: none !important;
        }
        .sidebar-item:hover {
            background-color: #f1f5f9;
            color: #0f172a; /* Slate-900 */
        }
        .sidebar-item.active {
            background-color: #fdf8eb; /* very light gold */
            color: #b59349;
            font-weight: 700;
        }
        .icon-box {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            width: 32px;
            height: 32px;
            border-radius: 0.5rem;
            background-color: #f1f5f9;
            color: #475569;
        }
        .sidebar-item.active .icon-box {
            background-color: #b59349;
            color: #ffffff;
        }
        .nav-text {
            font-size: 0.9rem;
        }
        .sidebar-heading {
            padding-left: 1.5rem;
            font-weight: 800;
            text-transform: uppercase;
            font-size: 0.75rem;
            color: #475569; /* Slate-600 */
            margin-top: 1.5rem;
            margin-bottom: 0.5rem;
        }
    </style>
    <jsp:include page="/includes/customer/header.jsp" />
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
                            <a class="sidebar-item" href="profileCustomer.jsp">
                                <div class="icon-box">
                                    <i class="fas fa-user-circle text-xs"></i>
                                </div> 
                                <span class="nav-text">Thông tin cá nhân</span>
                            </a> 
                        </li>
                        <li class="w-full"> 
                            <a class="sidebar-item active" href="javascript:;">
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
                                        <div class="mb-8 pb-6 border-b border-slate-100">
                                            <h3 class="text-2xl font-bold text-slate-800">Mật khẩu & Bảo mật</h3>
                                            <p class="text-slate-500 font-medium mt-1">Thiết lập mật khẩu và bảo vệ an toàn cho tài khoản của bạn</p>
                                            <c:if test="${not empty requestScope.mess}">
                                                <p class="text-emerald-500 text-sm mt-2"><i class="fas fa-check-circle mr-1"></i> ${mess}</p>
                                            </c:if>
                                            <c:if test="${not empty requestScope.errorProfile}">
                                                <p class="text-rose-500 text-sm mt-2"><i class="fas fa-exclamation-circle mr-1"></i> ${requestScope.errorProfile}</p>
                                            </c:if>
                                        </div>

                                        <!-- Security Actions -->
                                        <div>
                                            <div onclick="changePass()" class="flex items-center justify-between p-4 bg-slate-50 hover:bg-slate-100 border border-slate-200 transition-colors rounded-xl cursor-pointer">
                                                <div class="flex items-center space-x-4">
                                                    <div style="background-color: #e2e8f0; color: #475569; width: 48px; height: 48px; border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                                                        <i class="fas fa-key text-lg"></i>
                                                    </div>
                                                    <div>
                                                        <p class="text-lg font-bold text-slate-800 mb-0">Đổi mật khẩu</p>
                                                        <p class="text-sm text-slate-500 mb-0">Cập nhật mật khẩu định kỳ để duy trì tính bảo mật</p>
                                                    </div>
                                                </div>
                                                <i class="fas fa-chevron-right text-slate-400"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- Footer -->
            </div>
        </div>
        <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/chartjs.min.js"></script>
        <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/perfect-scrollbar.min.js"
        async=""></script>
        <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
        <script
            src="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/js/soft-ui-dashboard-tailwind.js"
        async=""></script>
    </body>
    <script>
                                            document.addEventListener('DOMContentLoaded', () => {
                                                const editProfileBtn = document.getElementById('editProfileBtn');
                                                const editProfileModal = document.getElementById('editProfileModal');
                                                const closeModalBtn = document.getElementById('closeModalBtn');
                                                const toast = document.getElementById('toast');

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

                                            function changePass() {
                                                window.location.href = "changepassword";
                                            }

    </script>
</html>
