<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý lương nhân viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Thêm CSS cho Flatpickr -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/admin_style/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
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
                        <li class="breadcrumb-item active">Quản lý lương</li>
                    </ol>

                    <!-- Nút thêm lương mới và xuất Excel -->
                    <div class="mb-3 d-flex justify-content-between">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#salaryModal"
                            onclick="openSalaryModal('new')">
                            <i class="fas fa-plus"></i> Thêm mới lương
                        </button>
                        <a href="/admin/salary_management/excel" class="btn btn-success">
                            <i class="fas fa-file-excel"></i> Xuất ra Excel
                        </a>
                    </div>

                    <!-- Bảng danh sách lương -->
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <span><i class="fas fa-table me-1"></i> Danh sách lương</span>
                        </div>
                        <div class="card-body">
                            <table id="salaryTable" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Tên nhân viên</th>
                                        <th>Lương cơ bản (VNĐ)</th>
                                        <th>Thưởng (VNĐ)</th>
                                        <th>Trạng thái</th>
                                        <th>Cập nhật</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="salary" items="${staffSalaries}">
                                        <tr>
                                            <td>${salary.staff.name}</td>
                                            <td><fmt:formatNumber value="${salary.baseSalary}" pattern="#,###"/> VNĐ</td>
                                            <td><fmt:formatNumber value="${salary.bonus}" pattern="#,###"/> VNĐ</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${salary.status == 'DaThanhToan'}">
                                                        <span class="badge bg-success">Đã thanh toán</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-warning text-dark">Chưa thanh toán</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${salary.formattedUpdateDate}</td>
                                            <td>
                                                <button class="btn btn-sm btn-info" onclick="viewSalaryHistory('${salary.staff.id}', '${salary.staff.name}')">
                                                    <i class="fas fa-history"></i> Lịch sử lương
                                                </button>
                                                <!-- <button class="btn btn-sm btn-warning" data-bs-toggle="modal"
                                                    data-bs-target="#salaryModal"
                                                    onclick="openSalaryModal('edit', '${salary.salaryId}', '${salary.staff.id}', '${salary.staff.name}', '${salary.baseSalary}', '${salary.bonus}', '${salary.status}')">
                                                    <i class="fas fa-edit"></i> Sửa
                                                </button> -->
                                                <button type="button" class="btn btn-sm btn-danger"
                                                    onclick="openDeleteModal('${salary.salaryId}', '${salary.staff.name}')">
                                                    <i class="fas fa-trash-alt"></i> Xóa
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

            <!-- Modal Thêm/Sửa lương -->
            <div class="modal fade" id="salaryModal" tabindex="-1" aria-labelledby="salaryModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="salaryModalLabel">Thêm/Sửa lương</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                        </div>
                        <div class="modal-body">
                            <form:form id="salaryForm" action="/admin/salary_management/save" method="post" modelAttribute="newSalary">
                                <input type="hidden" id="salaryId" name="salaryId" value="" />
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <input type="hidden" id="staffIdHidden" value="" />

                                <div class="mb-3">
                                    <label for="staffSelect" class="form-label">Nhân viên</label>
                                    <select class="form-select" id="staffSelect" name="staff.id" required>
                                        <option value="">Chọn nhân viên</option>
                                        <c:forEach var="staff" items="${staffList}">
                                            <option value="${staff.id}">${staff.name}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="text" class="form-control" id="staffName" name="staffName" readonly style="display: none;" />
                                </div>

                                <div class="mb-3 row">
                                    <div class="col-md-6">
                                        <label for="baseSalary" class="form-label">Lương cơ bản (VNĐ)</label>
                                        <input type="number" class="form-control" id="baseSalary" name="baseSalary" min="0" step="0.01" required />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="bonus" class="form-label">Thưởng (VNĐ)</label>
                                        <input type="number" class="form-control" id="bonus" name="bonus" min="0" step="0.01" required />
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="salaryStatus" class="form-label">Trạng thái</label>
                                    <select class="form-select" id="salaryStatus" name="status" required>
                                        <option value="">Chọn trạng thái</option>
                                        <option value="DaThanhToan">Đã thanh toán</option>
                                        <option value="ChuaThanhToan">Chưa thanh toán</option>
                                    </select>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Xác nhận xóa lương -->
            <div class="modal fade" id="deleteSalaryModal" tabindex="-1" aria-labelledby="deleteSalaryModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteSalaryModalLabel">Xác nhận xóa lương</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                        </div>
                        <div class="modal-body">
                            <p>Bạn có chắc chắn muốn xóa lương của nhân viên <strong id="deleteSalaryStaffName"></strong>?</p>
                        </div>
                        <div class="modal-footer">
                            <form:form id="deleteSalaryForm" action="/admin/salary_management/delete" method="post">
                                <input type="hidden" id="deleteSalaryId" name="salaryId" value="" />
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn btn-danger">Xóa</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Lịch sử lương -->
            <div class="modal fade" id="historyModal" tabindex="-1" aria-labelledby="historyModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="historyModalLabel">Lịch sử lương của <span id="historyStaffName"></span></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Lương cơ bản (VNĐ)</th>
                                        <th>Thưởng (VNĐ)</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày cập nhật</th>
                                    </tr>
                                </thead>
                                <tbody id="historyTableBody">
                                    <!-- Dữ liệu sẽ được thêm bởi JavaScript -->
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
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
    <!-- Thêm script cho Flatpickr nếu cần -->
    <script src="/admin_style/js/vi.js"></script>
    <script src="/admin_style/js/salary_management.js"></script>
    <script src="/admin_style/js/scripts.js"></script>
</body>
</html>