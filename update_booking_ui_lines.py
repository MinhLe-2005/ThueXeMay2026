with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if 'class="main-price price-month"' in line:
        if 'discountedMonth' in line:
            # It's the active discount block
            insertion = """                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">
                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: <fmt:formatNumber value="${discountedWeek}" pattern="#,##0"/> đ/Ngày</span>
                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: <fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/> đ/Ngày</span>
                                                                      </div>\n"""
        else:
            # It's the normal block
            insertion = """                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">
                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: <fmt:formatNumber value="${p.dailyPriceForWeek}" pattern="#,##0"/> đ/Ngày</span>
                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: <fmt:formatNumber value="${p.dailyPriceForMonth}" pattern="#,##0"/> đ/Ngày</span>
                                                                      </div>\n"""
        lines[i] = line + insertion

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.writelines(lines)
