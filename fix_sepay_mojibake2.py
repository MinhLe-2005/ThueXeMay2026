import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

content = content.replace("T ng", "Tổng")
content = content.replace("toAn", "toán")
content = content.replace("S`", "Số")
content = content.replace("ti?n", "tiền")
content = content.replace("c?c", "cọc")
content = content.replace("MA", "Mã")
content = content.replace("?ang", "Đang")
content = content.replace("khYi", "khởi")
content = content.replace("to", "tạo")
content = content.replace("`n", "đơn")
content = content.replace("hAng", "hàng")
content = content.replace("VN?", "VNĐ")
content = content.replace("lAng", "lòng")
content = content.replace("quAct", "quét")
content = content.replace("mA", "mã")
content = content.replace("`", "để")
content = content.replace("T", "Tự")
content = content.replace("`Tng", "động")
content = content.replace("kim", "kiểm")
content = content.replace("thAnh", "thành")
content = content.replace("cA'ng", "công")
content = content.replace("chuyn", "chuyển")
content = content.replace("h>ng", "hướng")

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)