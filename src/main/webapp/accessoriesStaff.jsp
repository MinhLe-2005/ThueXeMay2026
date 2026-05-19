<%-- 
    Document   : accessoriesStaff
    Created on : Jun 14, 2024, 9:06:22 PM
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
        <link rel="website icon" type="png" href="images/logo.png">


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
                border-bottom: 2px solid #ddd;
                padding-left: 50px;
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
                width: 80%;
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

        <div class="container-fluid tab-container"  style="margin-left: 12%;">
            <!-- Danh sách tab ngang -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">Danh Sách Phụ Kiện</a>
                </li>
                <li role="presentation">
                    <a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">Thêm Mới Phụ Kiện</a>
                </li>
                <li role="presentation">
                    <a href="#Section3" aria-controls="profile" role="tab" data-toggle="tab">Chỉnh Sửa Phụ Kiện</a>
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

                                            <th scope="col">Tên Phụ Kiện</th>
                                            <th scope="col">Hình Ảnh</th>
                                            <th scope="col">Icon</th>
                                            <th scope="col">Thông Tin Mô Tả</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Hành Động</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table-body">
                                        <c:forEach var="accessoryLists" items="${accessoryList}">
                                            <tr>
                                                <td>${accessoryLists.accessoryId}</td>

                                                <td>${accessoryLists.accessoryName}</td>
                                                <td class="w-25">
                                                    <img src="${empty accessoryLists.accessoryImage ? 'images/default.jpg' : (accessoryLists.accessoryImage.startsWith('http') ? accessoryLists.accessoryImage : 'images/'.concat(accessoryLists.accessoryImage))}"
                                                         class="img-fluid img-thumbnail" alt="Sheep">
                                                </td>
                                                <td class="w-25">
                                                    <img src="${empty accessoryLists.accessoryImageicon ? 'images/default.jpg' : (accessoryLists.accessoryImageicon.startsWith('http') ? accessoryLists.accessoryImageicon : 'images/'.concat(accessoryLists.accessoryImageicon))}"
                                                         class="img-fluid img-thumbnail" alt="Sheep">
                                                </td>
                                                <td>${accessoryLists.accessoryDescription}
                                                </td>
                                                <td>${accessoryLists.price}</td>


                                                <td class="action-buttons">
                                                    <div class="buttons">
                                                        <button class="btn btn-primary btn-sm" onclick="editTouristLocation('${accessoryLists.accessoryId}', '${accessoryLists.accessoryName}', '${accessoryLists.accessoryImage}', '${accessoryLists.accessoryImageicon}', '${accessoryLists.accessoryDescription}', '${accessoryLists.price}')">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-danger btn-sm" onclick="confirmDelete('${accessoryLists.accessoryId}')">
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


                <div role="tabpanel" class="tab-pane fade" id="Section2" style="margin-left: 12%;">
                    <section>
                        <div class="container-fluid">
                            <form id="addLocationForm" action="AddAccessoryStaff" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="accessoryName">Tên Phụ Kiện:</label>
                                    <input type="text" class="form-control" id="accessoryName" name="accessoryName" required>
                                </div>
                                <div class="form-group">

                                    <label for="accessoryImage">Hình ảnh:</label>
                                    <input type="file" class="form-control" id="accessoryImage" name="accessoryImage" accept="image/*" required>
                                </div>
                                <div class="form-group">
                                    <label for="accessoryImageIcon">Icon:</label>
                                    <input type="file" class="form-control" id="accessoryImageIcon" name="accessoryImageIcon" accept="image/*" required>
                                </div>
                                <div class="form-group">
                                    <label for="accessoryDescription">Thông Tin Mô Tả:</label>
                                    <textarea class="form-control" id="accessoryDescription" name="accessoryDescription" rows="3" required style="resize: vertical;"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="price">Giá:</label>
                                    <input type="number" class="form-control" id="price" name="price" required min="0">
                                </div>

                                <div class="buttons">
                                    <button type="submit" class="btn btn-success">Thêm Mới Phụ Kiện</button>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>

                <div role="tabpanel" class="tab-pane fade" id="Section3" style="margin-left: 12%;">
                    <section>
                        <div class="container-fluid">
                            <form action="UpdateAccessoryStaff" id="editLocationForm" method="POST" enctype="multipart/form-data">
                                <input type="hidden" id="editAccessoryId" name="accessoryId" >

                                <div class="form-group">
                                    <label for="editAccessoryName">Tên Phụ Kiện:</label>
                                    <input type="text" class="form-control" id="editAccessoryName" name="accessoryName" required>
                                </div>
                                <div class="form-group" style="max-width: 500px;">

                                    <label for="editAccessoryImage">Hình ảnh:</label>
                                    <div id="editAccessoryImagePreview"></div>
                                    <input type="file" class="form-control" id="editAccessoryImage" name="accessoryImage" accept="image/*">
                                </div>
                                <div class="form-group" style="max-width: 400px;">  
                                    <label for="editAccessoryImageIcon">Biểu Tượng:</label>

                                    <div id="editAccessoryImageIconPreview"></div>
                                    <input type="file" class="form-control" id="editAccessoryImageIcon" name="accessoryImageIcon" accept="image/*">
                                </div>
                                <div class="form-group">

                                    <label for="editAccessoryDescription">Thông Tin Mô Tả:</label>
                                    <textarea class="form-control" id="editAccessoryDescription" name="accessoryDescription" rows="3" required style="resize: vertical;"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="editPrice">Giá:</label>
                                    <input type="number" class="form-control" id="editPrice" name="price" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Cập Nhập Chỉnh Sửa</button>
                            </form>
                        </div>
                    </section>
                </div>



            </div>
        </div>

        <script>
            function editTouristLocation(accessoryId, accessoryName, accessoryImage, accessoryImageicon, accessoryDescription, price) {
                document.getElementById('editAccessoryName').value = accessoryName;
                document.getElementById('editAccessoryDescription').value = accessoryDescription;
                document.getElementById('editPrice').value = price;
                document.getElementById('editAccessoryId').value = accessoryId;
                var imgContainer = document.getElementById('editAccessoryImagePreview');
                var imgContainer2 = document.getElementById('editAccessoryImageIconPreview');
console.log("1");
                // Clear previous images
                imgContainer.innerHTML = '';
                imgContainer2.innerHTML = '';

                // Display images if available
                if (accessoryImage) {
                    var img1 = document.createElement('img');
                    img1.src = accessoryImage;
                    img1.alt = 'Accessory Image';
                    img1.className = 'img-fluid img-thumbnail';
                    imgContainer.appendChild(img1);
                } else {
                    imgContainer.innerHTML = 'No image available';
                }
console.log("2");
                if (accessoryImageicon) {
                    var img2 = document.createElement('img');
                    img2.src = accessoryImageicon;
                    img2.alt = 'Accessory Image Icon';
                    img2.className = 'img-fluid img-thumbnail';
                    imgContainer2.appendChild(img2);
                } else {
                    imgContainer2.innerHTML = 'No image icon available';
                }
                console.log("assffafas");
                // Chuyển sang tab Section 3 (nếu cần thiết)
                $('a[href="#Section3"]').tab('show');
                document.
                console.log("assffafas");
            }
        </script>
<script type="text/javascript">
            function confirmDelete(accessoryId) {
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
                        window.location.href = 'DeleteAccessoriesStaff?accessoryId=' + accessoryId;
                    }
                })
            }
        </script>

        <script>
            document.getElementById('addLocationForm').addEventListener('submit', function (event) {
                var fileInputImage = document.getElementById('accessoryImage');
                var fileInputIcon = document.getElementById('accessoryImageIcon');
                var errorMessage = document.getElementById('error-message');
                var successMessage = document.getElementById('success-message');
                var isValid = true;

                // Validate Accessory Image
                var fileNameImage = fileInputImage.value;
                var idxDotImage = fileNameImage.lastIndexOf(".") + 1;
                var extFileImage = fileNameImage.substr(idxDotImage, fileNameImage.length).toLowerCase();
                if (extFileImage !== "jpg" && extFileImage !== "jpeg" && extFileImage !== "png" && extFileImage !== "gif") {
                    isValid = false;
                }

                // Validate Accessory Image Icon
                var fileNameIcon = fileInputIcon.value;
                var idxDotIcon = fileNameIcon.lastIndexOf(".") + 1;
                var extFileIcon = fileNameIcon.substr(idxDotIcon, fileNameIcon.length).toLowerCase();
                if (extFileIcon !== "jpg" && extFileIcon !== "jpeg" && extFileIcon !== "png" && extFileIcon !== "gif") {
                    isValid = false;
                }

                if (!isValid) {
                    event.preventDefault();
                    errorMessage.style.display = 'block';
                    successMessage.style.display = 'none';
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
                        url: 'AddAccessoryStaff',
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
                                window.location.href = 'accessoriesStaffServlet';
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
