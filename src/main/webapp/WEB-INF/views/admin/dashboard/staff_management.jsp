<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                if (e.target.files && e.target.files[0]) {
                    const imgURL = URL.createObjectURL(e.target.files[0]);
                    $("#avatarPreview").attr("src", imgURL).css({ "display": "block" });
                    avatarFile.on('load', () => URL.revokeObjectURL(imgURL));  // Giải phóng bộ nhớ
                } else {
                    $("#avatarPreview").attr("src", "").css({ "display": "none" });
                }
            });
        });
    </script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Quản lý nhân viên</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Quản lý nhân viên</li>
                </ol>

                <!-- Nút thêm nhân viên mới -->
                <div class="mb-3">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staffModal"
                            onclick="openModal('new')">
                        <i class="fas fa-user-plus"></i> Thêm mới nhân viên
                    </button>
                </div>

                <!-- Bảng danh sách nhân viên -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Danh sách nhân viên
                    </div>
                    <div class="card-body">
                        <table id="staffTable" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Avatar</th>
                                <th>Tên nhân viên</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Chức vụ</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- Dữ liệu nhân viên -->
                            <c:forEach var="staff" items="${staffs}">
                                <tr>
                                    <td>${staff.id}</td>
                                    <td>
                                        <img style="width: 100px; height: 100px;"
                                             src="/images/avatar/${staff.avatar}"
                                             onerror="this.src='/images/avatar/default.png';"
                                             alt="Avatar">
                                    </td>
                                    <td>${staff.name}</td>
                                    <td>${staff.email}</td>
                                    <td>${staff.phone}</td>
                                    <td>${staff.formattedRole}</td> <!-- Sử dụng formattedRole -->

                                    <td>
                                        <button class="btn btn-sm btn-info" data-bs-toggle="modal"
                                                data-bs-target="#detailModal"
                                                onclick="viewDetails('${staff.id}', '${staff.name}', '${staff.email}',  '${staff.phone}', '${staff.address}', '${staff.formattedGender}', '${staff.formattedBirthday}', '${staff.experience}', '${staff.formattedRole}', '${staff.formattedCreatedDate}')">
                                            <i class="fas fa-eye"></i> Chi tiết
                                        </button>
                                        <button class="btn btn-sm btn-warning"
                                                onclick="openModal('edit',
                                                        '${staff.id}',
                                                        '${staff.avatar}',
                                                        '${staff.name}',
                                                        '${staff.email}',
                                                        '${staff.password}',
                                                        '${staff.phone}',
                                                        '${staff.address}',
                                                        '${staff.gender}',
                                                        '${staff.formattedBirthday}',
                                                        '${staff.experience}',
                                                        '${staff.role}')">
                                            <i class="fas fa-edit"></i> Sửa
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger"
                                                onclick="openDeleteModal('${staff.id}', '${staff.name}')">
                                            <i class="fas fa-trash-alt"></i> Xóa
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <!-- Thêm các dữ liệu mẫu khác tương tự... -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>

        <!-- Modal Xem chi tiết nhân viên -->
        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailModalLabel">Chi tiết nhân viên</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Đóng"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>ID:</strong> <span id="detailId"></span></p>
                        <p><strong>Tên nhân viên:</strong> <span id="detailName"></span></p>
                        <p><strong>Email:</strong> <span id="detailEmail"></span></p>
                        <%--                            <p><strong>Mật khẩu:</strong> <span id="detailPassword"></span></p>--%>
                        <p><strong>Số điện thoại:</strong> <span id="detailPhone"></span></p>
                        <p><strong>Địa chỉ:</strong> <span id="detailAddress"></span></p>
                        <p><strong>Giới tính:</strong> <span id="detailGender"></span></p>
                        <p><strong>Năm sinh:</strong> <span id="detailBirthday"></span></p>
                        <p><strong>Kinh nghiệm:</strong> <span id="detailExperience"></span> năm</p>
                        <p><strong>Chức vụ:</strong> <span id="detailRole"></span></p>
                        <p><strong>Ngày bắt đầu làm việc:</strong> <span id="detailCreatedDate"></span></p>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal thêm/sửa nhân viên -->
        <div class="modal fade " id="staffModal" tabindex="-1" aria-labelledby="staffModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-lg ">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staffModalLabel">Thêm mới nhân viên</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Đóng"></button>
                    </div>
                    <div class="modal-body col-12 mx-auto">
                        <form:form id="staffForm" action="/admin/staff_management/save" method="post"
                                   modelAttribute="newStaff" enctype="multipart/form-data">
                            <form:input type="hidden" id="staffId" path="id" />
                            <div class="mb-3 row">
                                <div class="col-12 col-md-6">
                                    <label for="staffName" class="form-label">Tên Nhân viên</label>
                                    <form:input type="text" class="form-control" id="staffName"
                                                path="name" />
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="staffPhone" class="form-label">Số điện thoại</label>
                                    <form:input type="text" class="form-control" id="staffPhone"
                                                path="phone" />
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <div class="col-12 col-md-7">
                                    <label for="staffEmail" class="form-label">Email</label>
                                    <form:input type="email" class="form-control" id="staffEmail"
                                                path="email" />
                                </div>

                                <div class="col-12 col-md-5">
                                    <label for="staffPassword" class="form-label">Mật khẩu</label>
                                    <form:input type="text" class="form-control" id="staffPassword"
                                                path="password" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="staffAddress" class="form-label">Địa chỉ</label>
                                <form:input type="text" class="form-control" id="staffAddress"
                                            path="address" />
                            </div>
                            <div class="mb-3 row">
                                <div class="col-12 col-md-4">
                                    <label for="staffGender" class="form-label">Giới tính</label>
                                    <form:select class="form-select" path="gender" id="staffGender">
                                        <form:option value="Nam">Nam</form:option>
                                        <form:option value="Nu">Nữ</form:option>
                                    </form:select>
                                </div>
                                <div class="col-12 col-md-4">
                                    <label for="staffBirthday" class="form-label">Năm sinh</label>
                                    <form:input type="text" class="form-control" id="staffBirthday" path="birthday" placeholder="dd/MM/yyyy" />
                                </div>

                                <div class="col-12 col-md-4">
                                    <label for="staffExperience" class="form-label">Kinh nghiệm</label>
                                    <form:select class="form-select" path="experience" id="staffExperience">
                                        <form:option value=""> </form:option>
                                        <form:option value="1">1 năm</form:option>
                                        <form:option value="2">2 năm</form:option>
                                        <form:option value="3">3 năm</form:option>
                                        <form:option value="4">4 năm</form:option>
                                        <form:option value="5">5 năm</form:option>
                                        <form:option value="6">6 năm</form:option>
                                        <form:option value="7">7 năm</form:option>
                                        <form:option value="Ẩn">.... năm</form:option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <div class="col-12 col-md-4">
                                    <label for="staffRole" class="form-label">Chức vụ</label>
                                    <form:select class="form-select" path="role" id="staffRole">
                                        <form:option value="NhanVien">Nhân viên</form:option> <!-- Đã chỉnh sửa -->
                                        <form:option value="Admin">Admin</form:option>
                                    </form:select>
                                </div>
                                <div class="col-12 col-md-8">
                                    <label for="avatarFile" class="form-label">Avatar:</label>
                                    <input class="form-control" type="file" id="avatarFile"
                                           accept=".png, .jpg, .jpeg" name="file" />
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <div class="col-12 col-md-4">
                                    <img style="max-height: 100px; display: none;" alt="avatar preview"
                                         id="avatarPreview" />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal xác nhận xóa Nhân viên -->
        <div class="modal fade" id="deleteStaffModal" tabindex="-1"
             aria-labelledby="deleteStaffModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteStaffModalLabel">Xác nhận xóa Nhân viên</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc chắn muốn xóa Nhân viên <strong id="deleteStaffName"></strong>?</p>
                    </div>
                    <div class="modal-footer">
                        <form:form id="deleteStaffForm" action="/admin/staff_management/delete"
                                   method="post" modelAttribute="deleteStaff">
                            <form:hidden path="id" id="deleteStaffId" /> <!-- Thêm id="deleteStaffId" -->
                            <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>
<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
<script src="/admin_style/js/scripts.js"></script>
<!-- Flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />
<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="/admin_style/js/vi.js"></script>
<script src="/admin_style/js/staff_management.js"></script>

</body>

</html>
