<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Đặt Lịch</title>
                    <link rel="stylesheet" href="/user_style/css/style.css" />
                    <link rel="stylesheet" href="/user_style/css/booking.css" />
                    <!-- Flatpickr CSS -->
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                </head>

                <body>
                    <jsp:include page="/WEB-INF/views/user/includes/header.jsp" />
                    <div class="booking-container">
                        <form:form id="bookingForm" action="/booking/submit" method="POST" modelAttribute="booking">
                            <!-- Bên trái: Thông tin lịch hẹn -->
                            <div class="appointment-section">
                                <h2>Thông tin lịch hẹn</h2>
                                <label for="appointmentDate">Ngày hẹn:</label>
                                <form:input type="text" id="appointmentDate" path="date" required="true"
                                    placeholder="Chọn ngày" /><br /><br />

                                <label for="appointmentTime">Giờ hẹn:</label>
                                <form:input type="text" id="appointmentTime" path="appointmentTime" required="true"
                                    placeholder="Chọn giờ" /><br /><br />

                                <label for="serviceType">Loại dịch vụ:</label>
                                <form:select id="serviceType" path="services" multiple="true" required="true"
                                    class="form-select">
                                    <form:options items="${services}" itemValue="id" itemLabel="name" />
                                </form:select><br /><br />

                                
                                <label for="staff-list">Chọn nhân viên:</label>
                                <div style="position: relative; width: 100%; max-width: 500px; margin: auto; overflow: hidden;">

                                    <button id="scroll-left" type="button"
                                        style="position: absolute; left: 0; top: 50%; transform: translateY(-50%); background: #007bff; color: white; border: none; border-radius: 50%; width: 30px; height: 30px; z-index: 10; cursor: pointer; display: none;">‹</button>
                                    <div id="staff-list"
                                        style="display: flex; gap: 15px; overflow: hidden; padding: 10px;">
                                        <c:forEach var="staff" items="${staffList}">
                                            <div class="staff-card" data-staff-id="${staff.id}" data-name="${staff.name}"
                                                style="flex: 0 0 calc(50% - 10px); text-align: center; cursor: pointer; border: 2px solid transparent; border-radius: 10px; padding: 10px; position: relative; box-sizing: border-box;">

                                                <div class="check-icon"
                                                    style="display: none; position: absolute; top: 5px; right: 5px; background: #007bff; color: white; border-radius: 50%; width: 20px; height: 20px; font-size: 14px; text-align: center; line-height: 20px;">
                                                    ✓
                                                </div>
                                                <img src="/user_style/images/${staff.avatar}" alt="${staff.name}"
                                                    style="width: 200px; height: 200px; border-radius: 10px; object-fit: cover; margin-bottom: 10px;">

                                                <p style="margin: 0; font-size: 14px; font-weight: bold;">${staff.name}
                                                </p>
                                                <input type="hidden" id="name_staff" value="${staff.name}">
                                            </div>
                                            <input type="hidden" id="selected-staff-id" name="staff.id" value="${booking.staff != null ? booking.staff.id : ''}">
                                        </c:forEach>

                                    </div>
                                    
                                    <button id="scroll-right" type="button"
                                        style="position: absolute; right: 0; top: 50%; transform: translateY(-50%); background: #007bff; color: white; border: none; border-radius: 50%; width: 30px; height: 30px; z-index: 10; cursor: pointer; display: none;">›</button>
                                </div>
                                
                                


                            </div>

                            <!-- Bên phải: Thông tin khách hàng -->
                            <div class="user-info-section">
                                <h2>Thông tin cá nhân</h2>
                                <label for="fullName">Họ và tên:</label>
                                <form:input type="text" id="fullName" path="customer.name" required="true"
                                    placeholder="Nhập họ và tên" /><br /><br />

                                <label for="phoneNumber">Số điện thoại:</label>
                                <form:input type="tel" id="phoneNumber" path="customer.phone" required="true"
                                    placeholder="Nhập số điện thoại" /><br /><br />

                                <label for="email">Email:</label>
                                <form:input type="email" id="email" path="customer.email"
                                    placeholder="Nhập email của bạn" /><br /><br />

                                <label for="gender">Giới tính:</label>
                                <form:select id="gender" path="customer.gender" class="form-select">
                                    <option value="">Chọn giới tính</option>
                                    <option value="Nam" <c:if test="${booking.customer.gender == 'Nam'}">selected</c:if>
                                        >Nam</option>
                                    <option value="Nu" <c:if test="${booking.customer.gender == 'Nu'}">selected</c:if>
                                        >Nữ</option>
                                    <option value="Khac" <c:if test="${booking.customer.gender == 'Khac'}">selected
                                        </c:if>>Khác</option>
                                </form:select><br /><br />

                                <label for="dateOfBirth">Ngày sinh:</label>
                                <form:input type="text" id="dateOfBirth" path="customer.birthday"
                                    placeholder="Chọn ngày sinh" /><br /><br />

                                <label for="address">Địa chỉ:</label>
                                <form:input type="text" id="address" path="customer.address"
                                    placeholder="Nhập địa chỉ của bạn" /><br /><br />
                            </div>
                            <!-- Kết thúc các phần của form -->

                            <!-- Nút submit nằm trong form -->
                            <div class="center-button">
                                <button type="button" class="submit-button" data-bs-toggle="modal"
                                    data-bs-target="#confirmModal">
                                    Đặt lịch ngay
                                </button>
                            </div>
                        </form:form>
                    </div>

                    <!-- Modal Xác Nhận Đặt Lịch -->
                    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Xác nhận đặt lịch</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Đóng"></button>
                                </div>
                                <div class="modal-body">
                                    <h5>Thông tin lịch hẹn</h5>
                                    <ul class="list-group">
                                        <li class="list-group-item"><strong>Ngày hẹn:</strong> <span
                                                id="confirmDate"></span></li>
                                        <li class="list-group-item"><strong>Giờ hẹn:</strong> <span
                                                id="confirmTime"></span></li>
                                        <li class="list-group-item"><strong>Loại dịch vụ:</strong> <span
                                                id="confirmServices"></span></li>
                                        <li class="list-group-item"><strong>Nhân viên phụ trách:</strong> <span
                                                id="confirmStylist"></span></li>
                                    </ul>
                                    <h5 class="mt-4">Thông tin khách hàng</h5>
                                    <ul class="list-group">
                                        <li class="list-group-item"><strong>Họ và tên:</strong> <span
                                                id="confirmFullName"></span></li>
                                        <li class="list-group-item"><strong>Số điện thoại:</strong> <span
                                                id="confirmPhone"></span></li>
                                        <li class="list-group-item"><strong>Email:</strong> <span
                                                id="confirmEmail"></span></li>
                                        <li class="list-group-item"><strong>Giới tính:</strong> <span
                                                id="confirmGender"></span></li>
                                        <li class="list-group-item"><strong>Ngày sinh:</strong> <span
                                                id="confirmBirthday"></span></li>
                                        <li class="list-group-item"><strong>Địa chỉ:</strong> <span
                                                id="confirmAddress"></span></li>
                                    </ul>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="button" class="btn btn-primary" id="confirmSubmit">Xác nhận đặt
                                        lịch</button>
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