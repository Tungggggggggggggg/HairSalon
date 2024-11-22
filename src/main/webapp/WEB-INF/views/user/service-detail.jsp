<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>JSalon</title>
    <link rel="icon" href="/user_style/images/logo_icon.png" type="image/icon type">
    <link rel="stylesheet" href="/user_style/css/service-detail.css" />
</head>
<body>
    <jsp:include page="/WEB-INF/views/user/includes/header.jsp" />

    <div class="service-detail-container">
        <h1 class="page-title">Chi tiết dịch vụ</h1>
        <div class="service-detail">
            <div class="service-image-container">
                <img src="/images/service/${service.avatar}" alt="${service.name}" class="service-image" />
            </div>
            <div class="service-info">
                <h2>${service.name}</h2>
                <p class="description">${service.description}</p>
                <p class="price">
                    <strong>Giá:</strong> 
                    <fmt:formatNumber value="${service.price}" pattern="#,###" />đ
                </p>
                <p class="duration">
                    <strong>Thời gian thực hiện:</strong> ${service.durationMinutes} phút
                </p>
                <button class="booking-button" onclick="window.location.href='/home/booking?serviceId=${service.id}';">Đặt lịch ngay</button>

            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/user/includes/contact.jsp" />
    <jsp:include page="/WEB-INF/views/user/includes/footer.jsp" />
</body>
</html>
