# -*- coding: utf-8 -*-
import os

# Function to replace in file
def replace_in_file(filepath, replacements):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    for old, new in replacements:
        content = content.replace(old, new)
        
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

# booking.jsp replacements
booking_replacements = [
    (
        "minTime.setHours(minTime.getHours() + 1);",
        "minTime.setMinutes(minTime.getMinutes() + 30); // 30 min advance booking"
    ),
    (
        "Vui lòng đặt xe trước 1 tiếng",
        "Vui lòng đặt xe trước 30 phút"
    )
]
replace_in_file('src/main/webapp/booking.jsp', booking_replacements)

# home.jsp replacements
home_replacements = [
    (
        "minTime.setHours(minTime.getHours() + 1); // Require at least 1 hour advance booking",
        "minTime.setMinutes(minTime.getMinutes() + 30); // Require at least 30 min advance booking"
    ),
    (
        "Vui lòng đặt xe trước 1 tiếng",
        "Vui lòng đặt xe trước 30 phút"
    )
]
replace_in_file('src/main/webapp/home.jsp', home_replacements)

print("Updated logic to 30 minutes in booking.jsp and home.jsp.")
