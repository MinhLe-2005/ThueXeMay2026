import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# Fix the price display for discounted and non-discounted bikes
content = re.sub(r'<span style="text-decoration: line-through; color: #999; font-size: 16px;">₫\$\{p.dailyPriceForDay\}00</span>', r'<span style="text-decoration: line-through; color: #999; font-size: 16px;"><fmt:formatNumber value="${p.dailyPriceForDay}" pattern="#,##0"/> ₫</span>', content)

content = re.sub(r'<h2 class="main-price price-day" >₫\$\{discountedDay\}00/Ngày</h2>', r'<h2 class="main-price price-day" data-price="${discountedDay}"><fmt:formatNumber value="${discountedDay}" pattern="#,##0"/> ₫/Ngày</h2>', content)
content = re.sub(r'<h2 class="main-price price-week" >₫\$\{discountedWeek\}00/Ngày</h2>', r'<h2 class="main-price price-week" data-price="${discountedWeek}"><fmt:formatNumber value="${discountedWeek}" pattern="#,##0"/> ₫/Ngày</h2>', content)
content = re.sub(r'<h2 class="main-price price-month" >₫\$\{discountedMonth\}00/Ngày</h2>', r'<h2 class="main-price price-month" data-price="${discountedMonth}"><fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/> ₫/Ngày</h2>', content)

content = re.sub(r'<h2 class="main-price price-day" >₫\$\{p.dailyPriceForDay\}00/Ngày</h2>', r'<h2 class="main-price price-day" data-price="${p.dailyPriceForDay}"><fmt:formatNumber value="${p.dailyPriceForDay}" pattern="#,##0"/> ₫/Ngày</h2>', content)
content = re.sub(r'<h2 class="main-price price-week" >₫\$\{p.dailyPriceForWeek\}00/Ngày</h2>', r'<h2 class="main-price price-week" data-price="${p.dailyPriceForWeek}"><fmt:formatNumber value="${p.dailyPriceForWeek}" pattern="#,##0"/> ₫/Ngày</h2>', content)
content = re.sub(r'<h2 class="main-price price-month" >₫\$\{p.dailyPriceForMonth\}00/Ngày</h2>', r'<h2 class="main-price price-month" data-price="${p.dailyPriceForMonth}"><fmt:formatNumber value="${p.dailyPriceForMonth}" pattern="#,##0"/> ₫/Ngày</h2>', content)

# Second block (for the chosenmotor != o.motorcycleId block)
content = re.sub(r'<h2 class="main-price price-day" >₫\$\{discountedDay\}00/Ngày</h2>', r'<h2 class="main-price price-day" data-price="${discountedDay}"><fmt:formatNumber value="${discountedDay}" pattern="#,##0"/> ₫/Ngày</h2>', content)
# It's globally replacing because of re.sub without count, so both blocks are handled!

# Now inject the banner
banner_html = """                            <div class="fieldset-content">
                                <div id="selected-bikes-banner" style="background: #fdf5e6; border-left: 4px solid #b59349; padding: 10px 15px; margin-bottom: 20px; font-weight: 600; color: #555; display: none; border-radius: 4px; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
                                    💡 <span style="color: #b59349;">Đang chọn:</span> <span id="selected-bikes-list" style="color: #333;"></span>
                                </div>"""

content = content.replace('<div class="fieldset-content">', banner_html, 1) # Only first match (Step 2)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)