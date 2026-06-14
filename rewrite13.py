import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# I mistakenly inserted raw JS into HTML. Let's wrap it in <script> tags.
# It starts at `function openEditModal(btn) {` and ends right before `<!-- Tải thư viện JS`
old_block = r'function openEditModal\(btn\) \{.*?\}\n*(?=\s*<!-- Tải thư viện JS theo đúng thứ tự)'
new_block = lambda m: '<script>\n            ' + m.group(0) + '\n        </script>\n'

content = re.sub(old_block, new_block, content, flags=re.DOTALL)

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
