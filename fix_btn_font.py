import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

content = content.replace("btnWeek.style.fontWeight = '800';", "")
content = content.replace("btnWeek.style.fontWeight = '600';", "")
content = content.replace("btnMonth.style.fontWeight = '800';", "")
content = content.replace("btnMonth.style.fontWeight = '600';", "")

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)