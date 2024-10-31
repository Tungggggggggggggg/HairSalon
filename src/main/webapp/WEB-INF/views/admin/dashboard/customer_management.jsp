<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Quản lý khách hàng</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/admin_style/css/styles.css" rel="stylesheet" />
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Quản lý khách hàng</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Quản lý khách hàng</li>
                                </ol>

                                <!-- Nút thêm khách hàng mới -->
                                <div class="mb-3">
                                    <button class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#customerModal" onclick="openModal('new')">
                                        <i class="fas fa-user-plus"></i> Thêm mới khách hàng
                                    </button>
                                </div>

                                <!-- Bảng danh sách khách hàng -->
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table me-1"></i>
                                        Danh sách khách hàng
                                    </div>
                                    <div class="card-body">
                                        <table id="datatablesSimple" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Tên khách hàng</th>
                                                    <th>Email</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Dữ liệu mẫu -->
                                                <c:forEach var="user" items="${users}">
                                                    <tr>
                                                        <td>${user.id}</td>
                                                        <td>${user.name}</td>
                                                        <td>${user.email}</td>
                                                        <td>${user.phone}</td>
                                                        <td>
                                                            <button class="btn btn-sm btn-info" data-bs-toggle="modal"
                                                                data-bs-target="#detailModal"
                                                                onclick="viewDetails('${user.id}', '${user.name}', '${user.email}', '${user.password}', '${user.phone}', '${user.address}', '${user.gender}', '${user.birthday}', '${user.createdDate}')">
                                                                <i class="fas fa-eye"></i> Chi tiết 
                                                            </button>
                                                            <button class="btn btn-sm btn-warning"
                                                                data-bs-toggle="modal" data-bs-target="#customerModal"
                                                                onclick="openModal('edit','${user.id}', '${user.name}', '${user.email}', '${user.password}', '${user.phone}', '${user.address}', '${user.gender}', '${user.birthday}')">
                                                                <i class="fas fa-edit"></i> Sửa
                                                            </button>
                                                            <button type="button" class="btn btn-sm btn-danger"
                                                                onclick="openDeleteModal('${user.id}', '${user.name}')">
                                                                <i class="fas fa-trash-alt"></i> Xóa
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <!-- Thêm dữ liệu mẫu khác... -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <!-- Modal Xem chi tiết khách hàng -->
                        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="detailModalLabel">Chi tiết khách hàng</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Đóng"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p><strong>ID:</strong> <span id="detailId"></span></p>
                                        <p><strong>Tên khách hàng:</strong> <span id="detailName"></span></p>
                                        <p><strong>Email:</strong> <span id="detailEmail"></span></p>
                                        <p><strong>PassWord:</strong> <span id="detailPassword"></span></p>
                                        <p><strong>Số điện thoại:</strong> <span id="detailPhone"></span></p>
                                        <p><strong>Địa chỉ:</strong> <span id="detailAddress"></span></p>
                                        <p><strong>Giới tính:</strong> <span id="detailGender"></span></p>
                                        <p><strong>Năm sinh:</strong> <span id="detailBirthday"></span></p>
                                        <p><strong>Ngày tạo:</strong> <span id="detailCreatedDate"></span></p>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Modal thêm/sửa khách hàng -->
                        <div class="modal fade " id="customerModal" tabindex="-1" aria-labelledby="customerModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-lg ">
                                <div class="modal-content ">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="customerModalLabel">Thêm mới khách hàng</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Đóng"></button>
                                    </div>
                                    <div class="modal-body col-12 mx-auto">
                                        <form:form id="customerForm" action="/admin/customer_management/save"
                                            method="post" modelAttribute="newCustomer">
                                            <form:input type="hidden" id="customerId" path="id" />
                                            <div class="mb-3 row">
                                                <div class="col-12 col-md-6">
                                                    <label for="customerName" class="form-label">Tên khách hàng</label>
                                                    <form:input type="text" class="form-control" id="customerName"
                                                        path="name" />
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <label for="customerPhone" class="form-label">Số điện thoại</label>
                                                    <form:input type="text" class="form-control" id="customerPhone"
                                                        path="phone" />
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-12 col-md-7">
                                                    <label for="customerEmail" class="form-label">Email</label>
                                                    <form:input type="email" class="form-control" id="customerEmail"
                                                        path="email" />
                                                </div>

                                                <div class="col-12 col-md-5">
                                                    <label for="customerPhone" class="form-label">PassWord</label>
                                                    <form:input type="text" class="form-control" id="customerPassword"
                                                        path="password" />
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="customerPhone" class="form-label">Địa chỉ</label>
                                                <form:input type="text" class="form-control" id="customerAddress"
                                                    path="address" />
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-12 col-md-6">
                                                    <label for="customerPhone" class="form-label">Giới tính</label>
                                                    <form:select class="form-select" path="gender" id="customerGender">
                                                        <form:option value="">Trống</form:option>
                                                        <form:option value="Nam">Nam</form:option>
                                                        <form:option value="Nữ">Nữ</form:option>
                                                        <form:option value="Ẩn">Ẩn</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="col-12 col-md-6">
                                                    <label for="customerBirthday" class="form-label">Năm sinh</label>
                                                    <input type="date" class="form-control" id="customerBirthday"
                                                        name="birthday" placeholder="dd-MM-yyyy" />
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

                        <!-- Modal xác nhận xóa khách hàng -->
                        <div class="modal fade" id="deleteCustomerModal" tabindex="-1"
                            aria-labelledby="deleteCustomerModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteCustomerModalLabel">Xác nhận xóa khách hàng
                                        </h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Bạn có chắc chắn muốn xóa khách hàng <strong
                                                id="deleteCustomerName"></strong>?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <form:form id="deleteCustomerForm" action="/admin/customer_management/delete"
                                            method="post" modelAttribute="deleteCustomer">
                                            <form:input type="hidden" id="deleteCustomerId" path="id" />
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
                <script src="/admin_style/js/customer_management.js"></script>
                <script src="/admin_style/js/scripts.js"></script>
            </body>

            </html>