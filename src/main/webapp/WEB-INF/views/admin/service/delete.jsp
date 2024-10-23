<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
                    <li class="breadcrumb-item"><a href="/admin/service">Dịch vụ</a></li>
                    <li class="breadcrumb-item active">Xóa dịch vụ ngày --->  </li>
                </ol>

                <div >
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h2>Xóa dịch vụ</h2>
                                <h2>${id}</h2>
                            </div>
                            <hr>
                            <div class="alert alert-danger" role="alert">
                                Bạn có chắc chắn xóa dịch vụ này không ?
                            </div>
                            <form action="/admin/service" method="post" modelAttribute="newUser">
                                <div class="mb-3"  >
                                    <label class="form-label">Tên dịch vụ:</label>
                                    <input type="text" class="form-control" path="id"/>
                                </div>
                                <div class="mb-3"  >
                                    <label class="form-label">Mô tả:</label>
                                    <textarea cols="30" rows="5" class="form-control" path="id"></textarea>
                                </div>

                                <button class="btn btn-danger">Xác nhận</button>
                            </form>

                        </div>
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