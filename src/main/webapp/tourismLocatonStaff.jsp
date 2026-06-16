<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/newlogo_transparent.png">
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
    .table { margin-bottom: 0; width: 100%; border-collapse: separate !important; border-spacing: 0 !important; border: 1px solid #e2e8f0 !important; border-radius: 8px !important; overflow: hidden !important;}
    .table th { background-color: #f1f5f9 !important; color: #334155 !important; font-size: 0.85rem !important; font-weight: 600; text-transform: uppercase !important; letter-spacing: 0.5px !important; padding: 14px 16px !important; border-bottom: 2px solid #cbd5e1 !important; border-right: 1px solid #e2e8f0 !important; text-align: center; vertical-align: middle; white-space: nowrap; }
    .table th:last-child { border-right: none !important; }
    .table td { vertical-align: middle !important; padding: 16px 16px !important; border-bottom: 1px solid #e2e8f0 !important; border-right: 1px solid #e2e8f0 !important; color: #334155; font-size: 15px !important; text-align: center; transition: background-color 0.2s; }
    .table td:last-child { border-right: none !important; }
    .table tbody tr:hover td { background-color: #f8fafc; }
    .table tr:last-child td { border-bottom: none !important; }
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
            <div class="pagetitle" style="margin-bottom: 20px; padding-left: 0;">
                <h1 style="color: #1a1816; font-weight: 800; font-size: 24px; text-transform: uppercase; margin-top: 0; margin-bottom: 5px; font-family: 'Tahoma', sans-serif;">QUẢN LÝ ĐỊA ĐIỂM DU LỊCH</h1>
                <nav>
                    <ol class="breadcrumb" style="background: transparent; padding: 0; margin: 0; font-size: 14px;">
                        <li style="display: inline-block;"><a href="homeStaff" target="_top" style="color: #b59349; text-decoration: none; font-weight: 600;">Trang chủ</a></li>
                        <li class="active" style="display: inline-block; font-weight: 500; color: #6c757d;">Quản lý địa điểm du lịch</li>
                    </ol>
                </nav>
            </div>
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
                                            <th scope="col">Tên Địa Điểm</th>
                                            <th scope="col">Mô Tả</th>
                                            <th scope="col">Đường Dẫn Bài Viết</th>
                                            <th scope="col">Xe Phù Hợp</th>
                                            <th scope="col">Hành Động</th>

                                        </tr>
                                    </thead>
                            <tbody>
                                        <c:forEach var="touristLocations" items="${touristLocation}">
                                            <tr>
                                                <td>${touristLocations.locationId}</td>
                                                <td class="w-25">
                                                    <img src="${empty touristLocations.locationImage ? 'images/default.jpg' : (touristLocations.locationImage.startsWith('http') ? touristLocations.locationImage : 'images/'.concat(touristLocations.locationImage))}" class="img-fluid img-thumbnail" loading="lazy" alt="Location Image">
                                                </td>
                                                <td><strong>${touristLocations.locationName}</strong></td>
                                                <td><div class="desc-text" title="${touristLocations.description}">${touristLocations.description}</div></td>
                                                <td><a href="${touristLocations.urlArticle}" target="_blank" class="url-text" title="${touristLocations.urlArticle}">${touristLocations.urlArticle}</a></td>
                                                <td>
                                                    <button class="btn btn-warning btn-sm" onclick="manageRecommendations('${touristLocations.locationId}', '${touristLocations.locationName}')" title="Quản lý xe phù hợp với địa điểm này">
                                                        <i class="fa fa-motorcycle text-white"></i> Quản Lý Xe
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
            <form class="form-horizontal addnew-location-form" id="addLocationForm" action="AddTouristLocationServletStaff" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-3" for="locationImage" style="font-weight: 600;">Ảnh Địa Điểm:</label>
                                                        <div class="col-sm-9">
                                                            <div id="locationImagePreview" style="margin-bottom: 15px; border-radius: 8px; overflow: hidden; display: inline-block;"></div>
                                                            <input type="file" class="form-control-file" id="locationImage" name="locationImage" accept="image/*" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-3" for="locationName">Tên Địa Điểm:</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="locationName" name="locationName" placeholder="Nhập tên địa điểm du lịch" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-3" for="description">Mô Tả:</label>
                                                        <div class="col-sm-9">
                                                            <textarea class="form-control" id="description" name="description" rows="3" placeholder="Nhập mô tả" required></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-3" for="urlArticle">Đường Dẫn:</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="urlArticle" name="urlArticle" placeholder="Nhập đường dẫn bài viết" required>
                                                        </div>
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
            <form class="form-horizontal edit-location-form" id="editLocationForm" action="UpdateTourismLoctionServletStaff" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-3" for="editLocationId">ID:</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="editLocationId" name="locationId" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-3" for="editLocationImage">Ảnh:</label>
                                                        <div class="col-sm-9">
                                                            <div id="editLocationImagePreview" style="margin-bottom: 10px;"></div>
                                                            <input type="file" class="form-control-file" id="editLocationImage" name="locationImage" accept="image/*">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-3" for="editLocationName">Tên Địa Điểm:</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="editLocationName" name="locationName" placeholder="Nhập tên địa điểm">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-3" for="editDescription">Mô Tả:</label>
                                                        <div class="col-sm-9">
                                                            <textarea class="form-control" id="editDescription" name="description" rows="3" placeholder="Nhập mô tả"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-3" for="editUrlArticle">Đường Dẫn:</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="editUrlArticle" name="urlArticle" placeholder="Nhập đường dẫn bài viết">
                                                        </div>
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
                    <div class="modal-body" style="background-color: #f8fafc; padding: 1.5rem;">

                        
                        <!-- Form Thêm Xe Phù Hợp - Redesigned -->
                        <div class="card mb-4" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border: none; border-radius: 12px; box-shadow: 0 4px 12px rgba(102, 126, 234, 0.15);">
                            <div class="card-body" style="padding: 1.5rem;">
                                <h6 style="font-weight: 600; color: #fff; margin: 0 0 1rem 0; display: flex; align-items: center; gap: 8px;">
                                    <i class="fa fa-plus-circle" style="font-size: 1.1rem;"></i> 
                                    <span>Thêm Xe Phù Hợp Cho Địa Điểm</span>
                                </h6>
                                <form id="addRecForm">
                                    <input type="hidden" id="recLocationId">
                                    <div class="row" style="margin: 0;">
                                        <div class="col-md-4" style="padding: 0 5px 0 0;">
                                            <label style="color: rgba(255,255,255,0.9); font-size: 12px; font-weight: 500; margin-bottom: 5px; display: block;">Chọn Xe</label>
                                            <select class="form-control" id="recMotorcycleId" required style="height: 42px; border-radius: 8px; border: 2px solid rgba(255,255,255,0.3); background: rgba(255,255,255,0.95); font-weight: 500;">
                                                <option value="">-- Chọn Xe --</option>
                                                <c:forEach var="motor" items="${allMotorcycles}">
                                                    <option value="${motor.motorcycleId}">${motor.model} (${motor.motorcycleId})</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-6" style="padding: 0 5px;">
                                            <label style="color: rgba(255,255,255,0.9); font-size: 12px; font-weight: 500; margin-bottom: 5px; display: block;">Lý Do Phù Hợp</label>
                                            <input type="text" class="form-control" id="recReason" placeholder="VD: Leo đèo khỏe, phù hợp đường núi, tiết kiệm xăng..." style="height: 42px; border-radius: 8px; border: 2px solid rgba(255,255,255,0.3); background: rgba(255,255,255,0.95);" maxlength="200">
                                        </div>
                                        <div class="col-md-2" style="padding: 0 0 0 5px;">
                                            <label style="color: transparent; font-size: 12px; margin-bottom: 5px; display: block;">.</label>
                                            <button type="submit" class="btn btn-success" style="height: 42px; width: 100%; border-radius: 8px; font-weight: 600; background: #10b981; border: none; box-shadow: 0 2px 6px rgba(16, 185, 129, 0.3); transition: all 0.2s;">
                                                <i class="fa fa-plus"></i> Thêm
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        
                        <!-- Danh sách xe đang được gợi ý -->
                        <div style="background: #fff; border-radius: 12px; padding: 1.5rem; box-shadow: 0 1px 3px rgba(0,0,0,0.08);">
                            <h5 style="font-weight: 700; margin: 0 0 1.25rem 0; color: #1e293b; font-size: 1.1rem; display: flex; align-items: center; gap: 8px;">
                                <i class="fa fa-list-ul" style="color: #f59e0b;"></i>
                                Danh Sách Xe Đang Được Gợi Ý
                            </h5>
                            <div class="table-responsive" style="border-radius: 8px; overflow: hidden; border: 1px solid #e5e7eb;">
                                <table class="table table-hover" id="recTable" style="margin: 0; background: #fff;">
                                    <thead style="background: linear-gradient(135deg, #f3f4f6 0%, #e5e7eb 100%);">
                                        <tr>
                                            <th style="width: 30%; padding: 14px 16px; font-weight: 600; color: #374151; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px; border: none;">
                                                <i class="fa fa-motorcycle" style="margin-right: 6px; color: #f59e0b;"></i>Mẫu Xe
                                            </th>
                                            <th style="width: 15%; padding: 14px 16px; font-weight: 600; color: #374151; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px; border: none; text-align: center;">
                                                <i class="fa fa-image" style="margin-right: 6px; color: #8b5cf6;"></i>Hình
                                            </th>
                                            <th style="width: 45%; padding: 14px 16px; font-weight: 600; color: #374151; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px; border: none;">
                                                <i class="fa fa-comment-dots" style="margin-right: 6px; color: #3b82f6;"></i>Lý Do Phù Hợp
                                            </th>
                                            <th style="width: 10%; padding: 14px 16px; font-weight: 600; color: #374151; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px; border: none; text-align: center;">
                                                <i class="fa fa-cog" style="margin-right: 6px; color: #64748b;"></i>Thao Tác
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="recTableBody" style="background: #fff;">
                                        <!-- Dữ liệu render bằng JS -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
                    tbody.append('<tr><td colspan="4" style="padding: 40px 20px; text-align: center; color: #9ca3af; background: #f9fafb;"><div style="display: inline-flex; flex-direction: column; align-items: center; gap: 10px;"><i class="fa fa-inbox" style="font-size: 3rem; color: #d1d5db;"></i><span style="font-weight: 500; font-size: 15px;">Chưa có xe phù hợp nào cho địa điểm này</span><small style="color: #9ca3af;">Hãy thêm xe để gợi ý cho khách hàng</small></div></td></tr>');
                } else {
                    recs.forEach(function(rec, index) {
                        var imgSrc = rec.image ? (rec.image.startsWith('http') ? rec.image : 'images/' + rec.image) : 'images/default.jpg';
                        var tr = $('<tr style="border-bottom: 1px solid #f3f4f6; transition: all 0.2s;"></tr>');
                        
                        // Cột Mẫu Xe
                        tr.append('<td style="padding: 16px; vertical-align: middle;"><div><strong style="color: #1e293b; font-size: 15px; display: block; margin-bottom: 4px;">' + rec.model + '</strong><small style="color: #64748b; font-size: 12px; background: #f1f5f9; padding: 2px 8px; border-radius: 4px; display: inline-block;">' + rec.motorcycleId + '</small></div></td>');
                        
                        // Cột Hình Ảnh
                        tr.append('<td style="padding: 16px; text-align: center; vertical-align: middle;"><img src="' + imgSrc + '" class="img-thumbnail" style="height: 70px; width: auto; max-width: 120px; object-fit: contain; border-radius: 8px; border: 2px solid #e5e7eb; padding: 4px; background: #fff;"></td>');
                        
                        // Cột Lý Do
                        var reasonHtml = rec.reason 
                            ? '<div style="display: flex; align-items: start; gap: 8px;"><i class="fa fa-quote-left" style="color: #cbd5e1; font-size: 12px; margin-top: 2px;"></i><span style="color: #475569; font-style: italic; line-height: 1.5;">' + rec.reason + '</span></div>' 
                            : '<span style="color: #cbd5e1; font-style: italic;">Không có mô tả</span>';
                        tr.append('<td style="padding: 16px; vertical-align: middle;">' + reasonHtml + '</td>');
                        
                        // Cột Thao Tác
                        tr.append('<td style="padding: 16px; text-align: center; vertical-align: middle;"><button class="btn btn-sm" onclick="deleteRec(' + locationId + ', \'' + rec.motorcycleId + '\')" title="Xóa xe này" style="background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%); color: #dc2626; border: 1px solid #fecaca; border-radius: 6px; padding: 6px 12px; font-weight: 500; transition: all 0.2s;"><i class="fa fa-trash"></i></button></td>');
                        
                        tbody.append(tr);
                    });
                    
                    // Hover effect
                    $('#recTableBody tr').hover(
                        function() { $(this).css('background-color', '#f8fafc'); },
                        function() { $(this).css('background-color', '#fff'); }
                    );
                }
                
                // Reset form
                $('#recMotorcycleId').val('');
                $('#recReason').val('');
                
                $('#recommendationModal').modal('show');
            }


            // Xử lý Thêm Gợi ý (Ajax)
            $('#addRecForm').submit(function(e) {
                e.preventDefault();
                var locId = $('#recLocationId').val();
                var motId = $('#recMotorcycleId').val();
                if (!motId) {
                    Swal.fire('Thiếu thông tin!', 'Vui lòng chọn xe.', 'warning');
                    return;
                }
                
                // Kiểm tra xe đã tồn tại chưa
                var recs = recommendData[locId] || [];
                var exists = recs.some(function(rec) {
                    return rec.motorcycleId === motId;
                });
                
                if (exists) {
                    Swal.fire('Xe đã tồn tại!', 'Xe này đã được thêm vào danh sách gợi ý.', 'warning');
                    return;
                }
                
                var reason = $('#recReason').val().trim();
                
                $.post('TourismLocationServletStaff', {
                    action: 'add',
                    locationId: locId,
                    motorcycleId: motId,
                    reason: reason,
                    priority: 1
                }, function(res) {
                    if (res.success) {
                        Swal.fire('Thành công!', 'Đã thêm xe phù hợp.', 'success').then(() => {
                            window.location.reload();
                        });
                    } else {
                        Swal.fire('Lỗi!', res.message || 'Không thể thêm xe này.', 'error');
                    }
                }).fail(function() {
                    Swal.fire('Lỗi!', 'Không thể kết nối đến máy chủ.', 'error');
                });
            });

            // Xử lý Xóa Gợi ý (Ajax)
            function deleteRec(locationId, motorcycleId) {
                Swal.fire({
                    title: 'Xóa xe khỏi danh sách?',
                    text: "Bạn chắc chắn muốn xóa xe này khỏi danh sách gợi ý?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#dc3545',
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: '<i class="fa fa-trash"></i> Xóa',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.post('TourismLocationServletStaff', {
                            action: 'delete',
                            locationId: locationId,
                            motorcycleId: motorcycleId
                        }, function(res) {
                            if (res.success) {
                                Swal.fire('Đã xóa!', 'Xe đã được xóa khỏi danh sách.', 'success').then(() => {
                                    window.location.reload();
                                });
                            } else {
                                Swal.fire('Lỗi!', 'Không thể xóa xe này.', 'error');
                            }
                        }).fail(function() {
                            Swal.fire('Lỗi!', 'Không thể kết nối đến máy chủ.', 'error');
                        });
                    }
                });
            }

            function editTouristLocation(locationId, locationName, locationImage, description, urlArticle, staffID) {
                document.getElementById('editLocationId').value = locationId;
                document.getElementById('editLocationName').value = locationName;
                document.getElementById('editDescription').value = description;
                document.getElementById('editUrlArticle').value = urlArticle;

                var imgContainer = document.getElementById('editLocationImagePreview');
                imgContainer.innerHTML = ''; // Xóa hình ảnh cũ (nếu có)
                console.log("thinh");
                // Hiển thị hình ảnh đối tượng
                if (locationImage) {
                    console.log("hihihi");
                    var img = document.createElement('img');
                    img.src = 'images/' + locationImage;
                    img.alt = 'Location Image';
                    img.className = 'img-thumbnail';
                    img.style.maxWidth = '150px';
                    img.style.maxHeight = '150px';
                    
                    var btn = document.createElement('button');
                    btn.innerHTML = '&times;';
                    btn.type = 'button';
                    btn.title = 'Remove Image';
                    btn.style.position = 'absolute';
                    btn.style.top = '0px';
                    btn.style.right = '-10px';
                    btn.style.background = '#dc2626';
                    btn.style.color = 'white';
                    btn.style.border = 'none';
                    btn.style.borderRadius = '50%';
                    btn.style.width = '24px';
                    btn.style.height = '24px';
                    btn.style.cursor = 'pointer';
                    btn.onclick = function() {
                        document.getElementById('editLocationImage').value = '';
                        imgContainer.innerHTML = '';
                    };
                    
                    imgContainer.style.position = 'relative';
                    imgContainer.style.display = 'inline-block';
                    imgContainer.appendChild(img);
                    imgContainer.appendChild(btn);
                } else {
                    imgContainer.innerHTML = '<span class="text-muted">No image available</span>';
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
