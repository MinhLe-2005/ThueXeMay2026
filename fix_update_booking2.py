import re

with open("update_booking2.py", "r", encoding="utf-8") as f:
    content = f.read()

# Fix the mojibake in the Python script itself
content = content.replace("T ng thanh toAn", "Tổng thanh toán")
content = content.replace("S` ti?n c?c", "Số tiền cọc")
content = content.replace("MA QR VietQR", "Mã QR VietQR")
content = content.replace("?ang khYi to `n hAng...", "Đang khởi tạo đơn hàng...")
content = content.replace("VN?", "VNĐ")
content = content.replace("Vui lAng quAct mA ` thanh toAn. T `Tng kim tra...", "Vui lòng quét mã để thanh toán. Hệ thống tự động kiểm tra...")
content = content.replace("Thanh toAn thAnh cA'ng! ?ang chuyn h>ng...", "Thanh toán thành công! Đang chuyển hướng...")
content = content.replace("`", "đ")

with open("update_booking2.py", "w", encoding="utf-8") as f:
    f.write(content)