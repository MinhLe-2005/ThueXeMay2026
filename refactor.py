import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace head and start of body
head_pattern = re.compile(r'<!DOCTYPE html>.*?<body>.*?(?=<ul class="m-auto nav nav-tabs")', re.DOTALL)

new_head = '''<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Quản lý xe máy - SmartRide</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/newlogo_transparent.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Vendor CSS Files -->
        <link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/simple-datatables/style.css" rel="stylesheet">
        <!-- Template Main CSS File -->
        <link href="staffAssets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .custom-card { border-radius: 12px; border: none; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
            /* Hide the old tabs since we use niceadmin tabs now */
            .table-image img { width: 100px; height: auto; max-height: 70px; object-fit: contain; border-radius: 4px; }
            .btn-gold { background: #b59349; color: #ffffff; border: none; border-radius: 6px; padding: 6px 12px; font-weight: 600; font-size: 12px; }
            .btn-gold:hover { background: #9a7b3c; color: #ffffff; }
            .btn-dark-custom { background: #2b3445; color: #ffffff; border: none; border-radius: 6px; padding: 6px 12px; }
            .btn-danger-custom { background: #ef4444; color: #ffffff; border: none; border-radius: 6px; padding: 6px 12px; }
        </style>
    </head>
    <body>
        <jsp:include page="/includes/staff/header-staff.jsp" />
        <jsp:include page="/includes/staff/sidebar.jsp" />
        
        <main id="main" class="main">
            <div class="pagetitle mb-4">
                <h1>Quản lý xe máy</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="homeStaff" target="_top">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Quản lý xe máy</li>
                    </ol>
                </nav>
            </div>
            
            <section class="section">
                <div class="card border-0 shadow-sm custom-card">
                    <div class="card-body p-4 pb-0">
                        <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active fw-bold" data-bs-toggle="tab" href="#Section1">THÔNG TIN XE MÁY</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link fw-bold" data-bs-toggle="tab" href="#Section2">THÊM MẪU XE MỚI</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link fw-bold" data-bs-toggle="tab" href="#Section3">THÊM XE MÁY MỚI</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link fw-bold" data-bs-toggle="tab" href="#Section4">CẬP NHẬT XE MÁY</a>
                            </li>
                        </ul>
                        <div class="tab-content mt-3">
'''
content = head_pattern.sub(new_head, content)

# Remove old UL
ul_pattern = re.compile(r'<ul class="m-auto nav nav-tabs".*?</ul>.*?<div class="tab-content">', re.DOTALL)
content = ul_pattern.sub('', content)

# Update tab panes
content = content.replace('tab-pane fade in active', 'tab-pane fade show active')
content = content.replace('tab-pane active', 'tab-pane fade show active')
content = content.replace('data-toggle="modal"', 'data-bs-toggle="modal"')

# Update JS bottom
js_pattern = re.compile(r'<!-- Tải thư viện JS theo đúng thứ tự.*?</main>\s*</body>', re.DOTALL)
if not js_pattern.search(content):
    js_pattern = re.compile(r'<!-- Tải thư viện JS theo đúng thứ tự.*?</body>', re.DOTALL)

new_js = '''
        <!-- Vendor JS Files -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="staffAssets/vendor/simple-datatables/simple-datatables.js"></script>
        <!-- Template Main JS File -->
        <script src="staffAssets/js/main.js"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function() {
                $('#motorTable').DataTable({
                    "pageLength": 10,
                    "language": {
                        "lengthMenu": "Hiển thị _MENU_ xe mỗi trang",
                        "zeroRecords": "Không tìm thấy xe nào",
                        "info": "Trang _PAGE_ / _PAGES_",
                        "infoEmpty": "Không có dữ liệu",
                        "search": "Tìm kiếm:"
                    }
                });
            });
        </script>
        </main>
        <jsp:include page="/includes/staff/footer.jsp" />
    </body>
'''
content = js_pattern.sub(new_js, content)

# Add closing tags for card BEFORE the scripts
idx = content.rfind('<script type="text/javascript">')
if idx != -1:
    content = content[:idx] + '</div></div></section>\n' + content[idx:]

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)

print("Refactored successfully")
