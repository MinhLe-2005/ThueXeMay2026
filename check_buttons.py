import re

with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

matches = re.search(r'<div style="margin-top: 8px;.*?</div>', content, flags=re.DOTALL)
if matches:
    print(matches.group(0))