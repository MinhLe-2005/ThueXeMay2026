import re

with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace active block
pattern_active = r'(<h2 class="main-price price-month"[^>]*>.*?</h2\s*>)\s*</c:when>'
replacement_active = r'\1\n                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">' + \
r'\n                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: ₫${discountedWeek}00/Ngày</span>' + \
r'\n                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: ₫${discountedMonth}00/Ngày</span>' + \
r'\n                                                                      </div>\n                                                                </c:when>'

content = re.sub(pattern_active, replacement_active, content)

# Replace normal block
pattern_normal = r'(<h2 class="main-price price-month"[^>]*>.*?</h2\s*>)\s*</c:otherwise>'
replacement_normal = r'\1\n                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">' + \
r'\n                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: ₫${p.dailyPriceForWeek}00/Ngày</span>' + \
r'\n                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: ₫${p.dailyPriceForMonth}00/Ngày</span>' + \
r'\n                                                                      </div>\n                                                                </c:otherwise>'

content = re.sub(pattern_normal, replacement_normal, content)

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
