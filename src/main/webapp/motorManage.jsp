<%-- 
    Document   : motorManage
    Created on : Jun 13, 2024, 7:58:19 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vertical Tabs with Right Navigation</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap"
            rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- OWL Car -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <!-- Showmore css -->
        <link rel="stylesheet" href="css/showMoreItems-theme.min.css">
        <!-- Data Table -->
        <link rel="stylesheet"
              href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <!-- Bootstrap CSS -->
        <!--<link rel="stylesheet" href="css/bootstrap.min.css">-->
        <!-- Theme CSS -->
        <!--<link rel="stylesheet" href="css/style.css">-->
        <link rel="stylesheet"
              href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <style>
            body,
            html {
                height: 100%;
                margin: 0;
                font-family: 'Montserrat', sans-serif;
            }

            .tab-container {
                display: flex;
                flex-direction: column;
                height: 100vh;
            }

            /* Nội dung tab */
            .tab-content {
                flex: 1;
                padding: 20px;
                overflow-y: auto;
                /*background: rgba(30, 151, 191, 0.1);*/
            }

            .tab-content h3 {
                color: #1e97bf;
                font-size: 20px;
                font-weight: 700;
                text-transform: uppercase;
                margin: 0 0 7px;
            }

            /* Danh sách tab ngang */
            .nav-tabs {
                display: flex;
                margin-top: 0; /* Xóa khoảng trống phía trên */
                padding-left: 0; /* Xóa padding bên trái */
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
                text-align: center;
                text-transform: uppercase;
                padding: 12px 15px;
                margin: 0;
                border: none;
                border-radius: 4px;
                transition: all 0.3s ease;
            }

            .nav-tabs li a:hover,
            .nav-tabs li.active a {
                color: #1e97bf;
                background: rgba(30, 151, 191, 0.1);
                border-block-end: solid; 
writing-mode: horizontal-tb;
            }

            /* Thiết kế phản hồi cho màn hình nhỏ */
            @media only screen and (max-width: 767px) {
                .nav-tabs {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .nav-tabs li {
                    margin-right: 0;
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

            .table-image td,
            .table-image th {
                vertical-align: middle;
                background: #fff;
                border: none;
                padding: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .table thead th {
                border: none;
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

            .container-fluid {
                background: #E1EDF2;
            }

            .addnew,
            .editmotor {
                margin-left: 15%;
            }
            .alert {
                margin-top: 10px; /* Khoảng cách từng thông báo */
                display: none; /* Ẩn thông báo mặc định */
            }

        </style>
    </head>

    <body>

         <jsp:include page="/includes/staff/header-staff.jsp" />
        <jsp:include page="/includes/staff/sidebar.jsp" />
        <div class="container-fluid tab-container">
            <!-- Danh sách tab ngang -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#Section1"
                                                          aria-controls="home" role="tab"
                                                          data-toggle="tab">Danh Sách Xe Máy</a></li>
                <li role="presentation"><a href="#Section2"
                                           aria-controls="profile" role="tab"
                                           data-toggle="tab">Thêm Mới Xe Máy</a></li>
            </ul>
            <!-- Nội dung tab -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                    <!-- Nội dung phần tab Display All Motorbikes -->
                    <div class="container-fluid">
                        <div class="row tableview">
                            <div class="col-12">
                                <table class="table table-image">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Model</th>
                                            <th scope="col">Displacement</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Min Age</th>
                                            <th scope="col">Brand</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table-body">
                                        <tr>
                                            <th scope="row">1</th>
                                            <td class="w-25">
                                                <img src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg"
                                                     class="img-fluid img-thumbnail" alt="Sheep">
                                            </td>
                                            <td>Bootstrap 4 CDN and Starter Template</td>
                                            <td>913</td>
                                            <td>Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                                Aliquam, reprehenderit blanditiis similique aspernatur quasi nam recusandae.
                                                Necessitatibus id corporis sit quidem minus quibusdam ipsum, non ullam! Facilis
                                                quibusdam in delectus!
                                            </td>
                                            <td>10</td>
                                            <td>Bootstrap</td>
                                            <td>Tutorial</td>
                                            <td>$99</td>
                                            <td class="action-buttons">
                                                <div class="buttons">
                                                    <button class="btn btn-primary btn-sm" onclick="editRow(this)">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button class="btn btn-danger btn-sm" onclick="deleteRow(this)">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td class="w-25">
                                                <img src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-5.jpg"
                                                     class="img-fluid img-thumbnail" alt="Sheep">
                                            </td>
                                            <td>Bootstrap Grid 4 Tutorial and Examples</td>
                                            <td>1.434</td>
                                            <td>3.417</td>
                                            <td>8</td>
                                            <td>Bootstrap</td>
                                            <td>Guide</td>
                                            <td>$49</td>
                                            <td class="action-buttons">
                                                <div class="buttons">
                                                    <button class="btn btn-primary btn-sm" onclick="editRow(this)">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button class="btn btn-danger btn-sm" onclick="deleteRow(this)">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Section2">
                    <!-- Nội dung phần tab Add New Motorbike -->
                    <section>
                        <div class="container-fluid">
                            <div class="row ">
                                <div class="col-lg-10 col-md-8 ml-auto">
                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                        <div class="col-md-12">
                                            <div class="addnew">
                                                <form class="addnew-motorbike-form">
                                                    <h3>Add New Motorbike</h3>
                                                    <div class="form-group">
                                                        <input type="file" class="form-control-file" id="motorbikeImage">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Enter model">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="number" class="form-control"
                                                               placeholder="Enter displacement">
                                                    </div>
                                                    <div class="form-group">
                                                        <textarea class="form-control" rows="3"
                                                                  placeholder="Enter description"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="number" class="form-control" placeholder="Enter min age">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Enter brand">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Enter category">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="number" class="form-control" placeholder="Enter price">
                                                    </div>
                                                    <button type="submit" class="btn btn-dark">Thêm xe máy</button>
                                                    <div class="feedback mt-3">
                                                        <div id="success-message" class="alert alert-success" style="display: none;">
                                                            Motorbike added successfully!
                                                        </div>
                                                        <div id="error-message" class="alert alert-danger" style="display: none;">
                                                            File Format Not Supported
                                                        </div>

                                                    </div>
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
                                                        function editRow(button) {
                                                        // Lấy hàng chứa nút 'edit' được nhấn
                                                        var  row  =  button.closest('tr');
                                                                // Lấy dữ liệu từ hàng được chọn
                                                                var  id  =  row.cells[0].textContent.trim();
                                                                var  imageSrc  =  row.cells[1].querySelector('img').src;
                                                                var  model  =  row.cells[2].textContent.trim();
                                                                var  displacement  =  row.cells[3].textContent.trim();
                                                                var  description  =  row.cells[4].textContent.trim();
                                                                var  minAge  =  row.cells[5].textContent.trim();
                                                                var  brand  =  row.cells[6].textContent.trim();
                                                                var      category      =      row.cells[7].textContent.trim();
                                                                var      price      =      row.cells[8].textContent.trim();
                                                                // Tạo tab "Update Motorbike" nếu chưa tồn tại
                                                                if      (!document.querySelector('#update-tab')) {
                                                        var      updateTab      =      document.createElement('li');
                                                                updateTab.setAttribute('role',      'presentation');
                                                                updateTab.id      =      'update-tab';
                                                                updateTab.innerHTML      =      '<a href="#Section3" aria-controls="update" role="tab" data-toggle="tab">Update Motorbike</a>';
                                                                // Thêm tab "Update Motorbike" vào danh sách tab
                                                                var      tabsList      =      document.querySelector('.nav-tabs');
                                                                tabsList.appendChild(updateTab);
                                                                // Thêm nội dung cho tab "Update Motorbike"
                                                                var      tabContent      =      document.querySelector('.tab-content');
                                                                var      updateContent      =      document.createElement('div');
                                                                updateContent.id      =      'Section3';
                                                                updateContent.classList.add('tab-pane',      'fade');
                                                                updateContent.setAttribute('role',      'tabpanel');
                                                                updateContent.innerHTML      =      `
            <section class="update-motorbike-section">
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10 col-md-8 ml-auto">
                                                    <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                                    <div class="col-md-12">
                                                        <div class="editmotor">
                                                    <form class="update-motorbike-form">
                                            <h3>Update Motorbike</h3>
                                        <div class="form-group">
                                            <label for="productname">Model:</label>
                                            <input type="text" class="form-control" id="productname" placeholder="Enter model">
                                                </div>
                                                <div class="form-group">
                                                     <label for="productid">ID:</label>
                                            <input type="text" class="form-control" id="productid" placeholder="Enter ID" readonly>
                                            </div>
                                            <div class="form-group">
                                            <label for="productprice">Price:</label>
                                            <input type="number" class="form-control" id="productprice" placeholder="Enter price">
                                            </div>
                                                <div class="form-group">
                                                    <label for="productimage">Current Image:</label>
                                                    <img id="productimage" src="${imageSrc}" alt="Motorbike Image" class="img-fluid img-thumbnail">
                                            </div>
                                            <div class="form-group">
                                            <label for="productimageupload">Upload New Image:</label>
                                            <input type="file" class="form-control-file" id="productimageupload" accept="image/*">
                                                    </div>
                                                    <!-- Các trường khác nếu có -->
                                                        <div class="form-group">
                                                <label for="displacement">Displacement:</label>
                                                <input type="number" class="form-control" id="displacement" placeholder="Enter displacement">
                                            </div>
                                            <div class="form-group">
                                                <label for="description">Description:</label>
                                                <textarea class="form-control" id="description" rows="3" placeholder="Enter description"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="minage">Min Age:</label>
                                                <input type="number" class="form-control" id="minage" placeholder="Enter min age">
                                            </div>
                                            <div class="form-group">
                                                <label for="brand">Brand:</label>
                                                <input type="text" class="form-control" id="brand" placeholder="Enter brand">
                                            </div>
                                            <div class="form-group">
                                                <label for="category">Category:</label>
                                                <input type="text" class="form-control" id="category" placeholder="Enter category">
                                            </div>
                                            <button type="submit" class="btn btn-dark">Update Motorbike</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        `;
        tabContent.appendChild(updateContent);
    }

    // Chuyển sang tab "Update Motorbike"
    document.querySelector('#update-tab a').click();

    // Điền thông tin vào form "Update Motorbike"
    document.querySelector('#productname').value = model;
    document.querySelector('#productid').value = id;
    document.querySelector('#productprice').value = price;

    // Điền các trường bổ sung nếu có
    document.querySelector('#displacement').value = displacement;
    document.querySelector('#description').value = description;
    document.querySelector('#minage').value = minAge;
    document.querySelector('#brand').value = brand;
    document.querySelector('#category').value = category;

    // Đặt hình ảnh
    document.querySelector('#productimage').src = imageSrc;

    // Xử lý sự kiện upload ảnh
    document.querySelector('#productimageupload').addEventListener('change', function (event) {
        var file = event.target.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.querySelector('#productimage').src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });
}

// Hàm xóa tab "Update Motorbike" khi không cần thiết
function removeUpdateTab() {
    var updateTab = document.querySelector('#update-tab');
    if (updateTab) {
        updateTab.remove();
    }
}

// Lắng nghe sự kiện khi DOM đã tải xong
document.addEventListener('DOMContentLoaded', (event) => {
    // Lấy tất cả các tab trừ tab "Update Motorbike"
    var tabs = document.querySelectorAll('.nav-tabs li:not(#update-tab) a');

    // Thêm sự kiện cho các tab
    tabs.forEach(tab => {
        tab.addEventListener('click', (e) => {
            removeUpdateTab();
        });
    });
});

// Hàm xử lý khi click vào nút 'Thêm xe máy'
function addMotorbike(event) {
    event.preventDefault(); // Ngăn chặn việc gửi form mặc định
    var form = document.querySelector('form'); // Chọn form thêm xe máy
    var formData = new FormData(form); // Tạo FormData từ form
    var productImage = document.querySelector('#productimageupload').files[0]; // Lấy tệp ảnh từ input

    // Kiểm tra định dạng ảnh (chỉ cho phép ảnh)
    if (!productImage.type.startsWith('image/')) {
        document.querySelector('#error-message').style.display = 'block'; // Hiển thị thông báo lỗi
        return; // Dừng lại nếu định dạng không phải là ảnh
    }

    // Ẩn thông báo lỗi nếu có
    document.querySelector('#error-message').style.display = 'none';

    // Gửi yêu cầu thêm xe máy
    fetch('add_motorbike_url', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (response.ok) {
            document.querySelector('#success-message').style.display = 'block'; // Hiển thị thông báo thành công
            form.reset(); // Xóa nội dung form sau khi thêm thành công
        } else {
            throw new Error('Failed to add motorbike'); // Ném lỗi nếu không thêm thành công
        }
    })
    .catch(error => {
        console.error('Error:', error); // Log lỗi ra console nếu có lỗi xảy ra
    });
}


        </script>

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Bootstrap js -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/popper.js"></script>
        <!-- OWL Car -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- Show More js -->
        <script src="js/showMoreItems.min.js"></script>
        <!-- Data TAble -->
        <script
        src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <!-- Bootstrap -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- Theme js -->
        <script type="text/javascript" src="js/main.js"></script>
    </body>

</html>

