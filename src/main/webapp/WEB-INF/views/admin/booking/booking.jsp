<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*" %>

<html>
<head>
    <title>Đặt lịch hẹn</title>
    <link href="../../../../resources/admin_style/css/giaodien.css" rel="stylesheet" />

</head>

<body>
<div class="container">
    <h2>Đặt lịch hẹn</h2>
    <form id="bookingForm" method="POST" class="form-container">
        <label for="service">Chọn dịch vụ:</label>
        <select id="service" name="service">
            <option value="1">Cắt tóc</option>
            <option value="2">Nhuộm tóc</option>
            <option value="3">Uốn tóc</option>
            <option value="4">Gội đầu</option>
            <option value="5">Duỗi tóc</option>
            <option value="6">Nối tóc</option>
            <option value="7">Phục hồi tóc</option>
        </select>

        <label for="date">Chọn ngày:</label>
        <input type="date" id="date" name="date" required>

        <label for="time">Chọn giờ:</label>
        <input type="time" id="time" name="time" required>

        <label for="customerName">Tên khách hàng:</label>
        <input type="text" id="customerName" name="customerName" placeholder="Nhập tên khách hàng" required>

        <label for="phone">Số điện thoại:</label>
        <input type="tel" id="phone" name="phone" placeholder="Nhập số điện thoại" required>

        <label for="notes">Ghi chú:</label>
        <textarea id="notes" name="notes" placeholder="Yêu cầu đặc biệt (optional)"></textarea>

        <button type="submit" class="btn-submit">Xác nhận đặt lịch</button>
        <button type="button" onclick="showBookingList()">Xem danh sách lịch đặt</button>
    </form>
</div>

<script>
    function showBookingList() {
        window.location.href = 'booking_list.jsp'; // Chuyển hướng đến danh sách lịch đặt
    }
</script>
</body>
</html>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
String customerName = request.getParameter("customerName");
String serviceId = request.getParameter("service");
String date = request.getParameter("date");
String time = request.getParameter("time");
String phone = request.getParameter("phone");
String notes = request.getParameter("notes");

Connection conn = null;
PreparedStatement stmt = null;

try {
// Kết nối cơ sở dữ liệu
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=HairSalon;user=sa;password=yourpassword";
conn = DriverManager.getConnection(dbURL);

// Lấy thông tin thợ cắt tóc ngẫu nhiên (ví dụ chỉ có 2 thợ)
Random random = new Random();
int thoCatId = random.nextInt(2) + 1; // Lấy thợ cắt với ID 1 hoặc 2

// Câu lệnh SQL để thêm đặt lịch vào cơ sở dữ liệu
String sql = "INSERT INTO DatLich (nguoi_dung_id, dich_vu_id, tho_cat_id, ngay_gio_dat, trang_thai) " +
"VALUES ((SELECT nguoi_dung_id FROM NguoiDung WHERE ten_dang_nhap = ?), ?, ?, ?, 'Chờ duyệt')";

stmt = conn.prepareStatement(sql);
stmt.setString(1, customerName);
stmt.setInt(2, Integer.parseInt(serviceId));
stmt.setInt(3, thoCatId);
stmt.setTimestamp(4, Timestamp.valueOf(date + " " + time + ":00"));

// Thực thi truy vấn
int rows = stmt.executeUpdate();

if (rows > 0) {
out.println("<script>alert('Đặt lịch thành công!');</script>");
response.sendRedirect("booking_list.jsp"); // Chuyển hướng đến trang danh sách đặt lịch
} else {
out.println("<script>alert('Đặt lịch thất bại!');</script>");
}
} catch (Exception e) {
e.printStackTrace();
} finally {
if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}
}
%>
