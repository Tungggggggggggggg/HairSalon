<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Danh sách dịch vụ</title>
        <link rel="stylesheet" href="/user_style/css/service.css" />
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/user/includes/header.jsp" />

        <div class="services-container">
            <h1>Danh sách các dịch vụ của chúng tôi</h1>
            <div class="services-list">
                <c:forEach var="service" items="${services}">
                    <div class="service-detail">
                        <div class="image-container">
                            <img
                                src="/images/service/${service.avatar}"
                                alt="${service.name}"
                                class="service-image"
                            />
                        </div>
                        <div class="service-content">
                            <h2>${service.name}</h2>
                            <p>${service.description}</p>
                            <p>
                                <strong>Giá:</strong>
                                <fmt:formatNumber
                                    value="${service.price}"
                                    pattern="#,###"
                                />đ
                            </p>
                            <p>
                                <strong>Thời gian thực hiện:</strong>
                                ${service.durationMinutes} phút
                            </p>
                            <button
                                class="booking-button"
                                onclick="window.location.href='/booking?serviceId=${service.id}';"
                            >
                                Đặt lịch
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/user/includes/contact.jsp" />
        <jsp:include page="/WEB-INF/views/user/includes/footer.jsp" />
    </body>
</html>
