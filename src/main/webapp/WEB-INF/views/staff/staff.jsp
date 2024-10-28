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
<%@ include file="/WEB-INF/views/admin/layout/header.jsp" %>
<div id="layoutSidenav">
    <%@ include file="/WEB-INF/views/admin/layout/sidebar.jsp" %>

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Trang nhân viên</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/staff">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Trang nhân viên</li>
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

                    <!-- Modal thông tin sự kiện -->
                    <div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="eventModalLabel">Thông tin chi tiết sự kiện</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p><strong>Tên sự kiện:</strong> <span id="eventTitle"></span></p>
                                    <p><strong>Khách hàng:</strong> <span id="eventCustomer"></span></p>
                                    <p><strong>Thời gian bắt đầu:</strong> <span id="eventStart"></span></p>
                                    <p><strong>Thời gian kết thúc:</strong> <span id="eventEnd"></span></p>
                                    <p><strong>Trạng thái:</strong> <span id="eventStatus"></span></p>
                                    <p><strong>Mô tả:</strong> <span id="eventDescription"></span></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" id="btnComplete">Hoàn thành</button>
                                    <button type="button" class="btn btn-secondary" id="btnIncomplete">Chưa hoàn thành</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Lương hàng tháng -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-money-bill-wave me-1"></i> Lương hàng tháng
                        </div>
                        <div class="card-body">
                            <table id="monthlySalaryTable" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Tháng/Năm</th>
                                        <th>Lương cơ bản (VNĐ)</th>
                                        <th>Thưởng (VNĐ)</th>
                                        <th>Tổng lương (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dữ liệu mẫu -->
                                    <tr>
                                        <td>09/2024</td>
                                        <td>5,000,000</td>
                                        <td>500,000</td>
                                        <td>5,500,000</td>
                                    </tr>
                                    <tr>
                                        <td>08/2024</td>
                                        <td>5,000,000</td>
                                        <td>300,000</td>
                                        <td>5,300,000</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>

            <%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>

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
