<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <title>Quản lý khách hàng</title>
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
                            <h1 class="mt-4">Quản lý khách hàng</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                <li class="breadcrumb-item active">Quản lý thông báo</li>
                            </ol>

                            <!-- Nút thêm khách hàng mới -->
                            <div class="mb-3">
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#customerModal"
                                    onclick="openModal('new')">
                                    <i class="fas fa-user-plus"></i> Thêm mới thông báo mới
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
                                                <th>Người dùng</th>
                                                <th>Nội dung</th>
                                                <th>Ngày tạo</th>
                                                <th>Trạng thái</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Dữ liệu mẫu -->
                                            <c:forEach var="notification" items="${notifications}">
                                                <tr>
                                                    <td>${notification.id} </td>
                                                    <td>${notification.user.name} </td>
                                                    <td>${notification.message} </td>
                                                    <td>${notification.notificationDate} </td>
                                                    <td>${notification.status} </td>
                                                    <td>
                                                        <button class="btn btn-sm btn-info" data-bs-toggle="modal"
                                                                data-bs-target="#detailModal"
                                                                onclick="viewDetails('${user.id}', '${user.name}', '${user.email}', '${user.password}', '${user.phone}', '${user.address}', '${user.gender}', '${user.birthday}', '${user.createdDate}')">
                                                                <i class="fas fa-eye"></i> Chi tiết 
                                                            </button>
                                                        <button class="btn btn-sm btn-warning" data-bs-toggle="modal"
                                                            data-bs-target="#notificationModal"
                                                            onclick="openModal('edit', 1, 'Chỉnh sửa nhân viên', 'chỉnh sửa số này sinh của nhân viên ABC', '12:22:12 20/11/2024', 'Active')">
                                                            <i class="fas fa-edit"></i> Sửa
                                                        </button>
                                                        <button type="button" class="btn btn-sm btn-danger"
                                                                onclick="openDeleteModal('${user.id}', '${user.name}')">
                                                                <i class="fas fa-trash-alt"></i> Xóa
                                                            </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>    
                                                <!-- Thêm dữ liệu mẫu khác... -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </main>

                    <!-- Modal Xem chi tiết khách hàng -->
                    <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="detailModalLabel">Chi tiết khách hàng</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Đóng"></button>
                                </div>
                                <div class="modal-body">
                                    <p><strong>ID:</strong> <span id="detailId"></span></p>
                                    <p><strong>Tên người dùng:</strong> <span id="detailUser"></span></p>
                                    <p><strong>Nội dung:</strong> <span id="detailMessage"></span></p>
                                    <p><strong>Ngày tạo:</strong> <span id="detailNotificationDate"></span></p>
                                    <p><strong>Trang thái:</strong> <span id="detailStatus"></span></p>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Đóng</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal thêm/sửa khách hàng -->
                    <div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="customerModalLabel">Thêm mới khách hàng</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Đóng"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="customerForm" action="/admin/notification_management/save" method="post" modelAttribute="newNotification">
                                        <input type="hidden" id="customerId" name="id">
                                        <div class="mb-3">
                                            <label for="customerName" class="form-label">Tên tiêu đề</label>
                                            <input type="text" class="form-control" id="customerName" name="name"
                                                required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="customerName" class="form-label">Tên người dùng</label>
                                            <input type="text" class="form-control" id="customerNameUser" name="name"
                                                   required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="customerContent" class="form-label">Nội dung</label>
                                            <textarea type="email" class="form-control" id="customerContent"
                                                name="content" required rows="5"></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label for="customerTime" class="form-label">Ngày tạo</label>
                                            <input type="text" class="form-control" id="customerTime" name="time"
                                                required>
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

                    <!-- Modal xác nhận xóa khách hàng -->
                    <div class="modal fade" id="deleteNotificationModal" tabindex="-1"
                         aria-labelledby="deleteNotificationModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="deleteNotificationModalLabel">Xác nhận xóa thông báo
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn có chắc chắn muốn xóa thông báo <strong
                                            id="deleteNotificationName"></strong>?</p>
                                </div>
                                <div class="modal-footer">
                                    <form:form id="deleteNotificationForm" action="/admin/Notification_management/delete"
                                               method="post" modelAttribute="deleteNotification">
                                        <form:input type="hidden" id="deleteNotificationId" path="id" />
                                        <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Hủy</button>
                                        <button type="submit" class="btn btn-danger">Xóa</button>
                                    </form:form>
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
            <script src="/admin_style/js/notification_management.js"></script>
            <script src="/admin_style/js/scripts.js"></script>
        </body>

        </html>