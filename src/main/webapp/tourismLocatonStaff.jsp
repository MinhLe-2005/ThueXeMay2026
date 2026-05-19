<%-- 
    Document   : touristLocationStaff
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
        <title>Quản lý các địa điểm du lịch</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <style>
            body, html {
                height: 100%;
                margin: 0;
                font-family: 'Tahoma', sans-serif;            }

            .tab-container {
                display: flex;
                flex-direction: column;
                height: 100vh;
                margin-top: 60px;
            }

            .tab-content {
                flex: 1;
                padding: 20px;
                background-color: #E0E0E0;
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
                padding-left: 50px;
                margin-left: 3%;
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

        </style>
    </head>

    <body>
        <div class="col-md-2">

        </div>
        <div class="container-fluid tab-container col-md-10">
            <!-- Danh sách tab ngang -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">Danh Sách Địa Điểm DU Lịch</a>
                </li>
                <li role="presentation">
                    <a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">Thêm Mới Địa Điểm Du Lịch</a>
                </li>
                <li role="presentation">
                    <a href="#Section3" aria-controls="update" role="tab" data-toggle="tab">Chỉnh Sửa Địa Điểm Du Lịch</a>
                </li>
            </ul>
            <!-- Nội dung tab -->
            <div class="tab-content">
                <!-- Section 1: Display All Tourist Locations -->
                <div role="tabpanel" class="tab-pane fade in active " id="Section1">
                    <div class="container-fluid">
                        <div class="row tableview">
                            <div class="col-12">
                                <table class="table table-image displayTour">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Ảnh</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Mô Tả</th>
                                            <th scope="col">Đường Dẫn Bài Viết</th>
                                            <th scope="col">Nhân Viên</th>
                                            <th scope="col">Hành Động</th>

                                        </tr>
                                    </thead>
                                    <tbody id="table-body">
                                        <c:forEach var="touristLocations" items="${touristLocation}">
                                            <tr>
                                                <td>${touristLocations.locationId}</td>
                                                <td class="w-25">
                                                    <img src="${empty touristLocations.locationImage ? 'images/default.jpg' : (touristLocations.locationImage.startsWith('http') ? touristLocations.locationImage : 'images/'.concat(touristLocations.locationImage))}" class="img-fluid img-thumbnail" alt="Location Image">
                                                </td>
                                                <td>${touristLocations.locationName}</td>
                                                <td>${touristLocations.description}</td>
                                                <td>${touristLocations.urlArticle}</td>
                                                <td>${touristLocations.staffID}</td>
                                                <td class="action-buttons">
                                                    <div class="buttons">
                                                        <button class="btn btn-primary btn-sm" onclick="editTouristLocation('${touristLocations.locationId}', '${touristLocations.locationName}', '${touristLocations.locationImage}', '${touristLocations.description}', '${touristLocations.urlArticle}', '${touristLocations.staffID}')">
                                                            <i class="fas fa-edit"></i>
                                                        </button>

                                                        <button class="btn btn-danger btn-sm" title="Delete" onclick="confirmDelete('${touristLocations.locationId}')">
                                                            <i class="fa-solid fas fa-trash" style="color: white;"></i>
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
                <!-- Section 2: Add New Tourist Location -->
                <div role="tabpanel" class="tab-pane fade" id="Section2">
                    <section>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="addnew">
                                                <form class="addnew-location-form" id="addLocationForm" action="AddTouristLocationServletStaff" method="post" enctype="multipart/form-data">
                                                    <div class="form-group">
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
                                                        <select class="form-control" id="staffID" name="staffID" required>
                                                            <!--<option value="">Select Staff</option>-->
                                                            <c:forEach var="staff" items="${staffList}" varStatus="loop">
                                                                <option value="${staff.staffID}">${staff.staffID}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Thêm Mới</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <!-- Nội dung của Section 3 -->
                <div role="tabpanel" class="tab-pane fade" id="Section3">
                    <section>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="editlocation">
                                                <form class="edit-location-form" id="editLocationForm" action="UpdateTourismLoctionServletStaff" method="post" enctype="multipart/form-data">
                                                    <div class="form-group">
                                                        <label for="editLocationImage">ID:</label>
                                                        <input type="text" id="editLocationId" name="locationId" readonly>
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
                                                        <select class="form-control" id="editStaffID" name="staffID">
                                                            <!-- Options sẽ được tạo bằng cách sử dụng forEach hoặc theo dạng tĩnh -->
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
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <script>
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

                // Chuyển sang tab Section 3 (nếu cần thiết)
                $('a[href="#Section3"]').tab('show');
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
    </body>

</html>
