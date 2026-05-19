<%-- 
    Document   : manageMotorcycle
    Created on : Jul 2, 2024, 7:28:01 PM
    Author     : Administrator
--%>

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
        <link rel="website icon" type="png" href="images/logo.png">

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
    <body>
        <jsp:include page="/includes/staff/header-staff.jsp" />
        <jsp:include page="/includes/staff/sidebar.jsp" />
        <iframe src="${param.iframeSrc}" style="width: 100%; height: 750px; " scrolling="no"></iframe>
        

    </body>
</html>
