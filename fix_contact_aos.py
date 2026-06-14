import re

with open('src/main/webapp/contact.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

old_script = """            // KA-ch hot animation khi cuTn
            $(document).ready(function () {
                $('.animate__animated').waypoint(function () {
                    $(this.element).addClass('animate__fadeInUp');
                }, {
                    offset: '75%'
                });
            });"""

new_script = """            // Kích hoạt animation khi cuộn
            $(document).ready(function () {
                if (typeof AOS !== 'undefined') {
                    AOS.init({
                        duration: 1000,
                        once: true,
                        offset: 50
                    });
                }
                $('.animate__animated').waypoint(function () {
                    $(this.element).addClass('animate__fadeInUp');
                }, {
                    offset: '75%'
                });
            });"""

if old_script in content:
    content = content.replace(old_script, new_script)
else:
    # Fallback if encoding issues mess up the comment
    content = re.sub(r'\$\(document\)\.ready\(function\s*\(\)\s*\{', 
                     "$(document).ready(function () {\n                if (typeof AOS !== 'undefined') {\n                    AOS.init({\n                        duration: 1000,\n                        once: true,\n                        offset: 50\n                    });\n                }", 
                     content)

with open('src/main/webapp/contact.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
