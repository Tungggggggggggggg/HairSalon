<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>JSalon-Nhân Viên</title>
    <link rel="icon" href="/user_style/images/logo_icon.png" type="image/icon type">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/admin_style/css/styles.css" rel="stylesheet" />
    <link href="/staff_style/css/staff.css" rel="stylesheet" />
    <link rel="icon" href="/user_style/images/logo_icon.png" type="image/icon type">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="/WEB-INF/views/staff/layout/header.jsp" />

<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/staff/layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
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
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty bookingList}">
                                <c:forEach var="booking" items="${bookingList}">
                                    <tr>
                                        <td>${booking.id}</td>
                                        <td>${booking.customer.name}</td>
                                        <td>
                                            <c:forEach var="service" items="${booking.services}" varStatus="status">
                                                ${service.name}<c:if test="${!status.last}">, </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>${booking.getFormattedDate()}</td>
                                        <td>
                                            <span class="badge 
                                                <c:choose>
                                                    <c:when test="${booking.status == 'HoanThanh'}">bg-success</c:when>
                                                    <c:when test="${booking.status == 'DaDat'}">bg-warning</c:when>
                                                    <c:otherwise>bg-secondary</c:otherwise>
                                                </c:choose>
                                            ">
                                                ${booking.getStatusDisplayName()}
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty bookingList}">
                                <tr>
                                    <td colspan="5" class="text-center">Không có lịch hẹn nào.</td>
                                </tr>
                            </c:if>
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
<!-- Thêm script cho simple-datatables -->
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/simple-datatables.js"></script>
<script>
    // Khởi tạo DataTable cho bảng lịch hẹn
    document.addEventListener('DOMContentLoaded', function() {
        const appointmentTable = document.querySelector("#appointmentTable");
        if (appointmentTable) {
            new simpleDatatables.DataTable(appointmentTable, {
                perPage: 10,
                perPageSelect: false,
                searchable: true,
                fixedHeight: true,
                labels: {
                    placeholder: "Tìm kiếm...",
                    noRows: "Không có dữ liệu",
                    info: "Hiển thị {start} đến {end} của {rows} lịch hẹn",
                    pagination: {
                        previous: "Trước",
                        next: "Tiếp theo"
                    }
                }
            });
        }
    });
</script>
</body>
</html>
