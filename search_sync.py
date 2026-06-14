import os

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if "ti" in line and "ng" in line:
        if "1 ti" in line:
            print(f"Line {i+1}: {line.strip()}")
