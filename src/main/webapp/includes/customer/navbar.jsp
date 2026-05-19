<%-- 
    Document   : navbar2
    Created on : Jun 24, 2024, 3:26:58 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/includes/customer/header.jsp"/>


<header id="header" class="header fixed-top d-flex flex-column align-items-stretch" style="padding: 0 !important; transition: all 0.4s ease-in-out !important;">
    <!-- Top Announcement Bar -->
    <div class="top-announcement-bar d-flex align-items-center justify-content-center" style="background: #1a1816 !important; height: 32px; border-bottom: 1px solid rgba(181, 147, 73, 0.12); width: 100%; z-index: 10;">
        <span style="color: #eae6df; font-size: 11px; font-weight: 700; letter-spacing: 2px; text-transform: uppercase; font-family: 'Plus Jakarta Sans', sans-serif;">
            Trải nghiệm dịch vụ tốt nhất cùng <span style="color: #b59349;">SmartRide</span>
        </span>
    </div>

    <!-- Main Navigation Bar Container -->
    <div class="container-fluid container-xl position-relative d-flex align-items-center" style="height: 72px;">

        <a href="home" class="logo d-flex align-items-center me-auto" style="text-decoration: none; padding: 4px 0; transition: all 0.3s ease;">
            <img src="images/logo.png?v=<%=System.currentTimeMillis()%>" alt="SmartRide Logo" style="height: 42px; width: auto; object-fit: contain; transition: filter 0.4s ease-in-out, transform 0.3s ease;" />
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="home">Trang Chủ<br></a></li>
                <li><a href="about.jsp">Về Chúng Tôi</a></li>
                <li><a href="motorcycle">Xe Máy</a></li>
                <li><a href="pricing">Bảng Giá</a></li>
                <li class="dropdown"><a style="cursor: pointer"><span>Dịch Vụ</span> <i
                            class="bi bi-chevron-down toggle-dropdown"></i></a>
                    <ul>
                        <li><a href="FAQ">FAQs</a></li>
                        <li><a href="event">Sự Kiện</a></li>
                        <li><a href="touristLocation">Địa Điểm Du Lịch</a></li>
                         <li><a href="policies.jsp">Chính Sách & Điều Khoản</a></li> 
                    </ul>
                </li>
                <li><a href="contact.jsp">Liên Hệ</a></li>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
        <c:if test="${sessionScope.account == null}">
            <a class="btn login" href="login.jsp" style="color: white;">Đăng Nhập</a>
        </c:if>
        <c:if test="${sessionScope.account != null}">

            <div class="user-menu-wrap">
                <c:choose>
                    <c:when test="${sessionScope.account.image != null}">
                        <a class="mini-photo-wrapper"><img class="mini-photo" style="object-fit: cover; cursor: pointer" src="${sessionScope.account.image}?${now.time}" width="36" height="36"/></a>
                    </c:when>
                    <c:otherwise>
                        <a class="mini-photo-wrapper"><img class="mini-photo" style="object-fit: cover; cursor: pointer"  src="images\avarta.jpg" width="36" height="36"/></a>

                    </c:otherwise>
                </c:choose>





                <div class="menu-container">
                    <ul class="user-menu">
                        <div class="profile-highlight">
                            <c:choose>
                                <c:when test="${sessionScope.account.image != null}">
                                    <img src="${sessionScope.account.image}?${now.time}" alt="profile-img" width="36" height="36">
                                </c:when>
                                <c:otherwise>
                                    <img src="images/avarta.jpg" alt="profile-img" width="36" height="36">
                                </c:otherwise>
                            </c:choose>


                            <div class="details">
                                <div class="sitename" id="profile-name">SmartRide</div>
                                <div id="profile-footer">Xin chào ${sessionScope.account.email}</div>
                            </div>
                        </div>
                        <!--                        <li class="user-menu__item">
                                                    <a class="user-menu-link" href="#">
                                                        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1604623/trophy.png" alt="trophy_icon" width=20 height=20>
                                                        <div>Achievements</div>
                                                    </a>
                                                </li>-->
                        <li class="user-menu__item">
                            <a class="user-menu-link" href="profileCustomer.jsp">
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1604623/team.png" alt="team_icon" width=20 height=20 >
                                <div>Thông tin cá nhân</div>
                            </a>
                        </li>
                        <li class="user-menu__item">
                            <a class="user-menu-link" href="bookingHistory?status=all">
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1604623/book.png" alt="team_icon" width=20 height=20 >
                                <div>Quản lý đặt hàng</div>
                            </a>
                        </li>
                        <div class="footer">
                            <li class="user-menu__item"><a class="user-menu-link" href="logout" style="background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);background-clip: text;
                                                           color: transparent !important; font-weight: bold; font-size: large; display: flex; justify-content: center;">Đăng xuất</a></li>
                            <!--<li class="user-menu__item"><a class="user-menu-link" href="#">Settings</a></li>-->
                        </div>
                    </ul>
                </div>
            </div>
        </c:if>
    </div>

</header>

<style>

    * {
        box-sizing: border-box;
        /*        margin: 0;
                padding: 0;*/
    }

    /* Clean Logo styling & elegant hover */
    .logo {
        background: transparent !important;
        border: none !important;
        box-shadow: none !important;
        padding: 0 !important;
    }
    
    .logo img {
        transition: filter 0.4s ease-in-out, transform 0.3s ease !important;
    }
    
    .logo:hover img {
        transform: scale(1.05);
    }

    /* Invert logo to solid luxury white only at the top of the Home page (transparent background) */
    body.index-page:not(.scrolled) .header .logo img {
        filter: brightness(0) invert(1) !important;
    }

    /* Default solid glassmorphic navbar for scrolled states & subpages */
    #header {
        background: rgba(255, 255, 255, 0.95) !important;
        border-bottom: 1px solid rgba(181, 147, 73, 0.1) !important;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.03) !important;
        backdrop-filter: blur(10px);
        transition: transform 0.35s cubic-bezier(0.165, 0.84, 0.44, 1), background-color 0.4s ease-in-out, border-bottom 0.4s ease-in-out, box-shadow 0.4s ease-in-out !important;
    }

    /* Shift header up by 32px to hide announcement bar smoothly when scrolling down */
    body.scrolled #header {
        transform: translateY(-32px) !important;
    }

    /* Fade out top bar when scrolled to prevent overlapping visibility */
    .top-announcement-bar {
        transition: opacity 0.3s ease, visibility 0.3s ease !important;
    }
    body.scrolled .top-announcement-bar {
        opacity: 0 !important;
        visibility: hidden !important;
        pointer-events: none !important;
    }

    /* Transparent navbar only at the top of the Home page */
    body.index-page:not(.scrolled) #header {
        background: transparent !important;
        border-bottom: none !important;
        box-shadow: none !important;
    }

    /* White text for navbar on index page before scrolling */
    body.index-page:not(.scrolled) .navmenu > ul > li > a, 
    body.index-page:not(.scrolled) .navmenu > ul > li > a:focus {
        color: #ffffff !important;
    }
    
    body.index-page:not(.scrolled) .login {
        color: #ffffff !important;
        border-color: #ffffff !important;
    }
    
    body.index-page:not(.scrolled) .login:hover {
        background: #ffffff !important;
        color: #1a1816 !important;
    }
    
    body.index-page:not(.scrolled) .navmenu .dropdown ul a {
        color: #2b2824 !important;
    }

    body {
        background-color: #fbfaf8 !important;
        color: #2b2824 !important;
        font-family: 'Plus Jakarta Sans', sans-serif !important;
    }

    /* Spread out the navigation bar items evenly with a modern flex gap */
    .navmenu > ul {
        display: flex !important;
        gap: 28px !important; /* Generous gap to distribute and spread out links beautifully */
        align-items: center !important;
    }

    /* Cinematic bright navbar text with matte gold hover */
    .navmenu a, .navmenu a:focus {
        color: #1a1816 !important;
        font-family: 'Plus Jakarta Sans', sans-serif !important;
        font-weight: 600 !important; /* Semi-bold weight for striking elegance */
        font-size: 15px !important;
        letter-spacing: 0.5px !important; /* Professional letter spacing */
        transition: all 0.3s ease !important;
        position: relative !important;
        padding: 10px 2px !important; /* Compact link padding relying on gap for spacing */
        background: transparent !important;
    }
    
    .navmenu a::after {
        content: "" !important;
        position: absolute !important;
        width: 0 !important;
        height: 2px !important;
        bottom: -2px !important;
        left: 0 !important;
        background-color: #b59349 !important;
        transition: width 0.3s ease-in-out !important;
    }
    
    .navmenu a.active::after,
    .navmenu a:hover::after {
        width: 100% !important;
    }

    /* Completely eliminate the ugly yellow/beige background rectangle on hover and force transparent text color transition */
    .navmenu li:hover>a,
    .navmenu a:hover, 
    .navmenu a.active,
    .navmenu .active, 
    .navmenu .active:focus {
        background: transparent !important;
        background-image: none !important;
        background-clip: unset !important;
        -webkit-background-clip: unset !important;
        color: #b59349 !important;
    }
    .navmenu .dropdown ul {
        display: flex !important;
        flex-direction: column !important;
        align-items: stretch !important;
        gap: 0 !important;
        background-color: #ffffff !important;
        border: 1px solid rgba(181, 147, 73, 0.15) !important;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.05) !important;
        padding: 8px 0 !important;
        min-width: 200px !important;
    }
    .navmenu .dropdown ul li {
        display: block !important;
        width: 100% !important;
        float: none !important;
        margin: 0 !important;
        padding: 0 !important;
    }
    .navmenu .dropdown ul a {
        display: block !important;
        width: 100% !important;
        color: #2b2824 !important;
        background-color: transparent !important;
        padding: 10px 20px !important;
        font-size: 14px !important;
        font-weight: 500 !important;
        text-align: left !important;
        transition: all 0.2s ease !important;
    }
    .navmenu .dropdown ul a::after {
        display: none !important;
    }
    .navmenu .dropdown ul a:hover {
        color: #b59349 !important;
        background-color: #f5f2eb !important;
    }

    ul {
        list-style: none;
    }
    ol, ul {
        padding-left: 0rem !important;
    }

    /* User Menu */
    .user-menu-wrap {
        margin-left: 60px;
    }

    .menu-container {
        visibility: hidden;
        opacity: 0;
    }

    .menu-container.active {
        visibility: visible;
        opacity: 1;
        transition: all .2s ease-in-out;
    }

    .user-menu {
        position: absolute;
        left: 87.5%;
        background-color: #ffffff !important;
        color: #2b2824 !important;
        width: 256px;
        border-radius: 8px;
        border: 1px solid #eae6df !important;
        padding-top: 5px;
        padding-bottom: 5px;
        margin-top: 20px;
        margin-right: 30px;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08) !important;
    }

    .user-menu .profile-highlight {
        display: flex;
        border-bottom: 1px solid #eae6df !important;
        padding: 12px 16px;
        margin-bottom: 6px;
    }

    .user-menu .profile-highlight img {
        width: 48px;
        height: 48px;
        border-radius: 25px;
        object-fit: cover;
    }

    .user-menu .profile-highlight .details {
        display: flex;
        flex-direction: column;
        margin: auto 12px;
    }

    .user-menu .profile-highlight #profile-name {
        font-weight: 600;
        font-size: 16px;
        color: #b59349 !important;
    }

    .user-menu .profile-highlight #profile-footer {
        font-weight: 300;
        font-size: 14px;
        margin-top: 4px;
        color: #666666 !important;
    }

    .user-menu .footer {
        border-top: 1px solid #eae6df !important;
        padding-top: 6px;
        margin-top: 6px;
    }

    .user-menu .footer .user-menu-link {
        font-size: 13px;
    }

    .user-menu .user-menu-link {
        display: flex;
        text-decoration: none;
        color: #2b2824 !important;
        font-weight: 400;
        font-size: 14px;
        padding: 12px 16px;
    }

    .user-menu .user-menu-link div {
        margin: auto 10px;
    }

    .user-menu .user-menu-link:hover {
        background-color: #f5f2eb !important;
        color: #b59349 !important;
    }

    .user-menu:before {
        position: absolute;
        top: -16px;
        left: 120px;
        display: inline-block;
        content: "";
        border: 8px solid transparent;
        border-bottom-color: #eae6df !important;
    }

    .user-menu:after {
        position: absolute;
        top: -14px;
        left: 121px;
        display: inline-block;
        content: "";
        border: 7px solid transparent;
        border-bottom-color: #ffffff !important;
    }
    .mini-photo {
        width: 45px;
        height: 45px;
        border-radius: 50% !important;
        box-shadow: #b59349 0 0 5px !important;
    }

    /*cu*/
    .rental {
        width: 50%;
        padding: 2.5% 0%;
        background: #b59349 !important;
        font-size: 24px;
        font-weight: 800;
        color: white !important;
        transition: transform .2s;
        border: none;
    }
    .rental:hover {
        background: #a38241 !important;
        color: white !important;
    }
    .rentalbutton:hover {
        transform: scale(1.1);
        margin-left: 5%;
    }

    .login {
        background: transparent !important;
        border: 1px solid #b59349 !important;
        margin-left: 3%;
        color: #b59349 !important;
        transition: all 0.3s;
    }
    .login:hover {
        background: #b59349 !important;
        color: white !important;
    }
    .sitename {
        color: #b59349 !important;
    }
    .gradient-button {
        background: #b59349 !important;
        color: white !important; /* Màu chữ */
        padding: 10px 20px; /* Đệm cho nút */
        border-radius: 5px; /* Bo góc */
        text-decoration: none; /* Xóa gạch chân */
        display: inline-block; /* Hiển thị như một khối nội dòng */
        transition: background 0.3s; /* Hiệu ứng chuyển đổi nền khi di chuột */
        margin-bottom: 4%;
    }

    .gradient-button:hover {
        background: #a38241 !important;
        color: white !important;
    }


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function yourFunction() {
            console.log("Hàm này sẽ được thực hiện sau mỗi 10 giây.");
            $.ajax({
                type: "POST",
                url: "auto", // Thay đổi URL tới servlet của bạn
                success: function (response) {
                    console.log("Data sent successfully:", response);
                },
                error: function (xhr, status, error) {
                    console.error("Error sending data:", error);
                }
            });
        
    }

// Thiết lập hàm để thực hiện sau mỗi 10 giây
    setInterval(yourFunction, 1 * 60 * 60 * 1000);

// Thực hiện ngay lập tức lần đầu tiên nếu cần thiết
    yourFunction();
    
    // Auto-detect current page and apply .active class with gold underline transition
    document.addEventListener("DOMContentLoaded", function() {
        const path = window.location.pathname;
        const page = path.split("/").pop().toLowerCase();
        const navLinks = document.querySelectorAll(".navmenu a");
        
        let activeFound = false;
        navLinks.forEach(link => {
            const href = link.getAttribute("href");
            if (href) {
                const hrefLower = href.toLowerCase();
                // Check if page matches href exactly, or starts with it (for query params/servlets), or default home
                if (page === hrefLower || 
                    (hrefLower !== "home" && page.startsWith(hrefLower.split(".")[0])) ||
                    (hrefLower === "home" && (page === "" || page === "home" || page === "index.jsp"))) {
                    link.classList.add("active");
                    activeFound = true;
                }
            }
        });
        
        // If a nested dropdown item is active, highlight the parent dropdown menu
        if (activeFound) {
            const activeDropdownItem = document.querySelector(".navmenu .dropdown ul a.active");
            if (activeDropdownItem) {
                const parentDropdown = activeDropdownItem.closest(".dropdown").querySelector("a");
                if (parentDropdown) {
                    parentDropdown.classList.add("active");
                }
            }
        }
        
        // Universal scroll listener for navbar header styling across all pages
        window.addEventListener('scroll', function() {
            if (window.scrollY > 100) {
                document.body.classList.add('scrolled');
            } else {
                document.body.classList.remove('scrolled');
            }
        });

        // Intercept sidebar link clicks for seamless SPA transition on Customer Profile pages
        const initSPANavigation = () => {
            document.querySelectorAll(".sidebar-item").forEach(link => {
                if (link.getAttribute("href").startsWith("javascript:")) return;
                
                // Clone node to prevent duplicate event listeners
                const newLink = link.cloneNode(true);
                link.parentNode.replaceChild(newLink, link);
            });
            
            document.querySelectorAll(".sidebar-item").forEach(link => {
                const url = link.getAttribute("href");
                if (!url || url.startsWith("javascript:")) return;
                
                link.addEventListener("click", (e) => {
                    e.preventDefault();
                    
                    const panel = document.getElementById("panel");
                    if (!panel) {
                        window.location.href = url;
                        return;
                    }
                    
                    panel.style.transition = "opacity 0.15s ease, transform 0.15s ease";
                    panel.style.opacity = "0";
                    panel.style.transform = "translateY(5px)";
                    
                    fetch(url)
                        .then(response => response.text())
                        .then(html => {
                            const parser = new DOMParser();
                            const doc = parser.parseFromString(html, "text/html");
                            const newPanel = doc.getElementById("panel");
                            
                            if (newPanel) {
                                // Update content
                                panel.innerHTML = newPanel.innerHTML;
                                
                                // Trigger fade in
                                setTimeout(() => {
                                    panel.style.opacity = "1";
                                    panel.style.transform = "translateY(0)";
                                }, 50);
                                
                                // Update browser history URL
                                history.pushState(null, '', url);
                                
                                // Update active link styling in all sidebars
                                document.querySelectorAll(".sidebar-item").forEach(item => {
                                    item.classList.remove("active");
                                    const itemHref = item.getAttribute("href");
                                    if (itemHref === url || 
                                        (url.includes("bookingHistory") && itemHref && itemHref.includes("bookingHistory")) ||
                                        (url.includes("transaction") && itemHref && itemHref.includes("transaction")) ||
                                        (url.includes("profileCustomer") && itemHref && itemHref.includes("profileCustomer")) ||
                                        (url.includes("settingsProfile") && itemHref && itemHref.includes("settingsProfile"))) {
                                        item.classList.add("active");
                                    }
                                });
                                
                                // Re-initialize any page-specific JS with temporary DOMContentLoaded override
                                const scripts = doc.querySelectorAll("script");
                                const originalAddEventListener = document.addEventListener;
                                document.addEventListener = function(type, listener, options) {
                                    if (type === 'DOMContentLoaded') {
                                        setTimeout(listener, 0);
                                    } else {
                                        originalAddEventListener.call(document, type, listener, options);
                                    }
                                };
                                
                                scripts.forEach(script => {
                                    if (script.src) {
                                        // Skip common static libraries to avoid duplicate loading
                                        if (script.src.includes("chartjs") || 
                                            script.src.includes("perfect-scrollbar") || 
                                            script.src.includes("buttons.js") || 
                                            script.src.includes("soft-ui-dashboard-tailwind") || 
                                            script.src.includes("cropperjs") ||
                                            script.src.includes("jquery") ||
                                            script.src.includes("bootstrap")) {
                                            return;
                                        }
                                        const newScript = document.createElement("script");
                                        newScript.src = script.src;
                                        document.body.appendChild(newScript);
                                    } else if (script.innerHTML.trim()) {
                                        try {
                                            eval(script.innerHTML);
                                        } catch (e) {
                                            console.error("Error executing page script:", e);
                                        }
                                    }
                                });
                                
                                // Restore original addEventListener
                                setTimeout(() => {
                                    document.addEventListener = originalAddEventListener;
                                }, 100);
                                
                                // Re-bind click handlers
                                initSPANavigation();
                            } else {
                                window.location.href = url;
                            }
                        })
                        .catch(err => {
                            console.error("SPA fetch failed, falling back to standard navigation:", err);
                            window.location.href = url;
                        });
                });
            });
        };
        
        initSPANavigation();
    });

    const miniPhoto = document.querySelector('.mini-photo-wrapper');
    if (miniPhoto) {
        miniPhoto.addEventListener('click', function () {
            document.querySelector('.menu-container').classList.toggle('active');
        });
    }

   

</script>

<script
    src="https://www.chatbase.co/embed.min.js"
    chatbotId="qUNf-UR7ycIWmYS6ZiWCL"
    domain="www.chatbase.co"
    defer>
</script>

