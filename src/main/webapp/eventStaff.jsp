<%-- 
    Document   :eventStaff
    Created on : Jun 13, 2024, 7:58:19 AM
    Author     : ADMIN
--%>
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
            body, html {
                height: 100%;
                margin: 0;
                font-family: 'Tahoma', sans-serif;
            }

            .tab-container {
                display: flex;
                flex-direction: column;
                height: 100vh;
                margin-top: 60px;
            }

            .tab-content {

                flex: 1;
                padding: 20px;
                overflow-y: auto;
                margin-left: 35px;
            }

            .tab-content h3 {
                color: #1e97bf;
                font-size: 20px;
                font-weight: 700;
                text-transform: uppercase;
                margin-bottom: 7px;
            }

            .nav-tabs {
                display: flex;
                margin-left: 3%;
                padding-left: 50px; /* Xóa padding bên trái */
                border-bottom: 2px solid #ddd;
            }

            .nav-tabs li {
                margin-right: 10px;
            }

            .nav-tabs li a {
                color: #222;
                background: transparent;
                font-size: 17px;
                font-weight: 800;
                letter-spacing: 1px;
                text-transform: uppercase;
                padding: 12px 15px;
                border: none;
                border-radius: 4px;
                transition: all 0.3s ease;
            }

            .nav-tabs li a:hover,
            .nav-tabs li.active a {
                color: #1e97bf;
                background: rgba(30, 151, 191, 0.1);
                border-block-end: solid;
            }

            @media only screen and (max-width: 767px) {
                .nav-tabs {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .nav-tabs li {
                    margin-bottom: 10px;
                }

                .tab-content {
                    padding: 10px;

                }
            }

            .container-fluid {
                padding: 2rem 0;

            }

            .tableview {
                width: 95%;
                margin: 0 auto;
            }

            .table-image {
                border-collapse: separate;
                border-spacing: 0 15px;
            }

            .table-image td, .table-image th {
                vertical-align: middle;
                background: #fff;
                border: none;
                padding: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .table thead th {
                background-color: #6E9DC5;
                color: #fff;
                text-align: center;
            }

            .table tbody tr:hover {
                background-color: #f1f1f1;
            }

            .action-buttons .btn {
                margin: 0 5px;
                transition: all 0.3s ease;
            }

            .action-buttons .btn:hover {
                transform: scale(1.1);
            }

            .action-buttons .btn:focus {
                outline: none;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            td input.form-control {
                animation: fadeIn 0.5s;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            .buttons {
                display: flex;
                justify-content: center;
            }

            .addnew, .editlocation {
                margin-left: 15%;
            }

            .alert {
                margin-top: 10px;
                display: none;
            }
            #content {
                resize: vertical; /* Chỉ cho phép kéo dọc */
                overflow-y: auto; /* Bật thanh cuộn dọc nếu cần */
                overflow-x: hidden; /* Ẩn thanh cuộn ngang */
            }
            #editEventImagePreview img {
                max-width: 25%; /* Đặt kích thước tối đa cho hình ảnh là 50% */
                height: auto; /* Chiều cao tự điều chỉnh để giữ nguyên tỷ lệ */
                display: block; /* Đảm bảo hình ảnh hiển thị theo chiều ngang */
                margin-top: 10px; /* Khoảng cách phía trên hình ảnh */
            }
        </style>
    </head>

    <body>
        <div class="col-md-2">

        </div>
        <div class="container-fluid tab-container">
            <!-- Danh sách tab ngang -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">Sự Kiện</a>
                </li>
                <li role="presentation">
                    <a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">Thêm Sự Kiện</a>
                </li>
                <li role="presentation">
                    <a href="#Section3" aria-controls="profile" role="tab" data-toggle="tab">Chỉnh Sửa Sự Kiện</a>
                </li>
            </ul>
            <!-- Nội dung tab -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                    <div class="container-fluid">
                        <div class="row tableview">
                            <div class="col-12">
                                <table class="table table-image">
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
                                    <tbody id="table-body">
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
                                                        <button class="btn btn-primary btn-sm" onclick="editEventForm('${eventLists.eventID}', '${eventLists.eventTitle}', '${eventLists.createdDate}', '${eventLists.startDate}', '${eventLists.endDate}', '${eventLists.content}', '${eventLists.eventImage}', '${eventLists.discount}', '${eventLists.staffID}')">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-danger btn-sm" onclick="confirmDelete('${eventLists.eventID}')">
                                                            <i class="fas fa-trash"></i>
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
                <div role="tabpanel" class="tab-pane fade" id="Section2">
                    <section>
                        <div class="container-fluid">
                            <div class="row tableview">
                                <div class="col-12">
                                    <h3 class="mb-4">Thêm Sự Kiện</h3>
                                    <form class="addnew-event-form" id="addLocationForm" action="AddNewEventStaff" method="post" enctype="multipart/form-data">
                                        <!-- Event Title -->
                                        <div class="form-group row">
                                            <label for="eventTitle" class="col-sm-2 col-form-label">Tiêu Đề Sự Kiện:</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="eventTitle" name="eventTitle" placeholder="Nhập tiêu đề sự kiện" required>
                                            </div>
                                        </div>
                                        <!-- Created Date -->
                                        <!--                                        <div class="form-group row">
                                                                                    <label for="createdDate" class="col-sm-2 col-form-label">Created Date</label>
                                                                                    <div class="col-sm-10">
                                                                                        <input type="date" class="form-control" id="createdDate" name="createdDate" required>
                                                                                    </div>
                                                                                </div>-->
                                        <!-- Start Date -->
                                        <div class="form-group row">
                                            <label for="startDate" class="col-sm-2 col-form-label">Ngày Bắt Đầu:</label>
                                            <div class="col-sm-10">
                                                <input type="date" class="form-control" id="startDate" name="startDate" required>
                                            </div>
                                        </div>
                                        <!-- End Date -->
                                        <div class="form-group row">
                                            <label for="endDate" class="col-sm-2 col-form-label">Ngày Kết Thúc:</label>
                                            <div class="col-sm-10">
                                                <input type="date" class="form-control" id="endDate" name="endDate" required>
                                            </div>
                                        </div>
                                        <!-- Content -->
                                        <div class="form-group row">
                                            <label for="content" class="col-sm-2 col-form-label">Nôi Dung:</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" id="content" name="content" rows="3" placeholder="Nhập nội dung sự kiện" required style="resize: vertical;"></textarea>
                                            </div>
                                        </div>
                                        <!-- Event Image -->
                                        <div class="form-group row">
                                            <label for="eventImage" class="col-sm-2 col-form-label">Hình Ảnh Sự Kiện:</label>
                                            <div class="col-sm-10">
                                                <input type="file" class="form-control-file" id="eventImage" name="eventImage" accept="image/*" required>
                                            </div>
                                        </div>
                                        <!-- Discount -->
                                        <div class="form-group row">
                                            <label for="discount" class="col-sm-2 col-form-label">Giảm Giá</label>
                                            <div class="col-sm-10">
                                                <input type="number" class="form-control" id="discount" name="discount" placeholder="Nhập phần trăm giảm giá" step="0.01" oninput="validateDiscount(this)" required>
                                            </div>
                                        </div>
                                        <!-- Staff ID -->
                                        <div class="form-group">
                                            <label for="staffID">Lựa Chọn Nhân Viên:</label>
                                            <select class="form-control" id="staffID" name="staffID" required>
                                                <!--<option value="">Select Staff</option>-->
                                                <c:forEach var="staff" items="${staffList}" varStatus="loop">
                                                    <option value="${staff.staffID}">${staff.staffID}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="buttons">
                                            <button type="submit" class="btn btn-primary">Thêm Mới Sự Kiện</button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <div role="tabpanel" class="tab-pane fade" id="Section3">
                    <section>
                        <div class="container-fluid">
                            <div class="row tableview">
                                <div class="col-12">
                                    <h3 class="mb-4">Chỉnh Sửa Sự Kiện</h3>
                                    <form class="edit-event-form" id="editEventForm" action="UpdateEventStaff" method="post" enctype="multipart/form-data">
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
                                            <select class="form-control" id="editStaffID" name="editStaffID">
                                                <!-- Options will be dynamically populated using JSTL -->
                                                <c:forEach var="staff" items="${staffList}" varStatus="loop">
                                                    <option value="${staff.staffID}">${staff.staffID}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Cập Nhập Chỉnh Sửa</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </section>
                </div>



            </div>
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
                $('a[href="#Section3"]').tab('show');
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>

</html>
