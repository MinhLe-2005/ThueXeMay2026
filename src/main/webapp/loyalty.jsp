<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tích Lũy & Thưởng - SmartRide</title>
    <jsp:include page="/includes/customer/header.jsp" />
    <style>
        .loyalty-container {
            max-width: 900px;
            margin: 40px auto;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        .loyalty-card {
            background: linear-gradient(135deg, #1f1c2c, #928DAB);
            color: white;
            padding: 30px;
            border-radius: 16px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
            margin-bottom: 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .loyalty-card::after {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 60%);
            transform: rotate(45deg);
        }

        .tier-badge {
            background: rgba(255, 255, 255, 0.2);
            padding: 10px 20px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 2px;
            display: inline-block;
            margin-bottom: 15px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.3);
        }

        .spent-amount {
            font-size: 36px;
            font-weight: 800;
            margin: 0;
            letter-spacing: 1px;
            text-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .loyalty-icon {
            font-size: 80px;
            opacity: 0.9;
            text-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        /* Progress Bar */
        .progress-wrapper {
            margin-top: 20px;
            position: relative;
        }
        
        .progress-labels {
            display: flex;
            justify-content: space-between;
            font-size: 13px;
            margin-bottom: 8px;
            color: rgba(255,255,255,0.8);
            font-weight: 500;
        }

        .progress-bar-bg {
            background: rgba(255, 255, 255, 0.3);
            height: 12px;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.3);
            width: 100%;
        }

        .progress-bar-fill {
            background: linear-gradient(90deg, #ffd700, #ff8c00);
            height: 100%;
            border-radius: 6px;
            transition: width 1s ease-in-out;
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.6);
        }

        /* Milestones Grid */
        .milestones {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 40px;
        }

        .milestone-card {
            background: #f8f9fa;
            border: 1px solid #eee;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s ease;
        }

        .milestone-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.05);
            border-color: #d4af37;
        }

        .milestone-card.achieved {
            background: linear-gradient(145deg, #fff, #f0f8ff);
            border-color: #4CAF50;
        }

        .milestone-icon {
            font-size: 30px;
            margin-bottom: 15px;
        }

        .milestone-card.achieved .milestone-icon {
            color: #4CAF50;
        }

        /* Vouchers */
        .vouchers-section h3 {
            font-size: 20px;
            color: #333;
            margin-bottom: 20px;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 10px;
        }

        .voucher-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
        }

        .voucher-item {
            background: #fff;
            border: 2px dashed #b59349;
            border-radius: 12px;
            padding: 20px;
            position: relative;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 15px;
            box-shadow: 0 2px 10px rgba(181,147,73,0.10);
        }
        
        .voucher-item:hover {
            box-shadow: 0 8px 25px rgba(181,147,73,0.25);
            transform: translateY(-3px);
            border-color: #d4af37;
        }

        .voucher-icon {
            background: #fff8e1;
            color: #d4af37;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            flex-shrink: 0;
        }

        .voucher-info h4 {
            margin: 0 0 6px;
            font-size: 16px;
            font-weight: 700;
            color: #1a1a1a;
        }
        .voucher-discount-label {
            font-size: 22px;
            font-weight: 800;
            color: #b59349;
            margin: 4px 0 6px;
            letter-spacing: -0.5px;
        }
        .voucher-info p {
            margin: 0;
            font-size: 13px;
            color: #555;
            font-weight: 500;
        }
        .voucher-code {
            display: inline-block;
            margin-top: 8px;
            background: #f5f5f5;
            padding: 4px 10px;
            border-radius: 6px;
            font-family: monospace;
            font-weight: bold;
            color: #d4af37;
            letter-spacing: 1px;
        }
        @keyframes shimmer {
            0%   { left: -30px; }
            100% { left: 110%; }
        }
    </style>
</head>
<body style="background-color: #f4f6f9; color: #333;">
    <jsp:include page="/includes/customer/navbar.jsp" />
    
    <div class="loyalty-container" style="margin-top: 100px;">
        
        <%
            Float totalSpentObj = (Float) request.getAttribute("totalSpent");
            float spent = (totalSpentObj != null) ? totalSpentObj : 0f;
            
            String tier = "MEMBER";
            String tierName = "Thành Viên Mới";
            String icon = "bi-star";
            float nextMilestone = 2000000f;
            float prevMilestone = 0f;
            
            if (spent >= 10000000f) {
                tier = "DIAMOND";
                tierName = "Kim Cương";
                icon = "bi-gem";
                prevMilestone = 10000000f;
                nextMilestone = 10000000f; // Maxed out
            } else if (spent >= 5000000f) {
                tier = "GOLD";
                tierName = "Vàng";
                icon = "bi-award";
                prevMilestone = 5000000f;
                nextMilestone = 10000000f;
            } else if (spent >= 2000000f) {
                tier = "SILVER";
                tierName = "Bạc";
                icon = "bi-shield-check";
                prevMilestone = 2000000f;
                nextMilestone = 5000000f;
            }
            
            float progressPercent = 100f;
            if (nextMilestone > prevMilestone) {
                progressPercent = ((spent - prevMilestone) / (nextMilestone - prevMilestone)) * 100f;
            }
        %>
        
        <div class="loyalty-card">
            <div style="flex: 1; z-index: 1;">
                <div class="tier-badge"><i class="bi <%= icon %>"></i> Hạng <%= tierName %></div>
                <div style="font-size: 14px; opacity: 0.9; margin-bottom: 5px;">Tổng chi tiêu tích lũy</div>
                <div class="spent-amount">
                    <fmt:formatNumber value="<%= spent %>" type="currency" currencySymbol="đ" maxFractionDigits="0" />
                </div>
                
                <div class="progress-wrapper" style="margin-top: 18px;">
                    <%
                        // Progress from 0 → 10,000,000 (max milestone)
                        float maxMilestone = 10000000f;
                        float overallPct = Math.min(100f, (spent / maxMilestone) * 100f);
                        float pct2M = Math.min(100f, (2000000f / maxMilestone) * 100f); // 20%
                        float pct5M = Math.min(100f, (5000000f / maxMilestone) * 100f); // 50%
                        float pct10M = 100f;
                    %>

                    <!-- Labels top -->
                    <div style="display:flex; justify-content:space-between; margin-bottom:8px; font-size:12px; opacity:0.85; font-weight:600;">
                        <span>0đ</span>
                        <span style="position:relative; left:-10px;">2.000.000đ<br><span style="font-size:10px; opacity:0.75;">Hạng Bạc</span></span>
                        <span style="position:relative; right:-5px;">5.000.000đ<br><span style="font-size:10px; opacity:0.75;">Hạng Vàng</span></span>
                        <span>10.000.000đ<br><span style="font-size:10px; opacity:0.75;">Kim Cương</span></span>
                    </div>

                    <!-- Bar container -->
                    <div style="position:relative; width:100%; height:18px; border-radius:9px; background:rgba(255,255,255,0.3); box-shadow: inset 0 2px 5px rgba(0,0,0,0.3); overflow:visible;">
                        <!-- Fill -->
                        <div style="position:absolute; top:0; left:0; height:100%; width:<%= overallPct %>%; background:linear-gradient(90deg, #ffd700, #ff8c00); border-radius:9px; box-shadow:0 0 12px rgba(255,200,0,0.7); transition:width 1.2s ease; overflow:hidden;">
                            <!-- Shimmer effect -->
                            <div style="position:absolute; top:0; left:-30px; width:20px; height:100%; background:rgba(255,255,255,0.35); transform:skewX(-20deg); animation:shimmer 2.5s infinite;" ></div>
                        </div>

                        <!-- Milestone tick: 2M -->
                        <% String tick2Color = (spent >= 2000000f) ? "#ffd700" : "rgba(255,255,255,0.5)"; %>
                        <div style="position:absolute; top:-4px; left:<%= pct2M %>%; transform:translateX(-50%); z-index:2;">
                            <div style="width:10px; height:26px; background:<%= tick2Color %>; border-radius:3px; border:2px solid rgba(255,255,255,0.8);"></div>
                        </div>

                        <!-- Milestone tick: 5M -->
                        <% String tick5Color = (spent >= 5000000f) ? "#ffd700" : "rgba(255,255,255,0.5)"; %>
                        <div style="position:absolute; top:-4px; left:<%= pct5M %>%; transform:translateX(-50%); z-index:2;">
                            <div style="width:10px; height:26px; background:<%= tick5Color %>; border-radius:3px; border:2px solid rgba(255,255,255,0.8);"></div>
                        </div>
                    </div>

                    <!-- Current spending marker label -->
                    <% long spentLong = (long) spent; %>
                    <div style="position:relative; margin-top:10px; height:20px;">
                        <div style="position:absolute; left:<%= overallPct %>%; transform:translateX(-50%); background:rgba(255,255,255,0.95); color:#b59349; font-weight:700; font-size:11px; padding:2px 8px; border-radius:10px; white-space:nowrap; box-shadow:0 2px 6px rgba(0,0,0,0.2); border:1.5px solid #e8c76a;">
                            &#128205; <fmt:formatNumber value="<%= spentLong %>" type="number" groupingUsed="true" maxFractionDigits="0"/>đ
                        </div>
                    </div>

                    <% if (!tier.equals("DIAMOND")) { %>
                    <div style="margin-top:24px; font-size:13px; opacity:0.9; text-align:right;">
                        Còn <strong><fmt:formatNumber value="<%= nextMilestone - spent %>" type="currency" currencySymbol="đ" maxFractionDigits="0" /></strong> nữa để lên hạng tiếp theo
                    </div>
                    <% } else { %>
                    <div style="margin-top:24px; font-size:13px; opacity:0.9; text-align:right; font-weight:700;">🏆 Bạn đã đạt hạng cao nhất!</div>
                    <% } %>
                </div>
            </div>
            <div class="loyalty-icon" style="z-index: 1;">
                <i class="bi <%= icon %>"></i>
            </div>
        </div>

        <h3 style="font-size: 20px; margin-bottom: 20px; color: #333;">Hành trình đặc quyền</h3>
        <div class="milestones">
            <div class="milestone-card <%= spent >= 2000000f ? "achieved" : "" %>">
                <div class="milestone-icon"><i class="bi bi-shield-check" style="color: #9e9e9e;"></i></div>
                <h4 style="margin:0 0 10px;">Hạng Bạc</h4>
                <p style="font-size: 13px; color: #666; margin:0 0 10px;">Mốc: 2.000.000 đ</p>
                <div style="font-size: 12px; font-weight: 600; color: #d4af37;">Thưởng Voucher Giảm 15%</div>
            </div>
            <div class="milestone-card <%= spent >= 5000000f ? "achieved" : "" %>">
                <div class="milestone-icon"><i class="bi bi-award" style="color: #ffc107;"></i></div>
                <h4 style="margin:0 0 10px;">Hạng Vàng</h4>
                <p style="font-size: 13px; color: #666; margin:0 0 10px;">Mốc: 5.000.000 đ</p>
                <div style="font-size: 12px; font-weight: 600; color: #d4af37;">Thưởng Voucher Giảm 30%</div>
            </div>
            <div class="milestone-card <%= spent >= 10000000f ? "achieved" : "" %>">
                <div class="milestone-icon"><i class="bi bi-gem" style="color: #00bcd4;"></i></div>
                <h4 style="margin:0 0 10px;">Kim Cương</h4>
                <p style="font-size: 13px; color: #666; margin:0 0 10px;">Mốc: 10.000.000 đ</p>
                <div style="font-size: 12px; font-weight: 600; color: #d4af37;">Thưởng Voucher Giảm 50%</div>
            </div>
        </div>

        <div class="vouchers-section">
            <h3><i class="bi bi-ticket-perforated"></i> Kho Voucher Của Bạn</h3>
            
            <c:choose>
                <c:when test="${not empty myVouchers}">
                    <div class="voucher-grid">
                        <c:forEach var="v" items="${myVouchers}">
                            <div class="voucher-item">
                                <div class="voucher-icon">
                                    <i class="bi bi-gift"></i>
                                </div>
                                <div class="voucher-info">
                                    <h4>${v.description}</h4>
                                    <c:choose>
                                        <c:when test="${v.discountAmount <= 100}">
                                            <div class="voucher-discount-label">-<fmt:formatNumber value="${v.discountAmount}" maxFractionDigits="0"/>%</div>
                                            <p>Giảm theo % tổng đơn hàng</p>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="voucher-discount-label">-<fmt:formatNumber value="${v.discountAmount}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></div>
                                            <p>Giảm cố định</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="voucher-code">${v.code}</div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="text-align: center; padding: 40px; background: #f9f9f9; border-radius: 12px;">
                        <i class="bi bi-emoji-frown" style="font-size: 40px; color: #ccc; margin-bottom: 10px; display: block;"></i>
                        <p style="color: #777;">Bạn chưa có voucher nào. Hãy đặt xe để tích điểm nhé!</p>
                        <a href="/home" style="display: inline-block; margin-top: 15px; padding: 10px 20px; background: #b59349; color: #fff; text-decoration: none; border-radius: 8px; font-weight: 600;">Đặt Xe Ngay</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
    <jsp:include page="/includes/customer/footer.jsp" />
</body>
</html>
