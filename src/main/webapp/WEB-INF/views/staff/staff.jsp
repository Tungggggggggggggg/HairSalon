<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giao Diện Nhân Viên</title>
    <link rel="stylesheet" href="../../../resources/staff/css/staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
</head>
<body>
<header>
    <h1>Giao Diện Nhân Viên</h1>
</header>

<div id="calendar"></div>
<div class="notification"><strong>Thông báo: Có lịch hẹn mới!</strong></div>

<h2 style="text-align: center;">Danh Sách Yêu Cầu Đặt Lịch</h2>

<!-- Ô tìm kiếm và lọc trạng thái -->
<div style="text-align: center; margin-bottom: 20px;">
    <input type="text" id="searchInput" placeholder="Tìm kiếm theo tên khách hàng..." onkeyup="filterTable()">
    <select id="statusFilter" onchange="filterTable()">
        <option value="">Tất cả trạng thái</option>
        <option value="Đang xử lý">Đang xử lý</option>
        <option value="Đã hoàn thành">Đã hoàn thành</option>
        <option value="Đã hủy">Đã hủy</option>
    </select>
</div>


<table>
    <thead>
    <tr>
        <th>Mã yêu cầu</th>
        <th>Tên khách hàng</th>
        <th>Dịch vụ</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody id="requestTableBody">
    <tr>
        <td>001</td>
        <td>Nguyễn Văn A</td>
        <td>Cắt tóc</td>
        <td class="status">Đang xử lý</td>
        <td>
            <button onclick="updateStatus(this)">Cập nhật trạng thái</button>
            <button onclick="acceptOrder(this)">Nhận đơn</button>
            <button onclick="cancelOrder(this)">Hủy đơn</button>
        </td>
    </tr>
    <tr>
        <td>002</td>
        <td>Trần Thị B</td>
        <td>Nhuộm tóc</td>
        <td class="status">Đã hoàn thành</td>
        <td>
            <button onclick="updateStatus(this)">Cập nhật trạng thái</button>
            <button onclick="acceptOrder(this)">Nhận đơn</button>
            <button onclick="cancelOrder(this)">Hủy đơn</button>
        </td>
    </tr>
    <tr>
        <td>003</td>
        <td>Nguyễn Văn C</td>
        <td>Cạo râu</td>
        <td class="status">Đang xử lý</td>
        <td>
            <button onclick="updateStatus(this)">Cập nhật trạng thái</button>
            <button onclick="acceptOrder(this)">Nhận đơn</button>
            <button onclick="cancelOrder(this)">Hủy đơn</button>
        </td>
    </tr>
    </tbody>
</table>


<!-- Hộp thoại chọn thời gian -->
<div id="timePickerDialog" title="Chọn thời gian cho đơn hàng" style="display:none;">
    <label for="orderDate">Ngày:</label>
    <input type="text" id="orderDate" class="datepicker">
    <label for="orderTime">Giờ:</label>
    <input type="time" id="orderTime">
</div>

<footer>
    <p>&copy; 2024 Công ty XYZ. Tất cả quyền lợi được bảo lưu.</p>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
<script src="../../../resources/staff/js/staff.js"></script>
</body>
</html>