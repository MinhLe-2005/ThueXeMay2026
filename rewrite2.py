import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update CSS for Tabs
old_tabs_css = r'''            /\* --- Premium Pill Tabs --- \*/
            \.nav-tabs \{
.*?
            \.nav-tabs li\.active a::after \{
                display: none; /\* Bỏ cái gạch chân cũ đi \*/
            \}'''

new_tabs_css = '''            /* --- Premium Underline Tabs --- */
            .nav-tabs {
                border-bottom: 2px solid #e2e8f0 !important;
                gap: 0;
                margin-bottom: 25px;
                margin-top: 10px;
                display: flex;
                background: transparent;
                padding: 0;
            }
            .nav-tabs li {
                float: none !important;
                margin-bottom: -2px; 
                margin-right: 30px;
            }
            .nav-tabs li a {
                border: none !important;
                background: transparent !important;
                color: #64748b !important;
                border-radius: 0 !important;
                padding: 12px 5px !important;
                font-weight: 700 !important;
                transition: all 0.3s !important;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                font-size: 14px;
                box-shadow: none !important;
                border-bottom: 3px solid transparent !important;
            }
            .nav-tabs li a:hover {
                color: #0f172a !important;
                background: transparent !important;
                border-bottom: 3px solid #cbd5e1 !important;
            }
            .nav-tabs li.active a,
            .nav-tabs li.active a:focus,
            .nav-tabs li.active a:hover {
                background: transparent !important;
                color: #b59349 !important;
                border-bottom: 3px solid #b59349 !important;
                box-shadow: none !important;
            }'''
content = re.sub(old_tabs_css, new_tabs_css, content, flags=re.DOTALL)

# 2. Update HTML Tabs Navigation
old_ul = r'<ul class="m-auto nav nav-tabs" role="tablist">.*?</ul>'
new_ul = '''<ul class="nav nav-tabs" role="tablist" style="margin-left: 20px;">
                <li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-motorcycle me-2"></i> THÔNG TIN XE MÁY</a></li>
                <li role="presentation"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-plus-circle me-2"></i> THÊM MẪU XE MỚI</a></li>
                <li role="presentation"><a href="#Section3" aria-controls="addNewMotorbike" role="tab" data-toggle="tab"><i class="fa fa-plus-square me-2"></i> THÊM XE MÁY MỚI</a></li>
            </ul>'''
content = re.sub(old_ul, new_ul, content, flags=re.DOTALL)

# 3. Add Modal to bottom of file
modal_html = '''
<!-- Update Motorbike Modal -->
<div class="modal fade" id="updateMotorbikeModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content" style="border-radius: 16px; overflow: hidden; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.1);">
            <div class="modal-header" style="background: #1a1816; color: #d4af37; padding: 20px 30px; border-bottom: 3px solid #b59349;">
                <h5 class="modal-title" style="font-weight: 800; font-family: 'Tahoma', sans-serif;">CẬP NHẬT XE MÁY</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #d4af37; opacity: 1; text-shadow: none;">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="padding: 30px; background: #f5f7fb;">
                <form method="post" action="updateMotorcycle" enctype="multipart/form-data" style="background: transparent; box-shadow: none; padding: 0;">
                    <input type="hidden" name="id" id="modal-update-id">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight: 600;">Tên mẫu xe</label>
                                <input type="text" class="form-control" name="model" id="modal-update-model">
                            </div>
                            <div class="form-group">
                                <label style="font-weight: 600;">Phân khối động cơ</label>
                                <input type="text" class="form-control" list="displacementOptions" name="displacement" id="modal-update-displacement">
                            </div>
                            <div class="form-group">
                                <label style="font-weight: 600;">Thông tin mô tả</label>
                                <textarea class="form-control" rows="3" name="description" id="modal-update-description"></textarea>
                            </div>
                            <div class="form-group">
                                <label style="font-weight: 600;">Độ tuổi tối thiểu</label>
                                <input type="number" class="form-control" list="ageOptions" name="minAge" id="modal-update-minAge">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight: 600;">Hãng xe</label>
                                <select class="form-control" id="modal-update-bid" name="brandID">
                                    <c:forEach items="${listB}" var="b">
                                        <option value="${b.brandID}">${b.brandName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label style="font-weight: 600;">Loại xe</label>
                                <select class="form-control" id="modal-update-cid" name="categoryID">
                                    <c:forEach items="${listC}" var="c">
                                        <option value="${c.categoryID}">${c.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label style="font-weight: 600;">Bảng giá thuê</label>
                                <select class="form-control" id="modal-update-pid" name="priceListID">
                                    <c:forEach items="${listP}" var="p">
                                        <option value="${p.priceListId}">Ngày: ${p.dailyPriceForDay}k - Tuần: ${p.dailyPriceForWeek}k - Tháng: ${p.dailyPriceForMonth}k</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label style="font-weight: 600;">Ảnh hiện tại</label>
                                <div id="modal-update-image-preview" style="margin-bottom: 10px;"></div>
                            </div>
                            <div class="form-group">
                                <label style="font-weight: 600;">Tải ảnh mới (nếu muốn đổi)</label>
                                <input type="file" class="form-control-file" id="modal-update-image-upload" name="image" accept="image/*">
                                <div id="modal-update-new-image-preview" style="margin-top: 15px;"></div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-dark" style="background-color: #1a1816; border-color: #d4af37; color: #d4af37; font-weight: bold; padding: 12px 25px; width: 100%; border-radius: 8px; margin-top: 20px;">CẬP NHẬT XE MÁY</button>
                </form>
            </div>
        </div>
    </div>
</div>
'''
content = content.replace('<!-- Tải thư viện JS', modal_html + '\n        <!-- Tải thư viện JS')

# 4. Remove Section 4 HTML
old_section4 = r'<div role="tabpanel" class="tab-pane fade" id="Section4">.*?</section>\s*</div>'
content = re.sub(old_section4, '', content, flags=re.DOTALL)

# 5. Modify Table Header to add Stock Column
old_th_mau = r'<th scope="col">Mẫu</th>'
new_th_mau = '<th scope="col">Mẫu</th>\n                                            <th scope="col">Kho Xe (Realtime)</th>'
content = content.replace('<th scope="col">Mẫu</th>', new_th_mau)

# 6. Modify Table Body to add Stock Column content
new_td_mau = '''<td><div style="font-weight: 600;">${m.model}</div></td>
                                                <td>
                                                    <c:set var="mID" value="${m.motorcycleId}" />
                                                    <c:set var="availString" value="${mapA[mID]}" />
                                                    <c:set var="availCount" value="0" />
                                                    <c:if test="${not empty availString}">
                                                        <c:set var="availArray" value="${fn:split(availString, ',')}" />
                                                        <c:set var="availCount" value="${fn:length(availArray)}" />
                                                    </c:if>
                                                    <div style="text-align: left; min-width: 150px;">
                                                        <span class="badge" style="background: ${availCount > 0 ? '#1089ff' : '#dc3545'}; margin-bottom: 5px; font-size: 12px; padding: 5px 8px;">
                                                            ${availCount} xe sẵn sàng
                                                        </span>
                                                        <br/>
                                                        <c:if test="${availCount > 0}">
                                                            <div style="margin-top: 5px; max-height: 80px; overflow-y: auto;">
                                                                <c:forEach var="plate" items="${availArray}">
                                                                    <span style="background: #e2e8f0; color: #334155; padding: 2px 6px; border-radius: 4px; margin-right: 3px; display: inline-block; margin-bottom: 3px; font-size: 11px; border: 1px solid #cbd5e1;">${plate}</span>
                                                                </c:forEach>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </td>'''
content = content.replace('<td><div style="font-weight: 600;">${m.model}</div></td>', new_td_mau)

# 7. Add JS for Image Preview with X button (in Add New Motorbike)
new_image_input = '''<input type="file" class="form-control-file" id="motorbikeImage" name="image" accept="image/*">
                                                        <div id="motorbikeImagePreview" style="margin-top: 15px;"></div>'''
content = content.replace('<input type="file" class="form-control-file" id="motorbikeImage" name="image">', new_image_input)

# 8. Modify editMotorcycle function
old_edit_func = r'function editMotorcycle\(id, model, image, displacement, description, minAge, bid, cid, pid\) \{.*?\$\(\'a\[href="#Section4"\]\'\)\.tab\(\'show\'\);\s*\}'
new_edit_func = '''function editMotorcycle(id, model, image, displacement, description, minAge, bid, cid, pid) {
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

            // Image Preview logic with X button
            function setupImagePreview(inputId, previewId) {
                document.getElementById(inputId).addEventListener('change', function(e) {
                    var file = e.target.files[0];
                    var previewContainer = document.getElementById(previewId);
                    previewContainer.innerHTML = '';
                    
                    if (file) {
                        var reader = new FileReader();
                        reader.onload = function(e) {
                            var wrapper = document.createElement('div');
                            wrapper.style.position = 'relative';
                            wrapper.style.display = 'inline-block';
                            
                            var img = document.createElement('img');
                            img.src = e.target.result;
                            img.style.maxWidth = '200px';
                            img.style.maxHeight = '200px';
                            img.className = 'img-thumbnail';
                            
                            var closeBtn = document.createElement('button');
                            closeBtn.innerHTML = '&times;';
                            closeBtn.style.position = 'absolute';
                            closeBtn.style.top = '-10px';
                            closeBtn.style.right = '-10px';
                            closeBtn.style.background = 'red';
                            closeBtn.style.color = 'white';
                            closeBtn.style.border = 'none';
                            closeBtn.style.borderRadius = '50%';
                            closeBtn.style.width = '24px';
                            closeBtn.style.height = '24px';
                            closeBtn.style.cursor = 'pointer';
                            closeBtn.style.lineHeight = '24px';
                            closeBtn.style.padding = '0';
                            closeBtn.onclick = function(event) {
                                event.preventDefault();
                                document.getElementById(inputId).value = ''; 
                                previewContainer.innerHTML = ''; 
                            };
                            
                            wrapper.appendChild(img);
                            wrapper.appendChild(closeBtn);
                            previewContainer.appendChild(wrapper);
                        }
                        reader.readAsDataURL(file);
                    }
                });
            }

            document.addEventListener('DOMContentLoaded', function() {
                setupImagePreview('motorbikeImage', 'motorbikeImagePreview');
                setupImagePreview('modal-update-image-upload', 'modal-update-new-image-preview');
            });
'''
content = re.sub(old_edit_func, new_edit_func, content, flags=re.DOTALL)

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
