import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update CSS
new_css = '''
            /* --- Clean Table Styles --- */
            .e-panel.card {
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
                border: 1px solid #e9ecef;
                background: #fff;
            }
            .table {
                margin-bottom: 0;
            }
            .table th {
                background-color: #f8f9fa;
                color: #495057;
                font-weight: 600;
                font-size: 13px;
                border-top: none !important;
                border-bottom: 2px solid #dee2e6 !important;
                padding: 15px 10px;
                text-align: center;
                vertical-align: middle;
            }
            .table td {
                vertical-align: middle;
                padding: 15px 10px;
                color: #333;
                font-size: 14px;
                border-bottom: 1px solid #e9ecef;
                text-align: center;
            }
            .table td.text-left {
                text-align: left;
            }
            /* Truncate description */
            .desc-text {
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 220px;
                color: #6c757d;
                font-size: 13px;
                text-align: left;
                margin: 0 auto;
            }
            /* Action Buttons Alignment */
            .action-buttons {
                min-width: 90px;
                white-space: nowrap;
            }
            
            /* DataTables Styling Overrides */
            .dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_length {
                margin-bottom: 15px;
                margin-top: 10px;
            }
            .dataTables_wrapper .dataTables_filter label {
                font-weight: 500;
                color: #495057;
                display: flex;
                align-items: center;
                justify-content: flex-end;
            }
            .dataTables_wrapper .dataTables_filter input {
                margin-left: 10px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                padding: 5px 10px;
                outline: none;
                width: 200px;
            }
            .dataTables_wrapper .dataTables_length label {
                font-weight: 500;
                color: #495057;
                display: flex;
                align-items: center;
            }
            .dataTables_wrapper .dataTables_length select {
                margin: 0 10px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                padding: 5px 10px;
                outline: none;
            }
'''

old_css_regex = r'\/\* --- Clean Table Styles ---\ \*\/.*?\.action-buttons\s*\{.*?\}'
content = re.sub(old_css_regex, new_css, content, flags=re.DOTALL)

# Update Kho Xe
old_kho_xe = r'<div style="text-align: left; min-width: 180px;">.*?<\/c:choose>\s*<\/div>'
new_kho_xe = '''<div class="text-left" style="min-width: 160px; margin: 0 auto;">
                                                        <c:choose>
                                                            <c:when test="${availCount > 0}">
                                                                <div style="font-weight: 600; font-size: 13px; color: #198754; margin-bottom: 5px;">
                                                                    <i class="fas fa-check-circle"></i> Sẵn sàng: ${availCount} xe
                                                                </div>
                                                                <div style="max-height: 80px; overflow-y: auto;">
                                                                    <c:forEach var="plate" items="${availArray}">
                                                                        <span class="badge" style="background-color: #f8f9fa; color: #495057; border: 1px solid #dee2e6; font-size: 12px; font-weight: normal; margin-right: 4px; margin-bottom: 4px; padding: 4px 6px; border-radius: 4px;">Biển: ${plate}</span>
                                                                    </c:forEach>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div style="font-weight: 600; font-size: 13px; color: #dc3545;">
                                                                    <i class="fas fa-times-circle"></i> Hết xe
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>'''
content = re.sub(old_kho_xe, new_kho_xe, content, flags=re.DOTALL)

# Update Table Model column
content = content.replace('<td><div style="font-weight: 600;">${m.model}</div></td>', '<td class="text-left" style="font-weight: 600; color: #212529;">${m.model}</td>')

# Update "Chi tiết" Button
old_chi_tiet = r'<button type="button" class="btn btn-light border btn-sm fw-bold text-dark shadow-sm".*?id="launchModalBtn".*?>\s*<i class="fas fa-info-circle me-1"><\/i> Xem chi tiết\s*<\/button>'
new_chi_tiet = '''<button type="button" class="btn btn-outline-secondary btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px; font-weight: 500; font-size: 13px;" id="launchModalBtn" data-toggle="modal" data-target="#user-form-modal" onclick="OneClick(this)" data-motorcycleId="${m.motorcycleId}" data-motorcycleName="${m.model}" data-license="<c:forEach items="${m.listMotorcycleDetails}" var="listmd">${listmd.licensePlate},</c:forEach>">
                                                            <i class="fas fa-eye me-1"></i> Chi tiết
                                                    </button>'''
content = re.sub(old_chi_tiet, new_chi_tiet, content, flags=re.DOTALL)

# Update Hành động Buttons
old_actions = r'<div class="btn-group" role="group">\s*<button class="btn btn-light border btn-sm".*?onclick="editMotorcycle.*?<i class="fas fa-edit"><\/i>\s*<\/button>\s*<button class="btn btn-light border btn-sm text-danger".*?onclick="confirmDelete.*?<i class="fas fa-trash"><\/i>\s*<\/button>\s*<\/div>'
new_actions = '''<div>
                                                        <button class="btn btn-outline-primary btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px; margin-right: 4px;" title="Cập nhật" onclick="editMotorcycle('${m.motorcycleId}', '${m.model}', '${m.image}', '${m.displacement}', '${m.description}', '${m.minAge}', '${m.brandID}', '${m.categoryID}', '${m.priceListID}')">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-outline-danger btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px;" title="Xóa" onclick="confirmDelete('${m.motorcycleId}')">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>'''
content = re.sub(old_actions, new_actions, content, flags=re.DOTALL)

# Remove the JS hack from initComplete
old_js_hack = r',\s*"initComplete": function\(settings, json\) \{.*?\}'
content = re.sub(old_js_hack, '', content, flags=re.DOTALL)

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
