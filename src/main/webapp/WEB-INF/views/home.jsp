<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSalon - Trang Chủ</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
    <link rel="stylesheet" href="css/style.css"> 
</head>

<body>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<section class="banner">
    <h1>Chào mừng đến với JSalon</h1>
    <p>Tìm kiếm, đặt lịch và trải nghiệm dịch vụ chăm sóc tóc dễ dàng và thuận tiện.</p>

    <button id="openBookingModal" onclick="showScheduleModal()">Đặt Lịch Ngay</button>
</section>

<!-- Modal Đặt lịch ngay -->
<div id="scheduleModal" class="modal-booking">
    <div class="modal-content-booking">
        <span class="close-booking" onclick="closeModal('scheduleModal')">&times;</span>
        <h2>Đặt Lịch Ngay</h2>
        <form action="/schedule" method="post">
            <div>
                <label for="date">Chọn Ngày</label>
                <input type="text" id="datePicker" name="date" placeholder="dd/MM/yyyy" required> 
            </div>
            <div>
                <label for="time">Chọn Giờ</label>
                <input type="time" id="time" name="time" required>
            </div>
            <div>
                <label for="service">Dịch Vụ</label>
                <select id="service" name="service">
                    <option value="haircut">Cắt Tóc</option>
                    <option value="shave">Cạo Râu</option>
                    <option value="color">Nhuộm Tóc</option>
                </select>
            </div>
            <button type="submit">Đặt Lịch</button>
        </form>
    </div>
</div>

<!-- JavaScript cho Modal và Datepicker -->
<script>
    $(document).ready(function() {
        // Khởi tạo Datepicker cho ô nhập ngày với định dạng dd/MM/yyyy
        $("#datePicker").datepicker({
            dateFormat: "dd/mm/yy", // Định dạng ngày tháng là ngày/tháng/năm
            changeMonth: true, // Cho phép chọn tháng
            changeYear: true,  // Cho phép chọn năm
            yearRange: "1900:2100" // Phạm vi năm có thể chọn
        });

        // Đặt giá trị mặc định cho Datepicker là ngày hiện tại
        var today = new Date();
        var formattedDate = ('0' + today.getDate()).slice(-2) + '/' + ('0' + (today.getMonth() + 1)).slice(-2) + '/' + today.getFullYear(); // Định dạng dd/MM/yyyy
        $("#datePicker").val(formattedDate); // Gán giá trị mặc định cho input
    });

    // Hiển thị modal Đặt lịch ngay
    function showScheduleModal() {
        document.getElementById('scheduleModal').style.display = 'block';
    }

    // Đóng modal
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }

    // Đảm bảo modal có thể được đóng bằng cách nhấn vào bất kỳ đâu bên ngoài modal
    window.onclick = function(event) {
        var modal = document.getElementById('scheduleModal');
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    }
</script>

<section class="services">
    <h2>Dịch vụ của chúng tôi</h2>
    <div class="service-item">
        <h3>Cắt tóc chuyên nghiệp</h3>
        <p>Đội ngũ chuyên gia với nhiều năm kinh nghiệm.</p>
    </div>
    <div class="service-item">
        <h3>Chăm sóc tóc</h3>
        <p>Sản phẩm chất lượng cao cho mái tóc khỏe mạnh.</p>
    </div>
</section>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>
