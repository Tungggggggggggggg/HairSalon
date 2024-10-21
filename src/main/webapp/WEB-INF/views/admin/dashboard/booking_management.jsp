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
        <title>Quản lý lịch hẹn</title>
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
                        <h1 class="mt-4">Quản lý lịch hẹn</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">Quản lý lịch hẹn</li>
                        </ol>

                        <!-- Nút thêm lịch hẹn -->
                        <div class="mb-4">
                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBookingModal">
                                Thêm lịch hẹn mới
                            </button>
                        </div>

                        <!-- Modal thêm lịch hẹn -->
                        <div class="modal fade" id="addBookingModal" tabindex="-1" aria-labelledby="addBookingModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addBookingModalLabel">Thêm lịch hẹn mới</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addBookingForm">
                                            <div class="mb-3">
                                                <label for="customerName" class="form-label">Tên khách hàng</label>
                                                <input type="text" class="form-control" id="customerName" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="serviceType" class="form-label">Dịch vụ</label>
                                                <select class="form-select" id="serviceType" required>
                                                    <option value="">Chọn dịch vụ</option>
                                                    <option value="Cắt Tóc">Cắt Tóc</option>
                                                    <option value="Gội đầu">Gội đầu</option>
                                                    <option value="Nhuộm tóc">Nhuộm tóc</option>
                                                    <option value="Cạo râu">Cạo râu</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="staff" class="form-label">Nhân viên phục vụ</label>
                                                <input type="text" class="form-control" id="staff" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="bookingTime" class="form-label">Ngày/Giờ</label>
                                                <input type="datetime-local" class="form-control" id="bookingTime" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="status" class="form-label">Trạng thái</label>
                                                <select class="form-select" id="status">
                                                    <option value="pending">Đang chờ xử lý</option>
                                                    <option value="completed">Hoàn thành</option>
                                                    <option value="canceled">Đã hủy</option>
                                                </select>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        <button type="button" class="btn btn-primary" onclick="saveBooking()">Lưu</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Bảng danh sách lịch hẹn với dữ liệu mẫu -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách lịch hẹn
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên khách hàng</th>
                                            <th>Dịch vụ</th>
                                            <th>Nhân viên phục vụ</th>
                                            <th>Ngày/Giờ</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody id="bookingTableBody">
                                        <tr>
                                            <td>1</td>
                                            <td>Nguyễn Văn A</td>
                                            <td>Cắt tóc nam</td>
                                            <td>Trần Văn B</td>
                                            <td>2024-10-21 10:30</td>
                                            <td>Hoàn thành</td>
                                            <td>
                                                <button class="btn btn-sm btn-warning" onclick="editBooking(this)">Sửa</button>
                                                <button class="btn btn-sm btn-danger" onclick="deleteBooking(this)">Xóa</button>
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

            // Hàm để lưu lịch hẹn mới
            function saveBooking() {
                const customerName = document.getElementById('customerName').value;
                const serviceType = document.getElementById('serviceType').value;
                const staff = document.getElementById('staff').value;
                const bookingTime = document.getElementById('bookingTime').value;
                const status = document.getElementById('status').value;

                if (customerName && serviceType && staff && bookingTime && status) {
                    const tableBody = document.getElementById('bookingTableBody');
                    const newRow = document.createElement('tr');

                    newRow.innerHTML = `
                        <td>NEW</td>
                        <td>${customerName}</td>
                        <td>${serviceType}</td>
                        <td>${staff}</td>
                        <td>${bookingTime}</td>
                        <td>${status}</td>
                        <td>
                            <button class="btn btn-sm btn-warning" onclick="editBooking(this)">Sửa</button>
                            <button class="btn btn-sm btn-danger" onclick="deleteBooking(this)">Xóa</button>
                        </td>
                    `;

                    tableBody.appendChild(newRow);

                    document.getElementById('addBookingForm').reset();
                    const modal = bootstrap.Modal.getInstance(document.getElementById('addBookingModal'));
                    modal.hide();
                } else {
                    alert('Vui lòng điền đầy đủ thông tin.');
                }
            }

            // Hàm để chỉnh sửa lịch hẹn
            function editBooking(button) {
                currentEditRow = button.parentElement.parentElement;
                const customerName = currentEditRow.children[1].innerText;
                const serviceType = currentEditRow.children[2].innerText;
                const staff = currentEditRow.children[3].innerText;
                const bookingTime = currentEditRow.children[4].innerText;
                const status = currentEditRow.children[5].innerText;

                document.getElementById('customerName').value = customerName;
                document.getElementById('serviceType').value = serviceType;
                document.getElementById('staff').value = staff;
                document.getElementById('bookingTime').value = bookingTime;
                document.getElementById('status').value = status.toLowerCase();

                const editModal = new bootstrap.Modal(document.getElementById('addBookingModal'));
                editModal.show();
            }

            // Hàm để xóa lịch hẹn
            function deleteBooking(button) {
            const row = button.parentElement.parentElement;
            const confirmation = confirm("Bạn có chắc chắn muốn xóa lịch hẹn này?");
            if (confirmation) {
                row.remove();
            }
        }

        // Cập nhật thông tin lịch hẹn đã chỉnh sửa
        function updateBooking() {
            if (currentEditRow) {
                const customerName = document.getElementById('customerName').value;
                const serviceType = document.getElementById('serviceType').value;
                const staff = document.getElementById('staff').value;
                const bookingTime = document.getElementById('bookingTime').value;
                const status = document.getElementById('status').value;

                currentEditRow.children[1].innerText = customerName;
                currentEditRow.children[2].innerText = serviceType;
                currentEditRow.children[3].innerText = staff;
                currentEditRow.children[4].innerText = bookingTime;
                currentEditRow.children[5].innerText = status;

                const modal = bootstrap.Modal.getInstance(document.getElementById('addBookingModal'));
                modal.hide();
                currentEditRow = null; // Đặt lại giá trị currentEditRow sau khi cập nhật
            } else {
                alert('Không có hàng nào để cập nhật.');
            }
        }

        // Cập nhật hàm lưu lịch hẹn mới
        document.querySelector('.btn-primary').onclick = function() {
            if (currentEditRow) {
                updateBooking();
            } else {
                saveBooking();
            }
        }
    </script>
</body>
</html>