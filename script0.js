
            $(document).ready(function() {
                // Ép buộc các tab hoạt động (khắc phục lỗi xung đột Bootstrap 3 vs 4)
                $('.nav-tabs a').on('click', function (e) {
                    e.preventDefault();
                    $(this).tab('show');
                    // Buộc hiển thị thẻ div tương ứng để chống lỗi tàng hình
                    $('.tab-pane').hide();
                    $($(this).attr('href')).show();
                });

                // Khởi tạo DataTables
                $('#motorTable').DataTable({
                    "pageLength": 10,
                    "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "Tất cả"]],
                    "language": {
                        "lengthMenu": "Hiển thị _MENU_ xe mỗi trang",
                        "zeroRecords": "Không tìm thấy xe nào",
                        "info": "Trang _PAGE_ / _PAGES_",
                        "infoEmpty": "Không có dữ liệu",
                        "infoFiltered": "(lọc từ _MAX_ xe)",
                        "search": "Tìm kiếm:",
                        "paginate": {
                            "first": "Đầu",
                            "last": "Cuối",
                            "next": "Sau",
                            "previous": "Trước"
                        }
                    },
                    "initComplete": function(settings, json) {
                        $('.dataTables_length select').addClass('form-control d-inline-block').css({'width': '80px', 'margin': '0 10px', 'border-radius': '6px', 'border': '1px solid #ced4da'});
                        $('.dataTables_wrapper').css('padding', '20px');
                    }
                });
            });
        