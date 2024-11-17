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
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="/WEB-INF/views/staff/layout/header.jsp" />

<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/staff/layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Lương</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Lương</li>
                </ol>

                <!-- Lương hàng tháng -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-money-bill-wave me-1"></i> Lương hàng tháng
                    </div>
                    <div class="card-body">
                        <table id="monthlySalaryTable" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID Lương</th>
                                <th>Lương cơ bản (VNĐ)</th>
                                <th>Thưởng (VNĐ)</th>
                                <th>Tổng lương (VNĐ)</th>
                                <th>Ngày cấp lương</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty salaryList}">
                                <c:forEach var="salary" items="${salaryList}">
                                    <tr>
                                        <td>${salary.salaryId}</td>
                                        <td>${salary.baseSalary}</td>
                                        <td>${salary.bonus}</td>
                                        <td>${salary.totalSalary}</td>
                                        <td>${salary.createDate}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty salaryList}">
                                <tr>
                                    <td colspan="6" class="text-center">Không có dữ liệu cho tháng/năm đã chọn.</td>
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
<script src="/staff_style/js/staff.js"></script>
<script src="/admin_style/js/scripts.js"></script>
</body>
</html>