<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Quản lý lịch hẹn</title>
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
                    <h1 class="mt-4">Quản lý lịch hẹn</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Quản lý lịch hẹn</li>
                    </ol>

                    <!-- Nút thêm lịch hẹn mới -->
                    <div class="mb-3">
                        <button class="btn btn-primary" onclick="openModal('new')">
                            <i class="fas fa-calendar-plus"></i> Thêm mới lịch hẹn
                        </button>
                    </div>

                    <!-- Bảng danh sách lịch hẹn -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Danh sách lịch hẹn
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên khách hàng</th>
                                        <th>Ngày giờ hẹn</th>
                                        <th>Dịch vụ</th>
                                        <th>Nhân viên</th>
                                        <th>Trạng thái</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dữ liệu mẫu -->
                                    <tr>
                                        <td>1</td>
                                        <td>Khách hàng 1</td>
                                        <td>2024-10-25 14:30</td>
                                        <td>Cắt tóc</td>
                                        <td>Nhân viên 1</td>
                                        <td>
                                            <span class="badge bg-secondary status-badge" 
                                                  data-id="1" data-status="Chưa xác nhận" onclick="changeStatus(this)">
                                                Chưa xác nhận
                                            </span>
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-warning" onclick="openModal('edit', 1, 'Nguyễn Văn A', '2024-10-25 14:30', 'Cắt tóc', 'Nhân viên A', 'Chưa xác nhận')">
                                                <i class="fas fa-edit"></i> Sửa
                                            </button>
                                            <a href="/admin/booking/delete/1" class="btn btn-sm btn-danger" 
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa lịch hẹn này?')">
                                                <i class="fas fa-trash-alt"></i> Xóa
                                            </a>
                                        </td>
                                    </tr>
                                    <!-- Các dữ liệu mẫu khác tương tự... -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>

            <!-- Modal thêm/sửa lịch hẹn -->
            <div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="bookingModalLabel">Thêm mới lịch hẹn</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                        </div>
                        <div class="modal-body">
                            <form id="bookingForm" action="/admin/booking/save" method="post">
                                <input type="hidden" id="bookingId" name="id">
                                <div class="mb-3">
                                    <label for="customerName" class="form-label">Tên khách hàng</label>
                                    <input type="text" class="form-control" id="customerName" name="customerName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="bookingDateTime" class="form-label">Ngày giờ hẹn</label>
                                    <input type="datetime-local" class="form-control" id="bookingDateTime" name="bookingDateTime" required>
                                </div>
                                <div class="mb-3">
                                    <label for="service" class="form-label">Dịch vụ</label>
                                    <select class="form-control" id="service" name="service" required>
                                        <option value="Cắt tóc">Cắt tóc</option>
                                        <option value="Gội đầu">Gội đầu</option>
                                        <option value="Nhuộm tóc">Nhuộm tóc</option>
                                        <option value="Cạo râu">Cạo râu</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="staff" class="form-label">Nhân viên</label>
                                    <input type="text" class="form-control" id="staff" name="staff" required>
                                </div>
                                <div class="mb-3">
                                    <label for="status" class="form-label">Trạng thái</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="Đã xác nhận">Đã xác nhận</option>
                                        <option value="Chưa xác nhận">Chưa xác nhận</option>
                                        <option value="Đã hủy">Đã hủy</option>
                                    </select>
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
    <script src="../../../../resources/admin/js/booking_management.js"></script>
</body>
</html>
