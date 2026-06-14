import re

with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update the JS updateSelectedBikesBanner function
old_js = """                            const bikeName = formMotorBox.querySelector('.motor-name').textContent;
                              selectedBikesText.push(quantity + "x " + bikeName + activeBadgeText);"""
new_js = """                            const bikeName = formMotorBox.querySelector('.motor-name').textContent;
                              selectedBikesText.push("<span style='font-weight:700; color:#b59349; background:rgba(181,147,73,0.1); padding:2px 8px; border-radius:4px; margin-right:5px;'>" + quantity + " chiếc</span> <strong style='color:#333;'>" + bikeName + "</strong> <span style='color:#666; font-size:0.9em;'>" + activeBadgeText + "</span>");"""

content = content.replace(old_js, new_js)

old_js_list = """                  const listSpan = document.getElementById('selected-bikes-list');
                  if (selectedBikesText.length > 0) {
                      listSpan.textContent = selectedBikesText.join(", ");"""
new_js_list = """                  const listSpan = document.getElementById('selected-bikes-list');
                  if (selectedBikesText.length > 0) {
                      listSpan.innerHTML = selectedBikesText.join("<div style='margin-bottom:6px;'></div>");"""

content = content.replace(old_js_list, new_js_list)

# 2. Add static badges for Weekly and Monthly prices in the card
# For active event case:
old_active = """                                                                      <h2 class="main-price price-month" data-price="${discountedMonth}"><fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/> đ/Ngày</h2>
                                                                  </c:when>"""
new_active = """                                                                      <h2 class="main-price price-month" data-price="${discountedMonth}"><fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/> đ/Ngày</h2>
                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">
                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: <fmt:formatNumber value="${discountedWeek}" pattern="#,##0"/> đ/Ngày</span>
                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: <fmt:formatNumber value="${discountedMonth}" pattern="#,##0"/> đ/Ngày</span>
                                                                      </div>
                                                                  </c:when>"""

# For normal case:
old_normal = """                                                                      <h2 class="main-price price-month" data-price="${p.dailyPriceForMonth}"><fmt:formatNumber value="${p.dailyPriceForMonth}" pattern="#,##0"/> đ/Ngày</h2>
                                                                  </c:otherwise>"""
new_normal = """                                                                      <h2 class="main-price price-month" data-price="${p.dailyPriceForMonth}"><fmt:formatNumber value="${p.dailyPriceForMonth}" pattern="#,##0"/> đ/Ngày</h2>
                                                                      <div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">
                                                                          <span style="font-size: 11px; color: #15803d; background: #dcfce7; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tuần: <fmt:formatNumber value="${p.dailyPriceForWeek}" pattern="#,##0"/> đ/Ngày</span>
                                                                          <span style="font-size: 11px; color: #6d28d9; background: #ede9fe; padding: 2px 6px; border-radius: 4px; font-weight: 600;">Gói Tháng: <fmt:formatNumber value="${p.dailyPriceForMonth}" pattern="#,##0"/> đ/Ngày</span>
                                                                      </div>
                                                                  </c:otherwise>"""

# Using regex or exact replace: the character `đ` might be encoded as `,` in the python script reading, so I will replace based on regex
content = re.sub(r'<h2 class="main-price price-month" data-price="\$\{discountedMonth\}"><fmt:formatNumber value="\$\{discountedMonth\}" pattern="#,##0"/>[^<]+</h2>\s*</c:when>', new_active.replace('đ', 'đ'), content)
content = re.sub(r'<h2 class="main-price price-month" data-price="\$\{p\.dailyPriceForMonth\}"><fmt:formatNumber value="\$\{p\.dailyPriceForMonth\}" pattern="#,##0"/>[^<]+</h2>\s*</c:otherwise>', new_normal.replace('đ', 'đ'), content)

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
