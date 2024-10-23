<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Quản lý nhân viên</title>
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
                    <h1 class="mt-4">Quản lý nhân viên</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Quản lý nhân viên</li>
                    </ol>

                    <!-- Nút thêm nhân viên mới -->
                    <div class="mb-3">
                        <button class="btn btn-primary" onclick="openStaffModal('new')">
                            <i class="fas fa-user-plus"></i> Thêm mới nhân viên
                        </button>
                    </div>

                    <!-- Bảng danh sách nhân viên -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Danh sách nhân viên
                        </div>
                        <div class="card-body">
                            <table id="staffTable" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên nhân viên</th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dữ liệu mẫu -->
                                    <tr>
                                        <td>1</td>
                                        <td>Nhân viên 1</td>
                                        <td>khoa.tran@gmail.com</td>
                                        <td>0901234567</td>
                                        <td>
                                            <button class="btn btn-sm btn-warning" onclick="openStaffModal('edit', 1, 'Nhân viên 1', 'nhanvien1@gmail.com', '0901234567')">
                                                <i class="fas fa-edit"></i> Sửa
                                            </button>
                                            <a href="/admin/staff/delete/1" class="btn btn-sm btn-danger" 
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa nhân viên này?')">
                                                <i class="fas fa-trash-alt"></i> Xóa
                                            </a>
                                        </td>
                                    </tr>
                                    <!-- Thêm các dữ liệu mẫu khác tương tự... -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>

            <!-- Modal thêm/sửa nhân viên -->
            <div class="modal fade" id="staffModal" tabindex="-1" aria-labelledby="staffModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staffModalLabel">Thêm mới nhân viên</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                        </div>
                        <div class="modal-body">
                            <form id="staffForm" action="/admin/staff/save" method="post">
                                <input type="hidden" id="staffId" name="id">
                                <div class="mb-3">
                                    <label for="staffName" class="form-label">Tên nhân viên</label>
                                    <input type="text" class="form-control" id="staffName" name="name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="staffEmail" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="staffEmail" name="email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="staffPhone" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="staffPhone" name="phone" required>
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
    <script src="../../../../resources/admin/js/staff_management.js"></script>

</body>
</html>
