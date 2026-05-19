<%-- 
    Document   : faqsManagement
    Created on : May 25, 2024, 5:45:19 PM
    Author     : DiepTCNN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">

        <link rel="website icon" type="png" href="images/logo.png">

        <title>FAQs Manage</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- modal -->
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
        <!-- MDB CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.css" rel="stylesheet">
        <!-- end modal -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.min.css" rel="stylesheet">

        <style type="text/css">
            body {
                font-family: 'Tahoma', sans-serif;
                overflow-x: hidden; /* Hide horizontal scrollbar */
                background: #F5F5FF;
            }
            .faq-item {
                padding: 20px; /* Khoảng cách giữa nội dung và viền */
            }

            .faq-question{
                font-size: large;
                font-weight: bold;
                color: #1089FF;
            }

            .faq-answer{
                display: block;
            }

            .tag-item {
                background-color: #28a745; /* Màu nền cho các tag */
                color: #fff; /* Màu chữ cho các tag */
                padding: 5px 10px; /* Khoảng cách giữa nội dung và viền */
                border-radius: 4px; /* Đường viền cong */
                margin-right: 5px; /* Khoảng cách giữa các tag */
            }


            .faq-containers {
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 15px;
                margin-bottom: 20px;
                background-color: #f9f9f9;
                overflow: hidden; /* Đảm bảo các phần tử con không tràn ra khỏi container */
            }

            .faq-content {
                width: calc(100% - 120px); /* Chiều rộng của phần content, trừ đi kích thước của phần actions */
                float: left; /* Dịch chuyển phần content sang trái */
            }

            .faq-actions {
                width: 120px; /* Kích thước của phần actions */
                float: right; /* Dịch chuyển phần actions sang phải */
                text-align: right; /* Căn chỉnh nút sang phải */
            }

            .faq-actions button {
                margin-top: 10px;
            }


            .faq-actions button {
                margin-right: 5px;
            }
            /* Breadcrumb */
            .breadcrumb {
                background-color: #f8f9fa;
                padding: 8px 15px;
                border-radius: 4px;
                animation: fadeInUp 0.5s ease;
            }

            /* Button */
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                animation: pulse 1s infinite;
            }

            /* Modal */
            .modal-content {
                border-radius: 8px;
                animation: zoomIn 0.5s ease;
            }

            /* Form */
            .form-group {
                margin-bottom: 20px;
                animation: slideInUp 0.5s ease;
            }

            /* FAQ Item */
            .faq-item {
                margin-top: 20px;
                animation: fadeIn 1s ease;
            }

            /* Optional: Customize scrollbar */
            ::-webkit-scrollbar {
                width: 8px;
            }

            ::-webkit-scrollbar-thumb {
                background-color: #007bff;
                border-radius: 4px;
            }

            ::-webkit-scrollbar-track {
                background-color: #f8f9fa;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes slideInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }


            /* Đảm bảo modal hiển thị giữa màn hình */
            .modal-dialog {
                margin-top: 10%; /* Điều chỉnh vị trí của modal so với top */
            }

            /* Tùy chỉnh màu nền và đường viền của modal */
            .modal-content {
                border: none;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* Hiệu ứng bóng đổ */
            }

            /* Tùy chỉnh header của modal */
            .modal-header {
                background: linear-gradient(to right, #1089FF 0%, #1089FF 28%, #01D28E 91%, #01D28E 100%);
                color: #fff; /* Màu chữ */
                border-radius: 10px 10px 0 0; /* Đường viền cong */
            }

            /* Tùy chỉnh tiêu đề của modal */
            .modal-title {
                font-weight: bold;
            }



            /* Tùy chỉnh body của modal */
            .modal-body {
                padding: 20px;
            }

            /* Tùy chỉnh các input và textarea trong form */
            .form-control {
                border-radius: 5px;
            }

            /* Tùy chỉnh nút submit */
            .btn-primary {
                background: linear-gradient(to right, #1089FF 0%, #1089FF 28%, #01D28E 91%, #01D28E 100%);
                border-color: white; /* Màu viền */
                border-radius: 5px;

            }

            .btn-primary:hover {
                background-color: #0056b3; /* Màu nền khi di chuột qua */
                border-color: #0056b3; /* Màu viền khi di chuột qua */
            }

            /* Đổi màu cho nút Edit */
            .edit-btn {
                background-color: #1089FF; /* Màu xanh dương */
                border-color: #007bff; /* Màu viền */
                color: #fff; /* Màu chữ */
            }

            /* Đổi màu cho nút Delete */
            .delete-btn {
                background-color: #01D28E; /* Màu xanh lá */
                border-color: #28a745; /* Màu viền */
                color: #fff; /* Màu chữ */
            }

            #backtoTopBtn {
                display: none; /* Ẩn nút ban đầu */
                position: fixed; /* Nút ở vị trí cố định trên màn hình */
                bottom: 20px; /* Khoảng cách từ dưới cùng */
                right: 30px; /* Khoảng cách từ bên phải */
                z-index: 99; /* Đảm bảo nút nằm trên các phần tử khác */
                border: none; /* Không viền */
                outline: none; /* Không viền khi nhấp */
                background: linear-gradient(to right, #1089FF 0%, #1089FF 28%, #01D28E 91%, #01D28E 100%);
                color: white; /* Màu chữ */
                cursor: pointer; /* Con trỏ chuyển thành tay khi di chuột */
                padding: 15px; /* Khoảng đệm bên trong nút */
                border-radius: 10px; /* Bo góc nút */
            }

            #backtoTopBtn:hover {
                background: linear-gradient(to right, #01D28E 0%, #01D28E 28%, #1089FF 91%, #1089FF 100%);
            }

        </style>
    </head>

    <body>
        <div class="row">
            <jsp:include page="/includes/staff/header-staff.jsp" />
            <div class="col-md-2">

                <jsp:include page="/includes/staff/sidebar.jsp" /> 
            </div>

            <div style="margin-top: 6rem" class="col-md-10">
                <div class="container col-md-8">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="wrapper wrapper-content animated fadeInRight">

                                <div class="ibox-content m-b-sm border-bottom">
                                    <div class="text-center p-lg">
                                        <h2>Quản lý Câu hỏi thường gặp của công ty ColorBike</h2>
                                        <span>Nếu bạn muốn thêm một câu hỏi, bấm vào đây </span>

                                        <button type="button" class="btn btn-primary" id="launchModalBtn" data-mdb-toggle="modal"
                                                data-mdb-target="#staticBackdrop1">
                                            <i class="fa fa-plus"></i>
                                            <span class="bold">Thêm FAQs</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="faq-item">
                                    <c:forEach var="faq" items="${faqs}">
                                        <div class="row faq-containers">
                                            <div class="col-md-10">
                                                <p data-toggle="collapse" class="faq-question">${faq.question}</p>
                                                <p class="faq-answer">${faq.answer}</p>
                                                <small>Added by <strong>Staff</strong> <i class="fa fa-clock-o"></i> Today 2:40 pm - 24.06.2014</small>
                                            </div>

                                            <div class="faq-actions col-md-2 text-right">
                                                <button type="button" class="btn btn-info btn-sm edit-btn" title="Edit"
                                                        data-toggle="modal" data-target="#editFAQModal"
                                                        onclick="populateEditForm('${faq.questionID}', '${faq.question}', '${faq.answer}')">
                                                    <i class="fa-solid fa-pen-to-square" style="color: white;"></i>
                                                </button>


                                                <!-- Nút Delete -->
                                                <button type="button" class="btn btn-danger btn-sm delete-btn" title="Delete" 
                                                        onclick="confirmDelete('${faq.questionID}')">
                                                    <i class="fa-solid fa-trash-can" style="color: white;"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                    <div class="modal-dialog d-flex justify-content-center">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Thêm Mới FAQs</h5>
                            </div>
                            <div class="modal-body">
                                <!-- Form để nhập câu hỏi mới -->
                                <form id="addQuestionForm" action="faqs" method="post">
                                    <div class="form-group">
                                        <label for="question">Câu Hỏi:</label>
                                        <input type="text" class="form-control" id="question" name="question" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="answer">Trả Lời:</label>
                                        <textarea class="form-control" id="answer" name="answer" rows="3" required></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Thêm</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Modal Form Cập Nhật FAQ -->
                <div class="modal fade" id="editFAQModal" tabindex="-1" role="dialog" aria-labelledby="editFAQModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form id="updateFAQForm" action="UpdateFAQsServletStaff" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editFAQModalLabel">Chỉnh sửa FAQs</h5>
                                    <!--                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>-->
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="questionID" id="editQuestionID" />
                                    <div class="form-group">
                                        <label for="editQuestion">Câu Hỏi:</label>
                                        <input type="text" class="form-control" id="editQuestion" name="question" required />
                                    </div>
                                    <div class="form-group">
                                        <label for="editAnswer">Trả Lời:</label>
                                        <textarea class="form-control" id="editAnswer" name="answer" rows="4" required></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                                    <button type="submit" class="btn btn-primary">Cập Nhập Chỉnh Sửa</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>



            </div>
        </div>
        <button id="backtoTopBtn" onclick="topFunction()" title="Go to top">
            <i class="fa fa-arrow-up"></i>
        </button>

        <script type="text/javascript">
            // Populate the edit form with the existing data
            function populateEditForm(questionID, question, answer) {
                document.getElementById('editQuestionID').value = questionID;
                document.getElementById('editQuestion').value = question;
                document.getElementById('editAnswer').value = answer;
                // Hiển thị modal khi dữ liệu được điền vào form
                $('#editFAQModal').modal('show'); // Sử dụng jQuery để hiển thị modal
            }
        </script>


        <script>
            let mybutton = document.getElementById("backtoTopBtn");
            // Khi người dùng cuộn xuống 20px từ đầu tài liệu, hiển thị nút
            window.onscroll = function () {
                scrollFunction();
            };
            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }

            // Khi người dùng nhấp vào nút, cuộn về đầu trang
            function topFunction() {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            }



        </script>

        <script type="text/javascript">
            function confirmDelete(questionID) {
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
                        window.location.href = 'deleteFAQs?questionID=' + questionID;
                    }
                })
            }
        </script>


        <!-- SweetAlert CSS -->
        <!-- SweetAlert JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.all.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Modal -->
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
        <!--<script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>-->
        <!-- MDB JS -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
    </body>

</html>
