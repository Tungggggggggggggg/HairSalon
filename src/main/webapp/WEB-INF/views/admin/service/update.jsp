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
                    <li class="breadcrumb-item"><a href="/admin/service">Dịch vụ</a></li>
                    <li class="breadcrumb-item active">Chỉnh sửa dịch vụ </li>
                </ol>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <form action="/admin/service/create" method="post" >
                                <div class="mb-3  col-12">
                                    <label class="form-label">ID:</label>
                                    <input type="email" class="form-control" path=""/>
                                </div>
                                <div class="mb-3  col-12">
                                    <label class="form-label">Tên dịch vụ:</label>
                                    <input type="text" class="form-control" path=""/>
                                </div>
                                <div class="mb-3 col-12 ">
                                    <label class="form-label">Mô tả:</label>
                                    <textarea  rows="5" class="form-control" path=""></textarea>
                                </div>
                                <div class="mb-3  col-12">
                                    <label class="form-label">Giá:</label>
                                    <input type="email" class="form-control" path=""/>
                                </div>
                                <div class="mb-3  col-12">
                                    <label class="form-label">Thời gian hoàn thành:</label>
                                    <input type="text" class="form-control" path=""/>
                                </div>
                                <%--                                <div class="mb-3 col-12">--%>
                                <%--                                    <label class="form-label">Ngày tạo:</label>--%>
                                <%--                                    <input type="text" class="form-control"  path=""/>--%>
                                <%--                                </div>--%>

                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                </div>
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