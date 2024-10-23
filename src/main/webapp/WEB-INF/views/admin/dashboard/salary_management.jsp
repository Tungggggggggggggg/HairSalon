<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Quản lý lương nhân viên</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="../../../../resources/admin/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/xlsx@0.17.0/dist/xlsx.full.min.js"></script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Quản lý lương nhân viên</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Quản lý lương nhân viên</li>
                    </ol>

                    <!-- Nút thêm lương mới -->
                    <div class="mb-3">
                        <button class="btn btn-primary" onclick="openSalaryModal('new')">
                            <i class="fas fa-plus-circle"></i> Thêm mới lương
                        </button>
                    </div>

                    <!-- Bảng danh sách lương hiện tại -->
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between">
                            <span><i class="fas fa-table me-1"></i> Danh sách lương nhân viên</span>
                            <button class="btn btn-success" onclick="exportSalaryToExcel()">
                                <i class="fas fa-file-excel"></i> Xuất ra Excel
                            </button>
                        </div>
                        <div class="card-body">
                            <table id="salaryTable" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên nhân viên</th>
                                        <th>Lương cơ bản (VNĐ)</th>
                                        <th>Thưởng (VNĐ)</th>
                                        <th>Tổng lương (VNĐ)</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Dữ liệu mẫu -->
                                    <tr>
                                        <td>1</td>
                                        <td>Nhân viên 1</td>
                                        <td>5,000,000</td>
                                        <td>1,000,000</td>
                                        <td>6,000,000</td>
                                        <td>
                                            <button class="btn btn-sm btn-warning" onclick="openSalaryModal('edit', 1, 'Nhân viên 1', 5000000, 1000000)">
                                                <i class="fas fa-edit"></i> Sửa
                                            </button>
                                            <button class="btn btn-sm btn-info" onclick="openHistoryModal('Nguyễn Văn A')">
                                                <i class="fas fa-history"></i> Lịch sử lương
                                            </button>
                                        </td>
                                    </tr>
                                    <!-- Thêm các dữ liệu mẫu khác tương tự... -->
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="4">Tổng lương</th>
                                        <th id="totalSalary">6,000,000</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </main>

            <!-- Modal thêm/sửa lương -->
            <div class="modal fade" id="salaryModal" tabindex="-1" aria-labelledby="salaryModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="salaryModalLabel">Thêm mới lương</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                        </div>
                        <div class="modal-body">
                            <form id="salaryForm" action="/admin/salary/save" method="post">
                                <input type="hidden" id="salaryId" name="id">
                                <div class="mb-3">
                                    <label for="staffName" class="form-label">Tên nhân viên</label>
                                    <input type="text" class="form-control" id="staffName" name="name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="baseSalary" class="form-label">Lương cơ bản (VNĐ)</label>
                                    <input type="number" class="form-control" id="baseSalary" name="baseSalary" required>
                                </div>
                                <div class="mb-3">
                                    <label for="bonus" class="form-label">Thưởng (VNĐ)</label>
                                    <input type="number" class="form-control" id="bonus" name="bonus">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal lịch sử lương -->
            <div class="modal fade" id="historyModal" tabindex="-1" aria-labelledby="historyModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="historyModalLabel">Lịch sử lương</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tháng/Năm</th>
                                        <th>Lương cơ bản (VNĐ)</th>
                                        <th>Thưởng (VNĐ)</th>
                                        <th>Tổng lương (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody id="historyTableBody">
                                    <!-- Dữ liệu lịch sử mẫu -->
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
            </div>

            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/xlsx@0.17.0/dist/xlsx.full.min.js"></script>
    <script src="../../../../resources/admin/js/salary_management.js"></script>

</body>
</html>
