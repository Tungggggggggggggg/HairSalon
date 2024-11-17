<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Quản lý dịch vụ</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/admin_style/css/styles.css" rel="stylesheet" />
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL).css({ "display": "block" });
                            avatarFile.on('load', () => URL.revokeObjectURL(imgURL));  // Giải phóng bộ nhớ
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
                                <h1 class="mt-4">Quản lý dịch vụ</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Quản lý dịch vụ</li>
                                </ol>

                                <!-- Nút thêm dịch vụ mới -->
                                <div class="mb-3">
                                    <button class="btn btn-primary" data-bs-toggle="modal"
                                        data-bs-target="#serviceModal" onclick="openServiceModal('new')">
                                        <i class="fas fa-plus-circle"></i> Thêm mới dịch vụ
                                    </button>
                                </div>

                                <!-- Bảng danh sách dịch vụ -->
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table me-1"></i>
                                        Danh sách dịch vụ
                                    </div>
                                    <div class="card-body">
                                        <table id="serviceTable" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Avatar</th>
                                                    <th>Tên dịch vụ</th>
                                                    <th>Giá (VNĐ)</th>
                                                    <th>Thời gian (phút)</th>
                                                    <th>Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Dữ liệu mẫu -->
                                                <c:forEach var="service" items="${services}">
                                                    <tr>
                                                        <td>${service.id} </td>
                                                        <td><img style="width: 100px; height: 100px;" src="/images/service/${service.avatar}" onerror="this.src='/images/service/default.jpg';" alt="Avatar"></td>
                                                        <td>${service.name}</td>
                                                        <td>${service.price}</td>
                                                        <td>${service.durationMinutes}</td>
                                                        <td>
                                                            <button class="btn btn-sm btn-info" data-bs-toggle="modal"
                                                                data-bs-target="#detailModal"
                                                                onclick="viewDetails('${service.id}', '${service.name}', '${service.description}', '${service.price}', '${service.durationMinutes}')">
                                                                <i class="fas fa-eye"></i> Chi tiết
                                                            </button>
                                                            <button class="btn btn-sm btn-warning"
                                                                data-bs-toggle="modal" data-bs-target="#serviceModal"
                                                                onclick="openServiceModal('edit','${service.id}', '${service.name}', '${service.description}', '${service.price}', '${service.durationMinutes}')">
                                                                <i class="fas fa-edit"></i> Sửa
                                                            </button>
                                                            <button type="button" class="btn btn-sm btn-danger"
                                                                onclick="openDeleteModal('${service.id}', '${service.name}')">
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

                        <!-- Modal Xem chi tiết dịch vụ -->
                        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="detailModalLabel">Chi tiết dịch vụ <span
                                                id="detailName1"></span></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Đóng"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p><strong>ID:</strong> <span id="detailId"></span></p>
                                        <p><strong>Tên dịch vụ:</strong> <span id="detailName"></span></p>
                                        <p><strong>Mô tả chi tiết:</strong> <span id="detailDescription"></span></p>
                                        <p><strong>Giá:</strong> <span id="detailPrice"></span></p>
                                        <p><strong>Thời gian hoàn thành:</strong> <span
                                                id="detailDurationMinutes"></span></p>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal thêm/sửa dịch vụ -->
                        <div class="modal fade" id="serviceModal" tabindex="-1" aria-labelledby="serviceModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="serviceModalLabel">Thêm mới dịch vụ</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Đóng"></button>
                                    </div>
                                    <div class="modal-body col-12 mx-auto">
                                        <form:form id="serviceForm" action="/admin/service_management/save" method="post"
                                            modelAttribute="newService" enctype="multipart/form-data">
                                            <form:input type="hidden" id="serviceId" name="id" path="id" />
                                            <div class="mb-3 ">
                                                <label for="serviceName" class="form-label">Tên dịch vụ</label>
                                                <form:input type="text" class="form-control" id="serviceName"
                                                    name="name" path="name" />
                                            </div>
                                            <div class="mb-3 ">
                                                <label for="servicePrice" class="form-label">Mô tả chi tiết</label>
                                                <form:textarea rows="3" class="form-control" id="serviceDescription"
                                                    name="description" path="description"></form:textarea>
                                            </div>
                                            <div class="mb-3 ">
                                                <label for="servicePrice" class="form-label">Giá (VNĐ)</label>
                                                <form:input type="number" class="form-control" id="servicePrice"
                                                    name="price" path="price" />
                                            </div>
                                            <div class="mb-3 ">
                                                <label for="serviceDurationMinutes" class="form-label">Thời gian (phút)</label>
                                                <form:input type="number" class="form-control" id="serviceDurationMinutes"
                                                    path="durationMinutes" name="durationMinutes" />
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-12 col-md-8">
                                                    <label for="avatarFile" class="form-label">Avatar:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                           accept=".png, .jpg, .jpeg" name="file" />
                                                </div>
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


                        <!-- Modal xác nhận xóa khách hàng -->
                        <div class="modal fade" id="deleteServiceModal" tabindex="-1"
                            aria-labelledby="deleteServiceModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteServiceModalLabel">Xác nhận xóa dịch vụ
                                        </h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Bạn có chắc chắn muốn xóa dịch vụ  <strong
                                                id="deleteServiceName"></strong>?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <form:form id="deleteServiceForm" action="/admin/service_management/delete"
                                            method="post" modelAttribute="deleteService">
                                            <form:input type="hidden" id="deleteServiceId" path="id" />
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
                <script src="/admin_style/js/service_management.js"></script>
                <script src="/admin_style/js/scripts.js"></script>
            </body>

            </html>