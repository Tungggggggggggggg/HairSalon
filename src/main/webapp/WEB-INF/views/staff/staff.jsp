<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Trang nhân viên</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/admin_style/css/styles.css" rel="stylesheet" />
    <link href="/staff_style/css/staff.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>

<body class="sb-nav-fixed">
    <jsp:include page="/WEB-INF/views/staff/layout/header.jsp" />

<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/staff/layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Lịch làm việc</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Lịch làm việc</li>
                    </ol>

                    <!-- Lịch tháng -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-calendar-alt me-1"></i> Lịch làm việc tháng này
                        </div>
                        <div class="card-body">
                            <div id="calendar"></div>
                        </div>
                    </div>

                </div>

                <div class="container-fluid px-4">
                    <h1 class="mt-4">Quản lý lịch hẹn</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Lịch hẹn</li>
                    </ol>

                    <!-- Bảng quản lý lịch hẹn -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-calendar-check me-1"></i> Danh sách lịch hẹn
                        </div>
                        <div class="card-body">
                            <table id="appointmentTable" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Khách hàng</th>
                                    <th>Dịch vụ</th>
                                    <th>Ngày đặt</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- Dữ liệu lịch hẹn sẽ được lặp qua đây -->
                                <c:forEach var="appointment" items="${appointments}">
                                    <tr>
                                        <td>${appointment.id}</td>
                                        <td>${appointment.customerName}</td>
                                        <td>${appointment.serviceName}</td>
                                        <td>${appointment.bookingDate}</td>
                                        <td>${appointment.status}</td>
                                        <td>
                                            <form action="acceptAppointment" method="post" style="display:inline;">
                                                <input type="hidden" name="appointmentId" value="${appointment.id}">
                                                <button type="submit" class="btn btn-success btn-sm">Nhận</button>
                                            </form>
                                            <form action="updateAppointment" method="post" style="display:inline;">
                                                <input type="hidden" name="appointmentId" value="${appointment.id}">
                                                <select name="status" class="form-select form-select-sm" onchange="this.form.submit()">
                                                    <option value="">Chọn trạng thái</option>
                                                    <option value="CONFIRMED">Xác nhận</option>
                                                    <option value="CANCELED">Hủy</option>
                                                </select>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </main>

            <jsp:include page="/WEB-INF/views/staff/layout/footer.jsp" />

        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Thêm các script của FullCalendar -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.15/locales-all.global.min.js"></script>
    <script src="/staff_style/js/staff.js"></script>
    <script src="/admin_style/js/scripts.js"></script>
</body>
</html>
