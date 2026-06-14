import re
with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

content = re.sub(r'<h3 style="color: #b59349;[^>]+>([^<]+)</h3>', r'<h4 style="color: #b59349; font-weight: bold; margin-bottom: 15px; font-size: 24px;">\1</h4>', content)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)