<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Quản lý lịch hẹn</title>
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
                                                    <th>Ngày hẹn</th>
                                                    <th>Giờ hẹn</th>
                                                    <th>Dịch vụ</th>
                                                    <th>Trạng thái</th>
                                                    <th>Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Dữ liệu mẫu -->
                                                <c:forEach var="booking" items="${bookings}">
                                                    <tr>
                                                        <td>${booking.id} </td>
                                                        <td>${booking.user.name} </td>
                                                        <td>${booking.date} </td>
                                                        <td>${booking.satrtTime} -- ${booking.endTime}</td>
                                                        <td>${booking.service.name} </td>
                                                        <td>${booking.status} </td>
                                                        <td>
                                                            <button class="btn btn-sm btn-info" data-bs-toggle="modal"
                                                                data-bs-target="#detailModal"
                                                                onclick="viewDetails('${staff.id}','${booking.user.name}', '${booking.staff.name}', '${booking.service.name}','${booking.date}', '${booking.satrtTime}', '${booking.endTime}', '${booking.status}' )">
                                                                <i class="fas fa-eye"></i> Chi tiết
                                                            </button>
                                                            <button class="btn btn-sm btn-warning"
                                                                data-bs-toggle="modal" data-bs-target="#staffModal"
                                                                onclick="openModal('edit', '${staff.id}','${booking.user.name}', '${booking.staff.name}', '${booking.service.name}','${booking.date}', '${booking.satrtTime}', '${booking.endTime}', '${booking.status}')">
                                                                <i class="fas fa-edit"></i> Sửa
                                                            </button>
                                                            <button type="button" class="btn btn-sm btn-danger"
                                                                onclick="openDeleteModal('${booking.id}', '${booking.user.name}')">
                                                                <i class="fas fa-trash-alt"></i> Xóa
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <!-- Các dữ liệu mẫu khác tương tự... -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </main>

                        <!-- Modal Xem chi tiết Booking -->
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
                                        <p><strong>Tên khách hàng</strong> <span id="detailUser"></span></p>
                                        <p><strong>Dịch vụ:</strong> <span id="detailService"></span></p>
                                        <p><strong>Nhân viên phụ trách:</strong> <span id="detailStaff"></span></p>
                                        <p><strong>Ngày:</strong> <span id="detailDate"></span></p>
                                        <p><strong>Thời gian từ :</strong> <span id="detailStartTime"></span></p>
                                        <p><strong>Đến:</strong> <span id="detailEndTime"></span></p>
                                        <p><strong>Trạng thái Booking:</strong> <span id="detailStatus"></span></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal thêm/sửa lịch hẹn -->
                        <div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="bookingModalLabel">Thêm mới lịch hẹn</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Đóng"></button>
                                    </div>
                                    <div class="modal-body col-12 mx-auto">
                                        <form:form id="bookingForm" action="/admin/booking_management/save" method="post">
                                            <input type="hidden" id="bookingId" name="id">
                                            <div class="mb-3">
                                                <label for="customerName" class="form-label">Tên khách hàng</label>
                                                <form:input type="text" class="form-control" id="customerName"
                                                    name="customerName"  path="user.name"/>

                                            </div>
                                            <div class="mb-3">
                                                <label for="bookingDateTime" class="form-label">Ngày</label>
                                                <form:input type="datetime-local" class="form-control" id="bookingDateTime"
                                                    name="bookingDateTime" path="date"/>
                                            </div>
                                            <div class="mb-3">
                                                <label for="bookingDateTime" class="form-label">Giờ</label>
                                                <form:input type="datetime-local" class="form-control" id=""
                                                    name="bookingDateTime" path="time"/>
                                            </div>
                                            <div class="mb-3">
                                                <label for="service" class="form-label">Dịch vụ</label>
                                                <form:select class="form-control" id="service" name="service"  path="service">
                                                    
                                                </form:select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="staff" class="form-label">Nhân viên</label>
                                                <form:input type="text" class="form-control" id="staff" name="staff" path="staff"
                                                    />
                                            </div>
                                            <div class="mb-3">
                                                <label for="status" class="form-label">Trạng thái</label>
                                                <form:select class="form-control" id="status" name="status" path="status">
                                                    <option value="Đã xác nhận">Đã xác nhận</option>
                                                    <option value="Chưa xác nhận">Chưa xác nhận</option>
                                                    <option value="Đã hủy">Đã hủy</option>
                                                </form:select>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Hủy</button>
                                                <button type="submit" class="btn btn-primary">Lưu</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal xác nhận xóa Booking-->
                        <div class="modal fade" id="deleteModal" tabindex="-1"
                            aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa Booking
                                        </h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Bạn có chắc chắn muốn xóa Booking <strong id="deleteName"></strong>?
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <form:form id="deleteForm" action="/admin/staff_management/delete"
                                            method="post" modelAttribute="deleteStaff">
                                            <form:input type="hidden" id="deleteId" path="id" />
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
                <script src="/admin_style/js/booking_management.js"></script>
                <script src="/admin_style/js/scripts.js"></script>
            </body>

            </html>