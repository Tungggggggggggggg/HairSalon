<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/admin_style/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Trang chính</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Trang chính</li>
                </ol>
                <div class="row">
                    <div class="col-xl-3 col-md-6">
                        <div class="card mb-4 text-center">
                            <div class="card-body">
                                <h3>Tổng doanh thu</h3>
                                <hr>
                                <h2 style="font-size: 2em; margin: 0;">
                                    <fmt:formatNumber value="${doanhthu}" type="number" pattern="#,###" /> VNĐ
                                </h2>

                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small stretched-link" href="/admin/revenue_management">Xem thêm</a>
                                <div class="small"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card mb-4 text-center">
                            <div class="card-body">
                                <h3>Thông báo</h3>
                                <hr>
                                <h2 style="font-size: 2em; margin: 0;">${countNotication}</h2>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small stretched-link" href="/admin/notification_management">Xem thêm</a>
                                <div class="small"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card mb-4 text-center">
                            <div class="card-body">
                                <h3>Số lượng đặt lịch</h3>
                                <hr>
                                <h2 style="font-size: 2em; margin: 0;">${countBooking}</h2>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small stretched-link" href="/admin/booking_management">Xem thêm</a>
                                <div class="small"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card mb-4 text-center">
                            <div class="card-body">
                                <h3>Phản hồi</h3>
                                <hr>
                                <h2 style="font-size: 2em; margin: 0;">${countReven}</h2>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small stretched-link" href="#">Xem thêm</a>
                                <div class="small"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-9">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                Doanh thu theo tuần trong tháng
                            </div>
                            <div class="card-body">
                                <canvas id="revenueChart" width="100%" height="50"></canvas>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                Doanh thu theo tháng trong năm
                            </div>
                            <div class="card-body">
                                <canvas id="myAreaChart" height="500px"></canvas>
                            </div>
                        </div>

                    </div>
                    <div class="col-xl-3">
                        <div class="row mb-4">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h3>Hiệu xuất nhân viên</h3>
                                        <div class="chart-container">
                                            <canvas id="staffPerformanceChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h3>Tỉ lệ hủy đặt lịch</h3>
                                        <div class="chart-container">
                                            <canvas id="cancellationChart" ></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-xl-6">

                    </div>
                    <div class="col-xl-6">

                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-users me-1"></i> Thông tin người dùng
                    </div>
                    <div class="card-body">
                        <table id="userInfoTable" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Địa chỉ</th>
                                <th>Giới tính</th>
                                <th>Ngày sinh</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.name}</td>
                                        <td>${user.address}</td>
                                        <td>${user.gender}</td>
                                        <td>${user.birthday}</td>
                                        <td>${user.email}</td>
                                        <td>${user.phone}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Biểu đồ doanh thu trong tháng
    const ctx1 = document.getElementById('myAreaChart').getContext('2d');
    const myAreaChart = new Chart(ctx1, {
        type: 'line',
        data: {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
            datasets: [{
                label: 'Doanh thu',
                data: [12000, 19000, 30000, 50000, 23000, 34000, 45000, 50000, 60000, 80000, 75000, 90000],
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2,
                fill: true,
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true,
                },
            },
        }
    });

    // Biểu đồ doanh thu tuần (giả sử)
    const ctx2 = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: ['Tuần 1', 'Tuần 2', 'Tuần 3', 'Tuần 4'],
            datasets: [{
                label: 'Doanh thu tuần',
                data: [12000, 19000, 30000, 50000],
                backgroundColor: [
                    'rgba(75, 192, 192, 0.5)',
                    'rgba(153, 102, 255, 0.5)',
                    'rgba(255, 159, 64, 0.5)',
                    'rgba(255, 99, 132, 0.5)'
                ],
                borderColor: [
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 99, 132, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Biểu đồ performance staff (giả sử)
    const ctx3 = document.getElementById('staffPerformanceChart').getContext('2d');
    const staffPerformanceChart = new Chart(ctx3, {
        type: 'pie',
        data: {
            labels: ['Nhân viên 1', 'Nhân viên 2', 'Nhân viên 3', 'Nhân viên 4'],
            datasets: [{
                label: 'Hiệu suất',
                data: [300, 50, 100, 75],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Hiệu suất Nhân viên'
                }
            }
        }
    });

    // Biểu đồ tỉ lệ hủy (giả sử)
    const ctx4 = document.getElementById('cancellationChart').getContext('2d');
    const cancellationChart = new Chart(ctx4, {
        type: 'doughnut',
        data: {
            labels: ['Không hủy', 'Hủy'],
            datasets: [{
                label: 'Tỉ lệ hủy',
                data: [90, 10],
                backgroundColor: [
                    'rgba(75, 192, 192, 0.5)',
                    'rgba(255, 99, 132, 0.5)',
                ],
                borderColor: [
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 99, 132, 1)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Tỉ lệ hủy đặt lịch'
                }
            }
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
<script src="/admin_style/js/datatables-simple-demo.js"></script>
<script src="/admin_style/js/scripts.js"></script>

</body>

</html>
