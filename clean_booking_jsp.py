import re

with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# Remove all bad insertions
pattern_bad_block = r'\s*<div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">\s*<span[^>]*>Gói Tuần: <fmt:formatNumber[^>]*> [₫đ,]+/Ng[Aa]y</span>\s*<span[^>]*>Gói Tháng: <fmt:formatNumber[^>]*> [₫đ,]+/Ng[Aa]y</span>\s*</div>'
content = re.sub(pattern_bad_block, '', content)

pattern_bad_block2 = r'\s*<div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">\s*<span[^>]*>G[AO]i Tu[ ]n: <fmt:formatNumber[^>]*> [₫đ,]+/Ng[Aa]y</span>\s*<span[^>]*>G[AO]i Th[Aa]ng: <fmt:formatNumber[^>]*> [₫đ,]+/Ng[Aa]y</span>\s*</div>'
content = re.sub(pattern_bad_block2, '', content)

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
