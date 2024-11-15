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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="/WEB-INF/views/user/includes/header.jsp" />
    <div class="booking-container">
        <form:form
            id="bookingForm"
            action="/booking/submit"
            method="POST"
            modelAttribute="booking"
        >
            <!-- Bên trái: Thông tin lịch hẹn -->
            <div class="appointment-section">
                <h2>Thông tin lịch hẹn</h2>
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
                <form:select id="serviceType" path="services" multiple="true" required="true" class="form-select">
                    <c:forEach var="service" items="${services}">
                        <option value="${service.id}" 
                            <c:if test="${booking.services.contains(service.id)}">selected</c:if>>
                            ${service.name}
                        </option>
                    </c:forEach>
                </form:select><br /><br />

                <label for="stylist">Chọn nhân viên:</label>
                <form:select id="stylist" path="staff.id"  required="true" class="form-select">
                    <option value="">Chọn nhân viên</option>
                    <c:forEach var="staff" items="${staffList}">
                        <option value="${staff.id}" 
                            <c:if test="${booking.staff != null && booking.staff.id == staff.id}">selected</c:if>>
                            ${staff.name}
                        </option>
                    </c:forEach>
                </form:select><br /><br />
            </div>

            <!-- Bên phải: Thông tin khách hàng -->
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
                <form:select id="gender" path="customer.gender" class="form-select">
                    <option value="">Chọn giới tính</option>
                    <option value="Nam" 
                        <c:if test="${booking.customer.gender == 'Nam'}">selected</c:if>>Nam</option>
                    <option value="Nu" 
                        <c:if test="${booking.customer.gender == 'Nu'}">selected</c:if>>Nữ</option>
                    <option value="Khac" 
                        <c:if test="${booking.customer.gender == 'Khac'}">selected</c:if>>Khác</option>
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
            <!-- Kết thúc các phần của form -->

            <!-- Nút submit nằm trong form -->
            <div class="center-button">
                <button type="button" class="submit-button" data-bs-toggle="modal" data-bs-target="#confirmModal">
                    Đặt lịch ngay
                </button>
            </div>
        </form:form>
    </div>

    <!-- Modal Xác Nhận Đặt Lịch -->
    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Xác nhận đặt lịch</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                </div>
                <div class="modal-body">
                    <h5>Thông tin lịch hẹn</h5>
                    <ul class="list-group">
                        <li class="list-group-item"><strong>Ngày hẹn:</strong> <span id="confirmDate"></span></li>
                        <li class="list-group-item"><strong>Giờ hẹn:</strong> <span id="confirmTime"></span></li>
                        <li class="list-group-item"><strong>Loại dịch vụ:</strong> <span id="confirmServices"></span></li>
                        <li class="list-group-item"><strong>Nhân viên phụ trách:</strong> <span id="confirmStylist"></span></li>
                    </ul>
                    <h5 class="mt-4">Thông tin khách hàng</h5>
                    <ul class="list-group">
                        <li class="list-group-item"><strong>Họ và tên:</strong> <span id="confirmFullName"></span></li>
                        <li class="list-group-item"><strong>Số điện thoại:</strong> <span id="confirmPhone"></span></li>
                        <li class="list-group-item"><strong>Email:</strong> <span id="confirmEmail"></span></li>
                        <li class="list-group-item"><strong>Giới tính:</strong> <span id="confirmGender"></span></li>
                        <li class="list-group-item"><strong>Ngày sinh:</strong> <span id="confirmBirthday"></span></li>
                        <li class="list-group-item"><strong>Địa chỉ:</strong> <span id="confirmAddress"></span></li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-primary" id="confirmSubmit">Xác nhận đặt lịch</button>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/user/includes/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/user_style/js/vi.js"></script>
    <script src="/user_style/js/booking.js"></script>
</body>
</html>
