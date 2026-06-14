import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# 1. Revert Step 3 Label
old_label = """                                                <c:if test="${a.price ne 0}">
                                                    <label for="daily-checkbox"><fmt:formatNumber value="${a.price}" pattern="#,##0"/> ₫/Ngày</label>
                                                </c:if>"""
new_label = """                                                <c:if test="${a.price ne 0}">
                                                    <label for="daily-checkbox"><fmt:formatNumber value="${a.price}" pattern="#,##0"/> ₫</label>
                                                </c:if>"""
content = content.replace(old_label, new_label)

# 2. Revert Step 5 Calculation
old_calc = """                                // Tính tổng giá (nhân với số ngày)
                                const quantityDay = Math.max(1, Math.ceil(differenceInDays));
                                const totalPrice = quantityDay * price * quantity;"""
new_calc = """                                // Tính tổng giá
                                const totalPrice = quantity * price;"""
content = content.replace(old_calc, new_calc)

# 3. Revert Step 5 HTML Display
old_html = """                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantityDay + ` Ngày (x` + quantity + ` Cái)
                                    </div>
                                    <div style="flex: 1; text-align: right; color: #666; font-size: 14px;">
                                        ₫` + price.toLocaleString() + `/Ngày
                                    </div>"""
new_html = """                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantity + ` Cái
                                    </div>
                                    <div style="flex: 1; text-align: right; color: #666; font-size: 14px;">
                                        ₫` + price.toLocaleString() + `
                                    </div>"""
content = content.replace(old_html, new_html)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)
