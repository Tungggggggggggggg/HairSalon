<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <title>Quản lý dịch vụ</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="/admin_style/css/styles.css" rel="stylesheet" />
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
                            <h1 class="mt-4">Quản lý dịch vụ</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                <li class="breadcrumb-item active">Quản lý dịch vụ</li>
                            </ol>

                            <!-- Nút thêm dịch vụ mới -->
                            <div class="mb-3">
                                <button class="btn btn-primary" onclick="openServiceModal('new')">
                                    <i class="fas fa-plus-circle"></i> Thêm mới dịch vụ
                                </button>
                            </div>

                            <!-- Bảng danh sách dịch vụ -->
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Danh sách dịch vụ
                                </div>
                                <div class="card-body">
                                    <table id="serviceTable" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tên dịch vụ</th>
                                                <th>Mô tả ngắn</th>
                                                <th>Giá (VNĐ)</th>
                                                <th>Thời gian (phút)</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Dữ liệu mẫu -->
                                            <c:forEach var="service" items="${services}">
                                                <tr>
                                                    <td>${service.id} </td>
                                                    <td>${service.name}</td>
                                                    <td>${service.shortDescription}</td>
                                                    <td>${service.price}</td>
                                                    <td>${service.durationMinutes}</td>
                                                    <td>
                                                        <button class="btn btn-sm btn-warning"
                                                            onclick="openServiceModal('edit', 1, 'Cắt tóc', 100000, 30)">
                                                            <i class="fas fa-edit"></i> Sửa
                                                        </button>
                                                        <a href="/admin/service/delete/1" class="btn btn-sm btn-danger"
                                                            onclick="return confirm('Bạn có chắc chắn muốn xóa dịch vụ này?')">
                                                            <i class="fas fa-trash-alt"></i> Xóa
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <!-- Thêm các dữ liệu mẫu khác tương tự... -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </main>

                    <!-- Modal thêm/sửa dịch vụ -->
                    <div class="modal fade" id="serviceModal" tabindex="-1" aria-labelledby="serviceModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="serviceModalLabel">Thêm mới dịch vụ</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Đóng"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="serviceForm" action="/admin/service/save" method="post">
                                        <input type="hidden" id="serviceId" name="id">
                                        <div class="mb-3">
                                            <label for="serviceName" class="form-label">Tên dịch vụ</label>
                                            <input type="text" class="form-control" id="serviceName" name="name"
                                                required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="servicePrice" class="form-label">Giá (VNĐ)</label>
                                            <input type="number" class="form-control" id="servicePrice" name="price"
                                                required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="serviceDuration" class="form-label">Thời gian (phút)</label>
                                            <input type="number" class="form-control" id="serviceDuration"
                                                name="duration" required>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Hủy</button>
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
            <script
                src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
            <script src="/admin_style/js/service_management.js"></script>
            <script src="/admin_style/js/scripts.js"></script>
        </body>

        </html>