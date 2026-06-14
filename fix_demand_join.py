import re

with open('src/main/java/com/smartride/dao/MotorcycleDAO.java', 'r', encoding='utf-8') as f:
    content = f.read()

content = content.replace('JOIN "Demand_Detail" d', 'LEFT JOIN "Demand_Detail" d')

with open('src/main/java/com/smartride/dao/MotorcycleDAO.java', 'w', encoding='utf-8') as f:
    f.write(content)
