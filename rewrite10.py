import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

old_img = r'<td class="text-center">\s*<img src="\$\{empty m\.image \? \'images/default\.jpg\' : \(m\.image\.startsWith\(\'http\'\) \? m\.image : \'images/\'\.concat\(m\.image\)\)\}"\s*alt="motor" style="max-width: 100px; height: auto; border-radius: 4px; padding: 4px; border: 1px solid #e2e8f0;">\s*<\/td>'

new_img = '''<td class="w-25 text-center">
                                                    <img src="${empty m.image ? 'images/default.jpg' : (m.image.startsWith('http') ? m.image : 'images/'.concat(m.image))}"
                                                         class="img-fluid img-thumbnail" style="border: none; box-shadow: 0 2px 4px rgba(0,0,0,0.05);" alt="motor">
                                                </td>'''

content = re.sub(old_img, new_img, content, flags=re.DOTALL)

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
