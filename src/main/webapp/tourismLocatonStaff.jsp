<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý các địa điểm du lịch</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <style>
    body, html { height: 100%; margin: 0; font-family: 'Poppins', sans-serif; background-color: #f8fafc; }
    .container-fluid { padding: 2rem; }
    
    /* --- Card Container --- */
    .card { background: #fff; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); border: none; margin-bottom: 2rem; }
    .card-header { background: #fff; border-bottom: 1px solid #e2e8f0; padding: 1.5rem; border-radius: 12px 12px 0 0; display: flex; justify-content: space-between; align-items: center; }
    .card-title { color: #1e293b; font-size: 1.25rem; font-weight: 600; margin: 0; }
    .card-body { padding: 0; }

    /* --- Table Styles --- */
    .table-responsive { overflow-x: auto; border-radius: 0 0 12px 12px; }
    .table { margin-bottom: 0; width: 100%; border-collapse: separate; border-spacing: 0; }
    .table thead th { background: #f1f5f9; color: #334155; font-size: 0.85rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; border: none; border-bottom: 2px solid #cbd5e1; padding: 14px 16px; text-align: center; vertical-align: middle; white-space: nowrap; }
    .table tbody td { vertical-align: middle; border: none; border-bottom: 1px solid #e2e8f0; padding: 14px 16px; color: #334155; font-size: 0.9rem; text-align: center; transition: background-color 0.2s; }
    .table tbody tr:hover td { background-color: #f8fafc; }
    .table tbody tr:last-child td { border-bottom: none; }
    .table img { max-width: 80px; height: auto; max-height: 80px; object-fit: contain; border-radius: 6px; border: 1px solid #e2e8f0; padding: 2px; }

    
    /* --- Custom Select & Text Truncate --- */
    .custom-select { appearance: none; -webkit-appearance: none; -moz-appearance: none; background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23475569"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 12px center; background-size: 16px; background-color: #fff; border: 1px solid #cbd5e1; border-radius: 20px; padding: 6px 36px 6px 16px; font-weight: 500; color: #475569; transition: all 0.2s; cursor: pointer; height: auto; }
    .custom-select:focus { outline: none; border-color: #d4af37; box-shadow: 0 0 0 3px rgba(212,175,55,0.1); }
    .dataTables_wrapper .dataTables_length select { margin: 0 10px; border: 1px solid #cbd5e1; border-radius: 20px; padding: 5px 30px 5px 15px; outline: none; background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23475569"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 8px center; background-size: 16px; appearance: none; -webkit-appearance: none; }
    
    .desc-text { display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; max-width: 160px; color: #6c757d; font-size: 13px; text-align: center; margin: 0 auto; }
    .url-text { max-width: 120px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: block; color: #3b82f6; text-decoration: none; }
    .url-text:hover { text-decoration: underline; }

    /* --- Button Styles --- */
    .btn-custom-add { background: linear-gradient(135deg, #d4af37 0%, #f1c40f 100%); color: #fff; border: none; border-radius: 6px; padding: 8px 16px; font-weight: 500; font-size: 0.9rem; transition: all 0.3s ease; display: inline-flex; align-items: center; gap: 6px; box-shadow: 0 2px 4px rgba(212, 175, 55, 0.3); }
    .btn-custom-add:hover { background: linear-gradient(135deg, #c5a030 0%, #e3b70e 100%); color: #fff; transform: translateY(-1px); box-shadow: 0 4px 6px rgba(212, 175, 55, 0.4); }
    .action-buttons .btn { border-radius: 6px; padding: 6px 10px; margin: 0 3px; font-size: 0.85rem; transition: all 0.2s; }
    .btn-edit { background-color: #ecfeff; color: #0891b2; border: 1px solid #a5f3fc; }
    .btn-edit:hover { background-color: #cffafe; color: #0e7490; }
    .btn-delete { background-color: #fef2f2; color: #ef4444; border: 1px solid #fecaca; }
    .btn-delete:hover { background-color: #fee2e2; color: #b91c1c; }

    /* --- Modal Styles --- */
    .modal-content { border-radius: 12px; border: none; box-shadow: 0 10px 25px rgba(0,0,0,0.1); }
    .modal-header { background: #fff; border-bottom: 1px solid #e2e8f0; border-radius: 12px 12px 0 0; padding: 1.5rem; }
    .modal-title { color: #1e293b; font-weight: 600; font-size: 1.25rem; }
    .modal-body { padding: 1.5rem; }
    .modal-footer { border-top: 1px solid #e2e8f0; padding: 1rem 1.5rem; background: #f8fafc; border-radius: 0 0 12px 12px; }
    .close { color: #64748b; opacity: 0.7; transition: opacity 0.2s; }
    .close:hover { opacity: 1; color: #0f172a; }
    .form-control, .form-control-file { border-radius: 6px; border: 1px solid #cbd5e1; padding: 0.5rem 0.75rem; box-shadow: inset 0 1px 2px rgba(0,0,0,0.05); }
    .form-control:focus { border-color: #3b82f6; box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1); }
    label { font-weight: 500; color: #475569; margin-bottom: 0.5rem; display: inline-block; }
</style>
    </head>

    <body>
        <div class="container-fluid mt-4">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="card-title"><i class="fa fa-map-marked-alt text-primary mr-2"></i> DANH SÁCH ĐỊA ĐIỂM DU LỊCH</h3>
                    <button class="btn btn-custom-add" data-toggle="modal" data-target="#addLocationModal">
                        <i class="fa fa-plus-circle"></i> Thêm Mới Địa Điểm
                    </button>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Ảnh</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Mô Tả</th>
                                            <th scope="col">Đường Dẫn Bài Viết</th>
                                            <th scope="col">Nhân Viên</th>
                                            <th scope="col">Gợi Ý Xe</th>
                                            <th scope="col">Hành Động</th>

                                        </tr>
                                    </thead>
                            <tbody>
                                        <c:forEach var="touristLocations" items="${touristLocation}">
                                            <tr>
                                                <td>${touristLocations.locationId}</td>
                                                <td class="w-25">
                                                    <img src="${empty touristLocations.locationImage ? 'images/default.jpg' : (touristLocations.locationImage.startsWith('http') ? touristLocations.locationImage : 'images/'.concat(touristLocations.locationImage))}" class="img-fluid img-thumbnail" alt="Location Image">
                                                </td>
                                                <td>${touristLocations.locationName}</td>
                                                <td><div class="desc-text" title="${touristLocations.description}">${touristLocations.description}</div></td>
                                                <td><a href="${touristLocations.urlArticle}" target="_blank" class="url-text" title="${touristLocations.urlArticle}">${touristLocations.urlArticle}</a></td>
                                                <td>${touristLocations.staffID}</td>
                                                <td>
                                                    <button class="btn btn-warning btn-sm" onclick="manageRecommendations('${touristLocations.locationId}', '${touristLocations.locationName}')">
                                                        <i class="fa fa-motorcycle text-white"></i> Quản lý
                                                    </button>
                                                </td>
                                                <td class="action-buttons">
                                                    <div class="buttons">
                                                        <button class="btn btn-edit" onclick="editTouristLocation('${touristLocations.locationId}', '${touristLocations.locationName}', '${touristLocations.locationImage}', '${touristLocations.description}', '${touristLocations.urlArticle}', '${touristLocations.staffID}')">
                                                            <i class="fa fa-edit"></i>
                                                        </button>

                                                        <button class="btn btn-delete" title="Delete" onclick="confirmDelete('${touristLocations.locationId}')">
                                                            <i class="fa-solid fa fa-trash" ></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                <!-- Section 2: Add New Tourist Location -->
                
<!-- Add Location Modal -->
<div class="modal fade" id="addLocationModal" tabindex="-1" role="dialog" aria-labelledby="addLocationModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addLocationModalLabel"><i class="fa fa-plus-circle text-primary"></i> Thêm Mới Địa Điểm Du Lịch</h4>
            </div>
            <form class="addnew-location-form" id="addLocationForm" action="AddTouristLocationServletStaff" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    
                                                    <div class="form-group">
                                                        <label for="locationImage" style="font-weight: 600;">Location Image:</label>
                                                        <div id="locationImagePreview" style="margin-bottom: 15px; border-radius: 8px; overflow: hidden; display: inline-block;"></div>
                                                        <input type="file" class="form-control-file" id="locationImage" name="locationImage" accept="image/*" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="locationName" name="locationName" placeholder="Nhập tên địa điểm du lịch" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <textarea class="form-control" id="description" name="description" rows="3" placeholder="Nhập mô tả" required></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="urlArticle" name="urlArticle" placeholder="Nhập đường dẫn bài viết" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="staffID">Lựa Chọn Nhân Viên:</label>
                                                        <select class="form-control custom-select" id="staffID" name="staffID" required>
                                                            <!--<option value="">Select Staff</option>-->
                                                            <c:forEach var="staff" items="${staffList}" varStatus="loop">
                                                                <option value="${staff.staffID}">${staff.staffID}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    
                                                
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Thêm Mới</button>
                </div>
            </form>
        </div>
    </div>
</div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <!-- Nội dung của Section 3 -->
                
<!-- Edit Location Modal -->
<div class="modal fade" id="editLocationModal" tabindex="-1" role="dialog" aria-labelledby="editLocationModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="editLocationModalLabel"><i class="fa fa-edit text-info"></i> Chỉnh Sửa Địa Điểm Du Lịch</h4>
            </div>
            <form class="edit-location-form" id="editLocationForm" action="UpdateTourismLoctionServletStaff" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    
                                                    <div class="form-group">
                                                        <label for="editLocationImage">ID:</label>
                                                        <input type="text" class="form-control" id="editLocationId" name="locationId" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="editLocationImage">Ảnh:</label>
                                                        <div id="editLocationImagePreview"></div>
                                                        <input type="file" class="form-control-file" id="editLocationImage" name="locationImage" accept="image/*">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="editLocationName">Tên Địa Điểm:</label>
                                                        <input type="text" class="form-control" id="editLocationName" name="locationName" placeholder="Enter location name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="editDescription">Mô Tả</label>
                                                        <textarea class="form-control" id="editDescription" name="description" rows="3" placeholder="Enter description"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="editUrlArticle">Đường Dẫn Bài Viết:</label>
                                                        <input type="text" class="form-control" id="editUrlArticle" name="urlArticle" placeholder="Enter URL article">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="editStaffID">Lựa Chọn Nhân Viên:</label>
                                                        <select class="form-control custom-select" id="editStaffID" name="staffID">
                                                            <!-- Options sẽ được tạo bằng cách sử dụng forEach hoặc theo dạng tĩnh -->
                                                            <c:forEach var="staff" items="${staffList}" varStatus="loop">
                                                                <option value="${staff.staffID}">${staff.staffID}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    
                                                
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-info"><i class="fa fa-save"></i> Cập Nhật</button>
                </div>
            </form>
        </div>
    </div>
</div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
        <!-- Modal Quản lý Gợi ý Xe -->
        <div class="modal fade" id="recommendationModal" tabindex="-1" role="dialog" aria-labelledby="recommendationModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background: linear-gradient(135deg, #b8860b 0%, #f1c40f 100%);">
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="recommendationModalLabel" style="color: #fff; font-weight: bold;"><i class="fa fa-motorcycle me-2"></i> Quản lý Gợi ý Xe - <span id="recLocationName"></span></h4>
                    </div>
                    <div class="modal-body">
                        <!-- Info Alert cho Ưu Tiên -->
                        <div class="alert alert-info" style="border-radius: 8px; border-left: 4px solid #0dcaf0;">
                            <i class="fa fa-info-circle me-2"></i> <strong>Độ ưu tiên:</strong> Quyết định thứ tự hiển thị xe ngoài trang chủ. Số càng nhỏ (ví dụ 1, 2) thì xe càng được xếp hạng cao và ưu tiên xuất hiện trước.
                        </div>
                        
                        <!-- Form Thêm Gợi ý -->
                        <div class="card mb-4" style="background-color: #fff; border: 1px solid #e2e8f0; border-radius: 10px; box-shadow: 0 2px 4px rgba(0,0,0,0.02);">
                            <div class="card-body" style="padding: 1.5rem;">
                                <h5 style="font-weight: 600; color: #1e293b; margin-top: 0; margin-bottom: 1rem;"><i class="fa fa-plus-circle text-success"></i> Thêm Gợi ý Mới</h5>
                            <h5 style="font-weight: bold; margin-top: 0;">Thêm Gợi ý Mới</h5>
                            <form id="addRecForm" class="form-inline d-flex justify-content-between" style="display: flex; gap: 10px;">
                                <input type="hidden" id="recLocationId">
                                <div class="form-group" style="flex: 3;">
                                    <select class="form-control custom-select" id="recMotorcycleId" required style="width: 100%;">
                                        <option value="">-- Chọn Xe Khả Dụng --</option>
                                        <c:forEach var="motor" items="${allMotorcycles}">
                                            <option value="${motor.motorcycleId}">${motor.model} (${motor.motorcycleId})</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group" style="flex: 4;">
                                    <input type="text" class="form-control" id="recReason" placeholder="Lý do gợi ý (VD: Leo đèo khỏe)" required style="width: 100%;">
                                </div>
                                <div class="form-group" style="flex: 2;">
                                    <input type="number" class="form-control" id="recPriority" placeholder="Ưu tiên (1-10)" required style="width: 100%;" min="1" max="99">
                                </div>
                                <button type="submit" class="btn btn-success" style="flex: 1;"><i class="fa fa-plus"></i> Thêm</button>
                            </form>
                            </div>
                        </div>
                        
                        <!-- Danh sách hiện tại -->
                        <h5 style="font-weight: bold; margin-top: 25px;">Danh sách xe đang gợi ý</h5>
                        <table class="table table-bordered table-hover" id="recTable">
                            <thead class="bg-light">
                                <tr>
                                    <th>Mẫu Xe</th>
                                    <th>Hình Ảnh</th>
                                    <th>Lý do gợi ý</th>
                                    <th>Độ ưu tiên</th>
                                    <th class="text-center">Xóa</th>
                                </tr>
                            </thead>
                            <tbody id="recTableBody">
                                <!-- Dữ liệu render bằng JS -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Parse dữ liệu map từ Backend sang JS
            var recommendData = {
                <c:forEach var="entry" items="${recommendMap}" varStatus="status">
                    "${entry.key}": [
                        <c:forEach var="rec" items="${entry.value}" varStatus="st">
                            {
                                motorcycleId: "${rec.motorcycleId}",
                                model: "${rec.model}",
                                image: "${rec.image}",
                                reason: "${rec.reason}",
                                priority: ${rec.priority}
                            }${!st.last ? ',' : ''}
                        </c:forEach>
                    ]${!status.last ? ',' : ''}
                </c:forEach>
            };

            function manageRecommendations(locationId, locationName) {
                $('#recLocationId').val(locationId);
                $('#recLocationName').text(locationName);
                
                var tbody = $('#recTableBody');
                tbody.empty();
                
                var recs = recommendData[locationId] || [];
                if (recs.length === 0) {
                    tbody.append('<tr><td colspan="5" class="text-center text-muted">Chưa có gợi ý xe nào cho địa điểm này.</td></tr>');
                } else {
                    recs.forEach(function(rec) {
                        var imgSrc = rec.image ? (rec.image.startsWith('http') ? rec.image : 'images/' + rec.image) : 'images/default.jpg';
                        var tr = $('<tr></tr>');
                        tr.append('<td><strong>' + rec.model + '</strong><br><small class="text-muted">' + rec.motorcycleId + '</small></td>');
                        tr.append('<td><img src="' + imgSrc + '" class="img-thumbnail" style="height: 50px;"></td>');
                        tr.append('<td>' + rec.reason + '</td>');
                        tr.append('<td>' + rec.priority + '</td>');
                        tr.append('<td class="text-center"><button class="btn btn-danger btn-sm" onclick="deleteRec(' + locationId + ', \'' + rec.motorcycleId + '\')"><i class="fa fa-trash"></i></button></td>');
                        tbody.append(tr);
                    });
                }
                
                $('#recommendationModal').modal('show');
            }

            // Xử lý Thêm Gợi ý (Ajax)
            $('#addRecForm').submit(function(e) {
                e.preventDefault();
                var locId = $('#recLocationId').val();
                var motId = $('#recMotorcycleId').val();
                var reason = $('#recReason').val();
                var prio = $('#recPriority').val();
                
                $.post('TourismLocationServletStaff', {
                    action: 'add',
                    locationId: locId,
                    motorcycleId: motId,
                    reason: reason,
                    priority: prio
                }, function(res) {
                    if (res.success) {
                        Swal.fire('Thành công!', 'Đã thêm gợi ý xe.', 'success').then(() => {
                            window.location.reload();
                        });
                    } else {
                        Swal.fire('Lỗi!', res.message || 'Không thể thêm (có thể do trùng xe).', 'error');
                    }
                });
            });

            // Xử lý Xóa Gợi ý (Ajax)
            function deleteRec(locationId, motorcycleId) {
                Swal.fire({
                    title: 'Xóa gợi ý?',
                    text: "Bạn chắc chắn muốn xóa gợi ý xe này khỏi địa điểm?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Xóa',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.post('TourismLocationServletStaff', {
                            action: 'delete',
                            locationId: locationId,
                            motorcycleId: motorcycleId
                        }, function(res) {
                            if (res.success) {
                                Swal.fire('Đã xóa!', '', 'success').then(() => {
                                    window.location.reload();
                                });
                            } else {
                                Swal.fire('Lỗi!', 'Không thể xóa.', 'error');
                            }
                        });
                    }
                });
            }

            function editTouristLocation(locationId, locationName, locationImage, description, urlArticle, staffID) {
                document.getElementById('editLocationId').value = locationId;
                document.getElementById('editLocationName').value = locationName;
                document.getElementById('editDescription').value = description;
                document.getElementById('editUrlArticle').value = urlArticle;
                document.getElementById('editStaffID').value = staffID;

                var imgContainer = document.getElementById('editLocationImagePreview');
                imgContainer.innerHTML = ''; // Xóa hình ảnh cũ (nếu có)
                console.log("thinh");
                // Hiển thị hình ảnh đối tượng
                if (locationImage) {
                    console.log("hihihi");
                    var img = document.createElement('img');
                    img.src = 'images/' + locationImage;
                    img.alt = 'Location Image';
                    img.className = 'img-fluid img-thumbnail';
                    imgContainer.appendChild(img);
                } else {
                    imgContainer.innerHTML = 'No image available';
                }

                // Hiển thị modal chỉnh sửa
                $('#editLocationModal').modal('show');
            }

        </script>

        <script type="text/javascript">
            function confirmDelete(locationId) {
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
                        window.location.href = 'DeleteTourismLocationServletStaff?locationId=' + locationId;
                    }
                })
            }
        </script>

        <script>
            document.getElementById('addLocationForm').addEventListener('submit', function (event) {
                var fileInput = document.getElementById('locationImage');
                var errorMessage = document.getElementById('error-message');
                var successMessage = document.getElementById('success-message');

                // Validate file type if needed
                var fileName = fileInput.value;
                var idxDot = fileName.lastIndexOf(".") + 1;
                var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                if (extFile != "jpg" && extFile != "jpeg" && extFile != "png" && extFile != "gif") {
                    event.preventDefault();
                    errorMessage.style.display = 'block';
                } else {
                    errorMessage.style.display = 'none';
                    successMessage.style.display = 'block';
                }
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#addLocationForm').submit(function (event) {
                    event.preventDefault(); // Ngăn chặn hành động mặc định của form

                    var formData = new FormData(this); // Lấy dữ liệu từ form

                    $.ajax({
                        type: 'POST',
                        url: $(this).attr('action'),
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            // Hiển thị thông báo thành công bằng SweetAlert
                            Swal.fire({
                                icon: 'success',
                                title: 'Success!',
                                text: 'Location added successfully!',
                                timer: 2000, // Tự động đóng sau 2 giây
                                showConfirmButton: false
                            }).then(function () {
                                // Chuyển hướng về trang TourismLocationServletStaff sau khi thêm thành công
                                window.location.href = 'TourismLocationServletStaff';
                            });
                        },
                        error: function (xhr, status, error) {
                            // Hiển thị thông báo lỗi bằng SweetAlert
                            Swal.fire({
                                icon: 'error',
                                title: 'Error!',
                                text: 'Error adding location. Please try again.',
                                confirmButtonText: 'OK'
                            });
                            console.error(xhr.responseText);
                        }
                    });
                });
            });
        </script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/imagePreview.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                if (typeof setupLivePreview === 'function') {
                    setupLivePreview('locationImage', 'locationImagePreview');
                    setupLivePreview('editLocationImage', 'editLocationImagePreview');
                }
            });
        </script>
    </body>

</html>
