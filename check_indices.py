import os

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

start_marker = "<h3>Xác nhận</h3>"
end_marker = "<h3>Thanh toán</h3>"

start_idx = content.find(start_marker)
end_idx = content.find(end_marker)

print(start_idx, end_idx)