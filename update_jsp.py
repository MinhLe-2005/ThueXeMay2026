# -*- coding: utf-8 -*-
import re

with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace price display formats
content = re.sub(r'₫\$\{(.+?)\}00/Ngày', r'<fmt:formatNumber value="" pattern="#,##0"/> ₫/Ngày', content)
content = re.sub(r'₫\$\{(.+?)\}00', r'<fmt:formatNumber value="" pattern="#,##0"/> ₫', content)

# Update price class selection thresholds
content = content.replace('quantityDay >= 1 && quantityDay <= 7', 'quantityDay >= 1 && quantityDay < 7')
content = content.replace('quantityDay >= 8 && quantityDay <= 30', 'quantityDay >= 7 && quantityDay < 30')

# Also fix the JS logic reading priceLabel because the currency symbol changed from ₫190000.000 to 190,000 ₫.
# The regex priceLabel.replace(/\D/g, '') will strip all non-digits, which means 190,000 ₫ correctly becomes 190000.
# So the existing JS logic extracting the number is robust!

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated JSTL formatting and thresholds.")
