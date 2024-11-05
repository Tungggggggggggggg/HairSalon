oong<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lịch hẹn của bạn</title>
    <link rel="stylesheet" href="/user_style/css/style.css" />
    <link rel="stylesheet" href="/user_style/css/auth.css" />
    <link rel="stylesheet" href="/user_style/css/appointments.css" />
</head>
<body>
    <jsp:include page="/WEB-INF/views/user/includes/header.jsp" />

    <div class="container">
        <h2>Quản lý lịch hẹn</h2>
        <table id="appointmentTable" class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Tên khách hàng</th>
                    <th>Ngày hẹn</th>
                    <th>Giờ hẹn</th>
                    <th>Dịch vụ</th>
                    <th>Nhân viên</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Sử dụng driver của SQL Server
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        
                        // Chuỗi kết nối tới SQL Server
                        String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=HairSalon;user=sa;password=123";
                        conn = DriverManager.getConnection(dbURL);

                        stmt = conn.createStatement();
                        String sql = "SELECT b.id, u.name AS customer_name, b.booking_date, s.name AS service_name, st.name AS staff_name, b.status " +
                                     "FROM booking b " +
                                     "JOIN users u ON b.customer_id = u.id " +
                                     "JOIN service s ON b.service_id = s.id " +
                                     "JOIN staff st ON b.staff_id = st.id";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("customer_name") %></td>
                                <td><%= rs.getString("booking_date") %></td>
                                <td><%= rs.getString("service_name") %></td>
                                <td><%= rs.getString("staff_name") %></td>
                                <td><%= rs.getString("status") %></td>
                            </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                %>
                    <tr><td colspan="7">Lỗi kết nối cơ sở dữ liệu</td></tr>
                <%
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>
    <jsp:include page="/WEB-INF/views/user/includes/footer.jsp" />

</body>
</html>