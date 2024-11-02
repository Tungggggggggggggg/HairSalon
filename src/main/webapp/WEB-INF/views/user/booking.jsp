<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Lịch</title>
    <link rel="stylesheet" href="/user_style/css/style.css">
    <link rel="stylesheet" href="/user_style/css/booking.css">
    <!-- Flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!-- Timepicker CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/user/includes/header.jsp" />
    <div class="booking-container">
        <!-- Left section: Appointment information -->
        <div class="appointment-section">
            <h2>Thông tin lịch hẹn</h2>
            <form id="appointmentForm" action="submit_appointment" method="POST">
                <label for="appointmentDate">Ngày hẹn:</label>
                <input type="text" id="appointmentDate" name="appointmentDate" required placeholder="Chọn ngày"><br><br>
    
                <label for="appointmentTime">Giờ hẹn:</label>
                <input type="text" id="appointmentTime" name="appointmentTime" required placeholder="Chọn giờ"><br><br>
    
                <label for="serviceType">Loại dịch vụ:</label>
                <select id="serviceType" name="serviceType" required>
                    <option value="haircut">Cắt tóc</option>
                    <option value="hairwash">Gội đầu</option>
                    <option value="dye">Nhuộm tóc</option>
                    <option value="perm">Uốn tóc</option>
                </select><br><br>
    
                <label for="stylist">Chọn thợ:</label>
                <select id="stylist" name="stylist" required>
                    <option value="stylist1">Thợ 1</option>
                    <option value="stylist2">Thợ 2</option>
                </select><br><br>
    
                <label for="notes">Ghi chú thêm:</label>
                <input type="text" id="notes" name="notes" placeholder="Ghi chú cho cuộc hẹn của bạn...">
            </form>
        </div>
    
        <!-- Right section: User information -->
        <div class="user-info-section">
            <h2>Thông tin cá nhân</h2>
            <form id="userInfoForm" action="submit_user_info" method="POST">
                <label for="fullName">Họ và tên:</label>
                <input type="text" id="fullName" name="fullName" required placeholder="Nhập họ và tên"><br><br>
    
                <label for="phoneNumber">Số điện thoại:</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" required placeholder="Nhập số điện thoại"><br><br>
    
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Nhập email của bạn"><br><br>
    
                <label for="gender">Giới tính:</label>
                <select id="gender" name="gender">
                    <option value="male">Nam</option>
                    <option value="female">Nữ</option>
                    <option value="other">Khác</option>
                </select><br><br>
    
                <label for="dateOfBirth">Ngày sinh:</label>
                <input type="text" id="dateOfBirth" name="dateOfBirth" placeholder="Chọn ngày sinh"><br><br>
    
                <label for="address">Địa chỉ:</label>
                <input type="text" id="address" name="address" placeholder="Nhập địa chỉ của bạn"><br><br>
            </form>
        </div>
    </div>
    <!-- Centered Button for Submit -->
    <div class="center-button">
        <button type="submit" form="appointmentForm" class="submit-button">Đặt lịch</button>
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
