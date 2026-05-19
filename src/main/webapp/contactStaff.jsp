<%-- 
    Document   : contactStaff
    Created on : Jun 14, 2024, 9:11:22 PM
    Author     : ADMIN
--%>



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
            font-family: 'Poppins', sans-serif;
        }

        .tab-container {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .tab-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
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
    <div class="col-md-2">
        <jsp:include page="/includes/staff/sidebar.jsp" />
    </div>
    <div class="container-fluid tab-container">
        <!-- Danh sách tab ngang -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">Display All Contact</a>
            </li>
<!--            <li role="presentation">
                <a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">Add New Contact</a>
            </li>-->
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
                                        <th scope="col">ContactID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">PhoneNumber</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Title</th>
                                        <th scope="col">Message</th>
                                        <th scope="col">AccountID</th>
                                        <!--<th scope="col">Actions</th>-->
                                    </tr>
                                </thead>
                                <tbody id="table-body">
                                    <tr>
                                            <th scope="row">1</th>
                                            <td>123</td>
                                            <td>Bootstrap 4 CDN and Starter Template</td>
                                            <td>123</td>
                                            <td>123</td>
                                            <td>Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                                Aliquam, reprehenderit blanditiis similique aspernatur quasi nam recusandae.
                                                Necessitatibus id corporis sit quidem minus quibusdam ipsum, non ullam! Facilis
                                                quibusdam in delectus!
                                            </td>
                                            <td>123</td>
<!--                                            <td class="action-buttons">
                                                <div class="buttons">
                                                    <button class="btn btn-primary btn-sm" onclick="editRow(this)">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button class="btn btn-danger btn-sm" onclick="deleteRow(this)">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </td>-->
                                        </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="Section2">
                <section>
                    <div class="container-fluid">
                        <div class="row ">
                            <div class="col-lg-10 col-md-8 ml-auto">
                                <div class="row align-items-center pt-md-5 mt-md-5 mb-5">
                                    <div class="col-md-12">
                                        <div class="addnew">
                                            <form class="addnew-location-form" onsubmit="addLocation(event)">
                                                <h3>Add New Tourist Location</h3>
                                                <div class="form-group">
                                                    <input type="file" class="form-control-file" id="locationImage" accept="image/*">
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Enter location name" required>
                                                </div>
                                                <div class="form-group">
                                                    <textarea class="form-control" rows="3" placeholder="Enter description" required></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Enter URL article" required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Enter staff ID" required>
                                                </div>
                                                <button type="submit" class="btn btn-dark">Add Location</button>
                                                <div class="feedback mt-3">
                                                    <div id="success-message" class="alert alert-success">
                                                        Location added successfully!
                                                    </div>
                                                    <div id="error-message" class="alert alert-danger">
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
            var row = button.closest('tr');
            var id = row.cells[0].textContent.trim();
            var imageSrc = row.cells[1].querySelector('img').src;
            var name = row.cells[2].textContent.trim();
            var description = row.cells[3].textContent.trim();
            var urlArticle = row.cells[4].textContent.trim();
            var staffId = row.cells[5].textContent.trim();
            
            // Switch cells to editable inputs
            row.cells[1].innerHTML = `<input type="file" class="form-control-file" accept="image/*">`;
            row.cells[2].innerHTML = `<input type="text" value="${name}" class="form-control">`;
            row.cells[3].innerHTML = `<textarea class="form-control">${description}</textarea>`;
            row.cells[4].innerHTML = `<input type="text" value="${urlArticle}" class="form-control">`;
            row.cells[5].innerHTML = `<input type="text" value="${staffId}" class="form-control">`;
            
            // Update action buttons
            button.outerHTML = `<button class="btn btn-success" onclick="saveRow(this)">Save</button>`;
        }

        function saveRow(button) {
            var row = button.closest('tr');
            var imageFile = row.cells[1].querySelector('input').files[0];
            var name = row.cells[2].querySelector('input').value;
            var description = row.cells[3].querySelector('textarea').value;
            var urlArticle = row.cells[4].querySelector('input').value;
            var staffId = row.cells[5].querySelector('input').value;
            
            // Convert image file to base64 (this is for display purposes only, adjust as needed for actual saving)
            var reader = new FileReader();
            reader.onloadend = function () {
                row.cells[1].innerHTML = `<img src="${reader.result}" alt="Location Image" style="width: 100px;">`;
            };
            if (imageFile) {
                reader.readAsDataURL(imageFile);
            } else {
                row.cells[1].innerHTML = `<img src="${row.cells[1].querySelector('img').src}" alt="Location Image" style="width: 100px;">`;
            }
            row.cells[2].textContent = name;
            row.cells[3].textContent = description;
            row.cells[4].textContent = urlArticle;
            row.cells[5].textContent = staffId;
            
            // Update action buttons
            button.outerHTML = `<button class="btn btn-primary" onclick="editRow(this)">Edit</button>`;
        }

        function deleteRow(button) {
            var row = button.closest('tr');
            row.remove();
        }

        function addLocation(event) {
            event.preventDefault();

            var tableBody = document.getElementById('table-body');
            var newRow = document.createElement('tr');
            var imageInput = document.getElementById('locationImage');
            var image = URL.createObjectURL(imageInput.files[0]);
            
            var cells = [
                tableBody.rows.length + 1,
                `<img src="${image}" alt="Location Image" style="width: 100px;">`,
                event.target[1].value,
                event.target[2].value,
                event.target[3].value,
                event.target[4].value,
                `<div class="action-buttons">
                    <button class="btn btn-primary" onclick="editRow(this)">Edit</button>
                    <button class="btn btn-danger" onclick="deleteRow(this)">Delete</button>
                </div>`
            ];

            cells.forEach(cell => {
                var td = document.createElement('td');
                td.innerHTML = cell;
                newRow.appendChild(td);
            });

            tableBody.appendChild(newRow);
            document.querySelector('.addnew-location-form').reset();
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
