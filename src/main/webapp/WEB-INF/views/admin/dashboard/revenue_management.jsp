<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>JSalon-Quản Tri</title>
    <link rel="icon" href="/user_style/images/logo_icon.png" type="image/icon type">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/admin_style/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
    <!-- Thêm thư viện SheetJS để xuất file Excel -->
    <script src="https://cdn.jsdelivr.net/npm/xlsx@0.17.0/dist/xlsx.full.min.js"></script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Quản lý doanh thu</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Quản lý doanh thu</li>
                    </ol>

                    <!-- Lọc theo khoảng thời gian -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-filter me-1"></i> Lọc doanh thu
                        </div>
                        <div class="card-body">
                            <form id="filterForm" onsubmit="return filterRevenue()">
                                <div class="row mb-3">
                                    <div class="col-md-5">
                                        <label for="startDate" class="form-label">Từ ngày</label>
                                        <input type="date" id="startDate" class="form-control" required>
                                    </div>
                                    <div class="col-md-5">
                                        <label for="endDate" class="form-label">Đến ngày</label>
                                        <input type="date" id="endDate" class="form-control" required>
                                    </div>
                                    <div class="col-md-2 d-flex align-items-end">
                                        <button type="submit" class="btn btn-primary w-100">Lọc</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Bảng danh sách doanh thu -->
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between">
                            <span><i class="fas fa-table me-1"></i> Danh sách doanh thu</span>
                            <button class="btn btn-success" onclick="exportToExcel()">
                                <i class="fas fa-file-excel"></i> Xuất ra Excel
                            </button>
                        </div>
                        <div class="card-body">
                            <table id="revenueTable" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ngày</th>
                                        <th>Số Dịch vụ</th>
                                        <th>Số lượng booking</th>
                                        <th>Tổng tiền (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="revenue" items="${revenues}">
                                        <tr>
                                            <td>${revenue.summaryId} </td>
                                            <td>${revenue.summaryDate} </td>
                                            <td>${revenue.totalServices} </td>
                                            <td>${revenue.numberOfBookings} </td>
                                            <td>${revenue.totalRevenue} </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
<%--                                <tfoot>--%>
<%--                                    <tr>--%>
<%--                                        <th colspan="3">Tổng doanh thu</th>--%>
<%--                                        <th id="totalRevenue">4,000,000</th>--%>
<%--                                    </tr>--%>
<%--                                </tfoot>--%>
                            </table>
                        </div>
                    </div>


                    <!-- Biểu đồ doanh thu -->
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <span><i class="fas fa-chart-line me-1"></i> Biểu đồ doanh thu</span>

                            <!-- Nhóm nút chọn khoảng thời gian -->
                            <div class="btn-group" role="group" aria-label="Time Filter">
                                <button type="button" class="btn btn-outline-primary" onclick="updateChart('week')">Tuần</button>
                                <button type="button" class="btn btn-outline-primary" onclick="updateChart('month')">Tháng</button>
                                <button type="button" class="btn btn-outline-primary" onclick="updateChart('year')">Năm</button>
                            </div>
                        </div>
                        <div class="card-body">
                            <canvas id="revenueChart" width="100%" height="30"></canvas>
                        </div>
                        <script>
                            // Khởi tạo biểu đồ với dữ liệu trống ban đầu
                            const ctx = document.getElementById('revenueChart').getContext('2d');
                            const revenueChart = new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: [], // Khởi tạo với nhãn trống
                                    datasets: [{
                                        label: 'Doanh thu (VNĐ)',
                                        data: [], // Khởi tạo với dữ liệu trống
                                        fill: false,
                                        borderColor: 'rgba(75, 192, 192, 1)',
                                        tension: 0.1
                                    }]
                                },
                                options: {
                                    responsive: true,
                                    plugins: {
                                        legend: {
                                            position: 'top',
                                        },
                                        tooltip: {
                                            callbacks: {
                                                label: function(tooltipItem) {
                                                    return tooltipItem.raw.toLocaleString('vi-VN') + ' VNĐ';
                                                }
                                            }
                                        }
                                    },
                                    scales: {
                                        x: {
                                            title: {
                                                display: true,
                                                text: 'Thời gian'
                                            }
                                        },
                                        y: {
                                            title: {
                                                display: true,
                                                text: 'Doanh thu (VNĐ)'
                                            },
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });

                            // Hàm cập nhật biểu đồ dựa trên khoảng thời gian được chọn
                            function updateChart(timeFilter) {
                                let labels = [];
                                let data = [];
                                const currentDate = new Date();
                                const currentMonth = currentDate.getMonth() + 1;
                                const daysInCurrentMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0).getDate();
                                const currentYear = currentDate.getFullYear();
                                if (timeFilter === "week") {
                                    labels = ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'CN'];
                                    data = ${week}; // Dữ liệu giả lập cho tuần
                                } else if (timeFilter === "month") {
                                    for (let i = 1; i <= daysInCurrentMonth; i++) {
                                        labels.push(`Ngày ` + i.toString()+'/' + currentMonth.toString() + '/' + currentYear.toString() );
                                    }
                                    labels;
                                    data = ${month}; // Dữ liệu giả lập cho tháng
                                    console.log(labels);
                                } else if (timeFilter === "year") {
                                    labels = ['Tháng 1'+ '/' + currentYear.toString(), 'Tháng 2'+ '/' + currentYear.toString(), 'Tháng 3'+ '/' + currentYear.toString(), 'Tháng 4'+ '/' + currentYear.toString(), 'Tháng 5'+ '/' + currentYear.toString(), 'Tháng 6'+ '/' + currentYear.toString(), 'Tháng 7'+ '/' + currentYear.toString(), 'Tháng 8'+ '/' + currentYear.toString(), 'Tháng 9'+ '/' + currentYear.toString(), 'Tháng 10'+ '/' + currentYear.toString(), 'Tháng 11'+ '/' + currentYear.toString(), 'Tháng 12'+ '/' + currentYear.toString()];
                                    data = ${year}; // Dữ liệu giả lập cho năm
                                }

                                // Cập nhật dữ liệu biểu đồ
                                revenueChart.data.labels = labels;
                                revenueChart.data.datasets[0].data = data;
                                revenueChart.update();
                            }

                            // Gọi hàm updateChart('week') khi tải trang để hiển thị dữ liệu tuần mặc định
                            updateChart('week');
                        </script>
                    </div>

                </div>
            </main>

            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
    <script src="/admin_style/js/revenue_management.js"></script>
    <script src="/admin_style/js/scripts.js"></script>

</body>
</html>
