import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# 1. Replace inline style for apply voucher button
content = content.replace(
    'style="background: linear-gradient(135deg, #02b8af, #046fd4); color: white; border: none; padding: 0 15px; border-radius: 6px; font-weight: 600; cursor: pointer; transition: 0.2s;"',
    'style="background: #b59349; color: white; border: none; padding: 0 15px; border-radius: 6px; font-weight: 600; cursor: pointer; transition: 0.2s;"'
)

# 2. Replace JS style revert for apply voucher button
content = content.replace(
    "btn.style.background = 'linear-gradient(135deg, #02b8af, #046fd4)';",
    "btn.style.background = '#b59349';"
)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)
