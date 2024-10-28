<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Quản lý doanh thu</title>
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
                                        <th>Ngày</th>
                                        <th>Dịch vụ</th>
                                        <th>Số lượng</th>
                                        <th>Tổng tiền (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dữ liệu mẫu -->
                                    <tr>
                                        <td>2024-10-25</td>
                                        <td>Cắt tóc</td>
                                        <td>15</td>
                                        <td>1,500,000</td>
                                    </tr>
                                    <tr>
                                        <td>2024-10-25</td>
                                        <td>Gội đầu</td>
                                        <td>10</td>
                                        <td>500,000</td>
                                    </tr>
                                    <tr>
                                        <td>2024-10-26</td>
                                        <td>Nhuộm tóc</td>
                                        <td>5</td>
                                        <td>2,000,000</td>
                                    </tr>
                                    <!-- Thêm các dữ liệu mẫu khác tương tự... -->
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="3">Tổng doanh thu</th>
                                        <th id="totalRevenue">4,000,000</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!-- Biểu đồ doanh thu -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-line me-1"></i>
                            Biểu đồ doanh thu
                        </div>
                        <div class="card-body">
                            <canvas id="revenueChart" width="100%" height="30"></canvas>
                        </div>
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
