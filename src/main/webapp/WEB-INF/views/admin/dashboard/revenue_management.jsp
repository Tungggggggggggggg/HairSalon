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
        <title>Quản lý doanh thu</title>
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
        <!-- Thư viện cho export Excel -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
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
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">Quản lý doanh thu</li>
                        </ol>

                        <!-- Thống kê doanh thu -->
                        <div class="row mb-4">
                            <div class="col-md-4">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">
                                        <h5>Doanh thu hôm nay</h5>
                                        <h3 id="todayRevenue">0 VND</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h5>Doanh thu tháng</h5>
                                        <h3 id="monthRevenue">0 VND</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card bg-info text-white mb-4">
                                    <div class="card-body">
                                        <h5>Tổng giao dịch</h5>
                                        <h3 id="totalTransactions">0</h3>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Bảng giao dịch chi tiết -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Danh sách giao dịch
                            </div>
                            <div class="card-body">
                                <table id="revenueTable" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID giao dịch</th>
                                            <th>Tên khách hàng</th>
                                            <th>Dịch vụ</th>
                                            <th>Nhân viên phục vụ</th>
                                            <th>Ngày/Giờ</th>
                                            <th>Tổng tiền (VND)</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody id="revenueTableBody">
                                        <tr>
                                            <td>1</td>
                                            <td>Nguyễn Văn A</td>
                                            <td>Cắt tóc</td>
                                            <td>Trần Văn C</td>
                                            <td>2024-10-20 10:30</td>
                                            <td>300,000</td>
                                            <td>
                                                <button class="btn btn-sm btn-primary" onclick="viewTransactionDetails(this)">Xem</button>
                                                <button class="btn btn-sm btn-danger" onclick="deleteTransaction(this)">Xóa</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Trần Thị B</td>
                                            <td>Cắt tóc</td>
                                            <td>Nguyễn Thị D</td>
                                            <td>2024-10-21 15:00</td>
                                            <td>500,000</td>
                                            <td>
                                                <button class="btn btn-sm btn-primary" onclick="viewTransactionDetails(this)">Xem</button>
                                                <button class="btn btn-sm btn-danger" onclick="deleteTransaction(this)">Xóa</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Modal chi tiết giao dịch -->
                        <div class="modal fade" id="transactionDetailsModal" tabindex="-1" aria-labelledby="transactionDetailsLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="transactionDetailsLabel">Chi tiết giao dịch</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p><strong>ID giao dịch:</strong> <span id="transactionId"></span></p>
                                        <p><strong>Tên khách hàng:</strong> <span id="customerName"></span></p>
                                        <p><strong>Dịch vụ:</strong> <span id="serviceType"></span></p>
                                        <p><strong>Nhân viên phục vụ:</strong> <span id="staffName"></span></p>
                                        <p><strong>Ngày/Giờ:</strong> <span id="bookingTime"></span></p>
                                        <p><strong>Tổng tiền:</strong> <span id="totalAmount"></span></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Xuất dữ liệu -->
                        <div class="mb-4">
                            <button class="btn btn-success" onclick="exportToExcel()">Xuất ra Excel</button>
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
            document.addEventListener('DOMContentLoaded', function () {
                calculateRevenue();
            });

            // Hàm để tính toán doanh thu và cập nhật hiển thị
            function calculateRevenue() {
                let totalRevenueToday = 0;
                let totalRevenueMonth = 0;
                let totalTransactions = 0;

                const currentDate = new Date().toISOString().split('T')[0];
                const currentMonth = new Date().toISOString().split('-').slice(0, 2).join('-');

                document.querySelectorAll('#revenueTableBody tr').forEach(function(row) {
                    const date = row.children[4].innerText.split(' ')[0];
                    const amount = parseInt(row.children[5].innerText.replace(/,/g, ''), 10);

                    if (date === currentDate) {
                        totalRevenueToday += amount;
                    }

                    if (date.startsWith(currentMonth)) {
                        totalRevenueMonth += amount;
                    }

                    totalTransactions++;
                });

                document.getElementById('todayRevenue').innerText = totalRevenueToday.toLocaleString('vi-VN') + ' VND';
                document.getElementById('monthRevenue').innerText = totalRevenueMonth.toLocaleString('vi-VN') + ' VND';
                document.getElementById('totalTransactions').innerText = totalTransactions;
            }

            // Hàm để hiển thị chi tiết giao dịch
            function viewTransactionDetails(button) {
                const row = button.parentElement.parentElement;
                const transactionId = row.children[0].innerText;
                const customerName = row.children[1].innerText;
                const serviceType = row.children[2].innerText;
                const staffName = row.children[3].innerText;
                const bookingTime = row.children[4].innerText;
                const totalAmount = row.children[5].innerText;

                document.getElementById('transactionId').innerText = transactionId;
                document.getElementById('customerName').innerText = customerName;
                document.getElementById('serviceType').innerText = serviceType;
                document.getElementById('staffName').innerText = staffName;
                document.getElementById('bookingTime').innerText = bookingTime;
                document.getElementById('totalAmount').innerText = totalAmount;

                const modal = new bootstrap.Modal(document.getElementById('transactionDetailsModal'));
                modal.show();
            }

            // Hàm để xóa giao dịch
            function deleteTransaction(button) {
                const row = button.parentElement.parentElement;
                row.remove();
                calculateRevenue(); // Cập nhật doanh thu sau khi xóa
            }

            // Hàm để xuất dữ liệu ra Excel
            function exportToExcel() {
                const table = document.getElementById('revenueTable');
                const workbook = XLSX.utils.table_to_book(table, {sheet: "Doanh thu"});
                XLSX.writeFile(workbook, 'Doanh_thu.xlsx');
            }
        </script>
    </body>
</html>
