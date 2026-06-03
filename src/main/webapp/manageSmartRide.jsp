<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Dashboard - SmartRide</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
<!--        <link href="staffAssets/img/favicon.png" rel="icon">
        <link href="staffAssets/img/apple-touch-icon.png" rel="apple-touch-icon">-->
        

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="staffAssets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="staffAssets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="staffAssets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="staffAssets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="staffAssets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="staffAssets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="staffAssets/css/style.css" rel="stylesheet">
    </head>
    <body style="overflow: hidden;">
        <jsp:include page="/includes/staff/header-staff.jsp" />
        <jsp:include page="/includes/staff/sidebar.jsp" />
        
        <style>
            #iframeLoader {
                position: absolute;
                top: 60px;
                left: 0; 
                right: 0;
                bottom: 0;
                background: #f6f9ff;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                z-index: 999;
            }
            .spinner-border {
                width: 3rem;
                height: 3rem;
                color: #d4af37;
            }
            @media (max-width: 1199px) {
                #iframeLoader {
                    left: 0;
                }
            }
        </style>

        <main id="main" class="main" style="padding: 0; position: relative;">
            <div id="iframeLoader">
                <div class="spinner-border" role="status">
                    <span class="visually-hidden">Đang tải...</span>
                </div>
                <h5 class="mt-3 text-muted">Đang tải dữ liệu, vui lòng chờ...</h5>
            </div>
            <iframe id="contentIframe" src="${param.iframeSrc}" style="width: 100%; height: calc(100vh - 60px); border: none;" scrolling="yes" onload="document.getElementById('iframeLoader').style.display='none';"></iframe>
        </main>
        
        <!-- Vendor JS Files -->
        <script src="staffAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="staffAssets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="staffAssets/vendor/tinymce/tinymce.min.js"></script>
        <!-- Template Main JS File -->
        <script src="staffAssets/js/main.js"></script>
    </body>
</html>
