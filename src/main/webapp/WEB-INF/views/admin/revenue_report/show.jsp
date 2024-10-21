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
                    <li class="breadcrumb-item active">Báo cáo doanh thu</li>
                </ol>

                <div class="card mb-4">
                    <div class="card-header">
                        <div class="mb-3">
                            <a href="" class="btn btn-success btn-custom-green"><i class="fas fa-plus"></i> Tạo mới</a>
                            <a href="" class="btn btn-warning btn-custom-yellow"><i class="fas fa-file-upload"></i> Tải từ file</a>
                            <a href="" class="btn btn-primary"><i class="fas fa-print"></i> In dữ liệu</a>
                            <a href="" class="btn btn-primary"><i class="fas fa-copy"></i> Sao chép</a>
                            <a href="" class="btn btn-success"><i class="fas fa-file-excel"></i> Xuất Excel</a>
                            <a href="" class="btn btn-danger btn-custom-red"><i class="fas fa-file-pdf"></i> Xuất PDF</a>
                            <a href="" class="btn btn-secondary"><i class="fas fa-trash-alt"></i> Xóa tất cả</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tiêu đề</th>
                                <th>Nội dung</th>
                                <th>Ngày tạo</th>
                                <th>Menu Action</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>ID</th>
                                <th>Tiêu đề</th>
                                <th>Nội dung</th>
                                <th>Ngày tạo</th>
                                <th>Menu Action</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <tr>
                                <td>123</td>
                                <td>Chỉnh sửa nhân viên</td>
                                <td> chỉnh sửa số này sinh của nhân viên ABC</td>
                                <td>20/11/2024 - 12-22-12</td>
                                <td>
                                    <a type="button" class="btn btn-secondary" href="">cập nhật</a>
                                    <a type="button" class="btn btn-secondary" href="">xóa</a>
                                </td>
                            </tr>




                            </tbody>
                        </table>
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
