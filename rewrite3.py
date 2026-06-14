import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Strip CSS
css_to_remove = r'''            \.tableview \{.*?            \.buttons \{.*?            \}'''
# Since regex across many lines can be tricky if there's unexpected nesting, I'll use a more robust regex or string replacement.

# Let's find the exact string boundaries
start_idx = content.find('.tableview {')
end_idx = content.find('            /* Forms inside Add/Update */')

if start_idx != -1 and end_idx != -1:
    new_panel_css = '''
            /* --- Premium Table Styles --- */
            .e-panel.card {
                border-radius: 16px;
                box-shadow: 0 4px 25px rgba(0, 0, 0, 0.04);
                border: none;
                background: #fff;
            }
            .e-table {
                padding: 10px;
            }
            .table-bordered th, .table-bordered td {
                vertical-align: middle;
            }
'''
    content = content[:start_idx] + new_panel_css + content[end_idx:]

# 2. Update Table HTML Wrapper
old_table_wrapper = r'<div class="m-auto row tableview">\s*<div class="col-12">\s*<table class="table table-image" id="motorTable">'
new_table_wrapper = '''<div class="e-panel card">
                            <div class="card-body">
                                <div class="e-table">
                                    <div class="table-responsive table-lg mt-3">
                                        <table class="table table-bordered" id="motorTable" style="width: 100%;">'''
content = re.sub(old_table_wrapper, new_table_wrapper, content, flags=re.DOTALL)

old_table_wrapper_end = r'</table>\s*</div>\s*</div>'
new_table_wrapper_end = '''</table>
                                    </div>
                                </div>
                            </div>
                        </div>'''
content = re.sub(old_table_wrapper_end, new_table_wrapper_end, content, flags=re.DOTALL)

# 3. Update Table Buttons
# Chi Tiết Button
old_chi_tiet = r'<button type="button" class="btn btn-gold".*?<span class="bold">Chi Tiết</span>\s*</button>'
new_chi_tiet = '''<button type="button" class="btn btn-light border btn-sm" id="launchModalBtn" data-toggle="modal" data-target="#user-form-modal" onclick="OneClick(this)" data-motorcycleId="${m.motorcycleId}" data-motorcycleName="${m.model}" data-license="<c:forEach items="${m.listMotorcycleDetails}" var="listmd">${listmd.licensePlate},</c:forEach>">
                                                            <i class="fas fa-info-circle me-1"></i> Xem chi tiết
                                                    </button>'''
content = re.sub(old_chi_tiet, new_chi_tiet, content, flags=re.DOTALL)

# Hành Động Buttons
old_actions = r'<div class="buttons">\s*<button class="btn btn-dark-custom btn-sm" .*?<i class="fas fa-edit"></i>\s*</button>\s*<button class="btn btn-danger-custom btn-sm" onclick="confirmDelete\(\'\$\{m.motorcycleId\}\'\)">\s*<i class="fas fa-trash"></i>\s*</button>\s*</div>'
new_actions = '''<div class="btn-group" role="group">
                                                        <button class="btn btn-light border btn-sm" title="Cập nhật" onclick="editMotorcycle('${m.motorcycleId}', '${m.model}', '${m.image}', '${m.displacement}', '${m.description}', '${m.minAge}', '${m.brandID}', '${m.categoryID}', '${m.priceListID}')">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-light border btn-sm text-danger" title="Xóa" onclick="confirmDelete('${m.motorcycleId}')">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>'''
content = re.sub(old_actions, new_actions, content, flags=re.DOTALL)

# 4. Update Stock Column
old_stock_col = r'<div style="text-align: left; min-width: 150px;">\s*<span class="badge" style="background: \$\{availCount > 0 \? \'#1089ff\' : \'#dc3545\'\}; margin-bottom: 5px; font-size: 12px; padding: 5px 8px;">\s*\$\{availCount\} xe sẵn sàng\s*</span>.*?</div>'

new_stock_col = '''<div style="text-align: left; min-width: 200px;">
                                                        <div style="margin-bottom: 5px; font-weight: 500; font-size: 14px;">
                                                            Trạng thái: <span class="${availCount > 0 ? 'text-success' : 'text-danger'}">${availCount} xe sẵn sàng</span>
                                                        </div>
                                                        <c:if test="${availCount > 0}">
                                                            <div style="margin-top: 5px; max-height: 80px; overflow-y: auto;">
                                                                <c:forEach var="plate" items="${availArray}">
                                                                    <span class="border rounded px-2 py-1 bg-white text-dark d-inline-block mb-1" style="font-size: 12px; margin-right: 4px;">${plate}</span>
                                                                </c:forEach>
                                                            </div>
                                                        </c:if>
                                                    </div>'''
content = re.sub(old_stock_col, new_stock_col, content, flags=re.DOTALL)

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
