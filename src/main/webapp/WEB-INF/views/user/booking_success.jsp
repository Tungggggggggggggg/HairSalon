<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>JSalon</title>
    <link rel="icon" href="/user_style/images/logo_icon.png" type="image/icon type">
    <link rel="stylesheet" href="/user_style/css/booking_success.css" />
</head>
<body>
    <jsp:include page="/WEB-INF/views/user/includes/header.jsp" />

    <div class="success-container">
        <h1>Đặt lịch thành công!</h1>
        <p>Cảm ơn bạn đã đặt lịch. Chúng tôi sẽ liên hệ với bạn sớm nhất có thể.</p>
        <a href="/user/service" class="back-button">Quay lại danh sách dịch vụ</a>
    </div>

    <jsp:include page="/WEB-INF/views/user/includes/footer.jsp" />
</body>
</html>
