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
                        <button type="button" class="btn btn-primary" onclick="openModal('new')">
                            <i class="fas fa-calendar-plus"></i> Thêm lịch hẹn mới
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
                                        <th>Danh sách dịch vụ</th>
                                        <th>Trạng thái</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dữ liệu mẫu -->
                                    <c:forEach var="booking" items="${bookings}">
                                        <tr>
                                            <td>${booking.id}</td>
                                            <td>${booking.customer.name}</td>
                                            <td>${booking.date}</td>
                                            <td>${booking.appointmentTime}</td>
                                            <td>
                                                <c:forEach var="service" items="${booking.services}">
                                                    ${service.name}<br/>
                                                </c:forEach>
                                            </td>
                                            <td>${booking.status}</td>
                                            <td>
                                                <button class="btn btn-sm btn-info" data-bs-toggle="modal"
                                                    data-bs-target="#detailModal"
                                                    onclick="viewDetails('${booking.id}', '${booking.customer.name}', '${booking.staff.name}', '${not empty booking.services ? booking.services[0].name : ''}', '${booking.date}', '${booking.appointmentTime}', '${booking.status}')">
                                                    <i class="fas fa-eye"></i> Chi tiết
                                                </button>
                                                <button class="btn btn-sm btn-warning"
                                                    onclick="openModal('edit', '${booking.id}', '${booking.customer.id}', '${booking.date}', '${booking.appointmentTime}', '${not empty booking.services ? booking.services[0].id : ''}', '${booking.status}', '${booking.staff.id}', '${booking.customer.name}', '${booking.customer.email}', '${booking.customer.phone}', '${booking.customer.address}', '${booking.customer.birthday}', '${booking.customer.gender}')">
                                                    <i class="fas fa-edit"></i> Sửa
                                                </button>
                                                <button type="button" class="btn btn-sm btn-danger" 
                                                    onclick="openCancelModal('${booking.id}', '${booking.customer.name}')">
                                                    <i class="fas fa-times-circle"></i> Hủy
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
                            <h5 class="modal-title" id="detailModalLabel">Chi tiết lịch hẹn</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Đóng"></button>
                        </div>
                        <div class="modal-body">
                            <p><strong>ID:</strong> <span id="detailId"></span></p>
                            <p><strong>Tên khách hàng:</strong> <span id="detailUser"></span></p>
                            <p><strong>Dịch vụ:</strong> <span id="detailService"></span></p>
                            <p><strong>Nhân viên phụ trách:</strong> <span id="detailStaff"></span></p>
                            <p><strong>Ngày:</strong> <span id="detailDate"></span></p>
                            <p><strong>Giờ hẹn:</strong> <span id="detailAppointmentTime"></span></p>
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
                        <div class="modal-body">
                            <form:form id="bookingForm" action="/admin/booking_management/save" method="post" modelAttribute="command">
                                <form:hidden path="id" />
                                <div class="container-fluid">
                                    <div class="row">
                                        <!-- Thông tin khách hàng -->
                                        <div class="col-md-6">
                                            <h5>Thông tin khách hàng</h5>
                                            <div class="mb-3">
                                                <label for="customerName" class="form-label">Tên khách hàng</label>
                                                <form:input type="text" class="form-control" id="customerName" path="customer.name" required="true"/>
                                            </div>
                                            <div class="mb-3">
                                                <label for="customerEmail" class="form-label">Email</label>
                                                <form:input type="email" class="form-control" id="customerEmail" path="customer.email" required="true"/>
                                            </div>
                                            <div class="mb-3">
                                                <label for="customerPhone" class="form-label">Điện thoại</label>
                                                <form:input type="text" class="form-control" id="customerPhone" path="customer.phone" required="true"/>
                                            </div>
                                            <div class="mb-3">
                                                <label for="customerAddress" class="form-label">Địa chỉ</label>
                                                <form:input type="text" class="form-control" id="customerAddress" path="customer.address" required="true"/>
                                            </div>
                                            <div class="mb-3">
                                                <label for="customerBirthday" class="form-label">Ngày sinh</label>
                                                <form:input type="date" class="form-control" id="customerBirthday" path="customer.birthday"/>
                                            </div>
                                            <div class="mb-3">
                                                <label for="customerGender" class="form-label">Giới tính</label>
                                                <form:select class="form-control" path="customer.gender" id="customerGender" required="true">
                                                    <option value="">Chọn giới tính</option>
                                                    <option value="Nam">Nam</option>
                                                    <option value="Nu">Nữ</option>
                                                </form:select>
                                            </div>
                                        </div>

                                        <!-- Thông tin lịch hẹn -->
                                        <div class="col-md-6">
                                            <h5>Thông tin lịch hẹn</h5>
                                            <div class="mb-3">
                                                <label for="bookingDate" class="form-label">Ngày</label>
                                                <form:input type="date" class="form-control" id="bookingDate" path="date" required="true"/>
                                            </div>
                                            <div class="mb-3">
                                                <label for="appointmentTime" class="form-label">Giờ hẹn</label>
                                                <form:select class="form-control" path="appointmentTime" id="appointmentTime" required="true">
                                                    <option value="">Chọn giờ hẹn</option>
                                                    <c:forEach var="time" items="${appointmentTimes}">
                                                        <option value="${time}">${time}</option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="service" class="form-label">Dịch vụ</label>
                                                <form:select class="form-control" path="services" id="service" multiple="true">
                                                    <option value="">Chọn dịch vụ</option>
                                                    <c:forEach var="service" items="${servicesList}">
                                                        <option value="${service.id}">${service.name}</option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="status" class="form-label">Trạng thái</label>
                                                <form:select class="form-control" path="status" id="status" required="true">
                                                    <option value="">Chọn trạng thái</option>
                                                    <option value="DaDat">Đã Đặt</option>
                                                    <option value="HoanThanh">Hoàn Thành</option>
                                                    <option value="DaHuy">Đã Hủy</option>
                                                </form:select>
                                            </div>
                                            <!-- Trường chọn nhân viên -->
                                            <div class="mb-3">
                                                <label for="staff" class="form-label">Nhân viên</label>
                                                <form:select class="form-control" path="staff.id" id="staff" required="true">
                                                    <option value="">Chọn nhân viên</option>
                                                    <c:forEach var="staff" items="${staffList}">
                                                        <option value="${staff.id}">${staff.name}</option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>

                <!-- Modal xác nhận hủy Booking -->
                <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cancelModalLabel">Xác nhận hủy Booking</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Bạn có chắc chắn muốn hủy Booking <strong id="cancelName"></strong>?</p>
                            </div>
                            <div class="modal-footer">
                                <form:form id="cancelForm" action="/admin/booking_management/cancel" method="post" modelAttribute="cancelBooking">
                                    <form:hidden path="id" />
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-warning">Xác nhận hủy</button>
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
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
    <script src="/admin_style/js/booking_management.js"></script>
    <script src="/admin_style/js/scripts.js"></script>

</body>

</html>
