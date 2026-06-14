import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# Extract script blocks
scripts = re.findall(r'<script.*?>(.*?)</script>', content, flags=re.DOTALL | re.IGNORECASE)

with open("test_syntax.js", "w", encoding="utf-8") as f:
    for i, s in enumerate(scripts):
        # We replace JSP tags with empty strings or comments to avoid node JS syntax error
        s_clean = re.sub(r'<%=(.*?)%>', r'"\1"', s)
        s_clean = re.sub(r'<%(.*?)%>', r'/* \1 */', s_clean, flags=re.DOTALL)
        s_clean = re.sub(r'\$\{.*?\}', r'1', s_clean)
        f.write(f"// Script block {i}\n")
        f.write(s_clean)
        f.write("\n\n")
