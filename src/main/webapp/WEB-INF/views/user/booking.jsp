<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đặt Lịch</title>
    <link rel="stylesheet" href="/user_style/css/style.css" />
    <link rel="stylesheet" href="/user_style/css/booking.css" />
    <!-- Flatpickr CSS -->
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"
    />
    <!-- Timepicker CSS -->
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"
    />
</head>
<body>
    <jsp:include page="/WEB-INF/views/user/includes/header.jsp" />
    <div class="booking-container">
        <!-- Left section: Appointment information -->
        <div class="appointment-section">
            <h2>Thông tin lịch hẹn</h2>
            <form:form
                id="bookingForm"
                action="/booking/submit"
                method="POST"
                modelAttribute="booking"
            >
                <div class="appointment-info">
                    <label for="appointmentDate">Ngày hẹn:</label>
                    <form:input
                        type="text"
                        id="appointmentDate"
                        path="date"
                        required="true"
                        placeholder="Chọn ngày"
                    /><br /><br />

                    <label for="appointmentTime">Giờ hẹn:</label>
                    <form:input
                        type="text"
                        id="appointmentTime"
                        path="appointmentTime"
                        required="true"
                        placeholder="Chọn giờ"
                    /><br /><br />

                    <label for="serviceType">Loại dịch vụ:</label>
                    <form:select id="serviceType" path="services" multiple="true" required="true">
                        <c:forEach var="service" items="${services}">
                            <option value="${service.id}" <c:if test="${booking.services.contains(service)}">selected</c:if>>${service.name}</option>
                        </c:forEach>
                    </form:select><br /><br />

                    <label for="stylist">Chọn thợ:</label>
                    <form:select id="stylist" path="staff.id" required="true">
                        <option value="">Chọn thợ</option>
                        <c:forEach var="staff" items="${staffList}">
                            <option value="${staff.id}">${staff.name}</option>
                        </c:forEach>
                    </form:select><br /><br />
                </div>

                <!-- Right section: User information -->
                <div class="user-info-section">
                    <h2>Thông tin cá nhân</h2>
                    
                    <label for="fullName">Họ và tên:</label>
                    <form:input
                        type="text"
                        id="fullName"
                        path="customer.name"
                        required="true"
                        placeholder="Nhập họ và tên"
                    /><br /><br />

                    <label for="phoneNumber">Số điện thoại:</label>
                    <form:input
                        type="tel"
                        id="phoneNumber"
                        path="customer.phone"
                        required="true"
                        placeholder="Nhập số điện thoại"
                    /><br /><br />

                    <label for="email">Email:</label>
                    <form:input
                        type="email"
                        id="email"
                        path="customer.email"
                        placeholder="Nhập email của bạn"
                    /><br /><br />

                    <label for="gender">Giới tính:</label>
                    <form:select id="gender" path="customer.gender">
                        <option value="">Chọn giới tính</option>
                        <option value="Nam">Nam</option>
                        <option value="Nu">Nữ</option>
                        <option value="Khac">Khác</option>
                    </form:select><br /><br />

                    <label for="dateOfBirth">Ngày sinh:</label>
                    <form:input
                        type="text"
                        id="dateOfBirth"
                        path="customer.birthday"
                        placeholder="Chọn ngày sinh"
                    /><br /><br />

                    <label for="address">Địa chỉ:</label>
                    <form:input
                        type="text"
                        id="address"
                        path="customer.address"
                        placeholder="Nhập địa chỉ của bạn"
                    /><br /><br />
                </div>
                
                <!-- Centered Button for Submit -->
                <div class="center-button">
                    <button type="submit" class="submit-button">
                        Đặt lịch ngay
                    </button>
                </div>
            </form:form>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/user/includes/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!-- jQuery and Timepicker JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="/user_style/js/booking.js"></script>
    <script src="/user_style/js/vi.js"></script>
</body>
</html>
