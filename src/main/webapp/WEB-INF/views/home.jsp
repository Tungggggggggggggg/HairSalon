<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSalon - Trang Chủ</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>

<body>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<section class="banner">
    <h1>Chào mừng đến với JSalon</h1>
    <p>Tìm kiếm, đặt lịch và trải nghiệm dịch vụ chăm sóc tóc dễ dàng và thuận tiện.</p>
    
    <!-- Nút Đặt Lịch Ngay -->
    <button id="openBookingModal" onclick="showScheduleModal()">Đặt Lịch Ngay</button>
</section>

<!-- Modal Đặt lịch -->
<div id="scheduleModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('scheduleModal')">&times;</span>
        <h2>Đặt Lịch</h2>
        <form action="/schedule" method="post">
            <label for="date">Chọn Ngày</label>
            <input type="date" id="date" name="date" required>
            <label for="time">Chọn Giờ</label>
            <input type="time" id="time" name="time" required>
            <label for="service">Dịch Vụ</label>
            <select id="service" name="service">
                <option value="haircut">Cắt Tóc</option>
                <option value="shave">Cạo Râu</option>
                <option value="color">Nhuộm Tóc</option>
            </select>
            <button type="submit">Đặt Lịch</button>
        </form>
    </div>
</div>

<!-- JavaScript cho Modal -->
<script>
    // Hàm hiển thị modal
    function showScheduleModal() {
        document.getElementById('scheduleModal').style.display = 'block';
    }

    // Hàm đóng modal
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
