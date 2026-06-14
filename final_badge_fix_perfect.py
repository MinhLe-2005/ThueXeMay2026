with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    lines = f.readlines()

new_lines = []
for i, line in enumerate(lines):
    new_lines.append(line)
    if '<h2 class="main-price price-month"' in line and 'discountedMonth' in line:
        new_lines.append('                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-start;">\n')
        new_lines.append('                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: ₫${discountedWeek}00/Ngày</span>\n')
        new_lines.append('                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: ₫${discountedMonth}00/Ngày</span>\n')
        new_lines.append('                                                                      </div>\n')
    elif '<h2 class="main-price price-month"' in line and 'p.dailyPriceForMonth' in line:
        new_lines.append('                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-start;">\n')
        new_lines.append('                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: ₫${p.dailyPriceForWeek}00/Ngày</span>\n')
        new_lines.append('                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: ₫${p.dailyPriceForMonth}00/Ngày</span>\n')
        new_lines.append('                                                                      </div>\n')

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.writelines(new_lines)
