import os
filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# For chosen motor discount
content = content.replace(
    '<h2 class="main-price price-day" ><fmt:formatNumber value="${discountedDay}" pattern="#,##0"/> ₫/Ngày</h2>',
    '<h2 class="main-price price-day" data-price="${discountedDay}"><fmt:formatNumber value="${discountedDay}" pattern="#,##0"/> ₫/Ngày</h2>'
)
content = content.replace(
    '<h2 class="main-price price-week" ><fmt:formatNumber value="${discountedWeek}" pattern="#,##0"/> ₫/Ngày (Tuần)</h2>',
    '<h2 class="main-price price-week" data-price="${discountedWeek}"><fmt:formatNumber value="${discountedWeek}" pattern="#,##0"/> ₫/Ngày (Tuần)</h2>'
)
content = content.replace(
    '<h2 class="main-price price-month" ><fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/> ₫/Ngày (Tháng)</h2>',
    '<h2 class="main-price price-month" data-price="${discountedMonth}"><fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/> ₫/Ngày (Tháng)</h2>'
)

# For normal prices
content = content.replace(
    '<h2 class="main-price price-day" ><fmt:formatNumber value="${p.dailyPriceForDay}" pattern="#,##0"/> ₫/Ngày</h2>',
    '<h2 class="main-price price-day" data-price="${p.dailyPriceForDay}"><fmt:formatNumber value="${p.dailyPriceForDay}" pattern="#,##0"/> ₫/Ngày</h2>'
)
content = content.replace(
    '<h2 class="main-price price-week" ><fmt:formatNumber value="${p.dailyPriceForWeek}" pattern="#,##0"/> ₫/Ngày (Tuần)</h2>',
    '<h2 class="main-price price-week" data-price="${p.dailyPriceForWeek}"><fmt:formatNumber value="${p.dailyPriceForWeek}" pattern="#,##0"/> ₫/Ngày (Tuần)</h2>'
)
content = content.replace(
    '<h2 class="main-price price-month" ><fmt:formatNumber value="${p.dailyPriceForMonth}" pattern="#,##0"/> ₫/Ngày (Tháng)</h2>',
    '<h2 class="main-price price-month" data-price="${p.dailyPriceForMonth}"><fmt:formatNumber value="${p.dailyPriceForMonth}" pattern="#,##0"/> ₫/Ngày (Tháng)</h2>'
)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated data-price in booking.jsp")
