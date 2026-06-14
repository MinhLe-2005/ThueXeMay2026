import os

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

content = content.replace(" ₫/Ngày (Tuần)</h2>", " ₫/Ngày</h2>")
content = content.replace(" ₫/Ngày (Tháng)</h2>", " ₫/Ngày</h2>")

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Removed (Tuần) and (Tháng) from h2")
