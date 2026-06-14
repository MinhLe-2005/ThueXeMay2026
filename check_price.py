# -*- coding: utf-8 -*-
with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if "Ngày" in line and ("main-price" in line or "₫" in line or "đ/Ngày" in line):
        print(f"Line {i+1}: {line.strip()}")
