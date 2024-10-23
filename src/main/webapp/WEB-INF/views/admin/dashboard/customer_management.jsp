<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Quản lý khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="../../../../resources/admin/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Quản lý khách hàng</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Quản lý khách hàng</li>
                    </ol>

                    <!-- Nút thêm khách hàng mới -->
                    <div class="mb-3">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#customerModal" onclick="openModal('new')">
                            <i class="fas fa-user-plus"></i> Thêm mới khách hàng
                        </button>
                    </div>

                    <!-- Bảng danh sách khách hàng -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Danh sách khách hàng
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên khách hàng</th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dữ liệu mẫu -->
                                    <tr>
                                        <td>1</td>
                                        <td>Khách hàng 1</td>
                                        <td>khachhang1@gmail.com</td>
                                        <td>0123456789</td>
                                        <td>
                                            <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#customerModal"
                                                onclick="openModal('edit', 1, 'Khách hàng 1', 'khachhang1@gmail.com', '0123456789', 'Active')">
                                                <i class="fas fa-edit"></i> Sửa
                                            </button>
                                            <a href="/admin/customer/delete/1" class="btn btn-sm btn-danger" 
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa?')">
                                                <i class="fas fa-trash-alt"></i> Xóa
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Khách hàng 2</td>
                                        <td>khachhang2@gmail.com</td>
                                        <td>0123456789</td>
                                        <td>
                                            <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#customerModal"
                                                onclick="openModal('edit', 2, 'Khách hàng 2', 'khachhang2@gmail.com', '0123456789', 'Inactive')">
                                                <i class="fas fa-edit"></i> Sửa
                                            </button>
                                            <a href="/admin/customer/delete/2" class="btn btn-sm btn-danger" 
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa?')">
                                                <i class="fas fa-trash-alt"></i> Xóa
                                            </a>
                                        </td>
                                    </tr>
                                    <!-- Thêm dữ liệu mẫu khác... -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>

            <!-- Modal thêm/sửa khách hàng -->
            <div class="modal fade" id="customerModal" tabindex="-1" aria-labelledby="customerModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="customerModalLabel">Thêm mới khách hàng</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                        </div>
                        <div class="modal-body">
                            <form id="customerForm" action="/admin/customer/save" method="post">
                                <input type="hidden" id="customerId" name="id">
                                <div class="mb-3">
                                    <label for="customerName" class="form-label">Tên khách hàng</label>
                                    <input type="text" class="form-control" id="customerName" name="name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="customerEmail" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="customerEmail" name="email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="customerPhone" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="customerPhone" name="phone" required>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
    <script src="../../../../resources/admin/js/customer_management.js"></script>
</body>
</html>
