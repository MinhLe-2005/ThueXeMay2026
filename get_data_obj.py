import os
import re

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

match = re.search(r'var data = \{.*?\};', content, re.DOTALL)
if match:
    print(match.group(0))
