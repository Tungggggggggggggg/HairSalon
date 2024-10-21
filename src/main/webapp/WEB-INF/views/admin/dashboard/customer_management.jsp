<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
        <title>Quản lý khách hàng</title>
        <link
            href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
            rel="stylesheet"
        />
        <link
            href="../../../../resources/admin/css/styles.css"
            rel="stylesheet"
        />
        <script
            src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
            crossorigin="anonymous"
        ></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">Quản lý khách hàng</li>
                        </ol>

                        <!-- Nút thêm khách hàng -->
                        <div class="mb-4">
                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCustomerModal">
                                Thêm khách hàng mới
                            </button>
                        </div>

                        <!-- Modal thêm khách hàng -->
                        <div class="modal fade" id="addCustomerModal" tabindex="-1" aria-labelledby="addCustomerModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addCustomerModalLabel">Thêm khách hàng mới</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addCustomerForm">
                                            <div class="mb-3">
                                                <label for="customerName" class="form-label">Tên khách hàng</label>
                                                <input type="text" class="form-control" id="customerName" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="customerEmail" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="customerEmail" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="customerPhone" class="form-label">Số điện thoại</label>
                                                <input type="text" class="form-control" id="customerPhone" required>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        <button type="button" class="btn btn-primary" onclick="saveCustomer()">Lưu</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal sửa khách hàng -->
                        <div class="modal fade" id="editCustomerModal" tabindex="-1" aria-labelledby="editCustomerModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editCustomerModalLabel">Sửa thông tin khách hàng</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="editCustomerForm">
                                            <div class="mb-3">
                                                <label for="editCustomerName" class="form-label">Tên khách hàng</label>
                                                <input type="text" class="form-control" id="editCustomerName" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="editCustomerEmail" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="editCustomerEmail" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="editCustomerPhone" class="form-label">Số điện thoại</label>
                                                <input type="text" class="form-control" id="editCustomerPhone" required>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        <button type="button" class="btn btn-primary" onclick="updateCustomer()">Cập nhật</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Bảng danh sách khách hàng với dữ liệu mẫu -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách khách hàng
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên khách hàng</th>
                                            <th>Email</th>
                                            <th>Số điện thoại</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody id="customerTableBody">
                                        <tr>
                                            <td>1</td>
                                            <td>Khách hàng 1</td>
                                            <td>a@gmail.com</td>
                                            <td>0123456789</td>
                                            <td>
                                                <button class="btn btn-sm btn-warning" onclick="editCustomer(this)">Sửa</button>
                                                <button class="btn btn-sm btn-danger" onclick="deleteCustomer(this)">Xóa</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Khách hàng 2</td>
                                            <td>b@gmail.com</td>
                                            <td>0123456789</td>
                                            <td>
                                                <button class="btn btn-sm btn-warning" onclick="editCustomer(this)">Sửa</button>
                                                <button class="btn btn-sm btn-danger" onclick="deleteCustomer(this)">Xóa</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Khách hàng 3</td>
                                            <td>c@gmail.com</td>
                                            <td>0123456789</td>
                                            <td>
                                                <button class="btn btn-sm btn-warning" onclick="editCustomer(this)">Sửa</button>
                                                <button class="btn btn-sm btn-danger" onclick="deleteCustomer(this)">Xóa</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../../../../resources/admin/js/datatables-simple-demo.js"></script>

        <script>
            let currentEditRow = null;

            // Hàm để lưu khách hàng mới
            function saveCustomer() {
                const name = document.getElementById('customerName').value;
                const email = document.getElementById('customerEmail').value;
                const phone = document.getElementById('customerPhone').value;

                if (name && email && phone) {
                    const tableBody = document.getElementById('customerTableBody');
                    const newRow = document.createElement('tr');

                    newRow.innerHTML = `
                        <td>NEW</td>
                        <td>${name}</td>
                        <td>${email}</td>
                        <td>${phone}</td>
                        <td>
                            <button class="btn btn-sm btn-warning" onclick="editCustomer(this)">Sửa</button>
                            <button class="btn btn-sm btn-danger" onclick="deleteCustomer(this)">Xóa</button>
                        </td>
                    `;

                    tableBody.appendChild(newRow);

                    document.getElementById('addCustomerForm').reset();
                    const modal = bootstrap.Modal.getInstance(document.getElementById('addCustomerModal'));
                    modal.hide();
                } else {
                    alert('Vui lòng điền đầy đủ thông tin.');
                }
            }

            // Hàm để chỉnh sửa khách hàng
            function editCustomer(button) {
                currentEditRow = button.parentElement.parentElement;
                const name = currentEditRow.children[1].innerText;
                const email = currentEditRow.children[2].innerText;
                const phone = currentEditRow.children[3].innerText;

                document.getElementById('editCustomerName').value = name;
                document.getElementById('editCustomerEmail').value = email;
                document.getElementById('editCustomerPhone').value = phone;

                const editModal = new bootstrap.Modal(document.getElementById('editCustomerModal'));
                editModal.show();
            }

            // Hàm để cập nhật thông tin khách hàng
            function updateCustomer() {
                const name = document.getElementById('editCustomerName').value;
                const email = document.getElementById('editCustomerEmail').value;
                const phone = document.getElementById('editCustomerPhone').value;

                if (currentEditRow) {
                    currentEditRow.children[1].innerText = name;
                    currentEditRow.children[2].innerText = email;
                    currentEditRow.children[3].innerText = phone;

                    const modal = bootstrap.Modal.getInstance(document.getElementById('editCustomerModal'));
                    modal.hide();
                } else {
                    alert('Có lỗi xảy ra.');
                }
            }

            // Hàm để xóa khách hàng
            function deleteCustomer(button) {
                const row = button.parentElement.parentElement;
                row.remove();
            }
        </script>
    </body>
</html>
