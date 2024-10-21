<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
        <title>Quản lý nhân viên</title>
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
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        />
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
                            <li class="breadcrumb-item">
                                <a href="/admin">Dashboard</a>
                            </li>
                            <li class="breadcrumb-item active">
                                Quản lý nhân viên
                            </li>
                        </ol>

                        <!-- Nút thêm nhân viên -->
                        <div class="mb-4">
                            <button
                                class="btn btn-primary"
                                data-bs-toggle="modal"
                                data-bs-target="#addStaffModal"
                            >
                                Thêm nhân viên mới
                            </button>
                        </div>

                        <!-- Modal thêm nhân viên -->
                        <div
                            class="modal fade"
                            id="addStaffModal"
                            tabindex="-1"
                            aria-labelledby="addStaffModalLabel"
                            aria-hidden="true"
                        >
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5
                                            class="modal-title"
                                            id="addStaffModalLabel"
                                        >
                                            Thêm nhân viên mới
                                        </h5>
                                        <button
                                            type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"
                                        ></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addStaffForm">
                                            <div class="mb-3">
                                                <label
                                                    for="staffName"
                                                    class="form-label"
                                                    >Tên nhân viên</label
                                                >
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    id="staffName"
                                                    required
                                                />
                                            </div>
                                            <div class="mb-3">
                                                <label
                                                    for="staffRole"
                                                    class="form-label"
                                                    >Chức vụ</label
                                                >
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    id="staffRole"
                                                    required
                                                />
                                            </div>
                                            <div class="mb-3">
                                                <label
                                                    for="staffPhone"
                                                    class="form-label"
                                                    >Số điện thoại</label
                                                >
                                                <input
                                                    type="tel"
                                                    class="form-control"
                                                    id="staffPhone"
                                                    required
                                                />
                                            </div>
                                            <div class="mb-3">
                                                <label
                                                    for="staffEmail"
                                                    class="form-label"
                                                    >Email</label
                                                >
                                                <input
                                                    type="email"
                                                    class="form-control"
                                                    id="staffEmail"
                                                    required
                                                />
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button
                                            type="button"
                                            class="btn btn-secondary"
                                            data-bs-dismiss="modal"
                                        >
                                            Hủy
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            onclick="saveStaff()"
                                        >
                                            Lưu
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Bảng danh sách nhân viên -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách nhân viên
                            </div>
                            <div class="card-body">
                                <table
                                    id="datatablesSimple"
                                    class="table table-bordered"
                                >
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên nhân viên</th>
                                            <th>Chức vụ</th>
                                            <th>Số điện thoại</th>
                                            <th>Email</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody id="staffTableBody">
                                        <tr>
                                            <td>1</td>
                                            <td>Nguyễn Văn A</td>
                                            <td>Nhân viên cắt tóc</td>
                                            <td>0901234567</td>
                                            <td>nguyenvana@example.com</td>
                                            <td>
                                                <button
                                                    class="btn btn-sm btn-warning"
                                                    onclick="editStaff(this)"
                                                >
                                                    Sửa
                                                </button>
                                                <button
                                                    class="btn btn-sm btn-danger"
                                                    onclick="deleteStaff(this)"
                                                >
                                                    Xóa
                                                </button>
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

            // Hàm để lưu nhân viên mới
            function saveStaff() {
                const staffName = document.getElementById("staffName").value;
                const staffRole = document.getElementById("staffRole").value;
                const staffPhone = document.getElementById("staffPhone").value;
                const staffEmail = document.getElementById("staffEmail").value;

                if (staffName && staffRole && staffPhone && staffEmail) {
                    const tableBody = document.getElementById("staffTableBody");
                    const newRow = document.createElement("tr");

                    newRow.innerHTML = `
                        <td>NEW</td>
                        <td>${staffName}</td>
                        <td>${staffRole}</td>
                        <td>${staffPhone}</td>
                        <td>${staffEmail}</td>
                        <td>
                            <button class="btn btn-sm btn-warning" onclick="editStaff(this)">Sửa</button>
                            <button class="btn btn-sm btn-danger" onclick="deleteStaff(this)">Xóa</button>
                        </td>
                    `;

                    tableBody.appendChild(newRow);

                    document.getElementById("addStaffForm").reset();
                    const modal = bootstrap.Modal.getInstance(
                        document.getElementById("addStaffModal")
                    );
                    modal.hide();
                } else {
                    alert("Vui lòng điền đầy đủ thông tin.");
                }
            }

            // Hàm để chỉnh sửa thông tin nhân viên
            function editStaff(button) {
                currentEditRow = button.parentElement.parentElement;
                const staffName = currentEditRow.children[1].innerText;
                const staffRole = currentEditRow.children[2].innerText;
                const staffPhone = currentEditRow.children[3].innerText;
                const staffEmail = currentEditRow.children[4].innerText;

                document.getElementById("staffName").value = staffName;
                document.getElementById("staffRole").value = staffRole;
                document.getElementById("staffPhone").value = staffPhone;
                document.getElementById("staffEmail").value = staffEmail;

                const editModal = new bootstrap.Modal(
                    document.getElementById("addStaffModal")
                );
                editModal.show();
            }

            // Hàm để xóa nhân viên
            function deleteStaff(button) {
                const row = button.parentElement.parentElement;
                const confirmation = confirm(
                    "Bạn có chắc chắn muốn xóa nhân viên này?"
                );
                if (confirmation) {
                    row.remove();
                }
            }

            // Cập nhật thông tin nhân viên đã chỉnh sửa
            function updateStaff() {
                if (currentEditRow) {
                    const staffName =
                        document.getElementById("staffName").value;
                    const staffRole =
                        document.getElementById("staffRole").value;
                    const staffPhone =
                        document.getElementById("staffPhone").value;
                    const staffEmail =
                        document.getElementById("staffEmail").value;

                    currentEditRow.children[1].innerText = staffName;
                    currentEditRow.children[2].innerText = staffRole;
                    currentEditRow.children[3].innerText = staffPhone;
                    currentEditRow.children[4].innerText = staffEmail;

                    const modal = bootstrap.Modal.getInstance(
                        document.getElementById("addStaffModal")
                    );
                    modal.hide();
                    currentEditRow = null; // Đặt lại giá trị currentEditRow sau khi cập nhật
                } else {
                    alert("Khôngcó hàng nào để cập nhật.");
                }
            } // Cập nhật hàm lưu nhân viên mới
            document.querySelector(".btn-primary").onclick = function () {
                if (currentEditRow) {
                    updateStaff();
                } else {
                    saveStaff();
                }
            };
        </script>
    </body>
</html>
