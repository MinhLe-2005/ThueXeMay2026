import re

with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace active block
content = re.sub(
    r'<h2 class="main-price price-month" data-price="\$\{discountedMonth\}"><fmt:formatNumber value="\$\{discountedMonth\}" pattern="#,##0"/>([^<]+)</h2>\s*</c:when>',
    r'<h2 class="main-price price-month" data-price="${discountedMonth}"><fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/>\1</h2>' +
    r'\n                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">' +
    r'\n                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: <fmt:formatNumber value="${discountedWeek}" pattern="#,##0"/>\1</span>' +
    r'\n                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: <fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/>\1</span>' +
    r'\n                                                                      </div>\n                                                                  </c:when>',
    content
)

# Replace normal block
content = re.sub(
    r'<h2 class="main-price price-month" data-price="\$\{p\.dailyPriceForMonth\}"><fmt:formatNumber value="\$\{p\.dailyPriceForMonth\}" pattern="#,##0"/>([^<]+)</h2>\s*</c:otherwise>',
    r'<h2 class="main-price price-month" data-price="${p.dailyPriceForMonth}"><fmt:formatNumber value="${p.dailyPriceForMonth}" pattern="#,##0"/>\1</h2>' +
    r'\n                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">' +
    r'\n                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: <fmt:formatNumber value="${p.dailyPriceForWeek}" pattern="#,##0"/>\1</span>' +
    r'\n                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: <fmt:formatNumber value="${p.dailyPriceForMonth}" pattern="#,##0"/>\1</span>' +
    r'\n                                                                      </div>\n                                                                  </c:otherwise>',
    content
)

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
