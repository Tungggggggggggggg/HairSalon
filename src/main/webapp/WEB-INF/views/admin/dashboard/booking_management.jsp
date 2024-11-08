<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
        <title>Quản lý lịch hẹn</title>
        <link
            href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
            rel="stylesheet"
        />
        <link href="/admin_style/css/styles.css" rel="stylesheet" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        />
        <script
            src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
            crossorigin="anonymous"
        ></script>
    </head>

    <body class="sb-nav-fixed">
        <!-- Chèn phần header -->
        <jsp:include page="../layout/header.jsp" />

        <div id="layoutSidenav">
            <!-- Chèn phần sidebar -->
            <jsp:include page="../layout/sidebar.jsp" />

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Quản lý lịch hẹn</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">
                                <a href="/admin">Trang chủ</a>
                            </li>
                            <li class="breadcrumb-item active">
                                Quản lý lịch hẹn
                            </li>
                        </ol>

                        <!-- Nút thêm lịch hẹn mới -->
                        <div class="mb-3">
                            <button
                                class="btn btn-primary"
                                onclick="openModal('new')"
                            >
                                <i class="fas fa-calendar-plus"></i> Thêm mới
                                lịch hẹn
                            </button>
                        </div>

                        <!-- Bảng danh sách lịch hẹn -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i> Danh sách lịch
                                hẹn
                            </div>
                            <div class="card-body">
                                <table
                                    id="datatablesSimple"
                                    class="table table-bordered table-hover"
                                >
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
                                        <c:forEach
                                            var="booking"
                                            items="${bookings}"
                                        >
                                            <tr>
                                                <td>${booking.id}</td>
                                                <td>
                                                    ${booking.customer.name}
                                                </td>
                                                <td>${booking.date}</td>
                                                <td>
                                                    ${booking.startTime} --
                                                    ${booking.endTime}
                                                </td>
                                                <td>
                                                    <c:forEach
                                                        var="service"
                                                        items="${booking.services}"
                                                    >
                                                        ${service.name}<br />
                                                    </c:forEach>
                                                </td>
                                                <td>${booking.status}</td>
                                                <td>
                                                    <button
                                                        class="btn btn-sm btn-info"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#detailModal"
                                                        onclick="viewDetails('${booking.id}', '${booking.customer.name}', '${booking.staff.name}', '${booking.date}', '${booking.startTime}', '${booking.endTime}', '${booking.status}')"
                                                    >
                                                        <i
                                                            class="fas fa-eye"
                                                        ></i>
                                                        Chi tiết
                                                    </button>
                                                    <button
                                                        class="btn btn-sm btn-warning"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#bookingModal"
                                                        onclick="openModal('edit', '${booking.id}', '${booking.customer.name}', '${booking.staff.name}', '${booking.date}', '${booking.startTime}', '${booking.endTime}', '${booking.status}')"
                                                    >
                                                        <i
                                                            class="fas fa-edit"
                                                        ></i>
                                                        Sửa
                                                    </button>
                                                    <button
                                                        class="btn btn-sm btn-danger"
                                                        onclick="openDeleteModal('${booking.id}', '${booking.customer.name}')"
                                                    >
                                                        <i
                                                            class="fas fa-trash-alt"
                                                        ></i>
                                                        Xóa
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>

                <!-- Modal Xem chi tiết Booking -->
                <div
                    class="modal fade"
                    id="detailModal"
                    tabindex="-1"
                    aria-labelledby="detailModalLabel"
                    aria-hidden="true"
                >
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="detailModalLabel">
                                    Chi tiết khách hàng
                                </h5>
                                <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close"
                                ></button>
                            </div>
                            <div class="modal-body">
                                <p>
                                    <strong>ID:</strong>
                                    <span id="detailId"></span>
                                </p>
                                <p>
                                    <strong>Tên khách hàng:</strong>
                                    <span id="detailUser"></span>
                                </p>
                                <p>
                                    <strong>Dịch vụ:</strong>
                                    <span id="detailService"></span>
                                </p>
                                <p>
                                    <strong>Nhân viên phụ trách:</strong>
                                    <span id="detailStaff"></span>
                                </p>
                                <p>
                                    <strong>Ngày:</strong>
                                    <span id="detailDate"></span>
                                </p>
                                <p>
                                    <strong>Thời gian:</strong>
                                    <span id="detailStartTime"></span> -
                                    <span id="detailEndTime"></span>
                                </p>
                                <p>
                                    <strong>Trạng thái:</strong>
                                    <span id="detailStatus"></span>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <button
                                    type="button"
                                    class="btn btn-secondary"
                                    data-bs-dismiss="modal"
                                >
                                    Đóng
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Chèn phần footer -->
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
