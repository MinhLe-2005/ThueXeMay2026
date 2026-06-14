import re

with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# For the active discount case:
# We find: <h2 class="main-price price-month" data-price="${discountedMonth}"><fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/> đ/Ngày</h2>
# And we add the badges after it.
pattern_active = r'(<h2 class="main-price price-month" data-price="\$\{discountedMonth\}"><fmt:formatNumber value="\$\{discountedMonth\}" pattern="#,##0"/>[^<]+</h2>)'
replacement_active = r'\1\n                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">' + \
r'\n                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: <fmt:formatNumber value="${discountedWeek}" pattern="#,##0"/> ₫/Ngày</span>' + \
r'\n                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: <fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/> ₫/Ngày</span>' + \
r'\n                                                                      </div>'

content = re.sub(pattern_active, replacement_active, content)

# For the normal case:
pattern_normal = r'(<h2 class="main-price price-month" data-price="\$\{p\.dailyPriceForMonth\}"><fmt:formatNumber value="\$\{p\.dailyPriceForMonth\}" pattern="#,##0"/>[^<]+</h2>)'
replacement_normal = r'\1\n                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">' + \
r'\n                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: <fmt:formatNumber value="${p.dailyPriceForWeek}" pattern="#,##0"/> ₫/Ngày</span>' + \
r'\n                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: <fmt:formatNumber value="${p.dailyPriceForMonth}" pattern="#,##0"/> ₫/Ngày</span>' + \
r'\n                                                                      </div>'

content = re.sub(pattern_normal, replacement_normal, content)


with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
