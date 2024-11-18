<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Thông tin nhân viên</title>
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
                <h1 class="mt-4">Thông tin nhân viên</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Thông tin</li>
                </ol>

                <!-- Thông tin nhân viên -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-user me-1"></i> Chi tiết nhân viên
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="name" class="form-label">Tên</label>
                                    <input type="text" class="form-control" id="name" value="${staff.name}" readonly aria-label="Tên">
                                </div>
                                <div class="col-md-6">
                                    <label for="email" class="form-label">Email (Tên đăng nhập)</label>
                                    <input type="email" class="form-control" id="email" value="${staff.email}" readonly aria-label="Email">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input type="tel" class="form-control" id="phone" value="${staff.phone}" readonly aria-label="Số điện thoại">
                                </div>
                                <div class="col-md-6">
                                    <label for="address" class="form-label">Địa chỉ</label>
                                    <input type="text" class="form-control" id="address" value="${staff.address}" readonly aria-label="Địa chỉ">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="gender" class="form-label">Giới tính</label>
                                    <input type="text" class="form-control" id="gender" value="${staff.gender}" readonly aria-label="Giới tính">
                                </div>
                                <div class="col-md-6">
                                    <label for="birthday" class="form-label">Ngày sinh</label>
                                    <input type="date" class="form-control" id="birthday" value="${staff.birthday}" readonly aria-label="Ngày sinh">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="experience" class="form-label">Kinh nghiệm làm việc</label>
                                <input type="text" class="form-control" id="experience" value="${staff.experience}" readonly aria-label="Kinh nghiệm làm việc">
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </main>

        <jsp:include page="/WEB-INF/views/staff/layout/footer.jsp" />
    </div>
</div>

<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
