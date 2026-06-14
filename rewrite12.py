import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Inject the Update Modal HTML before the user-form-modal
update_modal_html = '''
                <!-- Modal Cập Nhật Xe Máy -->
                <div class="modal fade" id="updateMotorbikeModal" tabindex="-1" role="dialog" aria-labelledby="updateMotorbikeModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" style="border-radius: 12px; overflow: hidden; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.1);">
                            <div class="modal-header" style="background: #1a1816; border-bottom: none; padding: 20px 30px;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff; opacity: 0.8; text-shadow: none; font-size: 24px;"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="updateMotorbikeModalLabel" style="font-weight: 700; color: #d4af37; text-transform: uppercase; font-size: 18px;">Cập Nhật Xe Máy</h4>
                            </div>
                            <div class="modal-body" style="padding: 30px; background: #f8fafc;">
                                <form action="updateMotorManage" method="POST" enctype="multipart/form-data">
                                    <input type="hidden" id="modal-update-id" name="id">

                                    <div class="form-group">
                                        <label for="modal-update-model" style="color: #475569; font-weight: 600; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px;">Mẫu xe:</label>
                                        <input type="text" class="form-control" id="modal-update-model" name="model" required style="border-radius: 8px;">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="modal-update-image" style="color: #475569; font-weight: 600; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px;">Hình ảnh (Bản xem trước có thể xóa bằng nút X):</label>
                                        <div id="modal-update-image-preview" style="position: relative; margin-bottom: 15px; border-radius: 8px; overflow: hidden; display: inline-block;"></div>
                                        <input type="file" class="form-control" id="modal-update-image" name="image" accept="image/*" style="border-radius: 8px;" onchange="previewUpdateImage(event)">
                                        <!-- Hidden input to track if image was removed -->
                                        <input type="hidden" id="modal-update-image-removed" name="imageRemoved" value="false">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="modal-update-displacement" style="color: #475569; font-weight: 600; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px;">Phân khối:</label>
                                        <input type="text" class="form-control" id="modal-update-displacement" name="displacement" required style="border-radius: 8px;">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="modal-update-description" style="color: #475569; font-weight: 600; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px;">Thông Tin Mô Tả:</label>
                                        <textarea class="form-control" id="modal-update-description" name="description" rows="4" required style="resize: vertical; border-radius: 8px;"></textarea>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="modal-update-minAge" style="color: #475569; font-weight: 600; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px;">Độ tuổi tối thiểu:</label>
                                        <input type="number" class="form-control" id="modal-update-minAge" name="minAge" required style="border-radius: 8px;">
                                    </div>

                                    <div class="form-group">
                                        <label for="modal-update-bid" style="color: #475569; font-weight: 600; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px;">Hãng:</label>
                                        <select class="form-control" id="modal-update-bid" name="brandID" style="border-radius: 8px;">
                                            <c:forEach items="${listB}" var="b">
                                                <option value="${b.brandID}">${b.brandName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="modal-update-cid" style="color: #475569; font-weight: 600; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px;">Loại xe:</label>
                                        <select class="form-control" id="modal-update-cid" name="categoryID" style="border-radius: 8px;">
                                            <c:forEach items="${listC}" var="c">
                                                <option value="${c.categoryID}">${c.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="modal-update-pid" style="color: #475569; font-weight: 600; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px;">Bảng giá thuê:</label>
                                        <select class="form-control" id="modal-update-pid" name="priceListID" style="border-radius: 8px;">
                                            <c:forEach items="${listP}" var="p">
                                                <option value="${p.priceListId}">Ngày: ${p.dailyPriceForDay}k - Tuần: ${p.dailyPriceForWeek}k - Tháng: ${p.dailyPriceForMonth}k</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    
                                    <div style="text-align: right; margin-top: 30px; padding-top: 20px; border-top: 1px solid #e2e8f0;">
                                        <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 12px; border-radius: 8px; padding: 10px 24px; font-weight: 600; color: #64748b; background: #fff; border: 1px solid #cbd5e1;">Hủy</button>
                                        <button type="submit" class="btn btn-primary" style="background: #b59349; border: none; border-radius: 8px; padding: 10px 24px; font-weight: 600; color: #fff; box-shadow: 0 4px 12px rgba(181, 147, 73, 0.3);">Cập Nhật Lưu Lại</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
'''

content = content.replace('<!-- modal để hiển thị thông tin chi tiết -->', update_modal_html + '\n<!-- modal để hiển thị thông tin chi tiết -->')

# 2. Add the Javascript functions just before </head> or inside <script> at the bottom.
# Let's insert it inside the `<script>` tag at the bottom BEFORE `$(document).ready`
js_functions = '''
            function openEditModal(btn) {
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
                document.getElementById('modal-update-image-removed').value = "false";
                document.getElementById('modal-update-image').value = ""; // clear file input

                var imgContainer = document.getElementById('modal-update-image-preview');
                imgContainer.innerHTML = '';
                if (image && image !== 'null' && image !== '') {
                    var imgSrc = image.startsWith('http') ? image : 'images/' + image;
                    imgContainer.innerHTML = `
                        <div style="position: relative; display: inline-block;">
                            <img src="${imgSrc}" class="img-fluid img-thumbnail" style="max-height: 150px;" alt="Preview">
                            <button type="button" onclick="removeUpdateImage()" style="position: absolute; top: 5px; right: 5px; background: rgba(255,0,0,0.8); color: white; border: none; border-radius: 50%; width: 24px; height: 24px; display: flex; align-items: center; justify-content: center; cursor: pointer;">&times;</button>
                        </div>
                    `;
                } else {
                    imgContainer.innerHTML = '<span class="text-muted">No image available</span>';
                }

                $('#updateMotorbikeModal').modal('show');
            }

            function removeUpdateImage() {
                var imgContainer = document.getElementById('modal-update-image-preview');
                imgContainer.innerHTML = '<span class="text-muted">Hình ảnh đã bị xóa. Vui lòng chọn ảnh mới.</span>';
                document.getElementById('modal-update-image-removed').value = "true";
                document.getElementById('modal-update-image').value = "";
            }

            function previewUpdateImage(event) {
                var reader = new FileReader();
                reader.onload = function(){
                    var imgContainer = document.getElementById('modal-update-image-preview');
                    imgContainer.innerHTML = `
                        <div style="position: relative; display: inline-block;">
                            <img src="${reader.result}" class="img-fluid img-thumbnail" style="max-height: 150px;" alt="Preview">
                            <button type="button" onclick="removeUpdateImage()" style="position: absolute; top: 5px; right: 5px; background: rgba(255,0,0,0.8); color: white; border: none; border-radius: 50%; width: 24px; height: 24px; display: flex; align-items: center; justify-content: center; cursor: pointer;">&times;</button>
                        </div>
                    `;
                    document.getElementById('modal-update-image-removed').value = "false";
                };
                if(event.target.files[0]){
                    reader.readAsDataURL(event.target.files[0]);
                }
            }

            function OneClick(button) {
                var modal = $('#user-form-modal');
                var id = button.getAttribute('data-id');
                var name = button.getAttribute('data-name');
                var license = button.getAttribute('data-license');
                
                modal.find('#modal-motorcycleID').text(id);
                modal.find('#modal-motorcycleName').text(name);
                
                var platesHtml = '';
                if(license) {
                    var plates = license.split(',').filter(function(p){ return p.trim() !== ''; });
                    if(plates.length > 0) {
                        for(var i=0; i<plates.length; i++){
                            platesHtml += '<span class="badge border bg-light text-dark fw-normal me-1 mb-1" style="font-size:14px; padding:6px 10px;">' + plates[i].trim() + '</span>';
                        }
                    }
                }
                if(platesHtml === '') {
                    platesHtml = '<span class="text-muted">Không có dữ liệu biển số</span>';
                }
                modal.find('#modal-license').html(platesHtml);
                
                modal.modal('show');
            }

            function confirmDelete(motorcycleId) {
                Swal.fire({
                    title: 'Bạn có chắc chắn?',
                    text: "Bạn sẽ không thể khôi phục hành động này!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#1089FF',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Vâng, xóa nó!',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'motorManage?motorcycleId=' + motorcycleId;
                    }
                });
            }

            function addMotorbikeDetail() {
                const motorcycleId = document.getElementById('model').value;
                const licensePlate = document.getElementById('licensePlate').value;
                var data = {
                    motorcycleId: motorcycleId,
                    licensePlate: licensePlate
                };
                fetch('addMotorcycleDetail', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(data)
                }).then(response => {
                    if (response.ok) {
                        Swal.fire('Thành công', 'Thêm xe máy thành công', 'success').then(() => {
                            location.reload();
                        });
                    } else {
                        Swal.fire('Lỗi', 'Có lỗi xảy ra', 'error');
                    }
                });
            }
'''

content = content.replace('<!-- Tải thư viện JS theo đúng thứ tự', js_functions + '\n        <!-- Tải thư viện JS theo đúng thứ tự')

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
