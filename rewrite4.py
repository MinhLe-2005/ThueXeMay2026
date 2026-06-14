import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Add desc-text CSS back and table styles
new_css = '''
            /* --- Clean Table Styles --- */
            .e-panel.card {
                border-radius: 12px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
                border: 1px solid #e2e8f0;
                background: #fff;
            }
            .table-responsive {
                border-radius: 12px;
            }
            .table th {
                background-color: #f8fafc;
                color: #475569;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 13px;
                border-bottom: 2px solid #e2e8f0;
                padding: 15px 10px;
            }
            .table td {
                vertical-align: middle;
                padding: 15px 10px;
                color: #334155;
                border-bottom: 1px solid #f1f5f9;
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
            }
            /* Action Buttons Alignment */
            .action-buttons {
                min-width: 100px;
                white-space: nowrap;
            }
'''
content = content.replace('/* --- Premium Table Styles --- */', new_css + '/* --- Premium Table Styles --- */')

# Remove the old .e-panel.card CSS and .table-bordered since we replaced it
css_to_remove = r'''\/\* --- Premium Table Styles ---\ \*\/.*?\.table-bordered th, \.table-bordered td \{.*?vertical-align: middle;.*?\}'''
content = re.sub(css_to_remove, '/* --- Clean Table Styles --- */', content, flags=re.DOTALL)

# 2. Update Table Class from table-bordered to table table-hover
content = content.replace('<table class="table table-bordered" id="motorTable" style="width: 100%;">', '<table class="table table-hover" id="motorTable" style="width: 100%; border-collapse: collapse;">')

# 3. Update Kho Xe Column Display
old_stock_col = r'<div style="text-align: left; min-width: 200px;">.*?</div>\s*</c:if>\s*</div>'
new_stock_col = '''<div style="text-align: left; min-width: 180px;">
                                                        <c:choose>
                                                            <c:when test="${availCount > 0}">
                                                                <div style="margin-bottom: 8px; font-weight: 600; font-size: 13px; color: #16a34a;">
                                                                    <i class="fas fa-check-circle me-1"></i> ${availCount} xe sẵn sàng
                                                                </div>
                                                                <div style="max-height: 80px; overflow-y: auto;">
                                                                    <c:forEach var="plate" items="${availArray}">
                                                                        <span class="badge border bg-light text-dark fw-normal me-1 mb-1" style="font-size: 12px;">${plate}</span>
                                                                    </c:forEach>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div style="font-weight: 600; font-size: 13px; color: #dc2626;">
                                                                    <i class="fas fa-times-circle me-1"></i> Hết xe
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>'''
content = re.sub(old_stock_col, new_stock_col, content, flags=re.DOTALL)

# 4. Action Buttons Class
content = content.replace('<td class="action-buttons">', '<td class="action-buttons text-center" style="white-space: nowrap;">')
# Update Chi Tiết button to match the user's specific styling
content = content.replace('class="btn btn-light border btn-sm" id="launchModalBtn"', 'class="btn btn-light border btn-sm fw-bold text-dark shadow-sm" style="background-color: #f8f9fa;" id="launchModalBtn"')

# 5. Fix Cập Nhật Xe Máy Modal
old_update_modal = r'<div class="modal fade" id="updateMotorbikeModal".*?<div class="modal-body" style="padding: 30px; background: #f5f7fb;">'
new_update_modal = '''<div class="modal fade" id="updateMotorbikeModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content" style="border-radius: 12px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.1);">
            <div class="modal-header bg-light" style="border-bottom: 1px solid #e2e8f0; border-top-left-radius: 12px; border-top-right-radius: 12px; padding: 20px 24px;">
                <h5 class="modal-title" style="font-weight: 700; color: #1e293b; font-size: 18px;">
                    <i class="fas fa-edit text-primary me-2"></i>CẬP NHẬT XE MÁY
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #64748b; font-size: 24px; opacity: 1;">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="padding: 30px; background: #fff;">'''
content = re.sub(old_update_modal, new_update_modal, content, flags=re.DOTALL)

# Add mb-3 to form groups in Update Modal
content = content.replace('<div class="form-group">', '<div class="form-group mb-4">')
# Change submit button in update modal
content = content.replace('class="btn btn-dark" style="background-color: #1a1816; border-color: #d4af37; color: #d4af37; font-weight: bold; padding: 12px 25px; width: 100%; border-radius: 8px; margin-top: 20px;"', 'class="btn btn-primary" style="font-weight: bold; padding: 12px 25px; width: 100%; border-radius: 8px; margin-top: 20px;"')

# 6. Fix Chi Tiết Modal
old_detail_modal = r'<div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">.*?<!-- Tải thư viện JS'
new_detail_modal = '''<!-- modal để hiển thị thông tin chi tiết -->
                <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content" style="border-radius: 12px; border: none; box-shadow: 0 10px 25px rgba(0,0,0,0.1);">
                            <div class="modal-header bg-light" style="padding: 20px 24px; border-bottom: 1px solid #e2e8f0; border-top-left-radius: 12px; border-top-right-radius: 12px;">
                                <h5 class="modal-title" id="modal-title" style="font-weight: 700; color: #1e293b; font-size: 18px; margin: 0;">
                                    <i class="fas fa-info-circle text-primary me-2"></i>Chi tiết xe máy
                                </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeDetail()" style="color: #64748b; font-size: 24px;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="padding: 30px;">
                                <div class="row">                                       
                                    <div class="col-md-12">
                                        <div class="card border-0 bg-light p-4" style="border-radius: 12px;">
                                            <div class="row mb-3">
                                                <div class="col-sm-3 fw-bold text-secondary">ID Xe:</div>
                                                <div class="col-sm-9 fw-bold text-dark" id="modal-motorcycleID"></div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3 fw-bold text-secondary">Mẫu Xe:</div>
                                                <div class="col-sm-9 fw-bold text-primary" id="modal-motorcycleName"></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-3 fw-bold text-secondary">Biển số:</div>
                                                <div class="col-sm-9" id="modal-license"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        <!-- Tải thư viện JS'''
content = re.sub(old_detail_modal, new_detail_modal, content, flags=re.DOTALL)

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
