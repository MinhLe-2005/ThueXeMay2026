<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Chi tiết lịch sử thuê xe</title>
        <!-- Tailwind CSS & Google Fonts -->
        <link href="https://www.loopple.com/css/vendor/tailwind.min.css" rel="stylesheet">
        <link href="https://www.loopple.com/css/tailwind/app.css?v=1.0.0" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sidebarProfile.css?v=3" rel="stylesheet">
        <style>
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(8px); }
                to { opacity: 1; transform: translateY(0); }
            }
            .animate-fadeIn {
                animation: fadeIn 0.3s cubic-bezier(0.16, 1, 0.3, 1) forwards;
            }
        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    
    <jsp:include page="/includes/customer/header.jsp" />
    <jsp:include page="/includes/customer/navbar.jsp" />
    
    <body class="font-body" data-framework="tailwind">
        <!-- CSS Links -->
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link href="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/css/nucleo-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/css/soft-ui-dashboard-tailwind.css">
        
        <div class="builder-container builder-container-preview font-body">
            <jsp:include page="/includes/customer/sidebarProfile.jsp">
                <jsp:param name="activePage" value="bookingHistoryDetail"/>
            </jsp:include>

            <!-- Main Panel Content -->
            <div class="ease-soft-in-out xl:ml-68.5 relative h-full max-h-screen rounded-xl transition-all duration-200" id="panel">
                <div class="w-full px-6 py-6 mx-auto drop-zone loopple-min-height-78vh text-gray-500">
                    <div class="relative flex flex-col flex-auto min-w-0 p-6 mx-6 mt-32 overflow-hidden break-words border-0 shadow-blur rounded-2xl bg-white/80 bg-clip-border mb-4 animate-fadeIn">
                        
                        <!-- Header -->
                        <div class="flex flex-wrap items-center justify-between gap-4 border-b border-gray-100 pb-5 mb-6">
                            <div>
                                <h3 class="text-2xl font-bold text-gray-800 flex items-center">
                                    <i class="fas fa-file-invoice mr-2.5 text-yellow-500"></i> Chi tiết Booking
                                </h3>
                                <p class="text-gray-400 text-sm font-medium mt-1">Xem thông tin đặt xe, hạn trả và thực hiện thao tác gia hạn hoặc hủy đơn.</p>
                            </div>
                            <span class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-bold ${statusBooking == 'Chờ xác nhận' ? 'bg-yellow-50 text-yellow-600' : (statusBooking == 'Đã xác nhận' ? 'bg-green-50 text-green-600' : 'bg-red-50 text-red-600')}">
                                <span class="w-1.5 h-1.5 rounded-full ${statusBooking == 'Chờ xác nhận' ? 'bg-yellow-500' : (statusBooking == 'Đã xác nhận' ? 'bg-green-500' : 'bg-red-500')}"></span>
                                ${booking.statusBooking}
                            </span>
                        </div>

                        <!-- Success / Fail Messages -->
                        <c:if test="${not empty sessionScope.cancelSuccess}">
                            <div class="mb-6 p-4 bg-green-50 border border-green-100 text-green-600 rounded-xl text-sm font-semibold flex items-center gap-2">
                                <i class="fas fa-check-circle text-base"></i>
                                <span>${sessionScope.cancelSuccess}</span>
                            </div>
                            <c:remove var="cancelSuccess" scope="session"/>
                        </c:if>
                        <c:if test="${not empty sessionScope.cancelFail}">
                            <div class="mb-6 p-4 bg-red-50 border border-red-100 text-red-600 rounded-xl text-sm font-semibold flex items-center gap-2">
                                <i class="fas fa-exclamation-circle text-base"></i>
                                <span>${sessionScope.cancelFail}</span>
                            </div>
                            <c:remove var="cancelFail" scope="session"/>
                        </c:if>

                        <!-- Date Variables Parsing -->
                        <c:set var="bookingDate" value="${booking.bookingDate}" />
                        <c:set var="bookingYear" value="${fn:substring(bookingDate, 0, 4)}" />
                        <c:set var="bookingMonth" value="${fn:substring(bookingDate, 5, 7)}" />
                        <c:set var="bookingDay" value="${fn:substring(bookingDate, 8, 10)}" />
                        <c:set var="bookingHour" value="${fn:substring(bookingDate, 11, 13)}" />
                        <c:set var="bookingMinute" value="${fn:substring(bookingDate, 14, 16)}" />

                        <c:set var="startDate" value="${booking.startDate}" />
                        <c:set var="startYear" value="${fn:substring(startDate, 0, 4)}" />
                        <c:set var="startMonth" value="${fn:substring(startDate, 5, 7)}" />
                        <c:set var="startDay" value="${fn:substring(startDate, 8, 10)}" />
                        <c:set var="startHour" value="${fn:substring(startDate, 11, 13)}" />
                        <c:set var="startMinute" value="${fn:substring(startDate, 14, 16)}" />

                        <c:set var="endDate" value="${booking.endDate}" />
                        <c:set var="endYear" value="${fn:substring(endDate, 0, 4)}" />
                        <c:set var="endMonth" value="${fn:substring(endDate, 5, 7)}" />
                        <c:set var="endDay" value="${fn:substring(endDate, 8, 10)}" />
                        <c:set var="endHour" value="${fn:substring(endDate, 11, 13)}" />
                        <c:set var="endMinute" value="${fn:substring(endDate, 14, 16)}" />

                        <!-- Content Grid: Premium Layout -->
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 mb-8">
                            
                            <!-- Left Column: Lịch trình & Giao nhận (7 cols) -->
                            <div class="lg:col-span-7 space-y-6">
                                <!-- Card: Lịch trình -->
                                <div class="bg-white border border-gray-100 shadow-sm rounded-2xl p-7 relative overflow-hidden">
                                    <div class="absolute top-0 right-0 w-48 h-48 bg-yellow-50 rounded-bl-full -z-0 opacity-50"></div>
                                    <h4 class="text-xl font-extrabold text-gray-800 mb-6 flex items-center relative z-10">
                                        <i class="fas fa-route text-yellow-500 mr-3 text-2xl"></i> Lịch trình thuê xe
                                    </h4>
                                    
                                    <div class="flex items-center justify-between relative z-10 mb-8 bg-gray-50/50 p-4 rounded-xl border border-gray-100">
                                        <!-- Start Date -->
                                        <div class="text-center w-5/12">
                                            <p class="text-xs text-gray-400 font-bold uppercase tracking-wider mb-2">Nhận xe</p>
                                            <div class="bg-white border border-gray-200 shadow-sm rounded-xl py-4 px-2">
                                                <p class="text-yellow-600 font-black text-2xl mb-1">${startHour}:${startMinute}</p>
                                                <p class="text-gray-600 text-sm font-bold">${startDay}-${startMonth}-${startYear}</p>
                                            </div>
                                        </div>
                                        
                                        <!-- Divider -->
                                        <div class="w-2/12 flex flex-col items-center justify-center opacity-60">
                                            <div class="w-full h-[2px] bg-gray-300 border-dashed border-b-2"></div>
                                            <i class="fas fa-motorcycle text-gray-400 text-lg bg-gray-50 px-2 -mt-3.5"></i>
                                        </div>
                                        
                                        <!-- End Date -->
                                        <div class="text-center w-5/12">
                                            <p class="text-xs text-gray-400 font-bold uppercase tracking-wider mb-2">Trả xe</p>
                                            <div class="bg-white border border-gray-200 shadow-sm rounded-xl py-4 px-2">
                                                <p class="text-green-600 font-black text-2xl mb-1">${endHour}:${endMinute}</p>
                                                <p class="text-gray-600 text-sm font-bold">${endDay}-${endMonth}-${endYear}</p>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="space-y-5 relative z-10">
                                        <div class="flex items-start gap-4">
                                            <div class="w-10 h-10 rounded-full bg-yellow-50 flex items-center justify-center shrink-0 mt-0.5">
                                                <i class="fas fa-map-marker-alt text-yellow-500 text-lg"></i>
                                            </div>
                                            <div>
                                                <p class="text-xs text-gray-400 font-bold uppercase mb-1">Nơi nhận xe</p>
                                                <p class="text-base text-gray-800 font-bold leading-relaxed">${booking.deliveryLocation}</p>
                                            </div>
                                        </div>
                                        <div class="flex items-start gap-4">
                                            <div class="w-10 h-10 rounded-full bg-green-50 flex items-center justify-center shrink-0 mt-0.5">
                                                <i class="fas fa-flag-checkered text-green-500 text-lg"></i>
                                            </div>
                                            <div>
                                                <p class="text-xs text-gray-400 font-bold uppercase mb-1">Nơi trả xe</p>
                                                <p class="text-base text-gray-800 font-bold leading-relaxed">${booking.returnedLocation}</p>
                                            </div>
                                        </div>
                                        <c:if test="${statusBooking == 'Đã xác nhận'}">
                                            <div class="mt-6 pt-5 border-t border-gray-100 flex items-center gap-4">
                                                <div class="w-10 h-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0">
                                                    <i class="fas fa-truck text-blue-500 text-lg"></i>
                                                </div>
                                                <div>
                                                    <p class="text-xs text-gray-400 font-bold uppercase mb-1">Trạng thái giao xe</p>
                                                    <p class="text-base text-blue-700 font-black">${booking.deliveryStatus}</p>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Right Column: Chi tiết xe & Thanh toán (5 cols) -->
                            <div class="lg:col-span-5 space-y-6">
                                
                                <!-- Card: Chi tiết Xe -->
                                <div class="bg-white border border-gray-100 shadow-sm rounded-2xl p-7 relative overflow-hidden">
                                    <h4 class="text-xl font-extrabold text-gray-800 mb-6 flex items-center">
                                        <i class="fas fa-motorcycle text-yellow-500 mr-3 text-2xl"></i> Chi tiết phương tiện
                                    </h4>
                                    
                                    <div class="space-y-4 mb-6">
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-gray-500 font-medium">Mã đơn hàng:</span>
                                            <span class="font-bold text-gray-800 bg-gray-100 px-2 py-1 rounded">#${booking.bookingID}</span>
                                        </div>
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-gray-500 font-medium">Thời gian tạo:</span>
                                            <span class="font-semibold text-gray-700">${bookingDay}-${bookingMonth}-${bookingYear} ${bookingHour}:${bookingMinute}</span>
                                        </div>
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-gray-500 font-medium">Tổng số lượng xe:</span>
                                            <span class="font-bold text-yellow-600 bg-yellow-50 px-2.5 py-1 rounded-md border border-yellow-100">${fn:length(booking.listBookingDetails)} xe</span>
                                        </div>
                                    </div>
                                    
                                    <div class="bg-gray-50 border border-gray-200 rounded-xl p-5">
                                        <p class="text-xs text-gray-500 font-bold uppercase tracking-wider mb-3">Các phương tiện đã thuê</p>
                                        <div class="flex flex-wrap gap-2.5">
                                            <c:forEach var="entry" items="${motorcycleDetails}" varStatus="loop">
                                                <div class="bg-white border border-gray-200 shadow-sm text-gray-800 px-3 py-1.5 rounded-lg text-sm font-bold flex items-center gap-2">
                                                    <span>${entry.key}</span>
                                                    <span class="bg-green-100 text-green-700 px-1.5 py-0.5 rounded text-xs">x${entry.value}</span>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Card: Tổng kết thanh toán -->
                                <div class="bg-gray-900 rounded-2xl p-7 relative overflow-hidden text-white shadow-xl shadow-gray-900/10">
                                    <div class="absolute -right-6 -top-6 w-40 h-40 bg-white/5 rounded-full blur-3xl"></div>
                                    <div class="absolute -left-6 -bottom-6 w-32 h-32 bg-yellow-500/20 rounded-full blur-2xl"></div>
                                    
                                    <h4 class="text-xl font-extrabold text-white mb-6 flex items-center relative z-10">
                                        <i class="fas fa-file-invoice-dollar text-yellow-400 mr-3 text-2xl"></i> Tổng kết thanh toán
                                    </h4>
                                    
                                    <div class="space-y-5 relative z-10">
                                        <div class="flex justify-between items-end border-b border-white/10 pb-5">
                                            <div>
                                                <p class="text-gray-400 text-xs font-bold uppercase tracking-widest mb-1">Tổng tiền thuê xe</p>
                                                <p class="text-3xl font-black text-white tracking-tight" id="total-price">
                                                    <c:set var="total" value="0"/>
                                                    <c:forEach items="${booking.listBookingDetails}" var="detail">
                                                        <c:set var="total" value="${total + detail.totalPrice}"/>
                                                    </c:forEach>
                                                    <fmt:formatNumber value="${total*1000}" type="currency" currencySymbol="VNĐ" />
                                                </p>
                                            </div>
                                        </div>
                                        <div class="flex justify-between items-center pt-1">
                                            <div>
                                                <p class="text-gray-400 text-xs font-bold uppercase tracking-widest mb-1.5">Đã thanh toán thực tế</p>
                                                <p class="text-2xl font-bold text-green-400" id="amount-paid">
                                                    <c:set var="paidAmount" value="${empty payment ? 0 : payment.paymentAmount}" />
                                                    <fmt:formatNumber value="${paidAmount}" type="currency" currencySymbol="VNĐ" />
                                                </p>
                                            </div>
                                            <div class="w-12 h-12 rounded-full bg-green-500/20 flex items-center justify-center border border-green-500/30">
                                                <i class="fas fa-check text-green-400 text-lg"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>

                        <!-- Mini Extension Info Link -->
                        <div class="mb-8 text-right">
                            <button type="button" class="inline-flex items-center gap-1.5 text-sm font-bold text-yellow-600 hover:text-yellow-700 transition-colors border-b border-dashed border-yellow-600/50 pb-0.5 cursor-pointer bg-transparent border-0 outline-none" onclick="openExtension()">
                                <i class="fas fa-info-circle"></i> Xem thông tin gia hạn lịch trình
                            </button>
                        </div>

                        <!-- Detail Actions Buttons -->
                        <div class="flex flex-wrap items-center justify-end gap-3.5 pt-6 border-t border-gray-100">
                            <c:if test="${statusBooking == 'Chờ xác nhận'}">
                                <button type="button" class="px-5 py-2.5 text-white rounded-xl font-bold text-sm shadow-sm transition-all duration-200 cursor-pointer flex items-center gap-1.5 hover:opacity-90" style="background-color: #ef4444" onclick="openCancellation()">
                                    <i class="fas fa-times-circle"></i> Hủy đơn hàng
                                </button>
                            </c:if>
                            <c:if test="${statusBooking != 'Đã hủy'}">
                                <button type="button" id="pay-btn" class="px-5 py-2.5 text-white rounded-xl font-bold text-sm shadow-md transition-all duration-200 cursor-pointer flex items-center gap-1.5 hover:opacity-90" style="background-color: #10b981">
                                    <i class="fas fa-wallet"></i> Thanh toán ngay
                                </button>
                            </c:if>
                            <c:if test="${statusBooking != 'Đã hủy' && booking.deliveryStatus != 'Đã trả'}">
                                <button type="button" id="extension" class="px-5 py-2.5 text-white rounded-xl font-bold text-sm shadow-md transition-all duration-200 cursor-pointer flex items-center gap-1.5 hover:opacity-90" style="background-color: #3b82f6" onclick="openExtensionForm()">
                                    <i class="fas fa-calendar-plus"></i> Gia hạn thời gian
                                </button>
                            </c:if>
                            <c:if test="${statusBooking == 'Đã hủy' || booking.deliveryStatus == 'Đã trả'}">
                                <button type="button" id="rebook-btn" class="px-5 py-2.5 text-white rounded-xl font-bold text-sm shadow-md transition-all duration-200 cursor-pointer flex items-center gap-1.5 hover:opacity-90" style="background-color: #f59e0b" onclick="openBooking()">
                                    <i class="fas fa-redo"></i> Đặt thuê xe lại
                                </button>
                            </c:if>
                            <button type="button" class="px-5 py-2.5 text-white rounded-xl font-bold text-sm shadow-md transition-all duration-200 cursor-pointer flex items-center gap-1.5 hover:opacity-90" style="background-color: #1e293b" onclick="closeDetail()">
                                <i class="fas fa-chevron-left"></i> Quay về danh sách
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Payment Modal -->
        <div id="payment-modal" style="display: none; z-index: 9999;" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-65 p-4 transition-all duration-300">
            <div class="bg-white rounded-2xl shadow-xl border border-gray-100 w-full max-w-4xl overflow-hidden p-6 relative animate-fadeIn">
                <span class="absolute top-4 right-4 text-gray-400 hover:text-gray-600 cursor-pointer text-2xl font-bold font-sans" onclick="closePaymentModal()">&times;</span>
                <div class="flex items-center gap-3 mb-4 pb-3 border-b border-gray-100">
                    <div class="w-10 h-10 bg-green-50 rounded-lg flex items-center justify-center text-green-500">
                        <i class="fas fa-wallet text-base"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800">Thanh toán đơn hàng #${booking.bookingID}</h3>
                </div>
                <div class="w-full relative" style="height: 580px;">
                    <iframe id="paymentIframe" src="vnpay_pay.jsp" style="width: 100%; height: 100%; border: none; border-radius: 12px;"></iframe>
                    <!-- Overlay for iframe communications -->
                    <div id="payment-loading" style="display: none; z-index: 10000;" class="absolute inset-0 bg-white/85 flex flex-col items-center justify-center gap-3">
                        <div class="w-10 h-10 border-4 border-yellow-500 border-t-transparent rounded-full animate-spin"></div>
                        <p class="text-gray-600 text-sm font-semibold">Đang kết nối cổng thanh toán VNPAY...</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Cancellation Modal -->
        <div id="cancellation-info" style="display: none; z-index: 9999;" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-65 p-4 transition-all duration-300">
            <div class="bg-white rounded-2xl shadow-xl border border-gray-100 w-full max-w-xl overflow-hidden p-6 relative animate-fadeIn">
                <span class="absolute top-4 right-4 text-gray-400 hover:text-gray-600 cursor-pointer text-2xl font-bold" onclick="closeCancellation()">&times;</span>
                <div class="text-center">
                    <div class="w-12 h-12 bg-red-50 rounded-full flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-exclamation-triangle text-red-500 text-lg"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">Xác Nhận Hủy Đơn</h3>
                    <p class="text-gray-500 text-sm mb-4">Bạn có chắc chắn muốn hủy đơn này hay không? <br><span class="font-semibold text-gray-700">SMARTRIDE</span> muốn biết lý do hủy đơn của bạn.</p>
                </div>
                <form id="cancel-form" action="cancelbooking" method="get" class="space-y-4">
                    <input type="hidden" id="bookingId" name="bookingId" value="${booking.bookingID}">
                    <div>
                        <textarea required name="cancelreason" id="cancelReason" rows="4" class="w-full border border-gray-200 rounded-xl p-3 text-sm focus:outline-none focus:ring-2 focus:ring-yellow-500 bg-gray-50" placeholder="Nhập lý do hủy đơn của bạn..."></textarea>
                    </div>
                    <div class="flex items-center justify-end gap-3 pt-4 border-t border-gray-100">
                        <button type="button" class="px-5 py-2 border border-gray-200 rounded-xl text-gray-500 hover:bg-gray-50 font-bold text-sm transition-colors cursor-pointer" onclick="closeCancellation()">Đóng</button>
                        <button type="submit" class="px-5 py-2 bg-red-500 hover:bg-red-600 text-white rounded-xl font-bold text-sm shadow-md shadow-red-500/10 transition-colors cursor-pointer">Gửi yêu cầu hủy</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Extension Info Modal -->
        <div id="extension-info" style="display: none; z-index: 9999;" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-65 p-4 transition-all duration-300">
            <div class="bg-white rounded-2xl shadow-xl border border-gray-100 w-full max-w-xl overflow-hidden p-6 relative animate-fadeIn">
                <span class="absolute top-4 right-4 text-gray-400 hover:text-gray-600 cursor-pointer text-2xl font-bold" onclick="closeExtension()">&times;</span>
                <div class="flex items-center gap-3 mb-6 pb-4 border-b border-gray-100">
                    <div class="w-10 h-10 bg-yellow-50 rounded-lg flex items-center justify-center text-yellow-500">
                        <i class="fas fa-calendar-plus text-base"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800">Thông tin gia hạn</h3>
                </div>
                <c:choose>
                    <c:when test="${extension == null}">
                        <div class="text-center py-8">
                            <p class="text-gray-400 italic">Không có thông tin gia hạn nào cho booking này.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="space-y-4">
                            <div class="grid grid-cols-2 gap-4">
                                <div class="bg-gray-50 p-3.5 rounded-xl border border-gray-100">
                                    <span class="text-xs font-bold text-gray-400 uppercase tracking-wider block mb-1">Mã đặt xe</span>
                                    <span class="text-sm font-bold text-gray-700">#${extension.bookingID}</span>
                                </div>
                                <div class="bg-gray-50 p-3.5 rounded-xl border border-gray-100">
                                    <span class="text-xs font-bold text-gray-400 uppercase tracking-wider block mb-1">Ngày gia hạn</span>
                                    <span class="text-sm font-semibold text-gray-700">
                                        <c:set var="extensionDate" value="${extension.extensionDate}" />
                                        <c:set var="extYear" value="${fn:substring(extensionDate, 0, 4)}" />
                                        <c:set var="extMonth" value="${fn:substring(extensionDate, 5, 7)}" />
                                        <c:set var="extDay" value="${fn:substring(extensionDate, 8, 10)}" />
                                        <c:set var="extHour" value="${fn:substring(extensionDate, 11, 13)}" />
                                        <c:set var="extMinute" value="${fn:substring(extensionDate, 14, 16)}" />
                                        ${extDay}-${extMonth}-${extYear} ${extHour}:${extMinute}
                                    </span>
                                </div>
                            </div>
                            
                            <div class="bg-gray-50 p-3.5 rounded-xl border border-gray-100 space-y-2">
                                <div class="flex justify-between items-center text-sm border-b border-gray-200/50 pb-2">
                                    <span class="text-gray-500 font-medium">Hạn trả trước đó:</span>
                                    <span class="font-semibold text-gray-700">
                                        <c:set var="previousEndDate" value="${extension.previousEndDate}" />
                                        <c:set var="prevYear" value="${fn:substring(previousEndDate, 0, 4)}" />
                                        <c:set var="prevMonth" value="${fn:substring(previousEndDate, 5, 7)}" />
                                        <c:set var="prevDay" value="${fn:substring(previousEndDate, 8, 10)}" />
                                        <c:set var="prevHour" value="${fn:substring(previousEndDate, 11, 13)}" />
                                        <c:set var="prevMinute" value="${fn:substring(previousEndDate, 14, 16)}" />
                                        ${prevDay}-${prevMonth}-${prevYear} ${prevHour}:${prevMinute}
                                    </span>
                                </div>
                                <div class="flex justify-between items-center text-sm pt-1">
                                    <span class="text-gray-500 font-medium">Hạn trả mới:</span>
                                    <span class="font-bold text-yellow-600">
                                        <c:set var="newEndDate" value="${extension.newEndDate}" />
                                        <c:set var="newYear" value="${fn:substring(newEndDate, 0, 4)}" />
                                        <c:set var="newMonth" value="${fn:substring(newEndDate, 5, 7)}" />
                                        <c:set var="newDay" value="${fn:substring(newEndDate, 8, 10)}" />
                                        <c:set var="newHour" value="${fn:substring(newEndDate, 11, 13)}" />
                                        <c:set var="newMinute" value="${fn:substring(newEndDate, 14, 16)}" />
                                        ${newDay}-${newMonth}-${newYear} ${newHour}:${newMinute}
                                    </span>
                                </div>
                            </div>

                            <div class="grid grid-cols-2 gap-4">
                                <div class="bg-gray-50 p-3.5 rounded-xl border border-gray-100">
                                    <span class="text-xs font-bold text-gray-400 uppercase tracking-wider block mb-1">Phí gia hạn</span>
                                    <span class="text-sm font-bold text-green-600">
                                        <fmt:formatNumber value="${extension.extensionFee * 1000}" type="currency" currencySymbol="VNĐ" />
                                    </span>
                                </div>
                                <div class="bg-gray-50 p-3.5 rounded-xl border border-gray-100">
                                    <span class="text-xs font-bold text-gray-400 uppercase tracking-wider block mb-1">Tổng tiền mới</span>
                                    <span class="text-sm font-bold text-yellow-600">
                                        <c:set var="total" value="${total + extension.extensionFee}" />
                                        <fmt:formatNumber value="${total*1000}" type="currency" currencySymbol="VNĐ" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="flex justify-end pt-6 mt-6 border-t border-gray-100">
                    <button type="button" class="px-5 py-2 hover:bg-gray-900 text-white rounded-xl font-bold text-sm shadow-md transition-colors cursor-pointer border-0" style="background-color: #1f2937;" onclick="closeExtension()">Đồng ý</button>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                togglePayButton();
                
                // Add event listener for pay-btn click
                const payBtn = document.getElementById("pay-btn");
                if (payBtn) {
                    payBtn.addEventListener("click", openPaymentModal);
                }
                
                // Clean up previous storage status on load
                localStorage.removeItem('payment_status');
                
                // Storage listener for payment success callback
                window.addEventListener('storage', function(event) {
                    if (event.key === 'payment_status') {
                        const paymentStatus = JSON.parse(event.newValue);
                        if (paymentStatus && paymentStatus.status === 'success') {
                            handleSuccessPayment(paymentStatus);
                        }
                    }
                });
            });
            
            function togglePayButton() {
                const payButton = document.getElementById("pay-btn");
                if (!payButton) return;
                
                const amountPaid = parseFloat("${paidAmount}") || 0;
                const totalPrice = (parseFloat("${total}") || 0) * 1000;
                
                if (amountPaid < totalPrice) {
                    payButton.style.display = "inline-flex";
                } else {
                    payButton.style.display = "none";
                }
            }

            function openPaymentModal() {
                const modal = document.getElementById('payment-modal');
                if (modal) {
                    modal.style.display = 'flex';
                    
                    // Set up iframe message passing when iframe is loaded
                    const iframe = document.getElementById('paymentIframe');
                    iframe.onload = function() {
                        const amountPaid = parseFloat("${paidAmount}") || 0;
                        const totalPrice = (parseFloat("${total}") || 0) * 1000;
                        
                        // Send data to iframe
                        const data = {
                            dataTotal: totalPrice,
                            dataPayment: amountPaid > 0 ? [amountPaid] : []
                        };
                        iframe.contentWindow.postMessage(data, '*');
                    };
                }
            }

            function closePaymentModal() {
                const modal = document.getElementById('payment-modal');
                if (modal) {
                    modal.style.display = 'none';
                    // Reset iframe source to avoid state issues on reopening
                    const iframe = document.getElementById('paymentIframe');
                    if (iframe) {
                        iframe.src = "vnpay_pay.jsp";
                    }
                }
            }

            function handleSuccessPayment(paymentStatus) {
                // Post payment info to backend
                const bookingId = "${booking.bookingID}";
                const params = new URLSearchParams();
                params.append("bookingId", bookingId);
                params.append("paymentTime", paymentStatus.time);
                params.append("amount", paymentStatus.amount);
                
                fetch("bookingHistoryDetail", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: params.toString()
                })
                .then(response => response.json())
                .then(data => {
                    if (data.status === "success") {
                        // Remove status from localStorage
                        localStorage.removeItem('payment_status');
                        
                        // Close modal
                        closePaymentModal();
                        
                        // Show success alert and reload
                        alert("Thanh toán thành công! Hệ thống sẽ cập nhật trạng thái đơn hàng của bạn.");
                        window.location.reload();
                    } else {
                        alert("Lỗi khi cập nhật thanh toán: " + data.message);
                    }
                })
                .catch(err => {
                    console.error("Lỗi:", err);
                    alert("Đã xảy ra lỗi trong quá trình cập nhật thanh toán.");
                });
            }

            // Listen for iframe postMessages to activate/stop overlays
            window.addEventListener('message', (event) => {
                const loadingOverlay = document.getElementById('payment-loading');
                if (loadingOverlay) {
                    if (event.data === 'activateOverlay') {
                        loadingOverlay.style.display = 'flex';
                    } else if (event.data === 'stopOverlay') {
                        loadingOverlay.style.display = 'none';
                    }
                }
            });

            function openExtensionForm(){
                const bookingIdEl = document.getElementById("bookingId");
                if (bookingIdEl) {
                    const url = "extend?bookingid=" + bookingIdEl.value;
                    const newWindow = window.open(url, '_blank');
                    if (newWindow) {
                        newWindow.focus();
                    } else {
                        alert('Trình duyệt của bạn đã chặn pop-up. Vui lòng tắt trình chặn pop-up và thử lại.');
                    }
                }
            }
            
            function openExtension() {
                const extInfo = document.getElementById('extension-info');
                if (extInfo) extInfo.style.display = 'flex';
            }
            
            function closeExtension() {
                const extInfo = document.getElementById('extension-info');
                if (extInfo) extInfo.style.display = 'none';
            }
            
            function closeDetail() {
                window.location.href = 'bookingHistory?status=all';
            }

            function openCancellation() {
                const cancelInfo = document.getElementById('cancellation-info');
                if (cancelInfo) cancelInfo.style.display = 'flex';
            }

            function closeCancellation() {
                const cancelInfo = document.getElementById('cancellation-info');
                if (cancelInfo) cancelInfo.style.display = 'none';
            }
            
            function openBooking() {
                window.location.href = 'booking';
            }

            // click outside to dismiss modals
            window.addEventListener('click', function (event) {
                const extension = document.getElementById("extension-info");
                const cancellation = document.getElementById("cancellation-info");
                const payment = document.getElementById("payment-modal");

                if (event.target === extension) {
                    extension.style.display = "none";
                }
                if (event.target === cancellation) {
                    cancellation.style.display = "none";
                }
                if (event.target === payment) {
                    closePaymentModal();
                }
            });

            // ESC to dismiss modals
            window.addEventListener('keydown', function (event) {
                const extension = document.getElementById("extension-info");
                const cancellation = document.getElementById("cancellation-info");
                const payment = document.getElementById("payment-modal");
                if (event.key === "Escape" || event.key === "Esc") {
                    if (extension) extension.style.display = "none";
                    if (cancellation) cancellation.style.display = "none";
                    if (payment) closePaymentModal();
                }
            });
        </script>
    </body>
</html>