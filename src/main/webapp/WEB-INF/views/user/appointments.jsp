<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch hẹn của bạn</title>
    <link rel="stylesheet" href="/resources/user/css/style.css" />
    <link rel="stylesheet" href="/resources/user/css/auth.css" />
    <link rel="stylesheet" href="/resources/user/css/appointments.css" />
</head>
<body>
    <%@ include file="/WEB-INF/views/user/includes/header.jsp" %>

    <div class="container">
        <h1 class="page-title">Lịch hẹn của bạn</h1>
        <table class="appointments-table">
            <thead>
                <tr>
                    <th>Dịch vụ</th>
                    <th>Ngày giờ</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="appointment" items="${appointments}">
                    <tr>
                        <td>${appointment.service}</td>
                        <td>${appointment.time}</td>
                        <td>${appointment.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <%@ include file="/WEB-INF/views/user/includes/footer.jsp" %>
    <script src="/resources/user/js/appointments.js"></script>
</body>
</html>
