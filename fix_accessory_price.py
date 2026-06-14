import os

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

old_str = """<label for="daily-checkbox"><fmt:formatNumber value="" pattern="#,##0"/> ₫</label>"""
new_str = """<label for="daily-checkbox" data-price="${a.price}"><fmt:formatNumber value="${a.price}" pattern="#,##0"/> ₫</label>"""

content = content.replace(old_str, new_str)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Fixed accessory price formatting")
