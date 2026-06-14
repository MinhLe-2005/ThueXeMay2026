# -*- coding: utf-8 -*-
import re

with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

def replacer(match, day_var, week_var, month_var):
    return f'<h2 class="main-price price-day" ><fmt:formatNumber value="{day_var}" pattern="#,##0"/> ₫/Ngày</h2>\n                                                                    <h2 class="main-price price-week" ><fmt:formatNumber value="{week_var}" pattern="#,##0"/> ₫/Ngày (Tuần)</h2>\n                                                                    <h2 class="main-price price-month" ><fmt:formatNumber value="{month_var}" pattern="#,##0"/> ₫/Ngày (Tháng)</h2>'

count = 0
def sub_func(match):
    global count
    count += 1
    if count == 1 or count == 3:
        return replacer(match, '${discountedDay}', '${discountedWeek}', '${discountedMonth}')
    else:
        return replacer(match, '${p.dailyPriceForDay}', '${p.dailyPriceForWeek}', '${p.dailyPriceForMonth}')

content = re.sub(r'<h2 class="main-price price-day" >.*?</h2>\s*<h2 class="main-price price-week" >.*?</h2>\s*<h2 class="main-price price-month" >.*?</h2>', sub_func, content, flags=re.DOTALL)

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
print(f"Repaired price values. Count: {count}")
