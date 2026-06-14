import os

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

old_badge_week = """<div style="display: inline-flex; align-items: center; background: linear-gradient(135deg, #b59349 0%, #8c6f32 100%); color: white; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; box-shadow: 0 2px 8px rgba(181, 147, 73, 0.3); margin-top: 6px;"><i class="fas fa-gift" style="margin-right: 6px;"></i> Ưu đãi Gói Tuần</div>"""
new_badge_week = """<span style="display: inline-block; padding: 4px 10px; background: rgba(181, 147, 73, 0.08); border: 1px solid rgba(181, 147, 73, 0.3); color: #b59349; border-radius: 4px; font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-top: 6px;">Ưu đãi gói Tuần</span>"""
content = content.replace(old_badge_week, new_badge_week)

old_badge_month = """<div style="display: inline-flex; align-items: center; background: linear-gradient(135deg, #10b981 0%, #059669 100%); color: white; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3); margin-top: 6px;"><i class="fas fa-crown" style="margin-right: 6px;"></i> Đặc quyền Gói Tháng</div>"""
new_badge_month = """<span style="display: inline-block; padding: 4px 10px; background: rgba(16, 185, 129, 0.08); border: 1px solid rgba(16, 185, 129, 0.3); color: #059669; border-radius: 4px; font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-top: 6px;">Đặc quyền gói Tháng</span>"""
content = content.replace(old_badge_month, new_badge_month)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated to elegant badges")
