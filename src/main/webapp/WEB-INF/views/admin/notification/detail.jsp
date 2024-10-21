<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="../../../../resources/admin/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Trang chính</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Trang chính</a></li>
                    <li class="breadcrumb-item"><a href="/admin/notification">Thông báo</a></li>
                    <li class="breadcrumb-item active">Chi tiết thông báo : </li>
                </ol>

                <div >
                    <div class="card" style="width: 60%;">
                        <div class="card-header">
                            Notification Information
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">ID : </li>
                            <li class="list-group-item">Tiêu đề : </li>
                            <li class="list-group-item">Nội dung:</li>
                            <li class="list-group-item">Ngày tạo: </li>
                        </ul>
                        <a href="/admin/notification" class="btn btn-success">Back</a>
                    </div>
                </div>

            </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
<script src="../../../../resources/admin/js/datatables-simple-demo.js"></script>
<script src="../../../../resources/admin/js/scripts.js"></script>
</body>

</html>
