import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# Fix the broken JS script at the bottom
bad_script_regex = r'\$\(document\)\.ready\(function\(\)\s*\{.*?\/\/\s*Khởi tạo DataTables.*?\}\);\s*\}\s*\}\);.*?<\/script>'

good_script = '''$(document).ready(function() {
                // Ap buoc cac tab hoat dong (khac phuc loi xung dot Bootstrap 3 vs 4)
                $('.nav-tabs a').on('click', function (e) {
                    e.preventDefault();
                    $('.tab-pane').hide();
                    $($(this).attr('href')).show();
                });

                // Khoi tao DataTables
                $('#motorTable').DataTable({
                    "pageLength": 10,
                    "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "Tat ca"]],
                    "language": {
                        "lengthMenu": "Hien thi _MENU_ xe",
                        "zeroRecords": "Khong tim thay xe nao",
                        "info": "Trang _PAGE_ / _PAGES_",
                        "infoEmpty": "Khong co du lieu",
                        "infoFiltered": "(loc tu _MAX_ xe)",
                        "search": "Tim kiem:",
                        "paginate": {
                            "first": "Dau",
                            "last": "Cuoi",
                            "next": "Sau",
                            "previous": "Truoc"
                        }
                    }
                });
            });
        </script>'''

content = re.sub(bad_script_regex, good_script, content, flags=re.DOTALL)

# Also fix the duplicated CSS blocks of DataTables Overrides
while content.count('/* DataTables Styling Overrides */') > 1:
    content = re.sub(r'\/\* DataTables Styling Overrides \*\/.*?outline: none;\s*\}', '', content, count=1, flags=re.DOTALL)

# Ensure img has max-width by adding an inline style JUST IN CASE the CSS rule is failing to apply
content = content.replace('alt="motor">', 'alt="motor" style="max-width: 100px; height: auto; border-radius: 4px; padding: 4px; border: 1px solid #e2e8f0;">')

# Ensure the table is properly structured
content = content.replace('<table class="table table-image" id="motorTable" style="width: 100%;">', '<table class="table table-image" id="motorTable" style="width: 100%; min-width: 1000px;">')


with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
