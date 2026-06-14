import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

bad_script = '''                    "language": {
                        "lengthMenu": "Hiển thị _MENU_ xe",
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
                    });
                        $('.dataTables_length select').addClass('form-control d-inline-block').css({'width': '80px', 'margin': '0 10px', 'border-radius': '6px', 'border': '1px solid #ced4da'});
                        $('.dataTables_wrapper').css('padding', '20px');
                    }
                });
            });'''

good_script = '''                    "language": {
                        "lengthMenu": "Hiển thị _MENU_ xe",
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
            });'''

content = content.replace(bad_script, good_script)

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
