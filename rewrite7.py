import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update CSS to EXACTLY match accessoriesStaff.jsp
old_css = r'\/\* --- Clean Table Styles ---\ \*\/.*?\.action-buttons\s*\{.*?\}'

new_css = '''
            /* --- Clean Table Styles from accessoriesStaff --- */
            .e-panel.card {
                background: #fff;
                border: none;
                box-shadow: none;
            }
            .table-image {
                width: 100%;
                border-collapse: separate !important;
                border-spacing: 0 !important;
                margin-top: 5px !important;
                border: 1px solid #e2e8f0 !important;
                border-radius: 8px !important;
                overflow: hidden !important;
            }

            /* --- Header --- */
            .table thead th {
                background: #f1f5f9 !important; 
                color: #334155 !important; 
                font-size: 0.85rem !important;
                font-weight: bold !important;
                text-transform: uppercase !important;
                letter-spacing: 0.5px !important;
                border: none !important; 
                border-bottom: 2px solid #cbd5e1 !important;
                border-right: 1px solid #e2e8f0 !important;
                padding: 14px 16px !important;
                text-align: center;
                vertical-align: middle;
                white-space: nowrap; 
            }
            .table thead th:last-child {
                border-right: none !important;
            }

            /* --- Table Body --- */
            .table-image td {
                background: transparent;
                vertical-align: middle;
                border: none !important;
                border-bottom: 1px solid #e2e8f0 !important; 
                border-right: 1px solid #e2e8f0 !important;
                padding: 14px 16px !important; 
                color: #334155; 
                font-size: 14px;
                text-align: center;
                transition: background-color 0.2s ease;
            }
            .table-image td:last-child {
                border-right: none !important;
            }
            .table-image tr:last-child td {
                border-bottom: none !important;
            }

            .table-image tbody tr:nth-of-type(odd) td,
            .table-image tbody tr:nth-of-type(even) td {
                background-color: transparent !important;
            }
            .table-image tbody tr:hover td {
                background-color: #f8fafc !important; 
            }

            /* Thu nhỏ kích thước ảnh */
            .table-image img {
                max-width: 80px;
                height: auto;
                max-height: 80px;
                object-fit: contain;
                border-radius: 4px;
                border: 1px solid #e2e8f0;
                padding: 4px;
            }
            
            .table-image td.text-left {
                text-align: left;
            }
            
            /* Truncate description */
            .desc-text {
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 200px;
                color: #64748b;
                font-size: 13px;
                text-align: left;
                margin: 0 auto;
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
content = re.sub(old_css, new_css, content, flags=re.DOTALL)

# Update table class
content = content.replace('<table class="table table-bordered table-hover" id="motorTable" style="width: 100%;">', '<table class="table table-image" id="motorTable" style="width: 100%;">')

# Update "Kho Xe" string
old_kho_xe = r'<div class="text-left" style="min-width: 120px; margin: 0 auto;">.*?<\/c:choose>\s*<\/div>'
new_kho_xe = '''<div class="text-center" style="min-width: 100px; margin: 0 auto;">
                                                        <c:choose>
                                                            <c:when test="${availCount > 0}">
                                                                <span style="font-weight: 600; font-size: 14px; color: #16a34a;">Còn ${availCount} xe</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span style="font-weight: 600; font-size: 14px; color: #dc2626;">Hết xe</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>'''
content = re.sub(old_kho_xe, new_kho_xe, content, flags=re.DOTALL)

# Update action buttons to match accessoriesStaff exactly
old_actions = r'<div>\s*<button type="button" class="btn btn-outline-primary btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px; margin-right: 4px;" title="Cập nhật".*?onclick="openEditModal\(this\)".*?<\/button>\s*<button type="button" class="btn btn-outline-danger btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px;" title="Xóa".*?<\/button>\s*<\/div>'

new_actions = '''<div style="display: flex; gap: 8px; justify-content: center;">
                                                        <button type="button" class="btn btn-sm" style="background-color: #eff6ff; color: #2563eb; border: 1px solid #bfdbfe; border-radius: 8px; transition: all 0.2s; padding: 6px 12px;" onmouseover="this.style.backgroundColor='#dbeafe'" onmouseout="this.style.backgroundColor='#eff6ff'" title="Cập nhật"
                                                                data-id="${m.motorcycleId}"
                                                                data-model="${m.model}"
                                                                data-image="${m.image}"
                                                                data-displacement="${m.displacement}"
                                                                data-desc="${fn:escapeXml(m.description)}"
                                                                data-age="${m.minAge}"
                                                                data-bid="${m.brandID}"
                                                                data-cid="${m.categoryID}"
                                                                data-pid="${m.priceListID}"
                                                                onclick="openEditModal(this)">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-sm" style="background-color: #fef2f2; color: #dc2626; border: 1px solid #fecaca; border-radius: 8px; transition: all 0.2s; padding: 6px 12px;" onmouseover="this.style.backgroundColor='#fee2e2'" onmouseout="this.style.backgroundColor='#fef2f2'" title="Xóa" onclick="confirmDelete('${m.motorcycleId}')">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>'''
content = re.sub(old_actions, new_actions, content, flags=re.DOTALL)

# Update the img class if necessary. The CSS does `.table-image img` so it should target existing `img`.
# Let's ensure the img-fluid img-thumbnail classes are removed if they interfere.
content = content.replace('class="img-fluid img-thumbnail" alt="motor"', 'alt="motor"')


# We must also format Giá (Price) to match "20,000 VNĐ" from screenshot. But wait, in motorbike management, the `Giá` column is price list ID!
# Wait, look at the user screenshot for motorbike management: Giá column shows "200000.0". They didn't complain about it, but in accessories it's "20,000 VNĐ".
# Let's format it.
old_price = r'<c:if test="\$\{m\.priceListID == p\.priceListId\}">\s*\$\{p\.dailyPriceForDay\}\s*<\/c:if>'
new_price = '''<c:if test="${m.priceListID == p.priceListId}">
                                                            <span style="font-weight: 700; color: #0f172a;"><fmt:formatNumber value="${p.dailyPriceForDay}" type="number" pattern="#,###"/> VNĐ</span>
                                                        </c:if>'''
# We need to make sure fmt is available
if '<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>' not in content:
    content = content.replace('<%@ taglib prefix="c"', '<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>\n<%@ taglib prefix="c"')
content = re.sub(old_price, new_price, content)

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
