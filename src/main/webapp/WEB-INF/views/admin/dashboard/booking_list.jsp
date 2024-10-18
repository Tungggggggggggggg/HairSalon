<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Danh sách Lịch Đặt</title>
    <link rel="stylesheet" href="giaodien.css">
    <script>
        function goBack() {
            window.history.back(); // Quay lại trang trước
        }

        function filterByStatus() {
            const filterValue = document.getElementById('statusFilter').value;
            const rows = document.querySelectorAll('#bookingList tr');
            rows.forEach(row => {
                const status = row.querySelector('td:nth-child(5)').innerText.trim();
                if (filterValue === 'all' || status === filterValue) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        function updateStatus(id, status) {
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'updateStatus.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    alert('Cập nhật trạng thái thành công!');
                    location.reload(); // Tải lại trang để cập nhật danh sách
                }
            };
            xhr.send(`id=${id}&status=${status}`);
        }

        document.addEventListener('DOMContentLoaded', filterByStatus);
    </script>
</head>

<body>
<div class="container">
    <h1>Danh sách Lịch Đặt</h1>

    <label for="statusFilter">Lọc theo trạng thái:</label>
    <select id="statusFilter" onchange="filterByStatus()">
        <option value="all">Tất cả</option>
        <option value="pending">Đang chờ phê duyệt</option>
        <option value="approved">Đã phê duyệt</option>
        <option value="declined">Đã từ chối</option>
    </select>

    <table>
        <thead>
        <tr>
            <th>Tên khách hàng</th>
            <th>Dịch vụ</th>
            <th>Ngày</th>
            <th>Giờ</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody id="bookingList">
        <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
        // Kết nối tới cơ sở dữ liệu
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=HairSalon;user=sa;password=yourpassword";
        conn = DriverManager.getConnection(dbURL);

        String sql = "SELECT DatLich.dat_lich_id, NguoiDung.ten_dang_nhap, DichVu.ten_dich_vu, DatLich.ngay_gio_dat, DatLich.trang_thai " +
        "FROM DatLich " +
        "JOIN NguoiDung ON DatLich.nguoi_dung_id = NguoiDung.nguoi_dung_id " +
        "JOIN DichVu ON DatLich.dich_vu_id = DichVu.dich_vu_id";

        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        // Duyệt qua các bản ghi và hiển thị chúng
        while (rs.next()) {
        int bookingId = rs.getInt("dat_lich_id");
        String customerName = rs.getString("ten_dang_nhap");
        String serviceName = rs.getString("ten_dich_vu");
        Timestamp bookingTime = rs.getTimestamp("ngay_gio_dat");
        String status = rs.getString("trang_thai");

        // Tách ngày và giờ từ Timestamp
        String date = bookingTime.toLocalDateTime().toLocalDate().toString();
        String time = bookingTime.toLocalDateTime().toLocalTime().toString();

        // In ra HTML cho mỗi hàng
        out.print("<tr>");
            out.print("<td>" + customerName + "</td>");
            out.print("<td>" + serviceName + "</td>");
            out.print("<td>" + date + "</td>");
            out.print("<td>" + time + "</td>");
            out.print("<td>" + (status.equals("Chờ duyệt") ? "Đang chờ phê duyệt" : status.equals("Đã duyệt") ? "Đã phê duyệt" : "Đã từ chối") + "</td>");
            out.print("<td>");
                if (status.equals("Chờ duyệt")) {
                out.print("<button class='approve' onclick=\"updateStatus(" + bookingId + ", 'approved')\">Phê duyệt</button>");
                out.print("<button class='decline' onclick=\"updateStatus(" + bookingId + ", 'declined')\">Từ chối</button>");
                }
                out.print("</td>");
            out.print("</tr>");
        }

        } catch (Exception e) {
        e.printStackTrace();
        } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        %>
        </tbody>
    </table>
    <button class="btn-back" onclick="goBack()">Quay lại</button>
</div>
</body>
</html>

<!-- Xử lý cập nhật trạng thái -->
<%
if (request.getMethod().equalsIgnoreCase("POST")) {
int id = Integer.parseInt(request.getParameter("id"));
String status = request.getParameter("status");

Connection conn = null;
PreparedStatement stmt = null;

try {
// Kết nối tới cơ sở dữ liệu
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=HairSalon;user=sa;password=yourpassword";
conn = DriverManager.getConnection(dbURL);

String updateSql = "UPDATE DatLich SET trang_thai = ? WHERE dat_lich_id = ?";
stmt = conn.prepareStatement(updateSql);
stmt.setString(1, status.equals("approved") ? "Đã duyệt" : "Đã từ chối");
stmt.setInt(2, id);
int rowsUpdated = stmt.executeUpdate();

if (rowsUpdated > 0) {
out.print("{\"success\": true}");
} else {
out.print("{\"success\": false}");
}

} catch (Exception e) {
e.printStackTrace();
out.print("{\"success\": false}");
} finally {
if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}
}
%>
