import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update CSS: Make table bordered again and limit image size
css_to_remove = r'\/\* --- Clean Table Styles ---\ \*\/.*?\.action-buttons\s*\{.*?\}'
new_css = '''
            /* --- Clean Table Styles --- */
            .e-panel.card {
                background: #fff;
            }
            .table-bordered {
                border: 1px solid #dee2e6 !important;
            }
            .table-bordered th, .table-bordered td {
                border: 1px solid #dee2e6 !important;
                vertical-align: middle;
                text-align: center;
                color: #212529;
                font-size: 14px;
            }
            .table-bordered th {
                background-color: #f8f9fa;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 13px;
                color: #495057;
            }
            .table-bordered td img {
                max-width: 120px;
                height: auto;
                border-radius: 4px;
            }
            .table-bordered td.text-left {
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
content = re.sub(css_to_remove, new_css, content, flags=re.DOTALL)

# Update the table tag to be bordered
content = content.replace('<table class="table" id="motorTable" style="width: 100%;">', '<table class="table table-bordered table-hover" id="motorTable" style="width: 100%;">')

# Update Kho Xe
old_kho_xe = r'<div class="text-left" style="min-width: 160px; margin: 0 auto;">.*?<\/c:choose>\s*<\/div>'
new_kho_xe = '''<div class="text-left" style="min-width: 120px; margin: 0 auto;">
                                                        <c:choose>
                                                            <c:when test="${availCount > 0}">
                                                                <div style="font-weight: 600; font-size: 13px; color: #198754; margin-bottom: 5px;">
                                                                    <i class="fas fa-check-circle"></i> Sẵn sàng: ${availCount} xe
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

# Action Buttons
old_actions = r'<div>\s*<button class="btn btn-outline-primary btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px; margin-right: 4px;" title="Cập nhật" onclick="editMotorcycle\(\'\$\{m.motorcycleId\}\', \'\$\{m.model\}\', \'\$\{m.image\}\', \'\$\{m.displacement\}\', \'\$\{m.description\}\', \'\$\{m.minAge\}\', \'\$\{m.brandID\}\', \'\$\{m.categoryID\}\', \'\$\{m.priceListID\}\'\)">\s*<i class="fas fa-edit"><\/i>\s*<\/button>\s*<button class="btn btn-outline-danger btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px;" title="Xóa" onclick="confirmDelete\(\'\$\{m.motorcycleId\}\'\)">\s*<i class="fas fa-trash"><\/i>\s*<\/button>\s*<\/div>'
new_actions = '''<div>
                                                        <button type="button" class="btn btn-outline-primary btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px; margin-right: 4px;" title="Cập nhật" 
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
                                                        <button type="button" class="btn btn-outline-danger btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px;" title="Xóa" onclick="confirmDelete('${m.motorcycleId}')">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>'''
content = re.sub(old_actions, new_actions, content, flags=re.DOTALL)

# Add openEditModal JS function
old_edit_func = r'function editMotorcycle\(id, model, image, displacement, description, minAge, bid, cid, pid\) \{.*?\}\s*\/\/\s*Image Preview logic'
new_edit_func = '''function openEditModal(btn) {
                var id = btn.getAttribute('data-id');
                var model = btn.getAttribute('data-model');
                var image = btn.getAttribute('data-image');
                var displacement = btn.getAttribute('data-displacement');
                var description = btn.getAttribute('data-desc');
                var minAge = btn.getAttribute('data-age');
                var bid = btn.getAttribute('data-bid');
                var cid = btn.getAttribute('data-cid');
                var pid = btn.getAttribute('data-pid');

                document.getElementById('modal-update-id').value = id;
                document.getElementById('modal-update-model').value = model;
                document.getElementById('modal-update-displacement').value = displacement;
                document.getElementById('modal-update-description').value = description;
                document.getElementById('modal-update-minAge').value = minAge;
                document.getElementById('modal-update-bid').value = bid;
                document.getElementById('modal-update-cid').value = cid;
                document.getElementById('modal-update-pid').value = pid;

                var imgContainer = document.getElementById('modal-update-image-preview');
                imgContainer.innerHTML = '';
                if (image && image !== 'null' && image !== '') {
                    var imgSrc = image.startsWith('http') ? image : 'images/' + image;
                    var img = document.createElement('img');
                    img.src = imgSrc;
                    img.alt = 'Motorbike Image';
                    img.className = 'img-fluid img-thumbnail';
                    img.style.maxHeight = '150px';
                    imgContainer.appendChild(img);
                } else {
                    imgContainer.innerHTML = '<span class="text-muted">No image available</span>';
                }

                $('#updateMotorbikeModal').modal('show');
            }
            
            // Backward compatibility just in case
            function editMotorcycle(id, model, image, displacement, description, minAge, bid, cid, pid) {
                // Fallback (might break on quotes)
            }

            // Image Preview logic'''
content = re.sub(old_edit_func, new_edit_func, content, flags=re.DOTALL)

# Fix user-form-modal layout and update dataset attributes
old_chi_tiet = r'<button type="button" class="btn btn-outline-secondary btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px; font-weight: 500; font-size: 13px;" id="launchModalBtn".*?>.*?<\/button>'
new_chi_tiet = '''<button type="button" class="btn btn-outline-secondary btn-sm shadow-none" style="border-radius: 4px; padding: 4px 10px; font-weight: 500; font-size: 13px;" 
                                                                data-id="${m.motorcycleId}" 
                                                                data-name="${m.model}" 
                                                                data-license="<c:forEach items='${m.listMotorcycleDetails}' var='listmd'>${listmd.licensePlate},</c:forEach>" 
                                                                onclick="OneClick(this)">
                                                            <i class="fas fa-eye me-1"></i> Chi tiết
                                                    </button>'''
content = re.sub(old_chi_tiet, new_chi_tiet, content, flags=re.DOTALL)

# Fix OneClick JS
old_oneclick = r'function OneClick\(button\) \{.*?modal\.modal\(\'show\'\);\s*\}'
new_oneclick = '''function OneClick(button) {
                  var modal = $('#user-form-modal');
                  var id = button.getAttribute('data-id');
                  var name = button.getAttribute('data-name');
                  var license = button.getAttribute('data-license');
                  
                  modal.find('#modal-motorcycleID').text(id);
                  modal.find('#modal-motorcycleName').text(name);
                  
                  var plates = license ? license.split(',').filter(function(p){ return p.trim() !== ''; }) : [];
                  var platesHtml = '';
                  if(plates.length > 0) {
                      for(var i=0; i<plates.length; i++){
                          platesHtml += '<span class="badge border bg-light text-dark fw-normal me-1 mb-1" style="font-size:14px; padding:6px 10px;">' + plates[i].trim() + '</span>';
                      }
                  } else {
                      platesHtml = '<span class="text-muted">Không có dữ liệu biển số</span>';
                  }
                  modal.find('#modal-license').html(platesHtml);
                  
                  modal.modal('show');
              }'''
content = re.sub(old_oneclick, new_oneclick, content, flags=re.DOTALL)

# Fix Detail Modal HTML
old_detail_modal = r'<!-- modal để hiển thị thông tin chi tiết -->.*?<!-- Tải thư viện JS'
new_detail_modal = '''<!-- modal để hiển thị thông tin chi tiết -->
                <div class="modal fade" role="dialog" tabindex="-1" id="user-form-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" style="border-radius: 8px; border: none; box-shadow: 0 4px 20px rgba(0,0,0,0.1);">
                            <div class="modal-header bg-light" style="padding: 15px 20px; border-bottom: 1px solid #dee2e6;">
                                <h5 class="modal-title" style="font-weight: 600; color: #212529; font-size: 16px; margin: 0;">
                                    <i class="fas fa-info-circle text-primary me-2"></i>Chi tiết xe máy
                                </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="padding: 20px;">
                                <table class="table table-bordered mb-0">
                                    <tbody>
                                        <tr>
                                            <th style="width: 30%; background-color: #f8f9fa;">ID Xe</th>
                                            <td id="modal-motorcycleID" class="fw-bold"></td>
                                        </tr>
                                        <tr>
                                            <th style="background-color: #f8f9fa;">Mẫu Xe</th>
                                            <td id="modal-motorcycleName" class="fw-bold text-primary"></td>
                                        </tr>
                                        <tr>
                                            <th style="background-color: #f8f9fa;">Biển số</th>
                                            <td id="modal-license"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            </div>
                        </div>
                    </div>
                </div>
        <!-- Tải thư viện JS'''
content = re.sub(old_detail_modal, new_detail_modal, content, flags=re.DOTALL)

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
