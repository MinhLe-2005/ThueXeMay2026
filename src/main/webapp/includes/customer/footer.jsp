<%-- 
    Document   : footer
    Created on : May 25, 2024, 5:28:24?PM
    Author     : DiepTCNN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/includes/customer/header.jsp" />
<footer id="footer" class="footer">

    <div class="container footer-top">
        <div class="row gy-4">
            <div class="col-lg-5 col-md-12 footer-about">
                <a href="home" class="logo d-flex align-items-center" style="text-decoration: none; margin-bottom: 20px; display: inline-flex !important; width: fit-content; transition: all 0.3s ease;">
                    <img src="images/logo.png?v=<%=System.currentTimeMillis()%>" alt="SmartRide Logo" style="height: 44px; width: auto; object-fit: contain;" />
                </a>
                <p>"Tự do trên từng chuyến hành trình"</p>
                <p>Chọn chúng tôi để khởi đầu hành trình của bạn với sự tiện lợi và
                    chất lượng dịch vụ tuyệt vời nhất.</p>
                <div class="social-links d-flex mt-4">
                    <a href="https://www.facebook.com/profile.php?id=61589731149339" target="_blank"><i class="bi bi-facebook"></i></a>
                    <a href="https://www.facebook.com/profile.php?id=61589731149339" target="_blank"><i class="bi bi-instagram"></i></a>
                    <a href="https://www.facebook.com/profile.php?id=61589731149339" target="_blank"><i class="bi bi-linkedin"></i></a>
                </div>
            </div>

            <div class="col-lg-2 col-6 footer-links">
                <h4>Thông Tin</h4>
                <ul>
                    <li><a href="home">Trang Chủ</a></li>
                    <li><a href="about.jsp">Về Chúng Tôi</a></li>
                    <li><a href="home#featured-services">Dịch Vụ</a></li>
                    <li><a href="policies.jsp">Chính Sách & Điều Khoản</a></li>
                </ul>
            </div>

            <div class="col-lg-2 col-6 footer-links">
                <h4>Dịch Vụ</h4>
                <ul>
                    <li><a href="FAQ">FAQs</a></li>
                    <li><a href="event">Sự Kiện</a></li>
                    <li><a href="touristLocation ">Địa Điểm Du Lịch</a></li>
                    <li><a href="event">Quảng Cáo</a></li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start col-lg-2 col-6 footer-links">
                <h4>Hỗ Trợ Khách Hàng</h4>
                <p class="mb-4"><a href="contact.jsp" class="gradient-button">Liên hệ chúng tôi</a></p>
                <p><i class="bi bi-geo-alt-fill" style="color: #b59349; margin-right: 8px;"></i> 254 Nguyễn Văn Linh</p>
                <p style="padding-left: 20px;">Thạc Gián, Thanh Khê, Đà Nẵng</p>
                <p class="mt-4"><strong>Phone:</strong> <span style="color: #b59349; font-weight: 600;">0824 551 789</span></p>
                <p><strong>Email:</strong> <span>support@smartride.com</span></p>
            </div>

        </div>
    </div>

    <div class="container copyright text-center mt-4">
        <p><span>Công Ty</span> <strong class="px-1 sitename">SmartRide</strong>
            <span>Chúc Bạn Vạn Niềm Vui</span></p>
        <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you've purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        </div>
    </div>

</footer>

<!-- Floating Action Buttons (Góc trái dưới - FAB dạng trượt) -->
<div class="floating-contact">
    <div class="contact-sub-buttons">
        <a href="tel:0824551789" class="contact-btn phone-btn" title="Gọi ngay">
            <i class="fas fa-phone-alt" style="color: #d93838;"></i>
            <span>Gọi ngay</span>
        </a>
        <a href="https://zalo.me/0824551789" target="_blank" class="contact-btn zalo-btn" title="Chat Zalo">
            <img src="https://upload.wikimedia.org/wikipedia/commons/9/91/Icon_of_Zalo.svg" alt="Zalo" width="18" height="18">
            <span>Zalo</span>
        </a>
        <a href="https://www.facebook.com/profile.php?id=61589731149339" target="_blank" class="contact-btn messenger-btn" title="Messenger">
            <i class="fab fa-facebook-messenger" style="color: #0084ff;"></i>
            <span>Messenger</span>
        </a>
    </div>
    <button class="main-contact-fab" title="Liên hệ hỗ trợ">
        <i class="bi bi-chat-dots-fill"></i>
    </button>
</div>

<style>
.footer {
    background-color: #f5f2eb !important;
    color: #2b2824 !important;
    border-top: 1px solid #eae6df !important;
    padding: 60px 0 30px 0 !important;
}
.footer h4 {
    color: #1a1816 !important;
    font-family: 'Poppins', sans-serif !important;
    font-weight: 700 !important;
    margin-bottom: 20px !important;
    border-bottom: 2px solid #eae6df !important;
    padding-bottom: 8px !important;
    font-size: 15px !important;
}
.footer p, .footer-contact p {
    color: #4a4744 !important;
    font-family: 'Plus Jakarta Sans', sans-serif !important;
    font-size: 14px !important;
    line-height: 1.65 !important;
}
.footer a {
    color: #4a4744 !important;
    transition: all 0.3s ease !important;
    text-decoration: none !important;
}
.footer a:hover {
    color: #b59349 !important;
    padding-left: 6px !important;
}
.footer .footer-links ul li {
    padding: 8px 0 !important;
}
.footer .gradient-button {
    color: #ffffff !important;
    font-weight: 700 !important;
    font-family: 'Plus Jakarta Sans', sans-serif !important;
    background: linear-gradient(135deg, #b59349 0%, #8c6f32 100%) !important;
    padding: 12px 24px !important;
    border-radius: 50px !important;
    display: inline-block !important;
    box-shadow: 0 4px 15px rgba(181, 147, 73, 0.3) !important;
    text-transform: uppercase !important;
    font-size: 12px !important;
    letter-spacing: 1px !important;
}
.footer .gradient-button:hover {
    background: linear-gradient(135deg, #d4b265 0%, #a38241 100%) !important;
    color: #ffffff !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 6px 20px rgba(181, 147, 73, 0.5) !important;
    padding-left: 24px !important;
}
.footer .social-links a {
    background: #ffffff !important;
    color: #b59349 !important;
    border: 1px solid #eae6df !important;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.02) !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    width: 36px !important;
    height: 36px !important;
    border-radius: 50% !important;
    margin-right: 8px !important;
    transition: all 0.3s ease !important;
}
.footer .social-links a:hover {
    background: #b59349 !important;
    color: #ffffff !important;
    border-color: #b59349 !important;
    transform: translateY(-3px) !important;
    box-shadow: 0 6px 15px rgba(181, 147, 73, 0.25) !important;
}
.footer .copyright {
    border-top: 1px solid #eae6df !important;
    padding-top: 30px !important;
    color: #666666 !important;
}
.floating-contact {
    position: fixed;
    bottom: 30px;
    right: 30px;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    z-index: 9999;
    max-height: 56px;
    overflow: visible;
    transition: max-height 0.4s cubic-bezier(0.165, 0.84, 0.44, 1), left 0.5s cubic-bezier(0.165, 0.84, 0.44, 1), right 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) !important;
}
.floating-contact.dragging {
    transition: max-height 0.4s ease !important;
}
.floating-contact:not(.is-active-drag):hover {
    max-height: 320px;
}
/* Snap Right (default behavior) */
.floating-contact, .floating-contact.snap-right {
    align-items: flex-end !important;
}
.floating-contact .contact-sub-buttons, .floating-contact.snap-right .contact-sub-buttons {
    align-items: flex-end !important;
}
/* Snap Left (when snapped to the left side) */
.floating-contact.snap-left {
    align-items: flex-start !important;
}
.floating-contact.snap-left .contact-sub-buttons {
    align-items: flex-start !important;
    right: auto !important;
    left: 0 !important;
}
.main-contact-fab {
    width: 56px;
    height: 56px;
    border-radius: 50%;
    background: #b59349 !important;
    color: #ffffff !important;
    border: 1px solid rgba(255, 255, 255, 0.2) !important;
    cursor: pointer;
    box-shadow: 0 10px 30px rgba(181, 147, 73, 0.4) !important;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
    animation: pulse-fab 2.5s infinite !important;
}
.main-contact-fab:hover {
    background: #a38241 !important;
    transform: rotate(15deg) scale(1.08);
    box-shadow: 0 12px 35px rgba(163, 130, 65, 0.5) !important;
}
.contact-sub-buttons {
    position: absolute;
    bottom: 68px;
    right: 0;
    display: flex;
    flex-direction: column;
    gap: 8px;
    align-items: flex-end;
    opacity: 0;
    visibility: hidden;
    transform: translateY(20px);
    transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
}
.floating-contact:not(.is-active-drag):hover .contact-sub-buttons {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}
.floating-contact .contact-btn {
    display: flex;
    align-items: center;
    gap: 8px;
    background: #ffffff !important;
    color: #1a1816 !important;
    padding: 10px 18px;
    border-radius: 50px;
    font-size: 13px;
    font-weight: 700;
    text-decoration: none;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 1px solid #eae6df;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}
.floating-contact .contact-btn i,
.floating-contact .contact-btn img {
    font-size: 15px;
    flex-shrink: 0;
}
.floating-contact .contact-btn:hover {
    background: #b59349 !important;
    color: #ffffff !important;
    border-color: #b59349 !important;
    transform: translateY(-3px) scale(1.03);
    box-shadow: 0 10px 25px rgba(181, 147, 73, 0.35);
}
.floating-contact .contact-btn:hover i {
    color: #ffffff !important;
}
.floating-contact .phone-btn:hover {
    background: #d93838 !important;
    border-color: #d93838 !important;
}
.floating-contact .zalo-btn:hover {
    background: #0068ff !important;
    border-color: #0068ff !important;
}
.floating-contact .messenger-btn:hover {
    background: #0084ff !important;
    border-color: #0084ff !important;
}
@keyframes pulse-fab {
    0% {
        box-shadow: 0 0 0 0 rgba(181, 147, 73, 0.4);
    }
    70% {
        box-shadow: 0 0 0 15px rgba(181, 147, 73, 0);
    }
    100% {
        box-shadow: 0 0 0 0 rgba(181, 147, 73, 0);
    }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const fabContainer = document.querySelector('.floating-contact');
    const fabButton = document.querySelector('.main-contact-fab');
    
    if (!fabContainer || !fabButton) return;
    
    let isDragging = false;
    let startX, startY;
    let initialLeft, initialTop;
    let hasMoved = false;
    
    fabButton.addEventListener('mousedown', startDrag);
    fabButton.addEventListener('touchstart', startDrag, { passive: true });
    
    function startDrag(e) {
        hasMoved = false;
        isDragging = true;
        
        fabContainer.classList.add('is-active-drag');
        
        const rect = fabContainer.getBoundingClientRect();
        initialLeft = rect.left;
        initialTop = rect.top;
        
        fabContainer.style.transition = 'none';
        
        const clientX = e.type === 'touchstart' ? e.touches[0].clientX : e.clientX;
        const clientY = e.type === 'touchstart' ? e.touches[0].clientY : e.clientY;
        
        startX = clientX - initialLeft;
        startY = clientY - initialTop;
        
        document.addEventListener('mousemove', drag);
        document.addEventListener('touchmove', drag, { passive: false });
        document.addEventListener('mouseup', endDrag);
        document.addEventListener('touchend', endDrag);
    }
    
    function drag(e) {
        if (!isDragging) return;
        
        if (e.cancelable) e.preventDefault();
        
        const clientX = e.type === 'touchmove' ? e.touches[0].clientX : e.clientX;
        const clientY = e.type === 'touchmove' ? e.touches[0].clientY : e.clientY;
        
        let newLeft = clientX - startX;
        let newTop = clientY - startY;
        
        const padding = 20;
        const maxLeft = window.innerWidth - 56 - padding;
        const maxTop = window.innerHeight - 56 - padding;
        
        newLeft = Math.max(padding, Math.min(newLeft, maxLeft));
        newTop = Math.max(padding, Math.min(newTop, maxTop));
        
        const bottomVal = window.innerHeight - newTop - 56;
        
        fabContainer.style.bottom = bottomVal + 'px';
        fabContainer.style.top = 'auto';
        fabContainer.style.right = 'auto';
        fabContainer.style.left = newLeft + 'px';
        
        if (Math.abs(newLeft - initialLeft) > 5 || Math.abs(newTop - initialTop) > 5) {
            hasMoved = true;
            fabContainer.classList.add('dragging');
        }
    }
    
    function endDrag(e) {
        if (!isDragging) return;
        isDragging = false;
        
        fabContainer.classList.remove('is-active-drag');
        
        document.removeEventListener('mousemove', drag);
        document.removeEventListener('touchmove', drag);
        document.removeEventListener('mouseup', endDrag);
        document.removeEventListener('touchend', endDrag);
        
        fabContainer.classList.remove('dragging');
        
        fabContainer.style.transition = 'max-height 0.4s cubic-bezier(0.165, 0.84, 0.44, 1), left 0.5s cubic-bezier(0.165, 0.84, 0.44, 1), right 0.5s cubic-bezier(0.165, 0.84, 0.44, 1)';
        
        const rect = fabContainer.getBoundingClientRect();
        const midPoint = window.innerWidth / 2;
        const padding = 30;
        
        if (rect.left + rect.width / 2 < midPoint) {
            fabContainer.style.left = padding + 'px';
            fabContainer.style.right = 'auto';
            fabContainer.classList.remove('snap-right');
            fabContainer.classList.add('snap-left');
        } else {
            fabContainer.style.left = 'auto';
            fabContainer.style.right = padding + 'px';
            fabContainer.classList.remove('snap-left');
            fabContainer.classList.add('snap-right');
        }
        
        let finalBottom = window.innerHeight - rect.bottom;
        const maxBottom = window.innerHeight - 56 - padding;
        finalBottom = Math.max(padding, Math.min(finalBottom, maxBottom));
        
        fabContainer.style.bottom = finalBottom + 'px';
        fabContainer.style.top = 'auto';
        
        if (hasMoved) {
            e.stopPropagation();
            e.preventDefault();
            
            fabButton.style.pointerEvents = 'none';
            setTimeout(() => {
                fabButton.style.pointerEvents = 'auto';
            }, 100);
        }
    }
});
</script>
