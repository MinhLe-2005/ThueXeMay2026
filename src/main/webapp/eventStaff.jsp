<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tourist Location Management</title>
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
                    <h3 class="card-title"><i class="fa fa-calendar-alt text-primary mr-2"></i> DANH SÁCH SỰ KIỆN</h3>
                    <button class="btn btn-custom-add" data-toggle="modal" data-target="#addEventModal">
                        <i class="fa fa-plus-circle"></i> Thêm Sự Kiện
                    </button>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Tiêu Đề</th>
                                            <th scope="col">Ngày Tạo</th>
                                            <th scope="col">Ngày Bắt Đầu</th>
                                            <th scope="col">Ngày Kết Thúc</th>
                                            <th scope="col">Nội Dung</th>
                                            <th scope="col">Ảnh</th>
                                            <th scope="col">Giảm Giá</th>
                                            <th scope="col">Nhân Viên</th>
                                            <th scope="col">Hành Động</th>

                                        </tr>
                                    </thead>
                            <tbody>
                                        <c:forEach var="eventLists" items="${eventList}">
                                            <tr>
                                                <td>${eventLists.eventID}</td>

                                                <td style="max-width: 100px;">${eventLists.eventTitle}</td>
                                                <td>${eventLists.createdDate}</td>
                                                <td>${eventLists.startDate}</td>
                                                <td>${eventLists.endDate}</td>
                                                <td style="max-width: 250px;">${eventLists.content}</td>
                                                <td class="w-25" style="max-width: 150px;">
                                                    <img src="${empty eventLists.eventImage ? 'images/default.jpg' : (eventLists.eventImage.startsWith('http') ? eventLists.eventImage : 'images/'.concat(eventLists.eventImage))}"
                                                         class="img-fluid img-thumbnail" alt="Sheep">
                                                </td>
                                                <td>${eventLists.discount}<a style="color: black;">%</a></td>
                                                <td>${eventLists.staffID}</td>
                                                <td class="action-buttons">
                                                    <div class="buttons">
                                                        <button class="btn btn-edit" onclick="editEventForm('${eventLists.eventID}', '${eventLists.eventTitle}', '${eventLists.createdDate}', '${eventLists.startDate}', '${eventLists.endDate}', '${eventLists.content}', '${eventLists.eventImage}', '${eventLists.discount}', '${eventLists.staffID}')">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-delete" onclick="confirmDelete('${eventLists.eventID}')">
                                                            <i class="fa fa-trash"></i>
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
                
<!-- Add Event Modal -->
<div class="modal fade" id="addEventModal" tabindex="-1" role="dialog" aria-labelledby="addEventModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addEventModalLabel"><i class="fa fa-plus-circle text-primary"></i> Thêm Mới Sự Kiện</h4>
            </div>
            <form class="addnew-event-form" id="addLocationForm" action="AddNewEventStaff" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    
                                        <!-- Event Title -->
                                        <div class="form-group">
                                            <label for="eventTitle">Tiêu Đề Sự Kiện:</label>
                                            
                                                <input type="text" class="form-control" id="eventTitle" name="eventTitle" placeholder="Nhập tiêu đề sự kiện" required>
                                            
                                        </div>
                                        <!-- Created Date -->
                                        <!--                                        <div class="form-group">
                                                                                    <label for="createdDate" class="col-sm-2 col-form-label">Created Date</label>
                                                                                    
                                                                                        <input type="date" class="form-control" id="createdDate" name="createdDate" required>
                                                                                    
                                                                                </div>-->
                                        <!-- Start Date -->
                                        <div class="form-group">
                                            <label for="startDate">Ngày Bắt Đầu:</label>
                                            
                                                <input type="date" class="form-control" id="startDate" name="startDate" required>
                                            
                                        </div>
                                        <!-- End Date -->
                                        <div class="form-group">
                                            <label for="endDate">Ngày Kết Thúc:</label>
                                            
                                                <input type="date" class="form-control" id="endDate" name="endDate" required>
                                            
                                        </div>
                                        <!-- Content -->
                                        <div class="form-group">
                                            <label for="content">Nôi Dung:</label>
                                            
                                                <textarea class="form-control" id="content" name="content" rows="3" placeholder="Nhập nội dung sự kiện" required style="resize: vertical;"></textarea>
                                            
                                        </div>
                                        <!-- Event Image -->
                                        <div class="form-group">
                                            <label for="eventImage">Hình Ảnh Sự Kiện:</label>
                                            
                                                <div id="eventImagePreview" style="margin-bottom: 15px; border-radius: 8px; overflow: hidden; display: inline-block;"></div>
                                                <input type="file" class="form-control-file" id="eventImage" name="eventImage" accept="image/*" required>
                                            
                                        </div>
                                        <!-- Discount -->
                                        <div class="form-group">
                                            <label for="discount">Giảm Giá</label>
                                            
                                                <input type="number" class="form-control" id="discount" name="discount" placeholder="Nhập phần trăm giảm giá" step="0.01" oninput="validateDiscount(this)" required>
                                            
                                        </div>
                                        <!-- Staff ID -->
                                        <div class="form-group">
                                            <label for="staffID">Lựa Chọn Nhân Viên:</label>
                                            <select class="form-control custom-select" id="staffID" name="staffID" required>
                                                <!--<option value="">Select Staff</option>-->
                                                <c:forEach var="staff" items="${staffList}" varStatus="loop">
                                                    <option value="${staff.staffID}">${staff.staffID}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="buttons">
                                            
                                        </div>
                                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Thêm Sự Kiện</button>
                </div>
            </form>
        </div>
    </div>
</div>

                            </div>
                        </div>
                    </section>
                </div>

                
<!-- Edit Event Modal -->
<div class="modal fade" id="editEventModal" tabindex="-1" role="dialog" aria-labelledby="editEventModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="editEventModalLabel"><i class="fa fa-edit text-info"></i> Chỉnh Sửa Sự Kiện</h4>
            </div>
            <form class="edit-event-form" id="editEventForm" action="UpdateEventStaff" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    
                                        <div class="form-group">
                                            <label for="editEventID">ID:</label>
                                            <input type="text" class="form-control" id="editEventID" name="editEventID" readonly>
                                            <!-- 'readonly' attribute is added assuming this field is not editable during update -->
                                        </div>

                                        <div class="form-group">
                                            <label for="editEventTitle">Tiêu Đề Sự Kiện</label>
                                            <input type="text" class="form-control" id="editEventTitle" name="editEventTitle" placeholder="Nhập tiêu đề sự kiện">
                                        </div>
                                        <div class="form-group">
                                            <label for="editCreatedDate">Ngày Tạo:</label>
                                            <input type="date" class="form-control" id="editCreatedDate" name="editCreatedDate" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="editStartDate">Ngày Bắt Đầu:</label>
                                            <input type="date" class="form-control" id="editStartDate" name="editStartDate">
                                        </div>
                                        <div class="form-group">
                                            <label for="editEndDate">Ngày Kết Thúc:</label>
                                            <input type="date" class="form-control" id="editEndDate" name="editEndDate">
                                        </div>
                                        <div class="form-group">
                                            <label for="editContent">Nội Dung</label>
                                            <textarea class="form-control" id="editContent" name="editContent" rows="3" placeholder="Nhập nội dung sự kiện" style="resize: vertical;"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="editEventImage">Hình Ảnh Sự Kiện:</label>
                                            <div id="editEventImagePreview"></div>
                                            <input type="file" class="form-control-file" id="editEventImage" name="editEventImage" accept="image/*">
                                        </div>
                                        <div class="form-group">
                                            <label for="editDiscount">Phần trăm giảm giá (%):</label>
                                            <input type="number" class="form-control" id="editDiscount" name="editDiscount" placeholder="Nhập phần trăm giảm giá" step="0.01" oninput="validateDiscount(this)">
                                        </div>
                                        <div class="form-group">
                                            <label for="editStaffID">Lựa Chọn Nhân Viên:</label>
                                            <select class="form-control custom-select" id="editStaffID" name="editStaffID">
                                                <!-- Options will be dynamically populated using JSTL -->
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
                    </section>
                </div>



        <script>

            function convertToInputDateFormat(dateString) {
                // Tách chuỗi thành các phần ngày, tháng, năm
                const [day, month, year] = dateString.split('-');
                // Sắp xếp lại theo định dạng yyyy-MM-dd
                return {
                    day, month, year
                };
            }

            function editEventForm(eventID, eventTitle, createdDate, startDate, endDate, content, eventImage, discount, staffID) {
                const formattedCreatedDate = convertToInputDateFormat(createdDate);
                const formattedStartDate = convertToInputDateFormat(startDate);
                const formattedEndDate = convertToInputDateFormat(endDate);
                document.getElementById('editEventID').value = eventID;
                document.getElementById('editEventTitle').value = eventTitle;
                document.getElementById('editCreatedDate').value = formattedCreatedDate.year + "-" + formattedCreatedDate.month + "-" + formattedCreatedDate.day;
                document.getElementById('editStartDate').value = formattedStartDate.year + "-" + formattedStartDate.month + "-" + formattedStartDate.day;
                document.getElementById('editEndDate').value = formattedEndDate.year + "-" + formattedEndDate.month + "-" + formattedEndDate.day;
                document.getElementById('editContent').value = content;
                document.getElementById('editDiscount').value = discount;
                document.getElementById('editStaffID').value = staffID;

                var imgContainer = document.getElementById('editEventImagePreview');
                imgContainer.innerHTML = ''; // Xóa hình ảnh cũ (nếu có)
                console.log("thinh");
                // Hiển thị hình ảnh đối tượng
                if (eventImage) {
                    console.log("hihihi");
                    var img = document.createElement('img');
                    img.src = eventImage;
                    img.alt = 'Location Image';
                    img.className = 'img-fluid img-thumbnail';
                    imgContainer.appendChild(img);
                } else {
                    imgContainer.innerHTML = 'No image available';
                }

                // Chuyển sang tab Section 3 (nếu cần thiết)
                $('#editEventModal').modal('show');
            }

        </script>


        <!--        <script>
                    $(document).ready(function () {
                        $('#editEventForm').submit(function (event) {
                            event.preventDefault(); // Ngăn chặn hành động mặc định của form
        
                            var formData = new FormData(this); // Lấy dữ liệu từ form
        
                            $.ajax({
                                type: 'POST',
                                url: $(this).attr('action'),
                                data: formData,
                                processData: false,
                                contentType: false,
                                success: function (response) {
                                    // Xử lý kết quả thành công
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Event updated successfully!',
                                        showConfirmButton: false,
                                        timer: 1500
                                    }).then(function () {
                                        // Cập nhật hoặc chuyển hướng sau khi cập nhật thành công
                                        window.location.reload(); // Ví dụ: tải lại trang để cập nhật dữ liệu mới
                                    });
                                },
                                error: function (xhr, status, error) {
                                    // Xử lý lỗi khi cập nhật sự kiện
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Error updating event!',
                                        text: 'Please try again later.',
                                        confirmButtonText: 'OK'
                                    });
                                    console.error(xhr.responseText);
                                }
                            });
                        });
                    });
                </script>-->


        <script>
            function validateDiscount(input) {
                if (input.value < 0) {
                    input.value = 0;
                }
            }
        </script>
        <script type="text/javascript">
            function confirmDelete(eventID) {
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
                        window.location.href = 'DeleteEvent?eventID=' + eventID;
                    }
                })
            }
        </script>
        <script>
            document.getElementById('addLocationForm').addEventListener('submit', function (event) {
                var fileInput = document.getElementById('eventImage');
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
                                text: 'Event added successfully!',
                                timer: 2000, // Tự động đóng sau 2 giây
                                showConfirmButton: false
                            }).then(function () {
                                // Chuyển hướng về trang TourismLocationServletStaff sau khi thêm thành công
                                window.location.href = 'eventStaffServlet';
                            });
                        },
                        error: function (xhr, status, error) {
                            // Hiển thị thông báo lỗi bằng SweetAlert
                            Swal.fire({
                                icon: 'error',
                                title: 'Error!',
                                text: 'Error adding event. Please try again.',
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/imagePreview.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                if (typeof setupLivePreview === 'function') {
                    setupLivePreview('eventImage', 'eventImagePreview');
                    setupLivePreview('editEventImage', 'editEventImagePreview');
                }
            });
        </script>
    </body>
</html>
