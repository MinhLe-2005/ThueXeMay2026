<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <link rel="stylesheet"
              href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

        <style>
    body, html { height: 100%; margin: 0; font-family: 'Poppins', sans-serif; background-color: #f8fafc; }
    .container-fluid { padding: 2rem; background: #f8fafc; }
    
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

    
    /* --- Custom Select & Text Truncate --- */
    .custom-select { appearance: none; -webkit-appearance: none; -moz-appearance: none; background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23475569"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 12px center; background-size: 16px; background-color: #fff; border: 1px solid #cbd5e1; border-radius: 20px; padding: 6px 36px 6px 16px; font-weight: 500; color: #475569; transition: all 0.2s; cursor: pointer; height: auto; }
    .custom-select:focus { outline: none; border-color: #d4af37; box-shadow: 0 0 0 3px rgba(212,175,55,0.1); }
    .dataTables_wrapper .dataTables_length select { margin: 0 10px; border: 1px solid #cbd5e1; border-radius: 20px; padding: 5px 30px 5px 15px; outline: none; background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23475569"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 8px center; background-size: 16px; appearance: none; -webkit-appearance: none; }
    
    .desc-text { display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; max-width: 160px; color: #6c757d; font-size: 13px; text-align: center; margin: 0 auto; }

    /* --- Filters --- */
    .filters-container { padding: 1rem 1.5rem; background: #f8fafc; border-bottom: 1px solid #e2e8f0; display: flex; justify-content: flex-end; gap: 10px; }
    .form-control { border-radius: 6px; border: 1px solid #cbd5e1; padding: 0.5rem 0.75rem; box-shadow: inset 0 1px 2px rgba(0,0,0,0.05); }
    .form-control:focus { border-color: #3b82f6; box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1); }
</style>
    </head>

    <body>
        <div class="container-fluid mt-4">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title"><i class="fa fa-star text-warning mr-2"></i> DANH SÁCH ĐÁNH GIÁ</h3>
                </div>
                <div class="filters-container">
                    
                                    <select class="form-control" style="width: 200px;" onchange="sortTable(this.value)">
                                        <option value="">Sắp xếp theo sao</option>
                                        <option value="asc">Tăng dần</option>
                                        <option value="desc">Giảm dần</option>
                                    </select>
                                    <select class="form-control" style="width: 200px; margin-left: 10px;" onchange="filterTable(this.value)">
                                        <option value="">Lọc theo sao</option>
                                        <option value="5">5 sao</option>
                                        <option value="4">4 sao</option>
                                        <option value="3">3 sao</option>
                                        <option value="2">2 sao</option>
                                        <option value="1">1 sao</option>
                                    </select>
                                
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle" id="feedbackTable">
                            <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Nội Dung</th>
                                            <th scope="col" style="padding: 6px 50px;">Đánh Giá</th>
                                            <th scope="col">Tên Khách Hàng</th>

                                        </tr>
                                    </thead>
                            <tbody id="table-body">
                                <c:forEach items="${listF}" var="f">
                                    
                                            <tr>
                                                <th scope="row">${f.feedbackID}</th>                                                                                           
                                                <td>${f.content}</td>
                                                <td>
                                                    <c:forEach begin="1" end="${f.serviceRate}" var="star">
                                                        <span style="color: #F7D000;" class="fa fa-star"></span>
                                                    </c:forEach>
                                                    <c:forEach begin="${f.serviceRate + 1}" end="5" var="emptyStar">
                                                        <span class="fa fa-star-o"></span>
                                                    </c:forEach>
                                                    <span class="hidden-rate" style="display: none;">${f.serviceRate}</span>
                                                </td>   

                                                <td>${f.customerName}</td>


                                            </tr>

                                        
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="text-right mt-3 text-muted" style="margin-right: 1.5rem; margin-bottom: 2rem;">
                <strong>Tổng cộng: <span id="total-feedbacks">${listF.size()}</span> feedbacks</strong>
            </div>
        </div>
    </div>
</div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <script type="text/javascript">
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

            function sortTable(order) {
                if (!order)
                    return;
                var table = document.getElementById("feedbackTable");
                var rows = Array.from(table.rows).slice(1); // Get all rows except the header

                rows.sort(function (a, b) {
                    var rateA = parseInt(a.querySelector('.hidden-rate').innerText);
                    var rateB = parseInt(b.querySelector('.hidden-rate').innerText);
                    return order === 'asc' ? rateA - rateB : rateB - rateA;
                });

                rows.forEach(function (row) {
                    table.appendChild(row); // Reattach rows in sorted order
                });
            }

            function filterTable(stars) {
            var table = document.getElementById("feedbackTable");
            var rows = Array.from(table.rows).slice(1);
            var visibleCount = 0;

            rows.forEach(function(row) {
                var rate = parseInt(row.querySelector('.hidden-rate').innerText);
                if (stars === "" || rate == stars) {
                    row.style.display = "";
                    visibleCount++;
                } else {
                    row.style.display = "none";
                }
            });

            document.getElementById("feedbackCount").innerText = "Tổng cộng: " + visibleCount + " feedbacks";
        }
        </script>


        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--         Bootstrap js 
                <script type="text/javascript" src="js/jquery.js"></script>
                <script type="text/javascript" src="js/popper.js"></script>
                 OWL Car 
                <script src="js/owl.carousel.min.js"></script>
                 Show More js 
                <script src="js/showMoreItems.min.js"></script>
                 Data TAble 
                <script
                src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
                 Bootstrap 
                <script type="text/javascript" src="js/bootstrap.min.js"></script>
                 Theme js 
                <script type="text/javascript" src="js/main.js"></script>-->
    </body>

</html>
