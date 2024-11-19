<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Spa-JShop</title>
    <link rel="stylesheet" href="/user_style/css/service-detail.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/user/includes/header.jsp" />

<div class="service-detail-container">
    <h1 class="page-title">Chi tiết nhân viên</h1>
    <div class="service-detail">
        <div class="service-image-container">
            <img src="/user_style/images/${staff.avatar}" alt="${staff.name}" class="service-image" />
        </div>
        <div class="service-info">
            <h2>${staff.name}</h2>
            <p class="description">Email : ${staff.email}</p>
            <p class="price">
<%--                <strong>Giá:</strong>--%>
                <fmt:formatNumber value="${staff.experience}" pattern="#,###" /> Năm kinh nghiệm trong nghề
            </p>
            <p>
                Làm việc với tinh thần nhiệt huyết yêu nghề , đối sử lịch sử với khách hàng và được nhiều khách hàng đánh giá cao trong tời gian làm việc.
            </p>
            <br>
            <p class="duration">
                <strong>SDT: ${staff.phone}</strong>
            </p>
            <button class="booking-button" onclick="window.location.href='/booking?staffId=${staff.id}';">Đặt lịch ngay</button>
            <button class="booking-button" onclick="window.location.href='/home?#top-stylist';">Trở lại trang chủ</button>

        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/user/includes/contact.jsp" />
<jsp:include page="/WEB-INF/views/user/includes/footer.jsp" />
</body>
</html>
